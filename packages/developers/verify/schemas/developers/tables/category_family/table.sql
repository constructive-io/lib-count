-- Verify schemas/developers/tables/category_family/table on pg

SELECT assert_table('developers.category_family'::regclass);
