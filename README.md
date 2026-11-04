
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
| **Total** | 277,060,795 | 50,074,396 | 13,480,454 |
| Cloud | 179,767,959 | 43,513,838 | 11,919,244 |
| Chain | 71,885,518 | 2,343,189 | 551,626 |
| Utilities | 25,405,641 | 4,217,369 | 1,009,584 |

_Weekly and monthly are the last 7 and 30 days of npm data, through 2026-11-02._ _npm reported zero downloads for every package on 7 of those 30 days (an npm-side outage); those days are excluded and the totals scaled to the full period._


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
| _Total_ | 145,050,508 | 35,690,035 | 10,017,208 |
| [@pgsql/types](https://www.npmjs.com/package/@pgsql/types) | 31,880,989 | 11,514,886 | 3,408,051 |
| [libpg-query](https://www.npmjs.com/package/libpg-query) | 28,927,236 | 9,066,524 | 2,742,434 |
| [pgsql-deparser](https://www.npmjs.com/package/pgsql-deparser) | 19,681,741 | 3,387,357 | 854,296 |
| [pgsql-parser](https://www.npmjs.com/package/pgsql-parser) | 13,890,398 | 1,679,270 | 447,199 |
| [@launchql/protobufjs](https://www.npmjs.com/package/@launchql/protobufjs) | 8,739,803 | 2,188,209 | 553,526 |
| [@libpg-query/parser](https://www.npmjs.com/package/@libpg-query/parser) | 7,865,640 | 2,519,777 | 702,820 |
| [pgsql-enums](https://www.npmjs.com/package/pgsql-enums) | 7,520,784 | 50,506 | 14,657 |
| [pg-proto-parser](https://www.npmjs.com/package/pg-proto-parser) | 6,617,964 | 1,746,683 | 412,441 |
| [@pgsql/traverse](https://www.npmjs.com/package/@pgsql/traverse) | 6,503,671 | 1,751,245 | 413,291 |
| [@pgsql/enums](https://www.npmjs.com/package/@pgsql/enums) | 837,313 | 108,861 | 32,297 |
| [@pgsql/utils](https://www.npmjs.com/package/@pgsql/utils) | 758,056 | 48,125 | 12,189 |
| [pg-env](https://www.npmjs.com/package/pg-env) | 593,854 | 62,707 | 15,910 |
| [pg-cache](https://www.npmjs.com/package/pg-cache) | 549,997 | 50,572 | 12,792 |
| [csv-to-pg](https://www.npmjs.com/package/csv-to-pg) | 485,297 | 38,935 | 9,914 |
| [graphile-settings](https://www.npmjs.com/package/graphile-settings) | 364,716 | 43,345 | 11,765 |
| [graphile-postgis](https://www.npmjs.com/package/graphile-postgis) | 317,101 | 41,512 | 10,671 |
| [gql-ast](https://www.npmjs.com/package/gql-ast) | 299,739 | 36,540 | 9,319 |
| [graphile-i18n](https://www.npmjs.com/package/graphile-i18n) | 299,083 | 40,357 | 10,463 |
| [graphile-cache](https://www.npmjs.com/package/graphile-cache) | 290,269 | 38,148 | 9,606 |
| [graphile-upload-plugin](https://www.npmjs.com/package/graphile-upload-plugin) | 276,553 | 36,712 | 9,477 |
| [pg-query-context](https://www.npmjs.com/package/pg-query-context) | 270,286 | 36,707 | 9,411 |
| [@pyramation/postgraphile-plugin-fulltext-filter](https://www.npmjs.com/package/@pyramation/postgraphile-plugin-fulltext-filter) | 269,546 | 10,174 | 3,067 |
| [pg-ast](https://www.npmjs.com/package/pg-ast) | 258,377 | 35,777 | 8,848 |
| [@agentic-kit/ollama](https://www.npmjs.com/package/@agentic-kit/ollama) | 249,880 | 37,449 | 9,502 |
| [pgsql-test](https://www.npmjs.com/package/pgsql-test) | 241,871 | 31,816 | 7,670 |
| [@pgpmjs/transform](https://www.npmjs.com/package/@pgpmjs/transform) | 228,116 | 44,131 | 11,675 |
| [@agentic-kit/protocol](https://www.npmjs.com/package/@agentic-kit/protocol) | 219,933 | 36,710 | 9,360 |
| [graphile-plugin-utils](https://www.npmjs.com/package/graphile-plugin-utils) | 209,351 | 38,073 | 9,695 |
| [@pgpmjs/ast](https://www.npmjs.com/package/@pgpmjs/ast) | 207,707 | 45,484 | 12,893 |
| [@constructive-io/errors](https://www.npmjs.com/package/@constructive-io/errors) | 197,414 | 47,499 | 11,760 |
| [skitch-utils](https://www.npmjs.com/package/skitch-utils) | 193,560 | 9,214 | 2,093 |
| [@pgql/parse](https://www.npmjs.com/package/@pgql/parse) | 190,394 | 235 | 39 |
| [@pgpmjs/naming-spec](https://www.npmjs.com/package/@pgpmjs/naming-spec) | 184,622 | 40,565 | 11,264 |
| [@pgpmjs/slice](https://www.npmjs.com/package/@pgpmjs/slice) | 181,953 | 37,718 | 9,859 |
| [graphile-history](https://www.npmjs.com/package/graphile-history) | 180,304 | 39,539 | 10,336 |
| [graphile-meta](https://www.npmjs.com/package/graphile-meta) | 176,309 | 36,334 | 9,923 |
| [@pgsql/transform](https://www.npmjs.com/package/@pgsql/transform) | 175,598 | 34,055 | 8,626 |
| [@pgsql/parser](https://www.npmjs.com/package/@pgsql/parser) | 175,332 | 63,090 | 19,388 |
| [@pgpmjs/bundle](https://www.npmjs.com/package/@pgpmjs/bundle) | 172,400 | 32,211 | 8,143 |
| [@pgpmjs/traverse](https://www.npmjs.com/package/@pgpmjs/traverse) | 172,206 | 32,112 | 8,183 |
| [query-spec](https://www.npmjs.com/package/query-spec) | 171,114 | 33,721 | 8,536 |
| [@pgsql/semantics](https://www.npmjs.com/package/@pgsql/semantics) | 161,949 | 38,879 | 11,824 |
| [@pgpmjs/diff](https://www.npmjs.com/package/@pgpmjs/diff) | 155,999 | 36,815 | 9,842 |
| [@pgsql/scripts](https://www.npmjs.com/package/@pgsql/scripts) | 144,030 | 34,256 | 8,713 |
| [@constructive-io/coerce](https://www.npmjs.com/package/@constructive-io/coerce) | 142,280 | 44,151 | 11,586 |
| [skitch](https://www.npmjs.com/package/skitch) | 132,716 | 39 | 7 |
| [graphile-test](https://www.npmjs.com/package/graphile-test) | 112,745 | 6,866 | 2,031 |
| [@launchql/styled-email](https://www.npmjs.com/package/@launchql/styled-email) | 111,578 | 202 | 59 |
| [@launchql/mjml](https://www.npmjs.com/package/@launchql/mjml) | 111,505 | 119 | 14 |
| [introspectron](https://www.npmjs.com/package/introspectron) | 98,170 | 5,992 | 2,093 |
| [graphile-function-bindings](https://www.npmjs.com/package/graphile-function-bindings) | 94,552 | 26,922 | 6,532 |
| [graphile-storage-registry](https://www.npmjs.com/package/graphile-storage-registry) | 90,007 | 35,216 | 9,175 |
| [@launchql/cli](https://www.npmjs.com/package/@launchql/cli) | 86,711 | 626 | 13 |
| [graphile-query](https://www.npmjs.com/package/graphile-query) | 74,832 | 3,837 | 1,470 |
| [safegres](https://www.npmjs.com/package/safegres) | 69,357 | 16,790 | 4,156 |
| [@launchql/graphql-testing](https://www.npmjs.com/package/@launchql/graphql-testing) | 60,059 | 468 | 19 |
| [pg-codegen](https://www.npmjs.com/package/pg-codegen) | 59,261 | 4,700 | 1,509 |
| [@pgsql/lint](https://www.npmjs.com/package/@pgsql/lint) | 56,178 | 20,857 | 6,993 |
| [graphile-search-plugin](https://www.npmjs.com/package/graphile-search-plugin) | 56,133 | 608 | 154 |
| [supabase-test](https://www.npmjs.com/package/supabase-test) | 55,924 | 6,415 | 1,292 |
| [agentic-server](https://www.npmjs.com/package/agentic-server) | 54,898 | 10,723 | 2,704 |
| [graphile-simple-inflector](https://www.npmjs.com/package/graphile-simple-inflector) | 51,208 | 604 | 152 |
| [graphile-meta-schema](https://www.npmjs.com/package/graphile-meta-schema) | 51,153 | 549 | 136 |
| [@constructive-io/eslint-config](https://www.npmjs.com/package/@constructive-io/eslint-config) | 46,908 | 13,637 | 3,263 |
| [skitch-templates](https://www.npmjs.com/package/skitch-templates) | 46,030 | 231 | 8 |
| [drizzle-orm-test](https://www.npmjs.com/package/drizzle-orm-test) | 45,641 | 4,080 | 1,080 |
| [pg-query-string](https://www.npmjs.com/package/pg-query-string) | 43,494 | 716 | 167 |
| [@launchql/server](https://www.npmjs.com/package/@launchql/server) | 42,230 | 547 | 16 |
| [@launchql/types](https://www.npmjs.com/package/@launchql/types) | 41,835 | 832 | 186 |
| [@launchql/server-utils](https://www.npmjs.com/package/@launchql/server-utils) | 40,555 | 775 | 163 |
| [@launchql/explorer](https://www.npmjs.com/package/@launchql/explorer) | 36,720 | 707 | 41 |
| [@pgpmjs/import](https://www.npmjs.com/package/@pgpmjs/import) | 36,105 | 8,048 | 2,649 |
| [@launchql/core](https://www.npmjs.com/package/@launchql/core) | 35,645 | 583 | 134 |
| [@launchql/env](https://www.npmjs.com/package/@launchql/env) | 34,956 | 522 | 117 |
| [@agentic-kit/pi](https://www.npmjs.com/package/@agentic-kit/pi) | 34,618 | 8,789 | 2,342 |
| [graphile-scoped-introspection](https://www.npmjs.com/package/graphile-scoped-introspection) | 33,753 | 26,361 | 6,293 |
| [@launchql/db-testing](https://www.npmjs.com/package/@launchql/db-testing) | 33,678 | 500 | 49 |
| [skitch-testing](https://www.npmjs.com/package/skitch-testing) | 33,468 | 203 | 7 |
| [graphile-plugin-connection-filter-postgis](https://www.npmjs.com/package/graphile-plugin-connection-filter-postgis) | 32,274 | 190 | 122 |
| [@launchql/postmaster](https://www.npmjs.com/package/@launchql/postmaster) | 31,602 | 50 | 16 |
| [@agentic-kit/anthropic](https://www.npmjs.com/package/@agentic-kit/anthropic) | 31,268 | 4,247 | 911 |
| [@launchql/logger](https://www.npmjs.com/package/@launchql/logger) | 30,632 | 458 | 107 |
| [@agentic-kit/openai](https://www.npmjs.com/package/@agentic-kit/openai) | 30,211 | 4,294 | 1,027 |
| [graphile-plugin-connection-filter](https://www.npmjs.com/package/graphile-plugin-connection-filter) | 29,683 | 222 | 106 |
| [@agentic-kit/run-log](https://www.npmjs.com/package/@agentic-kit/run-log) | 28,789 | 11,399 | 2,823 |
| [graphile-plugin-fulltext-filter](https://www.npmjs.com/package/graphile-plugin-fulltext-filter) | 27,897 | 163 | 103 |
| [graphile-pg-type-mappings](https://www.npmjs.com/package/graphile-pg-type-mappings) | 27,532 | 145 | 104 |
| [@launchql/templatizer](https://www.npmjs.com/package/@launchql/templatizer) | 26,955 | 498 | 130 |
| [@launchql/db-utils](https://www.npmjs.com/package/@launchql/db-utils) | 26,793 | 309 | 13 |
| [pg-query-native-latest](https://www.npmjs.com/package/pg-query-native-latest) | 26,779 | 110 | 2 |
| [@decryption/hashes](https://www.npmjs.com/package/@decryption/hashes) | 25,050 | 3,050 | 727 |
| [@launchql/db-migrate](https://www.npmjs.com/package/@launchql/db-migrate) | 24,816 | 52 | 17 |
| [@agentic-kit/db-tools](https://www.npmjs.com/package/@agentic-kit/db-tools) | 23,628 | 9,194 | 2,533 |
| [@agentic-kit/harness](https://www.npmjs.com/package/@agentic-kit/harness) | 23,256 | 4,641 | 1,052 |
| [@launchql/s3-streamer](https://www.npmjs.com/package/@launchql/s3-streamer) | 23,093 | 112 | 19 |
| [@agentic-kit/agent](https://www.npmjs.com/package/@agentic-kit/agent) | 22,820 | 3,751 | 867 |
| [@launchql/db-templates](https://www.npmjs.com/package/@launchql/db-templates) | 22,313 | 89 | 21 |
| [@pgpmjs/pglite-adapter](https://www.npmjs.com/package/@pgpmjs/pglite-adapter) | 22,107 | 5,961 | 1,755 |
| [pglite-test](https://www.npmjs.com/package/pglite-test) | 20,490 | 5,056 | 1,406 |
| [@launchql/content-type-stream](https://www.npmjs.com/package/@launchql/content-type-stream) | 20,489 | 78 | 17 |
| [@launchql/upload-names](https://www.npmjs.com/package/@launchql/upload-names) | 19,482 | 74 | 19 |
| [@agentic-kit/chat](https://www.npmjs.com/package/@agentic-kit/chat) | 19,312 | 3,361 | 764 |
| [postgraphile-derived-upload-field](https://www.npmjs.com/package/postgraphile-derived-upload-field) | 18,695 | 194 | 24 |
| [@constructive-io/graphql-dev-server](https://www.npmjs.com/package/@constructive-io/graphql-dev-server) | 17,814 | 4,555 | 1,467 |
| [@agentic-kit/cli](https://www.npmjs.com/package/@agentic-kit/cli) | 16,734 | 4,938 | 1,339 |
| [@agentic-kit/metering](https://www.npmjs.com/package/@agentic-kit/metering) | 16,304 | 3,588 | 876 |
| [@launchql/url-domains](https://www.npmjs.com/package/@launchql/url-domains) | 15,228 | 89 | 23 |
| [skitch-template](https://www.npmjs.com/package/skitch-template) | 15,098 | 102 | 7 |
| [@launchql/ext-verify](https://www.npmjs.com/package/@launchql/ext-verify) | 14,412 | 158 | 63 |
| [@launchql/ext-types](https://www.npmjs.com/package/@launchql/ext-types) | 14,252 | 158 | 65 |
| [@launchql/ext-defaults](https://www.npmjs.com/package/@launchql/ext-defaults) | 14,113 | 159 | 67 |
| [@launchql/ext-default-roles](https://www.npmjs.com/package/@launchql/ext-default-roles) | 14,107 | 159 | 66 |
| [@launchql/ext-measurements](https://www.npmjs.com/package/@launchql/ext-measurements) | 13,783 | 90 | 65 |
| [@launchql/ext-jobs](https://www.npmjs.com/package/@launchql/ext-jobs) | 13,525 | 155 | 65 |
| [@launchql/db-transform](https://www.npmjs.com/package/@launchql/db-transform) | 13,409 | 279 | 15 |
| [@launchql/base32](https://www.npmjs.com/package/@launchql/base32) | 13,051 | 159 | 64 |
| [@agentic-kit/run-log-client](https://www.npmjs.com/package/@agentic-kit/run-log-client) | 12,951 | 9,927 | 2,398 |
| [graphile-column-privileges-mutations](https://www.npmjs.com/package/graphile-column-privileges-mutations) | 12,877 | 297 | 95 |
| [@launchql/graphile-settings](https://www.npmjs.com/package/@launchql/graphile-settings) | 12,850 | 528 | 19 |
| [@launchql/inflection](https://www.npmjs.com/package/@launchql/inflection) | 12,840 | 163 | 67 |
| [@launchql/totp](https://www.npmjs.com/package/@launchql/totp) | 12,425 | 143 | 58 |
| [@launchql/faker](https://www.npmjs.com/package/@launchql/faker) | 12,242 | 119 | 65 |
| [@launchql/codegen](https://www.npmjs.com/package/@launchql/codegen) | 11,689 | 127 | 27 |
| [@launchql/ext-jobs-queue](https://www.npmjs.com/package/@launchql/ext-jobs-queue) | 11,459 | 82 | 56 |
| [@launchql/db-template](https://www.npmjs.com/package/@launchql/db-template) | 11,372 | 198 | 17 |
| [@launchql/ext-jwt-claims](https://www.npmjs.com/package/@launchql/ext-jwt-claims) | 11,263 | 149 | 53 |
| [@pgpm/function-resolution](https://www.npmjs.com/package/@pgpm/function-resolution) | 11,116 | 2,673 | 403 |
| [@constructive-db/machine-protocol](https://www.npmjs.com/package/@constructive-db/machine-protocol) | 11,107 | 9,745 | 2,363 |
| [@launchql/ext-achievements](https://www.npmjs.com/package/@launchql/ext-achievements) | 10,871 | 81 | 55 |
| [@pgpm/app-scope](https://www.npmjs.com/package/@pgpm/app-scope) | 10,806 | 2,177 | 310 |
| [@launchql/react](https://www.npmjs.com/package/@launchql/react) | 10,625 | 86 | 12 |
| [@constructive-db/catalog](https://www.npmjs.com/package/@constructive-db/catalog) | 10,471 | 2,260 | 353 |
| [@pgpm/errors](https://www.npmjs.com/package/@pgpm/errors) | 10,199 | 3,077 | 553 |
| [@constructive-db/routing](https://www.npmjs.com/package/@constructive-db/routing) | 9,731 | 1,960 | 310 |
| [@constructive-db/routing-platform](https://www.npmjs.com/package/@constructive-db/routing-platform) | 9,432 | 2,090 | 336 |
| [@agentic-kit/pi-host](https://www.npmjs.com/package/@agentic-kit/pi-host) | 9,231 | 7,655 | 2,065 |
| [skitch-transform](https://www.npmjs.com/package/skitch-transform) | 9,024 | 103 | 5 |
| [@launchql/ext-stamps](https://www.npmjs.com/package/@launchql/ext-stamps) | 8,847 | 112 | 45 |
| [@launchql/ext-uuid](https://www.npmjs.com/package/@launchql/ext-uuid) | 8,784 | 120 | 50 |
| [@pgpmjs/portability](https://www.npmjs.com/package/@pgpmjs/portability) | 8,764 | 2,516 | 653 |
| [agentic-kit](https://www.npmjs.com/package/agentic-kit) | 8,614 | 1,046 | 221 |
| [pg-utils](https://www.npmjs.com/package/pg-utils) | 8,589 | 34 | 2 |
| [@launchql/proto-cli](https://www.npmjs.com/package/@launchql/proto-cli) | 8,567 | 558 | 64 |
| [graphile-gen](https://www.npmjs.com/package/graphile-gen) | 8,156 | 85 | 45 |
| [@constructive-db/apps](https://www.npmjs.com/package/@constructive-db/apps) | 8,050 | 1,675 | 240 |
| [@launchql/db-env](https://www.npmjs.com/package/@launchql/db-env) | 8,046 | 279 | 18 |
| [@agentic-kit/dsh](https://www.npmjs.com/package/@agentic-kit/dsh) | 7,961 | 4,816 | 1,378 |
| [@launchql/ext-utils](https://www.npmjs.com/package/@launchql/ext-utils) | 7,408 | 64 | 40 |
| [@launchql/s3-utils](https://www.npmjs.com/package/@launchql/s3-utils) | 7,305 | 87 | 19 |
| [skitch-types](https://www.npmjs.com/package/skitch-types) | 7,301 | 47 | 3 |
| [@launchql/utils](https://www.npmjs.com/package/@launchql/utils) | 7,214 | 102 | 44 |
| [@launchql/openfaas-job-worker](https://www.npmjs.com/package/@launchql/openfaas-job-worker) | 6,904 | 25 | 13 |
| [@launchql/protobufjs-cli](https://www.npmjs.com/package/@launchql/protobufjs-cli) | 6,804 | 1,246 | 147 |
| [skitch-path](https://www.npmjs.com/package/skitch-path) | 6,652 | 63 | 4 |
| [@constructive-io/site-deploy](https://www.npmjs.com/package/@constructive-io/site-deploy) | 6,192 | 2,370 | 574 |
| [@agentic-kit/react](https://www.npmjs.com/package/@agentic-kit/react) | 5,976 | 670 | 117 |
| [@agentic-kit/agent-conversation](https://www.npmjs.com/package/@agentic-kit/agent-conversation) | 4,397 | 3,103 | 721 |
| [@launchql/migrate](https://www.npmjs.com/package/@launchql/migrate) | 4,389 | 176 | 13 |
| [@launchql/query](https://www.npmjs.com/package/@launchql/query) | 4,355 | 55 | 16 |
| [@agentic-kit/run-log-gate](https://www.npmjs.com/package/@agentic-kit/run-log-gate) | 4,291 | 3,100 | 651 |
| [@launchql/graphile-query](https://www.npmjs.com/package/@launchql/graphile-query) | 4,166 | 231 | 22 |
| [skitch-ext-utilities](https://www.npmjs.com/package/skitch-ext-utilities) | 4,152 | 29 | 5 |
| [skitch-prompt](https://www.npmjs.com/package/skitch-prompt) | 4,120 | 9 | 5 |
| [skitch-ext-verify](https://www.npmjs.com/package/skitch-ext-verify) | 4,079 | 29 | 3 |
| [skitch-env](https://www.npmjs.com/package/skitch-env) | 4,072 | 69 | 7 |
| [skitch-ext-defaults](https://www.npmjs.com/package/skitch-ext-defaults) | 3,989 | 42 | 8 |
| [@launchql/openfaas-job-fn](https://www.npmjs.com/package/@launchql/openfaas-job-fn) | 3,913 | 39 | 15 |
| [graphile-gen-js](https://www.npmjs.com/package/graphile-gen-js) | 3,600 | 47 | 29 |
| [@launchql/client](https://www.npmjs.com/package/@launchql/client) | 3,539 | 365 | 114 |
| [@constructive-db/infra-platform](https://www.npmjs.com/package/@constructive-db/infra-platform) | 3,514 | 1,089 | 122 |
| [@launchql/orm](https://www.npmjs.com/package/@launchql/orm) | 3,393 | 325 | 111 |
| [skitch-extension-verify](https://www.npmjs.com/package/skitch-extension-verify) | 3,358 | 25 | 6 |
| [@pgsql/transform-ast](https://www.npmjs.com/package/@pgsql/transform-ast) | 3,350 | 1,737 | 311 |
| [@launchql/job-utils](https://www.npmjs.com/package/@launchql/job-utils) | 3,335 | 53 | 22 |
| [launchql-test](https://www.npmjs.com/package/launchql-test) | 3,308 | 46 | 14 |
| [@launchql/openfaas-job-service](https://www.npmjs.com/package/@launchql/openfaas-job-service) | 3,294 | 23 | 13 |
| [@constructive-db/infra](https://www.npmjs.com/package/@constructive-db/infra) | 3,241 | 1,073 | 122 |
| [@launchql/job-worker](https://www.npmjs.com/package/@launchql/job-worker) | 3,241 | 35 | 12 |
| [@launchql/query-builder](https://www.npmjs.com/package/@launchql/query-builder) | 3,218 | 68 | 39 |
| [@constructive-db/compute](https://www.npmjs.com/package/@constructive-db/compute) | 3,170 | 959 | 99 |
| [@constructive-db/compute-platform](https://www.npmjs.com/package/@constructive-db/compute-platform) | 3,136 | 978 | 100 |
| [skitch-extension-utils](https://www.npmjs.com/package/skitch-extension-utils) | 3,064 | 25 | 4 |
| [skitch-install](https://www.npmjs.com/package/skitch-install) | 3,052 | 29 | 4 |
| [@constructive-db/platform-schema](https://www.npmjs.com/package/@constructive-db/platform-schema) | 3,037 | 900 | 87 |
| [@launchql/job-scheduler](https://www.npmjs.com/package/@launchql/job-scheduler) | 2,919 | 63 | 14 |
| [@constructive-io/data](https://www.npmjs.com/package/@constructive-io/data) | 2,874 | 627 | 184 |
| [@launchql/job-pg](https://www.npmjs.com/package/@launchql/job-pg) | 2,821 | 44 | 15 |
| [skitch-extension-defaults](https://www.npmjs.com/package/skitch-extension-defaults) | 2,736 | 14 | 3 |
| [skitch-extension-jobs](https://www.npmjs.com/package/skitch-extension-jobs) | 2,645 | 5 | 2 |
| [agentic-db](https://www.npmjs.com/package/agentic-db) | 2,544 | 304 | 110 |
| [skitch-extension-default-roles](https://www.npmjs.com/package/skitch-extension-default-roles) | 2,389 | 14 | 2 |
| [launchql-client](https://www.npmjs.com/package/launchql-client) | 2,369 | 26 | 10 |
| [@agentic-db/sdk](https://www.npmjs.com/package/@agentic-db/sdk) | 2,287 | 200 | 34 |
| [@agentic-kit/pi-embed](https://www.npmjs.com/package/@agentic-kit/pi-embed) | 2,257 | 85 | 18 |
| [@constructive-io/schema-builder](https://www.npmjs.com/package/@constructive-io/schema-builder) | 2,090 | 97 | 31 |
| [@agentic-kit/pi-ext-run-log](https://www.npmjs.com/package/@agentic-kit/pi-ext-run-log) | 2,068 | 72 | 10 |
| [@agentic-db/services](https://www.npmjs.com/package/@agentic-db/services) | 1,904 | 183 | 34 |
| [@launchql/openfaas-job-util-jobs](https://www.npmjs.com/package/@launchql/openfaas-job-util-jobs) | 1,832 | 20 | 10 |
| [@agentic-kit/pi-ext-metered-model](https://www.npmjs.com/package/@agentic-kit/pi-ext-metered-model) | 1,824 | 51 | 12 |
| [@agentic-kit/pi-ext-gate](https://www.npmjs.com/package/@agentic-kit/pi-ext-gate) | 1,818 | 42 | 10 |
| [@agentic-kit/pi-ext-usage-report](https://www.npmjs.com/package/@agentic-kit/pi-ext-usage-report) | 1,813 | 44 | 11 |
| [@launchql/geo-types](https://www.npmjs.com/package/@launchql/geo-types) | 1,721 | 37 | 18 |
| [launchql-gen](https://www.npmjs.com/package/launchql-gen) | 1,672 | 48 | 16 |
| [@constructive-db/scope](https://www.npmjs.com/package/@constructive-db/scope) | 1,658 | 866 | 84 |
| [@webql/base32](https://www.npmjs.com/package/@webql/base32) | 1,568 | 37 | 24 |
| [@launchql/ast](https://www.npmjs.com/package/@launchql/ast) | 1,557 | 42 | 24 |
| [@launchql/mmmagic](https://www.npmjs.com/package/@launchql/mmmagic) | 1,516 | 33 | 10 |
| [@launchql/openfaas-job-server](https://www.npmjs.com/package/@launchql/openfaas-job-server) | 1,513 | 16 | 8 |
| [graphile-client](https://www.npmjs.com/package/graphile-client) | 1,487 | 29 | 10 |
| [graphile-gen-sql](https://www.npmjs.com/package/graphile-gen-sql) | 1,455 | 20 | 10 |
| [@constructive-db/remote](https://www.npmjs.com/package/@constructive-db/remote) | 1,443 | 910 | 84 |
| [@launchql/openfaas-env](https://www.npmjs.com/package/@launchql/openfaas-env) | 1,388 | 16 | 6 |
| [@launchql/pg-query-context](https://www.npmjs.com/package/@launchql/pg-query-context) | 1,337 | 29 | 11 |
| [@constructive-db/machine-runner](https://www.npmjs.com/package/@constructive-db/machine-runner) | 1,325 | 732 | 151 |
| [@launchql/job-api-server](https://www.npmjs.com/package/@launchql/job-api-server) | 1,296 | 13 | 5 |
| [@agentic-kit/bradie](https://www.npmjs.com/package/@agentic-kit/bradie) | 1,291 | 82 | 8 |
| [csv-to-gql](https://www.npmjs.com/package/csv-to-gql) | 1,272 | 18 | 7 |
| [@launchql/ext-status](https://www.npmjs.com/package/@launchql/ext-status) | 1,201 | 25 | 9 |
| [@agentic-db/cli](https://www.npmjs.com/package/@agentic-db/cli) | 1,137 | 134 | 33 |
| [@constructive-db/agent-cli](https://www.npmjs.com/package/@constructive-db/agent-cli) | 1,118 | 742 | 152 |
| [@webql/utils](https://www.npmjs.com/package/@webql/utils) | 1,098 | 25 | 14 |
| [@launchql/ast-deparser](https://www.npmjs.com/package/@launchql/ast-deparser) | 1,085 | 23 | 11 |
| [skitch-extension-utilities](https://www.npmjs.com/package/skitch-extension-utilities) | 1,037 | 17 | 2 |
| [@launchql/openfaas-job-req](https://www.npmjs.com/package/@launchql/openfaas-job-req) | 1,011 | 13 | 4 |
| *65 packages hidden (< 1,000 downloads)* | | | |

### utils

| Name | Total | Monthly | Weekly |
| ------- | ------ | ------- | ----- |
| _Total_ | 25,358,442 | 4,194,153 | 1,000,743 |
| [nested-obj](https://www.npmjs.com/package/nested-obj) | 7,320,115 | 1,767,737 | 416,215 |
| [strfy-js](https://www.npmjs.com/package/strfy-js) | 6,622,137 | 1,747,103 | 412,450 |
| [inquirerer](https://www.npmjs.com/package/inquirerer) | 2,201,335 | 85,053 | 21,001 |
| [ast-stringify](https://www.npmjs.com/package/ast-stringify) | 1,569,750 | 32,105 | 7,837 |
| [@pyramation/json-schema-ref-parser](https://www.npmjs.com/package/@pyramation/json-schema-ref-parser) | 1,543,440 | 30,369 | 7,531 |
| [@pyramation/json-schema-to-typescript](https://www.npmjs.com/package/@pyramation/json-schema-to-typescript) | 1,531,415 | 30,372 | 7,517 |
| [appstash](https://www.npmjs.com/package/appstash) | 558,206 | 36,420 | 9,439 |
| [yanse](https://www.npmjs.com/package/yanse) | 510,684 | 47,096 | 12,346 |
| [genomic](https://www.npmjs.com/package/genomic) | 455,264 | 45,353 | 11,739 |
| [etag-hash](https://www.npmjs.com/package/etag-hash) | 380,978 | 38,917 | 9,963 |
| [komoji](https://www.npmjs.com/package/komoji) | 375,125 | 37,758 | 9,879 |
| [uuid-hash](https://www.npmjs.com/package/uuid-hash) | 340,542 | 38,404 | 9,776 |
| [12factor-env](https://www.npmjs.com/package/12factor-env) | 295,583 | 45,751 | 11,859 |
| [mime-bytes](https://www.npmjs.com/package/mime-bytes) | 289,501 | 40,443 | 10,034 |
| [makage](https://www.npmjs.com/package/makage) | 272,620 | 18,372 | 4,877 |
| [inflekt](https://www.npmjs.com/package/inflekt) | 267,308 | 34,067 | 9,051 |
| [git-changed](https://www.npmjs.com/package/git-changed) | 147,487 | 41,439 | 10,773 |
| [schema-typescript](https://www.npmjs.com/package/schema-typescript) | 110,436 | 8,035 | 2,025 |
| [clean-ansi](https://www.npmjs.com/package/clean-ansi) | 99,065 | 1,068 | 260 |
| [yamlize](https://www.npmjs.com/package/yamlize) | 52,050 | 14,630 | 3,374 |
| [confstash](https://www.npmjs.com/package/confstash) | 51,009 | 13,724 | 3,352 |
| [pnpm-policy](https://www.npmjs.com/package/pnpm-policy) | 48,281 | 14,641 | 3,469 |
| [@constructive-io/pnpm-policy](https://www.npmjs.com/package/@constructive-io/pnpm-policy) | 48,009 | 14,654 | 3,471 |
| [create-gen-app](https://www.npmjs.com/package/create-gen-app) | 41,557 | 383 | 167 |
| [publish-scripts](https://www.npmjs.com/package/publish-scripts) | 34,206 | 433 | 181 |
| [@pyramation/babel-preset-env](https://www.npmjs.com/package/@pyramation/babel-preset-env) | 32,702 | 1,066 | 195 |
| [symlink-workspace](https://www.npmjs.com/package/symlink-workspace) | 28,799 | 2,520 | 229 |
| [promql-ast](https://www.npmjs.com/package/promql-ast) | 24,114 | 2,416 | 571 |
| [json-schema-patch](https://www.npmjs.com/package/json-schema-patch) | 23,041 | 648 | 200 |
| [file-ts](https://www.npmjs.com/package/file-ts) | 22,658 | 517 | 127 |
| [etag-stream](https://www.npmjs.com/package/etag-stream) | 11,238 | 305 | 54 |
| [uuid-stream](https://www.npmjs.com/package/uuid-stream) | 10,541 | 116 | 34 |
| [schema-sdk](https://www.npmjs.com/package/schema-sdk) | 7,958 | 335 | 150 |
| [@yamlize/cli](https://www.npmjs.com/package/@yamlize/cli) | 4,091 | 380 | 71 |
| [jsonldjs](https://www.npmjs.com/package/jsonldjs) | 3,352 | 316 | 198 |
| [@schema-typescript/cli](https://www.npmjs.com/package/@schema-typescript/cli) | 3,157 | 47 | 22 |
| [@constructive-io/pnpm-policy-graphile](https://www.npmjs.com/package/@constructive-io/pnpm-policy-graphile) | 2,541 | 800 | 189 |
| [backoff-script](https://www.npmjs.com/package/backoff-script) | 2,472 | 29 | 7 |
| [niftymagick](https://www.npmjs.com/package/niftymagick) | 2,335 | 22 | 16 |
| [json-stringify-simple](https://www.npmjs.com/package/json-stringify-simple) | 1,925 | 17 | 4 |
| [airpage-cli](https://www.npmjs.com/package/airpage-cli) | 1,575 | 22 | 8 |
| [airpage](https://www.npmjs.com/package/airpage) | 1,476 | 13 | 5 |
| [babel-slim](https://www.npmjs.com/package/babel-slim) | 1,043 | 13 | 6 |
| *15 packages hidden (< 1,000 downloads)* | | | |

### cloud

| Name | Total | Monthly | Weekly |
| ------- | ------ | ------- | ----- |
| _Total_ | 1,441,032 | 215,114 | 55,610 |
| [graphile-pg-aggregates](https://www.npmjs.com/package/graphile-pg-aggregates) | 263,782 | 40,222 | 10,384 |
| [graphile-bulk-mutations](https://www.npmjs.com/package/graphile-bulk-mutations) | 259,644 | 40,149 | 10,367 |
| [@constructive-io/express-context](https://www.npmjs.com/package/@constructive-io/express-context) | 244,735 | 39,541 | 10,318 |
| [graphile-realtime-subscriptions](https://www.npmjs.com/package/graphile-realtime-subscriptions) | 232,472 | 36,929 | 9,540 |
| [@constructive-io/llm-env](https://www.npmjs.com/package/@constructive-io/llm-env) | 226,540 | 36,883 | 9,425 |
| [graphile-realtime-test](https://www.npmjs.com/package/graphile-realtime-test) | 40,796 | 3,112 | 940 |
| [@constructive-io/graphql-realtime-test](https://www.npmjs.com/package/@constructive-io/graphql-realtime-test) | 28,060 | 3,398 | 1,142 |
| [blocks-schema](https://www.npmjs.com/package/blocks-schema) | 11,007 | 2,480 | 587 |
| [blocks-renderer](https://www.npmjs.com/package/blocks-renderer) | 10,869 | 2,491 | 585 |
| [json-renderer](https://www.npmjs.com/package/json-renderer) | 10,822 | 2,452 | 572 |
| [@constructive-io/noble-hashes](https://www.npmjs.com/package/@constructive-io/noble-hashes) | 10,325 | 151 | 45 |
| [@constructive-io/send-verification-link-fn](https://www.npmjs.com/package/@constructive-io/send-verification-link-fn) | 9,105 | 99 | 22 |
| [@constructive-io/send-email-fn](https://www.npmjs.com/package/@constructive-io/send-email-fn) | 9,001 | 95 | 22 |
| [@pgpm/object-store](https://www.npmjs.com/package/@pgpm/object-store) | 7,352 | 1,447 | 222 |
| [@interweb-utils/casing](https://www.npmjs.com/package/@interweb-utils/casing) | 6,699 | 94 | 21 |
| [@interweb/casing](https://www.npmjs.com/package/@interweb/casing) | 5,979 | 113 | 47 |
| [@fbp/types](https://www.npmjs.com/package/@fbp/types) | 5,681 | 150 | 32 |
| [@pgpm/object-tree](https://www.npmjs.com/package/@pgpm/object-tree) | 5,549 | 826 | 85 |
| [@pgpm/inflection-db](https://www.npmjs.com/package/@pgpm/inflection-db) | 5,412 | 1,422 | 265 |
| [@pgpm/partman](https://www.npmjs.com/package/@pgpm/partman) | 4,827 | 406 | 74 |
| [@fbp/spec](https://www.npmjs.com/package/@fbp/spec) | 4,190 | 70 | 20 |
| [@interweb/fetch-api-client](https://www.npmjs.com/package/@interweb/fetch-api-client) | 3,997 | 231 | 126 |
| [@interweb/http-errors](https://www.npmjs.com/package/@interweb/http-errors) | 3,613 | 236 | 114 |
| [@interweb/node-api-client](https://www.npmjs.com/package/@interweb/node-api-client) | 3,149 | 256 | 123 |
| [@constructive-io/sheets](https://www.npmjs.com/package/@constructive-io/sheets) | 2,893 | 368 | 99 |
| [@interweb/find-pkg](https://www.npmjs.com/package/@interweb/find-pkg) | 1,752 | 34 | 17 |
| [@fbp/evaluator](https://www.npmjs.com/package/@fbp/evaluator) | 1,168 | 107 | 19 |
| [@fbp/graph-editor](https://www.npmjs.com/package/@fbp/graph-editor) | 1,036 | 39 | 9 |
| *43 packages hidden (< 1,000 downloads)* | | | |

### kubernetesjs

| Name | Total | Monthly | Weekly |
| ------- | ------ | ------- | ----- |
| _Total_ | 92,526 | 11,511 | 3,000 |
| [@kubernetesjs/ops](https://www.npmjs.com/package/@kubernetesjs/ops) | 35,075 | 3,189 | 820 |
| [kubernetesjs](https://www.npmjs.com/package/kubernetesjs) | 29,823 | 4,567 | 1,081 |
| [@kubernetesjs/manifests](https://www.npmjs.com/package/@kubernetesjs/manifests) | 18,301 | 3,189 | 841 |
| [@kubernetesjs/client](https://www.npmjs.com/package/@kubernetesjs/client) | 2,646 | 213 | 109 |
| [@kubernetesjs/ops-cli](https://www.npmjs.com/package/@kubernetesjs/ops-cli) | 2,405 | 220 | 96 |
| [@kubernetesjs/cli](https://www.npmjs.com/package/@kubernetesjs/cli) | 2,318 | 59 | 24 |
| [@kubernetesjs/react](https://www.npmjs.com/package/@kubernetesjs/react) | 1,958 | 74 | 29 |

### pgpm

| Name | Total | Monthly | Weekly |
| ------- | ------ | ------- | ----- |
| _Total_ | 33,183,893 | 7,597,178 | 1,843,426 |
| [@pgsql/quotes](https://www.npmjs.com/package/@pgsql/quotes) | 9,502,091 | 2,997,781 | 749,300 |
| [plpgsql-deparser](https://www.npmjs.com/package/plpgsql-deparser) | 5,545,300 | 1,635,230 | 378,365 |
| [plpgsql-parser](https://www.npmjs.com/package/plpgsql-parser) | 5,524,776 | 1,627,915 | 376,608 |
| [@pgpmjs/types](https://www.npmjs.com/package/@pgpmjs/types) | 600,576 | 63,631 | 15,947 |
| [@pgpmjs/env](https://www.npmjs.com/package/@pgpmjs/env) | 534,585 | 50,810 | 12,923 |
| [@pgpmjs/server-utils](https://www.npmjs.com/package/@pgpmjs/server-utils) | 508,748 | 50,056 | 12,676 |
| [@pgpmjs/core](https://www.npmjs.com/package/@pgpmjs/core) | 506,647 | 40,295 | 10,571 |
| [@pgpmjs/logger](https://www.npmjs.com/package/@pgpmjs/logger) | 496,421 | 49,595 | 12,728 |
| [find-and-require-package-json](https://www.npmjs.com/package/find-and-require-package-json) | 440,135 | 36,715 | 9,507 |
| [@constructive-io/graphql-types](https://www.npmjs.com/package/@constructive-io/graphql-types) | 331,541 | 39,480 | 9,934 |
| [@inquirerer/utils](https://www.npmjs.com/package/@inquirerer/utils) | 314,106 | 23,251 | 6,188 |
| [graphile-search](https://www.npmjs.com/package/graphile-search) | 304,304 | 40,950 | 10,371 |
| [graphile-connection-filter](https://www.npmjs.com/package/graphile-connection-filter) | 297,259 | 42,008 | 10,811 |
| [@constructive-io/graphql-env](https://www.npmjs.com/package/@constructive-io/graphql-env) | 296,111 | 38,799 | 9,762 |
| [@constructive-io/s3-streamer](https://www.npmjs.com/package/@constructive-io/s3-streamer) | 288,619 | 37,534 | 9,374 |
| [graphile-ltree](https://www.npmjs.com/package/graphile-ltree) | 263,890 | 40,389 | 10,456 |
| [graphile-llm](https://www.npmjs.com/package/graphile-llm) | 263,577 | 42,680 | 11,218 |
| [@constructive-io/upload-names](https://www.npmjs.com/package/@constructive-io/upload-names) | 262,639 | 36,517 | 9,263 |
| [@constructive-io/content-type-stream](https://www.npmjs.com/package/@constructive-io/content-type-stream) | 262,257 | 36,509 | 9,305 |
| [graphile-presigned-url-plugin](https://www.npmjs.com/package/graphile-presigned-url-plugin) | 260,342 | 38,412 | 9,844 |
| [@constructive-io/s3-utils](https://www.npmjs.com/package/@constructive-io/s3-utils) | 257,217 | 36,708 | 9,360 |
| [@constructive-io/graphql-query](https://www.npmjs.com/package/@constructive-io/graphql-query) | 251,436 | 21,558 | 5,900 |
| [graphile-bucket-provisioner-plugin](https://www.npmjs.com/package/graphile-bucket-provisioner-plugin) | 249,316 | 37,602 | 9,577 |
| [@constructive-io/url-domains](https://www.npmjs.com/package/@constructive-io/url-domains) | 246,871 | 36,489 | 9,370 |
| [@constructive-io/bucket-provisioner](https://www.npmjs.com/package/@constructive-io/bucket-provisioner) | 241,897 | 36,882 | 9,381 |
| [@pgpmjs/migrate-client](https://www.npmjs.com/package/@pgpmjs/migrate-client) | 240,073 | 16,977 | 4,763 |
| [pgsql-seed](https://www.npmjs.com/package/pgsql-seed) | 207,324 | 32,003 | 8,181 |
| [@pgpmjs/export](https://www.npmjs.com/package/@pgpmjs/export) | 205,899 | 17,054 | 4,626 |
| [pgsql-client](https://www.npmjs.com/package/pgsql-client) | 205,770 | 31,786 | 7,860 |
| [@constructive-io/query-builder](https://www.npmjs.com/package/@constructive-io/query-builder) | 192,557 | 36,210 | 9,080 |
| [pg-seed](https://www.npmjs.com/package/pg-seed) | 180,330 | 29,287 | 7,295 |
| [@constructive-io/graphql-server](https://www.npmjs.com/package/@constructive-io/graphql-server) | 167,387 | 30,082 | 7,533 |
| [@pgpm/verify](https://www.npmjs.com/package/@pgpm/verify) | 160,764 | 5,683 | 1,174 |
| [pgpm](https://www.npmjs.com/package/pgpm) | 157,999 | 13,823 | 3,738 |
| [@pgpm/inflection](https://www.npmjs.com/package/@pgpm/inflection) | 144,549 | 3,397 | 742 |
| [@pgpm/types](https://www.npmjs.com/package/@pgpm/types) | 136,884 | 4,492 | 915 |
| [@pgpm/database-jobs](https://www.npmjs.com/package/@pgpm/database-jobs) | 132,048 | 3,575 | 673 |
| [@constructive-io/graphql-codegen](https://www.npmjs.com/package/@constructive-io/graphql-codegen) | 130,159 | 10,147 | 2,446 |
| [@constructive-io/fetch](https://www.npmjs.com/package/@constructive-io/fetch) | 116,296 | 20,583 | 5,659 |
| [@constructive-io/graphql-test](https://www.npmjs.com/package/@constructive-io/graphql-test) | 109,395 | 7,105 | 2,036 |
| [@pgpm/metaschema-schema](https://www.npmjs.com/package/@pgpm/metaschema-schema) | 106,403 | 3,154 | 556 |
| [@constructive-io/cli](https://www.npmjs.com/package/@constructive-io/cli) | 105,941 | 5,347 | 1,506 |
| [graphile-schema](https://www.npmjs.com/package/graphile-schema) | 96,013 | 8,947 | 2,654 |
| [@constructive-io/graphql-explorer](https://www.npmjs.com/package/@constructive-io/graphql-explorer) | 91,895 | 4,503 | 1,355 |
| [@pgpm/metaschema-modules](https://www.npmjs.com/package/@pgpm/metaschema-modules) | 91,575 | 2,974 | 513 |
| [@constructive-io/job-utils](https://www.npmjs.com/package/@constructive-io/job-utils) | 89,602 | 12,569 | 2,923 |
| [@inquirerer/test](https://www.npmjs.com/package/@inquirerer/test) | 89,554 | 1,077 | 240 |
| [@constructive-io/csrf](https://www.npmjs.com/package/@constructive-io/csrf) | 89,498 | 23,700 | 5,681 |
| [@constructive-io/job-pg](https://www.npmjs.com/package/@constructive-io/job-pg) | 87,893 | 12,427 | 2,864 |
| [@pgpm/services](https://www.npmjs.com/package/@pgpm/services) | 81,118 | 667 | 145 |
| [@constructive-io/sdk](https://www.npmjs.com/package/@constructive-io/sdk) | 72,402 | 9,826 | 2,718 |
| [constructive-test](https://www.npmjs.com/package/constructive-test) | 68,460 | 16,552 | 4,102 |
| [simple-smtp-server](https://www.npmjs.com/package/simple-smtp-server) | 59,152 | 3,128 | 645 |
| [@pyramation/args](https://www.npmjs.com/package/@pyramation/args) | 58,583 | 299 | 59 |
| [@pyramation/prompt](https://www.npmjs.com/package/@pyramation/prompt) | 58,389 | 339 | 73 |
| [@constructive-io/react](https://www.npmjs.com/package/@constructive-io/react) | 53,844 | 4,563 | 1,303 |
| [@pgpm/jwt-claims](https://www.npmjs.com/package/@pgpm/jwt-claims) | 51,750 | 4,770 | 827 |
| [graphql-server-test](https://www.npmjs.com/package/graphql-server-test) | 51,159 | 5,320 | 1,789 |
| [@constructive-io/knative-job-service](https://www.npmjs.com/package/@constructive-io/knative-job-service) | 50,680 | 145 | 46 |
| [@constructive-io/playwright-test](https://www.npmjs.com/package/@constructive-io/playwright-test) | 49,860 | 4,239 | 1,213 |
| [@constructive-io/job-scheduler](https://www.npmjs.com/package/@constructive-io/job-scheduler) | 48,157 | 227 | 52 |
| [@constructive-sdk/cli](https://www.npmjs.com/package/@constructive-sdk/cli) | 48,073 | 4,197 | 1,226 |
| [@pgpm/stamps](https://www.npmjs.com/package/@pgpm/stamps) | 47,938 | 4,070 | 707 |
| [@constructive-io/graphql-react](https://www.npmjs.com/package/@constructive-io/graphql-react) | 46,327 | 278 | 43 |
| [node-type-registry](https://www.npmjs.com/package/node-type-registry) | 42,576 | 6,203 | 1,654 |
| [insforge-test](https://www.npmjs.com/package/insforge-test) | 41,534 | 4,676 | 1,405 |
| [@pgpm/uuid](https://www.npmjs.com/package/@pgpm/uuid) | 39,966 | 1,786 | 322 |
| [@pgpm/base32](https://www.npmjs.com/package/@pgpm/base32) | 38,697 | 1,373 | 222 |
| [@constructive-io/knative-job-worker](https://www.npmjs.com/package/@constructive-io/knative-job-worker) | 38,576 | 137 | 41 |
| [@pgpm/utils](https://www.npmjs.com/package/@pgpm/utils) | 35,503 | 999 | 150 |
| [@constructive-io/upload-client](https://www.npmjs.com/package/@constructive-io/upload-client) | 35,056 | 3,010 | 694 |
| [graphile-sql-expression-validator](https://www.npmjs.com/package/graphile-sql-expression-validator) | 34,897 | 1,246 | 402 |
| [@pgpm/totp](https://www.npmjs.com/package/@pgpm/totp) | 34,741 | 1,051 | 171 |
| [@pgpm/faker](https://www.npmjs.com/package/@pgpm/faker) | 33,460 | 989 | 192 |
| [@constructive-io/postmaster](https://www.npmjs.com/package/@constructive-io/postmaster) | 32,682 | 258 | 46 |
| [docker-parser](https://www.npmjs.com/package/docker-parser) | 27,954 | 9,661 | 2,365 |
| [bash-ast](https://www.npmjs.com/package/bash-ast) | 27,873 | 9,708 | 2,365 |
| [@constructive-io/knative-job-server](https://www.npmjs.com/package/@constructive-io/knative-job-server) | 24,327 | 125 | 40 |
| [@constructive-io/ui](https://www.npmjs.com/package/@constructive-io/ui) | 22,168 | 909 | 213 |
| [@constructive-io/knative-job-fn](https://www.npmjs.com/package/@constructive-io/knative-job-fn) | 21,527 | 106 | 28 |
| [@pgpm/defaults](https://www.npmjs.com/package/@pgpm/defaults) | 20,237 | 2,177 | 388 |
| [@pgpm-testing/verify](https://www.npmjs.com/package/@pgpm-testing/verify) | 18,964 | 762 | 212 |
| [@pgpm-testing/base32](https://www.npmjs.com/package/@pgpm-testing/base32) | 18,595 | 757 | 210 |
| [@pyramation/postgis](https://www.npmjs.com/package/@pyramation/postgis) | 17,584 | 179 | 26 |
| [@constructive-io/send-email-link-fn](https://www.npmjs.com/package/@constructive-io/send-email-link-fn) | 14,496 | 29 | 16 |
| [@constructive-io/simple-email-fn](https://www.npmjs.com/package/@constructive-io/simple-email-fn) | 13,812 | 30 | 16 |
| [@constructive-io/node](https://www.npmjs.com/package/@constructive-io/node) | 13,789 | 158 | 43 |
| [graphile-many-to-many](https://www.npmjs.com/package/graphile-many-to-many) | 11,512 | 153 | 91 |
| [@pgpm/db-meta-schema](https://www.npmjs.com/package/@pgpm/db-meta-schema) | 11,330 | 185 | 62 |
| [@pgpm/db-meta-modules](https://www.npmjs.com/package/@pgpm/db-meta-modules) | 11,171 | 129 | 27 |
| [stream-to-etag](https://www.npmjs.com/package/stream-to-etag) | 10,685 | 81 | 20 |
| [@pgsql/cli](https://www.npmjs.com/package/@pgsql/cli) | 10,000 | 2,079 | 333 |
| [@pgpm/achievements](https://www.npmjs.com/package/@pgpm/achievements) | 9,717 | 1,064 | 141 |
| [@pgpm/geotypes](https://www.npmjs.com/package/@pgpm/geotypes) | 9,553 | 900 | 190 |
| [@pgpm/encrypted-secrets-table](https://www.npmjs.com/package/@pgpm/encrypted-secrets-table) | 9,141 | 656 | 96 |
| [@pgpm/jobs](https://www.npmjs.com/package/@pgpm/jobs) | 9,048 | 579 | 106 |
| [@constructive-io/job-worker](https://www.npmjs.com/package/@constructive-io/job-worker) | 9,002 | 64 | 21 |
| [@pgpm/measurements](https://www.npmjs.com/package/@pgpm/measurements) | 8,578 | 660 | 123 |
| [@pgpm/encrypted-secrets](https://www.npmjs.com/package/@pgpm/encrypted-secrets) | 8,573 | 547 | 164 |
| [pgsql-parse](https://www.npmjs.com/package/pgsql-parse) | 8,531 | 2,148 | 404 |
| [@pyramation/postgraphile](https://www.npmjs.com/package/@pyramation/postgraphile) | 7,484 | 187 | 11 |
| [@constructive-io/client](https://www.npmjs.com/package/@constructive-io/client) | 7,024 | 102 | 22 |
| [@pyramation/url-domains](https://www.npmjs.com/package/@pyramation/url-domains) | 6,814 | 172 | 10 |
| [@constructive-io/orm](https://www.npmjs.com/package/@constructive-io/orm) | 6,669 | 95 | 15 |
| [@constructive-io/oauth](https://www.npmjs.com/package/@constructive-io/oauth) | 5,876 | 137 | 21 |
| [@pgpm/ltree-helpers](https://www.npmjs.com/package/@pgpm/ltree-helpers) | 5,413 | 861 | 92 |
| [pgsql-types](https://www.npmjs.com/package/pgsql-types) | 5,145 | 1,621 | 226 |
| [@pgpm-testing/totp](https://www.npmjs.com/package/@pgpm-testing/totp) | 4,960 | 348 | 113 |
| [@pyramation/upload-names](https://www.npmjs.com/package/@pyramation/upload-names) | 4,826 | 172 | 5 |
| [@pgpm/default-roles](https://www.npmjs.com/package/@pgpm/default-roles) | 4,769 | 119 | 68 |
| [@pyramation/content-type-stream](https://www.npmjs.com/package/@pyramation/content-type-stream) | 4,767 | 167 | 6 |
| [plpgsql-parse](https://www.npmjs.com/package/plpgsql-parse) | 4,717 | 1,418 | 240 |
| [@pgpm-testing/utils](https://www.npmjs.com/package/@pgpm-testing/utils) | 4,506 | 173 | 53 |
| [@pyramation/s3-streamer](https://www.npmjs.com/package/@pyramation/s3-streamer) | 4,465 | 164 | 6 |
| [@pyramation/pg-query-context](https://www.npmjs.com/package/@pyramation/pg-query-context) | 4,287 | 134 | 3 |
| [coolir](https://www.npmjs.com/package/coolir) | 4,164 | 91 | 14 |
| [graphile-misc-plugins](https://www.npmjs.com/package/graphile-misc-plugins) | 3,971 | 30 | 18 |
| [webql-cli](https://www.npmjs.com/package/webql-cli) | 3,723 | 3 | 0 |
| [@pyramation/webql](https://www.npmjs.com/package/@pyramation/webql) | 3,421 | 22 | 15 |
| [@pyramation/graphql-ast](https://www.npmjs.com/package/@pyramation/graphql-ast) | 3,316 | 16 | 7 |
| [webql-db](https://www.npmjs.com/package/webql-db) | 3,042 | 12 | 2 |
| [@pyramation/stream-to-s3](https://www.npmjs.com/package/@pyramation/stream-to-s3) | 2,927 | 22 | 13 |
| [@pgpm/meta-db](https://www.npmjs.com/package/@pgpm/meta-db) | 2,743 | 34 | 20 |
| [@pgpm/meta-db-modules](https://www.npmjs.com/package/@pgpm/meta-db-modules) | 2,726 | 35 | 20 |
| [rego-deparser](https://www.npmjs.com/package/rego-deparser) | 2,404 | 479 | 141 |
| [graphile-pgvector-plugin](https://www.npmjs.com/package/graphile-pgvector-plugin) | 2,121 | 29 | 15 |
| [standalone-module](https://www.npmjs.com/package/standalone-module) | 1,982 | 22 | 2 |
| [@pyramation/rpc-server](https://www.npmjs.com/package/@pyramation/rpc-server) | 1,920 | 26 | 8 |
| [postgraphile-plugin-pgvector](https://www.npmjs.com/package/postgraphile-plugin-pgvector) | 1,687 | 29 | 6 |
| [@pyramation/postgraphile-upload-field](https://www.npmjs.com/package/@pyramation/postgraphile-upload-field) | 1,648 | 63 | 6 |
| [@constructive-io/command-palette](https://www.npmjs.com/package/@constructive-io/command-palette) | 1,642 | 100 | 38 |
| [graphile-pg-textsearch-plugin](https://www.npmjs.com/package/graphile-pg-textsearch-plugin) | 1,629 | 33 | 12 |
| [@launchql/knative-job-worker](https://www.npmjs.com/package/@launchql/knative-job-worker) | 1,549 | 31 | 13 |
| [@launchql/knative-job-service](https://www.npmjs.com/package/@launchql/knative-job-service) | 1,476 | 31 | 13 |
| [@constructive-io/seeder](https://www.npmjs.com/package/@constructive-io/seeder) | 1,375 | 21 | 8 |
| [tpsql](https://www.npmjs.com/package/tpsql) | 1,350 | 8 | 2 |
| [airscript](https://www.npmjs.com/package/airscript) | 1,332 | 17 | 3 |
| [@launchql/knative-job-server](https://www.npmjs.com/package/@launchql/knative-job-server) | 1,260 | 29 | 12 |
| [coolir-commander-utils](https://www.npmjs.com/package/coolir-commander-utils) | 1,210 | 23 | 8 |
| [@pyramation/docker-env](https://www.npmjs.com/package/@pyramation/docker-env) | 1,172 | 18 | 5 |
| [coolir-commander](https://www.npmjs.com/package/coolir-commander) | 1,162 | 17 | 5 |
| [@pyramation/s3-utils](https://www.npmjs.com/package/@pyramation/s3-utils) | 1,148 | 12 | 4 |
| [@pgpm/meta-db-test](https://www.npmjs.com/package/@pgpm/meta-db-test) | 1,131 | 29 | 16 |
| [@constructive-io/fetch-api-client](https://www.npmjs.com/package/@constructive-io/fetch-api-client) | 1,040 | 53 | 18 |
| [@constructive-io/http-errors](https://www.npmjs.com/package/@constructive-io/http-errors) | 1,020 | 26 | 10 |
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
| _Total_ | 5,835,118 | 85,922 | 21,009 |
| [@cosmology/protobufjs](https://www.npmjs.com/package/@cosmology/protobufjs) | 1,404,250 | 42,404 | 10,317 |
| [@protobufs/google](https://www.npmjs.com/package/@protobufs/google) | 615,877 | 5,361 | 1,388 |
| [@protobufs/gogoproto](https://www.npmjs.com/package/@protobufs/gogoproto) | 615,755 | 5,333 | 1,387 |
| [@protobufs/cosmos](https://www.npmjs.com/package/@protobufs/cosmos) | 598,619 | 5,401 | 1,401 |
| [@protobufs/cosmos_proto](https://www.npmjs.com/package/@protobufs/cosmos_proto) | 597,041 | 5,303 | 1,387 |
| [@protobufs/tendermint](https://www.npmjs.com/package/@protobufs/tendermint) | 591,920 | 5,296 | 1,398 |
| [@pyramation/protobufjs](https://www.npmjs.com/package/@pyramation/protobufjs) | 432,322 | 3,100 | 1,072 |
| [@protobufs/confio](https://www.npmjs.com/package/@protobufs/confio) | 235,907 | 3,266 | 583 |
| [@protobufs/ibc](https://www.npmjs.com/package/@protobufs/ibc) | 232,563 | 3,245 | 568 |
| [@protobufs/amino](https://www.npmjs.com/package/@protobufs/amino) | 227,323 | 2,807 | 554 |
| [@protobufs/cosmwasm](https://www.npmjs.com/package/@protobufs/cosmwasm) | 216,568 | 3,188 | 563 |
| [@protobufs/osmosis](https://www.npmjs.com/package/@protobufs/osmosis) | 30,426 | 677 | 199 |
| [@protobufs/juno](https://www.npmjs.com/package/@protobufs/juno) | 4,041 | 38 | 14 |
| [@protobufs/injective](https://www.npmjs.com/package/@protobufs/injective) | 3,747 | 12 | 4 |
| [@protobufs/akash](https://www.npmjs.com/package/@protobufs/akash) | 2,536 | 69 | 15 |
| [@protobufs/stargaze](https://www.npmjs.com/package/@protobufs/stargaze) | 2,230 | 51 | 14 |
| [@protobufs/regen](https://www.npmjs.com/package/@protobufs/regen) | 2,102 | 27 | 11 |
| [@protobufs/secret](https://www.npmjs.com/package/@protobufs/secret) | 2,037 | 29 | 15 |
| [@protobufs/bcna](https://www.npmjs.com/package/@protobufs/bcna) | 1,824 | 26 | 10 |
| [@protobufs/pylons](https://www.npmjs.com/package/@protobufs/pylons) | 1,747 | 26 | 11 |
| [@protobufs/comdex](https://www.npmjs.com/package/@protobufs/comdex) | 1,421 | 21 | 9 |
| [@protobufs/evmos](https://www.npmjs.com/package/@protobufs/evmos) | 1,235 | 14 | 8 |
| [@protobufs/axelar](https://www.npmjs.com/package/@protobufs/axelar) | 1,192 | 29 | 16 |
| *27 packages hidden (< 1,000 downloads)* | | | |

### chain-registry

| Name | Total | Monthly | Weekly |
| ------- | ------ | ------- | ----- |
| _Total_ | 16,444,176 | 496,020 | 99,916 |
| [@chain-registry/types](https://www.npmjs.com/package/@chain-registry/types) | 5,280,941 | 169,867 | 35,654 |
| [chain-registry](https://www.npmjs.com/package/chain-registry) | 2,610,135 | 54,434 | 10,221 |
| [@chain-registry/keplr](https://www.npmjs.com/package/@chain-registry/keplr) | 2,017,573 | 59,683 | 11,850 |
| [@chain-registry/utils](https://www.npmjs.com/package/@chain-registry/utils) | 1,768,010 | 61,084 | 12,203 |
| [@chain-registry/client](https://www.npmjs.com/package/@chain-registry/client) | 1,498,667 | 58,533 | 11,290 |
| [@chain-registry/cosmostation](https://www.npmjs.com/package/@chain-registry/cosmostation) | 1,399,375 | 17,387 | 3,468 |
| [@chain-registry/v2](https://www.npmjs.com/package/@chain-registry/v2) | 406,146 | 23,896 | 5,526 |
| [@chain-registry/v2-types](https://www.npmjs.com/package/@chain-registry/v2-types) | 380,086 | 20,995 | 5,595 |
| [@chain-registry/assets](https://www.npmjs.com/package/@chain-registry/assets) | 247,007 | 8,996 | 1,635 |
| [@chain-registry/osmosis](https://www.npmjs.com/package/@chain-registry/osmosis) | 208,258 | 8,388 | 512 |
| [@chain-registry/juno](https://www.npmjs.com/package/@chain-registry/juno) | 152,378 | 3,400 | 326 |
| [@chain-registry/interfaces](https://www.npmjs.com/package/@chain-registry/interfaces) | 101,773 | 2,692 | 503 |
| [@chain-registry/workflows](https://www.npmjs.com/package/@chain-registry/workflows) | 90,815 | 2,482 | 422 |
| [@chain-registry/cli](https://www.npmjs.com/package/@chain-registry/cli) | 88,332 | 2,371 | 387 |
| [@chain-registry/v2-keplr](https://www.npmjs.com/package/@chain-registry/v2-keplr) | 60,103 | 303 | 49 |
| [@chain-registry/v2-utils](https://www.npmjs.com/package/@chain-registry/v2-utils) | 49,342 | 802 | 138 |
| [@chain-registry/v2-client](https://www.npmjs.com/package/@chain-registry/v2-client) | 45,715 | 344 | 72 |
| [@chain-registry/v2-cosmostation](https://www.npmjs.com/package/@chain-registry/v2-cosmostation) | 39,520 | 363 | 65 |

### cosmos-kit

| Name | Total | Monthly | Weekly |
| ------- | ------ | ------- | ----- |
| _Total_ | 3,508,161 | 122,053 | 23,808 |
| [@cosmos-kit/core](https://www.npmjs.com/package/@cosmos-kit/core) | 1,356,636 | 45,476 | 9,382 |
| [@cosmos-kit/walletconnect](https://www.npmjs.com/package/@cosmos-kit/walletconnect) | 925,225 | 28,149 | 6,831 |
| [@cosmos-kit/react-lite](https://www.npmjs.com/package/@cosmos-kit/react-lite) | 565,753 | 24,111 | 3,762 |
| [@cosmos-kit/react](https://www.npmjs.com/package/@cosmos-kit/react) | 546,039 | 22,912 | 3,529 |
| [cosmos-kit](https://www.npmjs.com/package/cosmos-kit) | 114,508 | 1,405 | 304 |

### cosmos-kit-wallets

| Name | Total | Monthly | Weekly |
| ------- | ------ | ------- | ----- |
| _Total_ | 16,403,443 | 330,660 | 64,361 |
| [@cosmos-kit/keplr-extension](https://www.npmjs.com/package/@cosmos-kit/keplr-extension) | 898,462 | 28,666 | 6,962 |
| [@cosmos-kit/keplr](https://www.npmjs.com/package/@cosmos-kit/keplr) | 862,534 | 18,217 | 2,031 |
| [@cosmos-kit/keplr-mobile](https://www.npmjs.com/package/@cosmos-kit/keplr-mobile) | 850,616 | 27,777 | 6,655 |
| [@cosmos-kit/leap-extension](https://www.npmjs.com/package/@cosmos-kit/leap-extension) | 798,189 | 7,535 | 1,297 |
| [@cosmos-kit/leap](https://www.npmjs.com/package/@cosmos-kit/leap) | 764,433 | 6,086 | 1,095 |
| [@cosmos-kit/cosmostation-extension](https://www.npmjs.com/package/@cosmos-kit/cosmostation-extension) | 733,566 | 10,178 | 2,347 |
| [@cosmos-kit/leap-mobile](https://www.npmjs.com/package/@cosmos-kit/leap-mobile) | 719,318 | 6,303 | 1,126 |
| [@cosmos-kit/leap-metamask-cosmos-snap](https://www.npmjs.com/package/@cosmos-kit/leap-metamask-cosmos-snap) | 674,915 | 6,146 | 1,101 |
| [@cosmos-kit/cosmostation](https://www.npmjs.com/package/@cosmos-kit/cosmostation) | 666,307 | 4,917 | 931 |
| [@cosmos-kit/cosmostation-mobile](https://www.npmjs.com/package/@cosmos-kit/cosmostation-mobile) | 648,924 | 5,123 | 912 |
| [@cosmos-kit/okxwallet-extension](https://www.npmjs.com/package/@cosmos-kit/okxwallet-extension) | 556,180 | 18,159 | 4,673 |
| [@cosmos-kit/xdefi-extension](https://www.npmjs.com/package/@cosmos-kit/xdefi-extension) | 543,276 | 17,461 | 4,525 |
| [@cosmos-kit/trust](https://www.npmjs.com/package/@cosmos-kit/trust) | 525,521 | 10,895 | 852 |
| [@cosmos-kit/trust-mobile](https://www.npmjs.com/package/@cosmos-kit/trust-mobile) | 524,560 | 10,848 | 803 |
| [@cosmos-kit/station-extension](https://www.npmjs.com/package/@cosmos-kit/station-extension) | 518,778 | 17,795 | 4,613 |
| [@cosmos-kit/trust-extension](https://www.npmjs.com/package/@cosmos-kit/trust-extension) | 516,871 | 17,455 | 4,656 |
| [@cosmos-kit/station](https://www.npmjs.com/package/@cosmos-kit/station) | 511,611 | 10,503 | 738 |
| [@cosmos-kit/xdefi](https://www.npmjs.com/package/@cosmos-kit/xdefi) | 507,334 | 9,810 | 651 |
| [@cosmos-kit/okxwallet](https://www.npmjs.com/package/@cosmos-kit/okxwallet) | 457,153 | 9,779 | 605 |
| [@cosmos-kit/cdcwallet-extension](https://www.npmjs.com/package/@cosmos-kit/cdcwallet-extension) | 451,261 | 16,934 | 4,516 |
| [@cosmos-kit/cdcwallet](https://www.npmjs.com/package/@cosmos-kit/cdcwallet) | 445,710 | 9,556 | 631 |
| [@cosmos-kit/omni-mobile](https://www.npmjs.com/package/@cosmos-kit/omni-mobile) | 147,575 | 2,657 | 507 |
| [@cosmos-kit/omni](https://www.npmjs.com/package/@cosmos-kit/omni) | 143,455 | 2,630 | 505 |
| [@cosmos-kit/compass-extension](https://www.npmjs.com/package/@cosmos-kit/compass-extension) | 141,374 | 2,540 | 519 |
| [@cosmos-kit/ledger](https://www.npmjs.com/package/@cosmos-kit/ledger) | 138,519 | 2,532 | 489 |
| [@cosmos-kit/compass](https://www.npmjs.com/package/@cosmos-kit/compass) | 133,635 | 2,442 | 498 |
| [@cosmos-kit/fin-extension](https://www.npmjs.com/package/@cosmos-kit/fin-extension) | 128,877 | 2,127 | 434 |
| [@cosmos-kit/coin98](https://www.npmjs.com/package/@cosmos-kit/coin98) | 128,821 | 2,572 | 457 |
| [@cosmos-kit/coin98-extension](https://www.npmjs.com/package/@cosmos-kit/coin98-extension) | 127,831 | 2,592 | 458 |
| [@cosmos-kit/fin](https://www.npmjs.com/package/@cosmos-kit/fin) | 123,639 | 2,116 | 428 |
| [@cosmos-kit/exodus-extension](https://www.npmjs.com/package/@cosmos-kit/exodus-extension) | 122,467 | 2,330 | 479 |
| [@cosmos-kit/shell-extension](https://www.npmjs.com/package/@cosmos-kit/shell-extension) | 121,674 | 2,457 | 497 |
| [@cosmos-kit/exodus](https://www.npmjs.com/package/@cosmos-kit/exodus) | 120,152 | 2,232 | 482 |
| [@cosmos-kit/shell](https://www.npmjs.com/package/@cosmos-kit/shell) | 119,473 | 2,339 | 461 |
| [@cosmos-kit/vectis](https://www.npmjs.com/package/@cosmos-kit/vectis) | 113,922 | 1,886 | 284 |
| [@cosmos-kit/vectis-extension](https://www.npmjs.com/package/@cosmos-kit/vectis-extension) | 110,877 | 1,908 | 302 |
| [@cosmos-kit/owallet](https://www.npmjs.com/package/@cosmos-kit/owallet) | 98,382 | 1,621 | 395 |
| [@cosmos-kit/owallet-extension](https://www.npmjs.com/package/@cosmos-kit/owallet-extension) | 98,336 | 1,610 | 385 |
| [@cosmos-kit/tailwind-extension](https://www.npmjs.com/package/@cosmos-kit/tailwind-extension) | 93,706 | 1,490 | 344 |
| [@cosmos-kit/tailwind](https://www.npmjs.com/package/@cosmos-kit/tailwind) | 93,472 | 1,517 | 348 |
| [@cosmos-kit/frontier-extension](https://www.npmjs.com/package/@cosmos-kit/frontier-extension) | 92,289 | 1,615 | 265 |
| [@cosmos-kit/frontier](https://www.npmjs.com/package/@cosmos-kit/frontier) | 90,701 | 1,604 | 269 |
| [@cosmos-kit/cosmos-extension-metamask](https://www.npmjs.com/package/@cosmos-kit/cosmos-extension-metamask) | 85,124 | 2,371 | 487 |
| [@cosmos-kit/galaxy-station-extension](https://www.npmjs.com/package/@cosmos-kit/galaxy-station-extension) | 70,284 | 1,304 | 326 |
| [@cosmos-kit/galaxy-station](https://www.npmjs.com/package/@cosmos-kit/galaxy-station) | 70,191 | 1,319 | 326 |
| [@cosmos-kit/owallet-mobile](https://www.npmjs.com/package/@cosmos-kit/owallet-mobile) | 59,900 | 1,233 | 323 |
| [@cosmos-kit/web3auth](https://www.npmjs.com/package/@cosmos-kit/web3auth) | 50,092 | 1,613 | 253 |
| [@cosmos-kit/ctrl-extension](https://www.npmjs.com/package/@cosmos-kit/ctrl-extension) | 46,664 | 1,130 | 272 |
| [@cosmos-kit/ctrl](https://www.npmjs.com/package/@cosmos-kit/ctrl) | 46,354 | 1,132 | 276 |
| [@cosmos-kit/okto-extension](https://www.npmjs.com/package/@cosmos-kit/okto-extension) | 43,181 | 35 | 13 |
| [@cosmos-kit/galaxy-station-mobile](https://www.npmjs.com/package/@cosmos-kit/galaxy-station-mobile) | 39,668 | 910 | 245 |
| [@cosmos-kit/imtoken-extension](https://www.npmjs.com/package/@cosmos-kit/imtoken-extension) | 17,755 | 46 | 17 |
| [@cosmos-kit/imtoken](https://www.npmjs.com/package/@cosmos-kit/imtoken) | 17,518 | 46 | 16 |
| [@cosmos-kit/ninji-extension](https://www.npmjs.com/package/@cosmos-kit/ninji-extension) | 17,395 | 248 | 44 |
| [@cosmos-kit/ninji](https://www.npmjs.com/package/@cosmos-kit/ninji) | 16,120 | 310 | 89 |
| [@cosmos-kit/bitgetwallet-extension](https://www.npmjs.com/package/@cosmos-kit/bitgetwallet-extension) | 15,708 | 395 | 106 |
| [@cosmos-kit/ins](https://www.npmjs.com/package/@cosmos-kit/ins) | 14,338 | 116 | 18 |
| [@cosmos-kit/leap-capsule-social-login](https://www.npmjs.com/package/@cosmos-kit/leap-capsule-social-login) | 13,696 | 100 | 18 |
| [@cosmos-kit/initia-extension](https://www.npmjs.com/package/@cosmos-kit/initia-extension) | 9,533 | 159 | 37 |
| [@cosmos-kit/initia](https://www.npmjs.com/package/@cosmos-kit/initia) | 8,867 | 129 | 26 |
| [@cosmos-kit/walletconnect-v1](https://www.npmjs.com/package/@cosmos-kit/walletconnect-v1) | 7,782 | 188 | 24 |
| [@cosmos-wallet/react](https://www.npmjs.com/package/@cosmos-wallet/react) | 7,198 | 106 | 32 |
| [@cosmos-wallet/core](https://www.npmjs.com/package/@cosmos-wallet/core) | 6,592 | 215 | 134 |
| [@cosmos-kit/gatewallet-extension](https://www.npmjs.com/package/@cosmos-kit/gatewallet-extension) | 6,351 | 270 | 93 |
| [@cosmos-kit/types](https://www.npmjs.com/package/@cosmos-kit/types) | 4,956 | 57 | 4 |
| [@cosmos-wallet/keplr](https://www.npmjs.com/package/@cosmos-wallet/keplr) | 4,618 | 115 | 61 |
| [@cosmos-wallet/registry](https://www.npmjs.com/package/@cosmos-wallet/registry) | 4,561 | 112 | 65 |
| [@cosmos-wallet/types](https://www.npmjs.com/package/@cosmos-wallet/types) | 4,521 | 55 | 22 |
| [@cosmos-kit/registry](https://www.npmjs.com/package/@cosmos-kit/registry) | 4,220 | 129 | 28 |
| [@cosmos-kit/config](https://www.npmjs.com/package/@cosmos-kit/config) | 3,968 | 43 | 9 |
| [@cosmos-kit/arculus-mobile](https://www.npmjs.com/package/@cosmos-kit/arculus-mobile) | 3,393 | 236 | 82 |
| [@cosmos-kit/walletconnect-v2](https://www.npmjs.com/package/@cosmos-kit/walletconnect-v2) | 3,309 | 83 | 15 |
| [@cosmos-kit/arculus](https://www.npmjs.com/package/@cosmos-kit/arculus) | 3,291 | 230 | 82 |
| [@cosmos-kit/aria-extension](https://www.npmjs.com/package/@cosmos-kit/aria-extension) | 2,897 | 77 | 18 |
| [@cosmos-kit/prax-extension](https://www.npmjs.com/package/@cosmos-kit/prax-extension) | 2,810 | 42 | 13 |
| [@cosmos-kit/wallets](https://www.npmjs.com/package/@cosmos-kit/wallets) | 2,695 | 53 | 7 |
| [@cosmos-kit/gatewallet](https://www.npmjs.com/package/@cosmos-kit/gatewallet) | 2,582 | 46 | 14 |
| [@cosmos-kit/terrastation-extension](https://www.npmjs.com/package/@cosmos-kit/terrastation-extension) | 2,433 | 39 | 9 |
| [@cosmos-kit/terrastation](https://www.npmjs.com/package/@cosmos-kit/terrastation) | 2,404 | 61 | 13 |
| [@cosmos-kit/aria-mobile](https://www.npmjs.com/package/@cosmos-kit/aria-mobile) | 2,018 | 44 | 12 |
| [@cosmos-kit/aria](https://www.npmjs.com/package/@cosmos-kit/aria) | 1,939 | 64 | 17 |
| [@cosmos-kit/bitgetwallet](https://www.npmjs.com/package/@cosmos-kit/bitgetwallet) | 1,756 | 59 | 21 |
| [@cosmos-kit/figure-markets-mobile](https://www.npmjs.com/package/@cosmos-kit/figure-markets-mobile) | 1,543 | 23 | 14 |
| [@cosmos-kit/foxwallet-extension](https://www.npmjs.com/package/@cosmos-kit/foxwallet-extension) | 1,537 | 125 | 17 |
| [@cosmos-kit/vultisig-extension](https://www.npmjs.com/package/@cosmos-kit/vultisig-extension) | 1,513 | 292 | 52 |
| [@cosmos-kit/foxwallet](https://www.npmjs.com/package/@cosmos-kit/foxwallet) | 1,455 | 59 | 12 |
| [@cosmos-kit/figure-markets](https://www.npmjs.com/package/@cosmos-kit/figure-markets) | 1,452 | 37 | 13 |
| [@cosmos-kit/vultisig](https://www.npmjs.com/package/@cosmos-kit/vultisig) | 1,332 | 202 | 51 |
| *2 packages hidden (< 1,000 downloads)* | | | |

### telescope

| Name | Total | Monthly | Weekly |
| ------- | ------ | ------- | ----- |
| _Total_ | 15,165,911 | 564,838 | 146,759 |
| [@osmonauts/lcd](https://www.npmjs.com/package/@osmonauts/lcd) | 5,514,646 | 349,133 | 92,606 |
| [@cosmology/types](https://www.npmjs.com/package/@cosmology/types) | 1,243,129 | 40,461 | 10,030 |
| [@cosmology/utils](https://www.npmjs.com/package/@cosmology/utils) | 1,242,821 | 40,353 | 10,024 |
| [@cosmology/proto-parser](https://www.npmjs.com/package/@cosmology/proto-parser) | 1,210,758 | 40,312 | 10,024 |
| [@cosmology/lcd](https://www.npmjs.com/package/@cosmology/lcd) | 1,046,738 | 13,428 | 2,888 |
| [@cosmology/ast](https://www.npmjs.com/package/@cosmology/ast) | 940,027 | 25,606 | 6,125 |
| [@osmonauts/helpers](https://www.npmjs.com/package/@osmonauts/helpers) | 804,151 | 15,840 | 3,930 |
| [@cosmology/telescope](https://www.npmjs.com/package/@cosmology/telescope) | 799,603 | 20,521 | 5,339 |
| [@osmonauts/telescope](https://www.npmjs.com/package/@osmonauts/telescope) | 494,928 | 3,640 | 1,127 |
| [@osmonauts/ast](https://www.npmjs.com/package/@osmonauts/ast) | 477,488 | 4,193 | 1,230 |
| [@osmonauts/proto-parser](https://www.npmjs.com/package/@osmonauts/proto-parser) | 473,804 | 3,683 | 1,098 |
| [@osmonauts/types](https://www.npmjs.com/package/@osmonauts/types) | 469,973 | 3,738 | 1,137 |
| [@osmonauts/utils](https://www.npmjs.com/package/@osmonauts/utils) | 447,845 | 3,930 | 1,201 |

### cosmwasm

| Name | Total | Monthly | Weekly |
| ------- | ------ | ------- | ----- |
| _Total_ | 3,736,787 | 75,492 | 18,169 |
| [@cosmwasm/ts-codegen](https://www.npmjs.com/package/@cosmwasm/ts-codegen) | 1,776,624 | 34,205 | 8,280 |
| [wasm-ast-types](https://www.npmjs.com/package/wasm-ast-types) | 1,635,602 | 27,886 | 7,015 |
| [@cosmwasm/ts-codegen-types](https://www.npmjs.com/package/@cosmwasm/ts-codegen-types) | 146,022 | 6,230 | 1,340 |
| [@cosmwasm/ts-codegen-ast](https://www.npmjs.com/package/@cosmwasm/ts-codegen-ast) | 142,514 | 6,533 | 1,424 |
| [cosmwasm-typescript-gen](https://www.npmjs.com/package/cosmwasm-typescript-gen) | 23,321 | 257 | 29 |
| [@cosmjson/wasmswap](https://www.npmjs.com/package/@cosmjson/wasmswap) | 2,982 | 83 | 14 |
| [@cosmjson/stargaze-minter](https://www.npmjs.com/package/@cosmjson/stargaze-minter) | 1,266 | 38 | 6 |
| [@cosmjson/stargaze-sg721](https://www.npmjs.com/package/@cosmjson/stargaze-sg721) | 1,236 | 34 | 7 |
| *13 packages hidden (< 1,000 downloads)* | | | |

### interchain-js

| Name | Total | Monthly | Weekly |
| ------- | ------ | ------- | ----- |
| _Total_ | 3,513,330 | 223,268 | 64,672 |
| [@interchainjs/auth](https://www.npmjs.com/package/@interchainjs/auth) | 367,380 | 20,527 | 5,935 |
| [@interchainjs/utils](https://www.npmjs.com/package/@interchainjs/utils) | 343,740 | 20,164 | 5,859 |
| [@interchainjs/types](https://www.npmjs.com/package/@interchainjs/types) | 341,500 | 19,638 | 5,698 |
| [@interchainjs/math](https://www.npmjs.com/package/@interchainjs/math) | 309,402 | 19,559 | 5,667 |
| [@interchainjs/crypto](https://www.npmjs.com/package/@interchainjs/crypto) | 305,452 | 19,856 | 5,793 |
| [@interchainjs/encoding](https://www.npmjs.com/package/@interchainjs/encoding) | 303,500 | 19,484 | 5,649 |
| [@interchainjs/cosmos-types](https://www.npmjs.com/package/@interchainjs/cosmos-types) | 300,167 | 20,344 | 5,789 |
| [@interchainjs/cosmos](https://www.npmjs.com/package/@interchainjs/cosmos) | 298,078 | 20,999 | 5,915 |
| [@interchainjs/amino](https://www.npmjs.com/package/@interchainjs/amino) | 266,909 | 19,658 | 5,715 |
| [@interchainjs/pubkey](https://www.npmjs.com/package/@interchainjs/pubkey) | 266,154 | 19,890 | 5,854 |
| [interchainjs](https://www.npmjs.com/package/interchainjs) | 207,653 | 7,800 | 2,444 |
| [@interchainjs/ethereum](https://www.npmjs.com/package/@interchainjs/ethereum) | 76,385 | 7,127 | 2,266 |
| [injectivejs](https://www.npmjs.com/package/injectivejs) | 22,791 | 1,011 | 269 |
| [@interchainjs/injective](https://www.npmjs.com/package/@interchainjs/injective) | 20,643 | 746 | 191 |
| [@interchainjs/react](https://www.npmjs.com/package/@interchainjs/react) | 13,159 | 382 | 40 |
| [@interchainjs/solana](https://www.npmjs.com/package/@interchainjs/solana) | 12,573 | 2,370 | 530 |
| [injective-react](https://www.npmjs.com/package/injective-react) | 11,704 | 810 | 266 |
| [injective-vue](https://www.npmjs.com/package/injective-vue) | 10,596 | 755 | 241 |
| [@interchainjs/vue](https://www.npmjs.com/package/@interchainjs/vue) | 9,962 | 660 | 156 |
| [interchain-rpc](https://www.npmjs.com/package/interchain-rpc) | 7,983 | 792 | 129 |
| [interchain46](https://www.npmjs.com/package/interchain46) | 2,366 | 120 | 35 |
| [interchain-react](https://www.npmjs.com/package/interchain-react) | 1,649 | 59 | 27 |
| [@interchainjs/ethermint](https://www.npmjs.com/package/@interchainjs/ethermint) | 1,621 | 56 | 17 |
| [interchain-vue](https://www.npmjs.com/package/interchain-vue) | 1,187 | 40 | 22 |
| [interchain-lcd](https://www.npmjs.com/package/interchain-lcd) | 1,018 | 21 | 10 |
| *23 packages hidden (< 1,000 downloads)* | | | |

### hyperwebjs

| Name | Total | Monthly | Weekly |
| ------- | ------ | ------- | ----- |
| _Total_ | 59,719 | 5,715 | 906 |
| [@hyperweb/telescope](https://www.npmjs.com/package/@hyperweb/telescope) | 45,204 | 4,877 | 593 |
| [hyperwebjs](https://www.npmjs.com/package/hyperwebjs) | 5,190 | 386 | 167 |
| [@hyperweb/build](https://www.npmjs.com/package/@hyperweb/build) | 3,287 | 113 | 41 |
| [@hyperweb/mcp-server](https://www.npmjs.com/package/@hyperweb/mcp-server) | 1,375 | 127 | 47 |
| [create-hyperweb-app](https://www.npmjs.com/package/create-hyperweb-app) | 1,373 | 69 | 11 |
| [@hyperweb/parse](https://www.npmjs.com/package/@hyperweb/parse) | 1,236 | 27 | 9 |
| *5 packages hidden (< 1,000 downloads)* | | | |

### interchain-kit

| Name | Total | Monthly | Weekly |
| ------- | ------ | ------- | ----- |
| _Total_ | 218,901 | 13,492 | 5,089 |
| [@interchain-kit/core](https://www.npmjs.com/package/@interchain-kit/core) | 139,440 | 7,544 | 3,111 |
| [@interchain-kit/react](https://www.npmjs.com/package/@interchain-kit/react) | 49,665 | 2,280 | 492 |
| [interchain-kit](https://www.npmjs.com/package/interchain-kit) | 16,892 | 451 | 157 |
| [@interchain-kit/vue](https://www.npmjs.com/package/@interchain-kit/vue) | 12,904 | 3,217 | 1,329 |

### interchain-kit-wallets

| Name | Total | Monthly | Weekly |
| ------- | ------ | ------- | ----- |
| _Total_ | 521,829 | 18,280 | 5,006 |
| [@interchain-kit/keplr-extension](https://www.npmjs.com/package/@interchain-kit/keplr-extension) | 92,079 | 4,760 | 1,729 |
| [@interchain-kit/leap-extension](https://www.npmjs.com/package/@interchain-kit/leap-extension) | 76,181 | 4,403 | 1,651 |
| [@interchain-kit/okx-extension](https://www.npmjs.com/package/@interchain-kit/okx-extension) | 65,162 | 381 | 44 |
| [@interchain-kit/cosmostation-extension](https://www.npmjs.com/package/@interchain-kit/cosmostation-extension) | 25,888 | 1,700 | 356 |
| [@interchain-kit/store](https://www.npmjs.com/package/@interchain-kit/store) | 21,028 | 2,176 | 438 |
| [@interchain-kit/keplr-mobile](https://www.npmjs.com/package/@interchain-kit/keplr-mobile) | 18,832 | 404 | 44 |
| [@interchain-kit/cosmos-extension-metamask](https://www.npmjs.com/package/@interchain-kit/cosmos-extension-metamask) | 17,609 | 213 | 80 |
| [@interchain-kit/leap-mobile](https://www.npmjs.com/package/@interchain-kit/leap-mobile) | 17,584 | 143 | 37 |
| [@interchain-kit/coin98-extension](https://www.npmjs.com/package/@interchain-kit/coin98-extension) | 17,456 | 549 | 32 |
| [@interchain-kit/ledger](https://www.npmjs.com/package/@interchain-kit/ledger) | 16,300 | 369 | 37 |
| [@interchain-kit/mock-wallet](https://www.npmjs.com/package/@interchain-kit/mock-wallet) | 14,830 | 112 | 25 |
| [@interchain-kit/frontier-extension](https://www.npmjs.com/package/@interchain-kit/frontier-extension) | 14,611 | 176 | 33 |
| [@interchain-kit/leap-cosmos-extension-metamask](https://www.npmjs.com/package/@interchain-kit/leap-cosmos-extension-metamask) | 14,401 | 245 | 75 |
| [@interchain-kit/station-extension](https://www.npmjs.com/package/@interchain-kit/station-extension) | 14,390 | 329 | 35 |
| [@interchain-kit/galaxy-station-extension](https://www.npmjs.com/package/@interchain-kit/galaxy-station-extension) | 14,063 | 173 | 35 |
| [@interchain-kit/trust-extension](https://www.npmjs.com/package/@interchain-kit/trust-extension) | 12,943 | 352 | 40 |
| [@interchain-kit/xdefi-extension](https://www.npmjs.com/package/@interchain-kit/xdefi-extension) | 11,396 | 267 | 32 |
| [@interchain-kit/compass-extension](https://www.npmjs.com/package/@interchain-kit/compass-extension) | 9,371 | 291 | 35 |
| [@interchain-kit/metamask-extension](https://www.npmjs.com/package/@interchain-kit/metamask-extension) | 9,234 | 249 | 32 |
| [@interchain-kit/fin-extension](https://www.npmjs.com/package/@interchain-kit/fin-extension) | 8,255 | 106 | 28 |
| [@interchain-kit/exodus-extension](https://www.npmjs.com/package/@interchain-kit/exodus-extension) | 7,804 | 187 | 27 |
| [@interchain-kit/ninji-extension](https://www.npmjs.com/package/@interchain-kit/ninji-extension) | 6,487 | 181 | 34 |
| [@interchain-kit/shell-extension](https://www.npmjs.com/package/@interchain-kit/shell-extension) | 6,221 | 99 | 26 |
| [@interchain-kit/phantom-extension](https://www.npmjs.com/package/@interchain-kit/phantom-extension) | 3,210 | 147 | 31 |
| [@interchain-kit/backpack-extension](https://www.npmjs.com/package/@interchain-kit/backpack-extension) | 2,339 | 95 | 26 |
| [@interchain-kit/vultisig-extension](https://www.npmjs.com/package/@interchain-kit/vultisig-extension) | 2,094 | 82 | 21 |
| [@interchain-kit/solflare-extension](https://www.npmjs.com/package/@interchain-kit/solflare-extension) | 2,061 | 91 | 23 |

### interchain-ui

| Name | Total | Monthly | Weekly |
| ------- | ------ | ------- | ----- |
| _Total_ | 580,393 | 31,387 | 6,234 |
| [@interchain-ui/react](https://www.npmjs.com/package/@interchain-ui/react) | 548,790 | 27,790 | 4,695 |
| [@interchain-ui/vue](https://www.npmjs.com/package/@interchain-ui/vue) | 17,091 | 3,031 | 1,349 |
| [@interchain-ui/react-no-ssr](https://www.npmjs.com/package/@interchain-ui/react-no-ssr) | 12,303 | 526 | 172 |
| [@interweb-ui/cli](https://www.npmjs.com/package/@interweb-ui/cli) | 1,042 | 18 | 10 |
| *2 packages hidden (< 1,000 downloads)* | | | |

### osmosis

| Name | Total | Monthly | Weekly |
| ------- | ------ | ------- | ----- |
| _Total_ | 937,489 | 18,079 | 3,706 |
| [osmojs](https://www.npmjs.com/package/osmojs) | 796,813 | 15,833 | 3,226 |
| [osmo-query](https://www.npmjs.com/package/osmo-query) | 60,978 | 1,306 | 225 |
| [@osmonauts/math](https://www.npmjs.com/package/@osmonauts/math) | 42,960 | 400 | 58 |
| [@osmosis-labs/math](https://www.npmjs.com/package/@osmosis-labs/math) | 14,514 | 107 | 44 |
| [@osmosis-labs/pools](https://www.npmjs.com/package/@osmosis-labs/pools) | 8,365 | 102 | 56 |
| [@osmosis-labs/proto-codecs](https://www.npmjs.com/package/@osmosis-labs/proto-codecs) | 4,936 | 31 | 15 |
| [@osmosis-labs/stores](https://www.npmjs.com/package/@osmosis-labs/stores) | 4,905 | 102 | 33 |
| [osmojs-rc](https://www.npmjs.com/package/osmojs-rc) | 1,396 | 124 | 33 |
| *6 packages hidden (< 1,000 downloads)* | | | |

### starship

| Name | Total | Monthly | Weekly |
| ------- | ------ | ------- | ----- |
| _Total_ | 157,389 | 15,233 | 1,377 |
| [@starship-ci/client](https://www.npmjs.com/package/@starship-ci/client) | 50,404 | 4,553 | 451 |
| [@starship-ci/cli](https://www.npmjs.com/package/@starship-ci/cli) | 48,399 | 4,496 | 438 |
| [starshipjs](https://www.npmjs.com/package/starshipjs) | 47,624 | 4,201 | 353 |
| [@starship-ci/types](https://www.npmjs.com/package/@starship-ci/types) | 9,803 | 1,903 | 107 |
| [@starship-ci/generator](https://www.npmjs.com/package/@starship-ci/generator) | 1,159 | 80 | 28 |

### cosmology

| Name | Total | Monthly | Weekly |
| ------- | ------ | ------- | ----- |
| _Total_ | 567,690 | 14,417 | 2,869 |
| [interchain](https://www.npmjs.com/package/interchain) | 104,570 | 1,379 | 293 |
| [@cosmology/core](https://www.npmjs.com/package/@cosmology/core) | 59,162 | 1,954 | 243 |
| [cosmjs-utils](https://www.npmjs.com/package/cosmjs-utils) | 53,729 | 977 | 191 |
| [@cosmology/cli](https://www.npmjs.com/package/@cosmology/cli) | 43,376 | 1,094 | 121 |
| [cosmology](https://www.npmjs.com/package/cosmology) | 40,427 | 2,219 | 87 |
| [@cosmology-ui/react](https://www.npmjs.com/package/@cosmology-ui/react) | 32,344 | 248 | 54 |
| [@cosmology-ui/utils](https://www.npmjs.com/package/@cosmology-ui/utils) | 26,502 | 201 | 37 |
| [interchain-query](https://www.npmjs.com/package/interchain-query) | 23,595 | 614 | 227 |
| [thorchain](https://www.npmjs.com/package/thorchain) | 14,229 | 481 | 207 |
| [@cosmonauts/osmosis](https://www.npmjs.com/package/@cosmonauts/osmosis) | 9,317 | 339 | 23 |
| [@cosmonauts/telescope](https://www.npmjs.com/package/@cosmonauts/telescope) | 9,298 | 46 | 14 |
| [@osmonauts/osmosis](https://www.npmjs.com/package/@osmonauts/osmosis) | 6,857 | 560 | 73 |
| [@osmonauts/babel](https://www.npmjs.com/package/@osmonauts/babel) | 6,373 | 334 | 99 |
| [create-cosmwasm-app](https://www.npmjs.com/package/create-cosmwasm-app) | 6,182 | 74 | 14 |
| [@cosmology/cosmos-registry](https://www.npmjs.com/package/@cosmology/cosmos-registry) | 5,997 | 288 | 86 |
| [@pyramation/crypto-keys](https://www.npmjs.com/package/@pyramation/crypto-keys) | 5,772 | 164 | 19 |
| [@pyramation/crypto-coins](https://www.npmjs.com/package/@pyramation/crypto-coins) | 4,886 | 134 | 6 |
| [@pyramation/crypto-networks](https://www.npmjs.com/package/@pyramation/crypto-networks) | 4,558 | 140 | 4 |
| [stargaze-zone](https://www.npmjs.com/package/stargaze-zone) | 4,326 | 61 | 8 |
| [dydx](https://www.npmjs.com/package/dydx) | 3,500 | 16 | 5 |
| [cosmscript](https://www.npmjs.com/package/cosmscript) | 3,487 | 50 | 14 |
| [@cosmology-ui/chain-dropdown](https://www.npmjs.com/package/@cosmology-ui/chain-dropdown) | 3,219 | 40 | 13 |
| [@cosmology-ui/theme](https://www.npmjs.com/package/@cosmology-ui/theme) | 3,218 | 39 | 12 |
| [@osmonauts/ast-gen](https://www.npmjs.com/package/@osmonauts/ast-gen) | 3,175 | 107 | 15 |
| [@cosmology-ui/connect-modal](https://www.npmjs.com/package/@cosmology-ui/connect-modal) | 3,160 | 37 | 14 |
| [@cosmology-ui/buttons](https://www.npmjs.com/package/@cosmology-ui/buttons) | 3,141 | 34 | 13 |
| [@cosmology-ui/copy-address-button](https://www.npmjs.com/package/@cosmology-ui/copy-address-button) | 3,139 | 33 | 14 |
| [@cosmology-ui/base](https://www.npmjs.com/package/@cosmology-ui/base) | 3,071 | 34 | 14 |
| [@cosmology-ui/animation](https://www.npmjs.com/package/@cosmology-ui/animation) | 3,045 | 34 | 14 |
| [@pyramation/crypto-cli](https://www.npmjs.com/package/@pyramation/crypto-cli) | 2,907 | 40 | 14 |
| [@cosmology-ui/swap](https://www.npmjs.com/package/@cosmology-ui/swap) | 2,787 | 63 | 15 |
| [@cosmonauts/ast-gen](https://www.npmjs.com/package/@cosmonauts/ast-gen) | 2,448 | 29 | 13 |
| [badkidsjs](https://www.npmjs.com/package/badkidsjs) | 2,416 | 63 | 13 |
| [@cosmonauts/protobuf](https://www.npmjs.com/package/@cosmonauts/protobuf) | 2,316 | 26 | 17 |
| [@cosmology/react](https://www.npmjs.com/package/@cosmology/react) | 1,927 | 30 | 11 |
| [dexmos](https://www.npmjs.com/package/dexmos) | 1,889 | 29 | 10 |
| [@pyramation/cosmos-registry](https://www.npmjs.com/package/@pyramation/cosmos-registry) | 1,836 | 23 | 13 |
| [@cosmology/protobufs](https://www.npmjs.com/package/@cosmology/protobufs) | 1,826 | 90 | 28 |
| [@uni-sign/cosmos-msgs](https://www.npmjs.com/package/@uni-sign/cosmos-msgs) | 1,700 | 121 | 48 |
| [@cosmology/ts-codegen-types](https://www.npmjs.com/package/@cosmology/ts-codegen-types) | 1,654 | 64 | 26 |
| [chain-registry-utils](https://www.npmjs.com/package/chain-registry-utils) | 1,574 | 31 | 14 |
| [@uni-sign/types](https://www.npmjs.com/package/@uni-sign/types) | 1,524 | 98 | 56 |
| [@cosmology/cosmjs](https://www.npmjs.com/package/@cosmology/cosmjs) | 1,483 | 141 | 48 |
| [@uni-sign/cosmos](https://www.npmjs.com/package/@uni-sign/cosmos) | 1,477 | 117 | 50 |
| [@uni-sign/cosmos-query](https://www.npmjs.com/package/@uni-sign/cosmos-query) | 1,467 | 99 | 34 |
| [cosmoscript](https://www.npmjs.com/package/cosmoscript) | 1,438 | 46 | 9 |
| [mesh-security](https://www.npmjs.com/package/mesh-security) | 1,407 | 29 | 11 |
| [@uni-sign/utils](https://www.npmjs.com/package/@uni-sign/utils) | 1,406 | 74 | 43 |
| [teslapi](https://www.npmjs.com/package/teslapi) | 1,360 | 23 | 8 |
| [@cosmonauts/cosmos](https://www.npmjs.com/package/@cosmonauts/cosmos) | 1,308 | 87 | 17 |
| [teritorijs](https://www.npmjs.com/package/teritorijs) | 1,221 | 93 | 27 |
| [teritori](https://www.npmjs.com/package/teritori) | 1,091 | 78 | 22 |
| [cpbf](https://www.npmjs.com/package/cpbf) | 1,084 | 22 | 7 |
| [@uni-sign/auth](https://www.npmjs.com/package/@uni-sign/auth) | 1,028 | 46 | 20 |
| *55 packages hidden (< 1,000 downloads)* | | | |

### stride

| Name | Total | Monthly | Weekly |
| ------- | ------ | ------- | ----- |
| _Total_ | 38,540 | 697 | 208 |
| [stridejs](https://www.npmjs.com/package/stridejs) | 38,540 | 697 | 208 |

### juno

| Name | Total | Monthly | Weekly |
| ------- | ------ | ------- | ----- |
| _Total_ | 48,091 | 1,059 | 289 |
| [juno-network](https://www.npmjs.com/package/juno-network) | 39,205 | 764 | 150 |
| [@juno-network/assets](https://www.npmjs.com/package/@juno-network/assets) | 8,886 | 295 | 139 |

### stargaze

| Name | Total | Monthly | Weekly |
| ------- | ------ | ------- | ----- |
| _Total_ | 35,181 | 747 | 257 |
| [stargazejs](https://www.npmjs.com/package/stargazejs) | 23,255 | 441 | 98 |
| [@stargaze-zone/contracts](https://www.npmjs.com/package/@stargaze-zone/contracts) | 4,913 | 100 | 37 |
| [@stargaze-zone/chain](https://www.npmjs.com/package/@stargaze-zone/chain) | 4,467 | 120 | 80 |
| [stargaze-query](https://www.npmjs.com/package/stargaze-query) | 2,546 | 86 | 42 |

### dydx

| Name | Total | Monthly | Weekly |
| ------- | ------ | ------- | ----- |
| _Total_ | 4,038,008 | 323,630 | 86,394 |
| [@dydxprotocol/v4-client-js](https://www.npmjs.com/package/@dydxprotocol/v4-client-js) | 4,038,008 | 323,630 | 86,394 |

### chain

| Name | Total | Monthly | Weekly |
| ------- | ------ | ------- | ----- |
| _Total_ | 14,105 | 437 | 174 |
| [@juno-network/swap](https://www.npmjs.com/package/@juno-network/swap) | 4,977 | 293 | 130 |
| [akashjs](https://www.npmjs.com/package/akashjs) | 4,107 | 40 | 15 |
| [autosmosis](https://www.npmjs.com/package/autosmosis) | 1,672 | 13 | 8 |
| [kavajs](https://www.npmjs.com/package/kavajs) | 1,142 | 18 | 5 |
| [eve-network](https://www.npmjs.com/package/eve-network) | 1,004 | 16 | 5 |
| *3 packages hidden (< 1,000 downloads)* | | | |

### create-cosmos-app

| Name | Total | Monthly | Weekly |
| ------- | ------ | ------- | ----- |
| _Total_ | 21,984 | 579 | 144 |
| [create-cosmos-app](https://www.npmjs.com/package/create-cosmos-app) | 18,896 | 299 | 32 |
| [create-interchain-app](https://www.npmjs.com/package/create-interchain-app) | 3,088 | 280 | 112 |



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


<!-- README.md automatically generated on 2026-11-04T04:32:25.682Z from lib-count repository with latest download stats -->
