-- Verify schemas/developers/views/current_dependents on pg

SELECT assert_view('developers.current_dependents'::regclass);
