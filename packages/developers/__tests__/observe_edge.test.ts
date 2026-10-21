import path from 'path';
import { getConnections, PgTestClient, seed } from 'pgsql-test';
import { closeRun, count, observe, seedOurs, sqlError, startRun } from './helpers';

let pg: PgTestClient;
let teardown: () => Promise<void>;

const T0 = '2026-01-01T00:00:00Z';

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

it('T1 observe_edge is idempotent per run', async () => {
  await firstCrawl();
  expect(await count(pg, 'SELECT 1 FROM developers.dependency_edge')).toBe(2);
  expect(await count(pg, 'SELECT 1 FROM developers.edge_observation')).toBe(2);
});

it('T2 observe_edge rejects non-targets and closed runs', async () => {
  const r1 = await firstCrawl();
  expect(await sqlError(pg, "SELECT developers.observe_edge($1, 'not-a-target', 'x')", [r1])).toMatch(/not a target/);
  expect(await closeRun(pg, r1, 'complete')).toBe(0);
  expect(await sqlError(pg, "SELECT developers.observe_edge($1, 'example-parser', 'x')", [r1])).toMatch(/not running/);
});

it('T9 discovery and manual sources cannot start runs; a run needs a target', async () => {
  expect(await sqlError(pg, "SELECT developers.start_run('x', 'ecosystems', ARRAY['example-parser'])")).toMatch(/only verification and enrichment/);
  expect(await sqlError(pg, "SELECT developers.start_run('x', 'manual', ARRAY['example-parser'])")).toMatch(/only verification and enrichment/);
  expect(await sqlError(pg, "SELECT developers.start_run('x', 'npm-registry', ARRAY[]::text[])")).toMatch(/at least one target/);
});
