-- Verify schemas/developers/views/transitive_reach on pg

SELECT assert_view('developers.transitive_reach'::regclass);
