-- Deploy schemas/developers_private/procedures/new_developers to pg

-- requires: schemas/developers_private/views/champions

CREATE FUNCTION developers_private.new_developers(_since timestamptz)
RETURNS TABLE (author_login citext, display_name text, company_raw text, target_name text, dependent_key text, first_seen_at timestamptz) AS $$
  SELECT a.login, a.display_name, a.company_raw, c.target_name, c.dependent_key, c.first_seen_at
  FROM developers.current_dependents c
  JOIN developers_private.edge_commit_event ev ON ev.edge_id = c.edge_id AND ev.event = 'added'
  LEFT JOIN developers_private.account a ON a.id = ev.author_account_id
  WHERE c.first_seen_at >= _since
  ORDER BY c.first_seen_at DESC;
$$ LANGUAGE sql STABLE;

COMMENT ON FUNCTION developers_private.new_developers(timestamptz) IS 'Developers behind edges first seen since _since.';
