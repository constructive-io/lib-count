
# Constructive NPM Downloads

<p align="center" width="100%">
   <img src="https://raw.githubusercontent.com/constructive-io/lib-count/refs/heads/main/assets/logo.svg" alt="constructive" width="80"><br />
   <a href="https://github.com/constructive-io/lib-count">
      <img height="20" src="https://img.shields.io/endpoint?url=https%3A%2F%2Fraw.githubusercontent.com%2Fconstructive-io%2Flib-count%2Fmain%2Foutput%2Fbadges%2Ftotal_downloads.json"/>
   </a>
   <a href="https://github.com/constructive-io/lib-count">
      <img height="20" src="https://img.shields.io/endpoint?url=https%3A%2F%2Fraw.githubusercontent.com%2Fconstructive-io%2Flib-count%2Fmain%2Foutput%2Fbadges%2Fmonthly_downloads.json"/>
   </a>
   <a href="https://github.com/constructive-io/lib-count">
      <img height="20" src="https://img.shields.io/endpoint?url=https%3A%2F%2Fraw.githubusercontent.com%2Fconstructive-io%2Flib-count%2Fmain%2Foutput%2Fbadges%2Fweekly_downloads.json"/>
   </a>
   <br>
   <a href="https://github.com/constructive-io/lib-count">
      <img height="20" src="https://img.shields.io/endpoint?url=https%3A%2F%2Fraw.githubusercontent.com%2Fconstructive-io%2Flib-count%2Fmain%2Foutput%2Fbadges%2Fconstructive_category.json"/>
   </a>
   <a href="https://github.com/constructive-io/lib-count">
      <img height="20" src="https://img.shields.io/endpoint?url=https%3A%2F%2Fraw.githubusercontent.com%2Fconstructive-io%2Flib-count%2Fmain%2Foutput%2Fbadges%2Futils_category.json"/>
   </a>
</p>


## 🚀 Brands

### Constructive

Tooling for Postgres

- 🔗 **Constructive GitHub Organization:** [**constructive-io**](https://github.com/constructive-io)
- 🌐 **Constructive Website:** [**constructive.io**](https://constructive.io)

### PGPM

A Postgres Package Manager for Modular Postgres

- 🌐 **PGPM Website:** [**pgpm.io**](https://pgpm.io)

## Overall Download Statistics

| Category | Total | Monthly | Weekly |
| ------- | ------ | ------- | ----- |
| **Total** | 243,083,618 | 39,795,475 | 11,067,991 |
| Cloud | 150,454,504 | 33,610,947 | 9,431,418 |
| Chain | 70,312,029 | 2,379,097 | 593,159 |
| Utilities | 22,315,408 | 3,805,431 | 1,043,414 |

_Weekly and monthly are the last 7 and 30 days of npm data, through 2026-10-12._ _npm reported zero downloads for every package on 2 of those 30 days (an npm-side outage); those days are excluded and the totals scaled to the full period._


---

# Modular Postgres Stack

Modular PostgreSQL tooling for full-stack TypeScript development.

| [Modular Postgres Portal](https://launchql.com): Quick Start | [PGPM](https://pgpm.io/): Postgres Package Manager | 
|:---:|:---:|

Modular PostgreSQL development with pgpm workspaces, reusable database modules, and end-to-end TypeScript testing 🐘

## Education and Tutorials

 1. 🚀 [Quickstart: Getting Up and Running](https://constructive.io/learn/quickstart)
Get started with modular databases in minutes. Install prerequisites and deploy your first module.

 2. 📦 [Modular PostgreSQL Development with Database Packages](https://constructive.io/learn/modular-postgres)
Learn to organize PostgreSQL projects with pgpm workspaces and reusable database modules.

 3. ✏️ [Authoring Database Changes](https://constructive.io/learn/authoring-database-changes)
Master the workflow for adding, organizing, and managing database changes with pgpm.

 4. 🧪 [End-to-End PostgreSQL Testing with TypeScript](https://constructive.io/learn/e2e-postgres-testing)
Master end-to-end PostgreSQL testing with ephemeral databases, RLS testing, and CI/CD automation.

 5. ⚡ [Supabase Testing](https://constructive.io/learn/supabase)
Use TypeScript-first tools to test Supabase projects with realistic RLS, policies, and auth contexts.

 6. 💧 [Drizzle ORM Testing](https://constructive.io/learn/drizzle-testing)
Run full-stack tests with Drizzle ORM, including database setup, teardown, and RLS enforcement.

 7. 🔧 [Troubleshooting](https://constructive.io/learn/troubleshooting)
Common issues and solutions for pgpm, PostgreSQL, and testing.

## Related Constructive Tooling

### 📦 Package Management

* [pgpm](https://github.com/constructive-io/constructive/tree/main/pgpm/pgpm): **🖥️ PostgreSQL Package Manager** for modular Postgres development. Works with database workspaces, scaffolding, migrations, seeding, and installing database packages.

### 🧪 Testing

* [pgsql-test](https://github.com/constructive-io/constructive/tree/main/postgres/pgsql-test): **📊 Isolated testing environments** with per-test transaction rollbacks—ideal for integration tests, complex migrations, and RLS simulation.
* [pgsql-seed](https://github.com/constructive-io/constructive/tree/main/postgres/pgsql-seed): **🌱 PostgreSQL seeding utilities** for CSV, JSON, SQL data loading, and pgpm deployment.
* [supabase-test](https://github.com/constructive-io/constructive/tree/main/postgres/supabase-test): **🧪 Supabase-native test harness** preconfigured for the local Supabase stack—per-test rollbacks, JWT/role context helpers, and CI/GitHub Actions ready.
* [graphile-test](https://github.com/constructive-io/constructive/tree/main/graphile/graphile-test): **🔐 Authentication mocking** for Graphile-focused test helpers and emulating row-level security contexts.
* [pg-query-context](https://github.com/constructive-io/constructive/tree/main/postgres/pg-query-context): **🔒 Session context injection** to add session-local context (e.g., `SET LOCAL`) into queries—ideal for setting `role`, `jwt.claims`, and other session settings.

### 🧠 Parsing & AST

* [pgsql-parser](https://www.npmjs.com/package/pgsql-parser): **🔄 SQL conversion engine** that interprets and converts PostgreSQL syntax.
* [libpg-query-node](https://www.npmjs.com/package/libpg-query): **🌉 Node.js bindings** for `libpg_query`, converting SQL into parse trees.
* [pg-proto-parser](https://www.npmjs.com/package/pg-proto-parser): **📦 Protobuf parser** for parsing PostgreSQL Protocol Buffers definitions to generate TypeScript interfaces, utility functions, and JSON mappings for enums.
* [@pgsql/enums](https://www.npmjs.com/package/@pgsql/enums): **🏷️ TypeScript enums** for PostgreSQL AST for safe and ergonomic parsing logic.
* [@pgsql/types](https://www.npmjs.com/package/@pgsql/types): **📝 Type definitions** for PostgreSQL AST nodes in TypeScript.
* [@pgsql/utils](https://www.npmjs.com/package/@pgsql/utils): **🛠️ AST utilities** for constructing and transforming PostgreSQL syntax trees.

---

## Table of Contents

- [Constructive](#constructive-1)
- [utils](#utils)
- [cloud](#cloud)
- [kubernetesjs](#kubernetesjs)
- [pgpm](#pgpm-1)

### Constructive

| Name | Total | Monthly | Weekly |
| ------- | ------ | ------- | ----- |
| _Total_ | 121,556,743 | 26,840,333 | 7,544,889 |
| [@pgsql/types](https://www.npmjs.com/package/@pgsql/types) | 24,444,504 | 7,546,669 | 2,257,443 |
| [libpg-query](https://www.npmjs.com/package/libpg-query) | 23,372,628 | 5,982,135 | 1,728,795 |
| [pgsql-deparser](https://www.npmjs.com/package/pgsql-deparser) | 17,509,563 | 3,128,667 | 828,251 |
| [pgsql-parser](https://www.npmjs.com/package/pgsql-parser) | 12,895,452 | 1,627,648 | 408,543 |
| [pgsql-enums](https://www.npmjs.com/package/pgsql-enums) | 7,477,468 | 106,958 | 11,640 |
| [@launchql/protobufjs](https://www.npmjs.com/package/@launchql/protobufjs) | 7,220,513 | 1,930,325 | 520,561 |
| [@libpg-query/parser](https://www.npmjs.com/package/@libpg-query/parser) | 6,144,083 | 1,908,786 | 535,173 |
| [pg-proto-parser](https://www.npmjs.com/package/pg-proto-parser) | 5,407,188 | 1,611,960 | 438,276 |
| [@pgsql/traverse](https://www.npmjs.com/package/@pgsql/traverse) | 5,377,156 | 1,612,089 | 439,215 |
| [@pgsql/enums](https://www.npmjs.com/package/@pgsql/enums) | 769,775 | 79,166 | 28,091 |
| [@pgsql/utils](https://www.npmjs.com/package/@pgsql/utils) | 709,007 | 41,504 | 10,630 |
| [pg-env](https://www.npmjs.com/package/pg-env) | 529,450 | 52,286 | 14,068 |
| [pg-cache](https://www.npmjs.com/package/pg-cache) | 498,143 | 42,453 | 11,342 |
| [csv-to-pg](https://www.npmjs.com/package/csv-to-pg) | 438,828 | 31,051 | 8,409 |
| [graphile-settings](https://www.npmjs.com/package/graphile-settings) | 314,001 | 32,435 | 8,672 |
| [graphile-postgis](https://www.npmjs.com/package/graphile-postgis) | 267,840 | 32,379 | 8,846 |
| [@pyramation/postgraphile-plugin-fulltext-filter](https://www.npmjs.com/package/@pyramation/postgraphile-plugin-fulltext-filter) | 261,846 | 9,084 | 2,084 |
| [gql-ast](https://www.npmjs.com/package/gql-ast) | 254,283 | 28,630 | 7,777 |
| [graphile-i18n](https://www.npmjs.com/package/graphile-i18n) | 247,034 | 31,290 | 8,451 |
| [graphile-cache](https://www.npmjs.com/package/graphile-cache) | 244,051 | 29,129 | 8,436 |
| [graphile-upload-plugin](https://www.npmjs.com/package/graphile-upload-plugin) | 233,312 | 28,609 | 7,769 |
| [pg-query-context](https://www.npmjs.com/package/pg-query-context) | 230,485 | 28,436 | 7,767 |
| [pg-ast](https://www.npmjs.com/package/pg-ast) | 218,368 | 28,713 | 8,122 |
| [pgsql-test](https://www.npmjs.com/package/pgsql-test) | 216,293 | 28,692 | 7,378 |
| [@agentic-kit/ollama](https://www.npmjs.com/package/@agentic-kit/ollama) | 208,478 | 28,789 | 7,946 |
| [@pgql/parse](https://www.npmjs.com/package/@pgql/parse) | 190,246 | 256 | 75 |
| [skitch-utils](https://www.npmjs.com/package/skitch-utils) | 186,828 | 9,578 | 2,116 |
| [@pgpmjs/transform](https://www.npmjs.com/package/@pgpmjs/transform) | 185,503 | 32,943 | 9,214 |
| [@agentic-kit/protocol](https://www.npmjs.com/package/@agentic-kit/protocol) | 180,066 | 28,291 | 7,751 |
| [@pgpmjs/ast](https://www.npmjs.com/package/@pgpmjs/ast) | 164,990 | 31,776 | 8,500 |
| [graphile-plugin-utils](https://www.npmjs.com/package/graphile-plugin-utils) | 164,009 | 29,006 | 7,790 |
| [@constructive-io/errors](https://www.npmjs.com/package/@constructive-io/errors) | 154,217 | 39,269 | 10,663 |
| [@pgpmjs/naming-spec](https://www.npmjs.com/package/@pgpmjs/naming-spec) | 147,967 | 28,656 | 7,916 |
| [@pgpmjs/slice](https://www.npmjs.com/package/@pgpmjs/slice) | 143,608 | 28,379 | 7,966 |
| [graphile-history](https://www.npmjs.com/package/graphile-history) | 140,679 | 30,310 | 8,243 |
| [@pgsql/transform](https://www.npmjs.com/package/@pgsql/transform) | 140,456 | 25,670 | 7,377 |
| [graphile-meta](https://www.npmjs.com/package/graphile-meta) | 140,124 | 27,454 | 7,470 |
| [@pgpmjs/traverse](https://www.npmjs.com/package/@pgpmjs/traverse) | 138,378 | 25,574 | 6,997 |
| [query-spec](https://www.npmjs.com/package/query-spec) | 134,705 | 26,748 | 7,414 |
| [@pgsql/parser](https://www.npmjs.com/package/@pgsql/parser) | 134,543 | 39,679 | 10,028 |
| [@pgpmjs/bundle](https://www.npmjs.com/package/@pgpmjs/bundle) | 134,507 | 25,805 | 7,133 |
| [skitch](https://www.npmjs.com/package/skitch) | 132,329 | 906 | 12 |
| [@pgsql/semantics](https://www.npmjs.com/package/@pgsql/semantics) | 123,832 | 28,773 | 7,422 |
| [@pgpmjs/diff](https://www.npmjs.com/package/@pgpmjs/diff) | 119,457 | 26,098 | 7,600 |
| [@constructive-io/coerce](https://www.npmjs.com/package/@constructive-io/coerce) | 115,413 | 34,074 | 9,372 |
| [@pgsql/scripts](https://www.npmjs.com/package/@pgsql/scripts) | 113,755 | 25,026 | 7,403 |
| [@launchql/styled-email](https://www.npmjs.com/package/@launchql/styled-email) | 108,904 | 132 | 61 |
| [@launchql/mjml](https://www.npmjs.com/package/@launchql/mjml) | 108,880 | 125 | 44 |
| [graphile-test](https://www.npmjs.com/package/graphile-test) | 102,047 | 6,209 | 1,189 |
| [introspectron](https://www.npmjs.com/package/introspectron) | 89,900 | 5,086 | 786 |
| [@launchql/cli](https://www.npmjs.com/package/@launchql/cli) | 85,672 | 553 | 100 |
| [graphile-function-bindings](https://www.npmjs.com/package/graphile-function-bindings) | 74,519 | 23,823 | 6,655 |
| [graphile-storage-registry](https://www.npmjs.com/package/graphile-storage-registry) | 70,953 | 27,056 | 7,384 |
| [graphile-query](https://www.npmjs.com/package/graphile-query) | 68,118 | 3,066 | 359 |
| [@launchql/graphql-testing](https://www.npmjs.com/package/@launchql/graphql-testing) | 59,359 | 409 | 145 |
| [safegres](https://www.npmjs.com/package/safegres) | 55,869 | 15,855 | 4,096 |
| [graphile-search-plugin](https://www.npmjs.com/package/graphile-search-plugin) | 55,564 | 510 | 130 |
| [pg-codegen](https://www.npmjs.com/package/pg-codegen) | 53,627 | 4,344 | 603 |
| [graphile-meta-schema](https://www.npmjs.com/package/graphile-meta-schema) | 50,758 | 527 | 126 |
| [graphile-simple-inflector](https://www.npmjs.com/package/graphile-simple-inflector) | 50,713 | 453 | 118 |
| [supabase-test](https://www.npmjs.com/package/supabase-test) | 50,342 | 7,143 | 1,644 |
| [skitch-templates](https://www.npmjs.com/package/skitch-templates) | 45,835 | 611 | 4 |
| [agentic-server](https://www.npmjs.com/package/agentic-server) | 45,329 | 9,747 | 2,615 |
| [@pgsql/lint](https://www.npmjs.com/package/@pgsql/lint) | 41,870 | 13,998 | 4,142 |
| [@launchql/server](https://www.npmjs.com/package/@launchql/server) | 41,654 | 579 | 125 |
| [@launchql/types](https://www.npmjs.com/package/@launchql/types) | 41,362 | 588 | 215 |
| [drizzle-orm-test](https://www.npmjs.com/package/drizzle-orm-test) | 40,867 | 4,400 | 874 |
| [@launchql/server-utils](https://www.npmjs.com/package/@launchql/server-utils) | 39,921 | 655 | 219 |
| [pg-query-string](https://www.npmjs.com/package/pg-query-string) | 39,729 | 651 | 179 |
| [@launchql/explorer](https://www.npmjs.com/package/@launchql/explorer) | 35,943 | 683 | 180 |
| [@constructive-io/eslint-config](https://www.npmjs.com/package/@constructive-io/eslint-config) | 35,435 | 12,380 | 3,331 |
| [@launchql/core](https://www.npmjs.com/package/@launchql/core) | 35,208 | 491 | 114 |
| [@launchql/env](https://www.npmjs.com/package/@launchql/env) | 34,517 | 421 | 98 |
| [@launchql/db-testing](https://www.npmjs.com/package/@launchql/db-testing) | 33,383 | 426 | 228 |
| [skitch-testing](https://www.npmjs.com/package/skitch-testing) | 33,311 | 431 | 1 |
| [graphile-plugin-connection-filter-postgis](https://www.npmjs.com/package/graphile-plugin-connection-filter-postgis) | 32,134 | 170 | 8 |
| [@launchql/postmaster](https://www.npmjs.com/package/@launchql/postmaster) | 31,549 | 30 | 12 |
| [@launchql/logger](https://www.npmjs.com/package/@launchql/logger) | 30,279 | 414 | 99 |
| [graphile-plugin-connection-filter](https://www.npmjs.com/package/graphile-plugin-connection-filter) | 29,409 | 259 | 7 |
| [graphile-plugin-fulltext-filter](https://www.npmjs.com/package/graphile-plugin-fulltext-filter) | 27,686 | 132 | 8 |
| [@pgpmjs/import](https://www.npmjs.com/package/@pgpmjs/import) | 27,579 | 5,251 | 1,206 |
| [graphile-pg-type-mappings](https://www.npmjs.com/package/graphile-pg-type-mappings) | 27,420 | 122 | 6 |
| [@agentic-kit/anthropic](https://www.npmjs.com/package/@agentic-kit/anthropic) | 26,930 | 3,751 | 951 |
| [pg-query-native-latest](https://www.npmjs.com/package/pg-query-native-latest) | 26,740 | 182 | 69 |
| [@agentic-kit/pi](https://www.npmjs.com/package/@agentic-kit/pi) | 26,642 | 6,194 | 1,602 |
| [@launchql/templatizer](https://www.npmjs.com/package/@launchql/templatizer) | 26,599 | 198 | 79 |
| [@launchql/db-utils](https://www.npmjs.com/package/@launchql/db-utils) | 26,543 | 233 | 167 |
| [@agentic-kit/openai](https://www.npmjs.com/package/@agentic-kit/openai) | 25,783 | 3,572 | 898 |
| [@launchql/db-migrate](https://www.npmjs.com/package/@launchql/db-migrate) | 24,591 | 61 | 11 |
| [@launchql/s3-streamer](https://www.npmjs.com/package/@launchql/s3-streamer) | 22,891 | 76 | 30 |
| [@agentic-kit/run-log](https://www.npmjs.com/package/@agentic-kit/run-log) | 22,718 | 9,822 | 2,725 |
| [@launchql/db-templates](https://www.npmjs.com/package/@launchql/db-templates) | 22,100 | 80 | 6 |
| [graphile-scoped-introspection](https://www.npmjs.com/package/graphile-scoped-introspection) | 20,684 | 21,480 | 6,626 |
| [@launchql/content-type-stream](https://www.npmjs.com/package/@launchql/content-type-stream) | 20,366 | 50 | 23 |
| [@decryption/hashes](https://www.npmjs.com/package/@decryption/hashes) | 20,271 | 2,762 | 670 |
| [@agentic-kit/agent](https://www.npmjs.com/package/@agentic-kit/agent) | 19,574 | 3,358 | 879 |
| [@agentic-kit/harness](https://www.npmjs.com/package/@agentic-kit/harness) | 19,322 | 3,621 | 914 |
| [@launchql/upload-names](https://www.npmjs.com/package/@launchql/upload-names) | 19,317 | 74 | 16 |
| [postgraphile-derived-upload-field](https://www.npmjs.com/package/postgraphile-derived-upload-field) | 18,643 | 188 | 102 |
| [@agentic-kit/db-tools](https://www.npmjs.com/package/@agentic-kit/db-tools) | 18,098 | 5,991 | 1,561 |
| [@agentic-kit/chat](https://www.npmjs.com/package/@agentic-kit/chat) | 16,496 | 3,134 | 806 |
| [@pgpmjs/pglite-adapter](https://www.npmjs.com/package/@pgpmjs/pglite-adapter) | 15,675 | 3,631 | 533 |
| [@launchql/url-domains](https://www.npmjs.com/package/@launchql/url-domains) | 15,101 | 71 | 14 |
| [skitch-template](https://www.npmjs.com/package/skitch-template) | 15,038 | 210 | 25 |
| [pglite-test](https://www.npmjs.com/package/pglite-test) | 14,545 | 3,393 | 573 |
| [@agentic-kit/metering](https://www.npmjs.com/package/@agentic-kit/metering) | 14,373 | 3,259 | 814 |
| [@launchql/ext-verify](https://www.npmjs.com/package/@launchql/ext-verify) | 14,240 | 66 | 1 |
| [@launchql/ext-types](https://www.npmjs.com/package/@launchql/ext-types) | 14,031 | 75 | 5 |
| [@launchql/ext-defaults](https://www.npmjs.com/package/@launchql/ext-defaults) | 13,892 | 69 | 1 |
| [@launchql/ext-default-roles](https://www.npmjs.com/package/@launchql/ext-default-roles) | 13,882 | 66 | 4 |
| [@launchql/ext-measurements](https://www.npmjs.com/package/@launchql/ext-measurements) | 13,611 | 19 | 1 |
| [@launchql/ext-jobs](https://www.npmjs.com/package/@launchql/ext-jobs) | 13,359 | 62 | 4 |
| [@launchql/db-transform](https://www.npmjs.com/package/@launchql/db-transform) | 13,269 | 253 | 170 |
| [@launchql/base32](https://www.npmjs.com/package/@launchql/base32) | 12,844 | 80 | 9 |
| [graphile-column-privileges-mutations](https://www.npmjs.com/package/graphile-column-privileges-mutations) | 12,684 | 229 | 32 |
| [@launchql/inflection](https://www.npmjs.com/package/@launchql/inflection) | 12,665 | 76 | 6 |
| [@launchql/graphile-settings](https://www.npmjs.com/package/@launchql/graphile-settings) | 12,508 | 468 | 138 |
| [@constructive-io/graphql-dev-server](https://www.npmjs.com/package/@constructive-io/graphql-dev-server) | 12,322 | 2,960 | 466 |
| [@launchql/totp](https://www.npmjs.com/package/@launchql/totp) | 12,276 | 81 | 6 |
| [@launchql/faker](https://www.npmjs.com/package/@launchql/faker) | 12,080 | 56 | 18 |
| [@launchql/codegen](https://www.npmjs.com/package/@launchql/codegen) | 11,362 | 85 | 41 |
| [@launchql/ext-jobs-queue](https://www.npmjs.com/package/@launchql/ext-jobs-queue) | 11,314 | 17 | 2 |
| [@agentic-kit/cli](https://www.npmjs.com/package/@agentic-kit/cli) | 11,304 | 3,156 | 726 |
| [@launchql/db-template](https://www.npmjs.com/package/@launchql/db-template) | 11,285 | 169 | 95 |
| [@launchql/ext-jwt-claims](https://www.npmjs.com/package/@launchql/ext-jwt-claims) | 11,116 | 113 | 9 |
| [@launchql/ext-achievements](https://www.npmjs.com/package/@launchql/ext-achievements) | 10,683 | 25 | 1 |
| [@launchql/react](https://www.npmjs.com/package/@launchql/react) | 10,244 | 158 | 40 |
| [skitch-transform](https://www.npmjs.com/package/skitch-transform) | 8,961 | 145 | 25 |
| [@launchql/ext-stamps](https://www.npmjs.com/package/@launchql/ext-stamps) | 8,728 | 48 | 1 |
| [@launchql/ext-uuid](https://www.npmjs.com/package/@launchql/ext-uuid) | 8,660 | 61 | 5 |
| [pg-utils](https://www.npmjs.com/package/pg-utils) | 8,560 | 87 | 1 |
| [@pgpm/app-scope](https://www.npmjs.com/package/@pgpm/app-scope) | 8,379 | 1,575 | 288 |
| [@pgpm/function-resolution](https://www.npmjs.com/package/@pgpm/function-resolution) | 8,300 | 1,554 | 310 |
| [@agentic-kit/run-log-client](https://www.npmjs.com/package/@agentic-kit/run-log-client) | 8,191 | 8,798 | 2,515 |
| [@launchql/proto-cli](https://www.npmjs.com/package/@launchql/proto-cli) | 8,102 | 188 | 93 |
| [graphile-gen](https://www.npmjs.com/package/graphile-gen) | 8,052 | 76 | 9 |
| [@launchql/db-env](https://www.npmjs.com/package/@launchql/db-env) | 7,981 | 239 | 167 |
| [@pgpm/errors](https://www.npmjs.com/package/@pgpm/errors) | 7,852 | 2,504 | 485 |
| [@constructive-db/catalog](https://www.npmjs.com/package/@constructive-db/catalog) | 7,561 | 1,248 | 126 |
| [@launchql/ext-utils](https://www.npmjs.com/package/@launchql/ext-utils) | 7,287 | 35 | 2 |
| [skitch-types](https://www.npmjs.com/package/skitch-types) | 7,235 | 95 | 0 |
| [@launchql/s3-utils](https://www.npmjs.com/package/@launchql/s3-utils) | 7,233 | 64 | 12 |
| [agentic-kit](https://www.npmjs.com/package/agentic-kit) | 7,119 | 636 | 92 |
| [@launchql/utils](https://www.npmjs.com/package/@launchql/utils) | 7,108 | 47 | 2 |
| [@constructive-db/routing](https://www.npmjs.com/package/@constructive-db/routing) | 7,071 | 1,208 | 130 |
| [@pgpmjs/portability](https://www.npmjs.com/package/@pgpmjs/portability) | 6,878 | 2,160 | 364 |
| [@constructive-db/routing-platform](https://www.npmjs.com/package/@constructive-db/routing-platform) | 6,826 | 1,223 | 126 |
| [@launchql/openfaas-job-worker](https://www.npmjs.com/package/@launchql/openfaas-job-worker) | 6,824 | 13 | 2 |
| [skitch-path](https://www.npmjs.com/package/skitch-path) | 6,584 | 85 | 6 |
| [@constructive-db/machine-protocol](https://www.npmjs.com/package/@constructive-db/machine-protocol) | 6,417 | 6,733 | 2,442 |
| [@launchql/protobufjs-cli](https://www.npmjs.com/package/@launchql/protobufjs-cli) | 6,015 | 756 | 226 |
| [@constructive-db/apps](https://www.npmjs.com/package/@constructive-db/apps) | 5,969 | 948 | 95 |
| [@constructive-io/site-deploy](https://www.npmjs.com/package/@constructive-io/site-deploy) | 4,940 | 2,399 | 567 |
| [@agentic-kit/dsh](https://www.npmjs.com/package/@agentic-kit/dsh) | 4,869 | 2,704 | 631 |
| [@agentic-kit/react](https://www.npmjs.com/package/@agentic-kit/react) | 4,812 | 642 | 119 |
| [@agentic-kit/pi-host](https://www.npmjs.com/package/@agentic-kit/pi-host) | 4,642 | 4,986 | 1,325 |
| [@launchql/query](https://www.npmjs.com/package/@launchql/query) | 4,298 | 27 | 15 |
| [@launchql/migrate](https://www.npmjs.com/package/@launchql/migrate) | 4,287 | 163 | 44 |
| [skitch-ext-utilities](https://www.npmjs.com/package/skitch-ext-utilities) | 4,131 | 35 | 18 |
| [skitch-prompt](https://www.npmjs.com/package/skitch-prompt) | 4,097 | 47 | 0 |
| [@launchql/graphile-query](https://www.npmjs.com/package/@launchql/graphile-query) | 4,092 | 207 | 114 |
| [skitch-ext-verify](https://www.npmjs.com/package/skitch-ext-verify) | 4,065 | 31 | 18 |
| [skitch-env](https://www.npmjs.com/package/skitch-env) | 4,040 | 75 | 34 |
| [skitch-ext-defaults](https://www.npmjs.com/package/skitch-ext-defaults) | 3,959 | 38 | 19 |
| [@launchql/openfaas-job-fn](https://www.npmjs.com/package/@launchql/openfaas-job-fn) | 3,849 | 28 | 1 |
| [graphile-gen-js](https://www.npmjs.com/package/graphile-gen-js) | 3,540 | 27 | 0 |
| [skitch-extension-verify](https://www.npmjs.com/package/skitch-extension-verify) | 3,332 | 61 | 2 |
| [launchql-test](https://www.npmjs.com/package/launchql-test) | 3,248 | 45 | 4 |
| [@launchql/job-utils](https://www.npmjs.com/package/@launchql/job-utils) | 3,239 | 30 | 2 |
| [@launchql/client](https://www.npmjs.com/package/@launchql/client) | 3,235 | 41 | 1 |
| [@launchql/openfaas-job-service](https://www.npmjs.com/package/@launchql/openfaas-job-service) | 3,230 | 14 | 1 |
| [@launchql/job-worker](https://www.npmjs.com/package/@launchql/job-worker) | 3,178 | 27 | 5 |
| [@launchql/orm](https://www.npmjs.com/package/@launchql/orm) | 3,145 | 41 | 1 |
| [@launchql/query-builder](https://www.npmjs.com/package/@launchql/query-builder) | 3,070 | 26 | 5 |
| [skitch-extension-utils](https://www.npmjs.com/package/skitch-extension-utils) | 3,042 | 50 | 9 |
| [skitch-install](https://www.npmjs.com/package/skitch-install) | 3,013 | 39 | 4 |
| [@launchql/job-scheduler](https://www.npmjs.com/package/@launchql/job-scheduler) | 2,854 | 33 | 18 |
| [@agentic-kit/agent-conversation](https://www.npmjs.com/package/@agentic-kit/agent-conversation) | 2,772 | 2,977 | 737 |
| [@launchql/job-pg](https://www.npmjs.com/package/@launchql/job-pg) | 2,759 | 18 | 1 |
| [skitch-extension-defaults](https://www.npmjs.com/package/skitch-extension-defaults) | 2,716 | 31 | 0 |
| [@agentic-kit/run-log-gate](https://www.npmjs.com/package/@agentic-kit/run-log-gate) | 2,648 | 2,844 | 716 |
| [skitch-extension-jobs](https://www.npmjs.com/package/skitch-extension-jobs) | 2,625 | 25 | 0 |
| [@constructive-db/infra-platform](https://www.npmjs.com/package/@constructive-db/infra-platform) | 2,496 | 348 | 9 |
| [@constructive-io/data](https://www.npmjs.com/package/@constructive-io/data) | 2,403 | 483 | 117 |
| [skitch-extension-default-roles](https://www.npmjs.com/package/skitch-extension-default-roles) | 2,366 | 20 | 4 |
| [launchql-client](https://www.npmjs.com/package/launchql-client) | 2,348 | 25 | 9 |
| [agentic-db](https://www.npmjs.com/package/agentic-db) | 2,341 | 193 | 62 |
| [@constructive-db/compute-platform](https://www.npmjs.com/package/@constructive-db/compute-platform) | 2,206 | 306 | 13 |
| [@constructive-db/platform-schema](https://www.npmjs.com/package/@constructive-db/platform-schema) | 2,198 | 301 | 9 |
| [@pgsql/transform-ast](https://www.npmjs.com/package/@pgsql/transform-ast) | 2,174 | 1,021 | 496 |
| [@agentic-db/sdk](https://www.npmjs.com/package/@agentic-db/sdk) | 2,144 | 130 | 41 |
| [@constructive-db/compute](https://www.npmjs.com/package/@constructive-db/compute) | 2,069 | 329 | 13 |
| [@constructive-db/infra](https://www.npmjs.com/package/@constructive-db/infra) | 2,058 | 346 | 30 |
| [@constructive-io/schema-builder](https://www.npmjs.com/package/@constructive-io/schema-builder) | 1,978 | 96 | 7 |
| [@agentic-db/services](https://www.npmjs.com/package/@agentic-db/services) | 1,805 | 183 | 70 |
| [@launchql/openfaas-job-util-jobs](https://www.npmjs.com/package/@launchql/openfaas-job-util-jobs) | 1,799 | 11 | 2 |
| [@agentic-kit/pi-embed](https://www.npmjs.com/package/@agentic-kit/pi-embed) | 1,789 | 88 | 7 |
| [@agentic-kit/pi-ext-run-log](https://www.npmjs.com/package/@agentic-kit/pi-ext-run-log) | 1,693 | 86 | 19 |
| [@launchql/geo-types](https://www.npmjs.com/package/@launchql/geo-types) | 1,685 | 6 | 1 |
| [launchql-gen](https://www.npmjs.com/package/launchql-gen) | 1,626 | 30 | 6 |
| [@webql/base32](https://www.npmjs.com/package/@webql/base32) | 1,537 | 14 | 4 |
| [@launchql/mmmagic](https://www.npmjs.com/package/@launchql/mmmagic) | 1,489 | 35 | 6 |
| [@launchql/openfaas-job-server](https://www.npmjs.com/package/@launchql/openfaas-job-server) | 1,487 | 11 | 1 |
| [@launchql/ast](https://www.npmjs.com/package/@launchql/ast) | 1,455 | 29 | 1 |
| [graphile-client](https://www.npmjs.com/package/graphile-client) | 1,454 | 17 | 6 |
| [@agentic-kit/pi-ext-metered-model](https://www.npmjs.com/package/@agentic-kit/pi-ext-metered-model) | 1,447 | 66 | 5 |
| [@agentic-kit/pi-ext-usage-report](https://www.npmjs.com/package/@agentic-kit/pi-ext-usage-report) | 1,445 | 62 | 1 |
| [graphile-gen-sql](https://www.npmjs.com/package/graphile-gen-sql) | 1,431 | 12 | 1 |
| [@launchql/openfaas-env](https://www.npmjs.com/package/@launchql/openfaas-env) | 1,368 | 14 | 2 |
| [@launchql/pg-query-context](https://www.npmjs.com/package/@launchql/pg-query-context) | 1,296 | 17 | 6 |
| [@launchql/job-api-server](https://www.npmjs.com/package/@launchql/job-api-server) | 1,279 | 16 | 2 |
| [csv-to-gql](https://www.npmjs.com/package/csv-to-gql) | 1,250 | 6 | 1 |
| [@agentic-kit/bradie](https://www.npmjs.com/package/@agentic-kit/bradie) | 1,243 | 83 | 21 |
| [@launchql/ext-status](https://www.npmjs.com/package/@launchql/ext-status) | 1,174 | 23 | 2 |
| [@webql/utils](https://www.npmjs.com/package/@webql/utils) | 1,076 | 16 | 4 |
| [@agentic-db/cli](https://www.npmjs.com/package/@agentic-db/cli) | 1,050 | 93 | 21 |
| [@launchql/ast-deparser](https://www.npmjs.com/package/@launchql/ast-deparser) | 1,049 | 10 | 2 |
| [skitch-extension-utilities](https://www.npmjs.com/package/skitch-extension-utilities) | 1,020 | 43 | 7 |
| [@agentic-kit/pi-ext-gate](https://www.npmjs.com/package/@agentic-kit/pi-ext-gate) | 1,008 | 64 | 5 |
| *70 packages hidden (< 1,000 downloads)* | | | |

### utils

| Name | Total | Monthly | Weekly |
| ------- | ------ | ------- | ----- |
| _Total_ | 22,288,700 | 3,801,670 | 1,042,922 |
| [nested-obj](https://www.npmjs.com/package/nested-obj) | 6,095,454 | 1,634,419 | 444,689 |
| [strfy-js](https://www.npmjs.com/package/strfy-js) | 5,410,859 | 1,611,073 | 438,339 |
| [inquirerer](https://www.npmjs.com/package/inquirerer) | 2,133,865 | 70,896 | 21,895 |
| [ast-stringify](https://www.npmjs.com/package/ast-stringify) | 1,550,572 | 27,241 | 9,387 |
| [@pyramation/json-schema-ref-parser](https://www.npmjs.com/package/@pyramation/json-schema-ref-parser) | 1,525,003 | 25,739 | 8,838 |
| [@pyramation/json-schema-to-typescript](https://www.npmjs.com/package/@pyramation/json-schema-to-typescript) | 1,512,101 | 25,804 | 8,836 |
| [appstash](https://www.npmjs.com/package/appstash) | 512,460 | 29,443 | 7,981 |
| [yanse](https://www.npmjs.com/package/yanse) | 465,015 | 37,494 | 10,260 |
| [genomic](https://www.npmjs.com/package/genomic) | 413,245 | 37,646 | 10,357 |
| [komoji](https://www.npmjs.com/package/komoji) | 338,454 | 31,583 | 8,436 |
| [etag-hash](https://www.npmjs.com/package/etag-hash) | 336,557 | 30,573 | 8,169 |
| [uuid-hash](https://www.npmjs.com/package/uuid-hash) | 296,600 | 29,634 | 8,125 |
| [makage](https://www.npmjs.com/package/makage) | 251,225 | 14,824 | 3,891 |
| [12factor-env](https://www.npmjs.com/package/12factor-env) | 246,473 | 35,625 | 9,737 |
| [mime-bytes](https://www.npmjs.com/package/mime-bytes) | 245,592 | 31,955 | 8,824 |
| [inflekt](https://www.npmjs.com/package/inflekt) | 231,232 | 24,777 | 7,211 |
| [git-changed](https://www.npmjs.com/package/git-changed) | 112,731 | 33,328 | 9,141 |
| [schema-typescript](https://www.npmjs.com/package/schema-typescript) | 99,958 | 7,538 | 1,979 |
| [clean-ansi](https://www.npmjs.com/package/clean-ansi) | 97,588 | 819 | 200 |
| [yamlize](https://www.npmjs.com/package/yamlize) | 41,635 | 12,993 | 3,540 |
| [create-gen-app](https://www.npmjs.com/package/create-gen-app) | 41,202 | 283 | 23 |
| [confstash](https://www.npmjs.com/package/confstash) | 40,973 | 12,386 | 3,346 |
| [@constructive-io/pnpm-policy](https://www.npmjs.com/package/@constructive-io/pnpm-policy) | 38,179 | 13,215 | 3,492 |
| [pnpm-policy](https://www.npmjs.com/package/pnpm-policy) | 37,958 | 13,211 | 3,488 |
| [publish-scripts](https://www.npmjs.com/package/publish-scripts) | 33,724 | 376 | 79 |
| [@pyramation/babel-preset-env](https://www.npmjs.com/package/@pyramation/babel-preset-env) | 31,951 | 711 | 239 |
| [symlink-workspace](https://www.npmjs.com/package/symlink-workspace) | 27,609 | 1,949 | 1,251 |
| [json-schema-patch](https://www.npmjs.com/package/json-schema-patch) | 22,358 | 478 | 81 |
| [file-ts](https://www.npmjs.com/package/file-ts) | 22,179 | 656 | 99 |
| [promql-ast](https://www.npmjs.com/package/promql-ast) | 19,038 | 2,375 | 650 |
| [etag-stream](https://www.npmjs.com/package/etag-stream) | 10,323 | 512 | 13 |
| [uuid-stream](https://www.npmjs.com/package/uuid-stream) | 9,744 | 560 | 13 |
| [schema-sdk](https://www.npmjs.com/package/schema-sdk) | 7,537 | 214 | 18 |
| [@yamlize/cli](https://www.npmjs.com/package/@yamlize/cli) | 3,735 | 191 | 88 |
| [@schema-typescript/cli](https://www.npmjs.com/package/@schema-typescript/cli) | 3,081 | 14 | 4 |
| [jsonldjs](https://www.npmjs.com/package/jsonldjs) | 2,969 | 90 | 21 |
| [backoff-script](https://www.npmjs.com/package/backoff-script) | 2,444 | 16 | 8 |
| [niftymagick](https://www.npmjs.com/package/niftymagick) | 2,273 | 36 | 0 |
| [json-stringify-simple](https://www.npmjs.com/package/json-stringify-simple) | 1,908 | 10 | 4 |
| [@constructive-io/pnpm-policy-graphile](https://www.npmjs.com/package/@constructive-io/pnpm-policy-graphile) | 1,900 | 671 | 123 |
| [airpage-cli](https://www.npmjs.com/package/airpage-cli) | 1,557 | 19 | 5 |
| [airpage](https://www.npmjs.com/package/airpage) | 1,458 | 14 | 0 |
| [babel-slim](https://www.npmjs.com/package/babel-slim) | 1,029 | 9 | 2 |
| *15 packages hidden (< 1,000 downloads)* | | | |

### cloud

| Name | Total | Monthly | Weekly |
| ------- | ------ | ------- | ----- |
| _Total_ | 1,197,560 | 167,860 | 44,678 |
| [graphile-pg-aggregates](https://www.npmjs.com/package/graphile-pg-aggregates) | 219,785 | 31,181 | 8,495 |
| [graphile-bulk-mutations](https://www.npmjs.com/package/graphile-bulk-mutations) | 215,654 | 31,043 | 8,421 |
| [@constructive-io/express-context](https://www.npmjs.com/package/@constructive-io/express-context) | 199,540 | 30,744 | 8,429 |
| [graphile-realtime-subscriptions](https://www.npmjs.com/package/graphile-realtime-subscriptions) | 192,348 | 28,438 | 7,736 |
| [@constructive-io/llm-env](https://www.npmjs.com/package/@constructive-io/llm-env) | 184,682 | 28,412 | 7,828 |
| [graphile-realtime-test](https://www.npmjs.com/package/graphile-realtime-test) | 33,285 | 3,123 | 551 |
| [@constructive-io/graphql-realtime-test](https://www.npmjs.com/package/@constructive-io/graphql-realtime-test) | 23,021 | 2,745 | 321 |
| [blocks-schema](https://www.npmjs.com/package/blocks-schema) | 9,758 | 2,288 | 645 |
| [blocks-renderer](https://www.npmjs.com/package/blocks-renderer) | 9,607 | 2,281 | 645 |
| [json-renderer](https://www.npmjs.com/package/json-renderer) | 9,590 | 2,285 | 642 |
| [@constructive-io/noble-hashes](https://www.npmjs.com/package/@constructive-io/noble-hashes) | 8,763 | 137 | 34 |
| [@constructive-io/send-verification-link-fn](https://www.npmjs.com/package/@constructive-io/send-verification-link-fn) | 8,568 | 119 | 12 |
| [@constructive-io/send-email-fn](https://www.npmjs.com/package/@constructive-io/send-email-fn) | 8,494 | 117 | 12 |
| [@interweb/casing](https://www.npmjs.com/package/@interweb/casing) | 5,861 | 129 | 5 |
| [@interweb-utils/casing](https://www.npmjs.com/package/@interweb-utils/casing) | 5,722 | 73 | 18 |
| [@pgpm/object-store](https://www.npmjs.com/package/@pgpm/object-store) | 5,651 | 886 | 197 |
| [@fbp/types](https://www.npmjs.com/package/@fbp/types) | 4,798 | 105 | 15 |
| [@pgpm/object-tree](https://www.npmjs.com/package/@pgpm/object-tree) | 4,614 | 722 | 181 |
| [@pgpm/partman](https://www.npmjs.com/package/@pgpm/partman) | 4,153 | 552 | 23 |
| [@pgpm/inflection-db](https://www.npmjs.com/package/@pgpm/inflection-db) | 4,107 | 911 | 233 |
| [@interweb/fetch-api-client](https://www.npmjs.com/package/@interweb/fetch-api-client) | 3,779 | 55 | 7 |
| [@fbp/spec](https://www.npmjs.com/package/@fbp/spec) | 3,576 | 63 | 9 |
| [@interweb/http-errors](https://www.npmjs.com/package/@interweb/http-errors) | 3,389 | 44 | 7 |
| [@interweb/node-api-client](https://www.npmjs.com/package/@interweb/node-api-client) | 2,901 | 15 | 2 |
| [@constructive-io/sheets](https://www.npmjs.com/package/@constructive-io/sheets) | 2,601 | 293 | 67 |
| [@interweb/find-pkg](https://www.npmjs.com/package/@interweb/find-pkg) | 1,689 | 12 | 1 |
| [@fbp/evaluator](https://www.npmjs.com/package/@fbp/evaluator) | 1,091 | 69 | 9 |
| [@fbp/graph-editor](https://www.npmjs.com/package/@fbp/graph-editor) | 1,007 | 34 | 2 |
| *43 packages hidden (< 1,000 downloads)* | | | |

### kubernetesjs

| Name | Total | Monthly | Weekly |
| ------- | ------ | ------- | ----- |
| _Total_ | 80,783 | 9,923 | 2,591 |
| [@kubernetesjs/ops](https://www.npmjs.com/package/@kubernetesjs/ops) | 29,642 | 2,952 | 767 |
| [kubernetesjs](https://www.npmjs.com/package/kubernetesjs) | 27,229 | 4,019 | 1,044 |
| [@kubernetesjs/manifests](https://www.npmjs.com/package/@kubernetesjs/manifests) | 15,143 | 2,762 | 737 |
| [@kubernetesjs/client](https://www.npmjs.com/package/@kubernetesjs/client) | 2,465 | 73 | 18 |
| [@kubernetesjs/cli](https://www.npmjs.com/package/@kubernetesjs/cli) | 2,210 | 18 | 7 |
| [@kubernetesjs/ops-cli](https://www.npmjs.com/package/@kubernetesjs/ops-cli) | 2,206 | 69 | 16 |
| [@kubernetesjs/react](https://www.npmjs.com/package/@kubernetesjs/react) | 1,888 | 30 | 2 |

### pgpm

| Name | Total | Monthly | Weekly |
| ------- | ------ | ------- | ----- |
| _Total_ | 27,619,418 | 6,592,831 | 1,839,260 |
| [@pgsql/quotes](https://www.npmjs.com/package/@pgsql/quotes) | 7,525,006 | 2,577,107 | 730,723 |
| [plpgsql-deparser](https://www.npmjs.com/package/plpgsql-deparser) | 4,488,426 | 1,472,228 | 412,372 |
| [plpgsql-parser](https://www.npmjs.com/package/plpgsql-parser) | 4,471,962 | 1,464,243 | 410,704 |
| [@pgpmjs/types](https://www.npmjs.com/package/@pgpmjs/types) | 532,639 | 54,184 | 14,817 |
| [@pgpmjs/env](https://www.npmjs.com/package/@pgpmjs/env) | 478,086 | 42,099 | 11,335 |
| [@pgpmjs/core](https://www.npmjs.com/package/@pgpmjs/core) | 459,052 | 33,717 | 8,710 |
| [@pgpmjs/server-utils](https://www.npmjs.com/package/@pgpmjs/server-utils) | 457,087 | 41,533 | 11,325 |
| [@pgpmjs/logger](https://www.npmjs.com/package/@pgpmjs/logger) | 444,710 | 39,649 | 10,737 |
| [find-and-require-package-json](https://www.npmjs.com/package/find-and-require-package-json) | 410,241 | 29,618 | 8,127 |
| [@constructive-io/graphql-types](https://www.npmjs.com/package/@constructive-io/graphql-types) | 289,251 | 31,508 | 8,595 |
| [@inquirerer/utils](https://www.npmjs.com/package/@inquirerer/utils) | 288,665 | 18,160 | 4,997 |
| [graphile-search](https://www.npmjs.com/package/graphile-search) | 257,679 | 31,902 | 8,778 |
| [@constructive-io/graphql-env](https://www.npmjs.com/package/@constructive-io/graphql-env) | 254,236 | 30,986 | 8,475 |
| [graphile-connection-filter](https://www.npmjs.com/package/graphile-connection-filter) | 250,167 | 32,486 | 8,834 |
| [@constructive-io/s3-streamer](https://www.npmjs.com/package/@constructive-io/s3-streamer) | 247,872 | 30,627 | 8,450 |
| [@constructive-io/upload-names](https://www.npmjs.com/package/@constructive-io/upload-names) | 223,100 | 28,224 | 7,803 |
| [@constructive-io/content-type-stream](https://www.npmjs.com/package/@constructive-io/content-type-stream) | 221,693 | 28,228 | 7,733 |
| [@constructive-io/graphql-query](https://www.npmjs.com/package/@constructive-io/graphql-query) | 217,800 | 14,176 | 3,563 |
| [@constructive-io/s3-utils](https://www.npmjs.com/package/@constructive-io/s3-utils) | 217,203 | 28,491 | 7,819 |
| [graphile-presigned-url-plugin](https://www.npmjs.com/package/graphile-presigned-url-plugin) | 216,728 | 29,252 | 7,737 |
| [graphile-ltree](https://www.npmjs.com/package/graphile-ltree) | 216,299 | 31,133 | 8,533 |
| [graphile-llm](https://www.npmjs.com/package/graphile-llm) | 214,447 | 32,074 | 8,973 |
| [@pgpmjs/migrate-client](https://www.npmjs.com/package/@pgpmjs/migrate-client) | 210,288 | 10,728 | 2,576 |
| [graphile-bucket-provisioner-plugin](https://www.npmjs.com/package/graphile-bucket-provisioner-plugin) | 208,378 | 28,431 | 7,712 |
| [@constructive-io/url-domains](https://www.npmjs.com/package/@constructive-io/url-domains) | 207,266 | 28,085 | 7,660 |
| [@constructive-io/bucket-provisioner](https://www.npmjs.com/package/@constructive-io/bucket-provisioner) | 201,861 | 28,481 | 7,831 |
| [pgsql-seed](https://www.npmjs.com/package/pgsql-seed) | 179,947 | 28,349 | 7,450 |
| [pgsql-client](https://www.npmjs.com/package/pgsql-client) | 179,424 | 28,111 | 7,490 |
| [@pgpmjs/export](https://www.npmjs.com/package/@pgpmjs/export) | 176,041 | 11,453 | 2,800 |
| [pg-seed](https://www.npmjs.com/package/pg-seed) | 156,316 | 25,119 | 6,740 |
| [@constructive-io/query-builder](https://www.npmjs.com/package/@constructive-io/query-builder) | 156,039 | 28,748 | 8,113 |
| [@pgpm/verify](https://www.npmjs.com/package/@pgpm/verify) | 151,850 | 4,265 | 937 |
| [@constructive-io/graphql-server](https://www.npmjs.com/package/@constructive-io/graphql-server) | 144,520 | 25,187 | 6,847 |
| [pgpm](https://www.npmjs.com/package/pgpm) | 141,450 | 9,393 | 1,833 |
| [@pgpm/inflection](https://www.npmjs.com/package/@pgpm/inflection) | 138,671 | 3,103 | 778 |
| [@pgpm/types](https://www.npmjs.com/package/@pgpm/types) | 131,679 | 3,338 | 688 |
| [@pgpm/database-jobs](https://www.npmjs.com/package/@pgpm/database-jobs) | 127,782 | 2,518 | 620 |
| [@constructive-io/graphql-codegen](https://www.npmjs.com/package/@constructive-io/graphql-codegen) | 118,464 | 11,174 | 2,146 |
| [@pgpm/metaschema-schema](https://www.npmjs.com/package/@pgpm/metaschema-schema) | 102,604 | 2,334 | 569 |
| [@constructive-io/graphql-test](https://www.npmjs.com/package/@constructive-io/graphql-test) | 99,180 | 5,629 | 1,217 |
| [@constructive-io/cli](https://www.npmjs.com/package/@constructive-io/cli) | 96,537 | 3,921 | 751 |
| [@constructive-io/fetch](https://www.npmjs.com/package/@constructive-io/fetch) | 89,188 | 14,702 | 4,094 |
| [@pgpm/metaschema-modules](https://www.npmjs.com/package/@pgpm/metaschema-modules) | 88,120 | 2,226 | 501 |
| [@inquirerer/test](https://www.npmjs.com/package/@inquirerer/test) | 88,083 | 864 | 197 |
| [graphile-schema](https://www.npmjs.com/package/graphile-schema) | 84,350 | 6,853 | 1,502 |
| [@constructive-io/graphql-explorer](https://www.npmjs.com/package/@constructive-io/graphql-explorer) | 82,215 | 4,031 | 616 |
| [@pgpm/services](https://www.npmjs.com/package/@pgpm/services) | 80,204 | 467 | 180 |
| [@constructive-io/job-utils](https://www.npmjs.com/package/@constructive-io/job-utils) | 76,440 | 11,814 | 3,285 |
| [@constructive-io/job-pg](https://www.npmjs.com/package/@constructive-io/job-pg) | 74,920 | 11,689 | 3,353 |
| [@constructive-io/csrf](https://www.npmjs.com/package/@constructive-io/csrf) | 72,414 | 21,380 | 6,040 |
| [@constructive-io/sdk](https://www.npmjs.com/package/@constructive-io/sdk) | 63,098 | 7,422 | 1,706 |
| [@pyramation/args](https://www.npmjs.com/package/@pyramation/args) | 58,400 | 458 | 109 |
| [@pyramation/prompt](https://www.npmjs.com/package/@pyramation/prompt) | 58,131 | 445 | 118 |
| [simple-smtp-server](https://www.npmjs.com/package/simple-smtp-server) | 53,593 | 4,464 | 919 |
| [constructive-test](https://www.npmjs.com/package/constructive-test) | 53,561 | 14,880 | 3,975 |
| [@constructive-io/knative-job-service](https://www.npmjs.com/package/@constructive-io/knative-job-service) | 49,986 | 672 | 16 |
| [@constructive-io/react](https://www.npmjs.com/package/@constructive-io/react) | 47,570 | 3,797 | 722 |
| [@pgpm/jwt-claims](https://www.npmjs.com/package/@pgpm/jwt-claims) | 46,506 | 3,440 | 683 |
| [graphql-server-test](https://www.npmjs.com/package/graphql-server-test) | 45,005 | 3,936 | 550 |
| [@constructive-io/job-scheduler](https://www.npmjs.com/package/@constructive-io/job-scheduler) | 44,519 | 1,296 | 22 |
| [@constructive-io/playwright-test](https://www.npmjs.com/package/@constructive-io/playwright-test) | 44,075 | 2,961 | 422 |
| [@constructive-io/graphql-react](https://www.npmjs.com/package/@constructive-io/graphql-react) | 43,776 | 733 | 19 |
| [@pgpm/stamps](https://www.npmjs.com/package/@pgpm/stamps) | 43,025 | 2,688 | 541 |
| [@constructive-sdk/cli](https://www.npmjs.com/package/@constructive-sdk/cli) | 42,567 | 4,097 | 622 |
| [@constructive-io/knative-job-worker](https://www.npmjs.com/package/@constructive-io/knative-job-worker) | 37,939 | 459 | 18 |
| [node-type-registry](https://www.npmjs.com/package/node-type-registry) | 37,433 | 5,063 | 1,303 |
| [@pgpm/uuid](https://www.npmjs.com/package/@pgpm/uuid) | 37,381 | 1,543 | 355 |
| [@pgpm/base32](https://www.npmjs.com/package/@pgpm/base32) | 36,923 | 1,321 | 433 |
| [insforge-test](https://www.npmjs.com/package/insforge-test) | 34,909 | 4,173 | 779 |
| [@pgpm/utils](https://www.npmjs.com/package/@pgpm/utils) | 34,100 | 1,123 | 361 |
| [@pgpm/totp](https://www.npmjs.com/package/@pgpm/totp) | 33,274 | 956 | 263 |
| [graphile-sql-expression-validator](https://www.npmjs.com/package/graphile-sql-expression-validator) | 33,159 | 1,170 | 212 |
| [@pgpm/faker](https://www.npmjs.com/package/@pgpm/faker) | 31,946 | 815 | 207 |
| [@constructive-io/postmaster](https://www.npmjs.com/package/@constructive-io/postmaster) | 29,338 | 419 | 41 |
| [@constructive-io/upload-client](https://www.npmjs.com/package/@constructive-io/upload-client) | 29,103 | 3,009 | 718 |
| [@constructive-io/knative-job-server](https://www.npmjs.com/package/@constructive-io/knative-job-server) | 23,758 | 237 | 15 |
| [docker-parser](https://www.npmjs.com/package/docker-parser) | 22,068 | 8,585 | 2,442 |
| [bash-ast](https://www.npmjs.com/package/bash-ast) | 22,034 | 8,630 | 2,468 |
| [@constructive-io/knative-job-fn](https://www.npmjs.com/package/@constructive-io/knative-job-fn) | 21,084 | 113 | 12 |
| [@constructive-io/ui](https://www.npmjs.com/package/@constructive-io/ui) | 18,918 | 806 | 226 |
| [@pgpm/defaults](https://www.npmjs.com/package/@pgpm/defaults) | 18,548 | 1,023 | 435 |
| [@pgpm-testing/verify](https://www.npmjs.com/package/@pgpm-testing/verify) | 17,705 | 619 | 95 |
| [@pyramation/postgis](https://www.npmjs.com/package/@pyramation/postgis) | 17,525 | 166 | 96 |
| [@pgpm-testing/base32](https://www.npmjs.com/package/@pgpm-testing/base32) | 17,169 | 621 | 92 |
| [@constructive-io/send-email-link-fn](https://www.npmjs.com/package/@constructive-io/send-email-link-fn) | 14,471 | 28 | 2 |
| [@constructive-io/simple-email-fn](https://www.npmjs.com/package/@constructive-io/simple-email-fn) | 13,783 | 28 | 2 |
| [@constructive-io/node](https://www.npmjs.com/package/@constructive-io/node) | 13,587 | 119 | 26 |
| [graphile-many-to-many](https://www.npmjs.com/package/graphile-many-to-many) | 11,398 | 105 | 4 |
| [@pgpm/db-meta-schema](https://www.npmjs.com/package/@pgpm/db-meta-schema) | 11,175 | 13 | 7 |
| [@pgpm/db-meta-modules](https://www.npmjs.com/package/@pgpm/db-meta-modules) | 11,056 | 11 | 5 |
| [stream-to-etag](https://www.npmjs.com/package/stream-to-etag) | 9,800 | 588 | 11 |
| [@pgsql/cli](https://www.npmjs.com/package/@pgsql/cli) | 8,659 | 1,436 | 655 |
| [@pgpm/geotypes](https://www.npmjs.com/package/@pgpm/geotypes) | 8,629 | 783 | 201 |
| [@constructive-io/job-worker](https://www.npmjs.com/package/@constructive-io/job-worker) | 8,623 | 183 | 7 |
| [@pgpm/achievements](https://www.npmjs.com/package/@pgpm/achievements) | 8,459 | 696 | 193 |
| [@pgpm/encrypted-secrets-table](https://www.npmjs.com/package/@pgpm/encrypted-secrets-table) | 8,413 | 851 | 212 |
| [@pgpm/jobs](https://www.npmjs.com/package/@pgpm/jobs) | 8,281 | 812 | 204 |
| [@pgpm/encrypted-secrets](https://www.npmjs.com/package/@pgpm/encrypted-secrets) | 7,944 | 869 | 205 |
| [@pgpm/measurements](https://www.npmjs.com/package/@pgpm/measurements) | 7,817 | 788 | 181 |
| [@pyramation/postgraphile](https://www.npmjs.com/package/@pyramation/postgraphile) | 7,443 | 174 | 90 |
| [pgsql-parse](https://www.npmjs.com/package/pgsql-parse) | 6,852 | 1,515 | 597 |
| [@pyramation/url-domains](https://www.npmjs.com/package/@pyramation/url-domains) | 6,774 | 182 | 98 |
| [@constructive-io/client](https://www.npmjs.com/package/@constructive-io/client) | 6,230 | 394 | 19 |
| [@constructive-io/orm](https://www.npmjs.com/package/@constructive-io/orm) | 5,975 | 389 | 13 |
| [@constructive-io/oauth](https://www.npmjs.com/package/@constructive-io/oauth) | 4,909 | 240 | 15 |
| [@pyramation/upload-names](https://www.npmjs.com/package/@pyramation/upload-names) | 4,792 | 169 | 91 |
| [@pyramation/content-type-stream](https://www.npmjs.com/package/@pyramation/content-type-stream) | 4,720 | 149 | 93 |
| [@pgpm/default-roles](https://www.npmjs.com/package/@pgpm/default-roles) | 4,641 | 11 | 2 |
| [@pgpm/ltree-helpers](https://www.npmjs.com/package/@pgpm/ltree-helpers) | 4,528 | 703 | 188 |
| [@pgpm-testing/totp](https://www.npmjs.com/package/@pgpm-testing/totp) | 4,437 | 239 | 42 |
| [@pyramation/s3-streamer](https://www.npmjs.com/package/@pyramation/s3-streamer) | 4,426 | 158 | 91 |
| [@pyramation/pg-query-context](https://www.npmjs.com/package/@pyramation/pg-query-context) | 4,274 | 125 | 89 |
| [@pgpm-testing/utils](https://www.npmjs.com/package/@pgpm-testing/utils) | 4,219 | 140 | 23 |
| [pgsql-types](https://www.npmjs.com/package/pgsql-types) | 4,140 | 1,130 | 564 |
| [coolir](https://www.npmjs.com/package/coolir) | 4,080 | 23 | 8 |
| [graphile-misc-plugins](https://www.npmjs.com/package/graphile-misc-plugins) | 3,940 | 28 | 0 |
| [webql-cli](https://www.npmjs.com/package/webql-cli) | 3,690 | 41 | 0 |
| [plpgsql-parse](https://www.npmjs.com/package/plpgsql-parse) | 3,676 | 987 | 365 |
| [@pyramation/webql](https://www.npmjs.com/package/@pyramation/webql) | 3,384 | 6 | 1 |
| [@pyramation/graphql-ast](https://www.npmjs.com/package/@pyramation/graphql-ast) | 3,297 | 13 | 2 |
| [webql-db](https://www.npmjs.com/package/webql-db) | 3,022 | 43 | 2 |
| [@pyramation/stream-to-s3](https://www.npmjs.com/package/@pyramation/stream-to-s3) | 2,903 | 10 | 4 |
| [@pgpm/meta-db](https://www.npmjs.com/package/@pgpm/meta-db) | 2,706 | 8 | 2 |
| [@pgpm/meta-db-modules](https://www.npmjs.com/package/@pgpm/meta-db-modules) | 2,696 | 9 | 2 |
| [graphile-pgvector-plugin](https://www.npmjs.com/package/graphile-pgvector-plugin) | 2,099 | 21 | 0 |
| [rego-deparser](https://www.npmjs.com/package/rego-deparser) | 2,008 | 1,206 | 78 |
| [standalone-module](https://www.npmjs.com/package/standalone-module) | 1,968 | 51 | 8 |
| [@pyramation/rpc-server](https://www.npmjs.com/package/@pyramation/rpc-server) | 1,888 | 11 | 5 |
| [postgraphile-plugin-pgvector](https://www.npmjs.com/package/postgraphile-plugin-pgvector) | 1,665 | 55 | 1 |
| [@pyramation/postgraphile-upload-field](https://www.npmjs.com/package/@pyramation/postgraphile-upload-field) | 1,611 | 45 | 18 |
| [graphile-pg-textsearch-plugin](https://www.npmjs.com/package/graphile-pg-textsearch-plugin) | 1,597 | 20 | 1 |
| [@constructive-io/command-palette](https://www.npmjs.com/package/@constructive-io/command-palette) | 1,538 | 75 | 8 |
| [@launchql/knative-job-worker](https://www.npmjs.com/package/@launchql/knative-job-worker) | 1,506 | 9 | 2 |
| [@launchql/knative-job-service](https://www.npmjs.com/package/@launchql/knative-job-service) | 1,426 | 10 | 2 |
| [@constructive-io/seeder](https://www.npmjs.com/package/@constructive-io/seeder) | 1,345 | 34 | 4 |
| [tpsql](https://www.npmjs.com/package/tpsql) | 1,334 | 15 | 1 |
| [airscript](https://www.npmjs.com/package/airscript) | 1,316 | 14 | 4 |
| [@launchql/knative-job-server](https://www.npmjs.com/package/@launchql/knative-job-server) | 1,226 | 11 | 2 |
| [coolir-commander-utils](https://www.npmjs.com/package/coolir-commander-utils) | 1,186 | 15 | 2 |
| [@pyramation/docker-env](https://www.npmjs.com/package/@pyramation/docker-env) | 1,158 | 25 | 7 |
| [coolir-commander](https://www.npmjs.com/package/coolir-commander) | 1,148 | 19 | 2 |
| [@pyramation/s3-utils](https://www.npmjs.com/package/@pyramation/s3-utils) | 1,135 | 9 | 2 |
| [@pgpm/meta-db-test](https://www.npmjs.com/package/@pgpm/meta-db-test) | 1,098 | 8 | 2 |
| *67 packages hidden (< 1,000 downloads)* | | | |


---

# Hyperweb (formerly Cosmology)

- 🔗 **Hyperweb GitHub Organization:** [**hyperweb-io**](https://github.com/hyperweb-io)
- 🌐 **Hyperweb Website:** [**hyperweb.io**](https://hyperweb.io)

📺 **Watch the [Hyperweb Announcement](https://www.youtube.com/watch?v=a_G2_KXRf1Y&list=PL_XyHnlG9MMvekTCbbJArAOwVlkCY54V5&index=2)**

## Interchain JavaScript Stack

A unified toolkit for building applications and smart contracts in the Interchain ecosystem with JavaScript.

A unified toolkit for building applications and smart contracts in the Interchain ecosystem ⚛️

<p>
   <a href="https://github.com/constructive-io/lib-count">
      <img height="20" src="https://img.shields.io/endpoint?url=https%3A%2F%2Fraw.githubusercontent.com%2Fconstructive-io%2Flib-count%2Fmain%2Foutput%2Fbadges%2Fhyperweb_category.json"/>
   </a>
</p>

| Category             | Tools                                                                                                                  | Downloads                                                                                                 |
|----------------------|------------------------------------------------------------------------------------------------------------------------|--------------------------------------------------------------------------------------------------------|
| **Chain Information**   | [**Chain Registry**](https://github.com/hyperweb-io/chain-registry), [**Utils**](https://www.npmjs.com/package/@chain-registry/utils), [**Client**](https://www.npmjs.com/package/@chain-registry/client) | ![Chain Registry](https://img.shields.io/endpoint?url=https%3A%2F%2Fraw.githubusercontent.com%2Fconstructive-io%2Flib-count%2Fmain%2Fbadges%2Fproducts%2Fchain-registry%2Ftotal.json) |
| **Wallet Connectors**| [**Interchain Kit**](https://github.com/hyperweb-io/interchain-kit), [**Cosmos Kit**](https://github.com/hyperweb-io/cosmos-kit) | ![Wallet Connectors](https://img.shields.io/endpoint?url=https%3A%2F%2Fraw.githubusercontent.com%2Fconstructive-io%2Flib-count%2Fmain%2Fbadges%2Fproducts%2Fcosmos-kit%2Ftotal.json) |
| **Signing Clients**          | [**InterchainJS**](https://github.com/hyperweb-io/interchainjs), [**CosmJS**](https://github.com/cosmos/cosmjs) | ![Signers](https://img.shields.io/endpoint?url=https%3A%2F%2Fraw.githubusercontent.com%2Fconstructive-io%2Flib-count%2Fmain%2Fbadges%2Fproducts%2Fcosmos-kit%2Ftotal.json) |
| **SDK Clients**              | [**Telescope**](https://github.com/hyperweb-io/telescope)                                                          | ![SDK](https://img.shields.io/endpoint?url=https%3A%2F%2Fraw.githubusercontent.com%2Fconstructive-io%2Flib-count%2Fmain%2Fbadges%2Fproducts%2Ftelescope%2Ftotal.json) |
| **Starter Kits**     | [**Create Interchain App**](https://github.com/hyperweb-io/create-interchain-app), [**Create Cosmos App**](https://github.com/hyperweb-io/create-cosmos-app) | ![Starter Kits](https://img.shields.io/endpoint?url=https%3A%2F%2Fraw.githubusercontent.com%2Fconstructive-io%2Flib-count%2Fmain%2Fbadges%2Fproducts%2Fcreate-cosmos-app%2Ftotal.json) |
| **UI Kits**          | [**Interchain UI**](https://github.com/hyperweb-io/interchain-ui)                                                   | ![UI Kits](https://img.shields.io/endpoint?url=https%3A%2F%2Fraw.githubusercontent.com%2Fconstructive-io%2Flib-count%2Fmain%2Fbadges%2Fproducts%2Finterchain-ui%2Ftotal.json) |
| **Testing Frameworks**          | [**Starship**](https://github.com/hyperweb-io/starship)                                                             | ![Testing](https://img.shields.io/endpoint?url=https%3A%2F%2Fraw.githubusercontent.com%2Fconstructive-io%2Flib-count%2Fmain%2Fbadges%2Fproducts%2Fstarship%2Ftotal.json) |
| **TypeScript Smart Contracts** | [**Create Hyperweb App**](https://github.com/hyperweb-io/create-hyperweb-app)                              | ![TypeScript Smart Contracts](https://img.shields.io/endpoint?url=https%3A%2F%2Fraw.githubusercontent.com%2Fconstructive-io%2Flib-count%2Fmain%2Fbadges%2Fproducts%2Fhyperwebjs%2Ftotal.json) |
| **CosmWasm Contracts** | [**CosmWasm TS Codegen**](https://github.com/CosmWasm/ts-codegen)                                                   | ![CosmWasm Contracts](https://img.shields.io/endpoint?url=https%3A%2F%2Fraw.githubusercontent.com%2Fconstructive-io%2Flib-count%2Fmain%2Fbadges%2Fproducts%2Fcosmwasm%2Ftotal.json) |

## Hyperweb Packages

- [protobufs](#protobufs)
- [chain-registry](#chain-registry)
- [cosmos-kit](#cosmos-kit)
- [cosmos-kit-wallets](#cosmos-kit-wallets)
- [telescope](#telescope)
- [cosmwasm](#cosmwasm)
- [interchain-js](#interchain-js)
- [hyperwebjs](#hyperwebjs)
- [interchain-kit](#interchain-kit)
- [interchain-kit-wallets](#interchain-kit-wallets)
- [interchain-ui](#interchain-ui)
- [osmosis](#osmosis)
- [starship](#starship)
- [cosmology](#cosmology)
- [stride](#stride)
- [juno](#juno)
- [stargaze](#stargaze)
- [dydx](#dydx)
- [chain](#chain)
- [create-cosmos-app](#create-cosmos-app)

### protobufs

| Name | Total | Monthly | Weekly |
| ------- | ------ | ------- | ----- |
| _Total_ | 5,777,874 | 74,301 | 23,038 |
| [@cosmology/protobufjs](https://www.npmjs.com/package/@cosmology/protobufjs) | 1,378,660 | 37,770 | 12,310 |
| [@protobufs/google](https://www.npmjs.com/package/@protobufs/google) | 612,084 | 4,398 | 1,323 |
| [@protobufs/gogoproto](https://www.npmjs.com/package/@protobufs/gogoproto) | 611,994 | 4,302 | 1,322 |
| [@protobufs/cosmos](https://www.npmjs.com/package/@protobufs/cosmos) | 594,924 | 4,760 | 1,357 |
| [@protobufs/cosmos_proto](https://www.npmjs.com/package/@protobufs/cosmos_proto) | 593,492 | 4,264 | 1,310 |
| [@protobufs/tendermint](https://www.npmjs.com/package/@protobufs/tendermint) | 588,356 | 4,316 | 1,318 |
| [@pyramation/protobufjs](https://www.npmjs.com/package/@pyramation/protobufjs) | 430,201 | 2,093 | 655 |
| [@protobufs/confio](https://www.npmjs.com/package/@protobufs/confio) | 233,217 | 2,834 | 833 |
| [@protobufs/ibc](https://www.npmjs.com/package/@protobufs/ibc) | 230,168 | 3,084 | 846 |
| [@protobufs/amino](https://www.npmjs.com/package/@protobufs/amino) | 225,090 | 2,784 | 762 |
| [@protobufs/cosmwasm](https://www.npmjs.com/package/@protobufs/cosmwasm) | 214,073 | 2,852 | 855 |
| [@protobufs/osmosis](https://www.npmjs.com/package/@protobufs/osmosis) | 29,757 | 359 | 93 |
| [@protobufs/juno](https://www.npmjs.com/package/@protobufs/juno) | 4,006 | 27 | 2 |
| [@protobufs/injective](https://www.npmjs.com/package/@protobufs/injective) | 3,731 | 10 | 1 |
| [@protobufs/akash](https://www.npmjs.com/package/@protobufs/akash) | 2,470 | 62 | 2 |
| [@protobufs/stargaze](https://www.npmjs.com/package/@protobufs/stargaze) | 2,173 | 27 | 8 |
| [@protobufs/regen](https://www.npmjs.com/package/@protobufs/regen) | 2,070 | 24 | 2 |
| [@protobufs/secret](https://www.npmjs.com/package/@protobufs/secret) | 1,991 | 24 | 2 |
| [@protobufs/bcna](https://www.npmjs.com/package/@protobufs/bcna) | 1,799 | 17 | 1 |
| [@protobufs/pylons](https://www.npmjs.com/package/@protobufs/pylons) | 1,720 | 15 | 1 |
| [@protobufs/comdex](https://www.npmjs.com/package/@protobufs/comdex) | 1,393 | 13 | 1 |
| [@protobufs/evmos](https://www.npmjs.com/package/@protobufs/evmos) | 1,208 | 10 | 1 |
| [@protobufs/axelar](https://www.npmjs.com/package/@protobufs/axelar) | 1,157 | 15 | 2 |
| *27 packages hidden (< 1,000 downloads)* | | | |

### chain-registry

| Name | Total | Monthly | Weekly |
| ------- | ------ | ------- | ----- |
| _Total_ | 16,055,962 | 505,878 | 123,932 |
| [@chain-registry/types](https://www.npmjs.com/package/@chain-registry/types) | 5,161,947 | 154,800 | 39,975 |
| [chain-registry](https://www.npmjs.com/package/chain-registry) | 2,534,951 | 85,144 | 16,127 |
| [@chain-registry/keplr](https://www.npmjs.com/package/@chain-registry/keplr) | 1,975,827 | 55,475 | 14,849 |
| [@chain-registry/utils](https://www.npmjs.com/package/@chain-registry/utils) | 1,724,241 | 54,769 | 16,435 |
| [@chain-registry/client](https://www.npmjs.com/package/@chain-registry/client) | 1,456,691 | 56,134 | 15,947 |
| [@chain-registry/cosmostation](https://www.npmjs.com/package/@chain-registry/cosmostation) | 1,384,734 | 20,909 | 3,074 |
| [@chain-registry/v2](https://www.npmjs.com/package/@chain-registry/v2) | 392,839 | 30,119 | 6,320 |
| [@chain-registry/v2-types](https://www.npmjs.com/package/@chain-registry/v2-types) | 367,115 | 16,799 | 4,712 |
| [@chain-registry/assets](https://www.npmjs.com/package/@chain-registry/assets) | 240,131 | 10,189 | 1,125 |
| [@chain-registry/osmosis](https://www.npmjs.com/package/@chain-registry/osmosis) | 202,587 | 9,558 | 2,823 |
| [@chain-registry/juno](https://www.npmjs.com/package/@chain-registry/juno) | 148,783 | 3,228 | 1,209 |
| [@chain-registry/interfaces](https://www.npmjs.com/package/@chain-registry/interfaces) | 99,202 | 2,676 | 433 |
| [@chain-registry/workflows](https://www.npmjs.com/package/@chain-registry/workflows) | 88,492 | 2,481 | 396 |
| [@chain-registry/cli](https://www.npmjs.com/package/@chain-registry/cli) | 86,044 | 2,393 | 368 |
| [@chain-registry/v2-keplr](https://www.npmjs.com/package/@chain-registry/v2-keplr) | 59,638 | 395 | 28 |
| [@chain-registry/v2-utils](https://www.npmjs.com/package/@chain-registry/v2-utils) | 48,731 | 539 | 33 |
| [@chain-registry/v2-client](https://www.npmjs.com/package/@chain-registry/v2-client) | 45,079 | 125 | 42 |
| [@chain-registry/v2-cosmostation](https://www.npmjs.com/package/@chain-registry/v2-cosmostation) | 38,930 | 145 | 36 |

### cosmos-kit

| Name | Total | Monthly | Weekly |
| ------- | ------ | ------- | ----- |
| _Total_ | 3,419,777 | 108,082 | 28,993 |
| [@cosmos-kit/core](https://www.npmjs.com/package/@cosmos-kit/core) | 1,323,735 | 38,350 | 11,111 |
| [@cosmos-kit/walletconnect](https://www.npmjs.com/package/@cosmos-kit/walletconnect) | 908,207 | 27,188 | 6,894 |
| [@cosmos-kit/react-lite](https://www.npmjs.com/package/@cosmos-kit/react-lite) | 546,738 | 20,280 | 5,388 |
| [@cosmos-kit/react](https://www.npmjs.com/package/@cosmos-kit/react) | 527,800 | 20,308 | 5,318 |
| [cosmos-kit](https://www.npmjs.com/package/cosmos-kit) | 113,297 | 1,956 | 282 |

### cosmos-kit-wallets

| Name | Total | Monthly | Weekly |
| ------- | ------ | ------- | ----- |
| _Total_ | 16,201,406 | 369,358 | 91,849 |
| [@cosmos-kit/keplr-extension](https://www.npmjs.com/package/@cosmos-kit/keplr-extension) | 880,998 | 28,070 | 7,216 |
| [@cosmos-kit/keplr](https://www.npmjs.com/package/@cosmos-kit/keplr) | 852,853 | 26,089 | 6,764 |
| [@cosmos-kit/keplr-mobile](https://www.npmjs.com/package/@cosmos-kit/keplr-mobile) | 834,243 | 26,770 | 6,939 |
| [@cosmos-kit/leap-extension](https://www.npmjs.com/package/@cosmos-kit/leap-extension) | 792,882 | 9,275 | 1,420 |
| [@cosmos-kit/leap](https://www.npmjs.com/package/@cosmos-kit/leap) | 759,985 | 8,029 | 1,154 |
| [@cosmos-kit/cosmostation-extension](https://www.npmjs.com/package/@cosmos-kit/cosmostation-extension) | 725,291 | 10,519 | 1,733 |
| [@cosmos-kit/leap-mobile](https://www.npmjs.com/package/@cosmos-kit/leap-mobile) | 714,858 | 7,758 | 1,183 |
| [@cosmos-kit/leap-metamask-cosmos-snap](https://www.npmjs.com/package/@cosmos-kit/leap-metamask-cosmos-snap) | 670,808 | 8,087 | 1,176 |
| [@cosmos-kit/cosmostation](https://www.npmjs.com/package/@cosmos-kit/cosmostation) | 662,023 | 5,939 | 958 |
| [@cosmos-kit/cosmostation-mobile](https://www.npmjs.com/package/@cosmos-kit/cosmostation-mobile) | 644,725 | 6,000 | 1,024 |
| [@cosmos-kit/okxwallet-extension](https://www.npmjs.com/package/@cosmos-kit/okxwallet-extension) | 545,702 | 16,684 | 4,967 |
| [@cosmos-kit/xdefi-extension](https://www.npmjs.com/package/@cosmos-kit/xdefi-extension) | 533,108 | 15,274 | 4,773 |
| [@cosmos-kit/trust](https://www.npmjs.com/package/@cosmos-kit/trust) | 520,441 | 16,813 | 4,860 |
| [@cosmos-kit/trust-mobile](https://www.npmjs.com/package/@cosmos-kit/trust-mobile) | 519,720 | 16,739 | 4,871 |
| [@cosmos-kit/station-extension](https://www.npmjs.com/package/@cosmos-kit/station-extension) | 508,657 | 15,695 | 4,842 |
| [@cosmos-kit/trust-extension](https://www.npmjs.com/package/@cosmos-kit/trust-extension) | 506,897 | 16,823 | 4,834 |
| [@cosmos-kit/station](https://www.npmjs.com/package/@cosmos-kit/station) | 506,528 | 15,598 | 4,834 |
| [@cosmos-kit/xdefi](https://www.npmjs.com/package/@cosmos-kit/xdefi) | 503,037 | 15,156 | 4,740 |
| [@cosmos-kit/okxwallet](https://www.npmjs.com/package/@cosmos-kit/okxwallet) | 453,027 | 14,928 | 4,702 |
| [@cosmos-kit/cdcwallet](https://www.npmjs.com/package/@cosmos-kit/cdcwallet) | 441,684 | 15,989 | 4,794 |
| [@cosmos-kit/cdcwallet-extension](https://www.npmjs.com/package/@cosmos-kit/cdcwallet-extension) | 441,595 | 16,018 | 4,820 |
| [@cosmos-kit/omni-mobile](https://www.npmjs.com/package/@cosmos-kit/omni-mobile) | 145,713 | 2,290 | 397 |
| [@cosmos-kit/omni](https://www.npmjs.com/package/@cosmos-kit/omni) | 141,590 | 2,256 | 382 |
| [@cosmos-kit/compass-extension](https://www.npmjs.com/package/@cosmos-kit/compass-extension) | 139,616 | 2,359 | 397 |
| [@cosmos-kit/ledger](https://www.npmjs.com/package/@cosmos-kit/ledger) | 136,728 | 2,507 | 424 |
| [@cosmos-kit/compass](https://www.npmjs.com/package/@cosmos-kit/compass) | 131,924 | 2,265 | 361 |
| [@cosmos-kit/fin-extension](https://www.npmjs.com/package/@cosmos-kit/fin-extension) | 127,424 | 2,180 | 378 |
| [@cosmos-kit/coin98](https://www.npmjs.com/package/@cosmos-kit/coin98) | 126,941 | 2,192 | 324 |
| [@cosmos-kit/coin98-extension](https://www.npmjs.com/package/@cosmos-kit/coin98-extension) | 126,014 | 2,223 | 372 |
| [@cosmos-kit/fin](https://www.npmjs.com/package/@cosmos-kit/fin) | 122,177 | 2,144 | 373 |
| [@cosmos-kit/exodus-extension](https://www.npmjs.com/package/@cosmos-kit/exodus-extension) | 120,838 | 2,200 | 371 |
| [@cosmos-kit/shell-extension](https://www.npmjs.com/package/@cosmos-kit/shell-extension) | 119,889 | 2,075 | 312 |
| [@cosmos-kit/exodus](https://www.npmjs.com/package/@cosmos-kit/exodus) | 118,446 | 2,136 | 314 |
| [@cosmos-kit/shell](https://www.npmjs.com/package/@cosmos-kit/shell) | 117,667 | 2,023 | 302 |
| [@cosmos-kit/vectis](https://www.npmjs.com/package/@cosmos-kit/vectis) | 112,559 | 1,133 | 270 |
| [@cosmos-kit/vectis-extension](https://www.npmjs.com/package/@cosmos-kit/vectis-extension) | 109,498 | 1,135 | 267 |
| [@cosmos-kit/owallet](https://www.npmjs.com/package/@cosmos-kit/owallet) | 97,025 | 1,935 | 333 |
| [@cosmos-kit/owallet-extension](https://www.npmjs.com/package/@cosmos-kit/owallet-extension) | 96,960 | 1,910 | 323 |
| [@cosmos-kit/tailwind-extension](https://www.npmjs.com/package/@cosmos-kit/tailwind-extension) | 92,626 | 1,827 | 315 |
| [@cosmos-kit/tailwind](https://www.npmjs.com/package/@cosmos-kit/tailwind) | 92,423 | 1,933 | 329 |
| [@cosmos-kit/frontier-extension](https://www.npmjs.com/package/@cosmos-kit/frontier-extension) | 91,138 | 973 | 221 |
| [@cosmos-kit/frontier](https://www.npmjs.com/package/@cosmos-kit/frontier) | 89,526 | 968 | 216 |
| [@cosmos-kit/cosmos-extension-metamask](https://www.npmjs.com/package/@cosmos-kit/cosmos-extension-metamask) | 83,222 | 2,006 | 210 |
| [@cosmos-kit/galaxy-station-extension](https://www.npmjs.com/package/@cosmos-kit/galaxy-station-extension) | 69,290 | 1,636 | 215 |
| [@cosmos-kit/galaxy-station](https://www.npmjs.com/package/@cosmos-kit/galaxy-station) | 69,258 | 1,628 | 218 |
| [@cosmos-kit/owallet-mobile](https://www.npmjs.com/package/@cosmos-kit/owallet-mobile) | 58,788 | 1,603 | 237 |
| [@cosmos-kit/web3auth](https://www.npmjs.com/package/@cosmos-kit/web3auth) | 48,790 | 980 | 116 |
| [@cosmos-kit/ctrl-extension](https://www.npmjs.com/package/@cosmos-kit/ctrl-extension) | 45,831 | 1,593 | 235 |
| [@cosmos-kit/ctrl](https://www.npmjs.com/package/@cosmos-kit/ctrl) | 45,528 | 1,606 | 235 |
| [@cosmos-kit/okto-extension](https://www.npmjs.com/package/@cosmos-kit/okto-extension) | 43,121 | 43 | 7 |
| [@cosmos-kit/galaxy-station-mobile](https://www.npmjs.com/package/@cosmos-kit/galaxy-station-mobile) | 38,964 | 1,356 | 127 |
| [@cosmos-kit/imtoken-extension](https://www.npmjs.com/package/@cosmos-kit/imtoken-extension) | 17,665 | 49 | 7 |
| [@cosmos-kit/imtoken](https://www.npmjs.com/package/@cosmos-kit/imtoken) | 17,456 | 54 | 7 |
| [@cosmos-kit/ninji-extension](https://www.npmjs.com/package/@cosmos-kit/ninji-extension) | 17,202 | 146 | 23 |
| [@cosmos-kit/ninji](https://www.npmjs.com/package/@cosmos-kit/ninji) | 15,869 | 139 | 19 |
| [@cosmos-kit/bitgetwallet-extension](https://www.npmjs.com/package/@cosmos-kit/bitgetwallet-extension) | 15,404 | 858 | 95 |
| [@cosmos-kit/ins](https://www.npmjs.com/package/@cosmos-kit/ins) | 14,221 | 113 | 11 |
| [@cosmos-kit/leap-capsule-social-login](https://www.npmjs.com/package/@cosmos-kit/leap-capsule-social-login) | 13,590 | 114 | 7 |
| [@cosmos-kit/initia-extension](https://www.npmjs.com/package/@cosmos-kit/initia-extension) | 9,403 | 279 | 21 |
| [@cosmos-kit/initia](https://www.npmjs.com/package/@cosmos-kit/initia) | 8,748 | 184 | 18 |
| [@cosmos-kit/walletconnect-v1](https://www.npmjs.com/package/@cosmos-kit/walletconnect-v1) | 7,650 | 178 | 29 |
| [@cosmos-wallet/react](https://www.npmjs.com/package/@cosmos-wallet/react) | 6,979 | 76 | 8 |
| [@cosmos-wallet/core](https://www.npmjs.com/package/@cosmos-wallet/core) | 6,312 | 51 | 13 |
| [@cosmos-kit/gatewallet-extension](https://www.npmjs.com/package/@cosmos-kit/gatewallet-extension) | 6,105 | 218 | 55 |
| [@cosmos-kit/types](https://www.npmjs.com/package/@cosmos-kit/types) | 4,913 | 46 | 7 |
| [@cosmos-wallet/keplr](https://www.npmjs.com/package/@cosmos-wallet/keplr) | 4,448 | 46 | 19 |
| [@cosmos-wallet/types](https://www.npmjs.com/package/@cosmos-wallet/types) | 4,400 | 34 | 9 |
| [@cosmos-wallet/registry](https://www.npmjs.com/package/@cosmos-wallet/registry) | 4,395 | 31 | 7 |
| [@cosmos-kit/registry](https://www.npmjs.com/package/@cosmos-kit/registry) | 4,104 | 88 | 20 |
| [@cosmos-kit/config](https://www.npmjs.com/package/@cosmos-kit/config) | 3,928 | 61 | 6 |
| [@cosmos-kit/walletconnect-v2](https://www.npmjs.com/package/@cosmos-kit/walletconnect-v2) | 3,231 | 31 | 5 |
| [@cosmos-kit/arculus-mobile](https://www.npmjs.com/package/@cosmos-kit/arculus-mobile) | 3,185 | 163 | 18 |
| [@cosmos-kit/arculus](https://www.npmjs.com/package/@cosmos-kit/arculus) | 3,108 | 155 | 18 |
| [@cosmos-kit/aria-extension](https://www.npmjs.com/package/@cosmos-kit/aria-extension) | 2,822 | 66 | 12 |
| [@cosmos-kit/prax-extension](https://www.npmjs.com/package/@cosmos-kit/prax-extension) | 2,759 | 48 | 9 |
| [@cosmos-kit/wallets](https://www.npmjs.com/package/@cosmos-kit/wallets) | 2,654 | 49 | 14 |
| [@cosmos-kit/gatewallet](https://www.npmjs.com/package/@cosmos-kit/gatewallet) | 2,511 | 48 | 11 |
| [@cosmos-kit/terrastation-extension](https://www.npmjs.com/package/@cosmos-kit/terrastation-extension) | 2,400 | 42 | 14 |
| [@cosmos-kit/terrastation](https://www.npmjs.com/package/@cosmos-kit/terrastation) | 2,358 | 42 | 9 |
| [@cosmos-kit/aria-mobile](https://www.npmjs.com/package/@cosmos-kit/aria-mobile) | 1,917 | 32 | 8 |
| [@cosmos-kit/aria](https://www.npmjs.com/package/@cosmos-kit/aria) | 1,893 | 46 | 7 |
| [@cosmos-kit/bitgetwallet](https://www.npmjs.com/package/@cosmos-kit/bitgetwallet) | 1,691 | 55 | 11 |
| [@cosmos-kit/figure-markets-mobile](https://www.npmjs.com/package/@cosmos-kit/figure-markets-mobile) | 1,516 | 30 | 2 |
| [@cosmos-kit/foxwallet-extension](https://www.npmjs.com/package/@cosmos-kit/foxwallet-extension) | 1,438 | 44 | 12 |
| [@cosmos-kit/figure-markets](https://www.npmjs.com/package/@cosmos-kit/figure-markets) | 1,418 | 34 | 7 |
| [@cosmos-kit/foxwallet](https://www.npmjs.com/package/@cosmos-kit/foxwallet) | 1,415 | 50 | 11 |
| [@cosmos-kit/vultisig-extension](https://www.npmjs.com/package/@cosmos-kit/vultisig-extension) | 1,324 | 130 | 62 |
| [@cosmos-kit/vultisig](https://www.npmjs.com/package/@cosmos-kit/vultisig) | 1,196 | 105 | 41 |
| *2 packages hidden (< 1,000 downloads)* | | | |

### telescope

| Name | Total | Monthly | Weekly |
| ------- | ------ | ------- | ----- |
| _Total_ | 14,813,107 | 595,052 | 149,647 |
| [@osmonauts/lcd](https://www.npmjs.com/package/@osmonauts/lcd) | 5,291,347 | 404,744 | 91,040 |
| [@cosmology/types](https://www.npmjs.com/package/@cosmology/types) | 1,219,928 | 35,880 | 11,717 |
| [@cosmology/utils](https://www.npmjs.com/package/@cosmology/utils) | 1,218,834 | 36,057 | 11,642 |
| [@cosmology/proto-parser](https://www.npmjs.com/package/@cosmology/proto-parser) | 1,187,584 | 36,068 | 11,654 |
| [@cosmology/lcd](https://www.npmjs.com/package/@cosmology/lcd) | 1,038,379 | 14,940 | 3,409 |
| [@cosmology/ast](https://www.npmjs.com/package/@cosmology/ast) | 924,637 | 22,869 | 7,238 |
| [@osmonauts/helpers](https://www.npmjs.com/package/@osmonauts/helpers) | 794,139 | 10,595 | 3,282 |
| [@cosmology/telescope](https://www.npmjs.com/package/@cosmology/telescope) | 786,980 | 18,706 | 5,298 |
| [@osmonauts/telescope](https://www.npmjs.com/package/@osmonauts/telescope) | 492,514 | 3,533 | 807 |
| [@osmonauts/ast](https://www.npmjs.com/package/@osmonauts/ast) | 474,859 | 3,239 | 917 |
| [@osmonauts/proto-parser](https://www.npmjs.com/package/@osmonauts/proto-parser) | 471,384 | 2,698 | 895 |
| [@osmonauts/types](https://www.npmjs.com/package/@osmonauts/types) | 467,307 | 2,404 | 888 |
| [@osmonauts/utils](https://www.npmjs.com/package/@osmonauts/utils) | 445,215 | 3,319 | 860 |

### cosmwasm

| Name | Total | Monthly | Weekly |
| ------- | ------ | ------- | ----- |
| _Total_ | 3,690,646 | 65,717 | 21,522 |
| [@cosmwasm/ts-codegen](https://www.npmjs.com/package/@cosmwasm/ts-codegen) | 1,755,826 | 29,852 | 9,750 |
| [wasm-ast-types](https://www.npmjs.com/package/wasm-ast-types) | 1,618,738 | 23,898 | 7,826 |
| [@cosmwasm/ts-codegen-types](https://www.npmjs.com/package/@cosmwasm/ts-codegen-types) | 142,150 | 5,601 | 1,908 |
| [@cosmwasm/ts-codegen-ast](https://www.npmjs.com/package/@cosmwasm/ts-codegen-ast) | 138,468 | 5,765 | 1,936 |
| [cosmwasm-typescript-gen](https://www.npmjs.com/package/cosmwasm-typescript-gen) | 23,107 | 267 | 16 |
| [@cosmjson/wasmswap](https://www.npmjs.com/package/@cosmjson/wasmswap) | 2,910 | 55 | 5 |
| [@cosmjson/stargaze-minter](https://www.npmjs.com/package/@cosmjson/stargaze-minter) | 1,234 | 23 | 7 |
| [@cosmjson/stargaze-sg721](https://www.npmjs.com/package/@cosmjson/stargaze-sg721) | 1,203 | 28 | 8 |
| *13 packages hidden (< 1,000 downloads)* | | | |

### interchain-js

| Name | Total | Monthly | Weekly |
| ------- | ------ | ------- | ----- |
| _Total_ | 3,362,524 | 175,884 | 40,805 |
| [@interchainjs/auth](https://www.npmjs.com/package/@interchainjs/auth) | 354,024 | 16,208 | 3,830 |
| [@interchainjs/utils](https://www.npmjs.com/package/@interchainjs/utils) | 329,410 | 15,698 | 3,726 |
| [@interchainjs/types](https://www.npmjs.com/package/@interchainjs/types) | 328,610 | 15,332 | 3,694 |
| [@interchainjs/math](https://www.npmjs.com/package/@interchainjs/math) | 295,468 | 15,053 | 3,630 |
| [@interchainjs/crypto](https://www.npmjs.com/package/@interchainjs/crypto) | 291,446 | 15,489 | 3,673 |
| [@interchainjs/encoding](https://www.npmjs.com/package/@interchainjs/encoding) | 290,769 | 15,034 | 3,609 |
| [@interchainjs/cosmos-types](https://www.npmjs.com/package/@interchainjs/cosmos-types) | 286,932 | 15,983 | 3,877 |
| [@interchainjs/cosmos](https://www.npmjs.com/package/@interchainjs/cosmos) | 284,558 | 17,444 | 4,117 |
| [@interchainjs/amino](https://www.npmjs.com/package/@interchainjs/amino) | 254,085 | 15,298 | 3,640 |
| [@interchainjs/pubkey](https://www.npmjs.com/package/@interchainjs/pubkey) | 252,111 | 15,365 | 3,633 |
| [interchainjs](https://www.npmjs.com/package/interchainjs) | 202,435 | 6,908 | 1,313 |
| [@interchainjs/ethereum](https://www.npmjs.com/package/@interchainjs/ethereum) | 71,505 | 4,563 | 1,232 |
| [injectivejs](https://www.npmjs.com/package/injectivejs) | 22,065 | 950 | 50 |
| [@interchainjs/injective](https://www.npmjs.com/package/@interchainjs/injective) | 20,070 | 706 | 70 |
| [@interchainjs/react](https://www.npmjs.com/package/@interchainjs/react) | 12,667 | 591 | 22 |
| [@interchainjs/solana](https://www.npmjs.com/package/@interchainjs/solana) | 11,242 | 2,284 | 506 |
| [injective-react](https://www.npmjs.com/package/injective-react) | 11,210 | 752 | 26 |
| [injective-vue](https://www.npmjs.com/package/injective-vue) | 10,132 | 670 | 25 |
| [@interchainjs/vue](https://www.npmjs.com/package/@interchainjs/vue) | 9,450 | 602 | 42 |
| [interchain-rpc](https://www.npmjs.com/package/interchain-rpc) | 7,383 | 385 | 8 |
| [interchain46](https://www.npmjs.com/package/interchain46) | 2,296 | 87 | 22 |
| [interchain-react](https://www.npmjs.com/package/interchain-react) | 1,600 | 48 | 0 |
| [@interchainjs/ethermint](https://www.npmjs.com/package/@interchainjs/ethermint) | 1,554 | 40 | 8 |
| [interchain-vue](https://www.npmjs.com/package/interchain-vue) | 1,144 | 23 | 1 |
| *24 packages hidden (< 1,000 downloads)* | | | |

### hyperwebjs

| Name | Total | Monthly | Weekly |
| ------- | ------ | ------- | ----- |
| _Total_ | 56,178 | 4,972 | 1,993 |
| [@hyperweb/telescope](https://www.npmjs.com/package/@hyperweb/telescope) | 42,354 | 4,464 | 1,892 |
| [hyperwebjs](https://www.npmjs.com/package/hyperwebjs) | 4,892 | 169 | 27 |
| [@hyperweb/build](https://www.npmjs.com/package/@hyperweb/build) | 3,189 | 87 | 15 |
| [create-hyperweb-app](https://www.npmjs.com/package/create-hyperweb-app) | 1,331 | 107 | 28 |
| [@hyperweb/mcp-server](https://www.npmjs.com/package/@hyperweb/mcp-server) | 1,260 | 51 | 11 |
| [@hyperweb/parse](https://www.npmjs.com/package/@hyperweb/parse) | 1,200 | 15 | 2 |
| *5 packages hidden (< 1,000 downloads)* | | | |

### interchain-kit

| Name | Total | Monthly | Weekly |
| ------- | ------ | ------- | ----- |
| _Total_ | 208,644 | 6,047 | 1,348 |
| [@interchain-kit/core](https://www.npmjs.com/package/@interchain-kit/core) | 133,873 | 2,946 | 699 |
| [@interchain-kit/react](https://www.npmjs.com/package/@interchain-kit/react) | 47,967 | 2,214 | 519 |
| [interchain-kit](https://www.npmjs.com/package/interchain-kit) | 16,365 | 396 | 23 |
| [@interchain-kit/vue](https://www.npmjs.com/package/@interchain-kit/vue) | 10,439 | 491 | 107 |

### interchain-kit-wallets

| Name | Total | Monthly | Weekly |
| ------- | ------ | ------- | ----- |
| _Total_ | 505,590 | 16,609 | 3,066 |
| [@interchain-kit/keplr-extension](https://www.npmjs.com/package/@interchain-kit/keplr-extension) | 88,672 | 2,103 | 589 |
| [@interchain-kit/leap-extension](https://www.npmjs.com/package/@interchain-kit/leap-extension) | 73,038 | 1,460 | 483 |
| [@interchain-kit/okx-extension](https://www.npmjs.com/package/@interchain-kit/okx-extension) | 64,587 | 626 | 69 |
| [@interchain-kit/cosmostation-extension](https://www.npmjs.com/package/@interchain-kit/cosmostation-extension) | 24,782 | 1,011 | 435 |
| [@interchain-kit/store](https://www.npmjs.com/package/@interchain-kit/store) | 19,707 | 1,542 | 491 |
| [@interchain-kit/keplr-mobile](https://www.npmjs.com/package/@interchain-kit/keplr-mobile) | 18,421 | 638 | 86 |
| [@interchain-kit/cosmos-extension-metamask](https://www.npmjs.com/package/@interchain-kit/cosmos-extension-metamask) | 17,235 | 543 | 34 |
| [@interchain-kit/leap-mobile](https://www.npmjs.com/package/@interchain-kit/leap-mobile) | 17,076 | 405 | 23 |
| [@interchain-kit/coin98-extension](https://www.npmjs.com/package/@interchain-kit/coin98-extension) | 16,776 | 603 | 70 |
| [@interchain-kit/ledger](https://www.npmjs.com/package/@interchain-kit/ledger) | 15,782 | 601 | 76 |
| [@interchain-kit/mock-wallet](https://www.npmjs.com/package/@interchain-kit/mock-wallet) | 14,473 | 531 | 21 |
| [@interchain-kit/frontier-extension](https://www.npmjs.com/package/@interchain-kit/frontier-extension) | 14,240 | 421 | 71 |
| [@interchain-kit/station-extension](https://www.npmjs.com/package/@interchain-kit/station-extension) | 14,050 | 578 | 71 |
| [@interchain-kit/leap-cosmos-extension-metamask](https://www.npmjs.com/package/@interchain-kit/leap-cosmos-extension-metamask) | 13,930 | 574 | 34 |
| [@interchain-kit/galaxy-station-extension](https://www.npmjs.com/package/@interchain-kit/galaxy-station-extension) | 13,716 | 437 | 70 |
| [@interchain-kit/trust-extension](https://www.npmjs.com/package/@interchain-kit/trust-extension) | 12,615 | 695 | 82 |
| [@interchain-kit/xdefi-extension](https://www.npmjs.com/package/@interchain-kit/xdefi-extension) | 11,142 | 490 | 63 |
| [@interchain-kit/compass-extension](https://www.npmjs.com/package/@interchain-kit/compass-extension) | 9,023 | 511 | 76 |
| [@interchain-kit/metamask-extension](https://www.npmjs.com/package/@interchain-kit/metamask-extension) | 8,984 | 434 | 26 |
| [@interchain-kit/fin-extension](https://www.npmjs.com/package/@interchain-kit/fin-extension) | 8,040 | 298 | 19 |
| [@interchain-kit/exodus-extension](https://www.npmjs.com/package/@interchain-kit/exodus-extension) | 7,590 | 354 | 21 |
| [@interchain-kit/ninji-extension](https://www.npmjs.com/package/@interchain-kit/ninji-extension) | 6,275 | 341 | 67 |
| [@interchain-kit/shell-extension](https://www.npmjs.com/package/@interchain-kit/shell-extension) | 6,050 | 340 | 16 |
| [@interchain-kit/phantom-extension](https://www.npmjs.com/package/@interchain-kit/phantom-extension) | 3,120 | 313 | 22 |
| [@interchain-kit/backpack-extension](https://www.npmjs.com/package/@interchain-kit/backpack-extension) | 2,260 | 280 | 20 |
| [@interchain-kit/vultisig-extension](https://www.npmjs.com/package/@interchain-kit/vultisig-extension) | 2,015 | 238 | 15 |
| [@interchain-kit/solflare-extension](https://www.npmjs.com/package/@interchain-kit/solflare-extension) | 1,991 | 242 | 16 |

### interchain-ui

| Name | Total | Monthly | Weekly |
| ------- | ------ | ------- | ----- |
| _Total_ | 556,388 | 25,531 | 6,289 |
| [@interchain-ui/react](https://www.npmjs.com/package/@interchain-ui/react) | 527,563 | 24,279 | 6,068 |
| [@interchain-ui/vue](https://www.npmjs.com/package/@interchain-ui/vue) | 14,733 | 557 | 118 |
| [@interchain-ui/react-no-ssr](https://www.npmjs.com/package/@interchain-ui/react-no-ssr) | 11,933 | 663 | 100 |
| [@interweb-ui/cli](https://www.npmjs.com/package/@interweb-ui/cli) | 1,019 | 9 | 1 |
| *2 packages hidden (< 1,000 downloads)* | | | |

### osmosis

| Name | Total | Monthly | Weekly |
| ------- | ------ | ------- | ----- |
| _Total_ | 925,449 | 20,653 | 5,096 |
| [osmojs](https://www.npmjs.com/package/osmojs) | 786,348 | 18,072 | 4,600 |
| [osmo-query](https://www.npmjs.com/package/osmo-query) | 60,162 | 1,772 | 337 |
| [@osmonauts/math](https://www.npmjs.com/package/@osmonauts/math) | 42,655 | 203 | 57 |
| [@osmosis-labs/math](https://www.npmjs.com/package/@osmosis-labs/math) | 14,416 | 201 | 14 |
| [@osmosis-labs/pools](https://www.npmjs.com/package/@osmosis-labs/pools) | 8,283 | 40 | 8 |
| [@osmosis-labs/proto-codecs](https://www.npmjs.com/package/@osmosis-labs/proto-codecs) | 4,913 | 54 | 6 |
| [@osmosis-labs/stores](https://www.npmjs.com/package/@osmosis-labs/stores) | 4,812 | 90 | 29 |
| [osmojs-rc](https://www.npmjs.com/package/osmojs-rc) | 1,310 | 126 | 29 |
| *6 packages hidden (< 1,000 downloads)* | | | |

### starship

| Name | Total | Monthly | Weekly |
| ------- | ------ | ------- | ----- |
| _Total_ | 151,170 | 11,172 | 8,137 |
| [@starship-ci/client](https://www.npmjs.com/package/@starship-ci/client) | 48,449 | 3,313 | 2,351 |
| [@starship-ci/cli](https://www.npmjs.com/package/@starship-ci/cli) | 46,473 | 3,261 | 2,340 |
| [starshipjs](https://www.npmjs.com/package/starshipjs) | 45,928 | 3,073 | 2,295 |
| [@starship-ci/types](https://www.npmjs.com/package/@starship-ci/types) | 9,231 | 1,472 | 1,135 |
| [@starship-ci/generator](https://www.npmjs.com/package/@starship-ci/generator) | 1,089 | 53 | 16 |

### cosmology

| Name | Total | Monthly | Weekly |
| ------- | ------ | ------- | ----- |
| _Total_ | 556,284 | 10,666 | 2,501 |
| [interchain](https://www.npmjs.com/package/interchain) | 103,610 | 1,184 | 307 |
| [@cosmology/core](https://www.npmjs.com/package/@cosmology/core) | 57,577 | 1,433 | 378 |
| [cosmjs-utils](https://www.npmjs.com/package/cosmjs-utils) | 52,877 | 751 | 163 |
| [@cosmology/cli](https://www.npmjs.com/package/@cosmology/cli) | 42,638 | 1,171 | 343 |
| [cosmology](https://www.npmjs.com/package/cosmology) | 39,063 | 1,541 | 393 |
| [@cosmology-ui/react](https://www.npmjs.com/package/@cosmology-ui/react) | 32,012 | 237 | 28 |
| [@cosmology-ui/utils](https://www.npmjs.com/package/@cosmology-ui/utils) | 26,341 | 166 | 23 |
| [interchain-query](https://www.npmjs.com/package/interchain-query) | 23,097 | 190 | 9 |
| [thorchain](https://www.npmjs.com/package/thorchain) | 13,856 | 144 | 18 |
| [@cosmonauts/telescope](https://www.npmjs.com/package/@cosmonauts/telescope) | 9,207 | 30 | 9 |
| [@cosmonauts/osmosis](https://www.npmjs.com/package/@cosmonauts/osmosis) | 8,993 | 375 | 60 |
| [@osmonauts/osmosis](https://www.npmjs.com/package/@osmonauts/osmosis) | 6,477 | 287 | 72 |
| [@osmonauts/babel](https://www.npmjs.com/package/@osmonauts/babel) | 6,084 | 27 | 15 |
| [create-cosmwasm-app](https://www.npmjs.com/package/create-cosmwasm-app) | 6,060 | 90 | 4 |
| [@cosmology/cosmos-registry](https://www.npmjs.com/package/@cosmology/cosmos-registry) | 5,775 | 121 | 20 |
| [@pyramation/crypto-keys](https://www.npmjs.com/package/@pyramation/crypto-keys) | 5,723 | 136 | 86 |
| [@pyramation/crypto-coins](https://www.npmjs.com/package/@pyramation/crypto-coins) | 4,864 | 130 | 85 |
| [@pyramation/crypto-networks](https://www.npmjs.com/package/@pyramation/crypto-networks) | 4,538 | 133 | 89 |
| [stargaze-zone](https://www.npmjs.com/package/stargaze-zone) | 4,256 | 276 | 11 |
| [dydx](https://www.npmjs.com/package/dydx) | 3,485 | 13 | 2 |
| [cosmscript](https://www.npmjs.com/package/cosmscript) | 3,433 | 38 | 1 |
| [@cosmology-ui/theme](https://www.npmjs.com/package/@cosmology-ui/theme) | 3,175 | 47 | 11 |
| [@cosmology-ui/chain-dropdown](https://www.npmjs.com/package/@cosmology-ui/chain-dropdown) | 3,172 | 31 | 4 |
| [@cosmology-ui/connect-modal](https://www.npmjs.com/package/@cosmology-ui/connect-modal) | 3,115 | 34 | 6 |
| [@cosmology-ui/copy-address-button](https://www.npmjs.com/package/@cosmology-ui/copy-address-button) | 3,104 | 43 | 4 |
| [@cosmology-ui/buttons](https://www.npmjs.com/package/@cosmology-ui/buttons) | 3,100 | 33 | 5 |
| [@osmonauts/ast-gen](https://www.npmjs.com/package/@osmonauts/ast-gen) | 3,038 | 34 | 12 |
| [@cosmology-ui/base](https://www.npmjs.com/package/@cosmology-ui/base) | 3,030 | 38 | 4 |
| [@cosmology-ui/animation](https://www.npmjs.com/package/@cosmology-ui/animation) | 3,007 | 43 | 5 |
| [@pyramation/crypto-cli](https://www.npmjs.com/package/@pyramation/crypto-cli) | 2,855 | 16 | 1 |
| [@cosmology-ui/swap](https://www.npmjs.com/package/@cosmology-ui/swap) | 2,728 | 50 | 13 |
| [@cosmonauts/ast-gen](https://www.npmjs.com/package/@cosmonauts/ast-gen) | 2,404 | 26 | 2 |
| [badkidsjs](https://www.npmjs.com/package/badkidsjs) | 2,353 | 55 | 20 |
| [@cosmonauts/protobuf](https://www.npmjs.com/package/@cosmonauts/protobuf) | 2,276 | 18 | 1 |
| [@cosmology/react](https://www.npmjs.com/package/@cosmology/react) | 1,896 | 27 | 4 |
| [dexmos](https://www.npmjs.com/package/dexmos) | 1,865 | 25 | 12 |
| [@pyramation/cosmos-registry](https://www.npmjs.com/package/@pyramation/cosmos-registry) | 1,807 | 15 | 2 |
| [@cosmology/protobufs](https://www.npmjs.com/package/@cosmology/protobufs) | 1,730 | 58 | 4 |
| [@uni-sign/cosmos-msgs](https://www.npmjs.com/package/@uni-sign/cosmos-msgs) | 1,611 | 86 | 15 |
| [@cosmology/ts-codegen-types](https://www.npmjs.com/package/@cosmology/ts-codegen-types) | 1,591 | 24 | 6 |
| [chain-registry-utils](https://www.npmjs.com/package/chain-registry-utils) | 1,542 | 19 | 0 |
| [@uni-sign/types](https://www.npmjs.com/package/@uni-sign/types) | 1,443 | 23 | 7 |
| [cosmoscript](https://www.npmjs.com/package/cosmoscript) | 1,396 | 15 | 2 |
| [@uni-sign/cosmos](https://www.npmjs.com/package/@uni-sign/cosmos) | 1,385 | 56 | 12 |
| [mesh-security](https://www.npmjs.com/package/mesh-security) | 1,381 | 24 | 8 |
| [@uni-sign/cosmos-query](https://www.npmjs.com/package/@uni-sign/cosmos-query) | 1,373 | 68 | 7 |
| [@cosmology/cosmjs](https://www.npmjs.com/package/@cosmology/cosmjs) | 1,367 | 31 | 8 |
| [@uni-sign/utils](https://www.npmjs.com/package/@uni-sign/utils) | 1,349 | 26 | 5 |
| [teslapi](https://www.npmjs.com/package/teslapi) | 1,336 | 25 | 1 |
| [@cosmonauts/cosmos](https://www.npmjs.com/package/@cosmonauts/cosmos) | 1,243 | 81 | 23 |
| [teritorijs](https://www.npmjs.com/package/teritorijs) | 1,166 | 66 | 19 |
| [cpbf](https://www.npmjs.com/package/cpbf) | 1,063 | 9 | 2 |
| [teritori](https://www.npmjs.com/package/teritori) | 1,037 | 54 | 15 |
| *56 packages hidden (< 1,000 downloads)* | | | |

### stride

| Name | Total | Monthly | Weekly |
| ------- | ------ | ------- | ----- |
| _Total_ | 37,931 | 379 | 78 |
| [stridejs](https://www.npmjs.com/package/stridejs) | 37,931 | 379 | 78 |

### juno

| Name | Total | Monthly | Weekly |
| ------- | ------ | ------- | ----- |
| _Total_ | 47,142 | 491 | 64 |
| [juno-network](https://www.npmjs.com/package/juno-network) | 38,526 | 420 | 60 |
| [@juno-network/assets](https://www.npmjs.com/package/@juno-network/assets) | 8,616 | 71 | 4 |

### stargaze

| Name | Total | Monthly | Weekly |
| ------- | ------ | ------- | ----- |
| _Total_ | 34,499 | 321 | 32 |
| [stargazejs](https://www.npmjs.com/package/stargazejs) | 22,872 | 204 | 23 |
| [@stargaze-zone/contracts](https://www.npmjs.com/package/@stargaze-zone/contracts) | 4,791 | 49 | 1 |
| [@stargaze-zone/chain](https://www.npmjs.com/package/@stargaze-zone/chain) | 4,357 | 28 | 2 |
| [stargaze-query](https://www.npmjs.com/package/stargaze-query) | 2,479 | 40 | 6 |

### dydx

| Name | Total | Monthly | Weekly |
| ------- | ------ | ------- | ----- |
| _Total_ | 3,838,150 | 386,771 | 84,641 |
| [@dydxprotocol/v4-client-js](https://www.npmjs.com/package/@dydxprotocol/v4-client-js) | 3,838,150 | 386,771 | 84,641 |

### chain

| Name | Total | Monthly | Weekly |
| ------- | ------ | ------- | ----- |
| _Total_ | 13,649 | 152 | 25 |
| [@juno-network/swap](https://www.npmjs.com/package/@juno-network/swap) | 4,679 | 29 | 6 |
| [akashjs](https://www.npmjs.com/package/akashjs) | 4,072 | 23 | 5 |
| [autosmosis](https://www.npmjs.com/package/autosmosis) | 1,641 | 6 | 0 |
| [kavajs](https://www.npmjs.com/package/kavajs) | 1,120 | 23 | 0 |
| *4 packages hidden (< 1,000 downloads)* | | | |

### create-cosmos-app

| Name | Total | Monthly | Weekly |
| ------- | ------ | ------- | ----- |
| _Total_ | 21,515 | 324 | 13 |
| [create-cosmos-app](https://www.npmjs.com/package/create-cosmos-app) | 18,645 | 206 | 7 |
| [create-interchain-app](https://www.npmjs.com/package/create-interchain-app) | 2,870 | 118 | 6 |



---

### Thank You 💖

To the amazing Constructive community: thank you for being part of our journey. We're taking everything you love to the next level—and we're thrilled to have you with us.

Let's build the future, together. 🚀

## Understanding Downloads

Download statistics represent far more than direct end-user adoption. Our numbers reflect infrastructure integration, CI/CD pipelines, and a multi-layered software distribution chain. Major platforms like Supabase and enterprise frameworks build systems on top of our tools, driving millions of downloads. Additionally, since some of our npm modules depend on each other, some downloads compound across the ecosystem—when one package is pulled as a dependency, both the parent and child can contribute to the count.

This means download figures represent cumulative usage across many layers. Since we're many layers up the software distribution chain, individual developers may be entirely unaware our software powers their experience. Yet despite this complexity, these numbers serve as a meaningful signal of genuine interest and adoption. They tell us which tools developers and platforms value most, and which areas are garnering real traction—the kind of validation that motivates us to keep building.## Credits

**🛠 Built by the [Constructive](https://constructive.io) team — creators of modular Postgres tooling for secure, composable backends. If you like our work, contribute on [GitHub](https://github.com/constructive-io).**

## Disclaimer

AS DESCRIBED IN THE LICENSES, THE SOFTWARE IS PROVIDED "AS IS", AT YOUR OWN RISK, AND WITHOUT WARRANTIES OF ANY KIND.

No developer or entity involved in creating this software will be liable for any claims or damages whatsoever associated with your use, inability to use, or your interaction with other users of the code, including any direct, indirect, incidental, special, exemplary, punitive or consequential damages, or loss of profits, cryptocurrencies, tokens, or anything else of value.


<!-- README.md automatically generated on 2026-10-16T21:19:08.804Z from lib-count repository with latest download stats -->
