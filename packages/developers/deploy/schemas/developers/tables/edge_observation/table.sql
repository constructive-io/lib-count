-- Deploy schemas/developers/tables/edge_observation/table to pg

-- requires: schemas/developers/tables/dependency_edge/table
-- requires: schemas/developers/tables/crawl_run/table
-- requires: schemas/developers/tables/source/table

CREATE TABLE developers.edge_observation (
  edge_id uuid NOT NULL REFERENCES developers.dependency_edge (id) ON DELETE CASCADE,
  run_id uuid NOT NULL REFERENCES developers.crawl_run (id),
  source_id text NOT NULL REFERENCES developers.source (id),
  observed_at timestamptz NOT NULL,
  dep_type text,
  version_range text,
  evidence text,
  PRIMARY KEY (edge_id, run_id, source_id)
);

COMMENT ON TABLE developers.edge_observation IS 'Append-only: one row per (edge, run, source). Re-running a crawl adds observations, never edges.';
COMMENT ON COLUMN developers.edge_observation.edge_id IS 'The edge.';
COMMENT ON COLUMN developers.edge_observation.run_id IS 'The run.';
COMMENT ON COLUMN developers.edge_observation.source_id IS 'The source that produced this observation.';
COMMENT ON COLUMN developers.edge_observation.observed_at IS 'Observation time.';
COMMENT ON COLUMN developers.edge_observation.dep_type IS 'dep_type as seen by this observation.';
COMMENT ON COLUMN developers.edge_observation.version_range IS 'version_range as seen by this observation.';
COMMENT ON COLUMN developers.edge_observation.evidence IS 'Where it was seen: packument version, manifest URL, lockfile path.';
CREATE INDEX edge_observation_run_id_idx ON developers.edge_observation (run_id);
CREATE INDEX edge_observation_source_id_idx ON developers.edge_observation (source_id);
