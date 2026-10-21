-- Deploy schemas/developers/seeds/category_family to pg

-- requires: schemas/developers/tables/category_family/table

INSERT INTO developers.category_family (category_name, family) VALUES
  ('math', 'personal'),
  ('utils', 'utils'), ('misc', 'utils'),
  ('cosmology', 'chain'), ('cosmos-kit', 'chain'), ('cosmos-kit-wallets', 'chain'), ('create-cosmos-app', 'chain'),
  ('interchain-kit', 'chain'), ('interchain-kit-wallets', 'chain'), ('interchain-js', 'chain'), ('interchain-ui', 'chain'),
  ('chain-registry', 'chain'), ('telescope', 'chain'), ('cosmwasm', 'chain'), ('hyperwebjs', 'chain'), ('protobufs', 'chain'),
  ('starship', 'chain'), ('osmosis', 'chain'), ('juno', 'chain'), ('stride', 'chain'), ('stargaze', 'chain'), ('dydx', 'chain'),
  ('quicksilver', 'chain'), ('chain', 'chain'), ('boilerplates', 'chain');
