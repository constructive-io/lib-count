-- Deploy schemas/developers/schema to pg

CREATE SCHEMA developers;

COMMENT ON SCHEMA developers IS 'developers graph: public-safe facts about packages, repositories and dependency edges on our packages. No people data lives here.';
