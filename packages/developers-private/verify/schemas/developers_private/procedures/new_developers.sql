-- Verify schemas/developers_private/procedures/new_developers on pg

SELECT assert_function('developers_private.new_developers(timestamptz)'::regprocedure);
