-- Growth queries 03: individual packages. Leaders, fastest growers, concentration, breadth, cohorts,
-- same-store growth, new-package velocity and the parser family.
--
--   psql postgresql://postgres:password@localhost:5432/stats_dev -f docs/queries/growth/03-packages-cohorts.sql
--   psql ... -v as_of=YYYY-MM-DD -f docs/queries/growth/03-packages-cohorts.sql      # pin the "today" of the analysis
--
-- Read-only: it creates TEMP views and psql variables, nothing else. Runs in about 25 seconds.
--
-- How to read every number in this file:
--   * "per day" always means downloads per PUBLISHED day (sum / days npm published in the window), so periods
--     with missing days stay comparable. Section 0 prints the windows and their day counts.
--   * "a year earlier" is the same window shifted back 365 days.
--   * An "x" column is a multiple: 2.0 means doubled, 0.5 means halved. It is left empty when the base is too
--     small to mean anything (each query says what its floor is).
--   * scope 'all company' = cloud + chain + utils (personal projects are never included);
--     scope 'cloud only' = the Postgres/cloud product line (categories launchql, pgpm, cloud, kubernetesjs).
--   * Downloads are not users, and packages are not independent: most packages here are dependencies of one
--     another, so one install of a top-level package counts once for every package in its tree. Sections 4 and 5
--     measure how much that matters. Never add packages up and call it "installs".
--   * creation_date is the day the package NAME was first published to npm. A re-scoped package
--     (@launchql/x -> @constructive-io/x or @pgpmjs/x) shows up as a new package; see queries 6.4 and 6.5.

\ir 00-setup.sql
\set QUIET on

-- ---------------------------------------------------------------------------------------------------------
-- Shared helpers for this file
-- ---------------------------------------------------------------------------------------------------------

-- Published-day counts of the standard windows, as psql variables (:d30, :d90, ...).
select count(*) filter (where published and date > :'as_of'::date - 30)                                      as d30,
       count(*) filter (where published and date > :'as_of'::date - 90)                                      as d90,
       count(*) filter (where published and date > :'as_of'::date - 365)                                     as d365,
       count(*) filter (where published and date > :'as_of'::date - 455 and date <= :'as_of'::date - 365)    as d90_ly,
       count(*) filter (where published and date > :'as_of'::date - 730 and date <= :'as_of'::date - 365)    as d365_prev
from g_calendar \gset

-- Company packages with their creation cohort: calendar year, split into halves for this year and last year.
create or replace temp view p_pkg as
select package_name, category, rollup, creation_date,
       to_char(creation_date, 'YYYY')
         || case when creation_date < date_trunc('year', :'as_of'::date) - interval '1 year' then ''
                 when extract(month from creation_date) <= 6 then ' H1' else ' H2' end            as cohort,
       extract(year from creation_date)::int * 10
         + case when creation_date < date_trunc('year', :'as_of'::date) - interval '1 year' then 0
                when extract(month from creation_date) <= 6 then 1 else 2 end                     as cohort_order
from g_pkg
where rollup <> 'personal';

-- One row per package: downloads in each standard window, and the same per published day (r*).
-- Packages with no downloads at all are kept (zeros).
create or replace temp view p_stats as
select s.*,
       s.n30::numeric       / :d30       as r30,
       s.n90::numeric       / :d90       as r90,
       s.n365::numeric      / :d365      as r365,
       s.n90_ly::numeric    / :d90_ly    as r90_ly,
       s.n365_prev::numeric / :d365_prev as r365_prev
from (
  select k.package_name, k.category, k.rollup, k.creation_date, k.cohort,
         coalesce(sum(d.n), 0)                                                                            as lifetime,
         coalesce(sum(d.n) filter (where d.date > :'as_of'::date - 30), 0)                                as n30,
         coalesce(sum(d.n) filter (where d.date > :'as_of'::date - 90), 0)                                as n90,
         coalesce(sum(d.n) filter (where d.date > :'as_of'::date - 365), 0)                               as n365,
         coalesce(sum(d.n) filter (where d.date > :'as_of'::date - 455
                                     and d.date <= :'as_of'::date - 365), 0)                              as n90_ly,
         coalesce(sum(d.n) filter (where d.date > :'as_of'::date - 730
                                     and d.date <= :'as_of'::date - 365), 0)                              as n365_prev
  from p_pkg k
  left join g_daily d on d.package_name = k.package_name
  group by 1, 2, 3, 4, 5
) s;

-- Calendar quarters and months with published-day counts. complete = every calendar day of the period is
-- inside the data range (so the first quarter and the one containing :as_of are not complete).
create or replace temp view p_quarters as
select q::date as quarter, to_char(q, 'YYYY "Q"Q') as label,
       count(*) filter (where published) as days, count(*) as calendar_days,
       count(*) = (q + interval '3 months')::date - q::date as complete
from (select date_trunc('quarter', date) as q, published from g_calendar) c
group by q;

create or replace temp view p_months as
select m::date as month, to_char(m, 'YYYY-MM') as label,
       count(*) filter (where published) as days, count(*) as calendar_days,
       count(*) = (m + interval '1 month')::date - m::date as complete
from (select date_trunc('month', date) as m, published from g_calendar) c
group by m;

-- Latest complete quarter (q1) and the one before it (q0), as psql variables.
select max(quarter) as q1, (max(quarter) - interval '3 months')::date as q0 from p_quarters where complete \gset
select max(label) filter (where quarter = :'q1'::date) as q1_label, max(days) filter (where quarter = :'q1'::date) as q1_days,
       max(label) filter (where quarter = :'q0'::date) as q0_label, max(days) filter (where quarter = :'q0'::date) as q0_days
from p_quarters \gset

-- Scopes: join on rollup to get every analysis twice, for the whole company and for cloud only.
create or replace temp view p_scopes as
select * from (values ('all company', 'cloud'), ('all company', 'chain'), ('all company', 'utils'),
                      ('cloud only',  'cloud')) v(scope, rollup);

-- The Postgres parser family (section 9). role: flagship = the libraries people install by name;
-- family = the rest of the parser packages; dependency = generic packages that the parser tree pulls in
-- (their curves are the parser's curve, whatever rollup they are filed under).
create or replace temp view p_parser as
select package_name,
       case when package_name in ('libpg-query', '@libpg-query/parser', 'pgsql-parser', 'pgsql-deparser',
                                  'pg-proto-parser', 'plpgsql-parser', 'plpgsql-deparser') then 'flagship'
            when package_name in ('@launchql/protobufjs', 'nested-obj', 'strfy-js')          then 'dependency'
            else 'family' end as role
from p_pkg
where package_name in ('libpg-query', 'pgsql-parser', 'pgsql-deparser', 'pgsql-enums', 'pgsql-types', 'pgsql-parse',
                       'pg-proto-parser', 'plpgsql-parser', 'plpgsql-deparser', 'plpgsql-parse', 'pg-ast',
                       'pg-query-context', '@launchql/protobufjs', 'nested-obj', 'strfy-js')
   or package_name like '@pgsql/%'
   or package_name like '@libpg-query/%';

\set QUIET off


-- =========================================================================================================
-- 0. Windows and sanity
-- =========================================================================================================

\echo
\echo === 0.1 Windows used in this file (published days = days npm actually reported) ===
-- Every per-day figure below divides by "published_days" of its window. If published_days is well below
-- calendar_days, raw totals for that window are floors.
select * from (values
  ('trailing 30 days',             :'as_of'::date - 29,  :'as_of'::date,       :d30,          30),
  ('trailing 90 days',             :'as_of'::date - 89,  :'as_of'::date,       :d90,          90),
  ('trailing 365 days',            :'as_of'::date - 364, :'as_of'::date,       :d365,        365),
  ('90 days, a year earlier',      :'as_of'::date - 454, :'as_of'::date - 365, :d90_ly,       90),
  ('prior 365 days',               :'as_of'::date - 729, :'as_of'::date - 365, :d365_prev,   365),
  ('latest complete quarter ' || :'q1_label', :'q1'::date, (:'q1'::date + interval '3 months' - interval '1 day')::date,
     :q1_days, ((:'q1'::date + interval '3 months')::date - :'q1'::date)),
  ('previous quarter ' || :'q0_label',        :'q0'::date, (:'q1'::date - 1), :q0_days, (:'q1'::date - :'q0'::date))
) w("window", from_date, to_date, published_days, calendar_days);

\echo
\echo === 0.2 Sanity: company all-time total and package counts by rollup ===
-- The grand total must match the company all-time number used everywhere else. "with_downloads" can be lower
-- than "packages": a few registered packages have never recorded a download.
select coalesce(rollup, 'ALL COMPANY') as rollup, count(*) as packages,
       count(*) filter (where lifetime > 0) as with_downloads,
       sum(lifetime) as lifetime_downloads, sum(n365) as trailing_365, sum(n30) as trailing_30
from p_stats
group by rollup(rollup)
order by sum(lifetime) desc;


-- =========================================================================================================
-- 1. Leaders
-- =========================================================================================================

\echo
\echo === 1.1 Top 25 packages, all company, by trailing 30 days ===
-- Who carries the company today. pct_of_company = share of company trailing-30 downloads (shares overlap in
-- meaning: a dependency is downloaded whenever its parent is). yoy_x = trailing-90 per-day rate vs the same
-- 90 days a year earlier; empty if the package had under 10 downloads/day then (new or negligible).
select row_number() over (order by n30 desc) as "#", package_name, category, rollup, creation_date as created,
       lifetime, n365 as trailing_365, n90 as trailing_90, n30 as trailing_30,
       round(r30) as per_day_30,
       round(100 * n30 / sum(n30) over (), 1) as pct_of_company,
       case when r90_ly >= 10 then round(r90 / r90_ly, 1) end as yoy_x
from p_stats
order by n30 desc
limit 25;

\echo
\echo === 1.2 Top 25 cloud packages by trailing 30 days ===
-- Same board for the cloud rollup only. pct_of_cloud = share of cloud trailing-30 downloads.
select row_number() over (order by n30 desc) as "#", package_name, category, creation_date as created,
       lifetime, n365 as trailing_365, n90 as trailing_90, n30 as trailing_30,
       round(r30) as per_day_30,
       round(100 * n30 / sum(n30) over (), 1) as pct_of_cloud,
       case when r90_ly >= 10 then round(r90 / r90_ly, 1) end as yoy_x
from p_stats
where rollup = 'cloud'
order by n30 desc
limit 25;

\echo
\echo === 1.3 Top 25 packages by lifetime downloads, with their rank in recent windows ===
-- Is the all-time leaderboard still the current one? A package whose rank_30 is much worse than rank_life is
-- living on history; one whose rank_30 is much better is a recent riser.
select rank_life, package_name, rollup, creation_date as created, lifetime,
       round(100 * lifetime / total_life, 1) as pct_of_lifetime,
       rank_365, rank_30, n30 as trailing_30
from (
  select *, rank() over (order by lifetime desc) as rank_life,
            rank() over (order by n365 desc)     as rank_365,
            rank() over (order by n30 desc)      as rank_30,
            sum(lifetime) over ()                as total_life
  from p_stats
) r
order by rank_life
limit 25;


-- =========================================================================================================
-- 2. Fastest growers
-- =========================================================================================================

\echo
\echo === 2.1 Biggest absolute gainers, trailing 90 days vs the same 90 days a year earlier (top 25) ===
-- Ranked by gain in downloads per day, which cannot be gamed by a tiny base. year_ago = 0 with a creation
-- date inside the last ~15 months means the package is new, not that it grew from nothing.
-- x is shown only when the base was at least 10 downloads/day.
select package_name, rollup, creation_date as created,
       round(r90_ly) as per_day_year_ago, round(r90) as per_day_now, round(r90 - r90_ly) as gain_per_day,
       case when r90_ly >= 10 then round(r90 / r90_ly, 1) end as x,
       round(100 * (r90 - r90_ly) / sum(r90 - r90_ly) over (), 1) as pct_of_company_gain
from p_stats
order by r90 - r90_ly desc
limit 25;

\echo
\echo === 2.2 Biggest multiples, trailing 90 days vs a year earlier, base >= 100 downloads/day (top 25) ===
-- Floor: the package had to average at least 100 downloads per published day a year ago (about 9,000 in the
-- base window), so every row is an established library that multiplied, not a rounding error.
select package_name, rollup, creation_date as created,
       round(r90_ly) as per_day_year_ago, round(r90) as per_day_now,
       round(r90 / r90_ly, 1) as x, round(r90 - r90_ly) as gain_per_day
from p_stats
where r90_ly >= 100
order by r90 / r90_ly desc
limit 25;

\echo
\echo === 2.3 Biggest absolute gainers, latest complete quarter vs the previous quarter (top 25) ===
-- Quarter-over-quarter momentum, per published day in each quarter (day counts are in 0.1).
-- x is shown only when the previous-quarter base was at least 10 downloads/day.
with q as (
  select d.package_name, d.rollup,
         coalesce(sum(d.n) filter (where d.date >= :'q1'::date), 0)::numeric / :q1_days as r1,
         coalesce(sum(d.n) filter (where d.date <  :'q1'::date), 0)::numeric / :q0_days as r0
  from g_daily d
  where d.date >= :'q0'::date and d.date < (:'q1'::date + interval '3 months')
  group by 1, 2
)
select q.package_name, q.rollup, k.creation_date as created,
       round(r0) as per_day_prev_q, round(r1) as per_day_last_q, round(r1 - r0) as gain_per_day,
       case when r0 >= 10 then round(r1 / r0, 1) end as x,
       round(100 * (r1 - r0) / sum(r1 - r0) over (), 1) as pct_of_company_gain
from q join p_pkg k using (package_name)
order by r1 - r0 desc
limit 25;

\echo
\echo === 2.4 Biggest multiples, latest complete quarter vs the previous quarter, base >= 100 downloads/day (top 25) ===
-- Floor: at least 100 downloads per published day in the previous quarter.
with q as (
  select d.package_name, d.rollup,
         coalesce(sum(d.n) filter (where d.date >= :'q1'::date), 0)::numeric / :q1_days as r1,
         coalesce(sum(d.n) filter (where d.date <  :'q1'::date), 0)::numeric / :q0_days as r0
  from g_daily d
  where d.date >= :'q0'::date and d.date < (:'q1'::date + interval '3 months')
  group by 1, 2
)
select q.package_name, q.rollup, k.creation_date as created,
       round(r0) as per_day_prev_q, round(r1) as per_day_last_q,
       round(r1 / r0, 1) as x, round(r1 - r0) as gain_per_day
from q join p_pkg k using (package_name)
where r0 >= 100
order by r1 / r0 desc
limit 25;

\echo
\echo === 2.5 How many packages are growing? Trailing 90 days vs a year earlier, by rollup ===
-- Counts only packages with a real base or a real present (>= 10 downloads/day in either window).
-- "new" = created after the start of the year-earlier window. The rest are split by their multiple.
select coalesce(rollup, 'ALL COMPANY') as rollup,
       count(*) as packages,
       count(*) filter (where creation_date > :'as_of'::date - 455)                          as new,
       count(*) filter (where creation_date <= :'as_of'::date - 455 and r90 >= 2 * r90_ly)   as up_2x_or_more,
       count(*) filter (where creation_date <= :'as_of'::date - 455 and r90 >= 1.1 * r90_ly and r90 < 2 * r90_ly) as up_10pct_to_2x,
       count(*) filter (where creation_date <= :'as_of'::date - 455 and r90 > 0.9 * r90_ly and r90 < 1.1 * r90_ly) as flat,
       count(*) filter (where creation_date <= :'as_of'::date - 455 and r90 <= 0.9 * r90_ly) as down_10pct_or_more
from p_stats
where r90 >= 10 or r90_ly >= 10
group by rollup(rollup)
order by count(*) desc;

\echo
\echo === 2.6 Biggest decliners, trailing 90 days vs a year earlier (top 15) ===
-- The unflattering list: where downloads per day fell the most. Know it before someone else finds it.
select package_name, category, rollup,
       round(r90_ly) as per_day_year_ago, round(r90) as per_day_now, round(r90 - r90_ly) as change_per_day,
       round(r90 / nullif(r90_ly, 0), 2) as x
from p_stats
where r90_ly >= 10
order by r90 - r90_ly
limit 15;


-- =========================================================================================================
-- 3. Concentration
-- =========================================================================================================

\echo
\echo === 3.1 Share of downloads from the top 1 / 5 / 10 / 25 packages, by window ===
-- How dependent the totals are on a few packages. pkgs_for_50/80/90 = the smallest number of packages that
-- together reach that share of downloads. The top packages are re-ranked inside each window.
with w as (
  select s.scope, v.win, v.ord, p.package_name, v.n,
         row_number() over (partition by s.scope, v.win order by v.n desc, p.package_name) as rk,
         sum(v.n) over (partition by s.scope, v.win)                                       as total,
         sum(v.n) over (partition by s.scope, v.win order by v.n desc, p.package_name)     as running
  from p_stats p
  join p_scopes s using (rollup)
  cross join lateral (values (1, 'trailing 30 days', p.n30), (2, 'trailing 365 days', p.n365),
                             (3, 'lifetime', p.lifetime)) v(ord, win, n)
)
select scope, win as "window", total as downloads,
       max(package_name) filter (where rk = 1) as top_package,
       round(100 * sum(n) filter (where rk <= 1)  / total, 1) as top1_pct,
       round(100 * sum(n) filter (where rk <= 5)  / total, 1) as top5_pct,
       round(100 * sum(n) filter (where rk <= 10) / total, 1) as top10_pct,
       round(100 * sum(n) filter (where rk <= 25) / total, 1) as top25_pct,
       min(rk) filter (where running >= 0.5 * total) as pkgs_for_50,
       min(rk) filter (where running >= 0.8 * total) as pkgs_for_80,
       min(rk) filter (where running >= 0.9 * total) as pkgs_for_90
from w
group by scope, win, ord, total
order by scope, ord;

\echo
\echo === 3.2 Concentration by quarter: top-N share, complete quarters, last 5 years ===
-- Has the company become more or less dependent on its top packages? Packages are re-ranked each quarter.
-- per_day = scope total per published day, so the trend in size sits next to the trend in concentration.
with pq as (
  select s.scope, date_trunc('quarter', d.date)::date as quarter, d.package_name, sum(d.n) as n
  from g_daily d
  join p_scopes s using (rollup)
  where d.date >= date_trunc('quarter', :'as_of'::date) - interval '5 years'
  group by 1, 2, 3
), r as (
  select *, row_number() over (partition by scope, quarter order by n desc) as rk,
            sum(n) over (partition by scope, quarter) as total
  from pq
)
select r.scope, q.label as quarter, q.days, round(total / q.days) as per_day,
       max(r.package_name) filter (where rk = 1) as top_package,
       round(100 * sum(n) filter (where rk <= 1)  / total, 1) as top1_pct,
       round(100 * sum(n) filter (where rk <= 5)  / total, 1) as top5_pct,
       round(100 * sum(n) filter (where rk <= 10) / total, 1) as top10_pct,
       round(100 * sum(n) filter (where rk <= 25) / total, 1) as top25_pct,
       count(*) filter (where n >= 0.01 * total) as pkgs_over_1pct
from r
join p_quarters q using (quarter)
where q.complete
group by r.scope, r.quarter, q.label, q.days, total
order by r.scope, r.quarter;

\echo
\echo === 3.3 Is growth one package or broad? YoY growth with the top packages removed ===
-- Trailing 90 days vs the same 90 days a year earlier, per published day. "top N" = the N largest packages
-- of the scope in the CURRENT window; they are removed from both periods. "parser tree" = every package in
-- p_parser (the parser family plus the generic packages it pulls in). If x stays high as packages are
-- removed, growth is broad; if it collapses, it is those packages.
with r as (
  select s.scope, p.package_name, p.r90, p.r90_ly,
         row_number() over (partition by s.scope order by p.r90 desc) as rk,
         exists (select 1 from p_parser f where f.package_name = p.package_name) as in_parser
  from p_stats p
  join p_scopes s using (rollup)
)
select r.scope, c.cut as packages_included, count(*) as packages,
       round(sum(r90_ly)) as per_day_year_ago, round(sum(r90)) as per_day_now,
       round(sum(r90) - sum(r90_ly)) as gain_per_day,
       round(sum(r90) / nullif(sum(r90_ly), 0), 1) as x
from r
join lateral (values (1, 'all packages',               true),
                     (2, 'excluding top 1',            rk > 1),
                     (3, 'excluding top 5',            rk > 5),
                     (4, 'excluding top 10',           rk > 10),
                     (5, 'excluding top 25',           rk > 25),
                     (6, 'excluding the parser tree',  not in_parser),
                     (7, 'the parser tree alone',      in_parser)) c(ord, cut, keep) on c.keep
group by r.scope, c.ord, c.cut
order by r.scope, c.ord;


-- =========================================================================================================
-- 4. Breadth
-- =========================================================================================================

\echo
\echo === 4.1 Packages above 1k / 10k / 100k / 1M downloads a month, by month (last 36 complete months) ===
-- The "how many real libraries" curve. A month's downloads are scaled to 30 published days (sum / published
-- days * 30), so short months and months with missing days are comparable. all_* = all company,
-- cloud_* = cloud only. Read with 4.2: many of these packages are installed together, not independently.
with pm as (
  select date_trunc('month', d.date)::date as month, d.package_name, d.rollup, sum(d.n) as n
  from g_daily d
  where d.date >= date_trunc('month', :'as_of'::date) - interval '36 months'
  group by 1, 2, 3
), x as (
  select m.month, m.label, m.days, pm.rollup, pm.n * 30.0 / m.days as n30e
  from pm join p_months m using (month)
  where m.complete
)
select label as month, days,
       count(*) filter (where n30e >= 1e3)                      as all_1k,
       count(*) filter (where n30e >= 1e4)                      as all_10k,
       count(*) filter (where n30e >= 1e5)                      as all_100k,
       count(*) filter (where n30e >= 1e6)                      as all_1m,
       count(*) filter (where n30e >= 1e3 and rollup = 'cloud') as cloud_1k,
       count(*) filter (where n30e >= 1e4 and rollup = 'cloud') as cloud_10k,
       count(*) filter (where n30e >= 1e5 and rollup = 'cloud') as cloud_100k,
       count(*) filter (where n30e >= 1e6 and rollup = 'cloud') as cloud_1m
from x
group by month, label, days
order by month;

-- Packages with >= 10k downloads in the trailing 30 days (raw, so a floor), grouped into "twins": packages
-- whose DAILY downloads are within a tolerance of each other on average (mean of |a-b| / max(a,b) over the
-- window), chained transitively. Twins are installed together (same dependency tree / same monorepo
-- release), so a group is one adoption curve counted several times. Two tolerances are kept:
--   strict (5%)  - near-identical series; a lower bound on double counting
--   loose  (15%) - same shape, slightly different level (packages that share most but not all dependents)
-- Used by 4.2 and 4.3.
\set QUIET on
create or replace temp view p_twins as
with recursive big as materialized (
  select package_name, rollup, n30 from p_stats where n30 >= 10000
), series as materialized (
  select d.package_name, d.date, d.n
  from g_daily d join big using (package_name)
  where d.date > :'as_of'::date - 30
), pairs as materialized (
  select a.package_name as a, b.package_name as b,
         avg(abs(a.n - b.n)::numeric / nullif(greatest(a.n, b.n), 0)) as gap
  from series a
  join series b on b.date = a.date and b.package_name <> a.package_name
  group by 1, 2
  having avg(abs(a.n - b.n)::numeric / nullif(greatest(a.n, b.n), 0)) <= 0.15
), tol(tolerance, max_gap) as (
  values ('strict (5%)', 0.05), ('loose (15%)', 0.15)
), reach(tolerance, node, member) as (
  select t.tolerance, b.package_name, b.package_name from big b cross join tol t
  union
  select r.tolerance, r.node, p.b
  from reach r
  join tol t on t.tolerance = r.tolerance
  join pairs p on p.a = r.member and p.gap <= t.max_gap
), grp as (
  select tolerance, node as package_name, min(member) as group_id, count(*) as group_size
  from reach group by tolerance, node
)
select g.tolerance, g.group_id, g.group_size, b.package_name, b.rollup, b.n30
from grp g join big b using (package_name);
\set QUIET off

\echo
\echo === 4.2 Monorepo check: how many of the packages over 10k/month are independent curves? ===
-- distinct_curves = twin groups + packages with no twin: the honest count of separately-adopted libraries
-- above 10k downloads in the trailing 30 days, at each tolerance. pct_downloads_in_groups = share of these
-- packages' downloads that sits in groups of two or more (the same installs counted more than once).
select tolerance, scope,
       count(*)                                               as packages_over_10k,
       count(*) filter (where group_size > 1)                 as packages_with_a_twin,
       count(distinct group_id)                               as distinct_curves,
       count(distinct group_id) filter (where group_size > 1) as twin_groups,
       max(group_size)                                        as largest_group,
       round(100 * coalesce(sum(n30) filter (where group_size > 1), 0) / sum(n30), 1) as pct_downloads_in_groups
from (
  select t.tolerance, s.scope, t.package_name, t.n30,
         min(t.package_name) over (partition by t.tolerance, s.scope, t.group_id) as group_id,
         count(*) over (partition by t.tolerance, s.scope, t.group_id)            as group_size
  from p_twins t join p_scopes s using (rollup)
) x
group by tolerance, scope
order by tolerance desc, scope;

\echo
\echo === 4.3 The twin groups at the strict tolerance (packages whose daily downloads move as one), largest first ===
-- Each row is one strict group from 4.2: its size, the range of trailing-30 downloads inside it, and its
-- members. A group is a set of packages that are always installed together; count it as one library.
select count(*) as packages,
       min(n30) as lowest_30, max(n30) as highest_30,
       count(*) filter (where rollup = 'cloud') as cloud,
       count(*) filter (where rollup = 'chain') as chain,
       count(*) filter (where rollup = 'utils') as utils,
       left(string_agg(package_name, ', ' order by n30 desc), 150) as members_largest_first
from p_twins
where tolerance like 'strict%' and group_size > 1
group by group_id
order by count(*) desc, max(n30) desc
limit 20;


-- =========================================================================================================
-- 5. Weekday profile of the leaders
-- =========================================================================================================

\echo
\echo === 5.1 Weekend vs weekday downloads, top 15 packages, trailing 30 days ===
-- weekend_ratio = average Saturday/Sunday downloads / average Monday-Friday downloads. Libraries installed
-- by developers at work sit around 0.3-0.5; the closer to 1.0, the more of the volume comes from automated
-- installs (CI, bots, mirrors) that run every day. Compare the ratio a year earlier to see if the mix changed.
select d.package_name, d.rollup,
       round(avg(d.n) filter (where d.date > :'as_of'::date - 30 and extract(isodow from d.date) <  6)) as weekday_per_day,
       round(avg(d.n) filter (where d.date > :'as_of'::date - 30 and extract(isodow from d.date) >= 6)) as weekend_per_day,
       round(avg(d.n) filter (where d.date > :'as_of'::date - 30 and extract(isodow from d.date) >= 6)
           / nullif(avg(d.n) filter (where d.date > :'as_of'::date - 30 and extract(isodow from d.date) < 6), 0), 2) as weekend_ratio,
       round(avg(d.n) filter (where d.date <= :'as_of'::date - 365 and extract(isodow from d.date) >= 6)
           / nullif(avg(d.n) filter (where d.date <= :'as_of'::date - 365 and extract(isodow from d.date) < 6), 0), 2) as weekend_ratio_year_ago
from g_daily d
join g_days gd using (date)
where (d.date > :'as_of'::date - 30 or (d.date > :'as_of'::date - 395 and d.date <= :'as_of'::date - 365))
group by d.package_name, d.rollup
order by sum(d.n) filter (where d.date > :'as_of'::date - 30) desc nulls last
limit 15;


-- =========================================================================================================
-- 6. Cohorts by package creation date
-- =========================================================================================================

\echo
\echo === 6.1 Cohort layers, all company: downloads per day by package creation cohort, per complete quarter ===
-- The layered "cohort revenue" view. Columns are the year (half-year for this year and last) the package
-- was first published; cells are downloads per published day in that quarter. Read down a column to see a
-- cohort age; read across a row to see which vintages carry the quarter. A young cohort is not always new
-- adoption: a package added as a dependency of an existing library inherits its installs from day one.
select q.label as quarter, coalesce(k.cohort, 'TOTAL') as cohort,
       round(sum(d.n)::numeric / q.days) as per_day,
       coalesce(k.cohort_order, 999999) as cohort_order
from g_daily d
join p_pkg k using (package_name)
join p_quarters q on q.quarter = date_trunc('quarter', d.date)::date
where q.complete
group by grouping sets ((q.quarter, q.label, q.days, k.cohort, k.cohort_order), (q.quarter, q.label, q.days))
order by q.quarter, cohort_order
\crosstabview quarter cohort per_day cohort_order

\echo
\echo === 6.2 Cohort layers, cloud only ===
-- Same as 6.1 for the cloud rollup.
select q.label as quarter, coalesce(k.cohort, 'TOTAL') as cohort,
       round(sum(d.n)::numeric / q.days) as per_day,
       coalesce(k.cohort_order, 999999) as cohort_order
from g_daily d
join p_pkg k using (package_name)
join p_quarters q on q.quarter = date_trunc('quarter', d.date)::date
where q.complete and k.rollup = 'cloud'
group by grouping sets ((q.quarter, q.label, q.days, k.cohort, k.cohort_order), (q.quarter, q.label, q.days))
order by q.quarter, cohort_order
\crosstabview quarter cohort per_day cohort_order

\echo
\echo === 6.3 Where do recent downloads come from, by package age? ===
-- Share of trailing-365 and trailing-30 downloads from packages created in the last 12 months, 12-24 months
-- ago, and earlier. A high "new" share means the portfolio is being renewed; read it with 6.4 and 7.1,
-- because a new package can be a renamed old one or a new dependency of an old one.
select s.scope,
       case when p.creation_date > :'as_of'::date - 365 then '1. created in the last 12 months'
            when p.creation_date > :'as_of'::date - 730 then '2. created 12-24 months ago'
            else '3. older than 24 months' end as package_age,
       count(*) as packages,
       sum(p.n365) as trailing_365,
       round(100 * sum(p.n365) / sum(sum(p.n365)) over (partition by s.scope), 1) as pct_of_365,
       sum(p.n30) as trailing_30,
       round(100 * sum(p.n30) / sum(sum(p.n30)) over (partition by s.scope), 1)   as pct_of_30
from p_stats p
join p_scopes s using (rollup)
group by 1, 2
order by 1, 2;

-- Possible renames: a package under 24 months old that shares its name, minus the npm scope, with an older
-- package in the same rollup (@launchql/env -> @pgpmjs/env). likely_rename = the older name is now
-- abandoned (under 1,000 downloads in the trailing 30 days and under 5% of the new package's); otherwise
-- the two are probably different libraries that share a word (@pgsql/types vs @pgpmjs/types).
-- Heuristic: it cannot see renames that changed the name itself. Used by 6.4 and 6.5.
\set QUIET on
create or replace temp view p_renames as
with base as (
  select p.*, regexp_replace(p.package_name, '^@[^/]+/', '') as bare from p_stats p
)
select n.rollup, n.package_name, n.creation_date, n.n365, n.n30,
       o.package_name as older_package, o.creation_date as older_created,
       o.n365_prev as older_prior_365, o.n365 as older_trailing_365, o.n30 as older_trailing_30,
       (o.n30 < 1000 and o.n30 < 0.05 * n.n30) as likely_rename
from base n
join lateral (select * from base o
              where o.bare = n.bare and o.rollup = n.rollup and o.creation_date < n.creation_date
              order by o.lifetime desc limit 1) o on true
where n.creation_date > :'as_of'::date - 730;
\set QUIET off

\echo
\echo === 6.4 Renames: how much of the "new package" volume is old packages under a new name? ===
-- Of the packages created in the last 24 months: how many look like renames, how much they download now,
-- and how much their OLD names downloaded in the prior 365 days. If old_names_prior_365 is small next to
-- renamed_trailing_365, the renames moved almost no volume: the growth happened under the new names.
select p.rollup,
       count(*)                                                    as packages_under_24_months,
       sum(p.n365)                                                 as their_trailing_365,
       count(r.package_name) filter (where r.likely_rename)        as likely_renames,
       coalesce(sum(r.n365) filter (where r.likely_rename), 0)     as renamed_trailing_365,
       coalesce(sum(r.older_prior_365) filter (where r.likely_rename), 0)    as old_names_prior_365,
       coalesce(sum(r.older_trailing_365) filter (where r.likely_rename), 0) as old_names_trailing_365
from p_stats p
left join p_renames r using (package_name)
where p.creation_date > :'as_of'::date - 730
group by p.rollup
order by sum(p.n365) desc;

\echo
\echo === 6.5 The likely renames, largest first (top 25) ===
-- The pairs behind 6.4, so they can be eyeballed. new = the package under its current name.
select package_name as new_package, creation_date as created, n365 as trailing_365,
       older_package, older_created, older_prior_365, older_trailing_365, older_trailing_30
from p_renames
where likely_rename
order by n365 desc
limit 25;


-- =========================================================================================================
-- 7. Same-store growth
-- =========================================================================================================

\echo
\echo === 7.1 Same-store growth: packages that already existed vs packages added since ===
-- "existing" = packages created before the start of the year-earlier window, so they were live for all of
-- both periods; "added since" = everything newer. Rates are per published day. x for "existing" is the
-- same-store growth multiple (no x for "added since": those packages did not exist for the whole base
-- period); pct_of_gain splits the scope's total gain between the two groups.
-- Caveat: a renamed package counts as a decline in "existing" and a gain in "added since" (see 6.4), and a
-- new package that an existing package starts depending on lands in "added since".
with w as (
  select * from (values
    (1, 'trailing 90 days vs a year earlier', :'as_of'::date - 89,  :'as_of'::date - 454, :'as_of'::date - 365, :d90::numeric,  :d90_ly::numeric),
    (2, 'trailing 365 days vs prior 365',     :'as_of'::date - 364, :'as_of'::date - 729, :'as_of'::date - 365, :d365::numeric, :d365_prev::numeric)
  ) v(ord, win, cur_from, base_from, base_to, d_cur, d_base)
), g as (
  select ord, win, scope, grp, count(distinct package_name) as packages,
         coalesce(sum(n) filter (where date >= cur_from), 0) / d_cur                      as r_now,
         coalesce(sum(n) filter (where date between base_from and base_to), 0) / d_base   as r_then
  from (
    select w.*, s.scope, d.package_name, d.date, d.n,
           case when k.creation_date < w.base_from then 'existing' else 'added since' end as grp
    from g_daily d
    join p_pkg k using (package_name)
    join p_scopes s on s.rollup = k.rollup
    join w on d.date >= w.base_from
  ) t
  group by grouping sets ((ord, win, scope, d_cur, d_base, grp), (ord, win, scope, d_cur, d_base))
)
select win as "window", scope, coalesce(grp, 'TOTAL') as packages_group, packages,
       round(r_then) as per_day_then, round(r_now) as per_day_now, round(r_now - r_then) as gain_per_day,
       case when grp is distinct from 'added since' and r_then >= 100 then round(r_now / r_then, 1) end as x,
       round(100 * (r_now - r_then) / max(r_now - r_then) filter (where grp is null) over (partition by ord, scope), 1) as pct_of_gain
from g
order by ord, scope, grp is null, grp desc;


-- =========================================================================================================
-- 8. New-package velocity
-- =========================================================================================================

\echo
\echo === 8.1 Packages created per quarter, by rollup (last 5 years) ===
-- Shipping cadence. The quarter containing :as_of is partial and marked. packages_to_date = all company
-- packages ever registered up to that quarter. Bursts are usually a monorepo being published or re-scoped
-- in one go (see 6.4), not that many independent new products.
select to_char(q, 'YYYY "Q"Q') || case when q = date_trunc('quarter', :'as_of'::date) then ' (partial)' else '' end as quarter,
       cloud, chain, utils, all_company, packages_to_date
from (
  select date_trunc('quarter', creation_date) as q,
         count(*) filter (where rollup = 'cloud') as cloud,
         count(*) filter (where rollup = 'chain') as chain,
         count(*) filter (where rollup = 'utils') as utils,
         count(*) as all_company,
         sum(count(*)) over (order by date_trunc('quarter', creation_date)) as packages_to_date
  from p_pkg
  group by 1
) c
where q >= date_trunc('quarter', :'as_of'::date) - interval '5 years'
order by q;

\echo
\echo === 8.2 How fast do new packages ramp? Downloads in the first 30 / 90 days, by creation cohort ===
-- For each package: downloads in its first 30 and first 90 days on npm, scaled for unpublished days
-- (sum / published days * 30 or 90). Only packages old enough to have a full window are counted
-- (pkgs_30 / pkgs_90). Median = the typical new package; p90 = the strong ones. Rising medians mean new
-- packages launch into a bigger installed base (they are pulled in as dependencies from day one).
with cal as materialized (
  select date from g_calendar where published
), first as (
  select k.package_name, k.rollup, k.cohort, k.cohort_order, k.creation_date,
         (select count(*) from cal c where c.date >= k.creation_date and c.date < k.creation_date + 30) as d30,
         (select count(*) from cal c where c.date >= k.creation_date and c.date < k.creation_date + 90) as d90,
         coalesce(sum(d.n) filter (where d.date < k.creation_date + 30), 0) as n30,
         coalesce(sum(d.n), 0)                                              as n90
  from p_pkg k
  left join g_daily d on d.package_name = k.package_name and d.date < k.creation_date + 90
  group by 1, 2, 3, 4, 5
)
select s.scope, f.cohort,
       count(*) filter (where creation_date + 29 <= :'as_of'::date) as pkgs_30,
       round(percentile_cont(0.5) within group (order by n30 * 30.0 / nullif(d30, 0))
               filter (where creation_date + 29 <= :'as_of'::date)) as median_first_30,
       round(percentile_cont(0.9) within group (order by n30 * 30.0 / nullif(d30, 0))
               filter (where creation_date + 29 <= :'as_of'::date)) as p90_first_30,
       count(*) filter (where creation_date + 89 <= :'as_of'::date) as pkgs_90,
       round(percentile_cont(0.5) within group (order by n90 * 90.0 / nullif(d90, 0))
               filter (where creation_date + 89 <= :'as_of'::date)) as median_first_90,
       round(percentile_cont(0.9) within group (order by n90 * 90.0 / nullif(d90, 0))
               filter (where creation_date + 89 <= :'as_of'::date)) as p90_first_90
from first f
join p_scopes s using (rollup)
group by s.scope, f.cohort, f.cohort_order
order by s.scope, f.cohort_order;


-- =========================================================================================================
-- 9. Parser family spotlight
-- =========================================================================================================

\echo
\echo === 9.1 Parser family members: size, growth and weight (members with >= 1,000 downloads in trailing 30 days) ===
-- The Postgres parser stack: libpg-query, pgsql-parser, pgsql-deparser, pg-proto-parser, the plpgsql pair,
-- the @pgsql/* and @libpg-query/* scopes, plus the generic packages they pull in (role = dependency).
-- yoy_x = trailing 90 days vs a year earlier (base >= 10/day). These packages depend on each other, so do
-- not add the rows up: the largest member is the best floor for "installs of the stack".
select f.role, p.package_name, p.creation_date as created, p.lifetime,
       p.n30 as trailing_30, round(p.r30) as per_day_30,
       round(p.r90_ly) as per_day_90_year_ago, round(p.r90) as per_day_90_now,
       case when p.r90_ly >= 10 then round(p.r90 / p.r90_ly, 1) end as yoy_x,
       round(100 * p.n30 / (select sum(n30) from p_stats), 1) as pct_of_company_30
from p_parser f
join p_stats p using (package_name)
where p.n30 >= 1000
order by p.n30 desc;

\echo
\echo === 9.2 Parser flagships: downloads per day by month (last 24 complete months plus the partial current month) ===
-- Monthly run-rate of each flagship, per published day. The month containing :as_of is partial and marked.
select m.label || case when m.complete then '' else ' (partial)' end as month, m.days,
       round(sum(d.n) filter (where d.package_name = 'libpg-query')         / m.days) as "libpg-query",
       round(sum(d.n) filter (where d.package_name = '@libpg-query/parser') / m.days) as "@libpg-query/parser",
       round(sum(d.n) filter (where d.package_name = 'pgsql-parser')        / m.days) as "pgsql-parser",
       round(sum(d.n) filter (where d.package_name = 'pgsql-deparser')      / m.days) as "pgsql-deparser",
       round(sum(d.n) filter (where d.package_name = '@pgsql/types')        / m.days) as "@pgsql/types",
       round(sum(d.n) filter (where d.package_name = 'pg-proto-parser')     / m.days) as "pg-proto-parser",
       round(sum(d.n) filter (where d.package_name = 'plpgsql-parser')      / m.days) as "plpgsql-parser"
from g_daily d
join p_parser f using (package_name)
join p_months m on m.month = date_trunc('month', d.date)::date
where m.month >= date_trunc('month', :'as_of'::date) - interval '24 months'
group by m.month, m.label, m.complete, m.days
order by m.month;

\echo
\echo === 9.3 Parser flagships: year-over-year by month (multiple of the same month a year earlier) ===
-- Same months as 9.2; each cell = per-day rate / per-day rate of the same month one year before.
-- Empty = the package had under 100 downloads/day in that month a year earlier (new or negligible).
with pm as (
  select date_trunc('month', d.date)::date as month, d.package_name, sum(d.n) as n
  from g_daily d join p_parser f using (package_name)
  where f.role = 'flagship' or d.package_name = '@pgsql/types'
  group by 1, 2
), r as (
  select pm.month, pm.package_name, pm.n::numeric / m.days as rate from pm join p_months m using (month)
), y as (
  select c.month, c.package_name, case when p.rate >= 100 then round(c.rate / p.rate, 1) end as x
  from r c left join r p on p.package_name = c.package_name and p.month = (c.month - interval '1 year')::date
)
select m.label || case when m.complete then '' else ' (partial)' end as month,
       max(x) filter (where package_name = 'libpg-query')         as "libpg-query",
       max(x) filter (where package_name = '@libpg-query/parser') as "@libpg-query/parser",
       max(x) filter (where package_name = 'pgsql-parser')        as "pgsql-parser",
       max(x) filter (where package_name = 'pgsql-deparser')      as "pgsql-deparser",
       max(x) filter (where package_name = '@pgsql/types')        as "@pgsql/types",
       max(x) filter (where package_name = 'pg-proto-parser')     as "pg-proto-parser",
       max(x) filter (where package_name = 'plpgsql-parser')      as "plpgsql-parser"
from y join p_months m using (month)
where m.month >= date_trunc('month', :'as_of'::date) - interval '24 months'
group by m.month, m.label, m.complete
order by m.month;

\echo
\echo === 9.4 How much of the company is the parser tree? Share of downloads by quarter (last 3 years, complete quarters) ===
-- parser_tree = every package in p_parser. Because its members install together, its share of package
-- downloads overstates its share of installs, but the trend is what matters: is the rest of the portfolio
-- (rest_per_day) growing on its own?
with pq as (
  select date_trunc('quarter', d.date)::date as quarter, d.package_name, d.rollup,
         (f.package_name is not null) as in_tree, sum(d.n) as n
  from g_daily d
  left join p_parser f using (package_name)
  where d.date >= date_trunc('quarter', :'as_of'::date) - interval '3 years'
  group by 1, 2, 3, 4
)
select q.label as quarter, q.days,
       round(sum(n) / q.days)                                                    as company_per_day,
       round(sum(n) filter (where in_tree) / q.days)                             as parser_tree_per_day,
       round(max(n) filter (where in_tree) / q.days)                             as largest_member_per_day,
       round(sum(n) filter (where not in_tree) / q.days)                         as rest_per_day,
       round(sum(n) filter (where not in_tree and rollup = 'cloud') / q.days)    as rest_of_cloud_per_day,
       round(100 * sum(n) filter (where in_tree) / sum(n), 1)                    as parser_tree_pct
from pq
join p_quarters q using (quarter)
where q.complete
group by q.quarter, q.label, q.days
order by q.quarter;
