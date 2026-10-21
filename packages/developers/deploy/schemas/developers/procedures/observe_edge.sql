-- Deploy schemas/developers/procedures/observe_edge to pg

-- requires: schemas/developers/tables/dependency_edge/table
-- requires: schemas/developers/tables/edge_observation/table
-- requires: schemas/developers/procedures/start_run
-- requires: schemas/developers/procedures/ensure_repository
-- requires: schemas/developers/procedures/edge_id

CREATE FUNCTION developers.observe_edge(
  _run_id uuid,
  _target_name text,
  _dependent_key text,
  _manifest_path text DEFAULT 'package.json',
  _dep_type text DEFAULT NULL,
  _version_range text DEFAULT NULL,
  _evidence text DEFAULT NULL,
  _observed_at timestamptz DEFAULT now()
) RETURNS uuid AS $$
DECLARE
  _run developers.crawl_run%ROWTYPE;
  _target_id uuid;
  _dep_pkg_id uuid;
  _dep_repo_id uuid;
  _edge_id uuid;
BEGIN
  SELECT * INTO _run FROM developers.crawl_run WHERE id = _run_id;
  IF NOT FOUND THEN
    RAISE EXCEPTION 'observe_edge: unknown run %', _run_id;
  END IF;
  IF _run.status <> 'running' THEN
    RAISE EXCEPTION 'observe_edge: run % is %, not running', _run_id, _run.status;
  END IF;
  IF _run.dependent_kind IS NULL THEN
    RAISE EXCEPTION 'observe_edge: run % belongs to enrichment source % and cannot observe edges', _run_id, _run.source_id;
  END IF;

  _target_id := developers.package_id('npm', _target_name);
  IF NOT EXISTS (SELECT 1 FROM developers.crawl_run_target WHERE run_id = _run_id AND package_id = _target_id) THEN
    RAISE EXCEPTION 'observe_edge: % is not a target of run %', _target_name, _run_id;
  END IF;

  IF _run.dependent_kind = 'package' THEN
    _dep_pkg_id := developers.ensure_package(_dependent_key);
  ELSE
    _dep_repo_id := developers.ensure_repository(_dependent_key);
  END IF;

  _edge_id := developers.edge_id(_run.dependent_kind, _dependent_key, _target_name, _manifest_path, _run.hop);

  INSERT INTO developers.dependency_edge AS e
    (id, dependent_kind, dependent_package_id, dependent_repository_id, target_package_id, hop,
     manifest_path, dep_type, version_range, first_seen_at, last_seen_at)
  VALUES
    (_edge_id, _run.dependent_kind, _dep_pkg_id, _dep_repo_id, _target_id, _run.hop,
     _manifest_path, _dep_type, _version_range, _observed_at, _observed_at)
  ON CONFLICT (id) DO UPDATE SET
    first_seen_at = LEAST(e.first_seen_at, EXCLUDED.first_seen_at),
    last_seen_at = GREATEST(e.last_seen_at, EXCLUDED.last_seen_at),
    dep_type = COALESCE(EXCLUDED.dep_type, e.dep_type),
    version_range = COALESCE(EXCLUDED.version_range, e.version_range),
    removed_at = NULL,
    removed_by_run_id = NULL;

  INSERT INTO developers.edge_observation (edge_id, run_id, source_id, observed_at, dep_type, version_range, evidence)
  VALUES (_edge_id, _run_id, _run.source_id, _observed_at, _dep_type, _version_range, _evidence)
  ON CONFLICT (edge_id, run_id, source_id) DO NOTHING;

  RETURN _edge_id;
END;
$$ LANGUAGE plpgsql VOLATILE;

COMMENT ON FUNCTION developers.observe_edge(uuid, text, text, text, text, text, text, timestamptz) IS 'Records that a running run saw dependent _dependent_key (npm name or owner/name, per the run''s dependent_kind) declaring _target_name in _manifest_path. Upserts the edge (first_seen_at = least, last_seen_at = greatest, removed_at cleared) and appends one observation per (edge, run, source). Idempotent. Raises if the run is not running, belongs to an enrichment source, or the target is not one of the run''s targets.';
