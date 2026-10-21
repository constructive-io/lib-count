-- Revert schemas/developers/procedures/set_updated_at from pg

DROP FUNCTION developers.set_updated_at();
