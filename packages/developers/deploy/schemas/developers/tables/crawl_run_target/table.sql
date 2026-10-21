-- Deploy schemas/developers/tables/crawl_run_target/table to pg

-- requires: schemas/developers/tables/crawl_run/table
-- requires: schemas/developers/tables/package/table

CREATE TABLE developers.crawl_run_target (
  run_id uuid NOT NULL REFERENCES developers.crawl_run (id) ON DELETE CASCADE,
  package_id uuid NOT NULL REFERENCES developers.package (id),
  PRIMARY KEY (run_id, package_id)
);

COMMENT ON TABLE developers.crawl_run_target IS 'The target packages a run crawled dependents for. close_run only touches edges whose target is in this set.';
COMMENT ON COLUMN developers.crawl_run_target.run_id IS 'The run.';
COMMENT ON COLUMN developers.crawl_run_target.package_id IS 'A target package (ours for hop 1, a hop-1 dependent for hop 2).';
CREATE INDEX crawl_run_target_package_id_idx ON developers.crawl_run_target (package_id);
