-- Deploy schemas/developers/tables/repository_snapshot/table to pg

-- requires: schemas/developers/tables/repository/table
-- requires: schemas/developers/tables/crawl_run/table

CREATE TABLE developers.repository_snapshot (
  repository_id uuid NOT NULL REFERENCES developers.repository (id) ON DELETE CASCADE,
  observed_on date NOT NULL,
  stars integer,
  forks integer,
  run_id uuid NOT NULL REFERENCES developers.crawl_run (id),
  PRIMARY KEY (repository_id, observed_on)
);

COMMENT ON TABLE developers.repository_snapshot IS 'Stars and forks over time, one row per repository per day observed.';
COMMENT ON COLUMN developers.repository_snapshot.repository_id IS 'The repository.';
COMMENT ON COLUMN developers.repository_snapshot.observed_on IS 'Observation date.';
COMMENT ON COLUMN developers.repository_snapshot.stars IS 'Stargazer count.';
COMMENT ON COLUMN developers.repository_snapshot.forks IS 'Fork count.';
COMMENT ON COLUMN developers.repository_snapshot.run_id IS 'Run that recorded it.';
CREATE INDEX repository_snapshot_run_id_idx ON developers.repository_snapshot (run_id);
