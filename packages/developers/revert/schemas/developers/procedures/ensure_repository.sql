-- Revert schemas/developers/procedures/ensure_repository from pg

DROP FUNCTION developers.ensure_repository(text, text);
