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
