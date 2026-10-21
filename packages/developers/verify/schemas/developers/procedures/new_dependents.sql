-- Verify schemas/developers/procedures/new_dependents on pg

SELECT assert_function('developers.new_dependents(timestamptz)'::regprocedure);
