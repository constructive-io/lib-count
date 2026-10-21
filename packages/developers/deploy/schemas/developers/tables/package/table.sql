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
