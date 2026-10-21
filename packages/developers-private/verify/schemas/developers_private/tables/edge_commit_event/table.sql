-- Verify schemas/developers_private/tables/edge_commit_event/table on pg

SELECT assert_table('developers_private.edge_commit_event'::regclass);
SELECT assert_index('developers_private.edge_commit_event_author_account_id_idx'::regclass, 'developers_private.edge_commit_event'::regclass);
SELECT assert_index('developers_private.edge_commit_event_source_id_idx'::regclass, 'developers_private.edge_commit_event'::regclass);
