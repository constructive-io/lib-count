-- Verify schemas/developers/procedures/edge_id on pg

SELECT assert_function('developers.edge_id(text, text, text, text, smallint)'::regprocedure);
