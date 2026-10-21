-- Deploy schemas/developers/procedures/lost_dependents to pg

-- requires: schemas/developers/tables/dependency_edge/table
-- requires: schemas/developers/tables/package/table
-- requires: schemas/developers/tables/repository/table

CREATE FUNCTION developers.lost_dependents(_since timestamptz)
RETURNS TABLE (edge_id uuid, target_name text, hop smallint, dependent_kind text, dependent_key text, first_seen_at timestamptz, last_seen_at timestamptz, removed_at timestamptz, removed_by_run_id uuid) AS $$
  SELECT e.id, tp.name, e.hop, e.dependent_kind, COALESCE(dp.name, r.full_name::text), e.first_seen_at, e.last_seen_at, e.removed_at, e.removed_by_run_id
  FROM developers.dependency_edge e
  JOIN developers.package tp ON tp.id = e.target_package_id
  LEFT JOIN developers.package dp ON dp.id = e.dependent_package_id
  LEFT JOIN developers.repository r ON r.id = e.dependent_repository_id
  WHERE e.removed_at IS NOT NULL AND e.removed_at >= _since
  ORDER BY e.removed_at DESC;
$$ LANGUAGE sql STABLE;

COMMENT ON FUNCTION developers.lost_dependents(timestamptz) IS 'Edges removed at or after _since (only complete runs remove edges).';
