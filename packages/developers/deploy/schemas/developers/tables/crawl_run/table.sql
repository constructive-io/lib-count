-- Deploy schemas/developers/tables/crawl_run/table to pg

-- requires: schemas/developers/tables/source/table

CREATE TABLE developers.crawl_run (
  id uuid PRIMARY KEY DEFAULT uuid_generate_v4(),
  task text NOT NULL,
  source_id text NOT NULL REFERENCES developers.source (id),
  dependent_kind text CHECK (dependent_kind IN ('package', 'repository')),
  hop smallint NOT NULL DEFAULT 1 CHECK (hop IN (1, 2)),
  params jsonb NOT NULL DEFAULT '{}'::jsonb,
  code_version text NOT NULL,
  started_at timestamptz NOT NULL DEFAULT now(),
  finished_at timestamptz,
  status text NOT NULL DEFAULT 'running' CHECK (status IN ('running', 'complete', 'partial', 'failed')),
  stats jsonb,
  error text,
  CHECK ((finished_at IS NULL) = (status = 'running'))
);

COMMENT ON TABLE developers.crawl_run IS 'One crawler execution over a set of targets. Only a complete run of a verification source may mark edges removed (see close_run).';
COMMENT ON COLUMN developers.crawl_run.id IS 'Run id.';
COMMENT ON COLUMN developers.crawl_run.task IS 'Crawler task name, e.g. npm-dependents, github-dependents.';
COMMENT ON COLUMN developers.crawl_run.source_id IS 'The verification source whose observations this run records, or the enrichment source whose snapshots it records. Discovery sources never own runs.';
COMMENT ON COLUMN developers.crawl_run.dependent_kind IS 'Copied from source.dependent_kind. NULL for enrichment runs (downloads, counts), which can never observe or remove edges.';
COMMENT ON COLUMN developers.crawl_run.hop IS '1 = dependents of our packages; 2 = dependents of hop-1 dependents.';
COMMENT ON COLUMN developers.crawl_run.params IS 'Resolved parameters (thresholds, limits, intent values) so the run is reproducible.';
COMMENT ON COLUMN developers.crawl_run.code_version IS 'Crawler git sha (or version) that produced the run.';
COMMENT ON COLUMN developers.crawl_run.started_at IS 'Start time.';
COMMENT ON COLUMN developers.crawl_run.finished_at IS 'Set by close_run.';
COMMENT ON COLUMN developers.crawl_run.status IS 'running | complete | partial | failed.';
COMMENT ON COLUMN developers.crawl_run.stats IS 'Row counts and timings per step, written by close_run.';
COMMENT ON COLUMN developers.crawl_run.error IS 'Error text for failed/partial runs.';
CREATE INDEX crawl_run_source_id_idx ON developers.crawl_run (source_id);
CREATE INDEX crawl_run_task_started_at_idx ON developers.crawl_run (task, started_at DESC);
