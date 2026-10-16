### Troubleshooting Nov 25, 2025

#### Diagnosing Data Gaps

If you suspect a package has incomplete download data, use these diagnostic queries:

```sql
-- Check package metadata and fetch status
SELECT package_name, creation_date, last_fetched_date, is_active
FROM npm_count.npm_package
WHERE package_name = 'your-package-name';

-- Count download records for a package
SELECT COUNT(*) as record_count
FROM npm_count.daily_downloads
WHERE package_name = 'your-package-name';

-- View actual date range and identify gaps
SELECT
  package_name,
  MIN(date) as first_date,
  MAX(date) as last_date,
  COUNT(*) as actual_days,
  (CURRENT_DATE - MIN(date))::int as expected_days,
  (CURRENT_DATE - MIN(date))::int - COUNT(*) as missing_days
FROM npm_count.daily_downloads
WHERE package_name = 'your-package-name'
GROUP BY package_name;

-- Find all packages with potential gaps (more than 10% missing)
SELECT
  p.package_name,
  p.creation_date,
  p.last_fetched_date,
  COUNT(d.date) as actual_days,
  (CURRENT_DATE - p.creation_date)::int as expected_days,
  ROUND(100.0 * COUNT(d.date) / NULLIF((CURRENT_DATE - p.creation_date)::int, 0), 1) as coverage_pct
FROM npm_count.npm_package p
LEFT JOIN npm_count.daily_downloads d ON p.package_name = d.package_name
WHERE p.is_active = true
GROUP BY p.package_name, p.creation_date, p.last_fetched_date
HAVING COUNT(d.date) < 0.9 * (CURRENT_DATE - p.creation_date)::int
ORDER BY coverage_pct ASC;
```

#### Common Issues

1. **Package shows very few records despite being old**
   - Run `--backfill` to scan for and fill gaps
   - Check if `creation_date` is correct in `npm_package` table

2. **Fetch was interrupted by rate limiting (429)**
   - Wait a few minutes, then retry with conservative settings:
     ```sh
     npm run npm:fetch:downloads -- -c 1 -d 1500
     ```
   - Or run backfill to fill any gaps left behind:
     ```sh
     npm run npm:fetch:downloads -- --backfill -c 1 -d 1500
     ```

3. **`last_fetched_date` is current but data is incomplete**
   - This can happen if a fetch completed for some chunks but not all
   - Use `--backfill` to force a full scan regardless of `last_fetched_date`

### Update Sep 28, 2026

- **Zeros on recent days** used to become permanent: a day fetched before npm published it was stored as `0`, and past rows were insert-only. Every run now re-fetches the last 30 days and upserts them, never replacing a real count with `0`. If a day still shows `0` for every package after a later run, npm itself had an outage. The README excludes such days from the weekly and monthly windows and scales the remaining days up to the full period.
- **Dates one day early:** see "Dates and the one-day offset fix" in the README (`pnpm npm:fix:date-offset`).
- **One-day gaps were never fetched:** the chunker produced no request for a range of a single day. This is fixed and covered by `__tests__/date-chunks.test.ts`.

