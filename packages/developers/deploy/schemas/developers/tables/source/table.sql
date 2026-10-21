-- Deploy schemas/developers/tables/source/table to pg

-- requires: schemas/developers/schema

CREATE TABLE developers.source (
  id text PRIMARY KEY,
  description text NOT NULL,
  base_url text,
  dependent_kind text CHECK (dependent_kind IN ('package', 'repository')),
  role text NOT NULL CHECK (role IN ('discovery', 'verification', 'enrichment', 'history', 'manual'))
);

COMMENT ON TABLE developers.source IS 'Where a fact came from. Every observation, snapshot and inferred claim references a source row.';
COMMENT ON COLUMN developers.source.id IS 'Short stable identifier, e.g. npm-registry, ecosystems, github-api.';
COMMENT ON COLUMN developers.source.description IS 'What the source is and how it is used.';
COMMENT ON COLUMN developers.source.base_url IS 'Base URL of the API or site, if any.';
COMMENT ON COLUMN developers.source.dependent_kind IS 'Kind of dependent this source yields when it verifies edges: package or repository. NULL for sources that never verify edges.';
COMMENT ON COLUMN developers.source.role IS 'discovery = proposes candidates (may be incomplete); verification = authoritative for an edge; enrichment = metadata; history = dates; manual = human research.';
