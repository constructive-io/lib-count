-- Deploy schemas/developers/procedures/set_updated_at to pg

-- requires: schemas/developers/schema

CREATE FUNCTION developers.set_updated_at() RETURNS trigger AS $$
BEGIN
  NEW.updated_at := now();
  RETURN NEW;
END;
$$ LANGUAGE plpgsql;

COMMENT ON FUNCTION developers.set_updated_at() IS 'Trigger function: stamps updated_at on every UPDATE.';
