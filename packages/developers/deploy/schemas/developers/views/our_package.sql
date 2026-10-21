-- Deploy schemas/developers/views/our_package to pg

-- requires: schemas/developers/tables/tracked_target/table
-- requires: schemas/developers/tables/package/table
-- requires: schemas/developers/tables/category_family/table
-- requires: npm:npm

CREATE VIEW developers.our_package AS

SELECT t.package_id,
       p.name,
       t.reason,
       np.creation_date,
       np.is_active,
       COALESCE(array_agg(c.name ORDER BY c.name) FILTER (WHERE c.name IS NOT NULL), '{}'::text[]) AS categories,
       COALESCE(
         (SELECT cf2.family FROM npm_count.package_category pc2
            LEFT JOIN npm_count.category c2 ON c2.id = pc2.category_id
            LEFT JOIN developers.category_family cf2 ON cf2.category_name = c2.name
           WHERE pc2.package_id = p.name
           ORDER BY CASE COALESCE(cf2.family, 'cloud') WHEN 'cloud' THEN 0 WHEN 'chain' THEN 1 WHEN 'utils' THEN 2 ELSE 3 END
           LIMIT 1),
         'cloud') AS family
FROM developers.tracked_target t
JOIN developers.package p ON p.id = t.package_id
LEFT JOIN npm_count.npm_package np ON np.package_name = p.name
LEFT JOIN npm_count.package_category pc ON pc.package_id = np.package_name
LEFT JOIN npm_count.category c ON c.id = pc.category_id
GROUP BY t.package_id, p.name, t.reason, np.creation_date, np.is_active;

COMMENT ON VIEW developers.our_package IS 'Our packages with lib-count categories and brand family (cloud | chain | utils | personal, defaulting to cloud like categories.ts).';
