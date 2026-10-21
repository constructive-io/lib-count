-- Revert schemas/developers_private/procedures/new_developers from pg

DROP FUNCTION developers_private.new_developers(timestamptz);
