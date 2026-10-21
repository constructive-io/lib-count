-- Verify schemas/developers/views/adoption_by_week on pg

SELECT assert_view('developers.adoption_by_week'::regclass);
