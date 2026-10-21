-- Deploy schemas/developers_private/views/contributor_overlap to pg

-- requires: schemas/developers_private/tables/account/table
-- requires: github:contributors

CREATE VIEW developers_private.contributor_overlap AS

SELECT DISTINCT a.login, a.display_name, a.company_raw, gc.login AS our_contributor_login
FROM developers_private.account a
JOIN github.contributor gc ON gc.login = a.login::text
WHERE a.platform = 'github';

COMMENT ON VIEW developers_private.contributor_overlap IS 'Dependents'' developers who are also contributors to our own repositories (github.contributor from the lib-count github module, joined by login, never by FK).';
