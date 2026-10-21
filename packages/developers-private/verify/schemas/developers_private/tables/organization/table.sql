-- Verify schemas/developers_private/tables/organization/table on pg

SELECT assert_table('developers_private.organization'::regclass);
SELECT assert_index('developers_private.organization_github_account_id_idx'::regclass, 'developers_private.organization'::regclass);
SELECT assert_index('developers_private.organization_source_id_idx'::regclass, 'developers_private.organization'::regclass);
