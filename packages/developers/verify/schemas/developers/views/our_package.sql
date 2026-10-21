-- Verify schemas/developers/views/our_package on pg

SELECT assert_view('developers.our_package'::regclass);
