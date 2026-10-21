-- Verify schemas/developers/procedures/ensure_package on pg

SELECT assert_function('developers.ensure_package(text, text)'::regprocedure);
