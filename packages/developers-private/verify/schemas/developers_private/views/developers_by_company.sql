-- Verify schemas/developers_private/views/developers_by_company on pg

SELECT assert_view('developers_private.developers_by_company'::regclass);
