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
