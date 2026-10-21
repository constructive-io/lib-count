-- Revert schemas/developers/procedures/repository_id from pg

DROP FUNCTION developers.repository_id(_host text, _full_name text);
