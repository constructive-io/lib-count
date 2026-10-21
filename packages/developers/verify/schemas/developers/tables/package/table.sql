-- Verify schemas/developers/tables/package/table on pg

SELECT assert_table('developers.package'::regclass);
