-- Signal quality and robustness: is the download growth real, and does it survive the obvious objections?
--
--   psql postgresql://postgres:password@localhost:5432/stats_dev -f docs/queries/growth/04-quality-robustness.sql
--   psql ... -v as_of=YYYY-MM-DD -v spike_x=3 -f docs/queries/growth/04-quality-robustness.sql
--
-- Sections
--   A. Missing days        which days are absent or hollow, why, and how much the reported totals understate
--   B. Weekly rhythm       weekday vs weekend: developer/CI usage or flat machine traffic?
--   C. Spikes              one-off days, their drivers, and growth with spikes capped
--   D. Step changes        dates where the run-rate jumped and stayed, and which packages did it
--   E. Concentration       growth without the top packages / without the SQL parser family; parser vs platform
--   F. Co-installs         packages that are downloaded together, and what is left after de-duplicating
--   G. Breadth             the median package, and the long tail
--   H. Window choice       the YoY multiple for every window length and every recent month-end
--   I. Freshness           is the data complete and current?
--
-- Conventions
--   * scope 'company' = everything except personal projects; scope 'cloud' = rollup 'cloud' (the pitch story).
--   * "per day" always means per published day (rule 2 of 00-setup.sql). Multiples compare per-day figures.
--   * YoY for a window shorter than a year compares with the same window 364 days (52 weeks) earlier, so both
--     windows hold the same mix of weekdays. A 365-day window is compared with the 365 days before it.
--   * Tunables (override with -v): spike_x (default 2), step_x (1.5), step_min (1000/day), comove_min (100/day),
--     stale_min (50/day).
--   * Three kinds of bad day are told apart in section A:
--       npm outage  no row for any package (npm published nothing; the fetcher skips such days)
--       quiet day   rows exist, all zero, and the company really had no downloads (early years)
--       stale zero  a package shows 0 between weeks of real volume: the 0 was fetched before npm published the
--                   day and never refreshed. npm has the real number today, so these are repairable by a re-fetch.
--   * Read-only: TEMP views only. The whole file runs in well under a minute.

\ir 00-setup.sql

\set QUIET on
\if :{?spike_x}
\else
  \set spike_x 2
\endif
\if :{?step_x}
\else
  \set step_x 1.5
\endif
\if :{?step_min}
\else
  \set step_min 1000
\endif
\if :{?comove_min}
\else
  \set comove_min 100
\endif
\if :{?stale_min}
\else
  \set stale_min 50
\endif

-- ---------------------------------------------------------------------------------------------------------
-- Helper views (all TEMP, all prefixed q_)
-- ---------------------------------------------------------------------------------------------------------

-- Analysis dates derived from :as_of. q1 = latest complete quarter, q0 = the quarter before it.
create or replace temp view q_p as
select a                                                          as as_of,
       date_trunc('quarter', a + 1)::date                         as q_next,   -- first day after q1
       (date_trunc('quarter', a + 1) - interval '3 months')::date as q1_start,
       (date_trunc('quarter', a + 1) - interval '6 months')::date as q0_start
from (select :'as_of'::date as a) x;

-- Downloads per published day for the two scopes, long form.
create or replace temp view q_scope_day as
select v.scope, t.date, v.n
from (select date, sum(n) as company, coalesce(sum(n) filter (where rollup = 'cloud'), 0) as cloud
      from g_daily group by date having sum(n) > 0) t
cross join lateral (values ('company', t.company), ('cloud', t.cloud)) as v(scope, n);

-- Running totals over the full calendar, so any window is two lookups:
--   downloads in (d0, d1] = cum_n(d1) - cum_n(d0);  published days = cum_days(d1) - cum_days(d0).
create or replace temp view q_cum as
select s.scope, c.date,
       sum(coalesce(d.n, 0)) over w as cum_n,
       count(d.n) over w            as cum_days
from g_calendar c
cross join (values ('company'), ('cloud')) as s(scope)
left join q_scope_day d on d.scope = s.scope and d.date = c.date
window w as (partition by s.scope order by c.date);

-- The SQL parser stack: one dependency tree that is installed together.
--   part 'parser' = matched by name (libpg-query, pgsql-parser/-deparser, plpgsql-*, @pgsql/*, @libpg-query/*, ...)
--   part 'helper' = runtime dependencies of that tree that live in other categories. They were read off the
--                   co-moving groups in section F; re-check that list if the groups there change.
create or replace temp view q_family as
select package_name,
       case when package_name ~ '^(nested-obj|strfy-js|@launchql/protobufjs|lql-protobufjs)' then 'helper' else 'parser' end as part
from g_pkg
where package_name ~ ('^(@pgsql/|@libpg-query/|libpg-query|plpgsql-|pg-query-'
                      || '|pgsql-(parser|deparser|enums|types|parse|lint|codegen)$'
                      || '|pg-proto-parser$|pg-deparser$'
                      || '|@pyramation/(pgsql-parser|libpg-query|pg-query-)'
                      || '|@launchql/(ast-deparser|pg-query-context)$)')
   or package_name ~ '^(nested-obj|strfy-js|@launchql/protobufjs|lql-protobufjs)';

-- Every day g_calendar calls unpublished, with the reason. The raw table decides (any package, personal
-- included): if rows exist for the day, npm did publish it and the company simply had zero downloads.
create or replace temp view q_miss as
select c.date,
       case when exists (select 1 from npm_count.daily_downloads d where d.date = c.date)
            then 'quiet day' else 'npm outage' end as kind
from g_calendar c
where not c.published;

-- Estimated downloads on each outage day: the mean of the nearest published same weekday before and after
-- (looking up to 4 weeks each way; one side alone if the other is missing).
create or replace temp view q_outage_est as
select o.date, d.scope,
       (array_agg(d.n order by d.date desc) filter (where d.date < o.date))[1] as same_wd_before,
       (array_agg(d.n order by d.date)      filter (where d.date > o.date))[1] as same_wd_after,
       round(( coalesce((array_agg(d.n order by d.date desc) filter (where d.date < o.date))[1], 0)
             + coalesce((array_agg(d.n order by d.date)      filter (where d.date > o.date))[1], 0))::numeric
             / nullif(  (count(*) filter (where d.date < o.date) > 0)::int
                      + (count(*) filter (where d.date > o.date) > 0)::int, 0)) as est
from q_miss o
join q_scope_day d on d.date between o.date - 28 and o.date + 28 and (d.date - o.date) % 7 = 0
where o.kind = 'npm outage'
group by o.date, d.scope;

-- Stale zeros: a package has a stored 0 on a day, yet it had at least :stale_min downloads on at least two
-- of the three same weekdays before AND two of the three after. A package at that level does not really drop
-- to 0 for one day. est = mean of the before and after medians of those qualifying days.
-- The last week before :as_of cannot be judged (no "after" yet).
create or replace temp view q_stale as
with g as materialized (
  select date, package_name, rollup, n
  from (select d.date, d.package_name, d.rollup, d.n,
               max(d.n) over (partition by d.package_name) as peak
        from g_daily d) x
  where peak >= :stale_min),
z as (
  select a.date, a.package_name, a.rollup,
         percentile_cont(0.5) within group (order by b.n) filter (where b.date < a.date) as before,
         percentile_cont(0.5) within group (order by b.n) filter (where b.date > a.date) as after
  from g a
  cross join (values (-21), (-14), (-7), (7), (14), (21)) as o(off)
  join g b on b.package_name = a.package_name and b.date = a.date + o.off and b.n >= :stale_min
  where a.n = 0
  group by a.date, a.package_name, a.rollup
  having count(*) filter (where b.date < a.date) >= 2 and count(*) filter (where b.date > a.date) >= 2)
select date, package_name, rollup, round(((before + after) / 2)::numeric) as est
from z;

-- One row per calendar day and scope: what was measured, and the two estimated shortfalls.
create or replace temp view q_fix_day as
with st as materialized (
  select date, sum(est) as company, coalesce(sum(est) filter (where rollup = 'cloud'), 0) as cloud
  from q_stale group by date)
select s.scope, c.date, c.published,
       (o.date is not null)   as is_outage,
       coalesce(d.n, 0)       as measured,
       coalesce(o.est, 0)     as lost_outage,
       coalesce(case s.scope when 'company' then st.company else st.cloud end, 0) as lost_stale
from g_calendar c
cross join (values ('company'), ('cloud')) as s(scope)
left join q_scope_day d  on d.scope = s.scope and d.date = c.date
left join q_outage_est o on o.scope = s.scope and o.date = c.date
left join st on st.date = c.date;

-- Each day against the median of the 28 calendar days before it. A spike is a day above :spike_x times that
-- median; n_capped is the same series with spikes cut back to the threshold (winsorised).
create or replace temp view q_spike as
with s as materialized (select * from q_scope_day),
b as (
  select d.scope, d.date, d.n,
         percentile_cont(0.5) within group (order by p.n) as med28,
         count(p.n) as base_days
  from s d
  cross join generate_series(1, 28) as k
  left join s p on p.scope = d.scope and p.date = d.date - k
  group by d.scope, d.date, d.n)
select scope, date, n, round(med28::numeric) as med28, base_days,
       (base_days >= 14 and n > :spike_x * med28) as is_spike,
       case when base_days >= 14 and n > :spike_x * med28 then round((:spike_x * med28)::numeric) else n end as n_capped
from b;

-- Step changes: the 7-day average is at least :step_x times the average of the 28 days that ended a week
-- earlier, AND the following 28 days hold that level. Flagged days less than 15 days apart are one episode.
create or replace temp view q_step as
with cal as materialized (
  select s.scope, c.date, d.n
  from g_calendar c
  cross join (values ('company'), ('cloud')) as s(scope)
  left join q_scope_day d on d.scope = s.scope and d.date = c.date),
w as (
  select scope, date,
         avg(n)   over (partition by scope order by date rows between 6 preceding and current row)   as avg7,
         avg(n)   over (partition by scope order by date rows between 34 preceding and 7 preceding)  as base28,
         avg(n)   over (partition by scope order by date rows between 1 following and 28 following)  as next28,
         count(n) over (partition by scope order by date rows between 1 following and 28 following)  as next_days
  from cal),
f as (
  select *, (base28 >= :step_min and avg7 >= :step_x * base28
             and (next_days < 14 or next28 >= :step_x * base28)) as flag
  from w),
e as (
  select *, sum(starts::int) over (partition by scope order by date) as episode
  from (select *, flag and coalesce(date - max(date) filter (where flag) over (partition by scope order by date
                                      rows between unbounded preceding and 1 preceding), 999) > 14 as starts
        from f) x
  where flag)
select scope, episode,
       min(date) as first_day, max(date) as last_day, count(*) as flagged_days,
       round((array_agg(base28 order by date))[1]) as per_day_before,
       round((array_agg(next28 order by date desc))[1]) as per_day_after,
       round(max(avg7 / base28), 2) as peak_jump,
       case when min(next_days) < 14 then 'too recent to confirm' else 'held 28 days' end as status
from e
group by scope, episode;

-- Per-package downloads in the comparison windows (only packages with data in the last 730 days).
--   y1 / y0         trailing 365 days / the 365 days before
--   t90 / t90_ly    trailing 90 days / the same 90 days 52 weeks earlier
--   q1 / q0         latest complete quarter / the quarter before
create or replace temp view q_pkg_win as
select d.package_name, d.rollup, d.category,
       coalesce(sum(d.n) filter (where d.date >  p.as_of - 365), 0)                                    as y1,
       coalesce(sum(d.n) filter (where d.date <= p.as_of - 365), 0)                                    as y0,
       coalesce(sum(d.n) filter (where d.date >  p.as_of - 90), 0)                                     as t90,
       coalesce(sum(d.n) filter (where d.date >  p.as_of - 454 and d.date <= p.as_of - 364), 0)        as t90_ly,
       coalesce(sum(d.n) filter (where d.date >= p.q1_start and d.date < p.q_next), 0)                 as q1,
       coalesce(sum(d.n) filter (where d.date >= p.q0_start and d.date < p.q1_start), 0)               as q0
from g_daily d cross join q_p p
where d.date > p.as_of - 730
group by d.package_name, d.rollup, d.category;

-- Published days in the same windows (one row).
create or replace temp view q_win_days as
select count(*) filter (where d.date >  p.as_of - 365)                                as y1,
       count(*) filter (where d.date <= p.as_of - 365)                                as y0,
       count(*) filter (where d.date >  p.as_of - 90)                                 as t90,
       count(*) filter (where d.date >  p.as_of - 454 and d.date <= p.as_of - 364)    as t90_ly,
       count(*) filter (where d.date >= p.q1_start and d.date < p.q_next)             as q1,
       count(*) filter (where d.date >= p.q0_start and d.date < p.q1_start)           as q0
from g_days d cross join q_p p
where d.date > p.as_of - 730;

\set QUIET off
\pset null ''
\echo
\echo tunables: spike_x = :spike_x   step_x = :step_x   step_min = :step_min   comove_min = :comove_min   stale_min = :stale_min


-- =========================================================================================================
-- A. MISSING DAYS
-- =========================================================================================================

\echo
\echo === A1. Unpublished days in g_calendar, reconciled by cause ===
-- Why is each "unpublished" day missing? 'npm outage' = no row stored for any package (npm published nothing;
-- real downloads are lost). 'quiet day' = npm did publish, zeros are stored, the company just had 0 downloads
-- (nothing is lost). busiest_neighbour = largest company day within a week: tiny for genuine quiet days.
select coalesce(m.kind, 'TOTAL') as kind,
       count(*) as days, min(m.date) as first_day, max(m.date) as last_day,
       max(nb.busiest) as busiest_neighbour
from q_miss m
left join lateral (select max(g.n) as busiest from g_days g where g.date between m.date - 7 and m.date + 7) nb on true
group by grouping sets ((m.kind), ())
order by grouping(m.kind), 1;

\echo
\echo === A2. Unpublished days per month ===
-- When did they happen? Quiet days should sit in the early, low-volume years; outages can be anywhere.
select to_char(date, 'YYYY-MM') as month,
       count(*) filter (where kind = 'quiet day')  as quiet_days,
       count(*) filter (where kind = 'npm outage') as outage_days
from q_miss
group by 1 order by 1;

\echo
\echo === A3. npm outage days and the downloads they probably hid ===
-- One row per outage day: the nearest published same weekday before and after, and their mean as the
-- estimate of what was lost. These downloads happened but are in no reported total.
select e.date, to_char(e.date, 'Dy') as wd,
       max(e.same_wd_before) filter (where e.scope = 'company') as company_before,
       max(e.same_wd_after)  filter (where e.scope = 'company') as company_after,
       max(e.est)            filter (where e.scope = 'company') as company_est_lost,
       max(e.est)            filter (where e.scope = 'cloud')   as cloud_est_lost
from q_outage_est e
group by e.date order by e.date;

\echo
\echo === A4. Hollow days: published days where packages sit at a stale 0 ===
-- Days g_calendar counts as published but on which part of the catalogue reads 0 between weeks of real
-- volume (q_stale). Listed: days missing at least 10% of their estimated total; the rest are summed.
-- Unlike outages these days stay in the per-day denominator, so they pull averages down as well as totals.
-- They can be repaired: delete the 0 rows for these dates and fetch again (npm serves real counts for them).
with st as materialized (
  select date, count(*) as pkgs, sum(est) as est, coalesce(sum(est) filter (where rollup = 'cloud'), 0) as est_cloud
  from q_stale group by date),
gd as materialized (select date, n from g_days),
j as (
  select st.*, coalesce(gd.n, 0) as measured,
         100.0 * st.est / (st.est + coalesce(gd.n, 0)) as pct
  from st left join gd using (date)),
u as (
  select 1 as ord, date, date::text as day, to_char(date, 'Dy') as wd, pkgs, measured, est, est_cloud, round(pct, 1) as pct
  from j where pct >= 10
  union all
  select 2, null, 'other days (' || count(*) || ')', null, sum(pkgs), null, sum(est), sum(est_cloud), null
  from j where pct < 10
  union all
  select 3, null, 'TOTAL (' || count(*) || ' days)', null, sum(pkgs), null, sum(est), sum(est_cloud), null
  from j)
select day, wd, pkgs as packages_at_zero, measured as company_measured,
       est as company_est_missing, est_cloud as cloud_est_missing, pct as pct_of_day_missing
from u
order by ord, date;

\echo
\echo === A5. Measured (floor) vs adjusted (estimate), by window ===
-- Quote measured as the floor and adjusted as the estimate. adjusted = measured + outage estimate (A3)
-- + stale-zero estimate (A4). understated_pct = how far measured is below adjusted.
-- per_day = measured / published days (outage-proof, the figure the other files use);
-- adj_per_day = adjusted / calendar days (also repairs the hollow days).
with fx as materialized (select * from q_fix_day),
win(ord, win, d1, d2) as (
  select 1, 'trailing 30 days',        p.as_of - 29,  p.as_of        from q_p p union all
  select 2, 'trailing 90 days',        p.as_of - 89,  p.as_of        from q_p p union all
  select 3, 'latest complete quarter', p.q1_start,    p.q_next - 1   from q_p p union all
  select 4, 'the quarter before it',   p.q0_start,    p.q1_start - 1 from q_p p union all
  select 5, 'trailing 365 days',       p.as_of - 364, p.as_of        from q_p p union all
  select 6, 'all time',                (select min(date) from g_calendar), p.as_of from q_p p)
select w.win, fx.scope, w.d1 as from_day, w.d2 as to_day,
       count(*)                                as cal_days,
       count(*) filter (where fx.published)    as pub_days,
       count(*) filter (where fx.is_outage)    as outage_days,
       sum(fx.measured)                        as measured,
       sum(fx.lost_outage)                     as est_lost_outage,
       sum(fx.lost_stale)                      as est_lost_stale,
       sum(fx.measured + fx.lost_outage + fx.lost_stale) as adjusted,
       round(100.0 * sum(fx.lost_outage + fx.lost_stale) / nullif(sum(fx.measured + fx.lost_outage + fx.lost_stale), 0), 2) as understated_pct,
       round(sum(fx.measured) / nullif(count(*) filter (where fx.published), 0)) as per_day,
       round(sum(fx.measured + fx.lost_outage + fx.lost_stale) / count(*))        as adj_per_day
from win w join fx on fx.date between w.d1 and w.d2
group by w.ord, w.win, w.d1, w.d2, fx.scope
order by w.ord, fx.scope desc;

\echo
\echo === A6. Do the growth multiples change once the bad days are repaired? ===
-- measured_x = ratio of downloads per published day (what the other files report).
-- adjusted_x = ratio of adjusted downloads per calendar day (outage and stale-zero estimates added back).
-- If the two agree, the data problems change the level, not the growth story.
with fx as materialized (select * from q_fix_day),
cmp(ord, comparison, a1, a2, b1, b2) as (
  select 1, 'trailing 90 days vs 52 weeks earlier', p.as_of - 89, p.as_of, p.as_of - 453, p.as_of - 364 from q_p p union all
  select 2, 'trailing 365 days vs prior 365',       p.as_of - 364, p.as_of, p.as_of - 729, p.as_of - 365 from q_p p union all
  select 3, 'latest complete quarter vs the one before', p.q1_start, p.q_next - 1, p.q0_start, p.q1_start - 1 from q_p p),
x as (
  select c.ord, c.comparison, fx.scope, fx.date >= c.a1 as cur, fx.published, fx.measured,
         fx.measured + fx.lost_outage + fx.lost_stale as adjusted
  from cmp c join fx on fx.date between c.a1 and c.a2 or fx.date between c.b1 and c.b2)
select comparison, scope,
       round(sum(measured) filter (where cur) / nullif(count(*) filter (where cur and published), 0))         as per_day_now,
       round(sum(measured) filter (where not cur) / nullif(count(*) filter (where not cur and published), 0)) as per_day_then,
       round((sum(measured) filter (where cur) / nullif(count(*) filter (where cur and published), 0))
             / nullif(sum(measured) filter (where not cur) / nullif(count(*) filter (where not cur and published), 0), 0), 2) as measured_x,
       round(sum(adjusted) filter (where cur) / count(*) filter (where cur))         as adj_per_day_now,
       round(sum(adjusted) filter (where not cur) / count(*) filter (where not cur)) as adj_per_day_then,
       round((sum(adjusted) filter (where cur) / count(*) filter (where cur))
             / nullif(sum(adjusted) filter (where not cur) / count(*) filter (where not cur), 0), 2) as adjusted_x
from x
group by ord, comparison, scope
order by ord, scope desc;


-- =========================================================================================================
-- B. WEEKLY RHYTHM
-- =========================================================================================================

\echo
\echo === B1. Weekday vs weekend downloads per day, by quarter ===
-- Is there a working-week pattern? ratio = average weekday / average weekend day. People and CI give 2-5x;
-- mirrors, bots and always-on automation give ~1x. Watch how the ratio moves as volume grows.
-- cloud_other = cloud without the SQL parser family (q_family). The quarter containing :as_of is partial.
with fam as materialized (select package_name from q_family),
d as (
  select g.date, extract(isodow from g.date) >= 6 as weekend,
         sum(g.n) as company,
         coalesce(sum(g.n) filter (where g.rollup = 'cloud'), 0) as cloud,
         coalesce(sum(g.n) filter (where g.rollup = 'cloud' and f.package_name is null), 0) as cloud_other
  from g_daily g left join fam f using (package_name)
  where g.date >= (select date_trunc('quarter', as_of) - interval '3 years' from q_p)
  group by g.date having sum(g.n) > 0)
select to_char(date_trunc('quarter', date), 'YYYY-"Q"Q') as quarter,
       case when date_trunc('quarter', date) = (select date_trunc('quarter', as_of) from q_p) then 'partial' end as note,
       round(avg(company) filter (where not weekend)) as company_weekday,
       round(avg(company) filter (where weekend))     as company_weekend,
       round(avg(company) filter (where not weekend) / nullif(avg(company) filter (where weekend), 0), 2) as company_ratio,
       round(avg(cloud) filter (where not weekend))   as cloud_weekday,
       round(avg(cloud) filter (where weekend))       as cloud_weekend,
       round(avg(cloud) filter (where not weekend) / nullif(avg(cloud) filter (where weekend), 0), 2) as cloud_ratio,
       round(avg(cloud_other) filter (where not weekend) / nullif(avg(cloud_other) filter (where weekend), 0), 2) as cloud_other_ratio
from d
group by date_trunc('quarter', date)
order by date_trunc('quarter', date);

\echo
\echo === B2. Shape of the week: each weekday as % of the average day (trailing 90 days vs a year earlier) ===
-- Sanity check and signature in one. Sat/Sun must be the low days (if not, the dates are shifted). A flatter
-- week than a year ago means the new volume is less tied to working hours.
with d as (
  select s.scope, s.date, s.n,
         case when s.date > p.as_of - 90 then 'trailing 90 days' else 'same 90 days, 52 weeks earlier' end as period
  from q_scope_day s cross join q_p p
  where s.date > p.as_of - 90 or (s.date > p.as_of - 454 and s.date <= p.as_of - 364))
select scope, period,
       round(100 * avg(n) filter (where extract(isodow from date) = 1) / avg(n)) as mon,
       round(100 * avg(n) filter (where extract(isodow from date) = 2) / avg(n)) as tue,
       round(100 * avg(n) filter (where extract(isodow from date) = 3) / avg(n)) as wed,
       round(100 * avg(n) filter (where extract(isodow from date) = 4) / avg(n)) as thu,
       round(100 * avg(n) filter (where extract(isodow from date) = 5) / avg(n)) as fri,
       round(100 * avg(n) filter (where extract(isodow from date) = 6) / avg(n)) as sat,
       round(100 * avg(n) filter (where extract(isodow from date) = 7) / avg(n)) as sun
from d
group by scope, period
order by scope desc, period desc;

\echo
\echo === B3. Weekday/weekend ratio of the 15 largest packages (trailing 90 days) ===
-- Which of the big packages look human/CI driven (high ratio) and which look machine-flat (near 1)?
-- Identical ratios on neighbouring rows are a first hint of co-installs (section F).
select g.package_name, g.rollup,
       sum(g.n) as downloads_90d,
       round(avg(g.n) filter (where extract(isodow from g.date) < 6)
             / nullif(avg(g.n) filter (where extract(isodow from g.date) >= 6), 0), 2) as weekday_weekend_ratio
from g_daily g cross join q_p p
where g.date > p.as_of - 90
group by g.package_name, g.rollup
order by 3 desc
limit 15;


-- =========================================================================================================
-- C. SPIKES
-- =========================================================================================================

\echo
\echo === C1. Spike days per year (a day above spike_x times the median of the previous 28 days) ===
-- How often does a single day run away from its recent level? Many spikes in a year that carries the growth
-- story would be a red flag; spikes in the tiny early years are just small-number noise.
select extract(year from date)::int as year,
       count(*) filter (where scope = 'company')              as company_days,
       count(*) filter (where scope = 'company' and is_spike) as company_spikes,
       coalesce(sum(n - n_capped) filter (where scope = 'company' and is_spike), 0) as company_excess,
       count(*) filter (where scope = 'cloud' and is_spike)   as cloud_spikes,
       coalesce(sum(n - n_capped) filter (where scope = 'cloud' and is_spike), 0)   as cloud_excess
from q_spike
group by 1 order by 1;

\echo
\echo === C2. The biggest spikes of the last 3 years and the packages behind them ===
-- For the 5 largest spikes per scope (by downloads above the 28-day median): the 3 packages that added the
-- most over their own 28-day median, and the share of the spike those 3 explain.
-- One package = an event (release, crawler); many small ones = a broad surge.
with sp as materialized (
  select * from (
    select s.*, row_number() over (partition by s.scope order by s.n - s.med28 desc) as rk
    from q_spike s cross join q_p p
    where s.is_spike and s.date > p.as_of - 1095) x
  where rk <= 5),
days as materialized (select distinct date from sp),
pk as materialized (
  select d.date as spike_day, g.package_name, g.rollup,
         coalesce(max(g.n) filter (where g.date = d.date), 0) as n,
         coalesce(percentile_cont(0.5) within group (order by g.n) filter (where g.date < d.date), 0) as med28
  from days d join g_daily g on g.date between d.date - 28 and d.date
  group by d.date, g.package_name, g.rollup),
drv as (
  select sp.scope, sp.date, pk.package_name, pk.n - pk.med28 as excess,
         row_number() over (partition by sp.scope, sp.date order by pk.n - pk.med28 desc) as r
  from sp join pk on pk.spike_day = sp.date and (sp.scope = 'company' or pk.rollup = 'cloud'))
select sp.scope, sp.date, to_char(sp.date, 'Dy') as wd, sp.n as downloads, sp.med28 as median_28d,
       round(sp.n / nullif(sp.med28, 0), 1) as x_median,
       round((100 * sum(drv.excess) / nullif(sp.n - sp.med28, 0))::numeric) as top_3_pct_of_excess,
       string_agg(drv.package_name || ' +' || round(drv.excess::numeric), ', ' order by drv.r) as top_3_drivers
from sp join drv on drv.scope = sp.scope and drv.date = sp.date and drv.r <= 3
group by sp.scope, sp.date, sp.n, sp.med28
order by sp.scope desc, sp.date;

\echo
\echo === C3. Does the YoY multiple survive capping the spikes? ===
-- measured_x = YoY multiple of downloads per day. capped_x = the same with every spike day cut back to
-- spike_x times its 28-day median. median_day_x = YoY of the median day (ignores spikes altogether).
-- measured_x = capped_x means growth is not a handful of freak days. median_day_x well below both means the
-- higher level has been in place for less than half of the window (a recent step - see section D).
with s as materialized (select * from q_spike),
w(ord, win, len, shift) as (values (1, 'trailing 90 days vs 52 weeks earlier', 90, 364),
                                   (2, 'trailing 365 days vs prior 365', 365, 365)),
x as (
  select w.ord, w.win, s.scope,
         s.date > p.as_of - w.len as cur,
         s.n, s.n_capped, s.is_spike
  from s cross join q_p p cross join w
  where s.date > p.as_of - w.len
     or (s.date > p.as_of - w.shift - w.len and s.date <= p.as_of - w.shift))
select win, scope,
       round(avg(n) filter (where cur))     as per_day_now,
       round(avg(n) filter (where not cur)) as per_day_then,
       round(avg(n) filter (where cur) / nullif(avg(n) filter (where not cur), 0), 2) as measured_x,
       round(avg(n_capped) filter (where cur) / nullif(avg(n_capped) filter (where not cur), 0), 2) as capped_x,
       round((percentile_cont(0.5) within group (order by n) filter (where cur)
              / nullif(percentile_cont(0.5) within group (order by n) filter (where not cur), 0))::numeric, 2) as median_day_x,
       count(*) filter (where cur and is_spike)     as spikes_now,
       count(*) filter (where not cur and is_spike) as spikes_then
from x
group by ord, win, scope
order by ord, scope desc;


-- =========================================================================================================
-- D. STEP CHANGES
-- =========================================================================================================

\echo
\echo === D1. Step changes in the run-rate (7-day average vs the 28 days before, held for 28 days) ===
-- When did the level shift structurally? first_day..last_day is the ramp; per_day_before/after are the
-- 28-day averages on either side. A step with one driver is one downstream adopter, not broad adoption.
select scope, first_day, last_day, flagged_days, per_day_before, per_day_after,
       round(per_day_after / nullif(per_day_before, 0), 2) as step_x, peak_jump, status
from q_step
order by scope desc, first_day;

\echo
\echo === D2. Which packages account for each step of the last 2 years ===
-- Per step: the increase in downloads per day between the 28 days before the ramp and the 28 days after it,
-- how much of it is the SQL parser stack (q_family), how many packages it takes to explain 80% of it, and the
-- 4 biggest contributors. Near-equal contributions = one install pulling several packages.
with st as materialized (
  select s.* from q_step s cross join q_p p where s.first_day > p.as_of - 730),
gd as materialized (select date from g_days),
dn as materialized (
  select st.scope, st.first_day,
         count(*) filter (where gd.date <= st.first_day - 7) as days_before,
         count(*) filter (where gd.date >  st.last_day)      as days_after
  from st join gd on gd.date between st.first_day - 34 and st.last_day + 28
  group by st.scope, st.first_day),
g as materialized (
  select d.date, d.package_name, d.rollup, d.n
  from g_daily d
  where d.date >= (select min(first_day) - 34 from st)),
pk as (
  select st.scope, st.first_day, g.package_name,
         coalesce(sum(g.n) filter (where g.date <= st.first_day - 7), 0)::numeric / nullif(dn.days_before, 0) as before,
         coalesce(sum(g.n) filter (where g.date >  st.last_day), 0)::numeric      / nullif(dn.days_after, 0)  as after
  from st
  join dn on dn.scope = st.scope and dn.first_day = st.first_day
  join g  on g.date between st.first_day - 34 and st.last_day + 28
         and (g.date <= st.first_day - 7 or g.date > st.last_day)
         and (st.scope = 'company' or g.rollup = 'cloud')
  group by st.scope, st.first_day, g.package_name, dn.days_before, dn.days_after),
r as (
  select pk.*, pk.after - pk.before as delta, f.part,
         sum(pk.after - pk.before) over (partition by pk.scope, pk.first_day) as total_delta,
         sum(pk.after - pk.before) over (partition by pk.scope, pk.first_day order by pk.after - pk.before desc, pk.package_name) as cum_delta,
         row_number() over (partition by pk.scope, pk.first_day order by pk.after - pk.before desc, pk.package_name) as rk
  from pk left join q_family f using (package_name))
select scope, first_day as step_first_day,
       round(max(total_delta)) as added_per_day,
       round(100 * sum(delta) filter (where part is not null) / nullif(max(total_delta), 0), 1) as parser_stack_pct,
       count(*) filter (where cum_delta - delta < 0.8 * total_delta) as pkgs_for_80pct,
       string_agg(package_name || ' +' || round(delta) || ' (' || round(100 * delta / nullif(total_delta, 0)) || '%)',
                  ', ' order by rk) filter (where rk <= 4) as top_4_contributors
from r
group by scope, first_day
order by scope desc, first_day;


-- =========================================================================================================
-- E. CONCENTRATION
-- =========================================================================================================

\echo
\echo === E1. The ten largest packages and their share (trailing 365 days) ===
-- Who carries the total? cum_pct_company is the running share of company downloads; in_family marks the
-- SQL parser stack (q_family). Needed to read E2.
with p as (
  select w.*, f.part, rank() over (order by w.y1 desc) as rk, sum(w.y1) over () as total
  from q_pkg_win w left join q_family f using (package_name))
select rk, package_name, rollup, coalesce(part, '') as in_family, y1 as downloads_365d,
       round(100.0 * y1 / total, 1) as pct_company,
       round(100.0 * sum(y1) over (order by rk) / total, 1) as cum_pct_company,
       round((y1::numeric / (select y1 from q_win_days)) / nullif(y0::numeric / (select y0 from q_win_days), 0), 1) as yoy_x
from p
where rk <= 10
order by rk;

\echo
\echo === E2. Growth multiples without the top packages, without the parser family, without new packages ===
-- Does growth depend on one package or one family? Each row drops a set of packages and recomputes:
-- yoy_365d (trailing 365 vs prior 365), yoy_90d (trailing 90 vs 52 weeks earlier), qoq (latest complete
-- quarter vs the one before). Top N is ranked by trailing-365 downloads within the scope.
-- pct_of_365d_kept = how much of the scope's trailing-365 volume is still in the row. Read every multiple
-- next to per_day_prior_365d: a large multiple on a tiny base is a small number.
with p as materialized (
  select w.*, k.creation_date, f.part,
         rank() over (order by w.y1 desc) as rk_company,
         rank() over (partition by w.rollup order by w.y1 desc) as rk_rollup
  from q_pkg_win w join g_pkg k using (package_name) left join q_family f using (package_name)),
sc as (
  select 'company' as scope, p.*, rk_company as rk from p
  union all
  select 'cloud', p.*, rk_rollup from p where rollup = 'cloud'),
v(id, variant) as (values
  (1, 'all packages'),
  (2, 'without top 1'),
  (3, 'without top 3'),
  (4, 'without top 10'),
  (5, 'without parser family (by name)'),
  (6, 'without parser family + helper deps'),
  (7, 'only packages older than 2 years')),
k as (
  select sc.*, v.id, v.variant,
         case v.id when 1 then true
                   when 2 then sc.rk > 1
                   when 3 then sc.rk > 3
                   when 4 then sc.rk > 10
                   when 5 then sc.part is distinct from 'parser'
                   when 6 then sc.part is null
                   when 7 then sc.creation_date <= (select as_of - 730 from q_p) end as keep
  from sc cross join v)
select k.scope, k.variant,
       count(*) filter (where k.keep) as packages,
       round(100.0 * sum(k.y1) filter (where k.keep) / sum(k.y1), 1) as pct_of_365d_kept,
       round(sum(k.y1) filter (where k.keep) / d.y1) as per_day_365d,
       round(sum(k.y0) filter (where k.keep) / d.y0) as per_day_prior_365d,
       round((sum(k.y1) filter (where k.keep) / d.y1) / nullif(sum(k.y0) filter (where k.keep) / d.y0, 0), 2)           as yoy_365d_x,
       round((sum(k.t90) filter (where k.keep) / d.t90) / nullif(sum(k.t90_ly) filter (where k.keep) / d.t90_ly, 0), 2) as yoy_90d_x,
       round((sum(k.q1) filter (where k.keep) / d.q1) / nullif(sum(k.q0) filter (where k.keep) / d.q0, 0), 2)           as qoq_x
from k cross join q_win_days d
group by k.scope, k.id, k.variant, d.y1, d.y0, d.t90, d.t90_ly, d.q1, d.q0
order by k.scope desc, k.id;


\echo
\echo === E3. Cloud by month: the SQL parser stack vs everything else (last 13 months) ===
-- How much of cloud is the parser stack, and what is the rest (the platform itself) doing?
-- other_pkgs_100 = non-parser cloud packages with at least 100 downloads a day; typical_of_those = their
-- median downloads per day. When dozens of platform packages sit at one level, that level is roughly the
-- number of installs of the platform per day - far smaller than the cloud total.
-- The month containing :as_of is partial.
with fam as materialized (select package_name from q_family),
g as materialized (
  select date_trunc('month', d.date)::date as month, d.date, d.package_name, d.n, (f.package_name is not null) as in_stack
  from g_daily d left join fam f using (package_name) cross join q_p p
  where d.rollup = 'cloud' and d.date >= date_trunc('month', p.as_of) - interval '12 months'),
days as (
  select month, count(*) as days from (select month, date from g group by month, date having sum(n) > 0) x group by month),
pk as (
  select g.month, g.package_name, g.in_stack, sum(g.n)::numeric / days.days as per_day
  from g join days using (month)
  group by g.month, g.package_name, g.in_stack, days.days)
select to_char(month, 'YYYY-MM') as month,
       case when month = (select date_trunc('month', as_of) from q_p) then 'partial' end as note,
       round(sum(per_day) filter (where in_stack))     as parser_stack_per_day,
       round(sum(per_day) filter (where not in_stack)) as other_cloud_per_day,
       round(100 * sum(per_day) filter (where not in_stack) / nullif(sum(per_day), 0), 1) as other_pct_of_cloud,
       count(*) filter (where not in_stack and per_day >= 100) as other_pkgs_100,
       round((percentile_cont(0.5) within group (order by per_day) filter (where not in_stack and per_day >= 100))::numeric) as typical_of_those
from pk
group by month
order by month;

-- =========================================================================================================
-- F. CO-INSTALLS (double counting)
-- =========================================================================================================

\echo
\echo === F1. Packages with near-identical daily downloads (trailing 90 days) ===
-- HEURISTIC. Two packages are linked when their daily counts are within 10% of each other on at least 80%
-- of days; linked packages form a group (monorepo siblings / a dependency chain that installs as one).
-- 'excess' = group total minus its biggest member = downloads that are plausibly the same install counted
-- again. Only packages averaging >= comove_min downloads/day are compared. The TOTAL row sums the groups;
-- pct_of_company_90d puts it against all company downloads in the window.
-- It is a floor on double counting: a dependency with extra users of its own (e.g. a types package pulled
-- in by several parents) is NOT linked. F2 gives the other end of the range.
with recursive
cand as materialized (
  select g.package_name, sum(g.n) as t
  from g_daily g cross join q_p p
  where g.date > p.as_of - 90
  group by g.package_name
  having sum(g.n) >= 90 * :comove_min),
s as materialized (
  select g.package_name, g.date, g.n
  from g_daily g join cand using (package_name) cross join q_p p
  where g.date > p.as_of - 90),
edge as materialized (
  select a.package_name as a, b.package_name as b
  from s a join s b on b.date = a.date and a.package_name <> b.package_name
  group by a.package_name, b.package_name
  having avg((abs(a.n - b.n)::numeric / greatest(a.n, b.n, 1) <= 0.10)::int) >= 0.80),
reach(a, b) as (
  select a, b from edge
  union
  select r.a, e.b from reach r join edge e on e.a = r.b),
grp as (
  select a as package_name, least(a, min(b)) as gid from reach group by a),
g as (
  select grp.gid, count(*) as members, sum(c.t) as group_downloads, max(c.t) as biggest_member,
         (array_agg(c.package_name order by c.t desc))[1:5] as top_names
  from grp join cand c using (package_name)
  group by grp.gid)
select coalesce(case when grouping(gid) = 0 then (max(top_names))[1] end, 'TOTAL (all groups)') as biggest_package,
       sum(members) as members,
       sum(group_downloads) as group_downloads_90d,
       sum(biggest_member) as biggest_member_90d,
       sum(group_downloads) - sum(biggest_member) as excess,
       round(100.0 * (sum(group_downloads) - sum(biggest_member)) / (select sum(t) from (select sum(g.n) as t from g_daily g cross join q_p p where g.date > p.as_of - 90) z), 1) as excess_pct_of_company_90d,
       case when grouping(gid) = 0
            then left(array_to_string((max(top_names))[2:5], ', '), 110) || case when max(members) > 5 then ', ...' else '' end
       end as other_members
from g
group by grouping sets ((gid), ())
order by grouping(gid), 3 desc;

\echo
\echo === F2. From every download to one package per install: the range, and growth under each ===
-- HEURISTIC bounds on distinct installs, computed day by day so they are comparable across years:
--   all downloads           every package counted (what is reported; the ceiling)
--   largest per category    only the biggest package of each category each day (siblings collapsed)
--   largest single package  only the biggest package of the scope each day (hard floor: as if every
--                           download were part of an install that also fetched that package)
-- If yoy_x holds up on the lower rows, growth is more installs, not more packages per install.
with pc as materialized (
  select g.date, g.rollup, g.category, sum(g.n) as n, max(g.n) as top_n
  from g_daily g cross join q_p p
  where g.date > p.as_of - 730
  group by g.date, g.rollup, g.category),
d as (
  select 'company' as scope, date, sum(n) as all_n, sum(top_n) as cat_n, max(top_n) as one_n from pc group by date having sum(n) > 0
  union all
  select 'cloud', date, sum(n), sum(top_n), max(top_n) from pc where rollup = 'cloud' group by date),
x as (
  select d.scope, m.ord, m.measure, d.date > p.as_of - 365 as cur, m.n
  from d cross join q_p p
  cross join lateral (values (1, 'all downloads', d.all_n),
                             (2, 'largest package per category', d.cat_n),
                             (3, 'largest single package', d.one_n)) as m(ord, measure, n))
select scope, measure,
       round(avg(n) filter (where cur))     as per_day_trailing_365d,
       round(avg(n) filter (where not cur)) as per_day_prior_365d,
       round(avg(n) filter (where cur) / nullif(avg(n) filter (where not cur), 0), 2) as yoy_x,
       round(100 * avg(n) filter (where cur) / first_value(avg(n) filter (where cur)) over (partition by scope order by ord), 1) as pct_of_all_now,
       round(100 * avg(n) filter (where not cur) / first_value(avg(n) filter (where not cur)) over (partition by scope order by ord), 1) as pct_of_all_then
from x
group by scope, ord, measure
order by scope desc, ord;


-- =========================================================================================================
-- G. BREADTH
-- =========================================================================================================

\echo
\echo === G1. The median package: is growth broad or a few outliers? ===
-- Packages that are at least 2 years old and had >= 1 download/day in the prior year. median_yoy_x is the
-- YoY multiple of the typical package; aggregate_yoy_x is the same packages summed (pulled up by outliers).
-- A median near 1 with a large aggregate means growth is concentrated, whatever the headline says.
with p as (
  select w.rollup, w.y1 as n1, w.y0 as n0,
         (w.y1::numeric / d.y1) / (w.y0::numeric / d.y0) as x
  from q_pkg_win w join g_pkg k using (package_name) cross join q_win_days d cross join q_p
  where k.creation_date <= q_p.as_of - 730 and w.y0 >= 365)
select coalesce(rollup, 'company') as scope,
       count(*) as packages,
       round((percentile_cont(0.25) within group (order by x))::numeric, 2) as p25_yoy_x,
       round((percentile_cont(0.5)  within group (order by x))::numeric, 2) as median_yoy_x,
       round((percentile_cont(0.75) within group (order by x))::numeric, 2) as p75_yoy_x,
       round(100.0 * avg((x > 1)::int), 1)  as pct_grew,
       round(100.0 * avg((x >= 2)::int), 1) as pct_doubled,
       round((sum(p.n1)::numeric / max(d.y1)) / (sum(p.n0)::numeric / max(d.y0)), 2) as aggregate_yoy_x
from p cross join q_win_days d
group by grouping sets ((rollup), ())
order by grouping(rollup) desc, 1;

\echo
\echo === G2. Where the volume sits: packages bucketed by downloads per day (trailing 30 days) ===
-- Is the total padded by hundreds of tiny packages collecting mirror/bot downloads? Every published package
-- gets a trickle regardless of users; the low buckets show how much of the total that trickle could be.
with p as (
  select g.package_name, g.rollup, sum(g.n) as n,
         sum(g.n)::numeric / (select count(*) from g_days d cross join q_p where d.date > q_p.as_of - 30) as per_day
  from g_daily g cross join q_p
  where g.date > q_p.as_of - 30
  group by g.package_name, g.rollup),
b as (
  select *, case when per_day < 10 then '1. under 10/day'
                 when per_day < 100 then '2. 10-100/day'
                 when per_day < 1000 then '3. 100-1k/day'
                 when per_day < 10000 then '4. 1k-10k/day'
                 else '5. 10k+/day' end as bucket
  from p)
select bucket,
       count(*) as company_pkgs, sum(n) as company_downloads,
       round(100.0 * sum(n) / sum(sum(n)) over (), 2) as company_pct,
       count(*) filter (where rollup = 'cloud') as cloud_pkgs,
       coalesce(sum(n) filter (where rollup = 'cloud'), 0) as cloud_downloads,
       round(100.0 * coalesce(sum(n) filter (where rollup = 'cloud'), 0) / sum(sum(n) filter (where rollup = 'cloud')) over (), 2) as cloud_pct
from b
group by bucket order by bucket;


-- =========================================================================================================
-- H. WINDOW CHOICE
-- =========================================================================================================

\echo
\echo === H1. YoY multiple for every trailing window from 30 to 365 days ===
-- Was the window cherry-picked? One row per window length ending at :as_of. The multiple may differ by
-- length (short windows show the latest run-rate, long ones the year) but should not flip or collapse.
with cum as materialized (select * from q_cum),
r as (
  select s.scope, l.len, case when l.len >= 365 then l.len else 364 end as shift, p.as_of as d_end
  from (select generate_series(30, 360, 30) as len union all select 365) l
  cross join (values ('company'), ('cloud')) as s(scope) cross join q_p p),
v as (
  select r.scope, r.len,
         (c1.cum_n - coalesce(c0.cum_n, 0)) / nullif(c1.cum_days - coalesce(c0.cum_days, 0), 0) as now_per_day,
         (coalesce(p1.cum_n, 0) - coalesce(p0.cum_n, 0)) / nullif(coalesce(p1.cum_days, 0) - coalesce(p0.cum_days, 0), 0) as then_per_day
  from r
  join cum c1      on c1.scope = r.scope and c1.date = r.d_end
  left join cum c0 on c0.scope = r.scope and c0.date = r.d_end - r.len
  left join cum p1 on p1.scope = r.scope and p1.date = r.d_end - r.shift
  left join cum p0 on p0.scope = r.scope and p0.date = r.d_end - r.shift - r.len)
select len as window_days,
       round(max(now_per_day)  filter (where scope = 'company')) as company_per_day,
       round(max(then_per_day) filter (where scope = 'company')) as company_year_ago,
       round(max(now_per_day / then_per_day) filter (where scope = 'company'), 2) as company_yoy_x,
       round(max(now_per_day)  filter (where scope = 'cloud')) as cloud_per_day,
       round(max(then_per_day) filter (where scope = 'cloud')) as cloud_year_ago,
       round(max(now_per_day / then_per_day) filter (where scope = 'cloud'), 2) as cloud_yoy_x
from v
group by len order by len;

\echo
\echo === H2. YoY multiple as it stood at each of the last 12 month-ends (and at as_of) ===
-- Was the date cherry-picked? yoy_90d = trailing 90 days vs 52 weeks earlier; yoy_365d = trailing 365 vs
-- the prior 365. A multiple that only appears in the last rows is a recent event, not a trend.
with cum as materialized (select * from q_cum),
ends as (
  select (m + interval '1 month')::date - 1 as d_end, 'month-end' as note
  from q_p p cross join generate_series(date_trunc('month', p.as_of + 1) - interval '12 months',
                                        date_trunc('month', p.as_of + 1) - interval '1 month', interval '1 month') m
  union
  select p.as_of, 'as_of' from q_p p),
r as (
  select e.d_end, e.note, s.scope, l.len, l.shift
  from ends e
  cross join (values ('company'), ('cloud')) as s(scope)
  cross join (values (90, 364), (365, 365)) as l(len, shift)),
v as (
  select r.d_end, r.note, r.scope, r.len,
         (c1.cum_n - coalesce(c0.cum_n, 0)) / nullif(c1.cum_days - coalesce(c0.cum_days, 0), 0) as now_per_day,
         (coalesce(p1.cum_n, 0) - coalesce(p0.cum_n, 0)) / nullif(coalesce(p1.cum_days, 0) - coalesce(p0.cum_days, 0), 0) as then_per_day
  from r
  join cum c1      on c1.scope = r.scope and c1.date = r.d_end
  left join cum c0 on c0.scope = r.scope and c0.date = r.d_end - r.len
  left join cum p1 on p1.scope = r.scope and p1.date = r.d_end - r.shift
  left join cum p0 on p0.scope = r.scope and p0.date = r.d_end - r.shift - r.len)
select d_end as window_end, max(note) as note,
       round(max(now_per_day) filter (where scope = 'company' and len = 90)) as company_per_day_90d,
       round(max(now_per_day / then_per_day) filter (where scope = 'company' and len = 90), 2)  as company_yoy_90d_x,
       round(max(now_per_day / then_per_day) filter (where scope = 'company' and len = 365), 2) as company_yoy_365d_x,
       round(max(now_per_day) filter (where scope = 'cloud' and len = 90)) as cloud_per_day_90d,
       round(max(now_per_day / then_per_day) filter (where scope = 'cloud' and len = 90), 2)    as cloud_yoy_90d_x,
       round(max(now_per_day / then_per_day) filter (where scope = 'cloud' and len = 365), 2)   as cloud_yoy_365d_x
from v
group by d_end order by d_end;


-- =========================================================================================================
-- I. FRESHNESS AND COVERAGE  (all tracked packages, personal included; rollup shown where it matters)
-- =========================================================================================================

\echo
\echo === I1. Is the latest day complete? ===
-- A half-fetched last day drags every trailing window down. Compare the packages reporting on :as_of with a
-- week earlier, and the day's total with the same weekday a week earlier (expect roughly 1, not 0.3).
select p.as_of,
       (select count(*) from npm_count.daily_downloads d where d.date = p.as_of)         as pkgs_reporting,
       (select count(*) from npm_count.daily_downloads d where d.date = p.as_of - 7)     as pkgs_week_earlier,
       (select count(*) from npm_count.npm_package where is_active)                      as active_pkgs,
       (select n from g_days where date = p.as_of)                                       as company_downloads,
       round((select n from g_days where date = p.as_of) / nullif((select n from g_days where date = p.as_of - 7), 0), 2) as vs_week_earlier,
       (select max(last_fetched_date) from npm_count.npm_package)                        as last_fetch,
       (select max(last_fetched_date) from npm_count.npm_package) - p.as_of              as fetch_minus_as_of_days
from q_p p;

\echo
\echo === I2. Last fetch date by package status ===
-- Are all active packages fetched on the same recent day? Inactive packages stop being fetched, so their
-- downloads after that day are simply not counted.
select coalesce(is_active, false) as is_active, last_fetched_date,
       count(*) as packages,
       (select as_of from q_p) - last_fetched_date as days_behind_as_of
from npm_count.npm_package
group by 1, 2
order by 1 desc, 2 desc nulls last;

\echo
\echo === I3. Packages that went dark: data before, none in the last 7 days ===
-- Which packages silently dropped out of the totals, and how much did they carry? downloads_last_365d is
-- over the final 365 days of the package's own data.
with last as (
  select package_name, max(date) as last_day from npm_count.daily_downloads group by package_name)
select l.package_name, k.rollup, np.is_active, l.last_day, np.last_fetched_date,
       (select as_of from q_p) - l.last_day as days_dark,
       (select coalesce(sum(d.download_count), 0) from npm_count.daily_downloads d
         where d.package_name = l.package_name and d.date > l.last_day - 365) as downloads_last_365d
from last l
join npm_count.npm_package np using (package_name)
left join g_pkg k using (package_name)
where l.last_day < (select as_of - 6 from q_p)
order by l.last_day, l.package_name;

\echo
\echo === I4. Tracked packages with no downloads at all ===
-- Packages in npm_package that never contributed: either never fetched (rows = 0) or always zero.
select np.package_name, k.rollup, k.category, np.creation_date, np.is_active, np.last_fetched_date,
       count(d.date) as rows
from npm_count.npm_package np
left join g_pkg k using (package_name)
left join npm_count.daily_downloads d using (package_name)
group by np.package_name, k.rollup, k.category, np.creation_date, np.is_active, np.last_fetched_date
having coalesce(sum(d.download_count), 0) = 0
order by np.creation_date, np.package_name;

\echo
\echo === I5. Holes inside the history of a package ===
-- Days npm published (some package has a row) but this package has none, between its first and last row.
-- These are fetch gaps, not outages. No rows = every package series is continuous.
with pub as (
  select date, row_number() over (order by date) as idx
  from (select distinct date from npm_count.daily_downloads) x),
pk as (
  select package_name, min(date) as first_day, max(date) as last_day, count(*) as rows
  from npm_count.daily_downloads group by package_name)
select pk.package_name, pk.first_day, pk.last_day, pk.rows,
       (b.idx - a.idx + 1) - pk.rows as missing_days
from pk
join pub a on a.date = pk.first_day
join pub b on b.date = pk.last_day
where (b.idx - a.idx + 1) > pk.rows
order by 5 desc, 1;

\echo
\echo === I6. Downloads dated before the package existed, or negative ===
-- Impossible rows. Expect zero in both columns.
select count(*) filter (where d.date < np.creation_date) as rows_before_creation,
       count(*) filter (where d.download_count < 0)      as negative_rows
from npm_count.daily_downloads d
join npm_count.npm_package np using (package_name);
