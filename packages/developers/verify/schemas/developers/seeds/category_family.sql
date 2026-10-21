-- Verify schemas/developers/seeds/category_family on pg

SELECT 1/count(*) FROM developers.category_family WHERE category_name = 'chain';
