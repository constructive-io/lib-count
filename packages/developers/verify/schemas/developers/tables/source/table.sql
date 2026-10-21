-- Verify schemas/developers/tables/source/table on pg

SELECT assert_table('developers.source'::regclass);
