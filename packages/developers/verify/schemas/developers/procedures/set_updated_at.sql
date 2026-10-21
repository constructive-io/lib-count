-- Verify schemas/developers/procedures/set_updated_at on pg

SELECT assert_function('developers.set_updated_at()'::regprocedure);
