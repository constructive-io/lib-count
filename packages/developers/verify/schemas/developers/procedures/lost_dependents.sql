-- Verify schemas/developers/procedures/lost_dependents on pg

SELECT assert_function('developers.lost_dependents(timestamptz)'::regprocedure);
