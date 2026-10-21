-- Deploy schemas/developers/procedures/repository_id to pg

-- requires: schemas/developers/schema

CREATE FUNCTION developers.repository_id(_host text, _full_name text) RETURNS uuid AS $$
  SELECT uuid_generate_v5(uuid_ns_url(), 'developers:repository:' || _host || '/' || lower(_full_name));
$$ LANGUAGE sql IMMUTABLE STRICT;

COMMENT ON FUNCTION developers.repository_id(_host text, _full_name text) IS 'Deterministic uuid v5 id of a repository from (host, lower(full_name)).';
