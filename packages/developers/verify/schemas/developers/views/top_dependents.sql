-- Verify schemas/developers/views/top_dependents on pg

SELECT assert_view('developers.top_dependents'::regclass);
