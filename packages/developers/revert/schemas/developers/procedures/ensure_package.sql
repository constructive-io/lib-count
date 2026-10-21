-- Revert schemas/developers/procedures/ensure_package from pg

DROP FUNCTION developers.ensure_package(text, text);
