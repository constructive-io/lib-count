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
