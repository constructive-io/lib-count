-- Verify schemas/developers/procedures/start_run on pg

SELECT assert_function('developers.start_run(text, text, text[], integer, jsonb, text)'::regprocedure);
