-- Verify schemas/developers/tables/crawl_run_target/table on pg

SELECT assert_table('developers.crawl_run_target'::regclass);
SELECT assert_index('developers.crawl_run_target_package_id_idx'::regclass, 'developers.crawl_run_target'::regclass);
