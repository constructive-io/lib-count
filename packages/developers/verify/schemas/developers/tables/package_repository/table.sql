-- Verify schemas/developers/tables/package_repository/table on pg

SELECT assert_table('developers.package_repository'::regclass);
SELECT assert_index('developers.package_repository_repository_id_idx'::regclass, 'developers.package_repository'::regclass);
SELECT assert_index('developers.package_repository_source_id_idx'::regclass, 'developers.package_repository'::regclass);
