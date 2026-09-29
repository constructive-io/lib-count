import { Database } from "@cosmology/db-client";
import { PoolClient } from "pg";
import { NPMApiClient } from "../../npm-client";

// ---------------------------------------------------------------------------
// One-time repair: daily_downloads dates stored one day early.
//
// Until the fix in insertDailyDownloads, downloads were inserted with JS Date
// parameters. node-postgres serializes those in the machine's local timezone, so
// on a US machine npm's day (UTC midnight) arrived as the previous evening and
// ::date kept that earlier day: npm's 2026-08-02 was stored as 2026-08-01, for
// the whole history.
//
// This task checks the DB against npm before touching anything, so it is safe to
// run more than once (and after reloading an old dump):
//   - dates already match npm      -> nothing to do
//   - dates are one day behind npm -> shift every row forward one day
//   - neither                      -> abort without changing anything
// ---------------------------------------------------------------------------

const REFERENCE_PACKAGES = 3;
const SAMPLE_DAYS = 21;
const MATCH_THRESHOLD = 0.8;

type Alignment = "aligned" | "behind" | "unknown";

function isoDay(date: Date): string {
  return date.toISOString().split("T")[0];
}

function addDays(day: string, n: number): string {
  const d = new Date(`${day}T00:00:00Z`);
  d.setUTCDate(d.getUTCDate() + n);
  return isoDay(d);
}

function toDateNumbers(day: string): [number, number, number] {
  const [y, m, d] = day.split("-").map(Number);
  return [y, m, d];
}

async function detectAlignment(dbClient: PoolClient): Promise<Alignment> {
  const bounds = await dbClient.query(`
    SELECT to_char(MAX(date) - 7, 'YYYY-MM-DD') AS sample_end
    FROM npm_count.daily_downloads
  `);
  const sampleEnd: string | null = bounds.rows[0]?.sample_end;
  if (!sampleEnd) throw new Error("No download data in npm_count.daily_downloads");
  const sampleStart = addDays(sampleEnd, -(SAMPLE_DAYS - 1));

  // The busiest packages give the least ambiguous day-to-day values.
  const refs = await dbClient.query(
    `
    SELECT package_name
    FROM npm_count.daily_downloads
    WHERE date BETWEEN $1::date AND $2::date
    GROUP BY package_name
    ORDER BY SUM(download_count) DESC
    LIMIT ${REFERENCE_PACKAGES}
    `,
    [sampleStart, sampleEnd]
  );

  const npm = new NPMApiClient();
  let compared = 0;
  let aligned = 0;
  let behind = 0;

  for (const { package_name: packageName } of refs.rows) {
    const dbRows = await dbClient.query(
      `
      SELECT to_char(date, 'YYYY-MM-DD') AS day, download_count
      FROM npm_count.daily_downloads
      WHERE package_name = $1 AND date BETWEEN $2::date AND $3::date
      `,
      [packageName, sampleStart, sampleEnd]
    );
    const response = await npm.download({
      startDate: toDateNumbers(sampleStart),
      endDate: toDateNumbers(addDays(sampleEnd, 1)),
      packageName,
    });
    const npmByDay = new Map(
      (response.downloads ?? []).map((d) => [d.day, d.downloads])
    );

    for (const row of dbRows.rows) {
      const count = Number(row.download_count);
      if (count === 0) continue; // zeros match anything; they prove nothing
      compared++;
      if (npmByDay.get(row.day) === count) aligned++;
      if (npmByDay.get(addDays(row.day, 1)) === count) behind++;
    }
    console.log(
      `  ${packageName}: running totals ${aligned} aligned / ${behind} one-day-behind of ${compared} days`
    );
  }

  if (compared === 0) return "unknown";
  if (aligned / compared >= MATCH_THRESHOLD) return "aligned";
  if (behind / compared >= MATCH_THRESHOLD) return "behind";
  return "unknown";
}

async function shiftForwardOneDay(dbClient: PoolClient): Promise<void> {
  const before = await dbClient.query(
    `SELECT COUNT(*) AS n, SUM(download_count) AS total FROM npm_count.daily_downloads`
  );

  // Rewrite rather than UPDATE: the row id is derived from (package, date) by an
  // insert trigger, so re-inserting keeps ids consistent with the new dates, and a
  // bulk UPDATE of date would collide with the unique (package_name, date) key
  // part-way through.
  await dbClient.query(`
    CREATE TEMP TABLE shifted_downloads ON COMMIT DROP AS
    SELECT package_name, date + 1 AS date, download_count, created_at
    FROM npm_count.daily_downloads
  `);
  await dbClient.query(`DELETE FROM npm_count.daily_downloads`);
  await dbClient.query(`
    INSERT INTO npm_count.daily_downloads (package_name, date, download_count, created_at)
    SELECT package_name, date, download_count, created_at FROM shifted_downloads
  `);

  const after = await dbClient.query(
    `SELECT COUNT(*) AS n, SUM(download_count) AS total FROM npm_count.daily_downloads`
  );
  if (
    before.rows[0].n !== after.rows[0].n ||
    before.rows[0].total !== after.rows[0].total
  ) {
    throw new Error(
      `Row count or total changed during the shift (before ${JSON.stringify(before.rows[0])}, ` +
        `after ${JSON.stringify(after.rows[0])}); rolling back`
    );
  }
  console.log(
    `Shifted ${Number(after.rows[0].n).toLocaleString()} rows forward one day ` +
      `(lifetime total unchanged: ${Number(after.rows[0].total).toLocaleString()})`
  );
}

export async function fixDateOffset(options: { dryRun?: boolean } = {}): Promise<void> {
  const db = new Database();
  await db.withTransaction(async (dbClient: PoolClient) => {
    console.log("Comparing stored dates against npm...");
    const alignment = await detectAlignment(dbClient);

    if (alignment === "aligned") {
      console.log("Dates already match npm. Nothing to do.");
      return;
    }
    if (alignment === "unknown") {
      throw new Error(
        "Stored dates match neither npm's days nor npm's days shifted by one. Not changing anything."
      );
    }

    console.log("Stored dates are one day behind npm.");
    if (options.dryRun) {
      console.log("Dry run: not shifting.");
      return;
    }
    await shiftForwardOneDay(dbClient);
  });
}
