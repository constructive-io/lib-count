-- Verify schemas/developers/tables/target_count_snapshot/table on pg

SELECT assert_table('developers.target_count_snapshot'::regclass);
SELECT assert_index('developers.target_count_snapshot_source_id_idx'::regclass, 'developers.target_count_snapshot'::regclass);
SELECT assert_index('developers.target_count_snapshot_run_id_idx'::regclass, 'developers.target_count_snapshot'::regclass);
