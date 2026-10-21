-- Verify schemas/developers/tables/repository/table on pg

SELECT assert_table('developers.repository'::regclass);
SELECT assert_index('developers.repository_owner_login_idx'::regclass, 'developers.repository'::regclass);
