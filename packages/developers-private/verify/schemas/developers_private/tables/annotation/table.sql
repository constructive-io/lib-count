-- Verify schemas/developers_private/tables/annotation/table on pg

SELECT assert_table('developers_private.annotation'::regclass);
SELECT assert_index('developers_private.annotation_entity_idx'::regclass, 'developers_private.annotation'::regclass);
SELECT assert_index('developers_private.annotation_source_id_idx'::regclass, 'developers_private.annotation'::regclass);
