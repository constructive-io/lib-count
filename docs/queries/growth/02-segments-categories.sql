-- Segments: where the downloads come from. The three brand rollups (cloud / chain / utils) and every
-- category inside them: mix over time, growth, who drove the growth, and which categories have momentum.
--
--   psql postgresql://postgres:password@localhost:5432/stats_dev -f docs/queries/growth/02-segments-categories.sql
--   psql ... -v as_of=YYYY-MM-DD -v min_base=1000 -f docs/queries/growth/02-segments-categories.sql
--
-- Words used in every result:
--   rollup     brand rollup from 00-setup.sql: cloud | chain | utils (personal is already excluded).
--   category   the npm_count.category a package belongs to. NAMING TRAP: the rollup 'cloud' contains a small
--              category that is also called 'cloud'. Results always carry both columns; never mix them up.
--              The category 'launchql' is the one the README displays as "Constructive".
--   days       days npm published data in the period (rule 2 in 00-setup.sql). Shown next to every total.
--   per_day    downloads / days. The only number that is comparable between periods.
--   status     'partial' = the period is not a full calendar period (it contains :as_of, or it is the first
--              period of the data). Its per_day is still per published day, but read it as provisional.
--   *_pct      percent. Growth percentages: 25 means +25%.
--   *_x        multiple: now / base. 1.00 = flat, 0.80 = down 20%, 12.5 = twelve and a half times.
--   min_base   growth is left blank when the base period is under :min_base downloads per day (default 500),
--              because "500x" off a base of 10/day is noise. The base is always printed beside the multiple.
--
-- Trailing windows are calendar windows ending on :as_of (30 = the last 30 calendar days). "1y ago" is the same
-- window ending one year earlier; "prev" is the window immediately before it.

\ir 00-setup.sql

\if :{?min_base}
\else
  \set min_base 500
\endif

-- ---------------------------------------------------------------------------------------------------------
-- Helper views (TEMP, read-only). Everything below reads from these.
-- ---------------------------------------------------------------------------------------------------------
\set QUIET on

-- Calendar months and quarters: published days, and whether the period is a full calendar period.
create or replace temp view seg_period as
select g.grain,
       date_trunc(g.grain, c.date)::date as period,
       count(*) filter (where c.published) as days,
       count(*) = (date_trunc(g.grain, c.date) + g.len)::date - date_trunc(g.grain, c.date)::date as complete
from g_calendar c
cross join (values ('month', interval '1 month'), ('quarter', interval '3 months')) g(grain, len)
group by g.grain, g.len, date_trunc(g.grain, c.date);

-- Downloads per category per month / quarter.
create or replace temp view seg_cat_period as
select g.grain, date_trunc(g.grain, d.date)::date as period, d.rollup, d.category, sum(d.n) as n
from g_daily d
cross join (values ('month'), ('quarter')) g(grain)
group by g.grain, date_trunc(g.grain, d.date), d.rollup, d.category;

-- One row per month / quarter with the three rollups side by side (raw sums; divide by days for per_day).
create or replace temp view seg_rollup_period as
select p.grain, p.period, p.days, p.complete,
       coalesce(sum(c.n) filter (where c.rollup = 'cloud'), 0) as cloud,
       coalesce(sum(c.n) filter (where c.rollup = 'chain'), 0) as chain,
       coalesce(sum(c.n) filter (where c.rollup = 'utils'), 0) as utils,
       coalesce(sum(c.n), 0) as company
from seg_period p
left join seg_cat_period c using (grain, period)
group by p.grain, p.period, p.days, p.complete;

-- Trailing windows of 30 / 90 / 365 calendar days, ending now, just before now, one and two years ago.
create or replace temp view seg_window as
select w.win, a.anchor, a.ord,
       a.end_date - (w.win - 1) as d_from,
       a.end_date as d_to,
       count(d.date) as days
from (values (30), (90), (365)) w(win)
cross join lateral (values
       ('now',    0, :'as_of'::date),
       ('prev',   1, :'as_of'::date - w.win),
       ('1y ago', 2, (:'as_of'::date - interval '1 year')::date),
       ('2y ago', 3, (:'as_of'::date - interval '2 years')::date)) a(anchor, ord, end_date)
left join g_days d on d.date between a.end_date - (w.win - 1) and a.end_date
group by w.win, a.anchor, a.ord, a.end_date;

-- Downloads per category in each trailing window.
create or replace temp view seg_cat_window as
select w.win, w.anchor, d.rollup, d.category, sum(d.n) as n
from seg_window w
join g_daily d on d.date between w.d_from and w.d_to
group by w.win, w.anchor, d.rollup, d.category;

-- Two "now vs a year earlier" comparisons, used by the contribution-to-growth queries:
--   1. the latest complete quarter vs the same quarter a year earlier
--   2. the trailing 365 days vs the 365 days before that
-- seg_span holds the four date ranges (base and now for each) with their published-day counts.
create or replace temp view seg_span as
with latest as (
  -- start of the latest quarter that has fully ended on or before :as_of
  select (date_trunc('quarter', :'as_of'::date + 1) - interval '3 months')::date as q
), span as (
  select 1 as ord, 'latest complete quarter vs same quarter a year earlier' as comparison, 'base' as side,
         (q - interval '1 year')::date as d_from, (q - interval '9 months' - interval '1 day')::date as d_to
  from latest
  union all
  select 1, 'latest complete quarter vs same quarter a year earlier', 'now',
         q, (q + interval '3 months' - interval '1 day')::date
  from latest
  union all
  select 2, 'trailing 365 days vs the 365 days before', 'base', :'as_of'::date - 729, :'as_of'::date - 365
  union all
  select 2, 'trailing 365 days vs the 365 days before', 'now', :'as_of'::date - 364, :'as_of'::date
)
select s.ord, s.comparison, s.side, s.d_from, s.d_to, count(d.date) as days
from span s
left join g_days d on d.date between s.d_from and s.d_to
group by s.ord, s.comparison, s.side, s.d_from, s.d_to;

-- Base and now downloads per category for each comparison, with the periods and day counts attached.
create or replace temp view seg_compare as
select h.ord, h.comparison, h.base_from, h.base_to, h.base_days, h.now_from, h.now_to, h.now_days,
       a.rollup, a.category, a.base_n, a.now_n
from (
  select ord, comparison,
         min(d_from) filter (where side = 'base') as base_from,
         min(d_to)   filter (where side = 'base') as base_to,
         min(days)   filter (where side = 'base') as base_days,
         min(d_from) filter (where side = 'now')  as now_from,
         min(d_to)   filter (where side = 'now')  as now_to,
         min(days)   filter (where side = 'now')  as now_days
  from seg_span
  group by ord, comparison
) h
join (
  select s.ord, d.rollup, d.category,
         coalesce(sum(d.n) filter (where s.side = 'base'), 0) as base_n,
         coalesce(sum(d.n) filter (where s.side = 'now'), 0) as now_n
  from seg_span s
  join g_daily d on d.date between s.d_from and s.d_to
  group by s.ord, d.rollup, d.category
) a using (ord);

-- One row per category: size (lifetime, trailing 30 / 90 / 365 days) and the trailing-90-day run-rate
-- now, in the 90 days before, and in the same 90 days a year ago.
create or replace temp view seg_leaderboard as
with pk as (
  select rollup, category, count(*) as packages from g_pkg where rollup <> 'personal' group by rollup, category
), life as (
  select category, sum(n) as lifetime, min(date) as first_day from g_daily group by category
), win as (
  select c.category,
         sum(c.n) filter (where c.win = 30  and c.anchor = 'now') as d30,
         sum(c.n) filter (where c.win = 90  and c.anchor = 'now') as d90,
         sum(c.n) filter (where c.win = 365 and c.anchor = 'now') as d365,
         sum(c.n::numeric / nullif(w.days, 0)) filter (where c.win = 90 and c.anchor = 'now')    as pd90,
         sum(c.n::numeric / nullif(w.days, 0)) filter (where c.win = 90 and c.anchor = 'prev')   as pd90_prev,
         sum(c.n::numeric / nullif(w.days, 0)) filter (where c.win = 90 and c.anchor = '1y ago') as pd90_1y
  from seg_cat_window c
  join seg_window w using (win, anchor)
  group by c.category
)
select pk.rollup, pk.category, pk.packages, life.first_day,
       coalesce(life.lifetime, 0) as lifetime,
       coalesce(win.d30, 0) as d30, coalesce(win.d90, 0) as d90, coalesce(win.d365, 0) as d365,
       coalesce(win.pd90, 0) as pd90, coalesce(win.pd90_prev, 0) as pd90_prev, coalesce(win.pd90_1y, 0) as pd90_1y
from pk
left join life using (category)
left join win using (category);

-- Momentum bucket per category: the last 90 days against the category's best COMPLETE quarter.
create or replace temp view seg_momentum as
with q as (
  select c.category, p.period, c.n::numeric / p.days as per_day
  from seg_cat_period c
  join seg_period p using (grain, period)
  where p.grain = 'quarter' and p.complete and p.days > 0
), best as (
  select distinct on (category) category, period as best_quarter, per_day as best_per_day
  from q
  order by category, per_day desc, period desc
)
select l.*, b.best_quarter, coalesce(b.best_per_day, 0) as best_per_day,
       case
         when greatest(l.pd90, coalesce(b.best_per_day, 0)) < :min_base then 'negligible'
         when l.pd90 >= coalesce(b.best_per_day, 0) then 'all-time high'
         when l.pd90 >= l.pd90_1y then 'below peak, growing'
         else 'below peak, declining'
       end as momentum
from seg_leaderboard l
left join best b using (category);

\set QUIET off

-- =========================================================================================================
-- A. ROLLUPS: cloud vs chain vs utils
-- =========================================================================================================

\echo
\echo === A1. All-time downloads by rollup (sanity check: must match the README totals) ===
-- How big is each rollup over the whole history, and what share of the company is it?
-- Read: lifetime is a floor (missing npm days are absent). The last row is the company total.
select coalesce(d.rollup, 'company') as rollup,
       count(distinct d.category) as categories,
       count(distinct d.package_name) as packages_with_downloads,
       sum(d.n) as lifetime_downloads,
       round(100.0 * sum(d.n) / (select sum(n) from g_daily), 1) as pct_of_company,
       min(d.date) as first_day
from g_daily d
group by grouping sets ((d.rollup), ())
order by grouping(d.rollup), sum(d.n) desc;

\echo
\echo === A2. Rollup mix by quarter, all time: per-day run-rate and share of company ===
-- How did the mix between cloud, chain and utils move over the company's life?
-- Read: *_per_day is comparable across quarters; *_pct sums to 100. Rows marked partial are provisional.
select to_char(period, 'YYYY "Q"Q') as quarter, days,
       case when complete then '' else 'partial' end as status,
       round(cloud::numeric / nullif(days, 0)) as cloud_per_day,
       round(chain::numeric / nullif(days, 0)) as chain_per_day,
       round(utils::numeric / nullif(days, 0)) as utils_per_day,
       round(company::numeric / nullif(days, 0)) as company_per_day,
       round(100.0 * cloud / nullif(company, 0), 1) as cloud_pct,
       round(100.0 * chain / nullif(company, 0), 1) as chain_pct,
       round(100.0 * utils / nullif(company, 0), 1) as utils_pct
from seg_rollup_period
where grain = 'quarter'
order by period;

\echo
\echo === A3. Rollup mix by month, last 18 months ===
-- Same as A2 at monthly resolution, for the recent story. The month that contains :as_of is partial.
select to_char(period, 'YYYY-MM') as month, days,
       case when complete then '' else 'partial' end as status,
       round(cloud::numeric / nullif(days, 0)) as cloud_per_day,
       round(chain::numeric / nullif(days, 0)) as chain_per_day,
       round(utils::numeric / nullif(days, 0)) as utils_per_day,
       round(company::numeric / nullif(days, 0)) as company_per_day,
       round(100.0 * cloud / nullif(company, 0), 1) as cloud_pct,
       round(100.0 * chain / nullif(company, 0), 1) as chain_pct,
       round(100.0 * utils / nullif(company, 0), 1) as utils_pct
from seg_rollup_period
where grain = 'month'
  and period >= date_trunc('month', :'as_of'::date) - interval '18 months'
order by period;

\echo
\echo === A4. Cloud vs chain: every change of leader ===
-- When did cloud pass chain? Every change of leader on three bases: monthly and quarterly run-rate
-- (complete periods only; cloud / chain = downloads per day) and cumulative downloads (running totals).
-- Read: the last row of each basis is the lead that still stands; 'start' rows show who led at the beginning.
with runrate as (
  select grain, period, days, cloud, chain,
         case when cloud >= chain then 'cloud' else 'chain' end as leader
  from seg_rollup_period
  where complete and days > 0
), runrate_flip as (
  select *, lag(leader) over (partition by grain order by period) as prev_leader from runrate
), daily as (
  select date,
         coalesce(sum(n) filter (where rollup = 'cloud'), 0) as cloud_n,
         coalesce(sum(n) filter (where rollup = 'chain'), 0) as chain_n
  from g_daily
  group by date
), cumulative as (
  select date,
         sum(cloud_n) over (order by date) as cloud,
         sum(chain_n) over (order by date) as chain
  from daily
), cumulative_flip as (
  select *, lag(leader) over (order by date) as prev_leader
  from (select *, case when cloud >= chain then 'cloud' else 'chain' end as leader from cumulative) c
)
select basis, "when", event, new_leader, cloud, chain
from (
  select case grain when 'month' then 1 else 2 end as ord, period as sort_date,
         grain || 'ly run-rate (per day)' as basis,
         case grain when 'month' then to_char(period, 'YYYY-MM') else to_char(period, 'YYYY "Q"Q') end as "when",
         case when prev_leader is null then 'start' else 'lead change' end as event,
         leader as new_leader,
         round(cloud::numeric / days) as cloud,
         round(chain::numeric / days) as chain
  from runrate_flip
  where leader is distinct from prev_leader
  union all
  select 3, date, 'cumulative downloads', to_char(date, 'YYYY-MM-DD'),
         case when prev_leader is null then 'start' else 'lead change' end,
         leader, cloud, chain
  from cumulative_flip
  where leader is distinct from prev_leader
) e
order by ord, sort_date;

\echo
\echo === A5. Share of company downloads: now vs one and two years ago ===
-- What share of downloads is cloud today, and what was it in the same window one and two years ago?
-- Read: one block per trailing window (30 / 90 / 365 days). Shares are ratios inside the same days, so
-- missing npm days cancel out; company_per_day is there for scale.
with r as (
  select win, anchor,
         sum(n) as company,
         coalesce(sum(n) filter (where rollup = 'cloud'), 0) as cloud,
         coalesce(sum(n) filter (where rollup = 'chain'), 0) as chain,
         coalesce(sum(n) filter (where rollup = 'utils'), 0) as utils
  from seg_cat_window
  group by win, anchor
)
select w.win as window_days, w.anchor as window_ends, w.d_from, w.d_to, w.days,
       round(r.company::numeric / nullif(w.days, 0)) as company_per_day,
       round(100.0 * r.cloud / r.company, 1) as cloud_pct,
       round(100.0 * r.chain / r.company, 1) as chain_pct,
       round(100.0 * r.utils / r.company, 1) as utils_pct
from seg_window w
join r using (win, anchor)
where w.anchor <> 'prev'
order by w.win, w.ord;

\echo
\echo === A6. Scorecard: each rollup over the last 30 / 90 / 365 days, vs the window before and vs a year ago ===
-- The headline table: size, share and growth of cloud, chain, utils, the company, and the company WITHOUT
-- chain (answers "is the total propped up by legacy?").
-- Read: vs_prev_pct = vs the window immediately before; yoy_x = now / the same window a year ago.
with seg as (
  select win, anchor, rollup as segment, sum(n) as n from seg_cat_window group by win, anchor, rollup
  union all
  select win, anchor, 'company', sum(n) from seg_cat_window group by win, anchor
  union all
  select win, anchor, 'company ex-chain', sum(n) from seg_cat_window where rollup <> 'chain' group by win, anchor
), r as (
  select s.win, s.anchor, s.segment, s.n, w.days, w.d_from, w.d_to,
         s.n::numeric / nullif(w.days, 0) as per_day,
         100.0 * s.n / max(s.n) filter (where s.segment = 'company') over (partition by s.win, s.anchor) as pct
  from seg s
  join seg_window w using (win, anchor)
)
select cur.win as window_days, cur.segment, cur.n as downloads, cur.days,
       round(cur.per_day) as per_day,
       round(cur.pct, 1) as pct_of_company,
       round(prev.per_day) as prev_per_day,
       case when prev.per_day >= :min_base then round(100 * (cur.per_day / prev.per_day - 1), 1) end as vs_prev_pct,
       round(ya.per_day) as per_day_1y_ago,
       case when ya.per_day >= :min_base then round(cur.per_day / ya.per_day, 2) end as yoy_x,
       round(ya.pct, 1) as pct_of_company_1y_ago
from r cur
left join r prev on prev.win = cur.win and prev.segment = cur.segment and prev.anchor = 'prev'
left join r ya   on ya.win = cur.win   and ya.segment = cur.segment   and ya.anchor = '1y ago'
where cur.anchor = 'now'
order by cur.win,
         array_position(array['cloud', 'chain', 'utils', 'company', 'company ex-chain'], cur.segment);

-- =========================================================================================================
-- B. GROWTH OF EACH ROLLUP
-- =========================================================================================================

\echo
\echo === B1. Cloud rollup: per-day run-rate by quarter, with QoQ and YoY ===
-- How fast is the cloud product growing, quarter by quarter (last 16 quarters)?
-- Read: qoq_pct vs the previous quarter, yoy_x vs the same quarter a year earlier, both on per-day run-rate.
-- pct_of_best = this quarter as a percent of the best complete quarter so far (100 = a new high).
with q as (
  select period, days, complete,
         cloud::numeric / nullif(days, 0) as per_day,
         100.0 * cloud / nullif(company, 0) as pct
  from seg_rollup_period
  where grain = 'quarter'
)
select to_char(q.period, 'YYYY "Q"Q') as quarter, q.days,
       case when q.complete then '' else 'partial' end as status,
       round(q.per_day) as cloud_per_day,
       case when p.per_day >= :min_base then round(100 * (q.per_day / p.per_day - 1), 1) end as qoq_pct,
       case when y.per_day >= :min_base then round(q.per_day / y.per_day, 2) end as yoy_x,
       round(100 * q.per_day / max(q.per_day) filter (where q.complete)
             over (order by q.period rows between unbounded preceding and current row)) as pct_of_best,
       round(q.pct, 1) as cloud_pct_of_company
from q
left join q p on p.period = (q.period - interval '3 months')::date
left join q y on y.period = (q.period - interval '1 year')::date
where q.period >= date_trunc('quarter', :'as_of'::date) - interval '45 months'
order by q.period;

\echo
\echo === B2. Cloud rollup: per-day run-rate by month, with MoM and YoY (last 24 months) ===
-- The same at monthly resolution: is the growth steady or one step? Look for where mom_pct spikes.
with m as (
  select period, days, complete,
         cloud::numeric / nullif(days, 0) as per_day,
         100.0 * cloud / nullif(company, 0) as pct
  from seg_rollup_period
  where grain = 'month'
)
select to_char(m.period, 'YYYY-MM') as month, m.days,
       case when m.complete then '' else 'partial' end as status,
       round(m.per_day) as cloud_per_day,
       case when p.per_day >= :min_base then round(100 * (m.per_day / p.per_day - 1), 1) end as mom_pct,
       case when y.per_day >= :min_base then round(m.per_day / y.per_day, 2) end as yoy_x,
       round(m.pct, 1) as cloud_pct_of_company
from m
left join m p on p.period = (m.period - interval '1 month')::date
left join m y on y.period = (m.period - interval '1 year')::date
where m.period >= date_trunc('month', :'as_of'::date) - interval '24 months'
order by m.period;

\echo
\echo === B3. Chain rollup (legacy): per-day run-rate by quarter, vs its own peak ===
-- Is chain flat, shrinking or recovering, and how much of the company does it still carry?
-- Read: pct_of_peak = this quarter as a percent of chain's best complete quarter (the peak row shows 100).
-- yoy_pct below zero = shrinking year on year. chain_pct_of_company is how exposed the total is to it.
with q as (
  select period, days, complete,
         chain::numeric / nullif(days, 0) as per_day,
         100.0 * chain / nullif(company, 0) as pct
  from seg_rollup_period
  where grain = 'quarter'
)
select to_char(q.period, 'YYYY "Q"Q') as quarter, q.days,
       case when q.complete then '' else 'partial' end as status,
       round(q.per_day) as chain_per_day,
       case when p.per_day >= :min_base then round(100 * (q.per_day / p.per_day - 1), 1) end as qoq_pct,
       case when y.per_day >= :min_base then round(100 * (q.per_day / y.per_day - 1), 1) end as yoy_pct,
       round(100 * q.per_day / max(q.per_day) filter (where q.complete) over ()) as pct_of_peak,
       round(q.pct, 1) as chain_pct_of_company
from q
left join q p on p.period = (q.period - interval '3 months')::date
left join q y on y.period = (q.period - interval '1 year')::date
where q.period >= date_trunc('quarter', :'as_of'::date) - interval '45 months'
order by q.period;

\echo
\echo === B4. Utils rollup: per-day run-rate by quarter, next to cloud ===
-- Utils are shared helpers that cloud packages depend on. Does utils move on its own or follow cloud?
-- Read: if utils_per_cloud_pct is stable while both grow, utils is riding cloud installs, not separate demand.
with q as (
  select period, days, complete,
         utils::numeric / nullif(days, 0) as per_day,
         cloud::numeric / nullif(days, 0) as cloud_per_day,
         100.0 * utils / nullif(company, 0) as pct
  from seg_rollup_period
  where grain = 'quarter'
)
select to_char(q.period, 'YYYY "Q"Q') as quarter, q.days,
       case when q.complete then '' else 'partial' end as status,
       round(q.per_day) as utils_per_day,
       case when p.per_day >= :min_base then round(100 * (q.per_day / p.per_day - 1), 1) end as qoq_pct,
       case when y.per_day >= :min_base then round(q.per_day / y.per_day, 2) end as yoy_x,
       round(q.cloud_per_day) as cloud_per_day,
       round(100 * q.per_day / nullif(q.cloud_per_day, 0), 1) as utils_per_cloud_pct,
       round(q.pct, 1) as utils_pct_of_company
from q
left join q p on p.period = (q.period - interval '3 months')::date
left join q y on y.period = (q.period - interval '1 year')::date
where q.period >= date_trunc('quarter', :'as_of'::date) - interval '33 months'
order by q.period;

-- =========================================================================================================
-- C. CONTRIBUTION TO GROWTH: who produced the increase
-- =========================================================================================================

\echo
\echo === C1. The two year-on-year comparisons used below (periods, day counts, company growth) ===
-- Defines the periods for C2 and C3 and gives the company-level growth they decompose.
select comparison,
       base_from || ' .. ' || base_to as base_period, base_days,
       now_from || ' .. ' || now_to as now_period, now_days,
       sum(base_n) as base_downloads,
       sum(now_n) as now_downloads,
       round(sum(base_n)::numeric / base_days) as base_per_day,
       round(sum(now_n)::numeric / now_days) as now_per_day,
       round(sum(now_n)::numeric / now_days - sum(base_n)::numeric / base_days) as added_per_day,
       round((sum(now_n)::numeric / now_days) / nullif(sum(base_n)::numeric / base_days, 0), 2) as growth_x
from seg_compare
group by ord, comparison, base_from, base_to, base_days, now_from, now_to, now_days
order by ord;

\echo
\echo === C2. Contribution to company growth, by rollup ===
-- Of the company's year-on-year increase in daily downloads, how much came from each rollup?
-- Read: added_per_day sums to the company's added_per_day in C1; pct_of_company_growth sums to 100
-- (a negative value means the rollup shrank and dragged the total down).
with r as (
  select ord, comparison, rollup,
         sum(base_n)::numeric / base_days as base_pd,
         sum(now_n)::numeric / now_days as now_pd
  from seg_compare
  group by ord, comparison, base_days, now_days, rollup
)
select comparison, rollup,
       round(base_pd) as base_per_day,
       round(now_pd) as now_per_day,
       round(now_pd - base_pd) as added_per_day,
       round(100 * (now_pd - base_pd) / nullif(sum(now_pd - base_pd) over (partition by ord), 0), 1) as pct_of_company_growth,
       case when base_pd >= :min_base then round(now_pd / base_pd, 2) end as growth_x
from r
order by ord, now_pd - base_pd desc;

\echo
\echo === C3. Contribution to company growth, by category ===
-- The same decomposition for every category: which categories produced the growth, which shrank?
-- Read: sorted by added_per_day inside each comparison; cum_pct is the running share of company growth, so
-- you can see how few categories explain it. growth_x is blank when the base is under :min_base per day.
with r as (
  select ord, comparison, rollup, category,
         base_n::numeric / base_days as base_pd,
         now_n::numeric / now_days as now_pd
  from seg_compare
)
select comparison, rollup, category,
       round(base_pd) as base_per_day,
       round(now_pd) as now_per_day,
       round(now_pd - base_pd) as added_per_day,
       round(100 * (now_pd - base_pd) / nullif(sum(now_pd - base_pd) over (partition by ord), 0), 1) as pct_of_company_growth,
       round(100 * sum(now_pd - base_pd) over (partition by ord order by now_pd - base_pd desc, category)
                 / nullif(sum(now_pd - base_pd) over (partition by ord), 0), 1) as cum_pct,
       case when base_pd >= :min_base then round(now_pd / base_pd, 2) end as growth_x
from r
order by ord, now_pd - base_pd desc, category;

-- =========================================================================================================
-- D. CATEGORY LEADERBOARDS
-- =========================================================================================================

\echo
\echo === D1. Category leaderboard: every category ===
-- Every category at a glance: size, recent volume, growth, share of the company.
-- Read: last_30d / 90d / 365d are raw sums over windows ending :as_of. per_day_90d is the current run-rate;
-- qoq_pct compares it with the 90 days before, yoy_x with the same 90 days a year ago (base printed beside it).
select rollup, category, packages,
       lifetime,
       round(100.0 * lifetime / nullif(sum(lifetime) over (), 0), 1) as pct_of_company_lifetime,
       d30 as last_30d, d90 as last_90d, d365 as last_365d,
       round(100.0 * d365 / nullif(sum(d365) over (), 0), 1) as pct_of_company_365d,
       round(pd90) as per_day_90d,
       case when pd90_prev >= :min_base then round(100 * (pd90 / pd90_prev - 1), 1) end as qoq_pct,
       round(pd90_1y) as per_day_90d_1y_ago,
       case when pd90_1y >= :min_base then round(pd90 / pd90_1y, 2) end as yoy_x
from seg_leaderboard
order by d365 desc, lifetime desc;

\echo
\echo === D2. Category leaderboard: inside the cloud rollup only ===
-- The same table for the cloud product alone, with shares of the cloud ROLLUP instead of the company.
-- Reminder: the row with category = 'cloud' is one small category, not the rollup.
select category, packages, first_day,
       lifetime,
       round(100.0 * lifetime / nullif(sum(lifetime) over (), 0), 1) as pct_of_cloud_rollup_lifetime,
       d30 as last_30d, d90 as last_90d, d365 as last_365d,
       round(100.0 * d90 / nullif(sum(d90) over (), 0), 1) as pct_of_cloud_rollup_90d,
       round(pd90) as per_day_90d,
       case when pd90_prev >= :min_base then round(100 * (pd90 / pd90_prev - 1), 1) end as qoq_pct,
       round(pd90_1y) as per_day_90d_1y_ago,
       case when pd90_1y >= :min_base then round(pd90 / pd90_1y, 2) end as yoy_x
from seg_leaderboard
where rollup = 'cloud'
order by d365 desc, lifetime desc;

-- =========================================================================================================
-- E. INSIDE THE CLOUD ROLLUP: one category or broad?
-- =========================================================================================================

\echo
\echo === E1. Cloud rollup: per-day run-rate of each category by quarter (last 12 quarters) ===
-- Which categories make up the cloud product over time? One column per category, largest first.
-- Read: downloads per published day. A quarter marked * is partial.
select to_char(p.period, 'YYYY "Q"Q') || case when p.complete then '' else ' *' end as quarter,
       c.category,
       round(c.n::numeric / nullif(p.days, 0)) as per_day,
       dense_rank() over (order by t.total desc, c.category) as col_order
from seg_period p
join seg_cat_period c using (grain, period)
join (select category, sum(n) as total from g_daily where rollup = 'cloud' group by category) t using (category)
where p.grain = 'quarter' and c.rollup = 'cloud'
  and p.period >= date_trunc('quarter', :'as_of'::date) - interval '33 months'
order by p.period
\crosstabview quarter category per_day col_order

\echo
\echo === E2. Cloud rollup: share of each category by quarter, percent (last 12 quarters) ===
-- Is the cloud rollup one category or broad, and is that changing? Rows sum to 100.
select to_char(p.period, 'YYYY "Q"Q') || case when p.complete then '' else ' *' end as quarter,
       c.category,
       round(100.0 * c.n / sum(c.n) over (partition by p.period), 1) as pct_of_cloud_rollup,
       dense_rank() over (order by t.total desc, c.category) as col_order
from seg_period p
join seg_cat_period c using (grain, period)
join (select category, sum(n) as total from g_daily where rollup = 'cloud' group by category) t using (category)
where p.grain = 'quarter' and c.rollup = 'cloud'
  and p.period >= date_trunc('quarter', :'as_of'::date) - interval '33 months'
order by p.period
\crosstabview quarter category pct_of_cloud_rollup col_order

\echo
\echo === E3. Concentration: how many packages carry each rollup and category (last 90 days) ===
-- Is a segment broad, or is it one or two packages? Rollups first, then every category with downloads.
-- Read: top1_pct / top5_pct = share of the last 90 days from the biggest 1 / 5 packages; packages_for_80pct =
-- how many packages reach 80%. Packages in one dependency tree download together: one install, many counts.
with p as (
  select d.rollup, d.category, d.package_name, sum(d.n) as n
  from g_daily d
  join seg_window w on w.win = 90 and w.anchor = 'now' and d.date between w.d_from and w.d_to
  group by d.rollup, d.category, d.package_name
  having sum(d.n) > 0
), lvl as (
  select 1 as lvl_ord, 'rollup' as level, rollup, '(whole rollup)' as category, package_name, n from p
  union all
  select 2, 'category', rollup, category, package_name, n from p
), ranked as (
  select *,
         row_number() over (partition by level, rollup, category order by n desc, package_name) as rk,
         sum(n) over (partition by level, rollup, category) as total,
         sum(n) over (partition by level, rollup, category order by n desc, package_name
                      rows between unbounded preceding and current row) as running
  from lvl
)
select level, rollup, category,
       total as last_90d,
       count(*) as active_packages,
       max(package_name) filter (where rk = 1) as top_package,
       round(100.0 * max(n) filter (where rk = 1) / total, 1) as top1_pct,
       round(100.0 * sum(n) filter (where rk <= 5) / total, 1) as top5_pct,
       count(*) filter (where running - n < 0.8 * total) as packages_for_80pct
from ranked
group by lvl_ord, level, rollup, category, total
order by lvl_ord, total desc;

-- =========================================================================================================
-- F. MOMENTUM
-- =========================================================================================================

\echo
\echo === F1. Category momentum: at an all-time high now, or below its peak? ===
-- Which categories are running hotter than ever, and which are past their peak?
-- Read: 'all-time high' = the last 90 days beat the category's best COMPLETE quarter (pct_of_best >= 100);
-- otherwise below peak, growing or declining vs the same 90 days a year ago. 'negligible' = under :min_base.
select momentum, rollup, category,
       to_char(best_quarter, 'YYYY "Q"Q') as best_quarter,
       round(best_per_day) as best_quarter_per_day,
       round(pd90) as per_day_90d,
       round(100 * pd90 / nullif(best_per_day, 0)) as pct_of_best,
       round(pd90_1y) as per_day_90d_1y_ago,
       case when pd90_1y >= :min_base then round(pd90 / pd90_1y, 2) end as yoy_x,
       round(100.0 * d90 / nullif(sum(d90) over (), 0), 1) as pct_of_company_90d
from seg_momentum
order by array_position(array['all-time high', 'below peak, growing', 'below peak, declining', 'negligible'], momentum),
         pd90 desc;

\echo
\echo === F2. Momentum summary: how much of the current volume sits in each momentum bucket ===
-- Rolls F1 up: how many categories, and what share of the last 90 days, is at an all-time high vs past peak.
select momentum,
       count(*) as categories,
       count(*) filter (where rollup = 'cloud') as cloud_categories,
       count(*) filter (where rollup = 'chain') as chain_categories,
       count(*) filter (where rollup = 'utils') as utils_categories,
       sum(d90) as last_90d,
       round(100.0 * sum(d90) / nullif(sum(sum(d90)) over (), 0), 1) as pct_of_company_90d
from seg_momentum
group by momentum
order by array_position(array['all-time high', 'below peak, growing', 'below peak, declining', 'negligible'], momentum);
