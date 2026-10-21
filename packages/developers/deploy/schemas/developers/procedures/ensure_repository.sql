-- Deploy schemas/developers/procedures/ensure_repository to pg

-- requires: schemas/developers/tables/repository/table

CREATE FUNCTION developers.ensure_repository(_full_name text, _host text DEFAULT 'github.com') RETURNS uuid AS $$
  INSERT INTO developers.repository (id, host, full_name, owner_login)
  VALUES (developers.repository_id(_host, _full_name), _host, _full_name, split_part(_full_name, '/', 1))
  ON CONFLICT (id) DO NOTHING;
  SELECT developers.repository_id(_host, _full_name);
$$ LANGUAGE sql VOLATILE STRICT;

COMMENT ON FUNCTION developers.ensure_repository(text, text) IS 'Inserts a minimal repository row if missing and returns its deterministic id. _full_name must be owner/name.';
