-- Verify schemas/developers/views/public_counts on pg

SELECT assert_view('developers.public_counts'::regclass);
