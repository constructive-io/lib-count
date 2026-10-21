import path from 'path';
import { getConnections, PgTestClient, seed } from 'pgsql-test';
import { closeRun, count, observe, seedOurs, startRun } from '../../developers/__tests__/helpers';

let pg: PgTestClient;
let teardown: () => Promise<void>;

const JDOE = "uuid_generate_v5(uuid_ns_url(), 'developers:account:github:jdoe')";

beforeAll(async () => {
  ({ pg, teardown } = await getConnections({}, [seed.pgpm(path.resolve(__dirname, '..'))]));
});

afterAll(async () => {
  await teardown();
});

beforeEach(async () => {
  await pg.beforeEach();
  await seedOurs(pg);
  const run = await startRun(pg, 'github-dependents', 'github-api', ['example-parser', 'example-chain-sdk']);
  await observe(pg, run, 'example-parser', 'example-org/example-repo', { manifestPath: 'apps/web/package.json', depType: 'prod', range: '^1' });
  await observe(pg, run, 'example-chain-sdk', 'example-org/example-repo', { manifestPath: 'pnpm-lock.yaml', depType: 'transitive' });
  await closeRun(pg, run, 'complete');
});

afterEach(async () => {
  await pg.afterEach();
});

it('T10 deterministic account ids feed company, champion and new-developer reports', async () => {
  await pg.query(`
    INSERT INTO developers_private.account (id, platform, login, kind, display_name, company_raw, source_id)
      VALUES (${JDOE}, 'github', 'JDoe', 'user', 'J. Doe', '@example-org', 'github-api');
    INSERT INTO developers_private.organization (name, domain, kind, source_id, confidence, evidence)
      VALUES ('Example Org', 'example.org', 'company', 'github-api', 'high', 'org-owned repo');
    INSERT INTO developers_private.repository_owner
      SELECT developers.repository_id('github.com', 'example-org/example-repo'), id, 'github-api', 'high', 'owner is the org'
        FROM developers_private.organization;
    INSERT INTO developers_private.edge_commit_event (edge_id, event, commit_sha, committed_on, author_account_id, author_name, message, source_id)
      SELECT edge_id, 'added', 'abc123', '2025-05-01', ${JDOE}, 'J. Doe', 'add parser', 'git-history'
        FROM developers.current_dependents
       WHERE dependent_key = 'example-org/example-repo' AND manifest_path LIKE '%package.json';
  `);
  const company = await pg.query('SELECT company, current_edges, repositories, packages FROM developers_private.developers_by_company');
  expect(company.rows).toHaveLength(1);
  expect(company.rows[0].company).toBe('Example Org');
  expect(Number(company.rows[0].current_edges)).toBe(2);
  const champions = await pg.query('SELECT target_name, dependent_key, author_login, company_raw FROM developers_private.champions');
  expect(champions.rows).toEqual([
    { target_name: 'example-parser', dependent_key: 'example-org/example-repo', author_login: 'JDoe', company_raw: '@example-org' }
  ]);
  expect(await count(pg, "SELECT 1 FROM developers_private.new_developers('2020-01-01')")).toBe(1);
  expect(await count(pg, 'SELECT 1 FROM developers_private.contributor_overlap')).toBeGreaterThanOrEqual(0);
});
