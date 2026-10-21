-- Verify schemas/developers/tables/edge_observation/table on pg

SELECT assert_table('developers.edge_observation'::regclass);
SELECT assert_index('developers.edge_observation_run_id_idx'::regclass, 'developers.edge_observation'::regclass);
SELECT assert_index('developers.edge_observation_source_id_idx'::regclass, 'developers.edge_observation'::regclass);
