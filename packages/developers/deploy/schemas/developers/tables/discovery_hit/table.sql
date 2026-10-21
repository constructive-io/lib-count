-- Deploy schemas/developers/tables/discovery_hit/table to pg

-- requires: schemas/developers/tables/crawl_run/table
-- requires: schemas/developers/tables/source/table
-- requires: schemas/developers/tables/package/table

CREATE TABLE developers.discovery_hit (
  run_id uuid NOT NULL REFERENCES developers.crawl_run (id) ON DELETE CASCADE,
  source_id text NOT NULL REFERENCES developers.source (id),
  target_package_id uuid NOT NULL REFERENCES developers.package (id),
  dependent_kind text NOT NULL CHECK (dependent_kind IN ('package', 'repository')),
  dependent_key text NOT NULL,
  payload jsonb,
  PRIMARY KEY (run_id, source_id, target_package_id, dependent_key)
);

COMMENT ON TABLE developers.discovery_hit IS 'What each discovery source claimed before verification. Lets us measure undercount per source and audit why a candidate was or was not confirmed.';
COMMENT ON COLUMN developers.discovery_hit.run_id IS 'The run.';
COMMENT ON COLUMN developers.discovery_hit.source_id IS 'Discovery source (ecosystems, npm-web, github-dependents-html).';
COMMENT ON COLUMN developers.discovery_hit.target_package_id IS 'The target it was found for.';
COMMENT ON COLUMN developers.discovery_hit.dependent_kind IS 'package or repository.';
COMMENT ON COLUMN developers.discovery_hit.dependent_key IS 'npm name or owner/name.';
COMMENT ON COLUMN developers.discovery_hit.payload IS 'Raw fields the source returned (counts, stars, maintainers).';
CREATE INDEX discovery_hit_source_id_idx ON developers.discovery_hit (source_id);
CREATE INDEX discovery_hit_target_package_id_idx ON developers.discovery_hit (target_package_id);
