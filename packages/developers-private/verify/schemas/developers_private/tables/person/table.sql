-- Verify schemas/developers_private/tables/person/table on pg

SELECT assert_table('developers_private.person'::regclass);
