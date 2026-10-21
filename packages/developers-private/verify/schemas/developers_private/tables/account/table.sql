-- Verify schemas/developers_private/tables/account/table on pg

SELECT assert_table('developers_private.account'::regclass);
SELECT assert_index('developers_private.account_source_id_idx'::regclass, 'developers_private.account'::regclass);
