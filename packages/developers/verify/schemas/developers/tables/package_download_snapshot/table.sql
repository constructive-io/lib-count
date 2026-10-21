-- Verify schemas/developers/tables/package_download_snapshot/table on pg

SELECT assert_table('developers.package_download_snapshot'::regclass);
SELECT assert_index('developers.package_download_snapshot_run_id_idx'::regclass, 'developers.package_download_snapshot'::regclass);
