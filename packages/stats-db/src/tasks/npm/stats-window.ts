import { PoolClient } from "pg";
import { CategoryStats, DownloadStats, PackageStats } from "../../types";

// ---------------------------------------------------------------------------
// Weekly / monthly download windows: the single source of truth.
//
// This used to be computed three separate ways (README per-package, README
// aggregate, badges), each as `latest - 7` / `latest - 30` with both ends
// inclusive — so "weekly" was really 8 days and "monthly" 31. The badges used
// `NOW() - 7 days` instead, a different window again. Anything that reports a
// weekly or monthly figure should go through here.
//
// Windows end on the latest date in the DB and span exactly WEEK_DAYS and
// MONTH_DAYS days, matching npm's own `last-week` / `last-month` endpoints.
//
// npm outages: npm occasionally reports 0 for EVERY package on a day. Summed
// raw, those days drag the window down (five of them once cut the monthly
// figure by ~5M). A day where the whole DB totals 0 is treated as an outage:
// it is excluded, and each package's window sum is scaled up by
// covered days / (covered days - outage days). Covered days start at the
// package's first data day, so a package published mid-window is not inflated.
// ---------------------------------------------------------------------------

export const WEEK_DAYS = 7;
export const MONTH_DAYS = 30;

export interface StatsWindow {
  latestDate: string; // YYYY-MM-DD, inclusive
  weekStart: string; // inclusive
  monthStart: string; // inclusive
  outageDates: string[]; // all-zero days inside the monthly window
}

export async function getStatsWindow(
  dbClient: PoolClient
): Promise<StatsWindow | null> {
  // Dates are formatted in SQL so no JS Date / timezone conversion is involved.
  const bounds = await dbClient.query(`
    SELECT
      to_char(MAX(date), 'YYYY-MM-DD') AS latest,
      to_char(MAX(date) - ${WEEK_DAYS - 1}, 'YYYY-MM-DD') AS week_start,
      to_char(MAX(date) - ${MONTH_DAYS - 1}, 'YYYY-MM-DD') AS month_start
    FROM npm_count.daily_downloads
  `);
  const { latest, week_start, month_start } = bounds.rows[0] ?? {};
  if (!latest) return null;

  const outages = await dbClient.query(
    `
    SELECT to_char(day, 'YYYY-MM-DD') AS day
    FROM generate_series($1::date, $2::date, interval '1 day') AS day
    LEFT JOIN npm_count.daily_downloads d ON d.date = day::date
    GROUP BY day
    HAVING COALESCE(SUM(d.download_count), 0) = 0
    ORDER BY day
    `,
    [month_start, latest]
  );

  return {
    latestDate: latest,
    weekStart: week_start,
    monthStart: month_start,
    outageDates: outages.rows.map((r) => r.day),
  };
}

/**
 * Lifetime, weekly and monthly downloads for every active package that has
 * download data, keyed by package name, plus the DB-wide lifetime total.
 */
export async function getAllPackageStats(
  dbClient: PoolClient,
  window: StatsWindow
): Promise<{ packages: Map<string, PackageStats>; lifetimeTotal: number }> {
  const result = await dbClient.query(
    `
    WITH pkg AS (
      SELECT
        p.package_name,
        COALESCE(SUM(d.download_count), 0) AS total,
        COALESCE(SUM(d.download_count) FILTER (WHERE d.date >= $2::date AND d.date <= $1::date), 0) AS week_raw,
        COALESCE(SUM(d.download_count) FILTER (WHERE d.date >= $3::date AND d.date <= $1::date), 0) AS month_raw,
        MIN(d.date) AS first_date
      FROM npm_count.npm_package p
      LEFT JOIN npm_count.daily_downloads d ON d.package_name = p.package_name
      WHERE p.is_active = true
      GROUP BY p.package_name
    ),
    spans AS (
      SELECT
        pkg.*,
        GREATEST($2::date, first_date) AS week_from,
        GREATEST($3::date, first_date) AS month_from
      FROM pkg
    ),
    counted AS (
      SELECT
        s.*,
        ($1::date - week_from + 1) AS week_span,
        ($1::date - month_from + 1) AS month_span,
        (SELECT COUNT(*) FROM unnest($4::date[]) o WHERE o BETWEEN s.week_from AND $1::date) AS week_out,
        (SELECT COUNT(*) FROM unnest($4::date[]) o WHERE o BETWEEN s.month_from AND $1::date) AS month_out
      FROM spans s
    )
    SELECT
      package_name,
      first_date,
      total,
      CASE WHEN first_date IS NULL OR week_out = 0 OR week_span <= week_out THEN week_raw
           ELSE ROUND(week_raw * week_span::numeric / (week_span - week_out)) END AS weekly,
      CASE WHEN first_date IS NULL OR month_out = 0 OR month_span <= month_out THEN month_raw
           ELSE ROUND(month_raw * month_span::numeric / (month_span - month_out)) END AS monthly,
      (SELECT COALESCE(SUM(download_count), 0) FROM npm_count.daily_downloads) AS lifetime_total
    FROM counted
    `,
    [window.latestDate, window.weekStart, window.monthStart, window.outageDates]
  );

  const packages = new Map<string, PackageStats>();
  let lifetimeTotal = 0;
  for (const row of result.rows) {
    lifetimeTotal = parseInt(row.lifetime_total);
    if (row.first_date === null) continue; // no download rows yet
    packages.set(row.package_name, {
      name: row.package_name,
      total: parseInt(row.total),
      monthly: parseInt(row.monthly),
      weekly: parseInt(row.weekly),
    });
  }
  return { packages, lifetimeTotal };
}

/**
 * One-line README note describing the windows and any outage adjustment.
 * Deliberately date-free: stored dates currently run one day behind npm's.
 */
export function describeStatsWindow(window: StatsWindow): string {
  const base = `_Weekly and monthly are the last ${WEEK_DAYS} and ${MONTH_DAYS} days of npm data._`;
  const n = window.outageDates.length;
  if (n === 0) return base;
  return (
    `${base} _npm reported zero downloads for every package on ${n} of those ${MONTH_DAYS} days (an npm-side outage); ` +
    `those days are excluded and the totals scaled to the full period._`
  );
}

/** Sum a category's packages from the precomputed per-package stats. */
export function getCategoryStats(
  allPackages: Map<string, PackageStats>,
  packageNames: string[]
): CategoryStats {
  const packageStats: PackageStats[] = [];
  const totals: DownloadStats = { total: 0, monthly: 0, weekly: 0 };
  for (const packageName of packageNames) {
    const stats = allPackages.get(packageName);
    if (!stats) continue;
    packageStats.push(stats);
    totals.total += stats.total;
    totals.monthly += stats.monthly;
    totals.weekly += stats.weekly;
  }
  return {
    ...totals,
    packages: packageStats.sort((a, b) => b.total - a.total),
  };
}

/** Active packages not listed in any configured category, largest first. */
export function getUncategorizedPackages(
  allPackages: Map<string, PackageStats>,
  categories: Record<string, string[]>
): PackageStats[] {
  const categorized = new Set(Object.values(categories).flat());
  return [...allPackages.values()]
    .filter((pkg) => !categorized.has(pkg.name))
    .sort((a, b) => b.total - a.total);
}
