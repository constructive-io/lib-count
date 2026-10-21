-- Deploy schemas/developers/tables/category_family/table to pg

-- requires: schemas/developers/schema

CREATE TABLE developers.category_family (
  category_name text PRIMARY KEY,
  family text NOT NULL CHECK (family IN ('cloud', 'chain', 'utils', 'personal'))
);

COMMENT ON TABLE developers.category_family IS 'Maps lib-count category names (npm_count.category.name) to the brand rollup used by stats-db categories.ts (brandRollupFor). Categories not listed roll up to cloud, exactly as categories.ts defaults.';
COMMENT ON COLUMN developers.category_family.category_name IS 'npm_count.category.name.';
COMMENT ON COLUMN developers.category_family.family IS 'cloud | chain | utils | personal.';
