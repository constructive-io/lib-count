import path from 'path';
import { getConnections, PgTestClient, seed } from 'pgsql-test';
import { closeRun, count, observe, seedOurs, startRun } from './helpers';

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

it('our_package maps each category to its family', async () => {
  const res = await pg.query('SELECT name, family, categories FROM developers.our_package ORDER BY name');
  expect(res.rows).toEqual([
    { name: 'example-chain-sdk', family: 'chain', categories: ['telescope'] },
    { name: 'example-parser', family: 'cloud', categories: ['launchql'] }
  ]);
});

it('T8 hop-2 edges stay out of direct counts and feed transitive_reach', async () => {
  await closeRun(pg, await firstCrawl(), 'complete');
  const r8 = await startRun(pg, 'hop', 'npm-registry', ['example-app'], 2);
  await observe(pg, r8, 'example-app', 'example-downstream');
  await closeRun(pg, r8, 'complete');
  const reach = await pg.query('SELECT target_name, direct_dependents, hop2_dependents FROM developers.transitive_reach ORDER BY 1');
  const parser = reach.rows.find((r) => r.target_name === 'example-parser');
  expect(Number(parser.direct_dependents)).toBe(2);
  expect(Number(parser.hop2_dependents)).toBe(1);
  expect(await count(pg, "SELECT 1 FROM developers.current_dependents WHERE hop = 1 AND dependent_key = 'example-downstream'")).toBe(0);
  expect(await count(pg, 'SELECT 1 FROM developers.public_counts')).toBeGreaterThan(0);
  expect(await count(pg, "SELECT 1 FROM developers.adoption_by_week WHERE week_start = date_trunc('week', now())::date")).toBeGreaterThan(0);
});
