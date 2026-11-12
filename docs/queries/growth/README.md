# Growth queries

SQL for understanding download growth: by time, by segment, by library, and how far the numbers can be trusted. This folder holds queries only. Results change every day, so they are not stored here.

## Run them

```bash
./update_stats.sh --no-pr      # refresh stats_dev from npm first
psql postgresql://postgres:password@localhost:5432/stats_dev -f docs/queries/growth/01-time-momentum.sql
```

- Each file runs on its own, prints a title before every result, and takes under 30 seconds.
- They create temporary views only, so they never change the database.
- "Today" is the latest day in the data. Pin another day with `-v as_of=2026-06-30`.
- Add `--csv` to get output for a spreadsheet or chart.

## The files

| File | Question it answers |
|---|---|
| [`00-setup.sql`](00-setup.sql) | Shared definitions. Every other file loads it. |
| [`01-time-momentum.sql`](01-time-momentum.sql) | How fast are downloads growing? Run-rate by month, quarter and year, trailing windows, compound monthly growth, milestones, records, a weekly series for charts. |
| [`02-segments-categories.sql`](02-segments-categories.sql) | Where do downloads come from? Cloud, chain and utils over time, every category, which segments produced the growth, and which categories are at a high or in decline. |
| [`03-packages-cohorts.sql`](03-packages-cohorts.sql) | Which libraries? Leaders, fastest growers, concentration, number of packages above each size, cohorts by package age, same-store growth, new-package ramp, the Postgres parser family. |
| [`04-quality-robustness.sql`](04-quality-robustness.sql) | Is the growth real? Missing and hollow days, weekday against weekend, spikes, step changes, growth without the top packages, packages installed together, and how much the multiple depends on the window. |

## Definitions

These are set in `00-setup.sql` and used by every query.

| Term | Meaning |
|---|---|
| Company | Every package except personal projects (the `math` category). |
| Rollup | `cloud`, `chain` or `utils`. Mirrors `brandRollupFor()` in `packages/stats-db/src/config/categories.ts`. If that file changes, change `g_pkg` in `00-setup.sql`. |
| Category | The `npm_count.category` a package belongs to. Each package has one. The `cloud` rollup contains a small category that is also named `cloud`, so results label both. |
| Published day | A day with company downloads. Days npm published nothing are absent from the data. |
| Per day | Downloads divided by published days. Growth is always computed on this, not on raw sums. |
| Partial | The month or quarter that contains "today". It is flagged and never compared raw with a full period. |

## Reading the results

- **Totals are floors.** npm sometimes publishes nothing for a day, and some older days hold a 0 that was fetched before npm published. `04` section A lists both and estimates what they hide.
- **Downloads are not installs or users.** Many packages are dependencies of one another, so one install counts once per package in the tree. `03` section 4 and `04` section F measure this. Don't add packages together and call the sum installs.
- **Multiples are blank on tiny bases.** Each file states its floor and lets you change it with `-v`.
- **Quote the window with the number.** `04` query H1 shows the year-over-year multiple for every window from 30 to 365 days.

## Adding a query

Put it in the file that matches its question, build on the `g_*` views, use `:'as_of'::date` in place of a fixed date, and give it a `\echo` title and a short comment that says how to read the result. Don't use an apostrophe in a `\echo` line; psql treats it as an open quote.

The older, simpler queries are in [`../../NPM_DOWNLOAD_QUERIES.md`](../../NPM_DOWNLOAD_QUERIES.md). They count personal packages and ignore missing days.
