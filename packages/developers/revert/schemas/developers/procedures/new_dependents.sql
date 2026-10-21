-- Revert schemas/developers/procedures/new_dependents from pg

DROP FUNCTION developers.new_dependents(timestamptz);
