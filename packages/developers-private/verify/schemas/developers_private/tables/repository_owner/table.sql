-- Verify schemas/developers_private/tables/repository_owner/table on pg

SELECT assert_table('developers_private.repository_owner'::regclass);
SELECT assert_index('developers_private.repository_owner_organization_id_idx'::regclass, 'developers_private.repository_owner'::regclass);
SELECT assert_index('developers_private.repository_owner_source_id_idx'::regclass, 'developers_private.repository_owner'::regclass);
