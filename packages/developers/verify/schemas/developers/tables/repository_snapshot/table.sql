-- Verify schemas/developers/tables/repository_snapshot/table on pg

SELECT assert_table('developers.repository_snapshot'::regclass);
SELECT assert_index('developers.repository_snapshot_run_id_idx'::regclass, 'developers.repository_snapshot'::regclass);
