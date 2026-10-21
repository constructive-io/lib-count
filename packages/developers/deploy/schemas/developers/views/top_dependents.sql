-- Deploy schemas/developers/views/top_dependents to pg

-- requires: schemas/developers/views/current_dependents
-- requires: schemas/developers/tables/package_download_snapshot/table
-- requires: schemas/developers/tables/repository_snapshot/table

CREATE VIEW developers.top_dependents AS

SELECT c.*,
       (SELECT s.downloads FROM developers.package_download_snapshot s WHERE s.package_id = c.dependent_package_id AND s.period = 'last-week' ORDER BY s.window_end DESC LIMIT 1) AS weekly_downloads,
       (SELECT rs.stars FROM developers.repository_snapshot rs WHERE rs.repository_id = c.dependent_repository_id ORDER BY rs.observed_on DESC LIMIT 1) AS stars
FROM developers.current_dependents c
WHERE c.hop = 1;

COMMENT ON VIEW developers.top_dependents IS 'Current hop-1 dependents with their latest weekly downloads (packages) or stars (repositories) for ranking.';
