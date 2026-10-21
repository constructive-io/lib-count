-- Deploy schemas/developers/tables/package_dependency_history/table to pg

-- requires: schemas/developers/tables/package/table
-- requires: schemas/developers/tables/crawl_run/table

CREATE TABLE developers.package_dependency_history (
  dependent_package_id uuid NOT NULL REFERENCES developers.package (id) ON DELETE CASCADE,
  target_package_id uuid NOT NULL REFERENCES developers.package (id),
  first_version text NOT NULL,
  first_version_at timestamptz NOT NULL,
  last_version_with text NOT NULL,
  last_version_with_at timestamptz NOT NULL,
  removed_in_version text,
  removed_in_at timestamptz,
  in_latest boolean NOT NULL,
  versions_scanned integer NOT NULL,
  run_id uuid NOT NULL REFERENCES developers.crawl_run (id),
  updated_at timestamptz NOT NULL DEFAULT now(),
  PRIMARY KEY (dependent_package_id, target_package_id)
);

COMMENT ON TABLE developers.package_dependency_history IS 'Added/removed dates from the dependent''s own npm version history (packument walk): first version declaring the target, last one, and the first version without it.';
COMMENT ON COLUMN developers.package_dependency_history.dependent_package_id IS 'The dependent package.';
COMMENT ON COLUMN developers.package_dependency_history.target_package_id IS 'The target it declared.';
COMMENT ON COLUMN developers.package_dependency_history.first_version IS 'First published version declaring the target.';
COMMENT ON COLUMN developers.package_dependency_history.first_version_at IS 'Publish time of first_version (= added date).';
COMMENT ON COLUMN developers.package_dependency_history.last_version_with IS 'Latest version still declaring it.';
COMMENT ON COLUMN developers.package_dependency_history.last_version_with_at IS 'Its publish time.';
COMMENT ON COLUMN developers.package_dependency_history.removed_in_version IS 'First version after last_version_with without the target; NULL while in_latest.';
COMMENT ON COLUMN developers.package_dependency_history.removed_in_at IS 'Its publish time (= removed date).';
COMMENT ON COLUMN developers.package_dependency_history.in_latest IS 'True when dist-tags.latest still declares the target.';
COMMENT ON COLUMN developers.package_dependency_history.versions_scanned IS 'How many versions were walked.';
COMMENT ON COLUMN developers.package_dependency_history.run_id IS 'Run that computed it.';
COMMENT ON COLUMN developers.package_dependency_history.updated_at IS 'Last recompute.';
CREATE INDEX package_dependency_history_target_package_id_idx ON developers.package_dependency_history (target_package_id);
CREATE INDEX package_dependency_history_run_id_idx ON developers.package_dependency_history (run_id);
