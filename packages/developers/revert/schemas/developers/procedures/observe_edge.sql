-- Revert schemas/developers/procedures/observe_edge from pg

DROP FUNCTION developers.observe_edge(uuid, text, text, text, text, text, text, timestamptz);
