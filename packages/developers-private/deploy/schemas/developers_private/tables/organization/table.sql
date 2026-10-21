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
