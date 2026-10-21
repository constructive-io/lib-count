-- Revert schemas/developers/seeds/source from pg

DELETE FROM developers.source WHERE id IN ('npm-registry','npm-downloads','ecosystems','npm-web','depsdev','github-dependents-html','github-api','git-history','manual');
