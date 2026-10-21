-- Revert schemas/developers_private/procedures/lost_developers from pg

DROP FUNCTION developers_private.lost_developers(timestamptz);
