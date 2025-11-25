## Database Schema Management

### Prerequisites

Before deploying the database, ensure you have the required tools installed:

- **Node.js 20+** - Required for pgpm
- **PostgreSQL** - Running locally or via Docker
- **pgpm** - PostgreSQL Package Manager

Install pgpm globally:

```bash
npm install -g pgpm
```

For detailed setup instructions, see the [Prerequisites Guide](/docs/quickstart/01_prerequisites.md).

### Start PostgreSQL (Docker)

If using Docker, start PostgreSQL with pgpm:

```bash
pgpm docker start
```

This command:
- Pulls the PostgreSQL Docker image (if not already downloaded)
- Starts PostgreSQL with default configuration
- Sets up a ready-to-use database

### Set Environment Variables

Configure your PostgreSQL connection using pgpm:

```bash
eval "$(pgpm env)"
```

This automatically sets:
- `PGHOST=localhost`
- `PGPORT=5432`
- `PGUSER=postgres`
- `PGPASSWORD=password`
- `PGDATABASE=postgres`

> **Tip:** Add `eval "$(pgpm env)"` to your shell config (`~/.bashrc`, `~/.zshrc`, etc.) to automatically set these variables in new terminal sessions.

Alternatively, set them manually:

```bash
export PGHOST=localhost
export PGPORT=5432
export PGUSER=postgres
export PGPASSWORD=password
export PGDATABASE=postgres
```

### Bootstrap Database Users

Create database users for testing and development (run once):

```bash
pgpm admin-users bootstrap --yes
```

This creates `anonymous`, `authenticated`, and `administrator` roles.

### Deploy the Database Module

Deploy the stats-db module to create the database schemas (npm and github):

```bash
# Create the database and deploy the module
pgpm deploy --database stats_dev --createdb --yes

# Or deploy to an existing database
pgpm deploy --database stats_dev --yes
```

pgpm will:
1. Install required PostgreSQL extensions (btree_gist, citext, pgcrypto, plpgsql, uuid-ossp)
2. Deploy the `github` schema
3. Deploy the `npm` schema
4. Track all changes in the `pgpm_migrate` schema

### Verify the Deployment

Verify that the deployment succeeded:

```bash
pgpm verify --database stats_dev
```

Or check the migration status:

```bash
pgpm migrate status --database stats_dev
```

### Rolling Back (Optional)

If you need to revert all changes:

```bash
pgpm revert --database stats_dev
```

pgpm runs the revert scripts in reverse order, cleanly removing all changes.

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

1. Deploy the database module (if not already deployed):

   ```sh
   pgpm deploy --database stats_dev --createdb --yes
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
