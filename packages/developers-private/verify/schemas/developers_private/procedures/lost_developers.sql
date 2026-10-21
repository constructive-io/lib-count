-- Verify schemas/developers_private/procedures/lost_developers on pg

SELECT assert_function('developers_private.lost_developers(timestamptz)'::regprocedure);
