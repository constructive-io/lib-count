-- Revert schemas/developers/procedures/close_run from pg

DROP FUNCTION developers.close_run(uuid, text, jsonb, text);
