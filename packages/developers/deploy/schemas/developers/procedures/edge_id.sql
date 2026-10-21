-- Deploy schemas/developers/procedures/edge_id to pg

-- requires: schemas/developers/schema

CREATE FUNCTION developers.edge_id(_dependent_kind text, _dependent_key text, _target_name text, _manifest_path text, _hop smallint) RETURNS uuid AS $$
  SELECT uuid_generate_v5(uuid_ns_url(),
    'developers:edge:' || _dependent_kind || ':' || lower(_dependent_key) || '->' || _target_name || '@' || _manifest_path || '#' || _hop::text);
$$ LANGUAGE sql IMMUTABLE STRICT;

COMMENT ON FUNCTION developers.edge_id(text, text, text, text, smallint) IS 'Deterministic uuid v5 id of a dependency edge from its natural key (dependent kind + key, target package name, manifest path, hop).';
