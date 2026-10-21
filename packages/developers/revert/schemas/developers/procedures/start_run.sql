-- Revert schemas/developers/procedures/start_run from pg

DROP FUNCTION developers.start_run(text, text, text[], integer, jsonb, text);
