-- Verify schemas/developers/tables/tracked_target/table on pg

SELECT assert_table('developers.tracked_target'::regclass);
