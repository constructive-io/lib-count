-- Deploy schemas/developers_private/schema to pg

-- requires: developers:schemas/developers/schema

CREATE SCHEMA developers_private;

COMMENT ON SCHEMA developers_private IS 'developers graph, private half: accounts, people, organizations and employment claims. Never dumped, exported or published.';
