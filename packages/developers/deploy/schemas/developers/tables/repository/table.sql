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
