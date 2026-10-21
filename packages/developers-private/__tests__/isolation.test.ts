import path from 'path';
import { getConnections, PgTestClient, seed } from 'pgsql-test';
import { count } from '../../developers/__tests__/helpers';

let pg: PgTestClient;
let teardown: () => Promise<void>;

const BOTH = "('developers', 'developers_private')";

const UNCOMMENTED = `
  SELECT 1 FROM pg_attribute a JOIN pg_class c ON c.oid = a.attrelid JOIN pg_namespace n ON n.oid = c.relnamespace
   WHERE n.nspname IN ${BOTH} AND c.relkind = 'r' AND a.attnum > 0 AND NOT a.attisdropped
     AND col_description(c.oid, a.attnum) IS NULL`;
const UNINDEXED_FKS = `
  WITH fks AS (
    SELECT con.conrelid, con.conkey FROM pg_constraint con JOIN pg_namespace n ON n.oid = con.connamespace
     WHERE con.contype = 'f' AND n.nspname IN ${BOTH})
  SELECT 1 FROM fks f WHERE NOT EXISTS (
    SELECT 1 FROM pg_index i WHERE i.indrelid = f.conrelid
       AND (i.indkey::int2[])[0:cardinality(f.conkey) - 1] @> f.conkey
       AND (i.indkey::int2[])[0:cardinality(f.conkey) - 1] <@ f.conkey)`;
const PUBLIC_VIEWS_ON_PRIVATE = `
  SELECT 1 FROM pg_depend d JOIN pg_rewrite r ON r.oid = d.objid JOIN pg_class v ON v.oid = r.ev_class
    JOIN pg_namespace vn ON vn.oid = v.relnamespace JOIN pg_class t ON t.oid = d.refobjid
    JOIN pg_namespace tn ON tn.oid = t.relnamespace
   WHERE vn.nspname = 'developers' AND tn.nspname = 'developers_private'`;
const EMAIL_COLUMNS = `SELECT 1 FROM information_schema.columns WHERE table_schema IN ${BOTH} AND column_name ILIKE '%email%'`;

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

it('C1 every table, view and column in both schemas has a comment', async () => {
  expect(await count(pg, `
    SELECT 1 FROM pg_attribute a JOIN pg_class c ON c.oid = a.attrelid JOIN pg_namespace n ON n.oid = c.relnamespace
     WHERE n.nspname IN ${BOTH} AND c.relkind = 'r' AND a.attnum > 0 AND NOT a.attisdropped
       AND col_description(c.oid, a.attnum) IS NULL`)).toBe(0);
  expect(await count(pg, `
    SELECT 1 FROM pg_class c JOIN pg_namespace n ON n.oid = c.relnamespace
     WHERE n.nspname IN ${BOTH} AND c.relkind IN ('r', 'v') AND obj_description(c.oid, 'pg_class') IS NULL`)).toBe(0);
});

it('C2 every foreign key in both schemas has a covering index', async () => {
  expect(await count(pg, `
    WITH fks AS (
      SELECT con.conrelid, con.conkey FROM pg_constraint con JOIN pg_namespace n ON n.oid = con.connamespace
       WHERE con.contype = 'f' AND n.nspname IN ${BOTH})
    SELECT 1 FROM fks f WHERE NOT EXISTS (
      SELECT 1 FROM pg_index i WHERE i.indrelid = f.conrelid
         AND (i.indkey::int2[])[0:cardinality(f.conkey) - 1] @> f.conkey
         AND (i.indkey::int2[])[0:cardinality(f.conkey) - 1] <@ f.conkey)`)).toBe(0);
});

it('C3 developers never depends on developers_private and no column stores email', async () => {
  expect(await count(pg, `
    SELECT 1 FROM pg_depend d JOIN pg_rewrite r ON r.oid = d.objid JOIN pg_class v ON v.oid = r.ev_class
      JOIN pg_namespace vn ON vn.oid = v.relnamespace JOIN pg_class t ON t.oid = d.refobjid
      JOIN pg_namespace tn ON tn.oid = t.relnamespace
     WHERE vn.nspname = 'developers' AND tn.nspname = 'developers_private'`)).toBe(0);
  expect(await count(pg, `
    SELECT 1 FROM pg_depend d JOIN pg_proc p ON p.oid = d.objid JOIN pg_namespace pn ON pn.oid = p.pronamespace
      JOIN pg_class t ON t.oid = d.refobjid JOIN pg_namespace tn ON tn.oid = t.relnamespace
     WHERE pn.nspname = 'developers' AND tn.nspname = 'developers_private'`)).toBe(0);
  expect(await count(pg, `SELECT 1 FROM information_schema.columns WHERE table_schema IN ${BOTH} AND column_name ILIKE '%email%'`)).toBe(0);
});

it('C1-C3 checks catch a violating object', async () => {
  await pg.query(`
    CREATE TABLE developers.check_probe (id uuid PRIMARY KEY, account_id uuid REFERENCES developers_private.account (id), email text);
    CREATE VIEW developers.check_probe_view AS SELECT login FROM developers_private.account;
  `);
  expect(await count(pg, UNCOMMENTED)).toBe(3);
  expect(await count(pg, UNINDEXED_FKS)).toBe(1);
  expect(await count(pg, PUBLIC_VIEWS_ON_PRIVATE)).toBeGreaterThan(0);
  expect(await count(pg, EMAIL_COLUMNS)).toBe(1);
});
