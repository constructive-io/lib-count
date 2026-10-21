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
