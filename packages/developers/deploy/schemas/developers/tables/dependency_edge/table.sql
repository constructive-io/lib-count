-- Deploy schemas/developers/tables/dependency_edge/table to pg

-- requires: schemas/developers/tables/package/table
-- requires: schemas/developers/tables/repository/table
-- requires: schemas/developers/tables/crawl_run/table
-- requires: schemas/developers/procedures/edge_id

CREATE TABLE developers.dependency_edge (
  id uuid PRIMARY KEY,
  dependent_kind text NOT NULL CHECK (dependent_kind IN ('package', 'repository')),
  dependent_package_id uuid REFERENCES developers.package (id),
  dependent_repository_id uuid REFERENCES developers.repository (id),
  target_package_id uuid NOT NULL REFERENCES developers.package (id),
  hop smallint NOT NULL DEFAULT 1 CHECK (hop IN (1, 2)),
  manifest_path text NOT NULL DEFAULT 'package.json',
  dep_type text CHECK (dep_type IN ('prod', 'dev', 'peer', 'optional', 'transitive', 'unknown')),
  version_range text,
  first_seen_at timestamptz NOT NULL,
  last_seen_at timestamptz NOT NULL,
  removed_at timestamptz,
  removed_by_run_id uuid REFERENCES developers.crawl_run (id),
  CHECK ((dependent_kind = 'package') = (dependent_package_id IS NOT NULL)),
  CHECK ((dependent_kind = 'repository') = (dependent_repository_id IS NOT NULL)),
  CHECK (first_seen_at <= last_seen_at),
  CHECK ((removed_at IS NULL) = (removed_by_run_id IS NULL))
);

COMMENT ON TABLE developers.dependency_edge IS 'The core fact: dependent X declares target package P in manifest M. Current state is derived from edge_observation by observe_edge/close_run; never written by hand.';
COMMENT ON COLUMN developers.dependency_edge.id IS 'Deterministic: developers.edge_id(kind, key, target name, manifest_path, hop).';
COMMENT ON COLUMN developers.dependency_edge.dependent_kind IS 'package or repository.';
COMMENT ON COLUMN developers.dependency_edge.dependent_package_id IS 'Set when the dependent is an npm package.';
COMMENT ON COLUMN developers.dependency_edge.dependent_repository_id IS 'Set when the dependent is a repository.';
COMMENT ON COLUMN developers.dependency_edge.target_package_id IS 'The package depended on (ours for hop 1).';
COMMENT ON COLUMN developers.dependency_edge.hop IS '1 = direct on ours; 2 = depends on a hop-1 dependent.';
COMMENT ON COLUMN developers.dependency_edge.manifest_path IS 'package.json for packages; path of the manifest or lockfile inside a repository.';
COMMENT ON COLUMN developers.dependency_edge.dep_type IS 'prod | dev | peer | optional | transitive (lockfile only) | unknown; latest observed value.';
COMMENT ON COLUMN developers.dependency_edge.version_range IS 'Declared range, latest observed value.';
COMMENT ON COLUMN developers.dependency_edge.first_seen_at IS 'Earliest observation.';
COMMENT ON COLUMN developers.dependency_edge.last_seen_at IS 'Latest observation.';
COMMENT ON COLUMN developers.dependency_edge.removed_at IS 'Set only by close_run on a complete run for this target that no longer observed the edge; cleared on re-observation.';
COMMENT ON COLUMN developers.dependency_edge.removed_by_run_id IS 'The complete run that removed it.';
CREATE INDEX dependency_edge_target_package_id_idx ON developers.dependency_edge (target_package_id);
CREATE INDEX dependency_edge_dependent_package_id_idx ON developers.dependency_edge (dependent_package_id);
CREATE INDEX dependency_edge_dependent_repository_id_idx ON developers.dependency_edge (dependent_repository_id);
CREATE INDEX dependency_edge_removed_by_run_id_idx ON developers.dependency_edge (removed_by_run_id);
CREATE INDEX dependency_edge_current_idx ON developers.dependency_edge (target_package_id, hop) WHERE removed_at IS NULL;
