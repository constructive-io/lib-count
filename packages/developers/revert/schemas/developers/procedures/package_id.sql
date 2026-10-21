-- Revert schemas/developers/procedures/package_id from pg

DROP FUNCTION developers.package_id(_ecosystem text, _name text);
