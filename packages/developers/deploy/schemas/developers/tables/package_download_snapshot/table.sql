-- Deploy schemas/developers/tables/package_download_snapshot/table to pg

-- requires: schemas/developers/tables/package/table
-- requires: schemas/developers/tables/crawl_run/table

CREATE TABLE developers.package_download_snapshot (
  package_id uuid NOT NULL REFERENCES developers.package (id) ON DELETE CASCADE,
  period text NOT NULL CHECK (period IN ('last-week', 'last-month')),
  window_start date NOT NULL,
  window_end date NOT NULL,
  downloads bigint NOT NULL,
  run_id uuid NOT NULL REFERENCES developers.crawl_run (id),
  PRIMARY KEY (package_id, period, window_end)
);

COMMENT ON TABLE developers.package_download_snapshot IS 'Point download counts for third-party packages (dependents). Our own packages'' downloads stay in npm_count.daily_downloads.';
COMMENT ON COLUMN developers.package_download_snapshot.package_id IS 'The package.';
COMMENT ON COLUMN developers.package_download_snapshot.period IS 'last-week or last-month.';
COMMENT ON COLUMN developers.package_download_snapshot.window_start IS 'First day of the window.';
COMMENT ON COLUMN developers.package_download_snapshot.window_end IS 'Last day of the window.';
COMMENT ON COLUMN developers.package_download_snapshot.downloads IS 'Downloads in the window.';
COMMENT ON COLUMN developers.package_download_snapshot.run_id IS 'Run that recorded it.';
CREATE INDEX package_download_snapshot_run_id_idx ON developers.package_download_snapshot (run_id);
