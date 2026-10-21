-- Deploy schemas/developers/procedures/start_run to pg

-- requires: schemas/developers/tables/crawl_run/table
-- requires: schemas/developers/tables/crawl_run_target/table
-- requires: schemas/developers/procedures/ensure_package
-- requires: schemas/developers/tables/source/table

CREATE FUNCTION developers.start_run(
  _task text,
  _source_id text,
  _target_names text[],
  _hop integer DEFAULT 1,
  _params jsonb DEFAULT '{}'::jsonb,
  _code_version text DEFAULT 'unknown'
) RETURNS uuid AS $$
DECLARE
  _kind text;
  _role text;
  _run_id uuid;
BEGIN
  SELECT dependent_kind, role INTO _kind, _role FROM developers.source WHERE id = _source_id;
  IF NOT FOUND THEN
    RAISE EXCEPTION 'start_run: unknown source %', _source_id;
  END IF;
  IF _role NOT IN ('verification', 'enrichment') THEN
    RAISE EXCEPTION 'start_run: source % has role %; only verification and enrichment sources own runs (discovery hits are recorded under the verification run that used them)', _source_id, _role;
  END IF;
  IF _role = 'verification' AND _kind IS NULL THEN
    RAISE EXCEPTION 'start_run: verification source % has no dependent_kind', _source_id;
  END IF;
  IF _role = 'enrichment' THEN
    _kind := NULL;
  END IF;
  IF _target_names IS NULL OR cardinality(_target_names) = 0 THEN
    RAISE EXCEPTION 'start_run: a run needs at least one target';
  END IF;

  INSERT INTO developers.crawl_run (task, source_id, dependent_kind, hop, params, code_version)
  VALUES (_task, _source_id, _kind, _hop::smallint, _params, _code_version)
  RETURNING id INTO _run_id;

  INSERT INTO developers.crawl_run_target (run_id, package_id)
  SELECT _run_id, developers.ensure_package(n) FROM unnest(_target_names) AS n
  ON CONFLICT DO NOTHING;

  RETURN _run_id;
END;
$$ LANGUAGE plpgsql VOLATILE;

COMMENT ON FUNCTION developers.start_run(text, text, text[], integer, jsonb, text) IS 'Opens a crawl_run over the named target packages and returns the run id. Verification sources get the sources dependent_kind; enrichment sources get NULL (they only write snapshots). Raises on unknown source, discovery/history/manual sources, or empty targets.';
