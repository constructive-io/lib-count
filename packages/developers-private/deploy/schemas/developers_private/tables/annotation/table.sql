-- Deploy schemas/developers_private/tables/annotation/table to pg

-- requires: schemas/developers_private/schema
-- requires: developers:schemas/developers/tables/source/table
-- requires: developers:schemas/developers/types/confidence

CREATE TABLE developers_private.annotation (
  id uuid PRIMARY KEY DEFAULT uuid_generate_v4(),
  entity_type text NOT NULL CHECK (entity_type IN ('package', 'repository', 'account', 'person', 'organization', 'edge')),
  entity_id uuid NOT NULL,
  key text NOT NULL,
  value text,
  source_id text NOT NULL REFERENCES developers.source (id),
  confidence developers.confidence,
  author text,
  created_at timestamptz NOT NULL DEFAULT now()
);

COMMENT ON TABLE developers_private.annotation IS 'Free-form, sourced notes on any entity (replaces the scaffold''s annotations.py).';
COMMENT ON COLUMN developers_private.annotation.id IS 'Annotation id.';
COMMENT ON COLUMN developers_private.annotation.entity_type IS 'Which table entity_id points into.';
COMMENT ON COLUMN developers_private.annotation.entity_id IS 'The entity.';
COMMENT ON COLUMN developers_private.annotation.key IS 'Note key, e.g. noise-reason.';
COMMENT ON COLUMN developers_private.annotation.value IS 'Note value.';
COMMENT ON COLUMN developers_private.annotation.source_id IS 'Source.';
COMMENT ON COLUMN developers_private.annotation.confidence IS 'Confidence if the note is a claim.';
COMMENT ON COLUMN developers_private.annotation.author IS 'Who wrote it.';
COMMENT ON COLUMN developers_private.annotation.created_at IS 'When.';
CREATE INDEX annotation_entity_idx ON developers_private.annotation (entity_type, entity_id);
CREATE INDEX annotation_source_id_idx ON developers_private.annotation (source_id);
