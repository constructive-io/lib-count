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
