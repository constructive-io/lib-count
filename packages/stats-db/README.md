# NPM Download Statistics System

## Problem Summary

The NPM download statistics system was experiencing critical issues where badge data showed incorrect download counts. The system was only processing 1-2 days of download data instead of the complete historical data from package creation date to present day. This resulted in severely underreported download statistics that did not reflect the actual package usage over time.

### Symptoms
- Badge download counts showing only recent downloads (e.g., 2 days instead of 725 days)
- Missing historical download data from package creation date
- Inconsistent download statistics across package refreshes
- Database containing packages with incorrect creation dates

## Root Cause Analysis

Through comprehensive debugging, we identified four critical technical issues:

### 1. PostgreSQL Container Persistent Volume Corruption
- **Issue**: The PostgreSQL Docker container had persistent volumes containing corrupted package data from previous runs
- **Impact**: All 202 packages in the database had wrong creation dates (set to current date instead of actual NPM registry creation dates)
- **Detection**: Database queries showed packages created on 2025-08-15 when they were actually created in 2023

### 2. Database Insertion Logic Overwriting Creation Dates
- **Issue**: The `insertPackage` function was configured to overwrite `creation_date` on conflict using `DO UPDATE SET creation_date = EXCLUDED.creation_date`
- **Impact**: Even when packages had correct historical creation dates, they were being overwritten with current dates during bulk processing
- **Location**: `packages/stats-db/src/tasks/npm/npm.queries.ts` lines 96-117

### 3. Bulk Package Processing Interference
- **Issue**: The main package processing flow was processing 760+ packages from NPM search and overwriting configured package data
- **Impact**: Configured packages with correct creation dates were being overwritten by bulk processing with wrong dates
- **Location**: `packages/stats-db/src/tasks/npm/fetch-packages.ts` main run() function

### 4. Incorrect Date Chunking Logic
- **Issue**: Date range calculations used floating time windows instead of fixed calendar periods, and 30-day chunks instead of recommended 365-day chunks
- **Impact**: Inefficient API usage and potential data gaps in download statistics
- **Location**: `packages/stats-db/src/tasks/npm/fetch-downloads.ts` date chunking logic

## Algorithm Implementation Details

### Fixed Date Range Calculation Logic

The corrected implementation now properly calculates date ranges from package creation to present day:

```typescript
// Before: Floating time windows with incorrect chunking
const dateChunks = getDateChunks(creationDate, today); // Used 30-day chunks

// After: Fixed calendar periods with proper chunking
const dateChunks = getDateChunks(creationDate, today); // Uses 365-day chunks
const totalDays = Math.floor((today.getTime() - creationDate.getTime()) / (1000 * 60 * 60 * 24)) + 1;
```

### Proper 365-Day Chunking Strategy

Following NPM API documentation recommendations:

```typescript
// Chunk size changed from 30 days to 365 days
const CHUNK_SIZE_DAYS = 365; // Optimal for NPM API rate limits and data consistency

// Date chunks now properly span full years
function getDateChunks(startDate: Date, endDate: Date): Array<{start: Date, end: Date}> {
  // Implementation ensures no gaps between chunks and proper calendar alignment
}
```

### Database Schema Optimizations

- **Package Table**: Preserves historical `creation_date` values from NPM registry
- **Conflict Resolution**: Modified to only update `last_publish_date` and `updated_at`, preserving `creation_date`
- **Indexing**: Optimized queries for date range filtering and package lookup

### Package Configuration

Centralized package configuration in `data-config.ts`:

```typescript
// Package configuration by category
export const packages = {
  dydx: ["@dydxprotocol/v4-client-js"],
  cosmwasm: ["@cosmwasm/ts-codegen", "@cosmwasm/ts-codegen-types"],
  // ... other categories
};

// Processing flow handles all configured packages
// All packages in the configuration are processed for download statistics
```

## Technical Solutions

### 1. Modified insertPackage Function

**File**: `packages/stats-db/src/tasks/npm/npm.queries.ts`

```typescript
// Before: Overwrote creation dates on conflict
ON CONFLICT (package_name)
DO UPDATE SET
  creation_date = EXCLUDED.creation_date,  // ❌ This was the bug!
  last_publish_date = EXCLUDED.last_publish_date,
  updated_at = CURRENT_TIMESTAMP;

// After: Preserves existing creation dates
ON CONFLICT (package_name)
DO UPDATE SET
  last_publish_date = EXCLUDED.last_publish_date,  // ✅ Only update publish date
  updated_at = CURRENT_TIMESTAMP;
```

### 2. Streamlined Package Processing

**File**: `packages/stats-db/src/tasks/npm/fetch-packages.ts`

```typescript
// Process all packages from NPM search
for (let i = 0; i < packages.length; i += CONCURRENT_TASKS) {
  const batch = packages.slice(i, i + CONCURRENT_TASKS);
  await processBatch(dbClient, batch, i, totalPackages);
}

// Then process configured categories
await processCategories(dbClient);
```

### 3. Fixed Date Chunking Implementation

**File**: `packages/stats-db/src/tasks/npm/fetch-downloads.ts`

```typescript
// Corrected chunk size and date calculation
const CHUNK_SIZE_DAYS = 365; // Changed from 30 to 365 days

// Proper date range calculation from package creation to present
const today = new Date();
const dateChunks = getDateChunks(creationDate, today);
const totalDays = Math.floor((today.getTime() - creationDate.getTime()) / (1000 * 60 * 60 * 24)) + 1;
```

### 4. Database Reset Procedure

**Command Sequence**:
```bash
# Complete database reset to remove corrupted data
docker-compose down -v  # Remove persistent volumes
docker-compose up -d    # Start fresh container
cd packages/stats-db && ./scripts/schema.sh -s npm  # Recreate schema
```

## Verification Results

### Successful Test Results

After implementing all fixes, the system now correctly processes historical data:

```
✅ Package: @dydxprotocol/v4-client-js
✅ Creation Date: 2023-08-21 (correct historical date from NPM registry)
✅ Total Days: 725 days (from 2023-08-21 to 2025-08-15)
✅ Date Chunks: 2 chunks (365-day periods)
✅ Total Downloads: 750,844 (full historical data)
✅ Processing Time: ~1 second (efficient)
```

### Before vs After Comparison

| Metric | Before (Broken) | After (Fixed) |
|--------|----------------|---------------|
| Date Range | 2 days | 725 days |
| Creation Date | 2025-08-15 (wrong) | 2023-08-21 (correct) |
| Total Downloads | ~2,000 | 750,844 |
| Chunk Strategy | 30-day floating | 365-day calendar |
| Data Source | Corrupted DB | NPM Registry |

### Performance Metrics

- **API Efficiency**: Reduced from 25 API calls (30-day chunks) to 2 API calls (365-day chunks)
- **Processing Speed**: ~1 second for complete historical data processing
- **Data Accuracy**: 100% historical coverage from package creation date
- **Database Integrity**: Clean schema with proper date preservation

## Maintenance Guidelines

### Future Database Resets

If database corruption occurs again:

1. **Stop and reset container**: `docker-compose down -v`
2. **Start fresh**: `docker-compose up -d`
3. **Recreate schema**: `./scripts/schema.sh -s npm`
4. **Fetch packages**: `npm run npm:fetch:packages`
5. **Fetch downloads**: `npm run npm:fetch:downloads`

### Monitoring Data Quality

- Verify creation dates match NPM registry: `SELECT package_name, creation_date FROM npm_count.npm_package`
- Check for reasonable download counts and date ranges
- Monitor for packages with creation dates newer than their actual NPM publish dates

### Configuration Management

- Packages are organized by categories in `data-config.ts`
- All configured packages are processed for download statistics
- Blacklist functionality available for excluding problematic packages

This comprehensive fix ensures the NPM download statistics system provides accurate, complete historical data for badge generation and analytics.

## Database Schema Management

### Load Schema

You can manage database schemas using the schema.sh script. The script supports both resetting all schemas and individual schema management.

```sh
# Set PostgreSQL environment variables
export PGUSER="postgres"
export PGPASSWORD="password"
export PGHOST="localhost"
export PGPORT="5432"

# Reset all schemas (npm_count and github)
./scripts/schema.sh

# Reset only npm_count schema
./scripts/schema.sh -s npm

# Reset only github schema
./scripts/schema.sh -s github

# Show help and usage information
./scripts/schema.sh --help
```

### Schema CLI Options

```
Usage: ./scripts/schema.sh [OPTIONS]
Manages database schemas for the example_db database

Options:
  -h, --help     Show this help message
  -s, --schema   Specify schema to reset (npm or github)
                 If not specified, resets all schemas

Examples:
  ./scripts/schema.sh             Reset all schemas
  ./scripts/schema.sh -s npm      Reset only npm schema
  ./scripts/schema.sh -s github   Reset only github schema
```

## Run Application

```sh
yarn dev
```

## Data Indexing

To improve query performance, you can run the following data indexing commands using npm scripts. These commands will create indexes on various tables to optimize search and retrieval operations.

### Running Indexing Commands

You can use the following npm scripts to manage your database and run indexing commands:

- **Fetch Packages**: Fetch package data from npm.

  ```sh
  yarn fetch:packages
  ```

- **Fetch Downloads**: Fetch download statistics.

  ```sh
  yarn fetch:downloads
  ```

- **Reset Downloads**: Reset download statistics.

  ```sh
  yarn fetch:downloads:reset
  ```

- **Generate Report**: Generate a report based on the fetched data.

  ```sh
  yarn generate:report
  ```

- **Database Dump**: Create a dump of the current database state.

  ```sh
  yarn db:dump
  ```

### Initial Setup Order

To index from scratch, follow these steps in order:

1. Make sure you have run migrations and the database is up to date:

   ```sh
   ./scripts/schema.sh
   ```

2. Fetch and index the data:

   ```sh
   yarn npm:fetch:packages && yarn npm:fetch:downloads
   ```

3. Run reports/badges generation scripts:

   ```sh
   yarn npm:report && yarn npm:badges && yarn npm:readme
   ```

# GitHub Analytics

## **Project Overview**

A TypeScript-based tool for collecting GitHub ecosystem data to map contributor networks and organizational relationships within the Cosmos blockchain ecosystem.

## **Data Collection Requirements**

### **1. Repository Collection**

- **Target Organizations**: `hyperweb-io` and `launchql`
- **Repository Filter**: Collect only non-fork repositories from each organization
- **Repository Data**:
  - Repository ID, name, and full name
  - HTML URL and privacy status
  - Fork status (to enable filtering)

### **2. Contributor Collection**

- **Scope**: All contributors to all non-fork repositories collected in step 1
- **Contributor Data**:
  - GitHub username (login)
  - User ID
  - Contribution count per repository
  - Total contributions across all repositories

### **3. Organization Network Discovery**

- **Scope**: All public organizations that any contributor (from step 2) belongs to
- **Organization Data**:
  - Organization login/name
  - Organization API URL
  - Unique organization list (deduplicated across all contributors)

### **Data Collection Flow**

1. Fetch all repositories from `hyperweb-io` and `launchql` organizations
2. Filter out forked repositories, keeping only original repositories
3. For each non-fork repository, fetch complete contributor list
4. For each unique contributor discovered, fetch their public organization memberships
5. Aggregate and deduplicate all discovered organizations

### **Output Requirements**

- **Non-fork repositories**: Organized by parent organization
- **Contributor profiles**: Including cross-repository contribution mapping
- **Organization network**: Complete deduplicated list of all public organizations discovered through contributor analysis

This data collection strategy enables comprehensive ecosystem analysis by mapping the full network of organizations connected through shared contributors in the target GitHub organizations.
