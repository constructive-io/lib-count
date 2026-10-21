-- Deploy schemas/developers/views/transitive_reach to pg

-- requires: schemas/developers/views/our_package
-- requires: schemas/developers/tables/dependency_edge/table
-- requires: schemas/developers/tables/target_count_snapshot/table

CREATE VIEW developers.transitive_reach AS

SELECT o.package_id, o.name AS target_name,
       (SELECT count(*) FROM developers.dependency_edge e WHERE e.target_package_id = o.package_id AND e.hop = 1 AND e.removed_at IS NULL) AS direct_dependents,
       (SELECT count(DISTINCT e2.dependent_package_id) FROM developers.dependency_edge e1
          JOIN developers.dependency_edge e2 ON e2.target_package_id = e1.dependent_package_id AND e2.hop = 2 AND e2.removed_at IS NULL
         WHERE e1.target_package_id = o.package_id AND e1.hop = 1 AND e1.removed_at IS NULL) AS hop2_dependents,
       (SELECT s.indirect_count FROM developers.target_count_snapshot s WHERE s.package_id = o.package_id AND s.source_id = 'depsdev' ORDER BY s.observed_on DESC LIMIT 1) AS depsdev_indirect_count
FROM developers.our_package o;

COMMENT ON VIEW developers.transitive_reach IS 'Direct and bounded second-hop reach per our package, with the latest deps.dev indirect count for comparison.';
