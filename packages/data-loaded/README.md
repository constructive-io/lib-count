# data-loaded

Database migration package for loading large datasets without bloating the repository.

## Overview

This package dynamically generates database migrations by fetching data from an external source. The actual SQL data files are `.gitignore`d to keep this repository lean and manageable. Instead of committing large SQL dumps directly, we fetch them from [hyperweb-io/lib-count-downloads](https://github.com/hyperweb-io/lib-count-downloads) and concatenate them into deployment-ready migrations on demand.

## Why This Approach?

Large SQL dumps can make repositories unwieldy and slow to clone. By externalizing the data and loading it dynamically:

- **Keeps the repo lean** - No large binary/SQL files committed to version control
- **Flexible data updates** - Update data independently without polluting commit history
- **Faster clones** - Repository remains lightweight for all contributors

## Usage

### Loading Data

Run the load script to download the latest data and generate the migration file:

```bash
./load.sh
```

This script will:
1. Download the SQL data from GitHub
2. Add the proper migration header
3. Generate `deploy/data.sql` ready for deployment

The generated `deploy/data.sql` file is gitignored and should not be committed.

## Maintenance

### Exporting Fresh Data

To create a new data export from your database:

```bash
pg_dump \
  --data-only \
  --inserts \
  --no-owner \
  --no-privileges \
  --exclude-schema=pgpm_migrate \
  --no-set-output \
  stats_dev > stats_dev_inserts.sql
```

For PostgreSQL < 16, manually filter out `SET` statements:

```bash
pg_dump \
  --data-only \
  --inserts \
  --no-owner \
  --no-privileges \
  --no-comments \
  --no-tablespaces \
  --no-security-labels \
  --exclude-schema=pgpm_migrate \
  stats_dev \
  | sed '/^SET /d' | sed '/^SELECT pg_catalog.set_config/d' \
  > stats_dev_inserts.sql
```

### Publishing Data

After exporting, commit the SQL file to the [lib-count-downloads](https://github.com/hyperweb-io/lib-count-downloads) repository to make it available for deployment.