-- Revert schemas/developers/procedures/lost_dependents from pg

DROP FUNCTION developers.lost_dependents(timestamptz);
