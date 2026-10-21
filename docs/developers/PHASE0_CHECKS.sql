\set ON_ERROR_STOP on
BEGIN;
-- fixtures (synthetic): "ours" in npm_count, two categories
INSERT INTO npm_count.npm_package (package_name, creation_date, last_publish_date) VALUES ('example-parser', '2020-01-01', '2026-01-01'), ('example-chain-sdk', '2021-01-01', '2026-01-01');
INSERT INTO npm_count.category (name) VALUES ('launchql'), ('telescope');
INSERT INTO npm_count.package_category (package_id, category_id) SELECT 'example-parser', id FROM npm_count.category WHERE name='launchql';
INSERT INTO npm_count.package_category (package_id, category_id) SELECT 'example-chain-sdk', id FROM npm_count.category WHERE name='telescope';
INSERT INTO npm_count.daily_downloads (package_name, date, download_count) VALUES ('example-parser', current_date - 1, 100);
INSERT INTO developers.tracked_target (package_id, reason) SELECT developers.ensure_package(package_name), 'lib-count' FROM npm_count.npm_package;

\echo '--- our_package family rollup (expect cloud, chain)'
SELECT name, family, categories FROM developers.our_package ORDER BY name;

\echo '--- T1 observe_edge idempotent: same observation twice => 1 edge, 1 observation'
SELECT developers.start_run('npm-dependents', 'npm-registry', ARRAY['example-parser'], 1, '{"t":1}', 'deadbeef') AS r1 \gset
SELECT developers.observe_edge(:'r1', 'example-parser', 'example-app', 'package.json', 'prod', '^1.0.0', 'example-app@1.2.3', '2026-01-01T00:00:00Z');
SELECT developers.observe_edge(:'r1', 'example-parser', 'example-app', 'package.json', 'prod', '^1.0.0', 'example-app@1.2.3', '2026-01-01T00:00:00Z');
SELECT developers.observe_edge(:'r1', 'example-parser', 'example-lib', 'package.json', 'dev', NULL, NULL, '2026-01-01T00:00:00Z');
SELECT (SELECT count(*) FROM developers.dependency_edge) AS edges, (SELECT count(*) FROM developers.edge_observation) AS observations;
SELECT 1/((SELECT count(*) FROM developers.dependency_edge) = 2)::int, 1/((SELECT count(*) FROM developers.edge_observation) = 2)::int;

\echo '--- T2 observe_edge rejects non-target and closed runs'
DO $$ BEGIN PERFORM developers.observe_edge((SELECT id FROM developers.crawl_run LIMIT 1), 'not-a-target', 'x'); RAISE EXCEPTION 'should have failed'; EXCEPTION WHEN raise_exception THEN IF SQLERRM NOT LIKE '%not a target%' THEN RAISE; END IF; END $$;
SELECT developers.close_run(:'r1', 'complete', '{"edges":2}') AS removed_r1 \gset
SELECT 1/(:removed_r1 = 0)::int;
DO $$ BEGIN PERFORM developers.observe_edge((SELECT id FROM developers.crawl_run LIMIT 1), 'example-parser', 'x'); RAISE EXCEPTION 'should have failed'; EXCEPTION WHEN raise_exception THEN IF SQLERRM NOT LIKE '%not running%' THEN RAISE; END IF; END $$;

\echo '--- T3 partial run never removes'
SELECT pg_sleep(0.01);
SELECT developers.start_run('npm-dependents', 'npm-registry', ARRAY['example-parser']) AS r2 \gset
SELECT developers.observe_edge(:'r2', 'example-parser', 'example-app');
SELECT developers.close_run(:'r2', 'partial', NULL, 'ecosyste.ms 503') AS removed_r2 \gset
SELECT 1/(:removed_r2 = 0)::int;
SELECT 1/((SELECT count(*) FROM developers.dependency_edge WHERE removed_at IS NOT NULL) = 0)::int;

\echo '--- T4 complete run that misses example-lib removes exactly it'
SELECT pg_sleep(0.01);
SELECT developers.start_run('npm-dependents', 'npm-registry', ARRAY['example-parser']) AS r3 \gset
SELECT developers.observe_edge(:'r3', 'example-parser', 'example-app');
SELECT developers.close_run(:'r3', 'complete') AS removed_r3 \gset
SELECT 1/(:removed_r3 = 1)::int;
SELECT dp.name, e.removed_at IS NOT NULL AS removed, e.removed_by_run_id = :'r3' AS by_r3 FROM developers.dependency_edge e JOIN developers.package dp ON dp.id = e.dependent_package_id ORDER BY 1;
SELECT 1/((SELECT count(*) FROM developers.lost_dependents(now() - interval '1 minute')) = 1)::int;

\echo '--- T5 re-observation clears removed_at and keeps first_seen_at'
SELECT e.first_seen_at AS lib_first FROM developers.dependency_edge e JOIN developers.package dp ON dp.id = e.dependent_package_id WHERE dp.name = 'example-lib' \gset
SELECT developers.start_run('npm-dependents', 'npm-registry', ARRAY['example-parser']) AS r4 \gset
SELECT developers.observe_edge(:'r4', 'example-parser', 'example-lib');
SELECT developers.observe_edge(:'r4', 'example-parser', 'example-app');
SELECT developers.close_run(:'r4', 'complete');
SELECT 1/((SELECT count(*) FROM developers.dependency_edge WHERE removed_at IS NOT NULL) = 0)::int;
SELECT 1/((SELECT e.first_seen_at = :'lib_first' FROM developers.dependency_edge e JOIN developers.package dp ON dp.id = e.dependent_package_id WHERE dp.name = 'example-lib'))::int;

\echo '--- T6 a complete repository-kind run does not remove package edges; different target untouched'
SELECT developers.start_run('github-dependents', 'github-api', ARRAY['example-parser', 'example-chain-sdk']) AS r5 \gset
SELECT developers.observe_edge(:'r5', 'example-parser', 'example-org/example-repo', 'apps/web/package.json', 'prod', '^1');
SELECT developers.observe_edge(:'r5', 'example-chain-sdk', 'example-org/example-repo', 'pnpm-lock.yaml', 'transitive');
SELECT developers.close_run(:'r5', 'complete') AS removed_r5 \gset
SELECT 1/(:removed_r5 = 0)::int;
SELECT 1/((SELECT count(*) FROM developers.current_dependents) = 4)::int;

\echo '--- T7 concurrent-run guard: an edge seen after the run started is not removed'
SELECT developers.start_run('npm-dependents', 'npm-registry', ARRAY['example-parser']) AS r6 \gset
SELECT pg_sleep(0.01);
SELECT developers.start_run('npm-dependents', 'npm-registry', ARRAY['example-parser']) AS r7 \gset
SELECT developers.observe_edge(:'r7', 'example-parser', 'example-lib');
SELECT developers.observe_edge(:'r7', 'example-parser', 'example-app');
SELECT developers.close_run(:'r7', 'complete');
SELECT developers.observe_edge(:'r6', 'example-parser', 'example-app');
SELECT developers.close_run(:'r6', 'complete') AS removed_r6 \gset
SELECT 1/(:removed_r6 = 0)::int;

\echo '--- T8 hop 2 edges live under their own target and are isolated'
SELECT developers.start_run('hop', 'npm-registry', ARRAY['example-app'], 2) AS r8 \gset
SELECT developers.observe_edge(:'r8', 'example-app', 'example-downstream');
SELECT developers.close_run(:'r8', 'complete');
SELECT target_name, direct_dependents, hop2_dependents FROM developers.transitive_reach ORDER BY 1;
SELECT * FROM developers.public_counts ORDER BY 1;
SELECT target_name, week_start, dependents, downloads FROM developers.adoption_by_week WHERE week_start = date_trunc('week', now())::date ORDER BY 1;

\echo '--- T9 start_run validation'
DO $$ BEGIN PERFORM developers.start_run('x', 'depsdev', ARRAY['example-parser']); RAISE EXCEPTION 'should have failed'; EXCEPTION WHEN raise_exception THEN IF SQLERRM NOT LIKE '%does not verify%' THEN RAISE; END IF; END $$;
DO $$ BEGIN PERFORM developers.start_run('x', 'npm-registry', ARRAY[]::text[]); RAISE EXCEPTION 'should have failed'; EXCEPTION WHEN raise_exception THEN IF SQLERRM NOT LIKE '%at least one target%' THEN RAISE; END IF; END $$;

\echo '--- T10 private side: deterministic account id, people views'
INSERT INTO developers_private.account (id, platform, login, kind, display_name, company_raw, source_id) VALUES (uuid_generate_v5(uuid_ns_url(), 'developers:account:github:jdoe'), 'github', 'JDoe', 'user', 'J. Doe', '@example-org', 'github-api');
INSERT INTO developers_private.organization (name, domain, kind, source_id, confidence, evidence) VALUES ('Example Org', 'example.org', 'company', 'github-api', 'high', 'org-owned repo');
INSERT INTO developers_private.repository_owner SELECT developers.repository_id('github.com', 'example-org/example-repo'), id, 'github-api', 'high', 'owner is the org' FROM developers_private.organization;
INSERT INTO developers_private.edge_commit_event (edge_id, event, commit_sha, committed_on, author_account_id, author_name, message, source_id)
  SELECT edge_id, 'added', 'abc123', '2025-05-01', uuid_generate_v5(uuid_ns_url(), 'developers:account:github:jdoe'), 'J. Doe', 'add parser', 'git-history' FROM developers.current_dependents WHERE dependent_key = 'example-org/example-repo' AND manifest_path LIKE '%package.json';
SELECT company, current_edges, repositories, packages FROM developers_private.developers_by_company;
SELECT target_name, dependent_key, author_login, company_raw FROM developers_private.champions;
SELECT author_login, target_name FROM developers_private.new_developers('2020-01-01');
SELECT * FROM developers_private.contributor_overlap;

\echo '--- C1 every column in developers/developers_private has a comment'
SELECT 1/((SELECT count(*) FROM pg_attribute a JOIN pg_class c ON c.oid = a.attrelid JOIN pg_namespace n ON n.oid = c.relnamespace
  WHERE n.nspname IN ('developers','developers_private') AND c.relkind = 'r' AND a.attnum > 0 AND NOT a.attisdropped AND col_description(c.oid, a.attnum) IS NULL) = 0)::int AS all_columns_commented;
SELECT 1/((SELECT count(*) FROM pg_class c JOIN pg_namespace n ON n.oid = c.relnamespace WHERE n.nspname IN ('developers','developers_private') AND c.relkind IN ('r','v') AND obj_description(c.oid, 'pg_class') IS NULL) = 0)::int AS all_relations_commented;

\echo '--- C2 every FK has an index whose leading columns cover it'
WITH fks AS (
  SELECT con.conrelid, con.conname, con.conkey FROM pg_constraint con JOIN pg_namespace n ON n.oid = con.connamespace
  WHERE con.contype = 'f' AND n.nspname IN ('developers','developers_private'))
SELECT 1/((SELECT count(*) FROM fks f WHERE NOT EXISTS (
  SELECT 1 FROM pg_index i WHERE i.indrelid = f.conrelid AND (i.indkey::int2[])[0:cardinality(f.conkey)-1] @> f.conkey AND (i.indkey::int2[])[0:cardinality(f.conkey)-1] <@ f.conkey)) = 0)::int AS all_fks_indexed;

\echo '--- C3 nothing in schema developers depends on developers_private; no email columns anywhere'
SELECT 1/((SELECT count(*) FROM pg_depend d JOIN pg_rewrite r ON r.oid = d.objid JOIN pg_class v ON v.oid = r.ev_class JOIN pg_namespace vn ON vn.oid = v.relnamespace
  JOIN pg_class t ON t.oid = d.refobjid JOIN pg_namespace tn ON tn.oid = t.relnamespace
  WHERE vn.nspname = 'developers' AND tn.nspname = 'developers_private') = 0)::int AS public_side_isolated;
SELECT 1/((SELECT count(*) FROM pg_depend d JOIN pg_proc p ON p.oid = d.objid JOIN pg_namespace pn ON pn.oid = p.pronamespace JOIN pg_class t ON t.oid = d.refobjid JOIN pg_namespace tn ON tn.oid = t.relnamespace WHERE pn.nspname='developers' AND tn.nspname='developers_private') = 0)::int;
SELECT 1/((SELECT count(*) FROM information_schema.columns WHERE table_schema IN ('developers','developers_private') AND column_name ILIKE '%email%') = 0)::int AS no_email_columns;
ROLLBACK;
\echo ALL SEMANTIC CHECKS PASSED
