-- Deploy schemas/developers/procedures/close_run to pg

-- requires: schemas/developers/tables/dependency_edge/table
-- requires: schemas/developers/tables/edge_observation/table
-- requires: schemas/developers/tables/crawl_run_target/table
-- requires: schemas/developers/procedures/start_run

CREATE FUNCTION developers.close_run(
  _run_id uuid,
  _status text,
  _stats jsonb DEFAULT NULL,
  _error text DEFAULT NULL
) RETURNS integer AS $$
DECLARE
  _run developers.crawl_run%ROWTYPE;
  _removed integer := 0;
BEGIN
  IF _status NOT IN ('complete', 'partial', 'failed') THEN
    RAISE EXCEPTION 'close_run: status must be complete, partial or failed, got %', _status;
  END IF;
  SELECT * INTO _run FROM developers.crawl_run WHERE id = _run_id FOR UPDATE;
  IF NOT FOUND THEN
    RAISE EXCEPTION 'close_run: unknown run %', _run_id;
  END IF;
  IF _run.status <> 'running' THEN
    RAISE EXCEPTION 'close_run: run % is already %', _run_id, _run.status;
  END IF;

  UPDATE developers.crawl_run
  SET status = _status, finished_at = now(), stats = _stats, error = _error
  WHERE id = _run_id;

  IF _status = 'complete' AND _run.dependent_kind IS NOT NULL THEN
    WITH gone AS (
      UPDATE developers.dependency_edge e
      SET removed_at = now(), removed_by_run_id = _run_id
      WHERE e.removed_at IS NULL
        AND e.hop = _run.hop
        AND e.dependent_kind = _run.dependent_kind
        AND e.target_package_id IN (SELECT package_id FROM developers.crawl_run_target WHERE run_id = _run_id)
        AND e.last_seen_at < _run.started_at
        AND NOT EXISTS (SELECT 1 FROM developers.edge_observation o WHERE o.edge_id = e.id AND o.run_id = _run_id)
      RETURNING 1
    )
    SELECT count(*) INTO _removed FROM gone;
  END IF;

  RETURN _removed;
END;
$$ LANGUAGE plpgsql VOLATILE;

COMMENT ON FUNCTION developers.close_run(uuid, text, jsonb, text) IS 'Finishes a run. On status complete for a verification source, sets removed_at on every edge of the run''s targets (same hop and dependent_kind) that the run did not observe and that no concurrent run has seen since it started; returns how many. partial/failed runs and enrichment-source runs never remove anything.';
