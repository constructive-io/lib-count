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
