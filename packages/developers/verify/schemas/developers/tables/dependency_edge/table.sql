-- Verify schemas/developers/tables/dependency_edge/table on pg

SELECT assert_table('developers.dependency_edge'::regclass);
SELECT assert_index('developers.dependency_edge_target_package_id_idx'::regclass, 'developers.dependency_edge'::regclass);
SELECT assert_index('developers.dependency_edge_dependent_package_id_idx'::regclass, 'developers.dependency_edge'::regclass);
SELECT assert_index('developers.dependency_edge_dependent_repository_id_idx'::regclass, 'developers.dependency_edge'::regclass);
SELECT assert_index('developers.dependency_edge_removed_by_run_id_idx'::regclass, 'developers.dependency_edge'::regclass);
SELECT assert_index('developers.dependency_edge_current_idx'::regclass, 'developers.dependency_edge'::regclass);
