-- Verify schemas/developers/procedures/package_id on pg

SELECT assert_function('developers.package_id(text, text)'::regprocedure);
