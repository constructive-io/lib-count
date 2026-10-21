-- Verify schemas/developers_private/views/contributor_overlap on pg

SELECT assert_view('developers_private.contributor_overlap'::regclass);
