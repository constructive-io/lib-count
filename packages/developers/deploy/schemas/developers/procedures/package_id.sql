-- Deploy schemas/developers/procedures/package_id to pg

-- requires: schemas/developers/schema

CREATE FUNCTION developers.package_id(_ecosystem text, _name text) RETURNS uuid AS $$
  SELECT uuid_generate_v5(uuid_ns_url(), 'developers:package:' || _ecosystem || ':' || _name);
$$ LANGUAGE sql IMMUTABLE STRICT;

COMMENT ON FUNCTION developers.package_id(_ecosystem text, _name text) IS 'Deterministic uuid v5 id of a package from (ecosystem, name). The same package always gets the same id on every machine and reload.';
