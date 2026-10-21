-- Verify schemas/developers/procedures/close_run on pg

SELECT assert_function('developers.close_run(uuid, text, jsonb, text)'::regprocedure);
