import path from 'path';
import { getConnections, PgTestClient, seed } from 'pgsql-test';
import { count } from './helpers';

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
});

afterEach(async () => {
  await pg.afterEach();
});

it('C1 every table, view and column in developers has a comment', async () => {
  expect(await count(pg, `
    SELECT 1 FROM pg_attribute a JOIN pg_class c ON c.oid = a.attrelid JOIN pg_namespace n ON n.oid = c.relnamespace
     WHERE n.nspname = 'developers' AND c.relkind = 'r' AND a.attnum > 0 AND NOT a.attisdropped
       AND col_description(c.oid, a.attnum) IS NULL`)).toBe(0);
  expect(await count(pg, `
    SELECT 1 FROM pg_class c JOIN pg_namespace n ON n.oid = c.relnamespace
     WHERE n.nspname = 'developers' AND c.relkind IN ('r', 'v') AND obj_description(c.oid, 'pg_class') IS NULL`)).toBe(0);
});

it('C2 every foreign key in developers has a covering index', async () => {
  expect(await count(pg, `
    WITH fks AS (
      SELECT con.conrelid, con.conkey FROM pg_constraint con JOIN pg_namespace n ON n.oid = con.connamespace
       WHERE con.contype = 'f' AND n.nspname = 'developers')
    SELECT 1 FROM fks f WHERE NOT EXISTS (
      SELECT 1 FROM pg_index i WHERE i.indrelid = f.conrelid
         AND (i.indkey::int2[])[0:cardinality(f.conkey) - 1] @> f.conkey
         AND (i.indkey::int2[])[0:cardinality(f.conkey) - 1] <@ f.conkey)`)).toBe(0);
});

it('C3 developers has no email columns', async () => {
  expect(await count(pg, "SELECT 1 FROM information_schema.columns WHERE table_schema = 'developers' AND column_name ILIKE '%email%'")).toBe(0);
});
