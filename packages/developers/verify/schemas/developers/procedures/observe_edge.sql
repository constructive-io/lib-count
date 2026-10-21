-- Verify schemas/developers/procedures/observe_edge on pg

SELECT assert_function('developers.observe_edge(uuid, text, text, text, text, text, text, timestamptz)'::regprocedure);
