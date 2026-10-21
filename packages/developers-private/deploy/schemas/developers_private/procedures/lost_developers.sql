-- Deploy schemas/developers_private/procedures/lost_developers to pg

-- requires: schemas/developers_private/tables/edge_commit_event/table
-- requires: schemas/developers_private/tables/account/table
-- requires: developers:schemas/developers/procedures/lost_dependents

CREATE FUNCTION developers_private.lost_developers(_since timestamptz)
RETURNS TABLE (author_login citext, display_name text, company_raw text, target_name text, dependent_key text, removed_at timestamptz) AS $$
  SELECT a.login, a.display_name, a.company_raw, l.target_name, l.dependent_key, l.removed_at
  FROM developers.lost_dependents(_since) l
  LEFT JOIN developers_private.edge_commit_event ev ON ev.edge_id = l.edge_id AND ev.event = 'removed'
  LEFT JOIN developers_private.account a ON a.id = ev.author_account_id
  ORDER BY l.removed_at DESC;
$$ LANGUAGE sql STABLE;

COMMENT ON FUNCTION developers_private.lost_developers(timestamptz) IS 'Developers behind edges removed since _since (who removed us, when known).';
