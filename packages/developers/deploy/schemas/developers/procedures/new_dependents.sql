-- Deploy schemas/developers/procedures/new_dependents to pg

-- requires: schemas/developers/views/current_dependents

CREATE FUNCTION developers.new_dependents(_since timestamptz) RETURNS SETOF developers.current_dependents AS $$
  SELECT * FROM developers.current_dependents WHERE first_seen_at >= _since ORDER BY first_seen_at DESC;
$$ LANGUAGE sql STABLE;

COMMENT ON FUNCTION developers.new_dependents(timestamptz) IS 'Current edges first seen at or after _since.';
