-- Deploy schemas/developers/procedures/ensure_package to pg

-- requires: schemas/developers/tables/package/table

CREATE FUNCTION developers.ensure_package(_name text, _ecosystem text DEFAULT 'npm') RETURNS uuid AS $$
  INSERT INTO developers.package (id, ecosystem, name)
  VALUES (developers.package_id(_ecosystem, _name), _ecosystem, _name)
  ON CONFLICT (id) DO NOTHING;
  SELECT developers.package_id(_ecosystem, _name);
$$ LANGUAGE sql VOLATILE STRICT;

COMMENT ON FUNCTION developers.ensure_package(text, text) IS 'Inserts a minimal package row if missing and returns its deterministic id.';
