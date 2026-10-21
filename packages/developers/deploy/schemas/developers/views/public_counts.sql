-- Deploy schemas/developers/views/public_counts to pg

-- requires: schemas/developers/views/our_package
-- requires: schemas/developers/tables/dependency_edge/table

CREATE VIEW developers.public_counts AS

SELECT o.name AS package_name,
       count(*) FILTER (WHERE e.dependent_kind = 'package') AS dependent_packages,
       count(*) FILTER (WHERE e.dependent_kind = 'repository') AS dependent_repositories
FROM developers.our_package o
LEFT JOIN developers.dependency_edge e ON e.target_package_id = o.package_id AND e.hop = 1 AND e.removed_at IS NULL
GROUP BY o.name;

COMMENT ON VIEW developers.public_counts IS 'PII-free aggregate: current dependent package and repository counts per our package. The only view that may ever be published, and only after approval.';
