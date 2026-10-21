-- Deploy schemas/developers/tables/tracked_target/table to pg

-- requires: schemas/developers/tables/package/table

CREATE TABLE developers.tracked_target (
  package_id uuid PRIMARY KEY REFERENCES developers.package (id),
  reason text NOT NULL CHECK (reason IN ('lib-count', 'intent')),
  added_at timestamptz NOT NULL DEFAULT now()
);

COMMENT ON TABLE developers.tracked_target IS 'Our packages: the set whose dependents we crawl. Seeded from npm_count.npm_package (reason lib-count) plus intent.yaml ours.extra_packages (reason intent).';
COMMENT ON COLUMN developers.tracked_target.package_id IS 'The package.';
COMMENT ON COLUMN developers.tracked_target.reason IS 'lib-count = present in npm_count.npm_package; intent = listed in the intent file.';
COMMENT ON COLUMN developers.tracked_target.added_at IS 'When it became a target.';
