-- Verify schemas/developers_private/tables/employment_claim/table on pg

SELECT assert_table('developers_private.employment_claim'::regclass);
SELECT assert_index('developers_private.employment_claim_person_id_idx'::regclass, 'developers_private.employment_claim'::regclass);
SELECT assert_index('developers_private.employment_claim_organization_id_idx'::regclass, 'developers_private.employment_claim'::regclass);
SELECT assert_index('developers_private.employment_claim_source_id_idx'::regclass, 'developers_private.employment_claim'::regclass);
SELECT assert_index('developers_private.employment_claim_superseded_by_idx'::regclass, 'developers_private.employment_claim'::regclass);
