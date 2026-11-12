
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
| **Total** | 301,406,250 | 58,924,966 | 16,089,809 |
| Database | 201,115,116 | 51,673,992 | 14,307,680 |
| Chain | 73,002,022 | 2,627,004 | 629,769 |
| Utilities | 27,287,435 | 4,623,970 | 1,152,360 |

_Weekly and monthly are the last 7 and 30 days of npm data, through 2026-11-10._ _npm reported zero downloads for every package on 4 of those 30 days (an npm-side outage); those days are excluded and the totals scaled to the full period._


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
| _Total_ | 162,760,481 | 42,842,611 | 12,071,086 |
| [@pgsql/types](https://www.npmjs.com/package/@pgsql/types) | 37,807,129 | 14,308,640 | 4,217,571 |
| [libpg-query](https://www.npmjs.com/package/libpg-query) | 33,564,370 | 11,304,843 | 3,313,591 |
| [pgsql-deparser](https://www.npmjs.com/package/pgsql-deparser) | 21,195,971 | 3,728,000 | 970,736 |
| [pgsql-parser](https://www.npmjs.com/package/pgsql-parser) | 14,662,737 | 1,876,878 | 485,579 |
| [@launchql/protobufjs](https://www.npmjs.com/package/@launchql/protobufjs) | 9,732,369 | 2,425,048 | 628,067 |
| [@libpg-query/parser](https://www.npmjs.com/package/@libpg-query/parser) | 9,181,575 | 3,080,748 | 917,888 |
| [pgsql-enums](https://www.npmjs.com/package/pgsql-enums) | 7,552,310 | 66,615 | 24,571 |
| [pg-proto-parser](https://www.npmjs.com/package/pg-proto-parser) | 7,367,232 | 1,865,473 | 478,290 |
| [@pgsql/traverse](https://www.npmjs.com/package/@pgsql/traverse) | 7,256,278 | 1,872,069 | 480,130 |
| [@pgsql/enums](https://www.npmjs.com/package/@pgsql/enums) | 884,487 | 113,206 | 28,057 |
| [@pgsql/utils](https://www.npmjs.com/package/@pgsql/utils) | 782,632 | 58,446 | 13,570 |
| [pg-env](https://www.npmjs.com/package/pg-env) | 629,178 | 80,212 | 18,567 |
| [pg-cache](https://www.npmjs.com/package/pg-cache) | 578,784 | 64,370 | 15,054 |
| [csv-to-pg](https://www.npmjs.com/package/csv-to-pg) | 505,075 | 46,998 | 10,439 |
| [graphile-settings](https://www.npmjs.com/package/graphile-settings) | 391,723 | 59,866 | 15,391 |
| [graphile-postgis](https://www.npmjs.com/package/graphile-postgis) | 342,577 | 56,410 | 13,839 |
| [graphile-i18n](https://www.npmjs.com/package/graphile-i18n) | 324,090 | 55,153 | 13,608 |
| [gql-ast](https://www.npmjs.com/package/gql-ast) | 321,380 | 48,445 | 11,083 |
| [graphile-cache](https://www.npmjs.com/package/graphile-cache) | 313,528 | 51,181 | 11,980 |
| [pg-query-context](https://www.npmjs.com/package/pg-query-context) | 292,357 | 49,044 | 11,457 |
| [graphile-upload-plugin](https://www.npmjs.com/package/graphile-upload-plugin) | 291,352 | 40,770 | 4,355 |
| [pg-ast](https://www.npmjs.com/package/pg-ast) | 278,820 | 45,743 | 10,098 |
| [@pyramation/postgraphile-plugin-fulltext-filter](https://www.npmjs.com/package/@pyramation/postgraphile-plugin-fulltext-filter) | 274,501 | 11,631 | 2,601 |
| [@agentic-kit/ollama](https://www.npmjs.com/package/@agentic-kit/ollama) | 270,010 | 47,478 | 9,630 |
| [pgsql-test](https://www.npmjs.com/package/pgsql-test) | 258,103 | 37,862 | 8,812 |
| [@pgpmjs/transform](https://www.npmjs.com/package/@pgpmjs/transform) | 253,733 | 57,734 | 13,848 |
| [@agentic-kit/protocol](https://www.npmjs.com/package/@agentic-kit/protocol) | 239,802 | 46,797 | 9,462 |
| [@pgpmjs/ast](https://www.npmjs.com/package/@pgpmjs/ast) | 233,768 | 60,447 | 13,817 |
| [graphile-plugin-utils](https://www.npmjs.com/package/graphile-plugin-utils) | 231,913 | 50,883 | 11,927 |
| [@constructive-io/errors](https://www.npmjs.com/package/@constructive-io/errors) | 225,539 | 61,048 | 14,339 |
| [@pgsql/parser](https://www.npmjs.com/package/@pgsql/parser) | 209,791 | 83,994 | 23,879 |
| [@pgpmjs/naming-spec](https://www.npmjs.com/package/@pgpmjs/naming-spec) | 207,696 | 52,942 | 12,387 |
| [graphile-history](https://www.npmjs.com/package/graphile-history) | 205,234 | 54,528 | 13,527 |
| [@pgpmjs/slice](https://www.npmjs.com/package/@pgpmjs/slice) | 203,389 | 49,169 | 11,667 |
| [graphile-meta](https://www.npmjs.com/package/graphile-meta) | 198,308 | 49,029 | 11,612 |
| [skitch-utils](https://www.npmjs.com/package/skitch-utils) | 196,954 | 9,133 | 2,145 |
| [@pgsql/transform](https://www.npmjs.com/package/@pgsql/transform) | 194,029 | 42,582 | 9,617 |
| [query-spec](https://www.npmjs.com/package/query-spec) | 190,860 | 44,042 | 9,699 |
| [@pgql/parse](https://www.npmjs.com/package/@pgql/parse) | 190,483 | 237 | 37 |
| [@pgpmjs/bundle](https://www.npmjs.com/package/@pgpmjs/bundle) | 189,788 | 40,326 | 8,792 |
| [@pgpmjs/traverse](https://www.npmjs.com/package/@pgpmjs/traverse) | 189,642 | 40,477 | 8,769 |
| [@pgsql/semantics](https://www.npmjs.com/package/@pgsql/semantics) | 184,700 | 51,883 | 13,135 |
| [@pgpmjs/diff](https://www.npmjs.com/package/@pgpmjs/diff) | 177,314 | 48,472 | 11,601 |
| [@constructive-io/coerce](https://www.npmjs.com/package/@constructive-io/coerce) | 168,484 | 58,360 | 13,945 |
| [@pgsql/scripts](https://www.npmjs.com/package/@pgsql/scripts) | 161,920 | 42,569 | 9,501 |
| [skitch](https://www.npmjs.com/package/skitch) | 132,746 | 62 | 12 |
| [graphile-test](https://www.npmjs.com/package/graphile-test) | 117,083 | 9,211 | 2,656 |
| [graphile-storage-registry](https://www.npmjs.com/package/graphile-storage-registry) | 111,763 | 47,813 | 11,511 |
| [@launchql/styled-email](https://www.npmjs.com/package/@launchql/styled-email) | 111,616 | 170 | 18 |
| [graphile-function-bindings](https://www.npmjs.com/package/graphile-function-bindings) | 111,601 | 36,250 | 8,632 |
| [@launchql/mjml](https://www.npmjs.com/package/@launchql/mjml) | 111,544 | 107 | 22 |
| [introspectron](https://www.npmjs.com/package/introspectron) | 103,191 | 10,066 | 3,855 |
| [@launchql/cli](https://www.npmjs.com/package/@launchql/cli) | 87,068 | 457 | 351 |
| [safegres](https://www.npmjs.com/package/safegres) | 80,128 | 22,604 | 5,623 |
| [graphile-query](https://www.npmjs.com/package/graphile-query) | 78,202 | 6,891 | 2,681 |
| [@pgsql/lint](https://www.npmjs.com/package/@pgsql/lint) | 67,235 | 26,753 | 5,633 |
| [pg-codegen](https://www.npmjs.com/package/pg-codegen) | 63,427 | 8,159 | 3,047 |
| [agentic-server](https://www.npmjs.com/package/agentic-server) | 61,657 | 14,412 | 3,353 |
| [@launchql/graphql-testing](https://www.npmjs.com/package/@launchql/graphql-testing) | 60,274 | 277 | 211 |
| [supabase-test](https://www.npmjs.com/package/supabase-test) | 59,495 | 7,588 | 2,005 |
| [graphile-search-plugin](https://www.npmjs.com/package/graphile-search-plugin) | 56,240 | 366 | 71 |
| [@constructive-io/eslint-config](https://www.npmjs.com/package/@constructive-io/eslint-config) | 55,000 | 17,745 | 3,823 |
| [graphile-simple-inflector](https://www.npmjs.com/package/graphile-simple-inflector) | 51,286 | 367 | 63 |
| [graphile-meta-schema](https://www.npmjs.com/package/graphile-meta-schema) | 51,249 | 337 | 85 |
| [graphile-scoped-introspection](https://www.npmjs.com/package/graphile-scoped-introspection) | 49,040 | 35,385 | 8,288 |
| [drizzle-orm-test](https://www.npmjs.com/package/drizzle-orm-test) | 48,311 | 5,691 | 1,402 |
| [skitch-templates](https://www.npmjs.com/package/skitch-templates) | 46,086 | 81 | 25 |
| [pg-query-string](https://www.npmjs.com/package/pg-query-string) | 44,008 | 837 | 131 |
| [@launchql/server](https://www.npmjs.com/package/@launchql/server) | 42,369 | 298 | 133 |
| [@launchql/types](https://www.npmjs.com/package/@launchql/types) | 42,217 | 898 | 233 |
| [@pgpmjs/import](https://www.npmjs.com/package/@pgpmjs/import) | 41,396 | 11,761 | 3,045 |
| [@agentic-kit/pi](https://www.npmjs.com/package/@agentic-kit/pi) | 41,268 | 13,711 | 4,341 |
| [@launchql/server-utils](https://www.npmjs.com/package/@launchql/server-utils) | 40,862 | 675 | 248 |
| [@launchql/explorer](https://www.npmjs.com/package/@launchql/explorer) | 37,137 | 766 | 334 |
| [@launchql/core](https://www.npmjs.com/package/@launchql/core) | 35,904 | 654 | 197 |
| [@agentic-kit/run-log](https://www.npmjs.com/package/@agentic-kit/run-log) | 35,864 | 15,504 | 3,424 |
| [@launchql/env](https://www.npmjs.com/package/@launchql/env) | 35,108 | 483 | 99 |
| [@launchql/db-testing](https://www.npmjs.com/package/@launchql/db-testing) | 33,831 | 234 | 140 |
| [@agentic-kit/anthropic](https://www.npmjs.com/package/@agentic-kit/anthropic) | 33,537 | 5,123 | 1,171 |
| [skitch-testing](https://www.npmjs.com/package/skitch-testing) | 33,489 | 60 | 3 |
| [@agentic-kit/openai](https://www.npmjs.com/package/@agentic-kit/openai) | 32,760 | 5,548 | 1,406 |
| [graphile-plugin-connection-filter-postgis](https://www.npmjs.com/package/graphile-plugin-connection-filter-postgis) | 32,310 | 193 | 22 |
| [@launchql/postmaster](https://www.npmjs.com/package/@launchql/postmaster) | 31,619 | 48 | 12 |
| [@launchql/logger](https://www.npmjs.com/package/@launchql/logger) | 30,758 | 403 | 67 |
| [@agentic-kit/db-tools](https://www.npmjs.com/package/@agentic-kit/db-tools) | 30,278 | 14,144 | 4,411 |
| [graphile-plugin-connection-filter](https://www.npmjs.com/package/graphile-plugin-connection-filter) | 29,733 | 207 | 20 |
| [graphile-plugin-fulltext-filter](https://www.npmjs.com/package/graphile-plugin-fulltext-filter) | 27,938 | 181 | 17 |
| [graphile-pg-type-mappings](https://www.npmjs.com/package/graphile-pg-type-mappings) | 27,577 | 166 | 36 |
| [@launchql/templatizer](https://www.npmjs.com/package/@launchql/templatizer) | 27,101 | 507 | 84 |
| [@decryption/hashes](https://www.npmjs.com/package/@decryption/hashes) | 26,986 | 4,052 | 980 |
| [@launchql/db-utils](https://www.npmjs.com/package/@launchql/db-utils) | 26,912 | 160 | 112 |
| [pg-query-native-latest](https://www.npmjs.com/package/pg-query-native-latest) | 26,821 | 115 | 21 |
| [@agentic-kit/harness](https://www.npmjs.com/package/@agentic-kit/harness) | 26,204 | 6,378 | 1,776 |
| [@pgpmjs/pglite-adapter](https://www.npmjs.com/package/@pgpmjs/pglite-adapter) | 26,123 | 9,016 | 3,184 |
| [@launchql/db-migrate](https://www.npmjs.com/package/@launchql/db-migrate) | 24,904 | 133 | 87 |
| [@agentic-kit/agent](https://www.npmjs.com/package/@agentic-kit/agent) | 24,810 | 4,487 | 936 |
| [pglite-test](https://www.npmjs.com/package/pglite-test) | 24,082 | 7,703 | 2,850 |
| [@agentic-kit/metering](https://www.npmjs.com/package/@agentic-kit/metering) | 23,922 | 10,971 | 6,552 |
| [@launchql/s3-streamer](https://www.npmjs.com/package/@launchql/s3-streamer) | 23,213 | 193 | 116 |
| [@launchql/db-templates](https://www.npmjs.com/package/@launchql/db-templates) | 22,391 | 120 | 78 |
| [@constructive-io/graphql-dev-server](https://www.npmjs.com/package/@constructive-io/graphql-dev-server) | 21,623 | 7,902 | 2,971 |
| [@agentic-kit/chat](https://www.npmjs.com/package/@agentic-kit/chat) | 21,120 | 4,011 | 837 |
| [@agentic-kit/cli](https://www.npmjs.com/package/@agentic-kit/cli) | 20,894 | 8,455 | 3,025 |
| [@launchql/content-type-stream](https://www.npmjs.com/package/@launchql/content-type-stream) | 20,528 | 85 | 31 |
| [@launchql/upload-names](https://www.npmjs.com/package/@launchql/upload-names) | 19,530 | 96 | 42 |
| [postgraphile-derived-upload-field](https://www.npmjs.com/package/postgraphile-derived-upload-field) | 18,745 | 102 | 37 |
| [@agentic-kit/run-log-client](https://www.npmjs.com/package/@agentic-kit/run-log-client) | 18,669 | 13,216 | 2,746 |
| [@constructive-db/machine-protocol](https://www.npmjs.com/package/@constructive-db/machine-protocol) | 16,724 | 12,981 | 2,648 |
| [@launchql/url-domains](https://www.npmjs.com/package/@launchql/url-domains) | 15,287 | 125 | 53 |
| [skitch-template](https://www.npmjs.com/package/skitch-template) | 15,145 | 80 | 25 |
| [@agentic-kit/pi-host](https://www.npmjs.com/package/@agentic-kit/pi-host) | 14,637 | 12,134 | 3,732 |
| [@launchql/ext-verify](https://www.npmjs.com/package/@launchql/ext-verify) | 14,466 | 144 | 4 |
| [@launchql/ext-types](https://www.npmjs.com/package/@launchql/ext-types) | 14,257 | 85 | 4 |
| [@launchql/ext-defaults](https://www.npmjs.com/package/@launchql/ext-defaults) | 14,116 | 87 | 2 |
| [@launchql/ext-default-roles](https://www.npmjs.com/package/@launchql/ext-default-roles) | 14,111 | 85 | 2 |
| [@launchql/ext-measurements](https://www.npmjs.com/package/@launchql/ext-measurements) | 13,785 | 81 | 1 |
| [@launchql/ext-jobs](https://www.npmjs.com/package/@launchql/ext-jobs) | 13,526 | 81 | 1 |
| [@launchql/db-transform](https://www.npmjs.com/package/@launchql/db-transform) | 13,485 | 115 | 69 |
| [@launchql/base32](https://www.npmjs.com/package/@launchql/base32) | 13,067 | 95 | 11 |
| [@launchql/graphile-settings](https://www.npmjs.com/package/@launchql/graphile-settings) | 12,990 | 363 | 97 |
| [graphile-column-privileges-mutations](https://www.npmjs.com/package/graphile-column-privileges-mutations) | 12,964 | 301 | 51 |
| [@launchql/inflection](https://www.npmjs.com/package/@launchql/inflection) | 12,846 | 95 | 6 |
| [@launchql/totp](https://www.npmjs.com/package/@launchql/totp) | 12,430 | 77 | 4 |
| [@pgpm/errors](https://www.npmjs.com/package/@pgpm/errors) | 12,375 | 4,983 | 1,327 |
| [@launchql/faker](https://www.npmjs.com/package/@launchql/faker) | 12,263 | 111 | 15 |
| [@pgpm/function-resolution](https://www.npmjs.com/package/@pgpm/function-resolution) | 12,257 | 3,535 | 585 |
| [@agentic-kit/dsh](https://www.npmjs.com/package/@agentic-kit/dsh) | 12,155 | 8,502 | 3,063 |
| [@pgpm/app-scope](https://www.npmjs.com/package/@pgpm/app-scope) | 11,958 | 3,088 | 554 |
| [@constructive-db/catalog](https://www.npmjs.com/package/@constructive-db/catalog) | 11,950 | 3,530 | 708 |
| [@launchql/codegen](https://www.npmjs.com/package/@launchql/codegen) | 11,735 | 114 | 43 |
| [@launchql/ext-jobs-queue](https://www.npmjs.com/package/@launchql/ext-jobs-queue) | 11,463 | 75 | 2 |
| [@launchql/db-template](https://www.npmjs.com/package/@launchql/db-template) | 11,425 | 90 | 51 |
| [@launchql/ext-jwt-claims](https://www.npmjs.com/package/@launchql/ext-jwt-claims) | 11,271 | 90 | 3 |
| [@constructive-db/routing](https://www.npmjs.com/package/@constructive-db/routing) | 11,127 | 3,168 | 704 |
| [@launchql/ext-achievements](https://www.npmjs.com/package/@launchql/ext-achievements) | 10,877 | 75 | 3 |
| [@constructive-db/routing-platform](https://www.npmjs.com/package/@constructive-db/routing-platform) | 10,864 | 3,332 | 700 |
| [@launchql/react](https://www.npmjs.com/package/@launchql/react) | 10,635 | 50 | 10 |
| [@pgpmjs/portability](https://www.npmjs.com/package/@pgpmjs/portability) | 10,608 | 3,940 | 1,195 |
| [@constructive-db/apps](https://www.npmjs.com/package/@constructive-db/apps) | 9,148 | 2,620 | 533 |
| [agentic-kit](https://www.npmjs.com/package/agentic-kit) | 9,105 | 1,366 | 355 |
| [skitch-transform](https://www.npmjs.com/package/skitch-transform) | 9,047 | 73 | 3 |
| [@launchql/ext-stamps](https://www.npmjs.com/package/@launchql/ext-stamps) | 8,851 | 67 | 1 |
| [@launchql/ext-uuid](https://www.npmjs.com/package/@launchql/ext-uuid) | 8,791 | 72 | 2 |
| [@launchql/proto-cli](https://www.npmjs.com/package/@launchql/proto-cli) | 8,735 | 532 | 142 |
| [pg-utils](https://www.npmjs.com/package/pg-utils) | 8,606 | 28 | 5 |
| [graphile-gen](https://www.npmjs.com/package/graphile-gen) | 8,165 | 65 | 4 |
| [@launchql/db-env](https://www.npmjs.com/package/@launchql/db-env) | 8,102 | 95 | 51 |
| [@constructive-io/site-deploy](https://www.npmjs.com/package/@constructive-io/site-deploy) | 7,813 | 3,172 | 806 |
| [@launchql/ext-utils](https://www.npmjs.com/package/@launchql/ext-utils) | 7,419 | 60 | 5 |
| [@launchql/s3-utils](https://www.npmjs.com/package/@launchql/s3-utils) | 7,331 | 80 | 21 |
| [skitch-types](https://www.npmjs.com/package/skitch-types) | 7,319 | 33 | 3 |
| [@launchql/utils](https://www.npmjs.com/package/@launchql/utils) | 7,217 | 61 | 3 |
| [@launchql/protobufjs-cli](https://www.npmjs.com/package/@launchql/protobufjs-cli) | 7,207 | 1,187 | 284 |
| [@launchql/openfaas-job-worker](https://www.npmjs.com/package/@launchql/openfaas-job-worker) | 6,928 | 47 | 24 |
| [skitch-path](https://www.npmjs.com/package/skitch-path) | 6,671 | 53 | 3 |
| [@agentic-kit/react](https://www.npmjs.com/package/@agentic-kit/react) | 6,220 | 741 | 139 |
| [@agentic-kit/run-log-gate](https://www.npmjs.com/package/@agentic-kit/run-log-gate) | 6,023 | 4,190 | 966 |
| [@agentic-kit/agent-conversation](https://www.npmjs.com/package/@agentic-kit/agent-conversation) | 5,886 | 3,900 | 846 |
| [@launchql/migrate](https://www.npmjs.com/package/@launchql/migrate) | 4,440 | 156 | 51 |
| [@launchql/query](https://www.npmjs.com/package/@launchql/query) | 4,367 | 45 | 11 |
| [@launchql/graphile-query](https://www.npmjs.com/package/@launchql/graphile-query) | 4,209 | 105 | 33 |
| [skitch-ext-utilities](https://www.npmjs.com/package/skitch-ext-utilities) | 4,162 | 32 | 5 |
| [skitch-prompt](https://www.npmjs.com/package/skitch-prompt) | 4,139 | 27 | 1 |
| [skitch-env](https://www.npmjs.com/package/skitch-env) | 4,108 | 69 | 4 |
| [skitch-ext-verify](https://www.npmjs.com/package/skitch-ext-verify) | 4,085 | 28 | 1 |
| [@pgsql/transform-ast](https://www.npmjs.com/package/@pgsql/transform-ast) | 4,037 | 1,872 | 453 |
| [skitch-ext-defaults](https://www.npmjs.com/package/skitch-ext-defaults) | 3,999 | 42 | 5 |
| [@constructive-db/infra-platform](https://www.npmjs.com/package/@constructive-db/infra-platform) | 3,978 | 1,460 | 30 |
| [@constructive-io/data](https://www.npmjs.com/package/@constructive-io/data) | 3,955 | 1,715 | 605 |
| [@launchql/openfaas-job-fn](https://www.npmjs.com/package/@launchql/openfaas-job-fn) | 3,926 | 37 | 13 |
| [@constructive-db/infra](https://www.npmjs.com/package/@constructive-db/infra) | 3,688 | 1,404 | 40 |
| [@constructive-db/compute](https://www.npmjs.com/package/@constructive-db/compute) | 3,676 | 1,388 | 22 |
| [graphile-gen-js](https://www.npmjs.com/package/graphile-gen-js) | 3,606 | 42 | 4 |
| [@launchql/client](https://www.npmjs.com/package/@launchql/client) | 3,595 | 383 | 44 |
| [@constructive-db/compute-platform](https://www.npmjs.com/package/@constructive-db/compute-platform) | 3,582 | 1,355 | 24 |
| [@constructive-db/platform-schema](https://www.npmjs.com/package/@constructive-db/platform-schema) | 3,576 | 1,383 | 19 |
| [@launchql/orm](https://www.npmjs.com/package/@launchql/orm) | 3,426 | 323 | 10 |
| [skitch-extension-verify](https://www.npmjs.com/package/skitch-extension-verify) | 3,387 | 45 | 11 |
| [@launchql/job-utils](https://www.npmjs.com/package/@launchql/job-utils) | 3,348 | 59 | 13 |
| [launchql-test](https://www.npmjs.com/package/launchql-test) | 3,341 | 74 | 32 |
| [@launchql/openfaas-job-service](https://www.npmjs.com/package/@launchql/openfaas-job-service) | 3,305 | 32 | 11 |
| [@launchql/job-worker](https://www.npmjs.com/package/@launchql/job-worker) | 3,256 | 45 | 13 |
| [@launchql/query-builder](https://www.npmjs.com/package/@launchql/query-builder) | 3,229 | 69 | 10 |
| [skitch-extension-utils](https://www.npmjs.com/package/skitch-extension-utils) | 3,079 | 22 | 2 |
| [skitch-install](https://www.npmjs.com/package/skitch-install) | 3,067 | 39 | 4 |
| [@launchql/job-scheduler](https://www.npmjs.com/package/@launchql/job-scheduler) | 2,933 | 69 | 14 |
| [@launchql/job-pg](https://www.npmjs.com/package/@launchql/job-pg) | 2,831 | 50 | 9 |
| [skitch-extension-defaults](https://www.npmjs.com/package/skitch-extension-defaults) | 2,746 | 15 | 1 |
| [@constructive-io/schema-builder](https://www.npmjs.com/package/@constructive-io/schema-builder) | 2,724 | 807 | 305 |
| [skitch-extension-jobs](https://www.npmjs.com/package/skitch-extension-jobs) | 2,653 | 14 | 1 |
| [agentic-db](https://www.npmjs.com/package/agentic-db) | 2,576 | 224 | 21 |
| [skitch-extension-default-roles](https://www.npmjs.com/package/skitch-extension-default-roles) | 2,400 | 14 | 3 |
| [launchql-client](https://www.npmjs.com/package/launchql-client) | 2,380 | 35 | 10 |
| [@agentic-db/sdk](https://www.npmjs.com/package/@agentic-db/sdk) | 2,359 | 208 | 55 |
| [@agentic-kit/pi-embed](https://www.npmjs.com/package/@agentic-kit/pi-embed) | 2,277 | 80 | 14 |
| [@agentic-kit/pi-ext-run-log](https://www.npmjs.com/package/@agentic-kit/pi-ext-run-log) | 2,083 | 57 | 9 |
| [@constructive-db/scope](https://www.npmjs.com/package/@constructive-db/scope) | 2,042 | 1,188 | 17 |
| [@constructive-db/machine-runner](https://www.npmjs.com/package/@constructive-db/machine-runner) | 2,003 | 1,352 | 372 |
| [@agentic-db/services](https://www.npmjs.com/package/@agentic-db/services) | 1,931 | 115 | 15 |
| [@agentic-kit/pi-ext-metered-model](https://www.npmjs.com/package/@agentic-kit/pi-ext-metered-model) | 1,842 | 57 | 13 |
| [@constructive-db/remote](https://www.npmjs.com/package/@constructive-db/remote) | 1,840 | 1,239 | 20 |
| [@launchql/openfaas-job-util-jobs](https://www.npmjs.com/package/@launchql/openfaas-job-util-jobs) | 1,840 | 24 | 8 |
| [@agentic-kit/pi-ext-gate](https://www.npmjs.com/package/@agentic-kit/pi-ext-gate) | 1,832 | 43 | 9 |
| [@agentic-kit/pi-ext-usage-report](https://www.npmjs.com/package/@agentic-kit/pi-ext-usage-report) | 1,832 | 53 | 12 |
| [@launchql/geo-types](https://www.npmjs.com/package/@launchql/geo-types) | 1,722 | 28 | 1 |
| [launchql-gen](https://www.npmjs.com/package/launchql-gen) | 1,694 | 63 | 18 |
| [@webql/base32](https://www.npmjs.com/package/@webql/base32) | 1,577 | 37 | 6 |
| [@launchql/ast](https://www.npmjs.com/package/@launchql/ast) | 1,560 | 38 | 1 |
| [@constructive-db/agent-cli](https://www.npmjs.com/package/@constructive-db/agent-cli) | 1,541 | 1,067 | 132 |
| [@launchql/mmmagic](https://www.npmjs.com/package/@launchql/mmmagic) | 1,522 | 29 | 5 |
| [@launchql/openfaas-job-server](https://www.npmjs.com/package/@launchql/openfaas-job-server) | 1,519 | 18 | 5 |
| [graphile-client](https://www.npmjs.com/package/graphile-client) | 1,493 | 24 | 4 |
| [graphile-gen-sql](https://www.npmjs.com/package/graphile-gen-sql) | 1,460 | 21 | 3 |
| [@launchql/openfaas-env](https://www.npmjs.com/package/@launchql/openfaas-env) | 1,392 | 16 | 4 |
| [@launchql/pg-query-context](https://www.npmjs.com/package/@launchql/pg-query-context) | 1,345 | 28 | 7 |
| [@agentic-kit/bradie](https://www.npmjs.com/package/@agentic-kit/bradie) | 1,313 | 73 | 17 |
| [@launchql/job-api-server](https://www.npmjs.com/package/@launchql/job-api-server) | 1,304 | 18 | 7 |
| [csv-to-gql](https://www.npmjs.com/package/csv-to-gql) | 1,277 | 20 | 4 |
| [@launchql/ext-status](https://www.npmjs.com/package/@launchql/ext-status) | 1,205 | 23 | 1 |
| [@agentic-db/cli](https://www.npmjs.com/package/@agentic-db/cli) | 1,185 | 147 | 34 |
| [@webql/utils](https://www.npmjs.com/package/@webql/utils) | 1,106 | 25 | 4 |
| [@launchql/ast-deparser](https://www.npmjs.com/package/@launchql/ast-deparser) | 1,090 | 23 | 4 |
| [skitch-extension-utilities](https://www.npmjs.com/package/skitch-extension-utilities) | 1,043 | 13 | 2 |
| [@decryption/wallet](https://www.npmjs.com/package/@decryption/wallet) | 1,018 | 497 | 132 |
| [@launchql/openfaas-job-req](https://www.npmjs.com/package/@launchql/openfaas-job-req) | 1,015 | 12 | 2 |
| *64 packages hidden (< 1,000 downloads)* | | | |

### utils

| Name | Total | Monthly | Weekly |
| ------- | ------ | ------- | ----- |
| _Total_ | 27,226,077 | 4,588,027 | 1,142,248 |
| [nested-obj](https://www.npmjs.com/package/nested-obj) | 8,079,634 | 1,888,808 | 483,686 |
| [strfy-js](https://www.npmjs.com/package/strfy-js) | 7,370,781 | 1,865,707 | 478,156 |
| [inquirerer](https://www.npmjs.com/package/inquirerer) | 2,244,718 | 99,865 | 22,530 |
| [ast-stringify](https://www.npmjs.com/package/ast-stringify) | 1,585,277 | 35,769 | 7,929 |
| [@pyramation/json-schema-ref-parser](https://www.npmjs.com/package/@pyramation/json-schema-ref-parser) | 1,558,585 | 34,392 | 7,776 |
| [@pyramation/json-schema-to-typescript](https://www.npmjs.com/package/@pyramation/json-schema-to-typescript) | 1,546,594 | 34,425 | 7,790 |
| [appstash](https://www.npmjs.com/package/appstash) | 576,894 | 44,714 | 10,297 |
| [yanse](https://www.npmjs.com/package/yanse) | 536,798 | 60,174 | 14,306 |
| [genomic](https://www.npmjs.com/package/genomic) | 479,547 | 56,065 | 12,342 |
| [komoji](https://www.npmjs.com/package/komoji) | 397,677 | 50,154 | 12,221 |
| [etag-hash](https://www.npmjs.com/package/etag-hash) | 396,738 | 43,206 | 4,878 |
| [uuid-hash](https://www.npmjs.com/package/uuid-hash) | 355,891 | 42,359 | 4,645 |
| [12factor-env](https://www.npmjs.com/package/12factor-env) | 322,596 | 59,934 | 14,211 |
| [mime-bytes](https://www.npmjs.com/package/mime-bytes) | 313,208 | 53,285 | 12,814 |
| [inflekt](https://www.npmjs.com/package/inflekt) | 288,126 | 46,533 | 11,275 |
| [makage](https://www.npmjs.com/package/makage) | 282,795 | 22,437 | 4,474 |
| [git-changed](https://www.npmjs.com/package/git-changed) | 170,432 | 53,078 | 11,909 |
| [schema-typescript](https://www.npmjs.com/package/schema-typescript) | 114,924 | 9,980 | 2,580 |
| [clean-ansi](https://www.npmjs.com/package/clean-ansi) | 99,558 | 1,323 | 284 |
| [yamlize](https://www.npmjs.com/package/yamlize) | 60,465 | 18,850 | 3,969 |
| [confstash](https://www.npmjs.com/package/confstash) | 59,217 | 17,931 | 3,890 |
| [pnpm-policy](https://www.npmjs.com/package/pnpm-policy) | 56,779 | 19,020 | 4,001 |
| [@constructive-io/pnpm-policy](https://www.npmjs.com/package/@constructive-io/pnpm-policy) | 56,497 | 19,020 | 3,997 |
| [create-gen-app](https://www.npmjs.com/package/create-gen-app) | 41,666 | 390 | 75 |
| [publish-scripts](https://www.npmjs.com/package/publish-scripts) | 34,388 | 533 | 74 |
| [@pyramation/babel-preset-env](https://www.npmjs.com/package/@pyramation/babel-preset-env) | 33,013 | 1,003 | 199 |
| [symlink-workspace](https://www.npmjs.com/package/symlink-workspace) | 29,403 | 1,763 | 375 |
| [promql-ast](https://www.npmjs.com/package/promql-ast) | 25,577 | 2,952 | 635 |
| [json-schema-patch](https://www.npmjs.com/package/json-schema-patch) | 23,274 | 714 | 133 |
| [file-ts](https://www.npmjs.com/package/file-ts) | 22,871 | 558 | 127 |
| [etag-stream](https://www.npmjs.com/package/etag-stream) | 11,264 | 197 | 9 |
| [uuid-stream](https://www.npmjs.com/package/uuid-stream) | 10,667 | 149 | 42 |
| [schema-sdk](https://www.npmjs.com/package/schema-sdk) | 8,041 | 324 | 42 |
| [@yamlize/cli](https://www.npmjs.com/package/@yamlize/cli) | 4,145 | 288 | 37 |
| [jsonldjs](https://www.npmjs.com/package/jsonldjs) | 3,446 | 368 | 42 |
| [@schema-typescript/cli](https://www.npmjs.com/package/@schema-typescript/cli) | 3,284 | 186 | 119 |
| [@constructive-io/pnpm-policy-graphile](https://www.npmjs.com/package/@constructive-io/pnpm-policy-graphile) | 3,023 | 1,154 | 286 |
| [backoff-script](https://www.npmjs.com/package/backoff-script) | 2,473 | 18 | 1 |
| [niftymagick](https://www.npmjs.com/package/niftymagick) | 2,339 | 24 | 2 |
| [json-stringify-simple](https://www.npmjs.com/package/json-stringify-simple) | 1,929 | 15 | 1 |
| [airpage-cli](https://www.npmjs.com/package/airpage-cli) | 1,576 | 21 | 1 |
| [airpage](https://www.npmjs.com/package/airpage) | 1,482 | 18 | 2 |
| [babel-slim](https://www.npmjs.com/package/babel-slim) | 1,048 | 15 | 4 |
| *15 packages hidden (< 1,000 downloads)* | | | |

### cloud

| Name | Total | Monthly | Weekly |
| ------- | ------ | ------- | ----- |
| _Total_ | 1,574,530 | 294,069 | 71,086 |
| [graphile-pg-aggregates](https://www.npmjs.com/package/graphile-pg-aggregates) | 288,920 | 55,175 | 13,708 |
| [graphile-bulk-mutations](https://www.npmjs.com/package/graphile-bulk-mutations) | 284,767 | 55,162 | 13,696 |
| [@constructive-io/express-context](https://www.npmjs.com/package/@constructive-io/express-context) | 265,160 | 49,041 | 8,878 |
| [graphile-realtime-subscriptions](https://www.npmjs.com/package/graphile-realtime-subscriptions) | 255,101 | 50,068 | 12,075 |
| [@constructive-io/llm-env](https://www.npmjs.com/package/@constructive-io/llm-env) | 249,565 | 50,348 | 12,529 |
| [graphile-realtime-test](https://www.npmjs.com/package/graphile-realtime-test) | 43,479 | 5,076 | 1,643 |
| [@constructive-io/graphql-realtime-test](https://www.npmjs.com/package/@constructive-io/graphql-realtime-test) | 31,639 | 6,777 | 2,778 |
| [blocks-schema](https://www.npmjs.com/package/blocks-schema) | 13,074 | 3,707 | 972 |
| [json-renderer](https://www.npmjs.com/package/json-renderer) | 12,890 | 3,691 | 973 |
| [blocks-renderer](https://www.npmjs.com/package/blocks-renderer) | 12,819 | 3,588 | 904 |
| [@constructive-io/noble-hashes](https://www.npmjs.com/package/@constructive-io/noble-hashes) | 10,398 | 177 | 51 |
| [@constructive-io/send-verification-link-fn](https://www.npmjs.com/package/@constructive-io/send-verification-link-fn) | 9,150 | 115 | 16 |
| [@constructive-io/send-email-fn](https://www.npmjs.com/package/@constructive-io/send-email-fn) | 9,043 | 107 | 14 |
| [@pgpm/object-store](https://www.npmjs.com/package/@pgpm/object-store) | 7,627 | 1,527 | 43 |
| [@interweb-utils/casing](https://www.npmjs.com/package/@interweb-utils/casing) | 6,743 | 102 | 27 |
| [@pgpm/inflection-db](https://www.npmjs.com/package/@pgpm/inflection-db) | 6,148 | 2,065 | 623 |
| [@interweb/casing](https://www.npmjs.com/package/@interweb/casing) | 6,010 | 123 | 16 |
| [@fbp/types](https://www.npmjs.com/package/@fbp/types) | 5,756 | 192 | 54 |
| [@pgpm/object-tree](https://www.npmjs.com/package/@pgpm/object-tree) | 5,633 | 789 | 52 |
| [@pgpm/partman](https://www.npmjs.com/package/@pgpm/partman) | 4,859 | 347 | 19 |
| [@fbp/spec](https://www.npmjs.com/package/@fbp/spec) | 4,207 | 67 | 11 |
| [@interweb/fetch-api-client](https://www.npmjs.com/package/@interweb/fetch-api-client) | 4,036 | 217 | 16 |
| [@constructive-io/sheets](https://www.npmjs.com/package/@constructive-io/sheets) | 3,687 | 1,206 | 413 |
| [@interweb/http-errors](https://www.npmjs.com/package/@interweb/http-errors) | 3,650 | 230 | 10 |
| [@interweb/node-api-client](https://www.npmjs.com/package/@interweb/node-api-client) | 3,165 | 242 | 14 |
| [@interweb/find-pkg](https://www.npmjs.com/package/@interweb/find-pkg) | 1,812 | 97 | 60 |
| [json-schema-to-blocks](https://www.npmjs.com/package/json-schema-to-blocks) | 1,476 | 661 | 309 |
| [meta-to-blocks](https://www.npmjs.com/package/meta-to-blocks) | 1,397 | 585 | 273 |
| [flow-to-blocks](https://www.npmjs.com/package/flow-to-blocks) | 1,346 | 570 | 273 |
| [@fbp/evaluator](https://www.npmjs.com/package/@fbp/evaluator) | 1,226 | 145 | 40 |
| [@fbp/graph-editor](https://www.npmjs.com/package/@fbp/graph-editor) | 1,045 | 36 | 1 |
| *40 packages hidden (< 1,000 downloads)* | | | |

### kubernetesjs

| Name | Total | Monthly | Weekly |
| ------- | ------ | ------- | ----- |
| _Total_ | 99,105 | 14,517 | 3,408 |
| [@kubernetesjs/ops](https://www.npmjs.com/package/@kubernetesjs/ops) | 36,945 | 4,029 | 887 |
| [kubernetesjs](https://www.npmjs.com/package/kubernetesjs) | 32,421 | 5,718 | 1,429 |
| [@kubernetesjs/manifests](https://www.npmjs.com/package/@kubernetesjs/manifests) | 20,172 | 4,045 | 884 |
| [@kubernetesjs/client](https://www.npmjs.com/package/@kubernetesjs/client) | 2,681 | 207 | 29 |
| [@kubernetesjs/cli](https://www.npmjs.com/package/@kubernetesjs/cli) | 2,433 | 181 | 109 |
| [@kubernetesjs/ops-cli](https://www.npmjs.com/package/@kubernetesjs/ops-cli) | 2,428 | 209 | 17 |
| [@kubernetesjs/react](https://www.npmjs.com/package/@kubernetesjs/react) | 2,025 | 128 | 53 |

### pgpm

| Name | Total | Monthly | Weekly |
| ------- | ------ | ------- | ----- |
| _Total_ | 36,681,000 | 8,522,795 | 2,162,100 |
| [@pgsql/quotes](https://www.npmjs.com/package/@pgsql/quotes) | 10,833,765 | 3,293,492 | 859,208 |
| [plpgsql-deparser](https://www.npmjs.com/package/plpgsql-deparser) | 6,240,406 | 1,742,565 | 447,017 |
| [plpgsql-parser](https://www.npmjs.com/package/plpgsql-parser) | 6,216,125 | 1,734,099 | 444,563 |
| [@pgpmjs/types](https://www.npmjs.com/package/@pgpmjs/types) | 637,722 | 81,261 | 18,578 |
| [@pgpmjs/env](https://www.npmjs.com/package/@pgpmjs/env) | 563,368 | 64,593 | 14,796 |
| [@pgpmjs/server-utils](https://www.npmjs.com/package/@pgpmjs/server-utils) | 535,812 | 62,220 | 13,427 |
| [@pgpmjs/core](https://www.npmjs.com/package/@pgpmjs/core) | 528,735 | 50,373 | 11,867 |
| [@pgpmjs/logger](https://www.npmjs.com/package/@pgpmjs/logger) | 524,243 | 63,072 | 14,754 |
| [find-and-require-package-json](https://www.npmjs.com/package/find-and-require-package-json) | 459,241 | 44,678 | 10,382 |
| [@constructive-io/graphql-types](https://www.npmjs.com/package/@constructive-io/graphql-types) | 355,230 | 52,559 | 12,104 |
| [graphile-search](https://www.npmjs.com/package/graphile-search) | 329,722 | 55,483 | 13,725 |
| [@inquirerer/utils](https://www.npmjs.com/package/@inquirerer/utils) | 327,722 | 30,378 | 6,892 |
| [graphile-connection-filter](https://www.npmjs.com/package/graphile-connection-filter) | 322,852 | 56,670 | 13,924 |
| [@constructive-io/graphql-env](https://www.npmjs.com/package/@constructive-io/graphql-env) | 319,581 | 51,942 | 11,950 |
| [@constructive-io/s3-streamer](https://www.npmjs.com/package/@constructive-io/s3-streamer) | 304,601 | 42,215 | 4,652 |
| [graphile-llm](https://www.npmjs.com/package/graphile-llm) | 290,413 | 58,813 | 15,229 |
| [graphile-ltree](https://www.npmjs.com/package/graphile-ltree) | 288,916 | 55,116 | 13,580 |
| [@constructive-io/upload-names](https://www.npmjs.com/package/@constructive-io/upload-names) | 284,434 | 48,651 | 11,369 |
| [graphile-presigned-url-plugin](https://www.npmjs.com/package/graphile-presigned-url-plugin) | 284,119 | 52,698 | 12,822 |
| [@constructive-io/s3-utils](https://www.npmjs.com/package/@constructive-io/s3-utils) | 279,358 | 49,182 | 11,580 |
| [@constructive-io/content-type-stream](https://www.npmjs.com/package/@constructive-io/content-type-stream) | 277,253 | 40,896 | 4,398 |
| [graphile-bucket-provisioner-plugin](https://www.npmjs.com/package/graphile-bucket-provisioner-plugin) | 272,086 | 50,808 | 12,016 |
| [@constructive-io/url-domains](https://www.npmjs.com/package/@constructive-io/url-domains) | 265,668 | 45,210 | 8,219 |
| [@constructive-io/graphql-query](https://www.npmjs.com/package/@constructive-io/graphql-query) | 265,357 | 30,774 | 8,555 |
| [@constructive-io/bucket-provisioner](https://www.npmjs.com/package/@constructive-io/bucket-provisioner) | 264,466 | 49,818 | 11,754 |
| [@pgpmjs/migrate-client](https://www.npmjs.com/package/@pgpmjs/migrate-client) | 250,360 | 23,489 | 6,290 |
| [pgsql-seed](https://www.npmjs.com/package/pgsql-seed) | 224,300 | 39,129 | 9,254 |
| [pgsql-client](https://www.npmjs.com/package/pgsql-client) | 222,610 | 38,864 | 9,190 |
| [@pgpmjs/export](https://www.npmjs.com/package/@pgpmjs/export) | 216,146 | 23,215 | 6,137 |
| [@constructive-io/query-builder](https://www.npmjs.com/package/@constructive-io/query-builder) | 214,951 | 48,077 | 11,053 |
| [pg-seed](https://www.npmjs.com/package/pg-seed) | 194,550 | 34,295 | 7,344 |
| [@constructive-io/graphql-server](https://www.npmjs.com/package/@constructive-io/graphql-server) | 187,099 | 41,807 | 10,489 |
| [pgpm](https://www.npmjs.com/package/pgpm) | 165,503 | 18,305 | 4,980 |
| [@pgpm/verify](https://www.npmjs.com/package/@pgpm/verify) | 163,880 | 7,738 | 1,662 |
| [@pgpm/inflection](https://www.npmjs.com/package/@pgpm/inflection) | 146,120 | 3,965 | 749 |
| [@pgpm/types](https://www.npmjs.com/package/@pgpm/types) | 139,376 | 6,291 | 1,489 |
| [@constructive-io/graphql-codegen](https://www.npmjs.com/package/@constructive-io/graphql-codegen) | 137,155 | 14,265 | 4,442 |
| [@pgpm/database-jobs](https://www.npmjs.com/package/@pgpm/database-jobs) | 133,438 | 4,195 | 670 |
| [@constructive-io/fetch](https://www.npmjs.com/package/@constructive-io/fetch) | 128,577 | 28,258 | 6,887 |
| [@constructive-io/graphql-test](https://www.npmjs.com/package/@constructive-io/graphql-test) | 115,394 | 11,731 | 3,859 |
| [@constructive-io/cli](https://www.npmjs.com/package/@constructive-io/cli) | 110,666 | 9,171 | 3,232 |
| [@pgpm/metaschema-schema](https://www.npmjs.com/package/@pgpm/metaschema-schema) | 107,677 | 3,807 | 649 |
| [@constructive-io/csrf](https://www.npmjs.com/package/@constructive-io/csrf) | 104,180 | 31,207 | 6,657 |
| [graphile-schema](https://www.npmjs.com/package/graphile-schema) | 102,567 | 13,903 | 4,618 |
| [@constructive-io/job-utils](https://www.npmjs.com/package/@constructive-io/job-utils) | 97,025 | 15,960 | 3,487 |
| [@constructive-io/graphql-explorer](https://www.npmjs.com/package/@constructive-io/graphql-explorer) | 96,260 | 8,180 | 3,107 |
| [@constructive-io/job-pg](https://www.npmjs.com/package/@constructive-io/job-pg) | 95,176 | 15,608 | 3,399 |
| [@pgpm/metaschema-modules](https://www.npmjs.com/package/@pgpm/metaschema-modules) | 92,916 | 3,807 | 627 |
| [@inquirerer/test](https://www.npmjs.com/package/@inquirerer/test) | 90,077 | 1,359 | 287 |
| [@pgpm/services](https://www.npmjs.com/package/@pgpm/services) | 81,282 | 582 | 82 |
| [@constructive-io/sdk](https://www.npmjs.com/package/@constructive-io/sdk) | 79,557 | 14,967 | 4,632 |
| [constructive-test](https://www.npmjs.com/package/constructive-test) | 78,932 | 22,285 | 5,423 |
| [simple-smtp-server](https://www.npmjs.com/package/simple-smtp-server) | 62,100 | 4,483 | 1,076 |
| [@pyramation/args](https://www.npmjs.com/package/@pyramation/args) | 58,694 | 220 | 73 |
| [@pyramation/prompt](https://www.npmjs.com/package/@pyramation/prompt) | 58,502 | 249 | 71 |
| [@constructive-io/react](https://www.npmjs.com/package/@constructive-io/react) | 58,105 | 8,266 | 2,936 |
| [graphql-server-test](https://www.npmjs.com/package/graphql-server-test) | 55,134 | 8,671 | 3,124 |
| [@pgpm/jwt-claims](https://www.npmjs.com/package/@pgpm/jwt-claims) | 54,531 | 6,875 | 1,512 |
| [@constructive-io/playwright-test](https://www.npmjs.com/package/@constructive-io/playwright-test) | 53,791 | 7,837 | 2,921 |
| [@constructive-sdk/cli](https://www.npmjs.com/package/@constructive-sdk/cli) | 52,019 | 7,720 | 2,720 |
| [@constructive-io/knative-job-service](https://www.npmjs.com/package/@constructive-io/knative-job-service) | 51,053 | 528 | 251 |
| [@pgpm/stamps](https://www.npmjs.com/package/@pgpm/stamps) | 50,307 | 5,920 | 1,425 |
| [@constructive-io/job-scheduler](https://www.npmjs.com/package/@constructive-io/job-scheduler) | 48,599 | 222 | 71 |
| [node-type-registry](https://www.npmjs.com/package/node-type-registry) | 46,903 | 9,005 | 2,593 |
| [@constructive-io/graphql-react](https://www.npmjs.com/package/@constructive-io/graphql-react) | 46,490 | 282 | 7 |
| [insforge-test](https://www.npmjs.com/package/insforge-test) | 44,309 | 6,241 | 1,797 |
| [@pgpm/uuid](https://www.npmjs.com/package/@pgpm/uuid) | 40,813 | 2,331 | 562 |
| [@pgpm/base32](https://www.npmjs.com/package/@pgpm/base32) | 38,924 | 1,152 | 135 |
| [@constructive-io/knative-job-worker](https://www.npmjs.com/package/@constructive-io/knative-job-worker) | 38,815 | 367 | 167 |
| [@constructive-io/upload-client](https://www.npmjs.com/package/@constructive-io/upload-client) | 36,937 | 3,862 | 968 |
| [@pgpm/utils](https://www.npmjs.com/package/@pgpm/utils) | 35,625 | 813 | 57 |
| [graphile-sql-expression-validator](https://www.npmjs.com/package/graphile-sql-expression-validator) | 35,534 | 1,598 | 357 |
| [@pgpm/totp](https://www.npmjs.com/package/@pgpm/totp) | 34,868 | 871 | 40 |
| [docker-parser](https://www.npmjs.com/package/docker-parser) | 33,842 | 12,653 | 2,625 |
| [bash-ast](https://www.npmjs.com/package/bash-ast) | 33,765 | 12,670 | 2,621 |
| [@pgpm/faker](https://www.npmjs.com/package/@pgpm/faker) | 33,549 | 890 | 30 |
| [@constructive-io/postmaster](https://www.npmjs.com/package/@constructive-io/postmaster) | 32,798 | 308 | 29 |
| [@constructive-io/knative-job-server](https://www.npmjs.com/package/@constructive-io/knative-job-server) | 24,432 | 203 | 72 |
| [@constructive-io/ui](https://www.npmjs.com/package/@constructive-io/ui) | 23,400 | 1,799 | 555 |
| [@constructive-io/knative-job-fn](https://www.npmjs.com/package/@constructive-io/knative-job-fn) | 21,585 | 141 | 37 |
| [@pgpm/defaults](https://www.npmjs.com/package/@pgpm/defaults) | 21,271 | 3,057 | 708 |
| [@pgpm-testing/verify](https://www.npmjs.com/package/@pgpm-testing/verify) | 19,560 | 1,255 | 432 |
| [@pgpm-testing/base32](https://www.npmjs.com/package/@pgpm-testing/base32) | 19,194 | 1,255 | 435 |
| [@pyramation/postgis](https://www.npmjs.com/package/@pyramation/postgis) | 17,628 | 90 | 42 |
| [@constructive-io/send-email-link-fn](https://www.npmjs.com/package/@constructive-io/send-email-link-fn) | 14,511 | 38 | 7 |
| [@constructive-io/node](https://www.npmjs.com/package/@constructive-io/node) | 13,898 | 228 | 62 |
| [@constructive-io/simple-email-fn](https://www.npmjs.com/package/@constructive-io/simple-email-fn) | 13,843 | 60 | 1 |
| [graphile-many-to-many](https://www.npmjs.com/package/graphile-many-to-many) | 11,520 | 138 | 3 |
| [@pgpm/db-meta-schema](https://www.npmjs.com/package/@pgpm/db-meta-schema) | 11,349 | 179 | 4 |
| [@pgpm/db-meta-modules](https://www.npmjs.com/package/@pgpm/db-meta-modules) | 11,185 | 125 | 4 |
| [@pgsql/cli](https://www.npmjs.com/package/@pgsql/cli) | 10,854 | 2,182 | 530 |
| [stream-to-etag](https://www.npmjs.com/package/stream-to-etag) | 10,726 | 96 | 12 |
| [@pgpm/achievements](https://www.npmjs.com/package/@pgpm/achievements) | 9,941 | 1,133 | 15 |
| [@pgpm/geotypes](https://www.npmjs.com/package/@pgpm/geotypes) | 9,617 | 800 | 10 |
| [pgsql-parse](https://www.npmjs.com/package/pgsql-parse) | 9,272 | 2,129 | 383 |
| [@pgpm/encrypted-secrets-table](https://www.npmjs.com/package/@pgpm/encrypted-secrets-table) | 9,244 | 599 | 35 |
| [@pgpm/jobs](https://www.npmjs.com/package/@pgpm/jobs) | 9,163 | 570 | 49 |
| [@constructive-io/job-worker](https://www.npmjs.com/package/@constructive-io/job-worker) | 9,092 | 143 | 62 |
| [@pgpm/encrypted-secrets](https://www.npmjs.com/package/@pgpm/encrypted-secrets) | 8,650 | 478 | 32 |
| [@pgpm/measurements](https://www.npmjs.com/package/@pgpm/measurements) | 8,636 | 594 | 23 |
| [@pyramation/postgraphile](https://www.npmjs.com/package/@pyramation/postgraphile) | 7,535 | 93 | 38 |
| [@constructive-io/client](https://www.npmjs.com/package/@constructive-io/client) | 7,082 | 128 | 19 |
| [@pyramation/url-domains](https://www.npmjs.com/package/@pyramation/url-domains) | 6,842 | 59 | 22 |
| [@constructive-io/orm](https://www.npmjs.com/package/@constructive-io/orm) | 6,723 | 120 | 11 |
| [@constructive-io/oauth](https://www.npmjs.com/package/@constructive-io/oauth) | 6,100 | 359 | 8 |
| [pgsql-types](https://www.npmjs.com/package/pgsql-types) | 5,842 | 1,682 | 448 |
| [@pgpm/ltree-helpers](https://www.npmjs.com/package/@pgpm/ltree-helpers) | 5,472 | 786 | 21 |
| [@pgpm-testing/totp](https://www.npmjs.com/package/@pgpm-testing/totp) | 5,369 | 737 | 342 |
| [plpgsql-parse](https://www.npmjs.com/package/plpgsql-parse) | 5,176 | 1,443 | 231 |
| [@pyramation/upload-names](https://www.npmjs.com/package/@pyramation/upload-names) | 4,857 | 65 | 26 |
| [@pgpm/default-roles](https://www.npmjs.com/package/@pgpm/default-roles) | 4,812 | 136 | 30 |
| [@pyramation/content-type-stream](https://www.npmjs.com/package/@pyramation/content-type-stream) | 4,805 | 70 | 25 |
| [@pgpm-testing/utils](https://www.npmjs.com/package/@pgpm-testing/utils) | 4,624 | 264 | 85 |
| [@pyramation/s3-streamer](https://www.npmjs.com/package/@pyramation/s3-streamer) | 4,508 | 77 | 37 |
| [@pyramation/pg-query-context](https://www.npmjs.com/package/@pyramation/pg-query-context) | 4,308 | 31 | 19 |
| [coolir](https://www.npmjs.com/package/coolir) | 4,178 | 95 | 5 |
| [graphile-misc-plugins](https://www.npmjs.com/package/graphile-misc-plugins) | 3,983 | 33 | 6 |
| [webql-cli](https://www.npmjs.com/package/webql-cli) | 3,736 | 17 | 12 |
| [@pyramation/webql](https://www.npmjs.com/package/@pyramation/webql) | 3,425 | 23 | 3 |
| [@pyramation/graphql-ast](https://www.npmjs.com/package/@pyramation/graphql-ast) | 3,320 | 15 | 3 |
| [webql-db](https://www.npmjs.com/package/webql-db) | 3,070 | 37 | 25 |
| [@pyramation/stream-to-s3](https://www.npmjs.com/package/@pyramation/stream-to-s3) | 2,936 | 25 | 7 |
| [@pgpm/meta-db](https://www.npmjs.com/package/@pgpm/meta-db) | 2,746 | 31 | 1 |
| [@pgpm/meta-db-modules](https://www.npmjs.com/package/@pgpm/meta-db-modules) | 2,728 | 31 | 2 |
| [rego-deparser](https://www.npmjs.com/package/rego-deparser) | 2,574 | 522 | 96 |
| [graphile-pgvector-plugin](https://www.npmjs.com/package/graphile-pgvector-plugin) | 2,129 | 27 | 2 |
| [@constructive-io/command-palette](https://www.npmjs.com/package/@constructive-io/command-palette) | 2,084 | 586 | 262 |
| [standalone-module](https://www.npmjs.com/package/standalone-module) | 1,989 | 22 | 1 |
| [@pyramation/rpc-server](https://www.npmjs.com/package/@pyramation/rpc-server) | 1,930 | 29 | 8 |
| [postgraphile-plugin-pgvector](https://www.npmjs.com/package/postgraphile-plugin-pgvector) | 1,706 | 32 | 1 |
| [@pyramation/postgraphile-upload-field](https://www.npmjs.com/package/@pyramation/postgraphile-upload-field) | 1,657 | 48 | 9 |
| [graphile-pg-textsearch-plugin](https://www.npmjs.com/package/graphile-pg-textsearch-plugin) | 1,639 | 32 | 4 |
| [@launchql/knative-job-worker](https://www.npmjs.com/package/@launchql/knative-job-worker) | 1,571 | 51 | 12 |
| [@launchql/knative-job-service](https://www.npmjs.com/package/@launchql/knative-job-service) | 1,488 | 39 | 12 |
| [@constructive-io/seeder](https://www.npmjs.com/package/@constructive-io/seeder) | 1,385 | 27 | 6 |
| [tpsql](https://www.npmjs.com/package/tpsql) | 1,355 | 9 | 0 |
| [airscript](https://www.npmjs.com/package/airscript) | 1,336 | 16 | 1 |
| [@launchql/knative-job-server](https://www.npmjs.com/package/@launchql/knative-job-server) | 1,277 | 43 | 17 |
| [coolir-commander-utils](https://www.npmjs.com/package/coolir-commander-utils) | 1,214 | 24 | 4 |
| [@pyramation/docker-env](https://www.npmjs.com/package/@pyramation/docker-env) | 1,178 | 17 | 5 |
| [coolir-commander](https://www.npmjs.com/package/coolir-commander) | 1,171 | 22 | 9 |
| [@pyramation/s3-utils](https://www.npmjs.com/package/@pyramation/s3-utils) | 1,160 | 21 | 11 |
| [@pgpm/meta-db-test](https://www.npmjs.com/package/@pgpm/meta-db-test) | 1,141 | 35 | 10 |
| [@constructive-io/fetch-api-client](https://www.npmjs.com/package/@constructive-io/fetch-api-client) | 1,062 | 59 | 10 |
| [@constructive-io/http-errors](https://www.npmjs.com/package/@constructive-io/http-errors) | 1,041 | 39 | 13 |
| *65 packages hidden (< 1,000 downloads)* | | | |


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
| _Total_ | 5,871,339 | 90,641 | 18,165 |
| [@cosmology/protobufjs](https://www.npmjs.com/package/@cosmology/protobufjs) | 1,428,775 | 51,323 | 12,785 |
| [@protobufs/google](https://www.npmjs.com/package/@protobufs/google) | 617,352 | 4,882 | 632 |
| [@protobufs/gogoproto](https://www.npmjs.com/package/@protobufs/gogoproto) | 617,231 | 4,872 | 634 |
| [@protobufs/cosmos](https://www.npmjs.com/package/@protobufs/cosmos) | 600,133 | 4,953 | 687 |
| [@protobufs/cosmos_proto](https://www.npmjs.com/package/@protobufs/cosmos_proto) | 598,426 | 4,756 | 573 |
| [@protobufs/tendermint](https://www.npmjs.com/package/@protobufs/tendermint) | 593,315 | 4,787 | 574 |
| [@pyramation/protobufjs](https://www.npmjs.com/package/@pyramation/protobufjs) | 433,383 | 3,186 | 472 |
| [@protobufs/confio](https://www.npmjs.com/package/@protobufs/confio) | 236,572 | 2,647 | 333 |
| [@protobufs/ibc](https://www.npmjs.com/package/@protobufs/ibc) | 233,325 | 2,729 | 414 |
| [@protobufs/amino](https://www.npmjs.com/package/@protobufs/amino) | 227,854 | 2,202 | 252 |
| [@protobufs/cosmwasm](https://www.npmjs.com/package/@protobufs/cosmwasm) | 217,283 | 2,645 | 345 |
| [@protobufs/osmosis](https://www.npmjs.com/package/@protobufs/osmosis) | 30,693 | 789 | 185 |
| [@protobufs/juno](https://www.npmjs.com/package/@protobufs/juno) | 4,115 | 107 | 51 |
| [@protobufs/injective](https://www.npmjs.com/package/@protobufs/injective) | 3,758 | 21 | 9 |
| [@protobufs/akash](https://www.npmjs.com/package/@protobufs/akash) | 2,585 | 95 | 39 |
| [@protobufs/stargaze](https://www.npmjs.com/package/@protobufs/stargaze) | 2,253 | 57 | 14 |
| [@protobufs/regen](https://www.npmjs.com/package/@protobufs/regen) | 2,133 | 50 | 14 |
| [@protobufs/secret](https://www.npmjs.com/package/@protobufs/secret) | 2,075 | 66 | 23 |
| [@protobufs/bcna](https://www.npmjs.com/package/@protobufs/bcna) | 1,838 | 30 | 5 |
| [@protobufs/pylons](https://www.npmjs.com/package/@protobufs/pylons) | 1,772 | 43 | 9 |
| [@protobufs/comdex](https://www.npmjs.com/package/@protobufs/comdex) | 1,441 | 36 | 7 |
| [@protobufs/evmos](https://www.npmjs.com/package/@protobufs/evmos) | 1,243 | 21 | 3 |
| [@protobufs/axelar](https://www.npmjs.com/package/@protobufs/axelar) | 1,209 | 43 | 12 |
| *27 packages hidden (< 1,000 downloads)* | | | |

### chain-registry

| Name | Total | Monthly | Weekly |
| ------- | ------ | ------- | ----- |
| _Total_ | 16,672,366 | 534,735 | 131,056 |
| [@chain-registry/types](https://www.npmjs.com/package/@chain-registry/types) | 5,352,067 | 182,463 | 39,803 |
| [chain-registry](https://www.npmjs.com/package/chain-registry) | 2,634,463 | 50,708 | 12,785 |
| [@chain-registry/keplr](https://www.npmjs.com/package/@chain-registry/keplr) | 2,047,898 | 70,350 | 18,203 |
| [@chain-registry/utils](https://www.npmjs.com/package/@chain-registry/utils) | 1,796,455 | 67,454 | 16,102 |
| [@chain-registry/client](https://www.npmjs.com/package/@chain-registry/client) | 1,527,321 | 65,038 | 15,853 |
| [@chain-registry/cosmostation](https://www.npmjs.com/package/@chain-registry/cosmostation) | 1,410,085 | 22,034 | 7,255 |
| [@chain-registry/v2](https://www.npmjs.com/package/@chain-registry/v2) | 418,488 | 23,233 | 5,150 |
| [@chain-registry/v2-types](https://www.npmjs.com/package/@chain-registry/v2-types) | 388,571 | 22,155 | 5,087 |
| [@chain-registry/assets](https://www.npmjs.com/package/@chain-registry/assets) | 252,341 | 11,076 | 3,822 |
| [@chain-registry/osmosis](https://www.npmjs.com/package/@chain-registry/osmosis) | 211,119 | 7,065 | 2,043 |
| [@chain-registry/juno](https://www.npmjs.com/package/@chain-registry/juno) | 153,449 | 3,039 | 1,007 |
| [@chain-registry/interfaces](https://www.npmjs.com/package/@chain-registry/interfaces) | 102,782 | 2,571 | 821 |
| [@chain-registry/workflows](https://www.npmjs.com/package/@chain-registry/workflows) | 91,800 | 2,423 | 842 |
| [@chain-registry/cli](https://www.npmjs.com/package/@chain-registry/cli) | 89,281 | 2,297 | 822 |
| [@chain-registry/v2-keplr](https://www.npmjs.com/package/@chain-registry/v2-keplr) | 60,409 | 595 | 274 |
| [@chain-registry/v2-utils](https://www.npmjs.com/package/@chain-registry/v2-utils) | 49,779 | 734 | 414 |
| [@chain-registry/v2-client](https://www.npmjs.com/package/@chain-registry/v2-client) | 46,157 | 773 | 414 |
| [@chain-registry/v2-cosmostation](https://www.npmjs.com/package/@chain-registry/v2-cosmostation) | 39,901 | 727 | 359 |

### cosmos-kit

| Name | Total | Monthly | Weekly |
| ------- | ------ | ------- | ----- |
| _Total_ | 3,567,559 | 139,822 | 35,994 |
| [@cosmos-kit/core](https://www.npmjs.com/package/@cosmos-kit/core) | 1,378,867 | 52,199 | 13,106 |
| [@cosmos-kit/walletconnect](https://www.npmjs.com/package/@cosmos-kit/walletconnect) | 942,977 | 36,508 | 10,230 |
| [@cosmos-kit/react-lite](https://www.npmjs.com/package/@cosmos-kit/react-lite) | 574,197 | 24,144 | 5,450 |
| [@cosmos-kit/react](https://www.npmjs.com/package/@cosmos-kit/react) | 554,494 | 23,181 | 5,527 |
| [cosmos-kit](https://www.npmjs.com/package/cosmos-kit) | 117,024 | 3,790 | 1,681 |

### cosmos-kit-wallets

| Name | Total | Monthly | Weekly |
| ------- | ------ | ------- | ----- |
| _Total_ | 16,635,235 | 441,699 | 135,102 |
| [@cosmos-kit/keplr-extension](https://www.npmjs.com/package/@cosmos-kit/keplr-extension) | 916,749 | 37,259 | 10,463 |
| [@cosmos-kit/keplr](https://www.npmjs.com/package/@cosmos-kit/keplr) | 870,530 | 17,040 | 4,027 |
| [@cosmos-kit/keplr-mobile](https://www.npmjs.com/package/@cosmos-kit/keplr-mobile) | 868,514 | 36,190 | 10,419 |
| [@cosmos-kit/leap-extension](https://www.npmjs.com/package/@cosmos-kit/leap-extension) | 802,181 | 9,035 | 2,539 |
| [@cosmos-kit/leap](https://www.npmjs.com/package/@cosmos-kit/leap) | 768,341 | 7,861 | 2,470 |
| [@cosmos-kit/cosmostation-extension](https://www.npmjs.com/package/@cosmos-kit/cosmostation-extension) | 740,049 | 13,809 | 4,265 |
| [@cosmos-kit/leap-mobile](https://www.npmjs.com/package/@cosmos-kit/leap-mobile) | 723,060 | 7,752 | 2,306 |
| [@cosmos-kit/leap-metamask-cosmos-snap](https://www.npmjs.com/package/@cosmos-kit/leap-metamask-cosmos-snap) | 679,941 | 9,185 | 2,954 |
| [@cosmos-kit/cosmostation](https://www.npmjs.com/package/@cosmos-kit/cosmostation) | 669,984 | 7,022 | 2,425 |
| [@cosmos-kit/cosmostation-mobile](https://www.npmjs.com/package/@cosmos-kit/cosmostation-mobile) | 652,524 | 6,883 | 2,355 |
| [@cosmos-kit/okxwallet-extension](https://www.npmjs.com/package/@cosmos-kit/okxwallet-extension) | 569,556 | 25,672 | 7,402 |
| [@cosmos-kit/xdefi-extension](https://www.npmjs.com/package/@cosmos-kit/xdefi-extension) | 554,279 | 22,473 | 5,867 |
| [@cosmos-kit/trust](https://www.npmjs.com/package/@cosmos-kit/trust) | 530,798 | 9,918 | 2,273 |
| [@cosmos-kit/trust-extension](https://www.npmjs.com/package/@cosmos-kit/trust-extension) | 530,378 | 25,284 | 7,631 |
| [@cosmos-kit/station-extension](https://www.npmjs.com/package/@cosmos-kit/station-extension) | 529,924 | 22,888 | 5,927 |
| [@cosmos-kit/trust-mobile](https://www.npmjs.com/package/@cosmos-kit/trust-mobile) | 529,707 | 9,729 | 2,132 |
| [@cosmos-kit/station](https://www.npmjs.com/package/@cosmos-kit/station) | 514,541 | 6,963 | 588 |
| [@cosmos-kit/xdefi](https://www.npmjs.com/package/@cosmos-kit/xdefi) | 510,096 | 6,264 | 500 |
| [@cosmos-kit/cdcwallet-extension](https://www.npmjs.com/package/@cosmos-kit/cdcwallet-extension) | 464,391 | 24,577 | 7,298 |
| [@cosmos-kit/okxwallet](https://www.npmjs.com/package/@cosmos-kit/okxwallet) | 459,765 | 6,158 | 394 |
| [@cosmos-kit/cdcwallet](https://www.npmjs.com/package/@cosmos-kit/cdcwallet) | 450,614 | 8,557 | 1,963 |
| [@cosmos-kit/omni-mobile](https://www.npmjs.com/package/@cosmos-kit/omni-mobile) | 150,359 | 4,907 | 1,891 |
| [@cosmos-kit/omni](https://www.npmjs.com/package/@cosmos-kit/omni) | 146,241 | 4,899 | 1,902 |
| [@cosmos-kit/compass-extension](https://www.npmjs.com/package/@cosmos-kit/compass-extension) | 144,129 | 4,795 | 1,859 |
| [@cosmos-kit/ledger](https://www.npmjs.com/package/@cosmos-kit/ledger) | 141,382 | 4,907 | 1,937 |
| [@cosmos-kit/compass](https://www.npmjs.com/package/@cosmos-kit/compass) | 136,497 | 4,878 | 1,959 |
| [@cosmos-kit/fin-extension](https://www.npmjs.com/package/@cosmos-kit/fin-extension) | 131,571 | 4,424 | 1,817 |
| [@cosmos-kit/coin98](https://www.npmjs.com/package/@cosmos-kit/coin98) | 131,560 | 4,897 | 1,866 |
| [@cosmos-kit/coin98-extension](https://www.npmjs.com/package/@cosmos-kit/coin98-extension) | 130,553 | 4,853 | 1,850 |
| [@cosmos-kit/fin](https://www.npmjs.com/package/@cosmos-kit/fin) | 126,309 | 4,394 | 1,801 |
| [@cosmos-kit/exodus-extension](https://www.npmjs.com/package/@cosmos-kit/exodus-extension) | 125,246 | 4,710 | 1,890 |
| [@cosmos-kit/shell-extension](https://www.npmjs.com/package/@cosmos-kit/shell-extension) | 124,369 | 4,762 | 1,831 |
| [@cosmos-kit/exodus](https://www.npmjs.com/package/@cosmos-kit/exodus) | 122,985 | 4,739 | 1,910 |
| [@cosmos-kit/shell](https://www.npmjs.com/package/@cosmos-kit/shell) | 122,126 | 4,635 | 1,799 |
| [@cosmos-kit/vectis](https://www.npmjs.com/package/@cosmos-kit/vectis) | 114,416 | 1,719 | 377 |
| [@cosmos-kit/vectis-extension](https://www.npmjs.com/package/@cosmos-kit/vectis-extension) | 111,359 | 1,739 | 358 |
| [@cosmos-kit/owallet](https://www.npmjs.com/package/@cosmos-kit/owallet) | 101,024 | 4,052 | 1,765 |
| [@cosmos-kit/owallet-extension](https://www.npmjs.com/package/@cosmos-kit/owallet-extension) | 100,949 | 4,027 | 1,753 |
| [@cosmos-kit/tailwind-extension](https://www.npmjs.com/package/@cosmos-kit/tailwind-extension) | 96,309 | 3,927 | 1,754 |
| [@cosmos-kit/tailwind](https://www.npmjs.com/package/@cosmos-kit/tailwind) | 96,104 | 3,972 | 1,770 |
| [@cosmos-kit/frontier-extension](https://www.npmjs.com/package/@cosmos-kit/frontier-extension) | 92,771 | 1,548 | 364 |
| [@cosmos-kit/frontier](https://www.npmjs.com/package/@cosmos-kit/frontier) | 91,149 | 1,509 | 335 |
| [@cosmos-kit/cosmos-extension-metamask](https://www.npmjs.com/package/@cosmos-kit/cosmos-extension-metamask) | 85,642 | 2,200 | 310 |
| [@cosmos-kit/galaxy-station-extension](https://www.npmjs.com/package/@cosmos-kit/galaxy-station-extension) | 72,811 | 3,768 | 1,696 |
| [@cosmos-kit/galaxy-station](https://www.npmjs.com/package/@cosmos-kit/galaxy-station) | 72,720 | 3,780 | 1,701 |
| [@cosmos-kit/owallet-mobile](https://www.npmjs.com/package/@cosmos-kit/owallet-mobile) | 62,421 | 3,719 | 1,668 |
| [@cosmos-kit/web3auth](https://www.npmjs.com/package/@cosmos-kit/web3auth) | 52,633 | 4,010 | 1,786 |
| [@cosmos-kit/ctrl-extension](https://www.npmjs.com/package/@cosmos-kit/ctrl-extension) | 49,158 | 3,591 | 1,676 |
| [@cosmos-kit/ctrl](https://www.npmjs.com/package/@cosmos-kit/ctrl) | 48,851 | 3,586 | 1,673 |
| [@cosmos-kit/okto-extension](https://www.npmjs.com/package/@cosmos-kit/okto-extension) | 43,229 | 77 | 46 |
| [@cosmos-kit/galaxy-station-mobile](https://www.npmjs.com/package/@cosmos-kit/galaxy-station-mobile) | 42,057 | 3,396 | 1,589 |
| [@cosmos-kit/bitgetwallet-extension](https://www.npmjs.com/package/@cosmos-kit/bitgetwallet-extension) | 17,997 | 2,867 | 1,575 |
| [@cosmos-kit/imtoken-extension](https://www.npmjs.com/package/@cosmos-kit/imtoken-extension) | 17,817 | 102 | 54 |
| [@cosmos-kit/imtoken](https://www.npmjs.com/package/@cosmos-kit/imtoken) | 17,577 | 99 | 55 |
| [@cosmos-kit/ninji-extension](https://www.npmjs.com/package/@cosmos-kit/ninji-extension) | 17,506 | 273 | 98 |
| [@cosmos-kit/ninji](https://www.npmjs.com/package/@cosmos-kit/ninji) | 16,286 | 390 | 122 |
| [@cosmos-kit/ins](https://www.npmjs.com/package/@cosmos-kit/ins) | 14,446 | 156 | 103 |
| [@cosmos-kit/leap-capsule-social-login](https://www.npmjs.com/package/@cosmos-kit/leap-capsule-social-login) | 13,767 | 121 | 69 |
| [@cosmos-kit/initia-extension](https://www.npmjs.com/package/@cosmos-kit/initia-extension) | 9,645 | 196 | 95 |
| [@cosmos-kit/initia](https://www.npmjs.com/package/@cosmos-kit/initia) | 8,963 | 159 | 84 |
| [@cosmos-kit/walletconnect-v1](https://www.npmjs.com/package/@cosmos-kit/walletconnect-v1) | 7,853 | 178 | 45 |
| [@cosmos-wallet/react](https://www.npmjs.com/package/@cosmos-wallet/react) | 7,294 | 181 | 80 |
| [@cosmos-kit/gatewallet-extension](https://www.npmjs.com/package/@cosmos-kit/gatewallet-extension) | 7,069 | 989 | 672 |
| [@cosmos-wallet/core](https://www.npmjs.com/package/@cosmos-wallet/core) | 6,730 | 330 | 116 |
| [@cosmos-kit/types](https://www.npmjs.com/package/@cosmos-kit/types) | 4,968 | 51 | 8 |
| [@cosmos-wallet/keplr](https://www.npmjs.com/package/@cosmos-wallet/keplr) | 4,655 | 119 | 25 |
| [@cosmos-wallet/registry](https://www.npmjs.com/package/@cosmos-wallet/registry) | 4,599 | 134 | 26 |
| [@cosmos-wallet/types](https://www.npmjs.com/package/@cosmos-wallet/types) | 4,541 | 62 | 16 |
| [@cosmos-kit/registry](https://www.npmjs.com/package/@cosmos-kit/registry) | 4,266 | 121 | 33 |
| [@cosmos-kit/config](https://www.npmjs.com/package/@cosmos-kit/config) | 3,991 | 55 | 15 |
| [@cosmos-kit/arculus-mobile](https://www.npmjs.com/package/@cosmos-kit/arculus-mobile) | 3,473 | 271 | 49 |
| [@cosmos-kit/walletconnect-v2](https://www.npmjs.com/package/@cosmos-kit/walletconnect-v2) | 3,359 | 112 | 37 |
| [@cosmos-kit/arculus](https://www.npmjs.com/package/@cosmos-kit/arculus) | 3,353 | 246 | 45 |
| [@cosmos-kit/aria-extension](https://www.npmjs.com/package/@cosmos-kit/aria-extension) | 2,953 | 100 | 53 |
| [@cosmos-kit/prax-extension](https://www.npmjs.com/package/@cosmos-kit/prax-extension) | 2,872 | 98 | 61 |
| [@cosmos-kit/wallets](https://www.npmjs.com/package/@cosmos-kit/wallets) | 2,715 | 55 | 11 |
| [@cosmos-kit/gatewallet](https://www.npmjs.com/package/@cosmos-kit/gatewallet) | 2,627 | 77 | 44 |
| [@cosmos-kit/terrastation-extension](https://www.npmjs.com/package/@cosmos-kit/terrastation-extension) | 2,454 | 51 | 20 |
| [@cosmos-kit/terrastation](https://www.npmjs.com/package/@cosmos-kit/terrastation) | 2,428 | 65 | 23 |
| [@cosmos-kit/aria-mobile](https://www.npmjs.com/package/@cosmos-kit/aria-mobile) | 2,051 | 69 | 32 |
| [@cosmos-kit/aria](https://www.npmjs.com/package/@cosmos-kit/aria) | 1,997 | 102 | 41 |
| [@cosmos-kit/bitgetwallet](https://www.npmjs.com/package/@cosmos-kit/bitgetwallet) | 1,790 | 77 | 32 |
| [@cosmos-kit/vultisig-extension](https://www.npmjs.com/package/@cosmos-kit/vultisig-extension) | 1,583 | 273 | 54 |
| [@cosmos-kit/foxwallet-extension](https://www.npmjs.com/package/@cosmos-kit/foxwallet-extension) | 1,578 | 151 | 37 |
| [@cosmos-kit/figure-markets-mobile](https://www.npmjs.com/package/@cosmos-kit/figure-markets-mobile) | 1,575 | 54 | 31 |
| [@cosmos-kit/figure-markets](https://www.npmjs.com/package/@cosmos-kit/figure-markets) | 1,481 | 58 | 29 |
| [@cosmos-kit/foxwallet](https://www.npmjs.com/package/@cosmos-kit/foxwallet) | 1,480 | 67 | 22 |
| [@cosmos-kit/vultisig](https://www.npmjs.com/package/@cosmos-kit/vultisig) | 1,390 | 207 | 44 |
| *2 packages hidden (< 1,000 downloads)* | | | |

### telescope

| Name | Total | Monthly | Weekly |
| ------- | ------ | ------- | ----- |
| _Total_ | 15,423,189 | 624,784 | 136,154 |
| [@osmonauts/lcd](https://www.npmjs.com/package/@osmonauts/lcd) | 5,654,019 | 368,278 | 73,359 |
| [@cosmology/types](https://www.npmjs.com/package/@cosmology/types) | 1,267,313 | 49,794 | 12,576 |
| [@cosmology/utils](https://www.npmjs.com/package/@cosmology/utils) | 1,266,949 | 49,700 | 12,589 |
| [@cosmology/proto-parser](https://www.npmjs.com/package/@cosmology/proto-parser) | 1,234,913 | 49,710 | 12,592 |
| [@cosmology/lcd](https://www.npmjs.com/package/@cosmology/lcd) | 1,053,506 | 14,939 | 4,031 |
| [@cosmology/ast](https://www.npmjs.com/package/@cosmology/ast) | 954,011 | 29,916 | 7,306 |
| [@cosmology/telescope](https://www.npmjs.com/package/@cosmology/telescope) | 811,617 | 25,662 | 6,226 |
| [@osmonauts/helpers](https://www.npmjs.com/package/@osmonauts/helpers) | 811,278 | 18,643 | 5,117 |
| [@osmonauts/telescope](https://www.npmjs.com/package/@osmonauts/telescope) | 495,982 | 3,473 | 434 |
| [@osmonauts/ast](https://www.npmjs.com/package/@osmonauts/ast) | 478,664 | 3,865 | 537 |
| [@osmonauts/proto-parser](https://www.npmjs.com/package/@osmonauts/proto-parser) | 474,867 | 3,467 | 447 |
| [@osmonauts/types](https://www.npmjs.com/package/@osmonauts/types) | 471,078 | 3,558 | 449 |
| [@osmonauts/utils](https://www.npmjs.com/package/@osmonauts/utils) | 448,992 | 3,779 | 491 |

### cosmwasm

| Name | Total | Monthly | Weekly |
| ------- | ------ | ------- | ----- |
| _Total_ | 3,771,889 | 82,726 | 18,236 |
| [@cosmwasm/ts-codegen](https://www.npmjs.com/package/@cosmwasm/ts-codegen) | 1,792,835 | 37,814 | 8,334 |
| [wasm-ast-types](https://www.npmjs.com/package/wasm-ast-types) | 1,649,054 | 31,258 | 6,835 |
| [@cosmwasm/ts-codegen-types](https://www.npmjs.com/package/@cosmwasm/ts-codegen-types) | 148,604 | 6,376 | 1,427 |
| [@cosmwasm/ts-codegen-ast](https://www.npmjs.com/package/@cosmwasm/ts-codegen-ast) | 145,118 | 6,595 | 1,442 |
| [cosmwasm-typescript-gen](https://www.npmjs.com/package/cosmwasm-typescript-gen) | 23,384 | 224 | 54 |
| [@cosmjson/wasmswap](https://www.npmjs.com/package/@cosmjson/wasmswap) | 2,999 | 87 | 13 |
| [@cosmjson/stargaze-minter](https://www.npmjs.com/package/@cosmjson/stargaze-minter) | 1,283 | 40 | 12 |
| [@cosmjson/stargaze-sg721](https://www.npmjs.com/package/@cosmjson/stargaze-sg721) | 1,254 | 39 | 10 |
| *13 packages hidden (< 1,000 downloads)* | | | |

### interchain-js

| Name | Total | Monthly | Weekly |
| ------- | ------ | ------- | ----- |
| _Total_ | 3,604,036 | 244,405 | 55,225 |
| [@interchainjs/auth](https://www.npmjs.com/package/@interchainjs/auth) | 375,844 | 22,554 | 5,058 |
| [@interchainjs/utils](https://www.npmjs.com/package/@interchainjs/utils) | 352,152 | 22,268 | 5,065 |
| [@interchainjs/types](https://www.npmjs.com/package/@interchainjs/types) | 349,599 | 21,598 | 4,828 |
| [@interchainjs/math](https://www.npmjs.com/package/@interchainjs/math) | 317,435 | 21,507 | 4,776 |
| [@interchainjs/crypto](https://www.npmjs.com/package/@interchainjs/crypto) | 313,490 | 21,663 | 4,752 |
| [@interchainjs/encoding](https://www.npmjs.com/package/@interchainjs/encoding) | 311,503 | 21,406 | 4,769 |
| [@interchainjs/cosmos-types](https://www.npmjs.com/package/@interchainjs/cosmos-types) | 308,511 | 22,169 | 5,004 |
| [@interchainjs/cosmos](https://www.npmjs.com/package/@interchainjs/cosmos) | 306,562 | 22,584 | 5,111 |
| [@interchainjs/amino](https://www.npmjs.com/package/@interchainjs/amino) | 274,953 | 21,525 | 4,756 |
| [@interchainjs/pubkey](https://www.npmjs.com/package/@interchainjs/pubkey) | 274,252 | 21,740 | 4,819 |
| [interchainjs](https://www.npmjs.com/package/interchainjs) | 211,206 | 9,368 | 2,541 |
| [@interchainjs/ethereum](https://www.npmjs.com/package/@interchainjs/ethereum) | 79,479 | 8,571 | 2,180 |
| [injectivejs](https://www.npmjs.com/package/injectivejs) | 22,979 | 755 | 145 |
| [@interchainjs/injective](https://www.npmjs.com/package/@interchainjs/injective) | 20,760 | 517 | 94 |
| [@interchainjs/solana](https://www.npmjs.com/package/@interchainjs/solana) | 13,490 | 2,718 | 671 |
| [@interchainjs/react](https://www.npmjs.com/package/@interchainjs/react) | 13,277 | 284 | 112 |
| [injective-react](https://www.npmjs.com/package/injective-react) | 11,805 | 573 | 86 |
| [injective-vue](https://www.npmjs.com/package/injective-vue) | 10,663 | 494 | 53 |
| [@interchainjs/vue](https://www.npmjs.com/package/@interchainjs/vue) | 10,049 | 473 | 65 |
| [interchain-rpc](https://www.npmjs.com/package/interchain-rpc) | 8,066 | 741 | 62 |
| [interchain46](https://www.npmjs.com/package/interchain46) | 2,461 | 185 | 72 |
| [interchain-react](https://www.npmjs.com/package/interchain-react) | 1,677 | 69 | 26 |
| [@interchainjs/ethermint](https://www.npmjs.com/package/@interchainjs/ethermint) | 1,640 | 62 | 17 |
| [interchain-vue](https://www.npmjs.com/package/interchain-vue) | 1,209 | 58 | 20 |
| [interchain-lcd](https://www.npmjs.com/package/interchain-lcd) | 1,030 | 31 | 9 |
| *23 packages hidden (< 1,000 downloads)* | | | |

### hyperwebjs

| Name | Total | Monthly | Weekly |
| ------- | ------ | ------- | ----- |
| _Total_ | 61,885 | 5,014 | 1,200 |
| [@hyperweb/telescope](https://www.npmjs.com/package/@hyperweb/telescope) | 47,169 | 4,198 | 1,060 |
| [hyperwebjs](https://www.npmjs.com/package/hyperwebjs) | 5,253 | 367 | 44 |
| [@hyperweb/build](https://www.npmjs.com/package/@hyperweb/build) | 3,319 | 114 | 22 |
| [@hyperweb/mcp-server](https://www.npmjs.com/package/@hyperweb/mcp-server) | 1,417 | 147 | 27 |
| [create-hyperweb-app](https://www.npmjs.com/package/create-hyperweb-app) | 1,392 | 42 | 11 |
| [@hyperweb/parse](https://www.npmjs.com/package/@hyperweb/parse) | 1,245 | 27 | 9 |
| *5 packages hidden (< 1,000 downloads)* | | | |

### interchain-kit

| Name | Total | Monthly | Weekly |
| ------- | ------ | ------- | ----- |
| _Total_ | 226,567 | 19,372 | 5,843 |
| [@interchain-kit/core](https://www.npmjs.com/package/@interchain-kit/core) | 144,186 | 11,532 | 3,609 |
| [@interchain-kit/react](https://www.npmjs.com/package/@interchain-kit/react) | 50,591 | 2,663 | 689 |
| [interchain-kit](https://www.npmjs.com/package/interchain-kit) | 16,918 | 230 | 19 |
| [@interchain-kit/vue](https://www.npmjs.com/package/@interchain-kit/vue) | 14,872 | 4,947 | 1,526 |

### interchain-kit-wallets

| Name | Total | Monthly | Weekly |
| ------- | ------ | ------- | ----- |
| _Total_ | 531,195 | 22,477 | 7,303 |
| [@interchain-kit/keplr-extension](https://www.npmjs.com/package/@interchain-kit/keplr-extension) | 94,848 | 6,780 | 2,086 |
| [@interchain-kit/leap-extension](https://www.npmjs.com/package/@interchain-kit/leap-extension) | 78,639 | 6,241 | 1,858 |
| [@interchain-kit/okx-extension](https://www.npmjs.com/package/@interchain-kit/okx-extension) | 65,377 | 339 | 167 |
| [@interchain-kit/cosmostation-extension](https://www.npmjs.com/package/@interchain-kit/cosmostation-extension) | 26,485 | 1,768 | 431 |
| [@interchain-kit/store](https://www.npmjs.com/package/@interchain-kit/store) | 21,847 | 2,492 | 580 |
| [@interchain-kit/keplr-mobile](https://www.npmjs.com/package/@interchain-kit/keplr-mobile) | 19,018 | 322 | 157 |
| [@interchain-kit/cosmos-extension-metamask](https://www.npmjs.com/package/@interchain-kit/cosmos-extension-metamask) | 17,746 | 294 | 129 |
| [@interchain-kit/leap-mobile](https://www.npmjs.com/package/@interchain-kit/leap-mobile) | 17,735 | 252 | 142 |
| [@interchain-kit/coin98-extension](https://www.npmjs.com/package/@interchain-kit/coin98-extension) | 17,630 | 445 | 158 |
| [@interchain-kit/ledger](https://www.npmjs.com/package/@interchain-kit/ledger) | 16,484 | 303 | 161 |
| [@interchain-kit/mock-wallet](https://www.npmjs.com/package/@interchain-kit/mock-wallet) | 14,964 | 220 | 130 |
| [@interchain-kit/frontier-extension](https://www.npmjs.com/package/@interchain-kit/frontier-extension) | 14,761 | 255 | 138 |
| [@interchain-kit/leap-cosmos-extension-metamask](https://www.npmjs.com/package/@interchain-kit/leap-cosmos-extension-metamask) | 14,598 | 360 | 132 |
| [@interchain-kit/station-extension](https://www.npmjs.com/package/@interchain-kit/station-extension) | 14,538 | 247 | 131 |
| [@interchain-kit/galaxy-station-extension](https://www.npmjs.com/package/@interchain-kit/galaxy-station-extension) | 14,215 | 257 | 138 |
| [@interchain-kit/trust-extension](https://www.npmjs.com/package/@interchain-kit/trust-extension) | 13,087 | 268 | 121 |
| [@interchain-kit/xdefi-extension](https://www.npmjs.com/package/@interchain-kit/xdefi-extension) | 11,498 | 196 | 82 |
| [@interchain-kit/compass-extension](https://www.npmjs.com/package/@interchain-kit/compass-extension) | 9,484 | 218 | 94 |
| [@interchain-kit/metamask-extension](https://www.npmjs.com/package/@interchain-kit/metamask-extension) | 9,332 | 194 | 87 |
| [@interchain-kit/fin-extension](https://www.npmjs.com/package/@interchain-kit/fin-extension) | 8,337 | 160 | 78 |
| [@interchain-kit/exodus-extension](https://www.npmjs.com/package/@interchain-kit/exodus-extension) | 7,886 | 162 | 78 |
| [@interchain-kit/ninji-extension](https://www.npmjs.com/package/@interchain-kit/ninji-extension) | 6,565 | 179 | 65 |
| [@interchain-kit/shell-extension](https://www.npmjs.com/package/@interchain-kit/shell-extension) | 6,286 | 138 | 60 |
| [@interchain-kit/phantom-extension](https://www.npmjs.com/package/@interchain-kit/phantom-extension) | 3,270 | 147 | 38 |
| [@interchain-kit/backpack-extension](https://www.npmjs.com/package/@interchain-kit/backpack-extension) | 2,366 | 87 | 22 |
| [@interchain-kit/vultisig-extension](https://www.npmjs.com/package/@interchain-kit/vultisig-extension) | 2,114 | 73 | 19 |
| [@interchain-kit/solflare-extension](https://www.npmjs.com/package/@interchain-kit/solflare-extension) | 2,085 | 80 | 21 |

### interchain-ui

| Name | Total | Monthly | Weekly |
| ------- | ------ | ------- | ----- |
| _Total_ | 593,185 | 34,585 | 8,719 |
| [@interchain-ui/react](https://www.npmjs.com/package/@interchain-ui/react) | 559,306 | 29,109 | 7,027 |
| [@interchain-ui/vue](https://www.npmjs.com/package/@interchain-ui/vue) | 19,217 | 4,945 | 1,600 |
| [@interchain-ui/react-no-ssr](https://www.npmjs.com/package/@interchain-ui/react-no-ssr) | 12,426 | 467 | 72 |
| [@interweb-ui/cli](https://www.npmjs.com/package/@interweb-ui/cli) | 1,059 | 35 | 10 |
| *2 packages hidden (< 1,000 downloads)* | | | |

### osmosis

| Name | Total | Monthly | Weekly |
| ------- | ------ | ------- | ----- |
| _Total_ | 943,934 | 16,004 | 3,961 |
| [osmojs](https://www.npmjs.com/package/osmojs) | 802,446 | 13,749 | 3,434 |
| [osmo-query](https://www.npmjs.com/package/osmo-query) | 61,386 | 1,176 | 227 |
| [@osmonauts/math](https://www.npmjs.com/package/@osmonauts/math) | 43,058 | 389 | 44 |
| [@osmosis-labs/math](https://www.npmjs.com/package/@osmosis-labs/math) | 14,576 | 141 | 46 |
| [@osmosis-labs/pools](https://www.npmjs.com/package/@osmosis-labs/pools) | 8,403 | 118 | 36 |
| [@osmosis-labs/stores](https://www.npmjs.com/package/@osmosis-labs/stores) | 4,974 | 129 | 64 |
| [@osmosis-labs/proto-codecs](https://www.npmjs.com/package/@osmosis-labs/proto-codecs) | 4,952 | 39 | 14 |
| [osmojs-rc](https://www.npmjs.com/package/osmojs-rc) | 1,466 | 163 | 57 |
| *6 packages hidden (< 1,000 downloads)* | | | |

### starship

| Name | Total | Monthly | Weekly |
| ------- | ------ | ------- | ----- |
| _Total_ | 160,841 | 9,619 | 1,530 |
| [@starship-ci/client](https://www.npmjs.com/package/@starship-ci/client) | 51,435 | 2,889 | 452 |
| [@starship-ci/cli](https://www.npmjs.com/package/@starship-ci/cli) | 49,431 | 2,852 | 460 |
| [starshipjs](https://www.npmjs.com/package/starshipjs) | 48,603 | 2,677 | 420 |
| [@starship-ci/types](https://www.npmjs.com/package/@starship-ci/types) | 10,190 | 1,131 | 181 |
| [@starship-ci/generator](https://www.npmjs.com/package/@starship-ci/generator) | 1,182 | 70 | 17 |

### cosmology

| Name | Total | Monthly | Weekly |
| ------- | ------ | ------- | ----- |
| _Total_ | 573,290 | 14,902 | 3,824 |
| [interchain](https://www.npmjs.com/package/interchain) | 104,950 | 1,359 | 209 |
| [@cosmology/core](https://www.npmjs.com/package/@cosmology/core) | 60,028 | 2,061 | 560 |
| [cosmjs-utils](https://www.npmjs.com/package/cosmjs-utils) | 54,011 | 962 | 186 |
| [@cosmology/cli](https://www.npmjs.com/package/@cosmology/cli) | 43,869 | 863 | 309 |
| [cosmology](https://www.npmjs.com/package/cosmology) | 40,794 | 1,413 | 175 |
| [@cosmology-ui/react](https://www.npmjs.com/package/@cosmology-ui/react) | 32,525 | 342 | 107 |
| [@cosmology-ui/utils](https://www.npmjs.com/package/@cosmology-ui/utils) | 26,603 | 248 | 64 |
| [interchain-query](https://www.npmjs.com/package/interchain-query) | 23,696 | 594 | 68 |
| [thorchain](https://www.npmjs.com/package/thorchain) | 14,379 | 573 | 104 |
| [@cosmonauts/osmosis](https://www.npmjs.com/package/@cosmonauts/osmosis) | 9,569 | 493 | 212 |
| [@cosmonauts/telescope](https://www.npmjs.com/package/@cosmonauts/telescope) | 9,449 | 205 | 109 |
| [@osmonauts/osmosis](https://www.npmjs.com/package/@osmonauts/osmosis) | 6,989 | 524 | 105 |
| [@osmonauts/babel](https://www.npmjs.com/package/@osmonauts/babel) | 6,425 | 342 | 30 |
| [create-cosmwasm-app](https://www.npmjs.com/package/create-cosmwasm-app) | 6,187 | 67 | 5 |
| [@cosmology/cosmos-registry](https://www.npmjs.com/package/@cosmology/cosmos-registry) | 6,081 | 307 | 58 |
| [@pyramation/crypto-keys](https://www.npmjs.com/package/@pyramation/crypto-keys) | 5,795 | 62 | 18 |
| [@pyramation/crypto-coins](https://www.npmjs.com/package/@pyramation/crypto-coins) | 4,909 | 37 | 19 |
| [@pyramation/crypto-networks](https://www.npmjs.com/package/@pyramation/crypto-networks) | 4,580 | 39 | 18 |
| [stargaze-zone](https://www.npmjs.com/package/stargaze-zone) | 4,375 | 61 | 12 |
| [dydx](https://www.npmjs.com/package/dydx) | 3,510 | 20 | 5 |
| [cosmscript](https://www.npmjs.com/package/cosmscript) | 3,491 | 45 | 3 |
| [@cosmology-ui/chain-dropdown](https://www.npmjs.com/package/@cosmology-ui/chain-dropdown) | 3,251 | 66 | 21 |
| [@cosmology-ui/theme](https://www.npmjs.com/package/@cosmology-ui/theme) | 3,244 | 59 | 17 |
| [@cosmology-ui/connect-modal](https://www.npmjs.com/package/@cosmology-ui/connect-modal) | 3,194 | 62 | 24 |
| [@osmonauts/ast-gen](https://www.npmjs.com/package/@osmonauts/ast-gen) | 3,191 | 102 | 5 |
| [@cosmology-ui/copy-address-button](https://www.npmjs.com/package/@cosmology-ui/copy-address-button) | 3,178 | 67 | 28 |
| [@cosmology-ui/buttons](https://www.npmjs.com/package/@cosmology-ui/buttons) | 3,172 | 57 | 19 |
| [@cosmology-ui/base](https://www.npmjs.com/package/@cosmology-ui/base) | 3,101 | 55 | 19 |
| [@cosmology-ui/animation](https://www.npmjs.com/package/@cosmology-ui/animation) | 3,077 | 59 | 20 |
| [@pyramation/crypto-cli](https://www.npmjs.com/package/@pyramation/crypto-cli) | 2,925 | 53 | 15 |
| [@cosmology-ui/swap](https://www.npmjs.com/package/@cosmology-ui/swap) | 2,820 | 75 | 22 |
| [@cosmonauts/ast-gen](https://www.npmjs.com/package/@cosmonauts/ast-gen) | 2,489 | 70 | 34 |
| [badkidsjs](https://www.npmjs.com/package/badkidsjs) | 2,436 | 38 | 18 |
| [@cosmonauts/protobuf](https://www.npmjs.com/package/@cosmonauts/protobuf) | 2,373 | 87 | 46 |
| [@cosmology/react](https://www.npmjs.com/package/@cosmology/react) | 1,956 | 50 | 22 |
| [dexmos](https://www.npmjs.com/package/dexmos) | 1,904 | 39 | 2 |
| [@cosmology/protobufs](https://www.npmjs.com/package/@cosmology/protobufs) | 1,878 | 133 | 43 |
| [@pyramation/cosmos-registry](https://www.npmjs.com/package/@pyramation/cosmos-registry) | 1,850 | 33 | 12 |
| [@uni-sign/cosmos-msgs](https://www.npmjs.com/package/@uni-sign/cosmos-msgs) | 1,788 | 188 | 80 |
| [@cosmology/ts-codegen-types](https://www.npmjs.com/package/@cosmology/ts-codegen-types) | 1,668 | 70 | 10 |
| [chain-registry-utils](https://www.npmjs.com/package/chain-registry-utils) | 1,581 | 29 | 4 |
| [@uni-sign/cosmos](https://www.npmjs.com/package/@uni-sign/cosmos) | 1,557 | 174 | 73 |
| [@uni-sign/cosmos-query](https://www.npmjs.com/package/@uni-sign/cosmos-query) | 1,551 | 171 | 74 |
| [@uni-sign/types](https://www.npmjs.com/package/@uni-sign/types) | 1,549 | 103 | 21 |
| [@cosmology/cosmjs](https://www.npmjs.com/package/@cosmology/cosmjs) | 1,523 | 157 | 26 |
| [cosmoscript](https://www.npmjs.com/package/cosmoscript) | 1,462 | 63 | 20 |
| [@uni-sign/utils](https://www.npmjs.com/package/@uni-sign/utils) | 1,440 | 97 | 24 |
| [mesh-security](https://www.npmjs.com/package/mesh-security) | 1,418 | 37 | 3 |
| [teslapi](https://www.npmjs.com/package/teslapi) | 1,369 | 29 | 4 |
| [@cosmonauts/cosmos](https://www.npmjs.com/package/@cosmonauts/cosmos) | 1,337 | 67 | 23 |
| [teritorijs](https://www.npmjs.com/package/teritorijs) | 1,270 | 111 | 32 |
| [teritori](https://www.npmjs.com/package/teritori) | 1,129 | 95 | 25 |
| [cpbf](https://www.npmjs.com/package/cpbf) | 1,092 | 25 | 7 |
| [@uni-sign/auth](https://www.npmjs.com/package/@uni-sign/auth) | 1,065 | 75 | 30 |
| [@cosmonauts/cosmos-msgs](https://www.npmjs.com/package/@cosmonauts/cosmos-msgs) | 1,042 | 108 | 73 |
| [@uni-sign/ethereum](https://www.npmjs.com/package/@uni-sign/ethereum) | 1,037 | 80 | 37 |
| [@pyramation/osmojs](https://www.npmjs.com/package/@pyramation/osmojs) | 1,004 | 88 | 52 |
| *52 packages hidden (< 1,000 downloads)* | | | |

### stride

| Name | Total | Monthly | Weekly |
| ------- | ------ | ------- | ----- |
| _Total_ | 38,786 | 825 | 174 |
| [stridejs](https://www.npmjs.com/package/stridejs) | 38,786 | 825 | 174 |

### juno

| Name | Total | Monthly | Weekly |
| ------- | ------ | ------- | ----- |
| _Total_ | 48,372 | 1,170 | 174 |
| [juno-network](https://www.npmjs.com/package/juno-network) | 39,404 | 849 | 115 |
| [@juno-network/assets](https://www.npmjs.com/package/@juno-network/assets) | 8,968 | 321 | 59 |

### stargaze

| Name | Total | Monthly | Weekly |
| ------- | ------ | ------- | ----- |
| _Total_ | 35,477 | 914 | 203 |
| [stargazejs](https://www.npmjs.com/package/stargazejs) | 23,363 | 453 | 65 |
| [@stargaze-zone/contracts](https://www.npmjs.com/package/@stargaze-zone/contracts) | 4,980 | 150 | 60 |
| [@stargaze-zone/chain](https://www.npmjs.com/package/@stargaze-zone/chain) | 4,545 | 194 | 45 |
| [stargaze-query](https://www.npmjs.com/package/stargaze-query) | 2,589 | 117 | 33 |

### dydx

| Name | Total | Monthly | Weekly |
| ------- | ------ | ------- | ----- |
| _Total_ | 4,166,874 | 340,974 | 66,435 |
| [@dydxprotocol/v4-client-js](https://www.npmjs.com/package/@dydxprotocol/v4-client-js) | 4,166,874 | 340,974 | 66,435 |

### chain

| Name | Total | Monthly | Weekly |
| ------- | ------ | ------- | ----- |
| _Total_ | 14,232 | 494 | 107 |
| [@juno-network/swap](https://www.npmjs.com/package/@juno-network/swap) | 5,028 | 306 | 46 |
| [akashjs](https://www.npmjs.com/package/akashjs) | 4,136 | 61 | 27 |
| [autosmosis](https://www.npmjs.com/package/autosmosis) | 1,675 | 15 | 3 |
| [kavajs](https://www.npmjs.com/package/kavajs) | 1,148 | 20 | 2 |
| [eve-network](https://www.npmjs.com/package/eve-network) | 1,013 | 21 | 4 |
| *3 packages hidden (< 1,000 downloads)* | | | |

### create-cosmos-app

| Name | Total | Monthly | Weekly |
| ------- | ------ | ------- | ----- |
| _Total_ | 22,158 | 577 | 131 |
| [create-cosmos-app](https://www.npmjs.com/package/create-cosmos-app) | 18,980 | 268 | 83 |
| [create-interchain-app](https://www.npmjs.com/package/create-interchain-app) | 3,178 | 309 | 48 |



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


<!-- README.md automatically generated on 2026-11-12T20:37:42.036Z from lib-count repository with latest download stats -->
