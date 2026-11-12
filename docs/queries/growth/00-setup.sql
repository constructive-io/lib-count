-- Shared setup for the growth queries. Every other file in this folder starts with `\ir 00-setup.sql`.
--
--   psql postgresql://postgres:password@localhost:5432/stats_dev -f docs/queries/growth/01-time-momentum.sql
--   psql ... -v as_of=2026-11-10 -f docs/queries/growth/01-time-momentum.sql    # pin the "today" of the analysis
--
-- It only creates TEMP views, so it is read-only and safe to run against any copy of stats_dev.
-- Refresh the data first with ./update_stats.sh --no-pr.
--
-- Rules every query in this folder follows:
--   1. Company numbers exclude the personal categories (rollup 'personal'). Use g_daily, not npm_count.daily_downloads.
--   2. Totals are floors, for two reasons. Compare periods per published day (sum / published days), never
--      by raw sums, and show the day counts next to any total.
--        a. npm outages: npm published nothing for a day. The day has no rows at all (the fetcher never
--           stores npm's 0 for an unpublished day).
--        b. Stale zeros: older fetches did store a 0 when they ran before npm had published the day, and
--           those rows were never refreshed. The day counts as published but is hollow.
--      04-quality-robustness.sql section A lists both kinds and estimates what they hide.
--   3. The period that contains :as_of is partial. Flag it or leave it out; never compare it raw to a full period.
--   4. Rollups (cloud / chain / utils / personal) mirror brandRollupFor() in
--      packages/stats-db/src/config/categories.ts. If that file changes, change g_pkg below.

\set QUIET on
\pset pager off
\if :{?as_of}
\else
  select max(date) as as_of from npm_count.daily_downloads \gset
\endif

-- One row per package: its category and brand rollup. Every package has exactly one category.
create or replace temp view g_pkg as
select p.package_name,
       c.name as category,
       case
         when c.name in ('math') then 'personal'
         when c.name in ('cosmology','cosmos-kit','cosmos-kit-wallets','create-cosmos-app','interchain-kit',
                         'interchain-kit-wallets','interchain-js','interchain-ui','chain-registry','telescope',
                         'cosmwasm','hyperwebjs','protobufs','starship','osmosis','juno','stride','stargaze',
                         'dydx','quicksilver','chain','boilerplates') then 'chain'
         when c.name in ('utils','misc') then 'utils'
         else 'cloud'
       end as rollup,
       p.creation_date
from npm_count.npm_package p
join npm_count.package_category pc on pc.package_id = p.package_name
join npm_count.category c on c.id = pc.category_id;

-- Company downloads per package per day, up to :as_of. Personal projects are excluded.
create or replace temp view g_daily as
select d.date, d.package_name, k.category, k.rollup, d.download_count as n
from npm_count.daily_downloads d
join g_pkg k using (package_name)
where k.rollup <> 'personal' and d.date <= :'as_of'::date;

-- Days with company downloads: the company total per day. A day with no row here is either an npm outage
-- (no rows stored) or a quiet day where every stored row is 0 (2017-18, when only a few packages existed).
-- 04-quality-robustness.sql query A1 tells them apart.
create or replace temp view g_days as
select date, sum(n) as n from g_daily group by date having sum(n) > 0;

-- Every calendar day from the first data day to :as_of. published = the day has a row in g_days.
create or replace temp view g_calendar as
select s::date as date, (d.date is not null) as published
from generate_series((select min(date) from g_days), :'as_of'::date, '1 day') s
left join g_days d on d.date = s::date;

\set QUIET off
\echo as_of = :as_of
