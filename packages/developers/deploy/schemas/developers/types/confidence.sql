-- Deploy schemas/developers/types/confidence to pg

-- requires: schemas/developers/schema

CREATE TYPE developers.confidence AS ENUM ('high', 'medium', 'low', 'unknown');

COMMENT ON TYPE developers.confidence IS 'How strongly an inferred claim is supported: high = explicit first-party, medium = self-reported or strong indirect link, low = name match or third-party mention, unknown = not assessed.';
