-- Verify schemas/developers/tables/crawl_run/table on pg

SELECT assert_table('developers.crawl_run'::regclass);
SELECT assert_index('developers.crawl_run_source_id_idx'::regclass, 'developers.crawl_run'::regclass);
SELECT assert_index('developers.crawl_run_task_started_at_idx'::regclass, 'developers.crawl_run'::regclass);
