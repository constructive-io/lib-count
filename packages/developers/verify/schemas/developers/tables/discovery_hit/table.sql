-- Verify schemas/developers/tables/discovery_hit/table on pg

SELECT assert_table('developers.discovery_hit'::regclass);
SELECT assert_index('developers.discovery_hit_source_id_idx'::regclass, 'developers.discovery_hit'::regclass);
SELECT assert_index('developers.discovery_hit_target_package_id_idx'::regclass, 'developers.discovery_hit'::regclass);
