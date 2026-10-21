-- Revert schemas/developers/procedures/edge_id from pg

DROP FUNCTION developers.edge_id(text, text, text, text, smallint);
