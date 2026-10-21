import path from 'path';
import { getConnections, PgTestClient, seed } from 'pgsql-test';
import { closeRun, count, observe, seedOurs, sqlError, startRun } from './helpers';

let pg: PgTestClient;
let teardown: () => Promise<void>;

const T0 = '2026-01-01T00:00:00Z';
const removedEdges = 'SELECT 1 FROM developers.dependency_edge WHERE removed_at IS NOT NULL';

beforeAll(async () => {
  ({ pg, teardown } = await getConnections({}, [seed.pgpm(path.resolve(__dirname, '..'))]));
});

afterAll(async () => {
  await teardown();
});

beforeEach(async () => {
  await pg.beforeEach();
  await seedOurs(pg);
});

afterEach(async () => {
  await pg.afterEach();
});

const firstCrawl = async (): Promise<string> => {
  const r1 = await startRun(pg, 'npm-dependents', 'npm-registry', ['example-parser']);
  await observe(pg, r1, 'example-parser', 'example-app', { depType: 'prod', range: '^1.0.0', observedAt: T0 });
  await observe(pg, r1, 'example-parser', 'example-app', { depType: 'prod', range: '^1.0.0', observedAt: T0 });
  await observe(pg, r1, 'example-parser', 'example-lib', { depType: 'dev', observedAt: T0 });
  return r1;
};

it('T3 a partial run never removes edges', async () => {
  await closeRun(pg, await firstCrawl(), 'complete');
  const r2 = await startRun(pg, 'npm-dependents', 'npm-registry', ['example-parser']);
  await observe(pg, r2, 'example-parser', 'example-app');
  const res = await pg.query("SELECT developers.close_run($1, 'partial', NULL, 'ecosyste.ms 503') AS removed", [r2]);
  expect(res.rows[0].removed).toBe(0);
  expect(await count(pg, removedEdges)).toBe(0);
});

it('T4 a complete run removes exactly the edges it did not see', async () => {
  await closeRun(pg, await firstCrawl(), 'complete');
  const r3 = await startRun(pg, 'npm-dependents', 'npm-registry', ['example-parser']);
  await observe(pg, r3, 'example-parser', 'example-app');
  expect(await closeRun(pg, r3, 'complete')).toBe(1);
  const res = await pg.query(`
    SELECT dp.name, e.removed_at IS NOT NULL AS removed, e.removed_by_run_id = $1 AS by_run
      FROM developers.dependency_edge e JOIN developers.package dp ON dp.id = e.dependent_package_id ORDER BY 1`, [r3]);
  expect(res.rows).toEqual([
    { name: 'example-app', removed: false, by_run: null },
    { name: 'example-lib', removed: true, by_run: true }
  ]);
  expect(await count(pg, "SELECT 1 FROM developers.lost_dependents(now() - interval '1 minute')")).toBe(1);
});

it('T5 re-observing a removed edge clears removal and keeps first_seen_at', async () => {
  await closeRun(pg, await firstCrawl(), 'complete');
  const r3 = await startRun(pg, 'npm-dependents', 'npm-registry', ['example-parser']);
  await observe(pg, r3, 'example-parser', 'example-app');
  await closeRun(pg, r3, 'complete');
  const firstSeen = "SELECT e.first_seen_at FROM developers.dependency_edge e JOIN developers.package dp ON dp.id = e.dependent_package_id WHERE dp.name = 'example-lib'";
  const before = (await pg.query(firstSeen)).rows[0].first_seen_at;
  const r4 = await startRun(pg, 'npm-dependents', 'npm-registry', ['example-parser']);
  await observe(pg, r4, 'example-parser', 'example-lib');
  await observe(pg, r4, 'example-parser', 'example-app');
  await closeRun(pg, r4, 'complete');
  expect(await count(pg, removedEdges)).toBe(0);
  expect((await pg.query(firstSeen)).rows[0].first_seen_at).toEqual(before);
});

it('T6 package runs and repository runs are isolated', async () => {
  await closeRun(pg, await firstCrawl(), 'complete');
  const r5 = await startRun(pg, 'github-dependents', 'github-api', ['example-parser', 'example-chain-sdk']);
  await observe(pg, r5, 'example-parser', 'example-org/example-repo', { manifestPath: 'apps/web/package.json', depType: 'prod', range: '^1' });
  await observe(pg, r5, 'example-chain-sdk', 'example-org/example-repo', { manifestPath: 'pnpm-lock.yaml', depType: 'transitive' });
  expect(await closeRun(pg, r5, 'complete')).toBe(0);
  expect(await count(pg, 'SELECT 1 FROM developers.current_dependents')).toBe(4);
});

it('T7 a run started before a newer observation does not remove it', async () => {
  await closeRun(pg, await firstCrawl(), 'complete');
  const r6 = await startRun(pg, 'npm-dependents', 'npm-registry', ['example-parser']);
  const r7 = await startRun(pg, 'npm-dependents', 'npm-registry', ['example-parser']);
  await observe(pg, r7, 'example-parser', 'example-lib');
  await observe(pg, r7, 'example-parser', 'example-app');
  await closeRun(pg, r7, 'complete');
  await observe(pg, r6, 'example-parser', 'example-app');
  expect(await closeRun(pg, r6, 'complete')).toBe(0);
  expect(await count(pg, removedEdges)).toBe(0);
});

it('T11 enrichment runs own snapshots but never observe or remove edges', async () => {
  await closeRun(pg, await firstCrawl(), 'complete');
  const r9 = await startRun(pg, 'depsdev-counts', 'depsdev', ['example-parser']);
  await pg.query(`
    INSERT INTO developers.target_count_snapshot (package_id, source_id, observed_on, direct_count, indirect_count, run_id)
    VALUES (developers.package_id('npm', 'example-parser'), 'depsdev', current_date, 3, 40, $1)`, [r9]);
  expect(await sqlError(pg, "SELECT developers.observe_edge($1, 'example-parser', 'example-app')", [r9])).toMatch(/enrichment source/);
  expect((await pg.query("SELECT developers.close_run($1, 'complete', '{\"targets\":1}') AS removed", [r9])).rows[0].removed).toBe(0);
  expect(await count(pg, removedEdges)).toBe(0);
  expect((await pg.query('SELECT dependent_kind FROM developers.crawl_run WHERE id = $1', [r9])).rows[0].dependent_kind).toBeNull();
  const reach = await pg.query("SELECT depsdev_indirect_count FROM developers.transitive_reach WHERE target_name = 'example-parser'");
  expect(Number(reach.rows[0].depsdev_indirect_count)).toBe(40);
});
