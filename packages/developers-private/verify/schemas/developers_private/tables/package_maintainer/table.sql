-- Verify schemas/developers_private/tables/package_maintainer/table on pg

SELECT assert_table('developers_private.package_maintainer'::regclass);
SELECT assert_index('developers_private.package_maintainer_account_id_idx'::regclass, 'developers_private.package_maintainer'::regclass);
SELECT assert_index('developers_private.package_maintainer_source_id_idx'::regclass, 'developers_private.package_maintainer'::regclass);
