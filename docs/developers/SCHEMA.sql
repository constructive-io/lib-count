-- developers / developers-private: complete deploy SQL in pgpm.plan order.
-- Generated from the throwaway workspace that was deployed, verified and reverted on
-- PostgreSQL 18.6 (see PLAN.md, Appendix B). Each block is ONE pgpm change: the
-- "-- Deploy <path> to pg" header is its path under deploy/, the "-- requires:" lines
-- are its plan dependencies, and the trailing comment shows the matching revert/ and
-- verify/ file bodies. Phase 0 splits this file into those per-object files verbatim.
-- No BEGIN/COMMIT (pgpm wraps each change), no CREATE OR REPLACE.

-- ============================================================================
-- module: developers   (packages/developers/developers.control)
-- # developers extension
-- comment = 'developers extension'
-- default_version = '0.0.1'
-- module_pathname = '$libdir/developers'
-- requires = 'plpgsql,uuid-ossp,citext,pgpm-verify,npm,github'
-- relocatable = false
-- superuser = false
-- ============================================================================

-- Deploy schemas/developers/schema to pg

CREATE SCHEMA developers;

COMMENT ON SCHEMA developers IS 'developers graph: public-safe facts about packages, repositories and dependency edges on our packages. No people data lives here.';

-- revert:
--   DROP SCHEMA developers;
-- verify:
--   SELECT assert_schema('developers'::regnamespace);


-- Deploy schemas/developers/types/confidence to pg

-- requires: schemas/developers/schema

CREATE TYPE developers.confidence AS ENUM ('high', 'medium', 'low', 'unknown');

COMMENT ON TYPE developers.confidence IS 'How strongly an inferred claim is supported: high = explicit first-party, medium = self-reported or strong indirect link, low = name match or third-party mention, unknown = not assessed.';

-- revert:
--   DROP TYPE developers.confidence;
-- verify:
--   SELECT assert_type('developers.confidence'::regtype, 'e');


-- Deploy schemas/developers/procedures/set_updated_at to pg

-- requires: schemas/developers/schema

CREATE FUNCTION developers.set_updated_at() RETURNS trigger AS $$
BEGIN
  NEW.updated_at := now();
  RETURN NEW;
END;
$$ LANGUAGE plpgsql;

COMMENT ON FUNCTION developers.set_updated_at() IS 'Trigger function: stamps updated_at on every UPDATE.';

-- revert:
--   DROP FUNCTION developers.set_updated_at();
-- verify:
--   SELECT assert_function('developers.set_updated_at()'::regprocedure);


-- Deploy schemas/developers/procedures/package_id to pg

-- requires: schemas/developers/schema

CREATE FUNCTION developers.package_id(_ecosystem text, _name text) RETURNS uuid AS $$
  SELECT uuid_generate_v5(uuid_ns_url(), 'developers:package:' || _ecosystem || ':' || _name);
$$ LANGUAGE sql IMMUTABLE STRICT;

COMMENT ON FUNCTION developers.package_id(_ecosystem text, _name text) IS 'Deterministic uuid v5 id of a package from (ecosystem, name). The same package always gets the same id on every machine and reload.';

-- revert:
--   DROP FUNCTION developers.package_id(_ecosystem text, _name text);
-- verify:
--   SELECT assert_function('developers.package_id(text, text)'::regprocedure);


-- Deploy schemas/developers/procedures/repository_id to pg

-- requires: schemas/developers/schema

CREATE FUNCTION developers.repository_id(_host text, _full_name text) RETURNS uuid AS $$
  SELECT uuid_generate_v5(uuid_ns_url(), 'developers:repository:' || _host || '/' || lower(_full_name));
$$ LANGUAGE sql IMMUTABLE STRICT;

COMMENT ON FUNCTION developers.repository_id(_host text, _full_name text) IS 'Deterministic uuid v5 id of a repository from (host, lower(full_name)).';

-- revert:
--   DROP FUNCTION developers.repository_id(_host text, _full_name text);
-- verify:
--   SELECT assert_function('developers.repository_id(text, text)'::regprocedure);


-- Deploy schemas/developers/procedures/edge_id to pg

-- requires: schemas/developers/schema

CREATE FUNCTION developers.edge_id(_dependent_kind text, _dependent_key text, _target_name text, _manifest_path text, _hop smallint) RETURNS uuid AS $$
  SELECT uuid_generate_v5(uuid_ns_url(),
    'developers:edge:' || _dependent_kind || ':' || lower(_dependent_key) || '->' || _target_name || '@' || _manifest_path || '#' || _hop::text);
$$ LANGUAGE sql IMMUTABLE STRICT;

COMMENT ON FUNCTION developers.edge_id(text, text, text, text, smallint) IS 'Deterministic uuid v5 id of a dependency edge from its natural key (dependent kind + key, target package name, manifest path, hop).';

-- revert:
--   DROP FUNCTION developers.edge_id(text, text, text, text, smallint);
-- verify:
--   SELECT assert_function('developers.edge_id(text, text, text, text, smallint)'::regprocedure);


-- Deploy schemas/developers/tables/source/table to pg

-- requires: schemas/developers/schema

CREATE TABLE developers.source (
  id text PRIMARY KEY,
  description text NOT NULL,
  base_url text,
  dependent_kind text CHECK (dependent_kind IN ('package', 'repository')),
  role text NOT NULL CHECK (role IN ('discovery', 'verification', 'enrichment', 'history', 'manual'))
);

COMMENT ON TABLE developers.source IS 'Where a fact came from. Every observation, snapshot and inferred claim references a source row.';
COMMENT ON COLUMN developers.source.id IS 'Short stable identifier, e.g. npm-registry, ecosystems, github-api.';
COMMENT ON COLUMN developers.source.description IS 'What the source is and how it is used.';
COMMENT ON COLUMN developers.source.base_url IS 'Base URL of the API or site, if any.';
COMMENT ON COLUMN developers.source.dependent_kind IS 'Kind of dependent this source yields when it verifies edges: package or repository. NULL for sources that never verify edges.';
COMMENT ON COLUMN developers.source.role IS 'discovery = proposes candidates (may be incomplete); verification = authoritative for an edge; enrichment = metadata; history = dates; manual = human research.';

-- revert:
--   DROP TABLE developers.source;
-- verify:
--   SELECT assert_table('developers.source'::regclass);


-- Deploy schemas/developers/tables/package/table to pg

-- requires: schemas/developers/schema
-- requires: schemas/developers/procedures/package_id
-- requires: schemas/developers/procedures/set_updated_at

CREATE TABLE developers.package (
  id uuid PRIMARY KEY,
  ecosystem text NOT NULL DEFAULT 'npm',
  name text NOT NULL,
  description text,
  homepage text,
  repository_url text,
  latest_version text,
  created_on date,
  last_publish_on date,
  deprecated boolean,
  unpublished boolean NOT NULL DEFAULT false,
  fetched_at timestamptz,
  first_seen_at timestamptz NOT NULL DEFAULT now(),
  updated_at timestamptz NOT NULL DEFAULT now(),
  UNIQUE (ecosystem, name),
  CHECK (id = developers.package_id(ecosystem, name))
);

COMMENT ON TABLE developers.package IS 'Any package the graph knows about: ours (see tracked_target) and third-party dependents. Never a download-total participant: npm_count.npm_package is untouched.';
COMMENT ON COLUMN developers.package.id IS 'Deterministic: developers.package_id(ecosystem, name).';
COMMENT ON COLUMN developers.package.ecosystem IS 'Package ecosystem; only npm today.';
COMMENT ON COLUMN developers.package.name IS 'Registry name, e.g. @scope/name.';
COMMENT ON COLUMN developers.package.description IS 'Registry description, copied verbatim.';
COMMENT ON COLUMN developers.package.homepage IS 'Registry homepage URL.';
COMMENT ON COLUMN developers.package.repository_url IS 'Registry repository URL, normalised to https://host/owner/name when possible.';
COMMENT ON COLUMN developers.package.latest_version IS 'dist-tags.latest at fetched_at.';
COMMENT ON COLUMN developers.package.created_on IS 'Date of the first publish (packument time.created).';
COMMENT ON COLUMN developers.package.last_publish_on IS 'Date of the latest publish (packument time.modified).';
COMMENT ON COLUMN developers.package.deprecated IS 'True when the latest version carries a deprecation notice.';
COMMENT ON COLUMN developers.package.unpublished IS 'True when the registry returns 404 or an unpublished packument.';
COMMENT ON COLUMN developers.package.fetched_at IS 'When the registry metadata was last refreshed.';
COMMENT ON COLUMN developers.package.first_seen_at IS 'When this row was first inserted.';
COMMENT ON COLUMN developers.package.updated_at IS 'Last modification (trigger-maintained).';

CREATE TRIGGER set_updated_at BEFORE UPDATE ON developers.package FOR EACH ROW EXECUTE FUNCTION developers.set_updated_at();

-- revert:
--   DROP TABLE developers.package;
-- verify:
--   SELECT assert_table('developers.package'::regclass);


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

-- revert:
--   DROP TABLE developers.tracked_target;
-- verify:
--   SELECT assert_table('developers.tracked_target'::regclass);


-- Deploy schemas/developers/tables/category_family/table to pg

-- requires: schemas/developers/schema

CREATE TABLE developers.category_family (
  category_name text PRIMARY KEY,
  family text NOT NULL CHECK (family IN ('cloud', 'chain', 'utils', 'personal'))
);

COMMENT ON TABLE developers.category_family IS 'Maps lib-count category names (npm_count.category.name) to the brand rollup used by stats-db categories.ts (brandRollupFor). Categories not listed roll up to cloud, exactly as categories.ts defaults.';
COMMENT ON COLUMN developers.category_family.category_name IS 'npm_count.category.name.';
COMMENT ON COLUMN developers.category_family.family IS 'cloud | chain | utils | personal.';

-- revert:
--   DROP TABLE developers.category_family;
-- verify:
--   SELECT assert_table('developers.category_family'::regclass);


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

-- revert:
--   DROP TABLE developers.crawl_run;
-- verify:
--   SELECT assert_table('developers.crawl_run'::regclass);
--   SELECT assert_index('developers.crawl_run_source_id_idx'::regclass, 'developers.crawl_run'::regclass);
--   SELECT assert_index('developers.crawl_run_task_started_at_idx'::regclass, 'developers.crawl_run'::regclass);


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

-- revert:
--   DROP TABLE developers.crawl_run_target;
-- verify:
--   SELECT assert_table('developers.crawl_run_target'::regclass);
--   SELECT assert_index('developers.crawl_run_target_package_id_idx'::regclass, 'developers.crawl_run_target'::regclass);


-- Deploy schemas/developers/tables/repository/table to pg

-- requires: schemas/developers/schema
-- requires: schemas/developers/procedures/repository_id
-- requires: schemas/developers/procedures/set_updated_at

CREATE TABLE developers.repository (
  id uuid PRIMARY KEY,
  host text NOT NULL DEFAULT 'github.com',
  full_name citext NOT NULL,
  owner_login citext NOT NULL,
  owner_kind text CHECK (owner_kind IN ('user', 'organization')),
  github_id bigint UNIQUE,
  default_branch text,
  is_fork boolean,
  parent_full_name citext,
  archived boolean,
  description text,
  homepage text,
  primary_language text,
  pushed_at timestamptz,
  gone boolean NOT NULL DEFAULT false,
  fetched_at timestamptz,
  first_seen_at timestamptz NOT NULL DEFAULT now(),
  updated_at timestamptz NOT NULL DEFAULT now(),
  UNIQUE (host, full_name),
  CHECK (id = developers.repository_id(host, full_name::text))
);

COMMENT ON TABLE developers.repository IS 'A source repository (dependent or the home of a package). Independent of github.repository, which stats-db wipes on every gh:fetch; joins to it are by github_id or full_name, never by FK.';
COMMENT ON COLUMN developers.repository.id IS 'Deterministic: developers.repository_id(host, full_name).';
COMMENT ON COLUMN developers.repository.host IS 'Code host; github.com today.';
COMMENT ON COLUMN developers.repository.full_name IS 'owner/name, case-insensitive.';
COMMENT ON COLUMN developers.repository.owner_login IS 'Owner login, case-insensitive.';
COMMENT ON COLUMN developers.repository.owner_kind IS 'user or organization, from the GitHub API.';
COMMENT ON COLUMN developers.repository.github_id IS 'GitHub numeric id; stable across renames.';
COMMENT ON COLUMN developers.repository.default_branch IS 'Default branch at fetched_at.';
COMMENT ON COLUMN developers.repository.is_fork IS 'GitHub fork flag.';
COMMENT ON COLUMN developers.repository.parent_full_name IS 'Parent repository for forks.';
COMMENT ON COLUMN developers.repository.archived IS 'GitHub archived flag.';
COMMENT ON COLUMN developers.repository.description IS 'Repository description, verbatim.';
COMMENT ON COLUMN developers.repository.homepage IS 'Repository homepage URL.';
COMMENT ON COLUMN developers.repository.primary_language IS 'GitHub primary language.';
COMMENT ON COLUMN developers.repository.pushed_at IS 'Last push time.';
COMMENT ON COLUMN developers.repository.gone IS 'True when the API returned 404 (deleted or private).';
COMMENT ON COLUMN developers.repository.fetched_at IS 'When metadata was last refreshed.';
COMMENT ON COLUMN developers.repository.first_seen_at IS 'When this row was first inserted.';
COMMENT ON COLUMN developers.repository.updated_at IS 'Last modification (trigger-maintained).';
CREATE INDEX repository_owner_login_idx ON developers.repository (owner_login);
CREATE TRIGGER set_updated_at BEFORE UPDATE ON developers.repository FOR EACH ROW EXECUTE FUNCTION developers.set_updated_at();

-- revert:
--   DROP TABLE developers.repository;
-- verify:
--   SELECT assert_table('developers.repository'::regclass);
--   SELECT assert_index('developers.repository_owner_login_idx'::regclass, 'developers.repository'::regclass);


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

-- revert:
--   DROP TABLE developers.repository_snapshot;
-- verify:
--   SELECT assert_table('developers.repository_snapshot'::regclass);
--   SELECT assert_index('developers.repository_snapshot_run_id_idx'::regclass, 'developers.repository_snapshot'::regclass);


-- Deploy schemas/developers/tables/package_repository/table to pg

-- requires: schemas/developers/tables/package/table
-- requires: schemas/developers/tables/repository/table
-- requires: schemas/developers/tables/source/table

CREATE TABLE developers.package_repository (
  package_id uuid NOT NULL REFERENCES developers.package (id) ON DELETE CASCADE,
  repository_id uuid NOT NULL REFERENCES developers.repository (id) ON DELETE CASCADE,
  directory text,
  source_id text NOT NULL REFERENCES developers.source (id),
  is_upstream_of_fork boolean NOT NULL DEFAULT false,
  PRIMARY KEY (package_id, repository_id)
);

COMMENT ON TABLE developers.package_repository IS 'Which repository a package is published from (monorepo directory when known).';
COMMENT ON COLUMN developers.package_repository.package_id IS 'The package.';
COMMENT ON COLUMN developers.package_repository.repository_id IS 'Its source repository.';
COMMENT ON COLUMN developers.package_repository.directory IS 'Monorepo sub-directory from the packument repository.directory.';
COMMENT ON COLUMN developers.package_repository.source_id IS 'Where the link came from.';
COMMENT ON COLUMN developers.package_repository.is_upstream_of_fork IS 'True when the npm scope and the repo owner differ in a way that suggests a republish or personal fork of someone else''s project.';
CREATE INDEX package_repository_repository_id_idx ON developers.package_repository (repository_id);
CREATE INDEX package_repository_source_id_idx ON developers.package_repository (source_id);

-- revert:
--   DROP TABLE developers.package_repository;
-- verify:
--   SELECT assert_table('developers.package_repository'::regclass);
--   SELECT assert_index('developers.package_repository_repository_id_idx'::regclass, 'developers.package_repository'::regclass);
--   SELECT assert_index('developers.package_repository_source_id_idx'::regclass, 'developers.package_repository'::regclass);


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

-- revert:
--   DROP TABLE developers.package_download_snapshot;
-- verify:
--   SELECT assert_table('developers.package_download_snapshot'::regclass);
--   SELECT assert_index('developers.package_download_snapshot_run_id_idx'::regclass, 'developers.package_download_snapshot'::regclass);


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

-- revert:
--   DROP TABLE developers.dependency_edge;
-- verify:
--   SELECT assert_table('developers.dependency_edge'::regclass);
--   SELECT assert_index('developers.dependency_edge_target_package_id_idx'::regclass, 'developers.dependency_edge'::regclass);
--   SELECT assert_index('developers.dependency_edge_dependent_package_id_idx'::regclass, 'developers.dependency_edge'::regclass);
--   SELECT assert_index('developers.dependency_edge_dependent_repository_id_idx'::regclass, 'developers.dependency_edge'::regclass);
--   SELECT assert_index('developers.dependency_edge_removed_by_run_id_idx'::regclass, 'developers.dependency_edge'::regclass);
--   SELECT assert_index('developers.dependency_edge_current_idx'::regclass, 'developers.dependency_edge'::regclass);


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

-- revert:
--   DROP TABLE developers.edge_observation;
-- verify:
--   SELECT assert_table('developers.edge_observation'::regclass);
--   SELECT assert_index('developers.edge_observation_run_id_idx'::regclass, 'developers.edge_observation'::regclass);
--   SELECT assert_index('developers.edge_observation_source_id_idx'::regclass, 'developers.edge_observation'::regclass);


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

-- revert:
--   DROP TABLE developers.discovery_hit;
-- verify:
--   SELECT assert_table('developers.discovery_hit'::regclass);
--   SELECT assert_index('developers.discovery_hit_source_id_idx'::regclass, 'developers.discovery_hit'::regclass);
--   SELECT assert_index('developers.discovery_hit_target_package_id_idx'::regclass, 'developers.discovery_hit'::regclass);


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

-- revert:
--   DROP TABLE developers.target_count_snapshot;
-- verify:
--   SELECT assert_table('developers.target_count_snapshot'::regclass);
--   SELECT assert_index('developers.target_count_snapshot_source_id_idx'::regclass, 'developers.target_count_snapshot'::regclass);
--   SELECT assert_index('developers.target_count_snapshot_run_id_idx'::regclass, 'developers.target_count_snapshot'::regclass);


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

-- revert:
--   DROP TABLE developers.package_dependency_history;
-- verify:
--   SELECT assert_table('developers.package_dependency_history'::regclass);
--   SELECT assert_index('developers.package_dependency_history_target_package_id_idx'::regclass, 'developers.package_dependency_history'::regclass);
--   SELECT assert_index('developers.package_dependency_history_run_id_idx'::regclass, 'developers.package_dependency_history'::regclass);


-- Deploy schemas/developers/procedures/ensure_package to pg

-- requires: schemas/developers/tables/package/table

CREATE FUNCTION developers.ensure_package(_name text, _ecosystem text DEFAULT 'npm') RETURNS uuid AS $$
  INSERT INTO developers.package (id, ecosystem, name)
  VALUES (developers.package_id(_ecosystem, _name), _ecosystem, _name)
  ON CONFLICT (id) DO NOTHING;
  SELECT developers.package_id(_ecosystem, _name);
$$ LANGUAGE sql VOLATILE STRICT;

COMMENT ON FUNCTION developers.ensure_package(text, text) IS 'Inserts a minimal package row if missing and returns its deterministic id.';

-- revert:
--   DROP FUNCTION developers.ensure_package(text, text);
-- verify:
--   SELECT assert_function('developers.ensure_package(text, text)'::regprocedure);


-- Deploy schemas/developers/procedures/ensure_repository to pg

-- requires: schemas/developers/tables/repository/table

CREATE FUNCTION developers.ensure_repository(_full_name text, _host text DEFAULT 'github.com') RETURNS uuid AS $$
  INSERT INTO developers.repository (id, host, full_name, owner_login)
  VALUES (developers.repository_id(_host, _full_name), _host, _full_name, split_part(_full_name, '/', 1))
  ON CONFLICT (id) DO NOTHING;
  SELECT developers.repository_id(_host, _full_name);
$$ LANGUAGE sql VOLATILE STRICT;

COMMENT ON FUNCTION developers.ensure_repository(text, text) IS 'Inserts a minimal repository row if missing and returns its deterministic id. _full_name must be owner/name.';

-- revert:
--   DROP FUNCTION developers.ensure_repository(text, text);
-- verify:
--   SELECT assert_function('developers.ensure_repository(text, text)'::regprocedure);


-- Deploy schemas/developers/procedures/start_run to pg

-- requires: schemas/developers/tables/crawl_run/table
-- requires: schemas/developers/tables/crawl_run_target/table
-- requires: schemas/developers/procedures/ensure_package
-- requires: schemas/developers/tables/source/table

CREATE FUNCTION developers.start_run(
  _task text,
  _source_id text,
  _target_names text[],
  _hop integer DEFAULT 1,
  _params jsonb DEFAULT '{}'::jsonb,
  _code_version text DEFAULT 'unknown'
) RETURNS uuid AS $$
DECLARE
  _kind text;
  _role text;
  _run_id uuid;
BEGIN
  SELECT dependent_kind, role INTO _kind, _role FROM developers.source WHERE id = _source_id;
  IF NOT FOUND THEN
    RAISE EXCEPTION 'start_run: unknown source %', _source_id;
  END IF;
  IF _role NOT IN ('verification', 'enrichment') THEN
    RAISE EXCEPTION 'start_run: source % has role %; only verification and enrichment sources own runs (discovery hits are recorded under the verification run that used them)', _source_id, _role;
  END IF;
  IF _role = 'verification' AND _kind IS NULL THEN
    RAISE EXCEPTION 'start_run: verification source % has no dependent_kind', _source_id;
  END IF;
  IF _role = 'enrichment' THEN
    _kind := NULL;
  END IF;
  IF _target_names IS NULL OR cardinality(_target_names) = 0 THEN
    RAISE EXCEPTION 'start_run: a run needs at least one target';
  END IF;

  INSERT INTO developers.crawl_run (task, source_id, dependent_kind, hop, params, code_version)
  VALUES (_task, _source_id, _kind, _hop::smallint, _params, _code_version)
  RETURNING id INTO _run_id;

  INSERT INTO developers.crawl_run_target (run_id, package_id)
  SELECT _run_id, developers.ensure_package(n) FROM unnest(_target_names) AS n
  ON CONFLICT DO NOTHING;

  RETURN _run_id;
END;
$$ LANGUAGE plpgsql VOLATILE;

COMMENT ON FUNCTION developers.start_run(text, text, text[], integer, jsonb, text) IS 'Opens a crawl_run over the named target packages and returns the run id. Verification sources get the sources dependent_kind; enrichment sources get NULL (they only write snapshots). Raises on unknown source, discovery/history/manual sources, or empty targets.';

-- revert:
--   DROP FUNCTION developers.start_run(text, text, text[], integer, jsonb, text);
-- verify:
--   SELECT assert_function('developers.start_run(text, text, text[], integer, jsonb, text)'::regprocedure);


-- Deploy schemas/developers/procedures/observe_edge to pg

-- requires: schemas/developers/tables/dependency_edge/table
-- requires: schemas/developers/tables/edge_observation/table
-- requires: schemas/developers/procedures/start_run
-- requires: schemas/developers/procedures/ensure_repository
-- requires: schemas/developers/procedures/edge_id

CREATE FUNCTION developers.observe_edge(
  _run_id uuid,
  _target_name text,
  _dependent_key text,
  _manifest_path text DEFAULT 'package.json',
  _dep_type text DEFAULT NULL,
  _version_range text DEFAULT NULL,
  _evidence text DEFAULT NULL,
  _observed_at timestamptz DEFAULT now()
) RETURNS uuid AS $$
DECLARE
  _run developers.crawl_run%ROWTYPE;
  _target_id uuid;
  _dep_pkg_id uuid;
  _dep_repo_id uuid;
  _edge_id uuid;
BEGIN
  SELECT * INTO _run FROM developers.crawl_run WHERE id = _run_id;
  IF NOT FOUND THEN
    RAISE EXCEPTION 'observe_edge: unknown run %', _run_id;
  END IF;
  IF _run.status <> 'running' THEN
    RAISE EXCEPTION 'observe_edge: run % is %, not running', _run_id, _run.status;
  END IF;
  IF _run.dependent_kind IS NULL THEN
    RAISE EXCEPTION 'observe_edge: run % belongs to enrichment source % and cannot observe edges', _run_id, _run.source_id;
  END IF;

  _target_id := developers.package_id('npm', _target_name);
  IF NOT EXISTS (SELECT 1 FROM developers.crawl_run_target WHERE run_id = _run_id AND package_id = _target_id) THEN
    RAISE EXCEPTION 'observe_edge: % is not a target of run %', _target_name, _run_id;
  END IF;

  IF _run.dependent_kind = 'package' THEN
    _dep_pkg_id := developers.ensure_package(_dependent_key);
  ELSE
    _dep_repo_id := developers.ensure_repository(_dependent_key);
  END IF;

  _edge_id := developers.edge_id(_run.dependent_kind, _dependent_key, _target_name, _manifest_path, _run.hop);

  INSERT INTO developers.dependency_edge AS e
    (id, dependent_kind, dependent_package_id, dependent_repository_id, target_package_id, hop,
     manifest_path, dep_type, version_range, first_seen_at, last_seen_at)
  VALUES
    (_edge_id, _run.dependent_kind, _dep_pkg_id, _dep_repo_id, _target_id, _run.hop,
     _manifest_path, _dep_type, _version_range, _observed_at, _observed_at)
  ON CONFLICT (id) DO UPDATE SET
    first_seen_at = LEAST(e.first_seen_at, EXCLUDED.first_seen_at),
    last_seen_at = GREATEST(e.last_seen_at, EXCLUDED.last_seen_at),
    dep_type = COALESCE(EXCLUDED.dep_type, e.dep_type),
    version_range = COALESCE(EXCLUDED.version_range, e.version_range),
    removed_at = NULL,
    removed_by_run_id = NULL;

  INSERT INTO developers.edge_observation (edge_id, run_id, source_id, observed_at, dep_type, version_range, evidence)
  VALUES (_edge_id, _run_id, _run.source_id, _observed_at, _dep_type, _version_range, _evidence)
  ON CONFLICT (edge_id, run_id, source_id) DO NOTHING;

  RETURN _edge_id;
END;
$$ LANGUAGE plpgsql VOLATILE;

COMMENT ON FUNCTION developers.observe_edge(uuid, text, text, text, text, text, text, timestamptz) IS 'Records that a running run saw dependent _dependent_key (npm name or owner/name, per the run''s dependent_kind) declaring _target_name in _manifest_path. Upserts the edge (first_seen_at = least, last_seen_at = greatest, removed_at cleared) and appends one observation per (edge, run, source). Idempotent. Raises if the run is not running, belongs to an enrichment source, or the target is not one of the run''s targets.';

-- revert:
--   DROP FUNCTION developers.observe_edge(uuid, text, text, text, text, text, text, timestamptz);
-- verify:
--   SELECT assert_function('developers.observe_edge(uuid, text, text, text, text, text, text, timestamptz)'::regprocedure);


-- Deploy schemas/developers/procedures/close_run to pg

-- requires: schemas/developers/tables/dependency_edge/table
-- requires: schemas/developers/tables/edge_observation/table
-- requires: schemas/developers/tables/crawl_run_target/table
-- requires: schemas/developers/procedures/start_run

CREATE FUNCTION developers.close_run(
  _run_id uuid,
  _status text,
  _stats jsonb DEFAULT NULL,
  _error text DEFAULT NULL
) RETURNS integer AS $$
DECLARE
  _run developers.crawl_run%ROWTYPE;
  _removed integer := 0;
BEGIN
  IF _status NOT IN ('complete', 'partial', 'failed') THEN
    RAISE EXCEPTION 'close_run: status must be complete, partial or failed, got %', _status;
  END IF;
  SELECT * INTO _run FROM developers.crawl_run WHERE id = _run_id FOR UPDATE;
  IF NOT FOUND THEN
    RAISE EXCEPTION 'close_run: unknown run %', _run_id;
  END IF;
  IF _run.status <> 'running' THEN
    RAISE EXCEPTION 'close_run: run % is already %', _run_id, _run.status;
  END IF;

  UPDATE developers.crawl_run
  SET status = _status, finished_at = now(), stats = _stats, error = _error
  WHERE id = _run_id;

  IF _status = 'complete' AND _run.dependent_kind IS NOT NULL THEN
    WITH gone AS (
      UPDATE developers.dependency_edge e
      SET removed_at = now(), removed_by_run_id = _run_id
      WHERE e.removed_at IS NULL
        AND e.hop = _run.hop
        AND e.dependent_kind = _run.dependent_kind
        AND e.target_package_id IN (SELECT package_id FROM developers.crawl_run_target WHERE run_id = _run_id)
        AND e.last_seen_at < _run.started_at
        AND NOT EXISTS (SELECT 1 FROM developers.edge_observation o WHERE o.edge_id = e.id AND o.run_id = _run_id)
      RETURNING 1
    )
    SELECT count(*) INTO _removed FROM gone;
  END IF;

  RETURN _removed;
END;
$$ LANGUAGE plpgsql VOLATILE;

COMMENT ON FUNCTION developers.close_run(uuid, text, jsonb, text) IS 'Finishes a run. On status complete for a verification source, sets removed_at on every edge of the run''s targets (same hop and dependent_kind) that the run did not observe and that no concurrent run has seen since it started; returns how many. partial/failed runs and enrichment-source runs never remove anything.';

-- revert:
--   DROP FUNCTION developers.close_run(uuid, text, jsonb, text);
-- verify:
--   SELECT assert_function('developers.close_run(uuid, text, jsonb, text)'::regprocedure);


-- Deploy schemas/developers/seeds/source to pg

-- requires: schemas/developers/tables/source/table

INSERT INTO developers.source (id, description, base_url, dependent_kind, role) VALUES
  ('npm-registry', 'registry.npmjs.org packuments and search: package metadata, maintainers, version history, dependents count; authoritative for what a published version declares', 'https://registry.npmjs.org', 'package', 'verification'),
  ('npm-downloads', 'api.npmjs.org point downloads (bulk only for unscoped names)', 'https://api.npmjs.org/downloads/point', NULL, 'enrichment'),
  ('ecosystems', 'packages.ecosyste.ms dependent_packages (latest and any-version); undercounts, discovery only', 'https://packages.ecosyste.ms/api/v1', 'package', 'discovery'),
  ('npm-web', 'www.npmjs.com x-spiferack JSON dependents pages; blocked by Cloudflare from CI/VMs, optional and explicit', 'https://www.npmjs.com', 'package', 'discovery'),
  ('depsdev', 'api.deps.dev dependent counts (no names)', 'https://api.deps.dev/v3alpha', NULL, 'enrichment'),
  ('github-dependents-html', 'github.com network/dependents HTML; inflated, stale, transitive: discovery only', 'https://github.com', 'repository', 'discovery'),
  ('github-api', 'GitHub REST/GraphQL via Octokit: repo metadata, default-branch manifests and lockfiles, profiles, blame; authoritative for repository edges', 'https://api.github.com', 'repository', 'verification'),
  ('git-history', 'blobless clone + sampled/bisected manifest history and git log -S', NULL, NULL, 'history'),
  ('manual', 'human research; must cite evidence text or URL', NULL, NULL, 'manual');

-- revert:
--   DELETE FROM developers.source WHERE id IN ('npm-registry','npm-downloads','ecosystems','npm-web','depsdev','github-dependents-html','github-api','git-history','manual');
-- verify:
--   SELECT 1/(count(*) - 8) FROM developers.source WHERE id IN ('npm-registry','npm-downloads','ecosystems','npm-web','depsdev','github-dependents-html','github-api','git-history','manual');


-- Deploy schemas/developers/seeds/category_family to pg

-- requires: schemas/developers/tables/category_family/table

INSERT INTO developers.category_family (category_name, family) VALUES
  ('math', 'personal'),
  ('utils', 'utils'), ('misc', 'utils'),
  ('cosmology', 'chain'), ('cosmos-kit', 'chain'), ('cosmos-kit-wallets', 'chain'), ('create-cosmos-app', 'chain'),
  ('interchain-kit', 'chain'), ('interchain-kit-wallets', 'chain'), ('interchain-js', 'chain'), ('interchain-ui', 'chain'),
  ('chain-registry', 'chain'), ('telescope', 'chain'), ('cosmwasm', 'chain'), ('hyperwebjs', 'chain'), ('protobufs', 'chain'),
  ('starship', 'chain'), ('osmosis', 'chain'), ('juno', 'chain'), ('stride', 'chain'), ('stargaze', 'chain'), ('dydx', 'chain'),
  ('quicksilver', 'chain'), ('chain', 'chain'), ('boilerplates', 'chain');

-- revert:
--   DELETE FROM developers.category_family;
-- verify:
--   SELECT 1/count(*) FROM developers.category_family WHERE category_name = 'chain';


-- Deploy schemas/developers/views/our_package to pg

-- requires: schemas/developers/tables/tracked_target/table
-- requires: schemas/developers/tables/package/table
-- requires: schemas/developers/tables/category_family/table
-- requires: npm:npm

CREATE VIEW developers.our_package AS

SELECT t.package_id,
       p.name,
       t.reason,
       np.creation_date,
       np.is_active,
       COALESCE(array_agg(c.name ORDER BY c.name) FILTER (WHERE c.name IS NOT NULL), '{}'::text[]) AS categories,
       COALESCE(
         (SELECT cf2.family FROM npm_count.package_category pc2
            LEFT JOIN npm_count.category c2 ON c2.id = pc2.category_id
            LEFT JOIN developers.category_family cf2 ON cf2.category_name = c2.name
           WHERE pc2.package_id = p.name
           ORDER BY CASE COALESCE(cf2.family, 'cloud') WHEN 'cloud' THEN 0 WHEN 'chain' THEN 1 WHEN 'utils' THEN 2 ELSE 3 END
           LIMIT 1),
         'cloud') AS family
FROM developers.tracked_target t
JOIN developers.package p ON p.id = t.package_id
LEFT JOIN npm_count.npm_package np ON np.package_name = p.name
LEFT JOIN npm_count.package_category pc ON pc.package_id = np.package_name
LEFT JOIN npm_count.category c ON c.id = pc.category_id
GROUP BY t.package_id, p.name, t.reason, np.creation_date, np.is_active;

COMMENT ON VIEW developers.our_package IS 'Our packages with lib-count categories and brand family (cloud | chain | utils | personal, defaulting to cloud like categories.ts).';

-- revert:
--   DROP VIEW developers.our_package;
-- verify:
--   SELECT assert_view('developers.our_package'::regclass);


-- Deploy schemas/developers/views/current_dependents to pg

-- requires: schemas/developers/tables/dependency_edge/table
-- requires: schemas/developers/tables/package/table
-- requires: schemas/developers/tables/repository/table

CREATE VIEW developers.current_dependents AS

SELECT e.id AS edge_id,
       tp.name AS target_name,
       e.hop,
       e.dependent_kind,
       COALESCE(dp.name, r.full_name::text) AS dependent_key,
       e.dependent_package_id,
       e.dependent_repository_id,
       e.manifest_path,
       e.dep_type,
       e.version_range,
       e.first_seen_at,
       e.last_seen_at,
       r.is_fork,
       r.archived
FROM developers.dependency_edge e
JOIN developers.package tp ON tp.id = e.target_package_id
LEFT JOIN developers.package dp ON dp.id = e.dependent_package_id
LEFT JOIN developers.repository r ON r.id = e.dependent_repository_id
WHERE e.removed_at IS NULL;

COMMENT ON VIEW developers.current_dependents IS 'Edges currently believed present (removed_at IS NULL), with names resolved.';

-- revert:
--   DROP VIEW developers.current_dependents;
-- verify:
--   SELECT assert_view('developers.current_dependents'::regclass);


-- Deploy schemas/developers/procedures/new_dependents to pg

-- requires: schemas/developers/views/current_dependents

CREATE FUNCTION developers.new_dependents(_since timestamptz) RETURNS SETOF developers.current_dependents AS $$
  SELECT * FROM developers.current_dependents WHERE first_seen_at >= _since ORDER BY first_seen_at DESC;
$$ LANGUAGE sql STABLE;

COMMENT ON FUNCTION developers.new_dependents(timestamptz) IS 'Current edges first seen at or after _since.';

-- revert:
--   DROP FUNCTION developers.new_dependents(timestamptz);
-- verify:
--   SELECT assert_function('developers.new_dependents(timestamptz)'::regprocedure);


-- Deploy schemas/developers/procedures/lost_dependents to pg

-- requires: schemas/developers/tables/dependency_edge/table
-- requires: schemas/developers/tables/package/table
-- requires: schemas/developers/tables/repository/table

CREATE FUNCTION developers.lost_dependents(_since timestamptz)
RETURNS TABLE (edge_id uuid, target_name text, hop smallint, dependent_kind text, dependent_key text, first_seen_at timestamptz, last_seen_at timestamptz, removed_at timestamptz, removed_by_run_id uuid) AS $$
  SELECT e.id, tp.name, e.hop, e.dependent_kind, COALESCE(dp.name, r.full_name::text), e.first_seen_at, e.last_seen_at, e.removed_at, e.removed_by_run_id
  FROM developers.dependency_edge e
  JOIN developers.package tp ON tp.id = e.target_package_id
  LEFT JOIN developers.package dp ON dp.id = e.dependent_package_id
  LEFT JOIN developers.repository r ON r.id = e.dependent_repository_id
  WHERE e.removed_at IS NOT NULL AND e.removed_at >= _since
  ORDER BY e.removed_at DESC;
$$ LANGUAGE sql STABLE;

COMMENT ON FUNCTION developers.lost_dependents(timestamptz) IS 'Edges removed at or after _since (only complete runs remove edges).';

-- revert:
--   DROP FUNCTION developers.lost_dependents(timestamptz);
-- verify:
--   SELECT assert_function('developers.lost_dependents(timestamptz)'::regprocedure);


-- Deploy schemas/developers/views/adoption_by_week to pg

-- requires: schemas/developers/views/our_package
-- requires: schemas/developers/tables/dependency_edge/table
-- requires: npm:npm

CREATE VIEW developers.adoption_by_week AS

WITH weeks AS (
  SELECT date_trunc('week', d)::date AS week_start
  FROM generate_series(date_trunc('week', (SELECT min(first_seen_at) FROM developers.dependency_edge)), date_trunc('week', now()), interval '1 week') AS d
)
SELECT o.package_id, o.name AS target_name, w.week_start,
       (SELECT count(*) FROM developers.dependency_edge e
         WHERE e.target_package_id = o.package_id AND e.hop = 1
           AND e.first_seen_at < w.week_start + 7
           AND (e.removed_at IS NULL OR e.removed_at >= w.week_start + 7)) AS dependents,
       (SELECT sum(dd.download_count) FROM npm_count.daily_downloads dd
         WHERE dd.package_name = o.name AND dd.date >= w.week_start AND dd.date < w.week_start + 7) AS downloads
FROM developers.our_package o
CROSS JOIN weeks w;

COMMENT ON VIEW developers.adoption_by_week IS 'Per our package per ISO week: how many hop-1 dependents were present vs our npm downloads that week (npm_count.daily_downloads).';

-- revert:
--   DROP VIEW developers.adoption_by_week;
-- verify:
--   SELECT assert_view('developers.adoption_by_week'::regclass);


-- Deploy schemas/developers/views/transitive_reach to pg

-- requires: schemas/developers/views/our_package
-- requires: schemas/developers/tables/dependency_edge/table
-- requires: schemas/developers/tables/target_count_snapshot/table

CREATE VIEW developers.transitive_reach AS

SELECT o.package_id, o.name AS target_name,
       (SELECT count(*) FROM developers.dependency_edge e WHERE e.target_package_id = o.package_id AND e.hop = 1 AND e.removed_at IS NULL) AS direct_dependents,
       (SELECT count(DISTINCT e2.dependent_package_id) FROM developers.dependency_edge e1
          JOIN developers.dependency_edge e2 ON e2.target_package_id = e1.dependent_package_id AND e2.hop = 2 AND e2.removed_at IS NULL
         WHERE e1.target_package_id = o.package_id AND e1.hop = 1 AND e1.removed_at IS NULL) AS hop2_dependents,
       (SELECT s.indirect_count FROM developers.target_count_snapshot s WHERE s.package_id = o.package_id AND s.source_id = 'depsdev' ORDER BY s.observed_on DESC LIMIT 1) AS depsdev_indirect_count
FROM developers.our_package o;

COMMENT ON VIEW developers.transitive_reach IS 'Direct and bounded second-hop reach per our package, with the latest deps.dev indirect count for comparison.';

-- revert:
--   DROP VIEW developers.transitive_reach;
-- verify:
--   SELECT assert_view('developers.transitive_reach'::regclass);


-- Deploy schemas/developers/views/top_dependents to pg

-- requires: schemas/developers/views/current_dependents
-- requires: schemas/developers/tables/package_download_snapshot/table
-- requires: schemas/developers/tables/repository_snapshot/table

CREATE VIEW developers.top_dependents AS

SELECT c.*,
       (SELECT s.downloads FROM developers.package_download_snapshot s WHERE s.package_id = c.dependent_package_id AND s.period = 'last-week' ORDER BY s.window_end DESC LIMIT 1) AS weekly_downloads,
       (SELECT rs.stars FROM developers.repository_snapshot rs WHERE rs.repository_id = c.dependent_repository_id ORDER BY rs.observed_on DESC LIMIT 1) AS stars
FROM developers.current_dependents c
WHERE c.hop = 1;

COMMENT ON VIEW developers.top_dependents IS 'Current hop-1 dependents with their latest weekly downloads (packages) or stars (repositories) for ranking.';

-- revert:
--   DROP VIEW developers.top_dependents;
-- verify:
--   SELECT assert_view('developers.top_dependents'::regclass);


-- Deploy schemas/developers/views/public_counts to pg

-- requires: schemas/developers/views/our_package
-- requires: schemas/developers/tables/dependency_edge/table

CREATE VIEW developers.public_counts AS

SELECT o.name AS package_name,
       count(*) FILTER (WHERE e.dependent_kind = 'package') AS dependent_packages,
       count(*) FILTER (WHERE e.dependent_kind = 'repository') AS dependent_repositories
FROM developers.our_package o
LEFT JOIN developers.dependency_edge e ON e.target_package_id = o.package_id AND e.hop = 1 AND e.removed_at IS NULL
GROUP BY o.name;

COMMENT ON VIEW developers.public_counts IS 'PII-free aggregate: current dependent package and repository counts per our package. The only view that may ever be published, and only after approval.';

-- revert:
--   DROP VIEW developers.public_counts;
-- verify:
--   SELECT assert_view('developers.public_counts'::regclass);


-- ============================================================================
-- module: developers-private   (packages/developers-private/developers-private.control)
-- # developers-private extension
-- comment = 'developers-private extension'
-- default_version = '0.0.1'
-- module_pathname = '$libdir/developers-private'
-- requires = 'plpgsql,uuid-ossp,citext,pgpm-verify,developers'
-- relocatable = false
-- superuser = false
-- ============================================================================

-- Deploy schemas/developers_private/schema to pg

-- requires: developers:schemas/developers/schema

CREATE SCHEMA developers_private;

COMMENT ON SCHEMA developers_private IS 'developers graph, private half: accounts, people, organizations and employment claims. Never dumped, exported or published.';

-- revert:
--   DROP SCHEMA developers_private;
-- verify:
--   SELECT assert_schema('developers_private'::regnamespace);


-- Deploy schemas/developers_private/tables/account/table to pg

-- requires: schemas/developers_private/schema
-- requires: developers:schemas/developers/tables/source/table

CREATE TABLE developers_private.account (
  id uuid PRIMARY KEY,
  platform text NOT NULL CHECK (platform IN ('github', 'npm')),
  login citext NOT NULL,
  kind text CHECK (kind IN ('user', 'organization', 'unknown')),
  display_name text,
  company_raw text,
  blog text,
  location text,
  bio text,
  platform_id bigint,
  source_id text NOT NULL REFERENCES developers.source (id),
  fetched_at timestamptz,
  UNIQUE (platform, login),
  CHECK (id = uuid_generate_v5(uuid_ns_url(), 'developers:account:' || platform || ':' || lower(login::text)))
);

COMMENT ON TABLE developers_private.account IS 'A public profile on one platform, copied verbatim from the platform API. No email addresses are stored, ever.';
COMMENT ON COLUMN developers_private.account.id IS 'Deterministic uuid v5 of (platform, lower(login)).';
COMMENT ON COLUMN developers_private.account.platform IS 'github or npm.';
COMMENT ON COLUMN developers_private.account.login IS 'Platform login, case-insensitive.';
COMMENT ON COLUMN developers_private.account.kind IS 'user, organization or unknown.';
COMMENT ON COLUMN developers_private.account.display_name IS 'Profile name as published.';
COMMENT ON COLUMN developers_private.account.company_raw IS 'GitHub company field, verbatim and self-reported.';
COMMENT ON COLUMN developers_private.account.blog IS 'Profile website.';
COMMENT ON COLUMN developers_private.account.location IS 'Profile location, verbatim.';
COMMENT ON COLUMN developers_private.account.bio IS 'Profile bio, verbatim.';
COMMENT ON COLUMN developers_private.account.platform_id IS 'Numeric platform id when the platform has one.';
COMMENT ON COLUMN developers_private.account.source_id IS 'Source that fetched it.';
COMMENT ON COLUMN developers_private.account.fetched_at IS 'Last refresh.';
CREATE INDEX account_source_id_idx ON developers_private.account (source_id);

-- revert:
--   DROP TABLE developers_private.account;
-- verify:
--   SELECT assert_table('developers_private.account'::regclass);
--   SELECT assert_index('developers_private.account_source_id_idx'::regclass, 'developers_private.account'::regclass);


-- Deploy schemas/developers_private/tables/person/table to pg

-- requires: schemas/developers_private/schema

CREATE TABLE developers_private.person (
  id uuid PRIMARY KEY DEFAULT uuid_generate_v4(),
  display_name text NOT NULL,
  notes text,
  created_at timestamptz NOT NULL DEFAULT now()
);

COMMENT ON TABLE developers_private.person IS 'A human, possibly with several accounts. Created by the people task or by hand; the link to accounts carries the method and confidence.';
COMMENT ON COLUMN developers_private.person.id IS 'Person id.';
COMMENT ON COLUMN developers_private.person.display_name IS 'Name to show, taken from the primary account.';
COMMENT ON COLUMN developers_private.person.notes IS 'Free-form research notes.';
COMMENT ON COLUMN developers_private.person.created_at IS 'Creation time.';

-- revert:
--   DROP TABLE developers_private.person;
-- verify:
--   SELECT assert_table('developers_private.person'::regclass);


-- Deploy schemas/developers_private/tables/person_account/table to pg

-- requires: schemas/developers_private/tables/person/table
-- requires: schemas/developers_private/tables/account/table
-- requires: developers:schemas/developers/tables/source/table
-- requires: developers:schemas/developers/types/confidence

CREATE TABLE developers_private.person_account (
  person_id uuid NOT NULL REFERENCES developers_private.person (id) ON DELETE CASCADE,
  account_id uuid NOT NULL REFERENCES developers_private.account (id) ON DELETE CASCADE,
  method text NOT NULL CHECK (method IN ('same-login', 'npm-repo-owner', 'name-match', 'manual')),
  confidence developers.confidence NOT NULL,
  source_id text NOT NULL REFERENCES developers.source (id),
  evidence text,
  PRIMARY KEY (person_id, account_id),
  UNIQUE (account_id)
);

COMMENT ON TABLE developers_private.person_account IS 'Identity resolution: which accounts belong to a person, how that was decided and how sure we are. An account belongs to at most one person.';
COMMENT ON COLUMN developers_private.person_account.person_id IS 'The person.';
COMMENT ON COLUMN developers_private.person_account.account_id IS 'The account.';
COMMENT ON COLUMN developers_private.person_account.method IS 'same-login | npm-repo-owner | name-match | manual.';
COMMENT ON COLUMN developers_private.person_account.confidence IS 'high | medium | low | unknown.';
COMMENT ON COLUMN developers_private.person_account.source_id IS 'Source of the link.';
COMMENT ON COLUMN developers_private.person_account.evidence IS 'Why: URL or text.';
CREATE INDEX person_account_source_id_idx ON developers_private.person_account (source_id);

-- revert:
--   DROP TABLE developers_private.person_account;
-- verify:
--   SELECT assert_table('developers_private.person_account'::regclass);
--   SELECT assert_index('developers_private.person_account_source_id_idx'::regclass, 'developers_private.person_account'::regclass);


-- Deploy schemas/developers_private/tables/organization/table to pg

-- requires: schemas/developers_private/tables/account/table
-- requires: developers:schemas/developers/tables/source/table
-- requires: developers:schemas/developers/types/confidence

CREATE TABLE developers_private.organization (
  id uuid PRIMARY KEY DEFAULT uuid_generate_v4(),
  name text NOT NULL,
  domain citext UNIQUE,
  kind text CHECK (kind IN ('company', 'oss-project', 'affiliated', 'individual', 'noise')),
  github_account_id uuid REFERENCES developers_private.account (id),
  npm_scope text,
  source_id text NOT NULL REFERENCES developers.source (id),
  confidence developers.confidence NOT NULL,
  evidence text
);

COMMENT ON TABLE developers_private.organization IS 'A company or project behind dependents (not just a GitHub org).';
COMMENT ON COLUMN developers_private.organization.id IS 'Organization id.';
COMMENT ON COLUMN developers_private.organization.name IS 'Display name.';
COMMENT ON COLUMN developers_private.organization.domain IS 'Primary web domain, unique.';
COMMENT ON COLUMN developers_private.organization.kind IS 'company | oss-project | affiliated (our own orbit) | individual | noise (forks, tutorials).';
COMMENT ON COLUMN developers_private.organization.github_account_id IS 'The GitHub organization account, if any.';
COMMENT ON COLUMN developers_private.organization.npm_scope IS 'npm scope it publishes under, e.g. @acme.';
COMMENT ON COLUMN developers_private.organization.source_id IS 'Source of the classification.';
COMMENT ON COLUMN developers_private.organization.confidence IS 'Confidence in kind/identity.';
COMMENT ON COLUMN developers_private.organization.evidence IS 'Why.';
CREATE INDEX organization_github_account_id_idx ON developers_private.organization (github_account_id);
CREATE INDEX organization_source_id_idx ON developers_private.organization (source_id);

-- revert:
--   DROP TABLE developers_private.organization;
-- verify:
--   SELECT assert_table('developers_private.organization'::regclass);
--   SELECT assert_index('developers_private.organization_github_account_id_idx'::regclass, 'developers_private.organization'::regclass);
--   SELECT assert_index('developers_private.organization_source_id_idx'::regclass, 'developers_private.organization'::regclass);


-- Deploy schemas/developers_private/tables/repository_owner/table to pg

-- requires: schemas/developers_private/tables/organization/table
-- requires: developers:schemas/developers/tables/repository/table
-- requires: developers:schemas/developers/tables/source/table
-- requires: developers:schemas/developers/types/confidence

CREATE TABLE developers_private.repository_owner (
  repository_id uuid NOT NULL REFERENCES developers.repository (id) ON DELETE CASCADE,
  organization_id uuid NOT NULL REFERENCES developers_private.organization (id) ON DELETE CASCADE,
  source_id text NOT NULL REFERENCES developers.source (id),
  confidence developers.confidence NOT NULL,
  evidence text,
  PRIMARY KEY (repository_id, organization_id)
);

COMMENT ON TABLE developers_private.repository_owner IS 'Which organization owns a dependent repository (org-owned repo = high; inferred from profile = medium/low).';
COMMENT ON COLUMN developers_private.repository_owner.repository_id IS 'The repository.';
COMMENT ON COLUMN developers_private.repository_owner.organization_id IS 'The owner.';
COMMENT ON COLUMN developers_private.repository_owner.source_id IS 'Source.';
COMMENT ON COLUMN developers_private.repository_owner.confidence IS 'Confidence.';
COMMENT ON COLUMN developers_private.repository_owner.evidence IS 'Why.';
CREATE INDEX repository_owner_organization_id_idx ON developers_private.repository_owner (organization_id);
CREATE INDEX repository_owner_source_id_idx ON developers_private.repository_owner (source_id);

-- revert:
--   DROP TABLE developers_private.repository_owner;
-- verify:
--   SELECT assert_table('developers_private.repository_owner'::regclass);
--   SELECT assert_index('developers_private.repository_owner_organization_id_idx'::regclass, 'developers_private.repository_owner'::regclass);
--   SELECT assert_index('developers_private.repository_owner_source_id_idx'::regclass, 'developers_private.repository_owner'::regclass);


-- Deploy schemas/developers_private/tables/employment_claim/table to pg

-- requires: schemas/developers_private/tables/person/table
-- requires: schemas/developers_private/tables/organization/table
-- requires: developers:schemas/developers/tables/source/table
-- requires: developers:schemas/developers/types/confidence

CREATE TABLE developers_private.employment_claim (
  id uuid PRIMARY KEY DEFAULT uuid_generate_v4(),
  person_id uuid NOT NULL REFERENCES developers_private.person (id) ON DELETE CASCADE,
  organization_id uuid NOT NULL REFERENCES developers_private.organization (id),
  title text,
  evidence text NOT NULL,
  evidence_url text,
  source_id text NOT NULL REFERENCES developers.source (id),
  confidence developers.confidence NOT NULL,
  observed_at timestamptz NOT NULL DEFAULT now(),
  valid_from date,
  valid_to date,
  superseded_by uuid REFERENCES developers_private.employment_claim (id)
);

COMMENT ON TABLE developers_private.employment_claim IS 'A claim that a person works (or worked) at an organization. Never a bare fact: evidence, source and confidence are mandatory. GitHub company field => medium.';
COMMENT ON COLUMN developers_private.employment_claim.id IS 'Claim id.';
COMMENT ON COLUMN developers_private.employment_claim.person_id IS 'The person.';
COMMENT ON COLUMN developers_private.employment_claim.organization_id IS 'The employer.';
COMMENT ON COLUMN developers_private.employment_claim.title IS 'Role title if stated.';
COMMENT ON COLUMN developers_private.employment_claim.evidence IS 'Quoted text that supports the claim.';
COMMENT ON COLUMN developers_private.employment_claim.evidence_url IS 'URL of the evidence.';
COMMENT ON COLUMN developers_private.employment_claim.source_id IS 'Source.';
COMMENT ON COLUMN developers_private.employment_claim.confidence IS 'Confidence.';
COMMENT ON COLUMN developers_private.employment_claim.observed_at IS 'When the evidence was seen.';
COMMENT ON COLUMN developers_private.employment_claim.valid_from IS 'Start date if known.';
COMMENT ON COLUMN developers_private.employment_claim.valid_to IS 'End date if known.';
COMMENT ON COLUMN developers_private.employment_claim.superseded_by IS 'A newer claim that replaces this one.';
CREATE INDEX employment_claim_person_id_idx ON developers_private.employment_claim (person_id);
CREATE INDEX employment_claim_organization_id_idx ON developers_private.employment_claim (organization_id);
CREATE INDEX employment_claim_source_id_idx ON developers_private.employment_claim (source_id);
CREATE INDEX employment_claim_superseded_by_idx ON developers_private.employment_claim (superseded_by);

-- revert:
--   DROP TABLE developers_private.employment_claim;
-- verify:
--   SELECT assert_table('developers_private.employment_claim'::regclass);
--   SELECT assert_index('developers_private.employment_claim_person_id_idx'::regclass, 'developers_private.employment_claim'::regclass);
--   SELECT assert_index('developers_private.employment_claim_organization_id_idx'::regclass, 'developers_private.employment_claim'::regclass);
--   SELECT assert_index('developers_private.employment_claim_source_id_idx'::regclass, 'developers_private.employment_claim'::regclass);
--   SELECT assert_index('developers_private.employment_claim_superseded_by_idx'::regclass, 'developers_private.employment_claim'::regclass);


-- Deploy schemas/developers_private/tables/package_maintainer/table to pg

-- requires: schemas/developers_private/tables/account/table
-- requires: developers:schemas/developers/tables/package/table
-- requires: developers:schemas/developers/tables/source/table

CREATE TABLE developers_private.package_maintainer (
  package_id uuid NOT NULL REFERENCES developers.package (id) ON DELETE CASCADE,
  account_id uuid NOT NULL REFERENCES developers_private.account (id) ON DELETE CASCADE,
  role text NOT NULL DEFAULT 'maintainer' CHECK (role IN ('maintainer', 'publisher', 'author')),
  source_id text NOT NULL REFERENCES developers.source (id),
  first_seen_at timestamptz NOT NULL DEFAULT now(),
  last_seen_at timestamptz NOT NULL DEFAULT now(),
  PRIMARY KEY (package_id, account_id, role)
);

COMMENT ON TABLE developers_private.package_maintainer IS 'npm maintainers/publishers/authors of a package, from the packument.';
COMMENT ON COLUMN developers_private.package_maintainer.package_id IS 'The package.';
COMMENT ON COLUMN developers_private.package_maintainer.account_id IS 'The npm account.';
COMMENT ON COLUMN developers_private.package_maintainer.role IS 'maintainer | publisher | author.';
COMMENT ON COLUMN developers_private.package_maintainer.source_id IS 'Source.';
COMMENT ON COLUMN developers_private.package_maintainer.first_seen_at IS 'First time seen in this role.';
COMMENT ON COLUMN developers_private.package_maintainer.last_seen_at IS 'Last time seen.';
CREATE INDEX package_maintainer_account_id_idx ON developers_private.package_maintainer (account_id);
CREATE INDEX package_maintainer_source_id_idx ON developers_private.package_maintainer (source_id);

-- revert:
--   DROP TABLE developers_private.package_maintainer;
-- verify:
--   SELECT assert_table('developers_private.package_maintainer'::regclass);
--   SELECT assert_index('developers_private.package_maintainer_account_id_idx'::regclass, 'developers_private.package_maintainer'::regclass);
--   SELECT assert_index('developers_private.package_maintainer_source_id_idx'::regclass, 'developers_private.package_maintainer'::regclass);


-- Deploy schemas/developers_private/tables/edge_commit_event/table to pg

-- requires: schemas/developers_private/tables/account/table
-- requires: developers:schemas/developers/tables/dependency_edge/table
-- requires: developers:schemas/developers/tables/source/table

CREATE TABLE developers_private.edge_commit_event (
  edge_id uuid NOT NULL REFERENCES developers.dependency_edge (id) ON DELETE CASCADE,
  event text NOT NULL CHECK (event IN ('added', 'removed', 'last_touched', 'version_bump')),
  commit_sha text NOT NULL,
  committed_on date,
  author_account_id uuid REFERENCES developers_private.account (id),
  author_name text,
  message text,
  source_id text NOT NULL REFERENCES developers.source (id),
  PRIMARY KEY (edge_id, event, commit_sha)
);

COMMENT ON TABLE developers_private.edge_commit_event IS 'Who added, removed or last touched the dependency line in a dependent repository (the champion), from git history or blame. No commit emails.';
COMMENT ON COLUMN developers_private.edge_commit_event.edge_id IS 'The edge.';
COMMENT ON COLUMN developers_private.edge_commit_event.event IS 'added | removed | last_touched | version_bump.';
COMMENT ON COLUMN developers_private.edge_commit_event.commit_sha IS 'Commit sha.';
COMMENT ON COLUMN developers_private.edge_commit_event.committed_on IS 'Commit date.';
COMMENT ON COLUMN developers_private.edge_commit_event.author_account_id IS 'Resolved GitHub account, when the commit is linked to one.';
COMMENT ON COLUMN developers_private.edge_commit_event.author_name IS 'Commit author name as written in git (no email).';
COMMENT ON COLUMN developers_private.edge_commit_event.message IS 'First line of the commit message.';
COMMENT ON COLUMN developers_private.edge_commit_event.source_id IS 'git-history or github-api (blame).';
CREATE INDEX edge_commit_event_author_account_id_idx ON developers_private.edge_commit_event (author_account_id);
CREATE INDEX edge_commit_event_source_id_idx ON developers_private.edge_commit_event (source_id);

-- revert:
--   DROP TABLE developers_private.edge_commit_event;
-- verify:
--   SELECT assert_table('developers_private.edge_commit_event'::regclass);
--   SELECT assert_index('developers_private.edge_commit_event_author_account_id_idx'::regclass, 'developers_private.edge_commit_event'::regclass);
--   SELECT assert_index('developers_private.edge_commit_event_source_id_idx'::regclass, 'developers_private.edge_commit_event'::regclass);


-- Deploy schemas/developers_private/tables/annotation/table to pg

-- requires: schemas/developers_private/schema
-- requires: developers:schemas/developers/tables/source/table
-- requires: developers:schemas/developers/types/confidence

CREATE TABLE developers_private.annotation (
  id uuid PRIMARY KEY DEFAULT uuid_generate_v4(),
  entity_type text NOT NULL CHECK (entity_type IN ('package', 'repository', 'account', 'person', 'organization', 'edge')),
  entity_id uuid NOT NULL,
  key text NOT NULL,
  value text,
  source_id text NOT NULL REFERENCES developers.source (id),
  confidence developers.confidence,
  author text,
  created_at timestamptz NOT NULL DEFAULT now()
);

COMMENT ON TABLE developers_private.annotation IS 'Free-form, sourced notes on any entity (replaces the scaffold''s annotations.py).';
COMMENT ON COLUMN developers_private.annotation.id IS 'Annotation id.';
COMMENT ON COLUMN developers_private.annotation.entity_type IS 'Which table entity_id points into.';
COMMENT ON COLUMN developers_private.annotation.entity_id IS 'The entity.';
COMMENT ON COLUMN developers_private.annotation.key IS 'Note key, e.g. noise-reason.';
COMMENT ON COLUMN developers_private.annotation.value IS 'Note value.';
COMMENT ON COLUMN developers_private.annotation.source_id IS 'Source.';
COMMENT ON COLUMN developers_private.annotation.confidence IS 'Confidence if the note is a claim.';
COMMENT ON COLUMN developers_private.annotation.author IS 'Who wrote it.';
COMMENT ON COLUMN developers_private.annotation.created_at IS 'When.';
CREATE INDEX annotation_entity_idx ON developers_private.annotation (entity_type, entity_id);
CREATE INDEX annotation_source_id_idx ON developers_private.annotation (source_id);

-- revert:
--   DROP TABLE developers_private.annotation;
-- verify:
--   SELECT assert_table('developers_private.annotation'::regclass);
--   SELECT assert_index('developers_private.annotation_entity_idx'::regclass, 'developers_private.annotation'::regclass);
--   SELECT assert_index('developers_private.annotation_source_id_idx'::regclass, 'developers_private.annotation'::regclass);


-- Deploy schemas/developers_private/views/developers_by_company to pg

-- requires: schemas/developers_private/tables/organization/table
-- requires: schemas/developers_private/tables/repository_owner/table
-- requires: developers:schemas/developers/views/current_dependents

CREATE VIEW developers_private.developers_by_company AS

SELECT o.name AS company, o.kind, o.domain,
       count(DISTINCT c.edge_id) AS current_edges,
       count(DISTINCT c.dependent_repository_id) AS repositories,
       count(DISTINCT c.target_name) AS our_packages_used,
       array_agg(DISTINCT c.target_name ORDER BY c.target_name) AS packages
FROM developers_private.organization o
JOIN developers_private.repository_owner ro ON ro.organization_id = o.id
JOIN developers.current_dependents c ON c.dependent_repository_id = ro.repository_id AND c.hop = 1
GROUP BY o.id, o.name, o.kind, o.domain;

COMMENT ON VIEW developers_private.developers_by_company IS 'Current dependents rolled up to the owning company/organization.';

-- revert:
--   DROP VIEW developers_private.developers_by_company;
-- verify:
--   SELECT assert_view('developers_private.developers_by_company'::regclass);


-- Deploy schemas/developers_private/views/champions to pg

-- requires: schemas/developers_private/tables/edge_commit_event/table
-- requires: schemas/developers_private/tables/account/table
-- requires: developers:schemas/developers/views/current_dependents

CREATE VIEW developers_private.champions AS

SELECT c.target_name, c.dependent_key, ev.event, ev.committed_on, ev.commit_sha,
       a.login AS author_login, a.display_name, a.company_raw, ev.author_name, ev.source_id
FROM developers_private.edge_commit_event ev
JOIN developers.current_dependents c ON c.edge_id = ev.edge_id
LEFT JOIN developers_private.account a ON a.id = ev.author_account_id
WHERE ev.event IN ('added', 'last_touched');

COMMENT ON VIEW developers_private.champions IS 'The developer who added (or last touched) our dependency in each current dependent.';

-- revert:
--   DROP VIEW developers_private.champions;
-- verify:
--   SELECT assert_view('developers_private.champions'::regclass);


-- Deploy schemas/developers_private/views/contributor_overlap to pg

-- requires: schemas/developers_private/tables/account/table
-- requires: github:contributors

CREATE VIEW developers_private.contributor_overlap AS

SELECT DISTINCT a.login, a.display_name, a.company_raw, gc.login AS our_contributor_login
FROM developers_private.account a
JOIN github.contributor gc ON gc.login = a.login::text
WHERE a.platform = 'github';

COMMENT ON VIEW developers_private.contributor_overlap IS 'Dependents'' developers who are also contributors to our own repositories (github.contributor from the lib-count github module, joined by login, never by FK).';

-- revert:
--   DROP VIEW developers_private.contributor_overlap;
-- verify:
--   SELECT assert_view('developers_private.contributor_overlap'::regclass);


-- Deploy schemas/developers_private/procedures/new_developers to pg

-- requires: schemas/developers_private/views/champions

CREATE FUNCTION developers_private.new_developers(_since timestamptz)
RETURNS TABLE (author_login citext, display_name text, company_raw text, target_name text, dependent_key text, first_seen_at timestamptz) AS $$
  SELECT a.login, a.display_name, a.company_raw, c.target_name, c.dependent_key, c.first_seen_at
  FROM developers.current_dependents c
  JOIN developers_private.edge_commit_event ev ON ev.edge_id = c.edge_id AND ev.event = 'added'
  LEFT JOIN developers_private.account a ON a.id = ev.author_account_id
  WHERE c.first_seen_at >= _since
  ORDER BY c.first_seen_at DESC;
$$ LANGUAGE sql STABLE;

COMMENT ON FUNCTION developers_private.new_developers(timestamptz) IS 'Developers behind edges first seen since _since.';

-- revert:
--   DROP FUNCTION developers_private.new_developers(timestamptz);
-- verify:
--   SELECT assert_function('developers_private.new_developers(timestamptz)'::regprocedure);


-- Deploy schemas/developers_private/procedures/lost_developers to pg

-- requires: schemas/developers_private/tables/edge_commit_event/table
-- requires: schemas/developers_private/tables/account/table
-- requires: developers:schemas/developers/procedures/lost_dependents

CREATE FUNCTION developers_private.lost_developers(_since timestamptz)
RETURNS TABLE (author_login citext, display_name text, company_raw text, target_name text, dependent_key text, removed_at timestamptz) AS $$
  SELECT a.login, a.display_name, a.company_raw, l.target_name, l.dependent_key, l.removed_at
  FROM developers.lost_dependents(_since) l
  LEFT JOIN developers_private.edge_commit_event ev ON ev.edge_id = l.edge_id AND ev.event = 'removed'
  LEFT JOIN developers_private.account a ON a.id = ev.author_account_id
  ORDER BY l.removed_at DESC;
$$ LANGUAGE sql STABLE;

COMMENT ON FUNCTION developers_private.lost_developers(timestamptz) IS 'Developers behind edges removed since _since (who removed us, when known).';

-- revert:
--   DROP FUNCTION developers_private.lost_developers(timestamptz);
-- verify:
--   SELECT assert_function('developers_private.lost_developers(timestamptz)'::regprocedure);

