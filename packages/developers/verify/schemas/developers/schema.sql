-- Verify schemas/developers/schema on pg

SELECT assert_schema('developers'::regnamespace);
