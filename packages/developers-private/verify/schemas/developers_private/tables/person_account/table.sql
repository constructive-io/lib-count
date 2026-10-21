-- Verify schemas/developers_private/tables/person_account/table on pg

SELECT assert_table('developers_private.person_account'::regclass);
SELECT assert_index('developers_private.person_account_source_id_idx'::regclass, 'developers_private.person_account'::regclass);
