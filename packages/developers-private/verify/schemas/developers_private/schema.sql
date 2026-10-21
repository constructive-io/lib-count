-- Verify schemas/developers_private/schema on pg

SELECT assert_schema('developers_private'::regnamespace);
