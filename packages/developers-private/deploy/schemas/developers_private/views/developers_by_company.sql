-- Deploy schemas/developers_private/views/developers_by_company to pg

-- requires: schemas/developers_private/tables/organization/table
-- requires: schemas/developers_private/tables/repository_owner/table
-- requires: developers:schemas/developers/views/current_dependents

CREATE VIEW developers_private.developers_by_company AS

SELECT o.name AS company, o.kind, o.domain,
       count(DISTINCT c.edge_id) AS current_edges,
       count(DISTINCT c.dependent_repository_id) AS repositories,
       count(DISTINCT c.target_name) AS our_packages_used,
       array_agg(DISTINCT c.target_name ORDER BY c.target_name) AS packages
FROM developers_private.organization o
JOIN developers_private.repository_owner ro ON ro.organization_id = o.id
JOIN developers.current_dependents c ON c.dependent_repository_id = ro.repository_id AND c.hop = 1
GROUP BY o.id, o.name, o.kind, o.domain;

COMMENT ON VIEW developers_private.developers_by_company IS 'Current dependents rolled up to the owning company/organization.';
