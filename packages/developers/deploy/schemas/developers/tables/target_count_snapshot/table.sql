-- Deploy schemas/developers/tables/target_count_snapshot/table to pg

-- requires: schemas/developers/tables/package/table
-- requires: schemas/developers/tables/source/table
-- requires: schemas/developers/tables/crawl_run/table

CREATE TABLE developers.target_count_snapshot (
  package_id uuid NOT NULL REFERENCES developers.package (id) ON DELETE CASCADE,
  source_id text NOT NULL REFERENCES developers.source (id),
  observed_on date NOT NULL,
  direct_count integer,
  indirect_count integer,
  repo_count integer,
  run_id uuid NOT NULL REFERENCES developers.crawl_run (id),
  PRIMARY KEY (package_id, source_id, observed_on)
);

COMMENT ON TABLE developers.target_count_snapshot IS 'Dependent totals each source claims for a target. Sources disagree; all are kept.';
COMMENT ON COLUMN developers.target_count_snapshot.package_id IS 'The target.';
COMMENT ON COLUMN developers.target_count_snapshot.source_id IS 'Who claimed it.';
COMMENT ON COLUMN developers.target_count_snapshot.observed_on IS 'Date.';
COMMENT ON COLUMN developers.target_count_snapshot.direct_count IS 'Direct dependents claimed.';
COMMENT ON COLUMN developers.target_count_snapshot.indirect_count IS 'Indirect dependents claimed (deps.dev).';
COMMENT ON COLUMN developers.target_count_snapshot.repo_count IS 'Dependent repositories claimed (ecosyste.ms, GitHub).';
COMMENT ON COLUMN developers.target_count_snapshot.run_id IS 'Run that recorded it.';
CREATE INDEX target_count_snapshot_source_id_idx ON developers.target_count_snapshot (source_id);
CREATE INDEX target_count_snapshot_run_id_idx ON developers.target_count_snapshot (run_id);
