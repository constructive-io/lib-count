-- Verify schemas/developers/types/confidence on pg

SELECT assert_type('developers.confidence'::regtype, 'e');
