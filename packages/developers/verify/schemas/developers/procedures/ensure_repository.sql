-- Verify schemas/developers/procedures/ensure_repository on pg

SELECT assert_function('developers.ensure_repository(text, text)'::regprocedure);
