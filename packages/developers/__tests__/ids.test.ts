import path from 'path';
import { getConnections, PgTestClient, seed } from 'pgsql-test';
import { seedOurs } from './helpers';

let pg: PgTestClient;
let teardown: () => Promise<void>;

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

it('ids are deterministic', async () => {
  const res = await pg.query(`
    SELECT developers.package_id('npm', 'example-app') = developers.package_id('npm', 'example-app') AS pkg,
           developers.repository_id('github.com', 'Example-Org/Example-Repo') = developers.repository_id('github.com', 'example-org/example-repo') AS repo`);
  expect(res.rows[0]).toEqual({ pkg: true, repo: true });
});
