-- Deploy schemas/developers/views/current_dependents to pg

-- requires: schemas/developers/tables/dependency_edge/table
-- requires: schemas/developers/tables/package/table
-- requires: schemas/developers/tables/repository/table

CREATE VIEW developers.current_dependents AS

SELECT e.id AS edge_id,
       tp.name AS target_name,
       e.hop,
       e.dependent_kind,
       COALESCE(dp.name, r.full_name::text) AS dependent_key,
       e.dependent_package_id,
       e.dependent_repository_id,
       e.manifest_path,
       e.dep_type,
       e.version_range,
       e.first_seen_at,
       e.last_seen_at,
       r.is_fork,
       r.archived
FROM developers.dependency_edge e
JOIN developers.package tp ON tp.id = e.target_package_id
LEFT JOIN developers.package dp ON dp.id = e.dependent_package_id
LEFT JOIN developers.repository r ON r.id = e.dependent_repository_id
WHERE e.removed_at IS NULL;

COMMENT ON VIEW developers.current_dependents IS 'Edges currently believed present (removed_at IS NULL), with names resolved.';
