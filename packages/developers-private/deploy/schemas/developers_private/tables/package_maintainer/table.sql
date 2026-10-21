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
