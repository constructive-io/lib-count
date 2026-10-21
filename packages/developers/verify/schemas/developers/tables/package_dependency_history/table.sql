-- Verify schemas/developers/tables/package_dependency_history/table on pg

SELECT assert_table('developers.package_dependency_history'::regclass);
SELECT assert_index('developers.package_dependency_history_target_package_id_idx'::regclass, 'developers.package_dependency_history'::regclass);
SELECT assert_index('developers.package_dependency_history_run_id_idx'::regclass, 'developers.package_dependency_history'::regclass);
