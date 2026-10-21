-- Deploy schemas/developers_private/tables/person/table to pg

-- requires: schemas/developers_private/schema

CREATE TABLE developers_private.person (
  id uuid PRIMARY KEY DEFAULT uuid_generate_v4(),
  display_name text NOT NULL,
  notes text,
  created_at timestamptz NOT NULL DEFAULT now()
);

COMMENT ON TABLE developers_private.person IS 'A human, possibly with several accounts. Created by the people task or by hand; the link to accounts carries the method and confidence.';
COMMENT ON COLUMN developers_private.person.id IS 'Person id.';
COMMENT ON COLUMN developers_private.person.display_name IS 'Name to show, taken from the primary account.';
COMMENT ON COLUMN developers_private.person.notes IS 'Free-form research notes.';
COMMENT ON COLUMN developers_private.person.created_at IS 'Creation time.';
