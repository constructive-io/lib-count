-- Verify schemas/developers_private/views/champions on pg

SELECT assert_view('developers_private.champions'::regclass);
