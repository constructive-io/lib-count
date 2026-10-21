-- Verify schemas/developers/procedures/repository_id on pg

SELECT assert_function('developers.repository_id(text, text)'::regprocedure);
