import { PgTestClient } from 'pgsql-test';

export const seedOurs = async (pg: PgTestClient): Promise<void> => {
  await pg.query(`
    INSERT INTO npm_count.npm_package (package_name, creation_date, last_publish_date)
      VALUES ('example-parser', '2020-01-01', '2026-01-01'), ('example-chain-sdk', '2021-01-01', '2026-01-01');
    INSERT INTO npm_count.category (name) VALUES ('launchql'), ('telescope');
    INSERT INTO npm_count.package_category (package_id, category_id)
      SELECT 'example-parser', id FROM npm_count.category WHERE name = 'launchql';
    INSERT INTO npm_count.package_category (package_id, category_id)
      SELECT 'example-chain-sdk', id FROM npm_count.category WHERE name = 'telescope';
    INSERT INTO npm_count.daily_downloads (package_name, date, download_count)
      VALUES ('example-parser', current_date - 1, 100);
    INSERT INTO developers.tracked_target (package_id, reason)
      SELECT developers.ensure_package(package_name), 'lib-count' FROM npm_count.npm_package;
  `);
};

export const startRun = async (
  pg: PgTestClient,
  task: string,
  source: string,
  targets: string[],
  hop = 1
): Promise<string> => {
  const res = await pg.query<{ id: string }>(
    'SELECT developers.start_run($1, $2, $3::text[], $4) AS id',
    [task, source, targets, hop]
  );
  return res.rows[0].id;
};

export const observe = async (
  pg: PgTestClient,
  runId: string,
  target: string,
  dependent: string,
  extra: { manifestPath?: string; depType?: string; range?: string; observedAt?: string } = {}
): Promise<string> => {
  const res = await pg.query<{ id: string }>(
    `SELECT developers.observe_edge($1, $2, $3, $4, $5, $6, NULL, COALESCE($7::timestamptz, now())) AS id`,
    [runId, target, dependent, extra.manifestPath ?? 'package.json', extra.depType ?? null, extra.range ?? null, extra.observedAt ?? null]
  );
  return res.rows[0].id;
};

export const closeRun = async (pg: PgTestClient, runId: string, status: string): Promise<number> => {
  const res = await pg.query<{ removed: number }>('SELECT developers.close_run($1, $2) AS removed', [runId, status]);
  return res.rows[0].removed;
};

export const count = async (pg: PgTestClient, sql: string, values: unknown[] = []): Promise<number> => {
  const res = await pg.query<{ n: string }>(`SELECT count(*) AS n FROM (${sql}) q`, values);
  return Number(res.rows[0].n);
};

// Runs `sql` inside a savepoint so the expected error does not abort the test transaction.
export const sqlError = async (pg: PgTestClient, sql: string, values: unknown[] = []): Promise<string> => {
  await pg.query('SAVEPOINT expect_error');
  try {
    await pg.query(sql, values);
  } catch (err) {
    await pg.query('ROLLBACK TO SAVEPOINT expect_error');
    return (err as Error).message;
  }
  await pg.query('RELEASE SAVEPOINT expect_error');
  throw new Error(`expected an error from: ${sql}`);
};
