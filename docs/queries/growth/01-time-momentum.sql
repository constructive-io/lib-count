-- Time and momentum: how fast downloads are growing, company-wide and per brand rollup.
--
--   psql postgresql://postgres:password@localhost:5432/stats_dev -f docs/queries/growth/01-time-momentum.sql
--   psql ... -v as_of=YYYY-MM-DD -f docs/queries/growth/01-time-momentum.sql     # re-run "as of" an earlier day
--   psql ... -v months_back=60 -v chart_weeks=500 --csv -f ... > out.csv          # longer history, for charts
--
-- Vocabulary used in every result:
--   scope          'all' = the company (personal projects excluded), then one row set per rollup: cloud / chain / utils.
--                  cloud is the Postgres + cloud product line; chain is the legacy Cosmos tooling.
--   days           published days / calendar days. npm published nothing on the missing days, so totals are floors.
--   per_day        downloads / published days. This is the run-rate; every growth figure is computed on it,
--                  never on raw sums, so a month with an npm outage is not penalised.
--   per_day_wkadj  weekday-balanced run-rate = (5 x mean weekday + 2 x mean weekend day) / 7. Weekends run at
--                  roughly half a weekday, so a period that lost only weekdays to an outage (or has five weekends)
--                  reads a few percent low on per_day. Use this column as the cross-check. Blank when the period
--                  has no published weekday or no published weekend day.
--   _pct           percent change.   _x  multiple (2.00 = doubled).
--   partial        the period contains :as_of and is not finished. Its per_day is usable, its total is not.
--
-- Growth figures are blank when the base run-rate is under :base_floor downloads/day (tiny bases make
-- multiples meaningless). Knobs, all overridable with -v:
--   base_floor (1000)  milestone_step (50000000)  months_back (24)  quarters_back (12)  chart_weeks (104)
--   company_start (2020-03-30)  the day the company was founded; query 13 counts years from it

\ir 00-setup.sql

\set QUIET on
\if :{?base_floor}
\else
  \set base_floor 1000
\endif
\if :{?milestone_step}
\else
  \set milestone_step 50000000
\endif
\if :{?months_back}
\else
  \set months_back 24
\endif
\if :{?quarters_back}
\else
  \set quarters_back 12
\endif
\if :{?chart_weeks}
\else
  \set chart_weeks 104
\endif
\if :{?company_start}
\else
  \set company_start 2020-03-30
\endif

-- One row per scope per PUBLISHED day. A rollup with no downloads on a published day gets 0 (a real zero);
-- days npm did not publish have no row at all.
create or replace temp view tm_day as
with r as (
  select date, rollup, sum(n)::bigint as n from g_daily group by date, rollup
), s as (
  select 'all' as scope, 0 as ord
  union all
  select rollup, case rollup when 'cloud' then 1 else 2 end from g_pkg where rollup <> 'personal' group by rollup
)
select s.scope, s.ord, d.date,
       case when s.scope = 'all' then d.n::bigint else coalesce(r.n, 0) end as n,
       extract(isodow from d.date) >= 6 as weekend
from g_days d
cross join s
left join r on r.date = d.date and r.rollup = s.scope;

-- One row per scope per month / quarter / year, with day counts, run-rates and the partial flag.
create or replace temp view tm_period as
with g(grain, len) as (values ('month', interval '1 month'), ('quarter', interval '3 months'), ('year', interval '1 year')),
cal as (
  select g.grain, date_trunc(g.grain, c.date)::date as period,
         count(*) as cal_days, count(*) filter (where c.published) as pub_days
  from g_calendar c cross join g
  group by 1, 2
), agg as (
  select g.grain, g.len, t.scope, t.ord, date_trunc(g.grain, t.date)::date as period,
         sum(t.n) as downloads,
         (5 * avg(t.n) filter (where not t.weekend) + 2 * avg(t.n) filter (where t.weekend)) / 7 as per_day_wkadj
  from tm_day t cross join g
  group by 1, 2, 3, 4, 5
)
select a.grain, a.scope, a.ord, a.period, c.cal_days, c.pub_days, a.downloads,
       a.downloads / c.pub_days as per_day,
       a.per_day_wkadj,
       (a.period + a.len)::date - 1 > :'as_of'::date as partial
from agg a
join cal c using (grain, period);
\set QUIET off


\echo
\echo == 1. Coverage and all-time totals ==
-- Sanity check and denominator for everything below: what the data covers and the all-time total per scope.
-- missing_days are calendar days with no downloads recorded since the scope's first download. In the earliest,
-- tiny months these are mostly real zero-download days; later ones are days npm published nothing.
select t.scope,
       to_char(sum(t.n), 'FM999,999,999,999')                         as all_time_downloads,
       round(100 * sum(t.n) / (select sum(n) from g_days), 1)         as pct_of_company,
       min(t.date) filter (where t.n > 0)                             as first_download,
       max(t.date)                                                    as last_day,
       count(*) filter (where t.date >= min_d.d)                      as published_days,
       (max(t.date) - min_d.d + 1) - count(*) filter (where t.date >= min_d.d) as missing_days
from tm_day t
join (select scope, min(date) filter (where n > 0) as d from tm_day group by scope) min_d using (scope)
group by t.scope, t.ord, min_d.d
order by t.ord, t.scope;


\echo
\echo == 2. Run-rate today, annualised ==
-- "How big is this right now?" Average downloads per published day over the last 7 and 28 calendar days,
-- and the 28-day figure x 365. annualised_vs_last_365d_x > 1 means the current pace is ahead of the actual
-- trailing year. months_to_repeat_all_time = how long the current pace needs to equal the whole history;
-- days_per_milestone_step = how long it needs to add another :milestone_step downloads (see query 8).
with s as (
  select scope, ord,
         sum(n)                                                       as all_time,
         sum(n) filter (where date > :'as_of'::date - 365)            as last_365d,
         avg(n) filter (where date > :'as_of'::date - 7)              as rr7,
         count(*) filter (where date > :'as_of'::date - 7)            as pub7,
         avg(n) filter (where date > :'as_of'::date - 28)             as rr28,
         count(*) filter (where date > :'as_of'::date - 28)           as pub28
  from tm_day
  group by scope, ord
)
select scope,
       to_char(round(rr7), 'FM999,999,999,999')                       as per_day_7d,
       to_char(round(rr28), 'FM999,999,999,999')                      as per_day_28d,
       pub7 || '/7, ' || pub28 || '/28'                               as days,
       to_char(round(rr28 * 365), 'FM999,999,999,999')                as annualised_28d,
       to_char(last_365d, 'FM999,999,999,999')                        as actual_last_365d,
       round(rr28 * 365 / nullif(last_365d, 0), 2)                    as annualised_vs_last_365d_x,
       to_char(all_time, 'FM999,999,999,999')                         as all_time,
       round(all_time / nullif(rr28 * 365 / 12, 0), 1)                as months_to_repeat_all_time,
       round(:milestone_step / nullif(rr28, 0))                       as days_per_milestone_step
from s
order by ord, scope;


\echo
\echo == 3. Trailing windows vs the window before and vs a year earlier ==
-- "Is the latest stretch faster than the one before it, and than the same stretch last year?"
-- Windows are whole weeks (7 / 28 / 91 / 364 days) and "a year earlier" is 364 days back, so each side of a
-- comparison has the same weekday mix. days = published days in current / previous / year-earlier window.
-- For the 364-day window the previous window IS the year-earlier window.
with w(len) as (values (7), (28), (91), (364)),
b as (
  select w.len, x.which,
         :'as_of'::date - x.back - w.len + 1 as d0,
         :'as_of'::date - x.back             as d1
  from w cross join lateral (values ('cur', 0), ('prev', w.len), ('yago', 364)) x(which, back)
), a as (
  select b.len, b.which, t.scope, t.ord,
         count(*) as pub_days, sum(t.n) as downloads, avg(t.n) as per_day,
         (5 * avg(t.n) filter (where not t.weekend) + 2 * avg(t.n) filter (where t.weekend)) / 7 as per_day_wkadj
  from b join tm_day t on t.date between b.d0 and b.d1
  group by 1, 2, 3, 4
), p as (
  select scope, ord, len,
         max(pub_days)      filter (where which = 'cur')  as d_cur,
         max(pub_days)      filter (where which = 'prev') as d_prev,
         max(pub_days)      filter (where which = 'yago') as d_yago,
         max(downloads)     filter (where which = 'cur')  as downloads,
         max(per_day)       filter (where which = 'cur')  as cur,
         max(per_day_wkadj) filter (where which = 'cur')  as cur_wkadj,
         max(per_day)       filter (where which = 'prev') as prev,
         max(per_day)       filter (where which = 'yago') as yago
  from a group by 1, 2, 3
)
select scope,
       'last ' || len || 'd'                                          as time_window,
       d_cur || ' / ' || coalesce(d_prev, 0) || ' / ' || coalesce(d_yago, 0) as days,
       to_char(downloads, 'FM999,999,999,999')                        as downloads,
       to_char(round(cur), 'FM999,999,999,999')                       as per_day,
       to_char(round(cur_wkadj), 'FM999,999,999,999')                 as per_day_wkadj,
       to_char(round(prev), 'FM999,999,999,999')                      as per_day_prev_window,
       case when prev >= :base_floor then round(100 * (cur / prev - 1), 1) end as vs_prev_pct,
       to_char(round(yago), 'FM999,999,999,999')                      as per_day_year_earlier,
       case when yago >= :base_floor then round(cur / yago, 2) end    as yoy_x
from p
order by ord, scope, len;


\echo
\echo == 4. Monthly downloads and run-rate (last :months_back months) ==
-- The core table. Read per_day (not downloads) across rows; mom_pct and yoy_x are computed on per_day.
-- pct_of_company shows the mix shifting toward cloud. The last row per scope is the partial month.
with p as (select * from tm_period where grain = 'month')
select p.scope,
       to_char(p.period, 'YYYY-MM')                                   as month,
       p.pub_days || '/' || p.cal_days                                as days,
       to_char(p.downloads, 'FM999,999,999,999')                      as downloads,
       to_char(round(p.per_day), 'FM999,999,999,999')                 as per_day,
       to_char(round(p.per_day_wkadj), 'FM999,999,999,999')           as per_day_wkadj,
       case when prev.per_day >= :base_floor then round(100 * (p.per_day / prev.per_day - 1), 1) end as mom_pct,
       case when ya.per_day >= :base_floor then round(p.per_day / ya.per_day, 2) end as yoy_x,
       round(100 * p.downloads / nullif(co.downloads, 0), 1)          as pct_of_company,
       case when p.partial then 'partial' else '' end                 as note
from p
join p co on co.scope = 'all' and co.period = p.period
left join p prev on prev.scope = p.scope and prev.period = (p.period - interval '1 month')::date
left join p ya   on ya.scope = p.scope   and ya.period = (p.period - interval '1 year')::date
where p.period > (date_trunc('month', :'as_of'::date) - make_interval(months => :months_back))::date
order by p.ord, p.scope, p.period;


\echo
\echo == 5. Quarterly downloads and run-rate (last :quarters_back quarters) ==
-- Same as the monthly table at quarter grain: smoother, and the grain investors usually ask for.
-- qoq_pct and yoy_x are computed on per_day. The last row per scope is the partial quarter.
with p as (select * from tm_period where grain = 'quarter')
select p.scope,
       to_char(p.period, 'YYYY-"Q"Q')                                 as quarter,
       p.pub_days || '/' || p.cal_days                                as days,
       to_char(p.downloads, 'FM999,999,999,999')                      as downloads,
       to_char(round(p.per_day), 'FM999,999,999,999')                 as per_day,
       case when prev.per_day >= :base_floor then round(100 * (p.per_day / prev.per_day - 1), 1) end as qoq_pct,
       case when ya.per_day >= :base_floor then round(p.per_day / ya.per_day, 2) end as yoy_x,
       round(100 * p.downloads / nullif(co.downloads, 0), 1)          as pct_of_company,
       case when p.partial then 'partial' else '' end                 as note
from p
join p co on co.scope = 'all' and co.period = p.period
left join p prev on prev.scope = p.scope and prev.period = (p.period - interval '3 months')::date
left join p ya   on ya.scope = p.scope   and ya.period = (p.period - interval '1 year')::date
where p.period > (date_trunc('quarter', :'as_of'::date) - make_interval(months => 3 * :quarters_back))::date
order by p.ord, p.scope, p.period;


\echo
\echo == 6. Calendar years, and year-to-date vs the same stretch of earlier years ==
-- Left half: each full calendar year (yoy_x on per_day; blank for the partial current year).
-- Right half: 1 Jan through the same day-of-year as :as_of, for every year, so the current year can be
-- compared like for like (ytd_yoy_x). ytd_vs_prior_full_year_x = this year's YTD total / last year's FULL total.
with y as (select * from tm_period where grain = 'year'),
ytd as (
  select t.scope, date_trunc('year', t.date)::date as period,
         count(*) as pub_days, sum(t.n) as downloads, avg(t.n) as per_day
  from tm_day t
  where t.date - date_trunc('year', t.date)::date <= :'as_of'::date - date_trunc('year', :'as_of'::date)::date
  group by 1, 2
)
select y.scope,
       to_char(y.period, 'YYYY')                                      as year,
       y.pub_days || '/' || y.cal_days                                as days,
       to_char(y.downloads, 'FM999,999,999,999')                      as downloads,
       to_char(round(y.per_day), 'FM999,999,999,999')                 as per_day,
       case when not y.partial and py.per_day >= :base_floor then round(y.per_day / py.per_day, 2) end as yoy_x,
       d.pub_days                                                     as ytd_days,
       to_char(d.downloads, 'FM999,999,999,999')                      as ytd_downloads,
       to_char(round(d.per_day), 'FM999,999,999,999')                 as ytd_per_day,
       case when pd.per_day >= :base_floor then round(d.per_day / pd.per_day, 2) end as ytd_yoy_x,
       case when py.per_day >= :base_floor then round(d.downloads / py.downloads, 2) end as ytd_vs_prior_full_year_x,
       case when y.partial then 'partial' else '' end                 as note
from y
left join y py    on py.scope = y.scope and py.period = (y.period - interval '1 year')::date
left join ytd d   on d.scope = y.scope  and d.period = y.period
left join ytd pd  on pd.scope = y.scope and pd.period = (y.period - interval '1 year')::date
where y.downloads > 0
order by y.ord, y.scope, y.period;


\echo
\echo == 7. Compound monthly growth rate over the last 3 / 6 / 12 complete months ==
-- "What steady monthly growth rate explains the last N months?" Uses per_day of complete months only.
-- cmgr_pct joins the two end months; cmgr_fit_pct is a log-linear fit through all N+1 months and is the
-- one to trust when an end month is unusual. annualised_x = 12 months at cmgr_pct (an extrapolation, not a
-- forecast; the 3-month row especially). doubling_months is blank when the rate is not positive.
with m as (
  select scope, ord, period, per_day,
         row_number() over (partition by scope order by period desc) - 1 as k
  from tm_period
  where grain = 'month' and not partial
), w(n) as (values (3), (6), (12)),
e as (
  select m1.scope, m1.ord, w.n, m0.period as from_month, m1.period as to_month,
         m0.per_day as start_rr, m1.per_day as end_rr,
         power(m1.per_day / nullif(m0.per_day, 0), 1.0 / w.n) - 1 as cmgr,
         (select exp(regr_slope(ln(f.per_day), -f.k)) - 1
          from m f where f.scope = m1.scope and f.k <= w.n and f.per_day > 0) as cmgr_fit
  from w
  join m m1 on m1.k = 0
  join m m0 on m0.scope = m1.scope and m0.k = w.n
  where m0.per_day >= :base_floor
)
select scope,
       n                                                              as months,
       to_char(from_month, 'YYYY-MM') || ' -> ' || to_char(to_month, 'YYYY-MM') as span,
       to_char(round(start_rr), 'FM999,999,999,999')                  as per_day_start,
       to_char(round(end_rr), 'FM999,999,999,999')                    as per_day_end,
       round(end_rr / start_rr, 2)                                    as growth_x,
       round(100 * cmgr, 1)                                           as cmgr_pct,
       round((100 * cmgr_fit)::numeric, 1)                            as cmgr_fit_pct,
       round(power(1 + cmgr, 12.0), 1)                                as annualised_x,
       case when cmgr > 0 then round(ln(2.0) / ln(1 + cmgr), 1) end   as doubling_months
from e
order by ord, scope, n;


\echo
\echo == 8. Milestones: when each :milestone_step cumulative downloads was reached ==
-- "Is each block of downloads arriving faster than the last?" days_to_earn is calendar days since the
-- previous mark (for the first mark: since the scope's first download). Shrinking days_to_earn = acceleration.
-- npm_missing_days = days inside the span with no data: their downloads are lost, so the cumulative is a
-- floor and a span with many missing days looks slower than it was.
with c as (
  select scope, ord, date, n,
         sum(n) over (partition by scope order by date) as cum,
         min(date) filter (where n > 0) over (partition by scope) as first_day
  from tm_day
), x as (
  select c.scope, c.ord, c.date, c.first_day, k.k * :milestone_step::bigint as milestone
  from c
  cross join lateral generate_series(floor((c.cum - c.n) / :milestone_step)::int + 1,
                                     floor(c.cum / :milestone_step)::int) k(k)
), g as (
  select x.*, coalesce(lag(x.date) over (partition by x.scope order by x.milestone), x.first_day) as prev_date
  from x
), h as (
  select g.*, g.date - g.prev_date as days_to_earn,
         (select count(*) from g_calendar c
          where not c.published and c.date > g.prev_date and c.date <= g.date) as npm_missing_days
  from g
)
select scope,
       to_char(milestone, 'FM999,999,999,999')                        as cumulative_downloads,
       date                                                           as reached_on,
       days_to_earn,
       npm_missing_days,
       to_char(round(:milestone_step::numeric / nullif(days_to_earn, 0)), 'FM999,999,999,999') as avg_per_calendar_day,
       round(lag(days_to_earn) over (partition by scope order by milestone)::numeric / nullif(days_to_earn, 0), 1) as speedup_vs_prev_x,
       :'as_of'::date - date                                          as days_ago
from h
order by ord, scope, milestone;


\echo
\echo == 9. Share of all-time downloads earned recently ==
-- "How much of the lifetime total is new?" Trailing 12 months, 6 months and 90 days ending :as_of, as
-- downloads and as a percent of the scope's all-time total. Over 50% in 12 months = the last year
-- out-earned all prior history.
select scope,
       to_char(sum(n), 'FM999,999,999,999')                           as all_time,
       to_char(sum(n) filter (where date > (:'as_of'::date - interval '12 months')), 'FM999,999,999,999') as last_12m,
       round(100 * sum(n) filter (where date > (:'as_of'::date - interval '12 months')) / nullif(sum(n), 0), 1) as last_12m_pct,
       to_char(sum(n) filter (where date > (:'as_of'::date - interval '6 months')), 'FM999,999,999,999') as last_6m,
       round(100 * sum(n) filter (where date > (:'as_of'::date - interval '6 months')) / nullif(sum(n), 0), 1) as last_6m_pct,
       to_char(sum(n) filter (where date > :'as_of'::date - 90), 'FM999,999,999,999') as last_90d,
       round(100 * sum(n) filter (where date > :'as_of'::date - 90) / nullif(sum(n), 0), 1) as last_90d_pct,
       count(*) filter (where date > :'as_of'::date - 90) || '/90'    as days_90d
from tm_day
group by scope, ord
order by ord, scope;


\echo
\echo == 10. Record highs ==
-- "When were the best day, best week and best month?" days_ago near 0 means records are being set now.
-- Best 7-day average only counts windows where all 7 days were published. Best month uses complete months;
-- the per-day row is the fair one, the total row is a floor for months with npm outages.
with d as (
  select scope, ord, date, n,
         avg(n)   over (partition by scope order by date range between interval '6 days' preceding and current row) as avg7,
         count(*) over (partition by scope order by date range between interval '6 days' preceding and current row) as cnt7
  from tm_day
), m as (
  select scope, ord, period, per_day, downloads from tm_period where grain = 'month' and not partial
), r as (
  (select distinct on (scope) scope, ord, 1 as o, 'best day' as record, date as on_date, to_char(date, 'YYYY-MM-DD') as label, n::numeric as value
   from d order by scope, n desc, date desc)
  union all
  (select distinct on (scope) scope, ord, 2, 'best 7-day average (per day)', date, to_char(date - 6, 'YYYY-MM-DD') || ' to ' || to_char(date, 'MM-DD'), avg7
   from d where cnt7 = 7 order by scope, avg7 desc, date desc)
  union all
  (select distinct on (scope) scope, ord, 3, 'best complete month (per day)', (period + interval '1 month')::date - 1, to_char(period, 'YYYY-MM'), per_day
   from m order by scope, per_day desc, period desc)
  union all
  (select distinct on (scope) scope, ord, 4, 'best complete month (total)', (period + interval '1 month')::date - 1, to_char(period, 'YYYY-MM'), downloads
   from m order by scope, downloads desc, period desc)
)
select scope, record, label as period,
       to_char(round(value), 'FM999,999,999,999')                     as downloads,
       :'as_of'::date - on_date                                       as days_ago
from r
order by ord, scope, o;


\echo
\echo == 11. How recent are the best periods? ==
-- top10_months_in_last_12: of the 10 best complete months ever (by per_day), how many fall in the last 12.
-- record_months_in_last_12: how many of the last 12 complete months set a new all-time high when they happened.
-- yoy_up_streak_months: consecutive complete months, counting back from the latest, that beat the same month
-- a year earlier. top10_days_in_last_90d: of the 10 best days ever, how many are in the last 90 days.
with m as (
  select p.scope, p.ord, p.period, p.per_day,
         rank()       over (partition by p.scope order by p.per_day desc) as rk,
         row_number() over (partition by p.scope order by p.period desc)  as recency,
         p.per_day > coalesce(max(p.per_day) over (partition by p.scope order by p.period
                                                   rows between unbounded preceding and 1 preceding), 0) as new_high,
         p.per_day > ya.per_day as yoy_up
  from tm_period p
  left join tm_period ya on ya.grain = 'month' and ya.scope = p.scope and ya.period = (p.period - interval '1 year')::date
  where p.grain = 'month' and not p.partial
), d as (
  select scope, date, rank() over (partition by scope order by n desc) as rk from tm_day
)
select m.scope,
       count(*) filter (where m.rk <= 10 and m.recency <= 12)         as top10_months_in_last_12,
       count(*) filter (where m.new_high and m.recency <= 12)         as record_months_in_last_12,
       coalesce(min(m.recency) filter (where m.yoy_up is not true), count(*) + 1) - 1 as yoy_up_streak_months,
       (select count(*) from d where d.scope = m.scope and d.rk <= 10 and d.date > :'as_of'::date - 90) as top10_days_in_last_90d
from m
group by m.scope, m.ord
order by m.ord, m.scope;


\echo
\echo == 12. Smoothed run-rate series for charting (weekly points, last :chart_weeks weeks) ==
-- One row per week, ending on the weekday of :as_of. Each value is the average per published day over the
-- trailing 7 or 28 calendar days; *_annualised_m is the 28-day run-rate x 365, in millions of downloads/year.
-- Chart all_28d and cloud_28d on a log axis; days_28d < 28 marks windows thinned by npm outages. The 7-day
-- columns are blank when any of the 7 days is missing (a week without its weekdays would read falsely low).
-- For a spreadsheet, run the file with --csv -v chart_weeks=500 and keep this last block.
with pts as (
  select date as week_ending
  from g_calendar
  where (:'as_of'::date - date) % 7 = 0
    and date > :'as_of'::date - 7 * :chart_weeks
), a as (
  select pts.week_ending, t.scope,
         count(*)                                                     as days28,
         avg(t.n)                                                     as avg28,
         case when count(*) filter (where t.date > pts.week_ending - 7) = 7
              then avg(t.n) filter (where t.date > pts.week_ending - 7) end as avg7
  from pts
  join tm_day t on t.date between pts.week_ending - 27 and pts.week_ending
  group by 1, 2
)
select week_ending,
       max(days28) filter (where scope = 'all')                       as days_28d,
       round(max(avg7)  filter (where scope = 'all'))                 as all_7d,
       round(max(avg28) filter (where scope = 'all'))                 as all_28d,
       round(max(avg28) filter (where scope = 'all') * 365 / 1e6, 1)  as all_annualised_m,
       round(max(avg7)  filter (where scope = 'cloud'))               as cloud_7d,
       round(max(avg28) filter (where scope = 'cloud'))               as cloud_28d,
       round(max(avg28) filter (where scope = 'cloud') * 365 / 1e6, 1) as cloud_annualised_m,
       round(100 * max(avg28) filter (where scope = 'cloud') / nullif(max(avg28) filter (where scope = 'all'), 0), 1) as cloud_pct,
       round(max(avg28) filter (where scope = 'chain'))               as chain_28d,
       round(max(avg28) filter (where scope = 'utils'))               as utils_28d
from a
group by week_ending
order by week_ending;


\echo
\echo == 13. Company years: growth counted from the founding date (:company_start) ==
-- The open-source packages are older than the company, and the first years are tiny, so multiples that start
-- in 2017 mean nothing. This counts years from :company_start instead: year 1 is the first 12 months of the
-- company, and year 0 is everything before it. yoy_x compares per_day with the year before (blank under
-- :base_floor). The last year is partial; its per_day is usable, its total is not. since_year1_x is the
-- per_day multiple over year 1, and per_year_x is that multiple expressed as an average rate per year.
with d as (
  select t.scope, t.ord, t.date, t.n,
         case when t.date < :'company_start'::date then 0
              else extract(year from age(t.date, :'company_start'::date))::int + 1 end as company_year
  from tm_day t
), y as (
  select scope, ord, company_year, min(date) as d_from, max(date) as d_to,
         count(*) as pub_days, sum(n) as downloads, avg(n) as per_day
  from d group by scope, ord, company_year
), z as (
  select y.*, lag(per_day) over w as prev_per_day,
         (select y1.per_day from y y1 where y1.scope = y.scope and y1.company_year = 1) as year1_per_day,
         :'as_of'::date < (:'company_start'::date + make_interval(years => company_year))::date - 1
           and company_year > 0 as partial
  from y window w as (partition by scope order by company_year)
)
select scope,
       company_year,
       d_from, d_to, pub_days,
       to_char(downloads, 'FM999,999,999,999')        as downloads,
       to_char(round(per_day), 'FM999,999,999,999')   as per_day,
       case when company_year > 1 and prev_per_day >= :base_floor then round(per_day / prev_per_day, 2) end as yoy_x,
       case when company_year > 1 and year1_per_day > 0 then round(per_day / year1_per_day, 1) end          as since_year1_x,
       case when company_year > 1 and year1_per_day > 0
            then round(power(per_day / year1_per_day, 1.0 / (company_year - 1))::numeric, 2) end             as per_year_x,
       case when partial then 'partial' else '' end   as note
from z
order by ord, scope, company_year;

