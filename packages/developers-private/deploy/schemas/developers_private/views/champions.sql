-- Deploy schemas/developers_private/views/champions to pg

-- requires: schemas/developers_private/tables/edge_commit_event/table
-- requires: schemas/developers_private/tables/account/table
-- requires: developers:schemas/developers/views/current_dependents

CREATE VIEW developers_private.champions AS

SELECT c.target_name, c.dependent_key, ev.event, ev.committed_on, ev.commit_sha,
       a.login AS author_login, a.display_name, a.company_raw, ev.author_name, ev.source_id
FROM developers_private.edge_commit_event ev
JOIN developers.current_dependents c ON c.edge_id = ev.edge_id
LEFT JOIN developers_private.account a ON a.id = ev.author_account_id
WHERE ev.event IN ('added', 'last_touched');

COMMENT ON VIEW developers_private.champions IS 'The developer who added (or last touched) our dependency in each current dependent.';
