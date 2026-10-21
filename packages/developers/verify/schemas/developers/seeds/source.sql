-- Verify schemas/developers/seeds/source on pg

SELECT 1/(count(*) - 8) FROM developers.source WHERE id IN ('npm-registry','npm-downloads','ecosystems','npm-web','depsdev','github-dependents-html','github-api','git-history','manual');
