-- Deploy schemas/developers/views/adoption_by_week to pg

-- requires: schemas/developers/views/our_package
-- requires: schemas/developers/tables/dependency_edge/table
-- requires: npm:npm

CREATE VIEW developers.adoption_by_week AS

WITH weeks AS (
  SELECT date_trunc('week', d)::date AS week_start
  FROM generate_series(date_trunc('week', (SELECT min(first_seen_at) FROM developers.dependency_edge)), date_trunc('week', now()), interval '1 week') AS d
)
SELECT o.package_id, o.name AS target_name, w.week_start,
       (SELECT count(*) FROM developers.dependency_edge e
         WHERE e.target_package_id = o.package_id AND e.hop = 1
           AND e.first_seen_at < w.week_start + 7
           AND (e.removed_at IS NULL OR e.removed_at >= w.week_start + 7)) AS dependents,
       (SELECT sum(dd.download_count) FROM npm_count.daily_downloads dd
         WHERE dd.package_name = o.name AND dd.date >= w.week_start AND dd.date < w.week_start + 7) AS downloads
FROM developers.our_package o
CROSS JOIN weeks w;

COMMENT ON VIEW developers.adoption_by_week IS 'Per our package per ISO week: how many hop-1 dependents were present vs our npm downloads that week (npm_count.daily_downloads).';
