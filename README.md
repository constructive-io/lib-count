
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
| **Total** | 219,747,464 | 31,943,196 | 8,430,374 |
| Cloud | 130,772,375 | 26,767,761 | 7,159,683 |
| Chain | 68,957,713 | 1,993,601 | 476,934 |
| Utilities | 20,015,699 | 3,181,834 | 793,757 |

_Weekly and monthly are the last 7 and 30 days of npm data._ _npm reported zero downloads for every package on 5 of those 30 days (an npm-side outage); those days are excluded and the totals scaled to the full period._


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
| _Total_ | 105,841,455 | 20,896,216 | 5,791,956 |
| [@pgsql/types](https://www.npmjs.com/package/@pgsql/types) | 20,108,167 | 5,671,132 | 1,670,652 |
| [libpg-query](https://www.npmjs.com/package/libpg-query) | 19,765,247 | 4,011,449 | 1,233,669 |
| [pgsql-deparser](https://www.npmjs.com/package/pgsql-deparser) | 15,793,778 | 2,674,451 | 707,336 |
| [pgsql-parser](https://www.npmjs.com/package/pgsql-parser) | 11,972,462 | 1,275,245 | 383,765 |
| [pgsql-enums](https://www.npmjs.com/package/pgsql-enums) | 7,442,218 | 94,283 | 41,388 |
| [@launchql/protobufjs](https://www.npmjs.com/package/@launchql/protobufjs) | 6,007,799 | 1,594,864 | 441,196 |
| [@libpg-query/parser](https://www.npmjs.com/package/@libpg-query/parser) | 5,005,891 | 1,617,588 | 425,297 |
| [pg-proto-parser](https://www.npmjs.com/package/pg-proto-parser) | 4,517,373 | 1,452,202 | 357,884 |
| [@pgsql/traverse](https://www.npmjs.com/package/@pgsql/traverse) | 4,485,879 | 1,453,254 | 356,267 |
| [@pgsql/enums](https://www.npmjs.com/package/@pgsql/enums) | 715,254 | 54,564 | 14,355 |
| [@pgsql/utils](https://www.npmjs.com/package/@pgsql/utils) | 684,514 | 36,347 | 7,985 |
| [pg-env](https://www.npmjs.com/package/pg-env) | 492,860 | 39,497 | 6,841 |
| [pg-cache](https://www.npmjs.com/package/pg-cache) | 470,691 | 36,713 | 5,944 |
| [csv-to-pg](https://www.npmjs.com/package/csv-to-pg) | 417,943 | 27,955 | 5,189 |
| [graphile-settings](https://www.npmjs.com/package/graphile-settings) | 291,414 | 25,412 | 2,991 |
| [@pyramation/postgraphile-plugin-fulltext-filter](https://www.npmjs.com/package/@pyramation/postgraphile-plugin-fulltext-filter) | 255,635 | 11,204 | 1,722 |
| [graphile-postgis](https://www.npmjs.com/package/graphile-postgis) | 245,183 | 24,394 | 3,000 |
| [gql-ast](https://www.npmjs.com/package/gql-ast) | 234,189 | 22,373 | 2,656 |
| [graphile-i18n](https://www.npmjs.com/package/graphile-i18n) | 225,102 | 23,946 | 2,856 |
| [graphile-cache](https://www.npmjs.com/package/graphile-cache) | 224,061 | 23,636 | 2,904 |
| [graphile-upload-plugin](https://www.npmjs.com/package/graphile-upload-plugin) | 211,750 | 20,558 | 2,562 |
| [pg-query-context](https://www.npmjs.com/package/pg-query-context) | 208,958 | 20,268 | 2,551 |
| [pgsql-test](https://www.npmjs.com/package/pgsql-test) | 198,657 | 23,906 | 4,711 |
| [pg-ast](https://www.npmjs.com/package/pg-ast) | 198,099 | 21,510 | 2,780 |
| [@pgql/parse](https://www.npmjs.com/package/@pgql/parse) | 190,077 | 206 | 40 |
| [@agentic-kit/ollama](https://www.npmjs.com/package/@agentic-kit/ollama) | 186,616 | 19,738 | 2,602 |
| [skitch-utils](https://www.npmjs.com/package/skitch-utils) | 182,093 | 9,845 | 2,300 |
| [@agentic-kit/protocol](https://www.npmjs.com/package/@agentic-kit/protocol) | 160,003 | 21,132 | 2,521 |
| [@pgpmjs/transform](https://www.npmjs.com/package/@pgpmjs/transform) | 159,054 | 23,843 | 4,171 |
| [graphile-plugin-utils](https://www.npmjs.com/package/graphile-plugin-utils) | 143,545 | 22,582 | 2,671 |
| [@pgpmjs/ast](https://www.npmjs.com/package/@pgpmjs/ast) | 142,100 | 25,158 | 4,179 |
| [skitch](https://www.npmjs.com/package/skitch) | 132,309 | 1,530 | 463 |
| [@pgpmjs/naming-spec](https://www.npmjs.com/package/@pgpmjs/naming-spec) | 128,591 | 26,324 | 3,609 |
| [@constructive-io/errors](https://www.npmjs.com/package/@constructive-io/errors) | 127,021 | 29,178 | 4,421 |
| [@pgpmjs/slice](https://www.npmjs.com/package/@pgpmjs/slice) | 123,194 | 21,124 | 3,650 |
| [@pgsql/transform](https://www.npmjs.com/package/@pgsql/transform) | 121,824 | 21,566 | 3,145 |
| [@pgpmjs/traverse](https://www.npmjs.com/package/@pgpmjs/traverse) | 120,144 | 19,393 | 3,376 |
| [graphile-meta](https://www.npmjs.com/package/graphile-meta) | 119,155 | 19,354 | 2,455 |
| [graphile-history](https://www.npmjs.com/package/graphile-history) | 116,261 | 19,258 | 2,844 |
| [@pgpmjs/bundle](https://www.npmjs.com/package/@pgpmjs/bundle) | 116,038 | 19,343 | 3,339 |
| [query-spec](https://www.npmjs.com/package/query-spec) | 114,174 | 18,683 | 2,374 |
| [@pgsql/parser](https://www.npmjs.com/package/@pgsql/parser) | 113,585 | 34,588 | 10,100 |
| [@launchql/styled-email](https://www.npmjs.com/package/@launchql/styled-email) | 108,812 | 114 | 25 |
| [@launchql/mjml](https://www.npmjs.com/package/@launchql/mjml) | 108,796 | 124 | 27 |
| [@pgpmjs/diff](https://www.npmjs.com/package/@pgpmjs/diff) | 102,279 | 22,034 | 3,553 |
| [@pgsql/semantics](https://www.npmjs.com/package/@pgsql/semantics) | 102,071 | 18,917 | 4,094 |
| [graphile-test](https://www.npmjs.com/package/graphile-test) | 97,767 | 5,310 | 624 |
| [@pgsql/scripts](https://www.npmjs.com/package/@pgsql/scripts) | 96,676 | 19,132 | 3,110 |
| [@constructive-io/coerce](https://www.npmjs.com/package/@constructive-io/coerce) | 91,906 | 25,978 | 3,798 |
| [introspectron](https://www.npmjs.com/package/introspectron) | 86,939 | 4,892 | 506 |
| [@launchql/cli](https://www.npmjs.com/package/@launchql/cli) | 85,208 | 1,349 | 39 |
| [graphile-query](https://www.npmjs.com/package/graphile-query) | 66,316 | 2,914 | 323 |
| [@launchql/graphql-testing](https://www.npmjs.com/package/@launchql/graphql-testing) | 59,015 | 376 | 29 |
| [graphile-function-bindings](https://www.npmjs.com/package/graphile-function-bindings) | 57,292 | 14,064 | 1,988 |
| [graphile-search-plugin](https://www.npmjs.com/package/graphile-search-plugin) | 55,274 | 384 | 30 |
| [pg-codegen](https://www.npmjs.com/package/pg-codegen) | 51,295 | 4,739 | 371 |
| [graphile-simple-inflector](https://www.npmjs.com/package/graphile-simple-inflector) | 50,464 | 523 | 36 |
| [graphile-meta-schema](https://www.npmjs.com/package/graphile-meta-schema) | 50,448 | 576 | 40 |
| [graphile-storage-registry](https://www.npmjs.com/package/graphile-storage-registry) | 50,001 | 18,749 | 2,338 |
| [supabase-test](https://www.npmjs.com/package/supabase-test) | 46,670 | 5,989 | 1,629 |
| [skitch-templates](https://www.npmjs.com/package/skitch-templates) | 45,665 | 714 | 239 |
| [safegres](https://www.npmjs.com/package/safegres) | 44,750 | 10,252 | 1,614 |
| [@launchql/server](https://www.npmjs.com/package/@launchql/server) | 41,339 | 581 | 196 |
| [@launchql/types](https://www.npmjs.com/package/@launchql/types) | 40,984 | 560 | 124 |
| [@launchql/server-utils](https://www.npmjs.com/package/@launchql/server-utils) | 39,563 | 686 | 204 |
| [pg-query-string](https://www.npmjs.com/package/pg-query-string) | 39,225 | 1,090 | 77 |
| [agentic-server](https://www.npmjs.com/package/agentic-server) | 38,290 | 5,814 | 912 |
| [drizzle-orm-test](https://www.npmjs.com/package/drizzle-orm-test) | 38,075 | 3,767 | 701 |
| [@launchql/explorer](https://www.npmjs.com/package/@launchql/explorer) | 35,577 | 721 | 256 |
| [@launchql/core](https://www.npmjs.com/package/@launchql/core) | 34,894 | 449 | 110 |
| [@launchql/env](https://www.npmjs.com/package/@launchql/env) | 34,262 | 398 | 107 |
| [skitch-testing](https://www.npmjs.com/package/skitch-testing) | 33,177 | 523 | 142 |
| [@launchql/db-testing](https://www.npmjs.com/package/@launchql/db-testing) | 33,034 | 349 | 31 |
| [graphile-plugin-connection-filter-postgis](https://www.npmjs.com/package/graphile-plugin-connection-filter-postgis) | 32,112 | 295 | 14 |
| [@pgsql/lint](https://www.npmjs.com/package/@pgsql/lint) | 31,827 | 8,560 | 1,235 |
| [@launchql/postmaster](https://www.npmjs.com/package/@launchql/postmaster) | 31,530 | 54 | 6 |
| [@launchql/logger](https://www.npmjs.com/package/@launchql/logger) | 30,028 | 408 | 109 |
| [graphile-plugin-connection-filter](https://www.npmjs.com/package/graphile-plugin-connection-filter) | 29,376 | 361 | 24 |
| [graphile-plugin-fulltext-filter](https://www.npmjs.com/package/graphile-plugin-fulltext-filter) | 27,666 | 145 | 10 |
| [graphile-pg-type-mappings](https://www.npmjs.com/package/graphile-pg-type-mappings) | 27,396 | 158 | 9 |
| [pg-query-native-latest](https://www.npmjs.com/package/pg-query-native-latest) | 26,647 | 130 | 66 |
| [@launchql/templatizer](https://www.npmjs.com/package/@launchql/templatizer) | 26,487 | 305 | 55 |
| [@launchql/db-utils](https://www.npmjs.com/package/@launchql/db-utils) | 26,351 | 203 | 11 |
| [@constructive-io/eslint-config](https://www.npmjs.com/package/@constructive-io/eslint-config) | 26,083 | 7,032 | 1,164 |
| [@launchql/db-migrate](https://www.npmjs.com/package/@launchql/db-migrate) | 24,563 | 150 | 19 |
| [@agentic-kit/anthropic](https://www.npmjs.com/package/@agentic-kit/anthropic) | 24,374 | 4,114 | 468 |
| [@pgpmjs/import](https://www.npmjs.com/package/@pgpmjs/import) | 23,940 | 4,588 | 763 |
| [@agentic-kit/openai](https://www.npmjs.com/package/@agentic-kit/openai) | 23,351 | 3,152 | 440 |
| [@launchql/s3-streamer](https://www.npmjs.com/package/@launchql/s3-streamer) | 22,840 | 114 | 16 |
| [@agentic-kit/pi](https://www.npmjs.com/package/@agentic-kit/pi) | 22,413 | 5,467 | 707 |
| [@launchql/db-templates](https://www.npmjs.com/package/@launchql/db-templates) | 22,048 | 132 | 18 |
| [@launchql/content-type-stream](https://www.npmjs.com/package/@launchql/content-type-stream) | 20,329 | 72 | 7 |
| [@launchql/upload-names](https://www.npmjs.com/package/@launchql/upload-names) | 19,266 | 80 | 11 |
| [postgraphile-derived-upload-field](https://www.npmjs.com/package/postgraphile-derived-upload-field) | 18,518 | 203 | 17 |
| [@decryption/hashes](https://www.npmjs.com/package/@decryption/hashes) | 18,438 | 3,025 | 394 |
| [@agentic-kit/agent](https://www.npmjs.com/package/@agentic-kit/agent) | 17,253 | 2,867 | 391 |
| [@agentic-kit/harness](https://www.npmjs.com/package/@agentic-kit/harness) | 16,578 | 2,876 | 390 |
| [@agentic-kit/run-log](https://www.npmjs.com/package/@agentic-kit/run-log) | 15,414 | 4,144 | 796 |
| [@launchql/url-domains](https://www.npmjs.com/package/@launchql/url-domains) | 15,049 | 74 | 7 |
| [skitch-template](https://www.npmjs.com/package/skitch-template) | 14,962 | 196 | 75 |
| [@agentic-kit/chat](https://www.npmjs.com/package/@agentic-kit/chat) | 14,282 | 2,560 | 326 |
| [@launchql/ext-verify](https://www.npmjs.com/package/@launchql/ext-verify) | 14,134 | 90 | 5 |
| [@launchql/ext-types](https://www.npmjs.com/package/@launchql/ext-types) | 13,967 | 77 | 7 |
| [@agentic-kit/db-tools](https://www.npmjs.com/package/@agentic-kit/db-tools) | 13,899 | 5,066 | 623 |
| [@launchql/ext-defaults](https://www.npmjs.com/package/@launchql/ext-defaults) | 13,835 | 143 | 7 |
| [@launchql/ext-default-roles](https://www.npmjs.com/package/@launchql/ext-default-roles) | 13,824 | 140 | 4 |
| [@launchql/ext-measurements](https://www.npmjs.com/package/@launchql/ext-measurements) | 13,591 | 145 | 7 |
| [@launchql/ext-jobs](https://www.npmjs.com/package/@launchql/ext-jobs) | 13,256 | 78 | 2 |
| [@pgpmjs/pglite-adapter](https://www.npmjs.com/package/@pgpmjs/pglite-adapter) | 13,209 | 2,929 | 458 |
| [@launchql/db-transform](https://www.npmjs.com/package/@launchql/db-transform) | 13,063 | 125 | 19 |
| [@launchql/base32](https://www.npmjs.com/package/@launchql/base32) | 12,784 | 89 | 10 |
| [graphile-column-privileges-mutations](https://www.npmjs.com/package/graphile-column-privileges-mutations) | 12,575 | 229 | 58 |
| [@launchql/inflection](https://www.npmjs.com/package/@launchql/inflection) | 12,560 | 108 | 9 |
| [pglite-test](https://www.npmjs.com/package/pglite-test) | 12,409 | 2,790 | 444 |
| [@launchql/graphile-settings](https://www.npmjs.com/package/@launchql/graphile-settings) | 12,227 | 430 | 103 |
| [@launchql/totp](https://www.npmjs.com/package/@launchql/totp) | 12,213 | 82 | 11 |
| [@launchql/faker](https://www.npmjs.com/package/@launchql/faker) | 12,047 | 91 | 8 |
| [@agentic-kit/metering](https://www.npmjs.com/package/@agentic-kit/metering) | 11,937 | 2,561 | 320 |
| [@launchql/ext-jobs-queue](https://www.npmjs.com/package/@launchql/ext-jobs-queue) | 11,304 | 64 | 5 |
| [@launchql/codegen](https://www.npmjs.com/package/@launchql/codegen) | 11,303 | 158 | 19 |
| [@launchql/db-template](https://www.npmjs.com/package/@launchql/db-template) | 11,145 | 88 | 10 |
| [@launchql/ext-jwt-claims](https://www.npmjs.com/package/@launchql/ext-jwt-claims) | 11,060 | 130 | 9 |
| [@launchql/ext-achievements](https://www.npmjs.com/package/@launchql/ext-achievements) | 10,675 | 178 | 3 |
| [@constructive-io/graphql-dev-server](https://www.npmjs.com/package/@constructive-io/graphql-dev-server) | 10,467 | 2,882 | 444 |
| [@launchql/react](https://www.npmjs.com/package/@launchql/react) | 10,198 | 277 | 101 |
| [@agentic-kit/cli](https://www.npmjs.com/package/@agentic-kit/cli) | 9,258 | 2,828 | 394 |
| [skitch-transform](https://www.npmjs.com/package/skitch-transform) | 8,902 | 169 | 40 |
| [@launchql/ext-stamps](https://www.npmjs.com/package/@launchql/ext-stamps) | 8,690 | 121 | 4 |
| [@launchql/ext-uuid](https://www.npmjs.com/package/@launchql/ext-uuid) | 8,618 | 124 | 8 |
| [pg-utils](https://www.npmjs.com/package/pg-utils) | 8,532 | 88 | 12 |
| [graphile-gen](https://www.npmjs.com/package/graphile-gen) | 8,026 | 114 | 5 |
| [@launchql/proto-cli](https://www.npmjs.com/package/@launchql/proto-cli) | 7,958 | 126 | 17 |
| [@launchql/db-env](https://www.npmjs.com/package/@launchql/db-env) | 7,778 | 67 | 13 |
| [@pgpm/app-scope](https://www.npmjs.com/package/@pgpm/app-scope) | 7,454 | 2,008 | 211 |
| [@pgpm/function-resolution](https://www.npmjs.com/package/@pgpm/function-resolution) | 7,430 | 2,016 | 208 |
| [@launchql/ext-utils](https://www.npmjs.com/package/@launchql/ext-utils) | 7,243 | 62 | 7 |
| [skitch-types](https://www.npmjs.com/package/skitch-types) | 7,205 | 127 | 30 |
| [@launchql/s3-utils](https://www.npmjs.com/package/@launchql/s3-utils) | 7,176 | 61 | 2 |
| [@launchql/utils](https://www.npmjs.com/package/@launchql/utils) | 7,072 | 85 | 8 |
| [@constructive-db/catalog](https://www.npmjs.com/package/@constructive-db/catalog) | 6,840 | 1,744 | 254 |
| [@launchql/openfaas-job-worker](https://www.npmjs.com/package/@launchql/openfaas-job-worker) | 6,814 | 40 | 1 |
| [agentic-kit](https://www.npmjs.com/package/agentic-kit) | 6,738 | 596 | 143 |
| [skitch-path](https://www.npmjs.com/package/skitch-path) | 6,556 | 101 | 27 |
| [@constructive-db/routing](https://www.npmjs.com/package/@constructive-db/routing) | 6,360 | 1,776 | 254 |
| [@pgpm/errors](https://www.npmjs.com/package/@pgpm/errors) | 6,325 | 2,785 | 401 |
| [@constructive-db/routing-platform](https://www.npmjs.com/package/@constructive-db/routing-platform) | 6,102 | 1,654 | 246 |
| [@constructive-db/apps](https://www.npmjs.com/package/@constructive-db/apps) | 5,486 | 1,386 | 199 |
| [@pgpmjs/portability](https://www.npmjs.com/package/@pgpmjs/portability) | 5,465 | 1,541 | 296 |
| [@launchql/protobufjs-cli](https://www.npmjs.com/package/@launchql/protobufjs-cli) | 5,399 | 352 | 70 |
| [@agentic-kit/react](https://www.npmjs.com/package/@agentic-kit/react) | 4,390 | 518 | 116 |
| [@launchql/query](https://www.npmjs.com/package/@launchql/query) | 4,276 | 49 | 2 |
| [@launchql/migrate](https://www.npmjs.com/package/@launchql/migrate) | 4,192 | 196 | 40 |
| [skitch-ext-utilities](https://www.npmjs.com/package/skitch-ext-utilities) | 4,105 | 44 | 5 |
| [skitch-prompt](https://www.npmjs.com/package/skitch-prompt) | 4,088 | 68 | 22 |
| [skitch-ext-verify](https://www.npmjs.com/package/skitch-ext-verify) | 4,041 | 34 | 4 |
| [skitch-env](https://www.npmjs.com/package/skitch-env) | 3,996 | 78 | 14 |
| [skitch-ext-defaults](https://www.npmjs.com/package/skitch-ext-defaults) | 3,934 | 40 | 5 |
| [@launchql/graphile-query](https://www.npmjs.com/package/@launchql/graphile-query) | 3,924 | 95 | 20 |
| [graphile-scoped-introspection](https://www.npmjs.com/package/graphile-scoped-introspection) | 3,917 | 4,309 | 1,924 |
| [@launchql/openfaas-job-fn](https://www.npmjs.com/package/@launchql/openfaas-job-fn) | 3,832 | 42 | 6 |
| [graphile-gen-js](https://www.npmjs.com/package/graphile-gen-js) | 3,530 | 30 | 0 |
| [skitch-extension-verify](https://www.npmjs.com/package/skitch-extension-verify) | 3,306 | 74 | 25 |
| [@constructive-io/site-deploy](https://www.npmjs.com/package/@constructive-io/site-deploy) | 3,283 | 2,609 | 270 |
| [launchql-test](https://www.npmjs.com/package/launchql-test) | 3,240 | 83 | 4 |
| [@launchql/job-utils](https://www.npmjs.com/package/@launchql/job-utils) | 3,225 | 49 | 5 |
| [@launchql/openfaas-job-service](https://www.npmjs.com/package/@launchql/openfaas-job-service) | 3,222 | 41 | 3 |
| [@launchql/client](https://www.npmjs.com/package/@launchql/client) | 3,197 | 42 | 1 |
| [@launchql/job-worker](https://www.npmjs.com/package/@launchql/job-worker) | 3,168 | 49 | 5 |
| [@launchql/orm](https://www.npmjs.com/package/@launchql/orm) | 3,111 | 47 | 3 |
| [@launchql/query-builder](https://www.npmjs.com/package/@launchql/query-builder) | 3,055 | 65 | 6 |
| [skitch-extension-utils](https://www.npmjs.com/package/skitch-extension-utils) | 3,010 | 47 | 15 |
| [@agentic-kit/dsh](https://www.npmjs.com/package/@agentic-kit/dsh) | 3,006 | 2,184 | 303 |
| [skitch-install](https://www.npmjs.com/package/skitch-install) | 3,003 | 60 | 16 |
| [@launchql/job-scheduler](https://www.npmjs.com/package/@launchql/job-scheduler) | 2,833 | 43 | 1 |
| [@launchql/job-pg](https://www.npmjs.com/package/@launchql/job-pg) | 2,751 | 30 | 3 |
| [skitch-extension-defaults](https://www.npmjs.com/package/skitch-extension-defaults) | 2,706 | 36 | 9 |
| [skitch-extension-jobs](https://www.npmjs.com/package/skitch-extension-jobs) | 2,621 | 38 | 12 |
| [skitch-extension-default-roles](https://www.npmjs.com/package/skitch-extension-default-roles) | 2,359 | 30 | 6 |
| [launchql-client](https://www.npmjs.com/package/launchql-client) | 2,333 | 18 | 2 |
| [@constructive-db/infra-platform](https://www.npmjs.com/package/@constructive-db/infra-platform) | 2,288 | 533 | 56 |
| [agentic-db](https://www.npmjs.com/package/agentic-db) | 2,190 | 101 | 26 |
| [@constructive-io/data](https://www.npmjs.com/package/@constructive-io/data) | 2,116 | 569 | 111 |
| [@constructive-db/platform-schema](https://www.npmjs.com/package/@constructive-db/platform-schema) | 2,105 | 686 | 59 |
| [@agentic-db/sdk](https://www.npmjs.com/package/@agentic-db/sdk) | 2,054 | 89 | 19 |
| [@constructive-db/compute-platform](https://www.npmjs.com/package/@constructive-db/compute-platform) | 2,024 | 486 | 58 |
| [@constructive-io/schema-builder](https://www.npmjs.com/package/@constructive-io/schema-builder) | 1,916 | 149 | 29 |
| [@constructive-db/infra](https://www.npmjs.com/package/@constructive-db/infra) | 1,879 | 533 | 58 |
| [@constructive-db/compute](https://www.npmjs.com/package/@constructive-db/compute) | 1,878 | 632 | 58 |
| [@launchql/openfaas-job-util-jobs](https://www.npmjs.com/package/@launchql/openfaas-job-util-jobs) | 1,792 | 19 | 1 |
| [@agentic-kit/pi-embed](https://www.npmjs.com/package/@agentic-kit/pi-embed) | 1,729 | 56 | 15 |
| [@launchql/geo-types](https://www.npmjs.com/package/@launchql/geo-types) | 1,679 | 22 | 0 |
| [@agentic-db/services](https://www.npmjs.com/package/@agentic-db/services) | 1,666 | 82 | 20 |
| [@agentic-kit/pi-ext-run-log](https://www.npmjs.com/package/@agentic-kit/pi-ext-run-log) | 1,628 | 47 | 10 |
| [launchql-gen](https://www.npmjs.com/package/launchql-gen) | 1,614 | 32 | 2 |
| [@agentic-kit/run-log-client](https://www.npmjs.com/package/@agentic-kit/run-log-client) | 1,613 | 1,906 | 709 |
| [@webql/base32](https://www.npmjs.com/package/@webql/base32) | 1,528 | 40 | 0 |
| [@launchql/openfaas-job-server](https://www.npmjs.com/package/@launchql/openfaas-job-server) | 1,481 | 16 | 1 |
| [@launchql/mmmagic](https://www.npmjs.com/package/@launchql/mmmagic) | 1,474 | 66 | 3 |
| [graphile-client](https://www.npmjs.com/package/graphile-client) | 1,445 | 22 | 2 |
| [@launchql/ast](https://www.npmjs.com/package/@launchql/ast) | 1,438 | 28 | 9 |
| [graphile-gen-sql](https://www.npmjs.com/package/graphile-gen-sql) | 1,424 | 24 | 0 |
| [@agentic-kit/pi-ext-usage-report](https://www.npmjs.com/package/@agentic-kit/pi-ext-usage-report) | 1,395 | 26 | 5 |
| [@agentic-kit/pi-ext-metered-model](https://www.npmjs.com/package/@agentic-kit/pi-ext-metered-model) | 1,394 | 29 | 7 |
| [@launchql/openfaas-env](https://www.npmjs.com/package/@launchql/openfaas-env) | 1,358 | 16 | 1 |
| [@pgsql/transform-ast](https://www.npmjs.com/package/@pgsql/transform-ast) | 1,315 | 170 | 42 |
| [@launchql/pg-query-context](https://www.npmjs.com/package/@launchql/pg-query-context) | 1,280 | 25 | 1 |
| [@launchql/job-api-server](https://www.npmjs.com/package/@launchql/job-api-server) | 1,267 | 17 | 3 |
| [csv-to-gql](https://www.npmjs.com/package/csv-to-gql) | 1,243 | 12 | 1 |
| [@agentic-kit/bradie](https://www.npmjs.com/package/@agentic-kit/bradie) | 1,181 | 47 | 9 |
| [@launchql/ext-status](https://www.npmjs.com/package/@launchql/ext-status) | 1,159 | 28 | 3 |
| [@agentic-kit/pi-host](https://www.npmjs.com/package/@agentic-kit/pi-host) | 1,081 | 1,278 | 498 |
| [@webql/utils](https://www.npmjs.com/package/@webql/utils) | 1,068 | 34 | 2 |
| [@launchql/ast-deparser](https://www.npmjs.com/package/@launchql/ast-deparser) | 1,039 | 25 | 1 |
| *76 packages hidden (< 1,000 downloads)* | | | |

### utils

| Name | Total | Monthly | Weekly |
| ------- | ------ | ------- | ----- |
| _Total_ | 19,991,836 | 3,180,396 | 793,357 |
| [nested-obj](https://www.npmjs.com/package/nested-obj) | 5,131,760 | 1,397,864 | 362,382 |
| [strfy-js](https://www.npmjs.com/package/strfy-js) | 4,461,631 | 1,376,149 | 357,897 |
| [inquirerer](https://www.npmjs.com/package/inquirerer) | 2,089,104 | 56,975 | 10,957 |
| [ast-stringify](https://www.npmjs.com/package/ast-stringify) | 1,534,149 | 19,018 | 4,537 |
| [@pyramation/json-schema-ref-parser](https://www.npmjs.com/package/@pyramation/json-schema-ref-parser) | 1,507,940 | 16,184 | 4,244 |
| [@pyramation/json-schema-to-typescript](https://www.npmjs.com/package/@pyramation/json-schema-to-typescript) | 1,494,880 | 16,070 | 4,254 |
| [appstash](https://www.npmjs.com/package/appstash) | 494,002 | 25,975 | 4,759 |
| [yanse](https://www.npmjs.com/package/yanse) | 437,713 | 27,181 | 5,367 |
| [genomic](https://www.npmjs.com/package/genomic) | 387,324 | 29,843 | 5,462 |
| [komoji](https://www.npmjs.com/package/komoji) | 316,357 | 23,629 | 4,174 |
| [etag-hash](https://www.npmjs.com/package/etag-hash) | 315,463 | 24,174 | 3,192 |
| [uuid-hash](https://www.npmjs.com/package/uuid-hash) | 275,765 | 22,814 | 2,814 |
| [makage](https://www.npmjs.com/package/makage) | 241,131 | 12,946 | 1,530 |
| [mime-bytes](https://www.npmjs.com/package/mime-bytes) | 223,116 | 24,080 | 2,995 |
| [12factor-env](https://www.npmjs.com/package/12factor-env) | 220,535 | 25,748 | 4,143 |
| [inflekt](https://www.npmjs.com/package/inflekt) | 214,061 | 17,633 | 2,465 |
| [clean-ansi](https://www.npmjs.com/package/clean-ansi) | 97,076 | 869 | 185 |
| [schema-typescript](https://www.npmjs.com/package/schema-typescript) | 94,978 | 6,200 | 1,445 |
| [git-changed](https://www.npmjs.com/package/git-changed) | 86,534 | 18,498 | 3,932 |
| [create-gen-app](https://www.npmjs.com/package/create-gen-app) | 41,020 | 220 | 72 |
| [publish-scripts](https://www.npmjs.com/package/publish-scripts) | 33,578 | 373 | 128 |
| [yamlize](https://www.npmjs.com/package/yamlize) | 31,885 | 7,456 | 1,221 |
| [@pyramation/babel-preset-env](https://www.npmjs.com/package/@pyramation/babel-preset-env) | 31,599 | 623 | 153 |
| [confstash](https://www.npmjs.com/package/confstash) | 31,360 | 7,116 | 1,156 |
| [pnpm-policy](https://www.npmjs.com/package/pnpm-policy) | 28,068 | 7,854 | 1,260 |
| [@constructive-io/pnpm-policy](https://www.npmjs.com/package/@constructive-io/pnpm-policy) | 27,787 | 7,249 | 1,268 |
| [symlink-workspace](https://www.npmjs.com/package/symlink-workspace) | 26,215 | 929 | 228 |
| [json-schema-patch](https://www.npmjs.com/package/json-schema-patch) | 22,143 | 502 | 121 |
| [file-ts](https://www.npmjs.com/package/file-ts) | 21,880 | 598 | 163 |
| [promql-ast](https://www.npmjs.com/package/promql-ast) | 17,481 | 2,514 | 350 |
| [etag-stream](https://www.npmjs.com/package/etag-stream) | 10,010 | 696 | 54 |
| [uuid-stream](https://www.npmjs.com/package/uuid-stream) | 9,417 | 649 | 81 |
| [schema-sdk](https://www.npmjs.com/package/schema-sdk) | 7,460 | 184 | 67 |
| [@yamlize/cli](https://www.npmjs.com/package/@yamlize/cli) | 3,617 | 324 | 32 |
| [@schema-typescript/cli](https://www.npmjs.com/package/@schema-typescript/cli) | 3,067 | 37 | 3 |
| [jsonldjs](https://www.npmjs.com/package/jsonldjs) | 2,928 | 101 | 11 |
| [backoff-script](https://www.npmjs.com/package/backoff-script) | 2,431 | 22 | 1 |
| [niftymagick](https://www.npmjs.com/package/niftymagick) | 2,265 | 41 | 12 |
| [json-stringify-simple](https://www.npmjs.com/package/json-stringify-simple) | 1,901 | 20 | 0 |
| [airpage-cli](https://www.npmjs.com/package/airpage-cli) | 1,546 | 29 | 5 |
| [airpage](https://www.npmjs.com/package/airpage) | 1,450 | 25 | 5 |
| [@constructive-io/pnpm-policy-graphile](https://www.npmjs.com/package/@constructive-io/pnpm-policy-graphile) | 1,405 | 624 | 176 |
| [babel-slim](https://www.npmjs.com/package/babel-slim) | 1,022 | 16 | 1 |
| *15 packages hidden (< 1,000 downloads)* | | | |

### cloud

| Name | Total | Monthly | Weekly |
| ------- | ------ | ------- | ----- |
| _Total_ | 1,076,956 | 130,109 | 16,019 |
| [graphile-pg-aggregates](https://www.npmjs.com/package/graphile-pg-aggregates) | 197,886 | 23,608 | 2,885 |
| [graphile-bulk-mutations](https://www.npmjs.com/package/graphile-bulk-mutations) | 193,870 | 23,573 | 2,874 |
| [@constructive-io/express-context](https://www.npmjs.com/package/@constructive-io/express-context) | 177,941 | 23,740 | 2,916 |
| [graphile-realtime-subscriptions](https://www.npmjs.com/package/graphile-realtime-subscriptions) | 170,812 | 20,272 | 2,588 |
| [@constructive-io/llm-env](https://www.npmjs.com/package/@constructive-io/llm-env) | 163,119 | 20,521 | 2,560 |
| [graphile-realtime-test](https://www.npmjs.com/package/graphile-realtime-test) | 31,313 | 3,019 | 343 |
| [@constructive-io/graphql-realtime-test](https://www.npmjs.com/package/@constructive-io/graphql-realtime-test) | 21,315 | 2,710 | 286 |
| [@constructive-io/noble-hashes](https://www.npmjs.com/package/@constructive-io/noble-hashes) | 8,691 | 140 | 31 |
| [@constructive-io/send-verification-link-fn](https://www.npmjs.com/package/@constructive-io/send-verification-link-fn) | 8,522 | 191 | 51 |
| [@constructive-io/send-email-fn](https://www.npmjs.com/package/@constructive-io/send-email-fn) | 8,456 | 199 | 47 |
| [blocks-schema](https://www.npmjs.com/package/blocks-schema) | 8,139 | 2,214 | 243 |
| [json-renderer](https://www.npmjs.com/package/json-renderer) | 7,752 | 1,938 | 243 |
| [blocks-renderer](https://www.npmjs.com/package/blocks-renderer) | 7,661 | 1,816 | 243 |
| [@interweb/casing](https://www.npmjs.com/package/@interweb/casing) | 5,800 | 120 | 37 |
| [@interweb-utils/casing](https://www.npmjs.com/package/@interweb-utils/casing) | 5,676 | 67 | 11 |
| [@pgpm/object-store](https://www.npmjs.com/package/@pgpm/object-store) | 5,142 | 1,174 | 97 |
| [@fbp/types](https://www.npmjs.com/package/@fbp/types) | 4,748 | 154 | 34 |
| [@pgpm/object-tree](https://www.npmjs.com/package/@pgpm/object-tree) | 4,169 | 820 | 68 |
| [@pgpm/partman](https://www.npmjs.com/package/@pgpm/partman) | 3,842 | 739 | 54 |
| [@interweb/fetch-api-client](https://www.npmjs.com/package/@interweb/fetch-api-client) | 3,738 | 73 | 5 |
| [@pgpm/inflection-db](https://www.npmjs.com/package/@pgpm/inflection-db) | 3,588 | 908 | 68 |
| [@fbp/spec](https://www.npmjs.com/package/@fbp/spec) | 3,535 | 86 | 18 |
| [@interweb/http-errors](https://www.npmjs.com/package/@interweb/http-errors) | 3,359 | 65 | 6 |
| [@interweb/node-api-client](https://www.npmjs.com/package/@interweb/node-api-client) | 2,891 | 71 | 3 |
| [@constructive-io/sheets](https://www.npmjs.com/package/@constructive-io/sheets) | 2,409 | 274 | 61 |
| [@interweb/find-pkg](https://www.npmjs.com/package/@interweb/find-pkg) | 1,680 | 36 | 2 |
| [@fbp/evaluator](https://www.npmjs.com/package/@fbp/evaluator) | 1,062 | 104 | 28 |
| *44 packages hidden (< 1,000 downloads)* | | | |

### kubernetesjs

| Name | Total | Monthly | Weekly |
| ------- | ------ | ------- | ----- |
| _Total_ | 73,740 | 8,895 | 1,337 |
| [@kubernetesjs/ops](https://www.npmjs.com/package/@kubernetesjs/ops) | 27,380 | 2,496 | 348 |
| [kubernetesjs](https://www.npmjs.com/package/kubernetesjs) | 24,485 | 3,635 | 635 |
| [@kubernetesjs/manifests](https://www.npmjs.com/package/@kubernetesjs/manifests) | 13,240 | 2,480 | 314 |
| [@kubernetesjs/client](https://www.npmjs.com/package/@kubernetesjs/client) | 2,419 | 110 | 19 |
| [@kubernetesjs/cli](https://www.npmjs.com/package/@kubernetesjs/cli) | 2,194 | 41 | 1 |
| [@kubernetesjs/ops-cli](https://www.npmjs.com/package/@kubernetesjs/ops-cli) | 2,164 | 103 | 19 |
| [@kubernetesjs/react](https://www.npmjs.com/package/@kubernetesjs/react) | 1,858 | 30 | 1 |

### pgpm

| Name | Total | Monthly | Weekly |
| ------- | ------ | ------- | ----- |
| _Total_ | 23,780,224 | 5,732,541 | 1,350,371 |
| [@pgsql/quotes](https://www.npmjs.com/package/@pgsql/quotes) | 6,128,542 | 2,283,403 | 590,362 |
| [plpgsql-parser](https://www.npmjs.com/package/plpgsql-parser) | 3,654,801 | 1,316,796 | 315,769 |
| [plpgsql-deparser](https://www.npmjs.com/package/plpgsql-deparser) | 3,611,770 | 1,257,788 | 317,873 |
| [@pgpmjs/types](https://www.npmjs.com/package/@pgpmjs/types) | 496,728 | 45,228 | 7,041 |
| [@pgpmjs/env](https://www.npmjs.com/package/@pgpmjs/env) | 450,790 | 36,780 | 5,907 |
| [@pgpmjs/core](https://www.npmjs.com/package/@pgpmjs/core) | 438,129 | 31,730 | 5,271 |
| [@pgpmjs/server-utils](https://www.npmjs.com/package/@pgpmjs/server-utils) | 430,145 | 36,088 | 5,855 |
| [@pgpmjs/logger](https://www.npmjs.com/package/@pgpmjs/logger) | 418,907 | 35,336 | 5,603 |
| [find-and-require-package-json](https://www.npmjs.com/package/find-and-require-package-json) | 391,821 | 27,756 | 5,083 |
| [@inquirerer/utils](https://www.npmjs.com/package/@inquirerer/utils) | 273,997 | 13,313 | 1,850 |
| [@constructive-io/graphql-types](https://www.npmjs.com/package/@constructive-io/graphql-types) | 265,665 | 22,214 | 3,022 |
| [graphile-search](https://www.npmjs.com/package/graphile-search) | 233,619 | 24,631 | 2,968 |
| [@constructive-io/graphql-env](https://www.npmjs.com/package/@constructive-io/graphql-env) | 231,081 | 22,020 | 2,989 |
| [graphile-connection-filter](https://www.npmjs.com/package/graphile-connection-filter) | 227,422 | 24,677 | 3,075 |
| [@constructive-io/s3-streamer](https://www.npmjs.com/package/@constructive-io/s3-streamer) | 224,893 | 21,637 | 2,906 |
| [@constructive-io/graphql-query](https://www.npmjs.com/package/@constructive-io/graphql-query) | 207,262 | 13,946 | 1,566 |
| [@pgpmjs/migrate-client](https://www.npmjs.com/package/@pgpmjs/migrate-client) | 203,197 | 12,608 | 1,237 |
| [@constructive-io/content-type-stream](https://www.npmjs.com/package/@constructive-io/content-type-stream) | 201,723 | 21,896 | 2,557 |
| [@constructive-io/upload-names](https://www.npmjs.com/package/@constructive-io/upload-names) | 201,638 | 20,003 | 2,524 |
| [@constructive-io/s3-utils](https://www.npmjs.com/package/@constructive-io/s3-utils) | 197,083 | 21,991 | 2,587 |
| [graphile-presigned-url-plugin](https://www.npmjs.com/package/graphile-presigned-url-plugin) | 196,091 | 22,963 | 2,696 |
| [graphile-ltree](https://www.npmjs.com/package/graphile-ltree) | 194,438 | 23,730 | 2,868 |
| [graphile-llm](https://www.npmjs.com/package/graphile-llm) | 191,967 | 25,200 | 2,976 |
| [graphile-bucket-provisioner-plugin](https://www.npmjs.com/package/graphile-bucket-provisioner-plugin) | 186,940 | 20,704 | 2,636 |
| [@constructive-io/url-domains](https://www.npmjs.com/package/@constructive-io/url-domains) | 185,899 | 20,068 | 2,565 |
| [@constructive-io/bucket-provisioner](https://www.npmjs.com/package/@constructive-io/bucket-provisioner) | 180,273 | 20,604 | 2,594 |
| [@pgpmjs/export](https://www.npmjs.com/package/@pgpmjs/export) | 167,684 | 12,029 | 1,293 |
| [pgsql-seed](https://www.npmjs.com/package/pgsql-seed) | 162,565 | 24,175 | 4,811 |
| [pgsql-client](https://www.npmjs.com/package/pgsql-client) | 161,255 | 22,961 | 4,671 |
| [@pgpm/verify](https://www.npmjs.com/package/@pgpm/verify) | 148,634 | 4,603 | 562 |
| [pg-seed](https://www.npmjs.com/package/pg-seed) | 140,930 | 22,188 | 4,414 |
| [@pgpm/inflection](https://www.npmjs.com/package/@pgpm/inflection) | 136,792 | 3,628 | 464 |
| [@constructive-io/query-builder](https://www.npmjs.com/package/@constructive-io/query-builder) | 135,521 | 21,860 | 2,575 |
| [pgpm](https://www.npmjs.com/package/pgpm) | 135,075 | 8,492 | 1,161 |
| [@pgpm/types](https://www.npmjs.com/package/@pgpm/types) | 129,464 | 3,430 | 493 |
| [@constructive-io/graphql-server](https://www.npmjs.com/package/@constructive-io/graphql-server) | 126,304 | 15,922 | 2,138 |
| [@pgpm/database-jobs](https://www.npmjs.com/package/@pgpm/database-jobs) | 126,212 | 2,564 | 318 |
| [@constructive-io/graphql-codegen](https://www.npmjs.com/package/@constructive-io/graphql-codegen) | 111,622 | 9,382 | 1,967 |
| [@pgpm/metaschema-schema](https://www.npmjs.com/package/@pgpm/metaschema-schema) | 101,178 | 2,413 | 290 |
| [@constructive-io/graphql-test](https://www.npmjs.com/package/@constructive-io/graphql-test) | 95,084 | 5,238 | 618 |
| [@constructive-io/cli](https://www.npmjs.com/package/@constructive-io/cli) | 93,880 | 4,519 | 429 |
| [@inquirerer/test](https://www.npmjs.com/package/@inquirerer/test) | 87,581 | 1,189 | 197 |
| [@pgpm/metaschema-modules](https://www.npmjs.com/package/@pgpm/metaschema-modules) | 86,785 | 2,459 | 270 |
| [graphile-schema](https://www.npmjs.com/package/graphile-schema) | 79,991 | 6,866 | 824 |
| [@pgpm/services](https://www.npmjs.com/package/@pgpm/services) | 79,882 | 335 | 52 |
| [@constructive-io/graphql-explorer](https://www.npmjs.com/package/@constructive-io/graphql-explorer) | 79,768 | 4,548 | 448 |
| [@constructive-io/fetch](https://www.npmjs.com/package/@constructive-io/fetch) | 77,959 | 9,360 | 1,419 |
| [@constructive-io/job-utils](https://www.npmjs.com/package/@constructive-io/job-utils) | 68,061 | 7,878 | 1,160 |
| [@constructive-io/job-pg](https://www.npmjs.com/package/@constructive-io/job-pg) | 66,573 | 7,754 | 1,094 |
| [@pyramation/args](https://www.npmjs.com/package/@pyramation/args) | 58,116 | 475 | 117 |
| [@pyramation/prompt](https://www.npmjs.com/package/@pyramation/prompt) | 57,898 | 540 | 122 |
| [@constructive-io/sdk](https://www.npmjs.com/package/@constructive-io/sdk) | 57,839 | 5,920 | 754 |
| [@constructive-io/csrf](https://www.npmjs.com/package/@constructive-io/csrf) | 56,792 | 12,655 | 1,751 |
| [simple-smtp-server](https://www.npmjs.com/package/simple-smtp-server) | 50,867 | 4,633 | 686 |
| [@constructive-io/knative-job-service](https://www.npmjs.com/package/@constructive-io/knative-job-service) | 49,689 | 829 | 299 |
| [@constructive-io/react](https://www.npmjs.com/package/@constructive-io/react) | 45,290 | 3,445 | 439 |
| [@pgpm/jwt-claims](https://www.npmjs.com/package/@pgpm/jwt-claims) | 44,510 | 3,661 | 698 |
| [@constructive-io/job-scheduler](https://www.npmjs.com/package/@constructive-io/job-scheduler) | 44,023 | 2,758 | 356 |
| [@constructive-io/graphql-react](https://www.npmjs.com/package/@constructive-io/graphql-react) | 43,585 | 1,135 | 428 |
| [graphql-server-test](https://www.npmjs.com/package/graphql-server-test) | 42,632 | 3,677 | 497 |
| [constructive-test](https://www.npmjs.com/package/constructive-test) | 42,317 | 8,628 | 1,349 |
| [@constructive-io/playwright-test](https://www.npmjs.com/package/@constructive-io/playwright-test) | 41,955 | 2,894 | 339 |
| [@pgpm/stamps](https://www.npmjs.com/package/@pgpm/stamps) | 41,172 | 2,610 | 429 |
| [@constructive-sdk/cli](https://www.npmjs.com/package/@constructive-sdk/cli) | 40,342 | 3,798 | 1,013 |
| [@constructive-io/knative-job-worker](https://www.npmjs.com/package/@constructive-io/knative-job-worker) | 37,599 | 389 | 51 |
| [@pgpm/uuid](https://www.npmjs.com/package/@pgpm/uuid) | 36,320 | 1,572 | 212 |
| [@pgpm/base32](https://www.npmjs.com/package/@pgpm/base32) | 35,966 | 1,106 | 114 |
| [node-type-registry](https://www.npmjs.com/package/node-type-registry) | 33,772 | 4,146 | 736 |
| [@pgpm/utils](https://www.npmjs.com/package/@pgpm/utils) | 33,376 | 1,002 | 123 |
| [@pgpm/totp](https://www.npmjs.com/package/@pgpm/totp) | 32,629 | 896 | 83 |
| [insforge-test](https://www.npmjs.com/package/insforge-test) | 32,581 | 4,332 | 791 |
| [graphile-sql-expression-validator](https://www.npmjs.com/package/graphile-sql-expression-validator) | 32,497 | 1,122 | 268 |
| [@pgpm/faker](https://www.npmjs.com/package/@pgpm/faker) | 31,406 | 833 | 97 |
| [@constructive-io/postmaster](https://www.npmjs.com/package/@constructive-io/postmaster) | 29,118 | 647 | 104 |
| [@constructive-io/upload-client](https://www.npmjs.com/package/@constructive-io/upload-client) | 27,080 | 3,120 | 386 |
| [@constructive-io/knative-job-server](https://www.npmjs.com/package/@constructive-io/knative-job-server) | 23,709 | 424 | 153 |
| [@constructive-io/knative-job-fn](https://www.npmjs.com/package/@constructive-io/knative-job-fn) | 21,045 | 226 | 53 |
| [@constructive-io/ui](https://www.npmjs.com/package/@constructive-io/ui) | 18,364 | 1,309 | 114 |
| [@pgpm/defaults](https://www.npmjs.com/package/@pgpm/defaults) | 17,818 | 799 | 64 |
| [@pyramation/postgis](https://www.npmjs.com/package/@pyramation/postgis) | 17,411 | 166 | 15 |
| [@pgpm-testing/verify](https://www.npmjs.com/package/@pgpm-testing/verify) | 17,282 | 684 | 127 |
| [@pgpm-testing/base32](https://www.npmjs.com/package/@pgpm-testing/base32) | 16,747 | 688 | 130 |
| [bash-ast](https://www.npmjs.com/package/bash-ast) | 15,710 | 4,691 | 696 |
| [docker-parser](https://www.npmjs.com/package/docker-parser) | 15,513 | 4,354 | 694 |
| [@constructive-io/send-email-link-fn](https://www.npmjs.com/package/@constructive-io/send-email-link-fn) | 14,459 | 139 | 6 |
| [@constructive-io/simple-email-fn](https://www.npmjs.com/package/@constructive-io/simple-email-fn) | 13,767 | 104 | 8 |
| [@constructive-io/node](https://www.npmjs.com/package/@constructive-io/node) | 13,519 | 340 | 31 |
| [graphile-many-to-many](https://www.npmjs.com/package/graphile-many-to-many) | 11,389 | 131 | 6 |
| [@pgpm/db-meta-schema](https://www.npmjs.com/package/@pgpm/db-meta-schema) | 11,163 | 37 | 0 |
| [@pgpm/db-meta-modules](https://www.npmjs.com/package/@pgpm/db-meta-modules) | 11,047 | 25 | 1 |
| [stream-to-etag](https://www.npmjs.com/package/stream-to-etag) | 9,471 | 688 | 131 |
| [@constructive-io/job-worker](https://www.npmjs.com/package/@constructive-io/job-worker) | 8,597 | 347 | 127 |
| [@pgpm/geotypes](https://www.npmjs.com/package/@pgpm/geotypes) | 8,071 | 763 | 68 |
| [@pgpm/achievements](https://www.npmjs.com/package/@pgpm/achievements) | 7,992 | 834 | 61 |
| [@pgpm/encrypted-secrets-table](https://www.npmjs.com/package/@pgpm/encrypted-secrets-table) | 7,812 | 815 | 97 |
| [@pgpm/jobs](https://www.npmjs.com/package/@pgpm/jobs) | 7,762 | 832 | 82 |
| [@pgsql/cli](https://www.npmjs.com/package/@pgsql/cli) | 7,512 | 619 | 94 |
| [@pgpm/measurements](https://www.npmjs.com/package/@pgpm/measurements) | 7,325 | 826 | 76 |
| [@pgpm/encrypted-secrets](https://www.npmjs.com/package/@pgpm/encrypted-secrets) | 7,320 | 766 | 82 |
| [@pyramation/postgraphile](https://www.npmjs.com/package/@pyramation/postgraphile) | 7,307 | 149 | 17 |
| [@pyramation/url-domains](https://www.npmjs.com/package/@pyramation/url-domains) | 6,642 | 139 | 14 |
| [@constructive-io/client](https://www.npmjs.com/package/@constructive-io/client) | 6,018 | 595 | 107 |
| [pgsql-parse](https://www.npmjs.com/package/pgsql-parse) | 5,796 | 769 | 194 |
| [@constructive-io/orm](https://www.npmjs.com/package/@constructive-io/orm) | 5,744 | 587 | 100 |
| [@constructive-io/oauth](https://www.npmjs.com/package/@constructive-io/oauth) | 4,784 | 457 | 56 |
| [@pyramation/upload-names](https://www.npmjs.com/package/@pyramation/upload-names) | 4,663 | 130 | 16 |
| [@pgpm/default-roles](https://www.npmjs.com/package/@pgpm/default-roles) | 4,634 | 49 | 2 |
| [@pyramation/content-type-stream](https://www.npmjs.com/package/@pyramation/content-type-stream) | 4,602 | 114 | 9 |
| [@pyramation/s3-streamer](https://www.npmjs.com/package/@pyramation/s3-streamer) | 4,304 | 124 | 15 |
| [@pgpm-testing/totp](https://www.npmjs.com/package/@pgpm-testing/totp) | 4,291 | 302 | 50 |
| [@pyramation/pg-query-context](https://www.npmjs.com/package/@pyramation/pg-query-context) | 4,168 | 78 | 7 |
| [@pgpm-testing/utils](https://www.npmjs.com/package/@pgpm-testing/utils) | 4,099 | 121 | 27 |
| [@pgpm/ltree-helpers](https://www.npmjs.com/package/@pgpm/ltree-helpers) | 4,075 | 799 | 59 |
| [coolir](https://www.npmjs.com/package/coolir) | 4,063 | 47 | 9 |
| [graphile-misc-plugins](https://www.npmjs.com/package/graphile-misc-plugins) | 3,928 | 34 | 3 |
| [webql-cli](https://www.npmjs.com/package/webql-cli) | 3,667 | 34 | 3 |
| [@pyramation/webql](https://www.npmjs.com/package/@pyramation/webql) | 3,379 | 20 | 1 |
| [@pyramation/graphql-ast](https://www.npmjs.com/package/@pyramation/graphql-ast) | 3,289 | 55 | 1 |
| [pgsql-types](https://www.npmjs.com/package/pgsql-types) | 3,223 | 245 | 32 |
| [webql-db](https://www.npmjs.com/package/webql-db) | 3,002 | 58 | 6 |
| [plpgsql-parse](https://www.npmjs.com/package/plpgsql-parse) | 2,915 | 323 | 43 |
| [@pyramation/stream-to-s3](https://www.npmjs.com/package/@pyramation/stream-to-s3) | 2,895 | 31 | 0 |
| [@pgpm/meta-db](https://www.npmjs.com/package/@pgpm/meta-db) | 2,700 | 24 | 1 |
| [@pgpm/meta-db-modules](https://www.npmjs.com/package/@pgpm/meta-db-modules) | 2,689 | 25 | 2 |
| [graphile-pgvector-plugin](https://www.npmjs.com/package/graphile-pgvector-plugin) | 2,092 | 23 | 4 |
| [standalone-module](https://www.npmjs.com/package/standalone-module) | 1,948 | 52 | 13 |
| [@pyramation/rpc-server](https://www.npmjs.com/package/@pyramation/rpc-server) | 1,880 | 19 | 2 |
| [postgraphile-plugin-pgvector](https://www.npmjs.com/package/postgraphile-plugin-pgvector) | 1,646 | 52 | 3 |
| [graphile-pg-textsearch-plugin](https://www.npmjs.com/package/graphile-pg-textsearch-plugin) | 1,590 | 30 | 7 |
| [@pyramation/postgraphile-upload-field](https://www.npmjs.com/package/@pyramation/postgraphile-upload-field) | 1,579 | 49 | 9 |
| [rego-deparser](https://www.npmjs.com/package/rego-deparser) | 1,532 | 1,062 | 122 |
| [@constructive-io/command-palette](https://www.npmjs.com/package/@constructive-io/command-palette) | 1,506 | 124 | 29 |
| [@launchql/knative-job-worker](https://www.npmjs.com/package/@launchql/knative-job-worker) | 1,498 | 19 | 1 |
| [@launchql/knative-job-service](https://www.npmjs.com/package/@launchql/knative-job-service) | 1,418 | 20 | 1 |
| [@constructive-io/seeder](https://www.npmjs.com/package/@constructive-io/seeder) | 1,329 | 66 | 5 |
| [tpsql](https://www.npmjs.com/package/tpsql) | 1,321 | 31 | 2 |
| [airscript](https://www.npmjs.com/package/airscript) | 1,307 | 30 | 3 |
| [@launchql/knative-job-server](https://www.npmjs.com/package/@launchql/knative-job-server) | 1,219 | 25 | 1 |
| [coolir-commander-utils](https://www.npmjs.com/package/coolir-commander-utils) | 1,174 | 17 | 6 |
| [@pyramation/docker-env](https://www.npmjs.com/package/@pyramation/docker-env) | 1,136 | 22 | 1 |
| [coolir-commander](https://www.npmjs.com/package/coolir-commander) | 1,131 | 17 | 4 |
| [@pyramation/s3-utils](https://www.npmjs.com/package/@pyramation/s3-utils) | 1,129 | 14 | 1 |
| [@pgpm/meta-db-test](https://www.npmjs.com/package/@pgpm/meta-db-test) | 1,091 | 23 | 1 |
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
| _Total_ | 5,733,595 | 57,190 | 13,636 |
| [@cosmology/protobufjs](https://www.npmjs.com/package/@cosmology/protobufjs) | 1,354,575 | 26,756 | 5,237 |
| [@protobufs/google](https://www.npmjs.com/package/@protobufs/google) | 609,674 | 3,617 | 1,016 |
| [@protobufs/gogoproto](https://www.npmjs.com/package/@protobufs/gogoproto) | 609,426 | 3,341 | 947 |
| [@protobufs/cosmos](https://www.npmjs.com/package/@protobufs/cosmos) | 592,314 | 3,811 | 1,269 |
| [@protobufs/cosmos_proto](https://www.npmjs.com/package/@protobufs/cosmos_proto) | 591,128 | 3,476 | 951 |
| [@protobufs/tendermint](https://www.npmjs.com/package/@protobufs/tendermint) | 585,827 | 3,350 | 973 |
| [@pyramation/protobufjs](https://www.npmjs.com/package/@pyramation/protobufjs) | 428,943 | 1,512 | 441 |
| [@protobufs/confio](https://www.npmjs.com/package/@protobufs/confio) | 231,771 | 2,570 | 628 |
| [@protobufs/ibc](https://www.npmjs.com/package/@protobufs/ibc) | 228,596 | 2,742 | 720 |
| [@protobufs/amino](https://www.npmjs.com/package/@protobufs/amino) | 223,665 | 2,522 | 684 |
| [@protobufs/cosmwasm](https://www.npmjs.com/package/@protobufs/cosmwasm) | 212,606 | 2,603 | 626 |
| [@protobufs/osmosis](https://www.npmjs.com/package/@protobufs/osmosis) | 29,550 | 298 | 60 |
| [@protobufs/juno](https://www.npmjs.com/package/@protobufs/juno) | 3,990 | 29 | 6 |
| [@protobufs/injective](https://www.npmjs.com/package/@protobufs/injective) | 3,721 | 8 | 0 |
| [@protobufs/akash](https://www.npmjs.com/package/@protobufs/akash) | 2,440 | 73 | 12 |
| [@protobufs/stargaze](https://www.npmjs.com/package/@protobufs/stargaze) | 2,158 | 32 | 7 |
| [@protobufs/regen](https://www.npmjs.com/package/@protobufs/regen) | 2,054 | 61 | 7 |
| [@protobufs/secret](https://www.npmjs.com/package/@protobufs/secret) | 1,983 | 40 | 12 |
| [@protobufs/bcna](https://www.npmjs.com/package/@protobufs/bcna) | 1,785 | 19 | 2 |
| [@protobufs/pylons](https://www.npmjs.com/package/@protobufs/pylons) | 1,702 | 16 | 2 |
| [@protobufs/comdex](https://www.npmjs.com/package/@protobufs/comdex) | 1,382 | 12 | 1 |
| [@protobufs/evmos](https://www.npmjs.com/package/@protobufs/evmos) | 1,202 | 18 | 2 |
| [@protobufs/axelar](https://www.npmjs.com/package/@protobufs/axelar) | 1,145 | 19 | 1 |
| *27 packages hidden (< 1,000 downloads)* | | | |

### chain-registry

| Name | Total | Monthly | Weekly |
| ------- | ------ | ------- | ----- |
| _Total_ | 15,768,488 | 470,657 | 93,736 |
| [@chain-registry/types](https://www.npmjs.com/package/@chain-registry/types) | 5,078,558 | 148,789 | 27,345 |
| [chain-registry](https://www.npmjs.com/package/chain-registry) | 2,495,362 | 93,793 | 20,457 |
| [@chain-registry/keplr](https://www.npmjs.com/package/@chain-registry/keplr) | 1,942,061 | 49,487 | 7,928 |
| [@chain-registry/utils](https://www.npmjs.com/package/@chain-registry/utils) | 1,689,265 | 45,631 | 7,912 |
| [@chain-registry/client](https://www.npmjs.com/package/@chain-registry/client) | 1,421,819 | 48,788 | 8,573 |
| [@chain-registry/cosmostation](https://www.npmjs.com/package/@chain-registry/cosmostation) | 1,371,526 | 17,464 | 3,338 |
| [@chain-registry/v2](https://www.npmjs.com/package/@chain-registry/v2) | 378,798 | 29,296 | 11,605 |
| [@chain-registry/v2-types](https://www.npmjs.com/package/@chain-registry/v2-types) | 356,994 | 14,502 | 3,416 |
| [@chain-registry/assets](https://www.npmjs.com/package/@chain-registry/assets) | 233,577 | 7,936 | 1,196 |
| [@chain-registry/osmosis](https://www.npmjs.com/package/@chain-registry/osmosis) | 195,483 | 6,540 | 1,094 |
| [@chain-registry/juno](https://www.npmjs.com/package/@chain-registry/juno) | 146,021 | 1,818 | 170 |
| [@chain-registry/interfaces](https://www.npmjs.com/package/@chain-registry/interfaces) | 97,085 | 1,610 | 233 |
| [@chain-registry/workflows](https://www.npmjs.com/package/@chain-registry/workflows) | 86,459 | 1,286 | 164 |
| [@chain-registry/cli](https://www.npmjs.com/package/@chain-registry/cli) | 84,065 | 1,325 | 176 |
| [@chain-registry/v2-keplr](https://www.npmjs.com/package/@chain-registry/v2-keplr) | 59,333 | 760 | 42 |
| [@chain-registry/v2-utils](https://www.npmjs.com/package/@chain-registry/v2-utils) | 48,260 | 606 | 26 |
| [@chain-registry/v2-client](https://www.npmjs.com/package/@chain-registry/v2-client) | 44,993 | 553 | 31 |
| [@chain-registry/v2-cosmostation](https://www.npmjs.com/package/@chain-registry/v2-cosmostation) | 38,829 | 473 | 30 |

### cosmos-kit

| Name | Total | Monthly | Weekly |
| ------- | ------ | ------- | ----- |
| _Total_ | 3,358,015 | 105,403 | 17,002 |
| [@cosmos-kit/core](https://www.npmjs.com/package/@cosmos-kit/core) | 1,302,932 | 38,518 | 6,080 |
| [@cosmos-kit/walletconnect](https://www.npmjs.com/package/@cosmos-kit/walletconnect) | 892,390 | 21,000 | 4,266 |
| [@cosmos-kit/react-lite](https://www.npmjs.com/package/@cosmos-kit/react-lite) | 534,828 | 22,247 | 3,206 |
| [@cosmos-kit/react](https://www.npmjs.com/package/@cosmos-kit/react) | 515,859 | 22,322 | 3,185 |
| [cosmos-kit](https://www.npmjs.com/package/cosmos-kit) | 112,006 | 1,316 | 265 |

### cosmos-kit-wallets

| Name | Total | Monthly | Weekly |
| ------- | ------ | ------- | ----- |
| _Total_ | 15,973,588 | 270,633 | 52,044 |
| [@cosmos-kit/keplr-extension](https://www.npmjs.com/package/@cosmos-kit/keplr-extension) | 865,130 | 22,745 | 4,579 |
| [@cosmos-kit/keplr](https://www.npmjs.com/package/@cosmos-kit/keplr) | 837,987 | 20,927 | 4,002 |
| [@cosmos-kit/keplr-mobile](https://www.npmjs.com/package/@cosmos-kit/keplr-mobile) | 817,681 | 19,728 | 4,364 |
| [@cosmos-kit/leap-extension](https://www.npmjs.com/package/@cosmos-kit/leap-extension) | 788,204 | 8,308 | 1,772 |
| [@cosmos-kit/leap](https://www.npmjs.com/package/@cosmos-kit/leap) | 755,674 | 6,877 | 1,607 |
| [@cosmos-kit/cosmostation-extension](https://www.npmjs.com/package/@cosmos-kit/cosmostation-extension) | 719,962 | 11,215 | 2,164 |
| [@cosmos-kit/leap-mobile](https://www.npmjs.com/package/@cosmos-kit/leap-mobile) | 710,715 | 6,431 | 1,570 |
| [@cosmos-kit/leap-metamask-cosmos-snap](https://www.npmjs.com/package/@cosmos-kit/leap-metamask-cosmos-snap) | 666,299 | 6,194 | 1,550 |
| [@cosmos-kit/cosmostation](https://www.npmjs.com/package/@cosmos-kit/cosmostation) | 658,324 | 5,153 | 1,130 |
| [@cosmos-kit/cosmostation-mobile](https://www.npmjs.com/package/@cosmos-kit/cosmostation-mobile) | 641,002 | 5,123 | 1,145 |
| [@cosmos-kit/okxwallet-extension](https://www.npmjs.com/package/@cosmos-kit/okxwallet-extension) | 535,260 | 11,268 | 1,964 |
| [@cosmos-kit/xdefi-extension](https://www.npmjs.com/package/@cosmos-kit/xdefi-extension) | 522,958 | 9,764 | 1,771 |
| [@cosmos-kit/trust](https://www.npmjs.com/package/@cosmos-kit/trust) | 509,712 | 11,164 | 1,969 |
| [@cosmos-kit/trust-mobile](https://www.npmjs.com/package/@cosmos-kit/trust-mobile) | 508,660 | 10,602 | 1,937 |
| [@cosmos-kit/station-extension](https://www.npmjs.com/package/@cosmos-kit/station-extension) | 498,167 | 10,086 | 1,882 |
| [@cosmos-kit/station](https://www.npmjs.com/package/@cosmos-kit/station) | 496,859 | 10,835 | 1,853 |
| [@cosmos-kit/trust-extension](https://www.npmjs.com/package/@cosmos-kit/trust-extension) | 496,546 | 11,484 | 2,095 |
| [@cosmos-kit/xdefi](https://www.npmjs.com/package/@cosmos-kit/xdefi) | 493,637 | 10,387 | 1,767 |
| [@cosmos-kit/okxwallet](https://www.npmjs.com/package/@cosmos-kit/okxwallet) | 443,112 | 9,376 | 1,734 |
| [@cosmos-kit/cdcwallet](https://www.npmjs.com/package/@cosmos-kit/cdcwallet) | 431,703 | 10,663 | 1,893 |
| [@cosmos-kit/cdcwallet-extension](https://www.npmjs.com/package/@cosmos-kit/cdcwallet-extension) | 431,595 | 10,602 | 1,905 |
| [@cosmos-kit/omni-mobile](https://www.npmjs.com/package/@cosmos-kit/omni-mobile) | 144,177 | 1,709 | 287 |
| [@cosmos-kit/omni](https://www.npmjs.com/package/@cosmos-kit/omni) | 139,836 | 1,571 | 270 |
| [@cosmos-kit/compass-extension](https://www.npmjs.com/package/@cosmos-kit/compass-extension) | 138,091 | 1,669 | 321 |
| [@cosmos-kit/ledger](https://www.npmjs.com/package/@cosmos-kit/ledger) | 135,121 | 1,928 | 363 |
| [@cosmos-kit/compass](https://www.npmjs.com/package/@cosmos-kit/compass) | 130,462 | 1,612 | 316 |
| [@cosmos-kit/fin-extension](https://www.npmjs.com/package/@cosmos-kit/fin-extension) | 125,989 | 1,494 | 296 |
| [@cosmos-kit/coin98](https://www.npmjs.com/package/@cosmos-kit/coin98) | 125,499 | 1,753 | 284 |
| [@cosmos-kit/coin98-extension](https://www.npmjs.com/package/@cosmos-kit/coin98-extension) | 124,536 | 1,544 | 278 |
| [@cosmos-kit/fin](https://www.npmjs.com/package/@cosmos-kit/fin) | 120,760 | 1,500 | 278 |
| [@cosmos-kit/exodus-extension](https://www.npmjs.com/package/@cosmos-kit/exodus-extension) | 119,339 | 1,462 | 276 |
| [@cosmos-kit/shell-extension](https://www.npmjs.com/package/@cosmos-kit/shell-extension) | 118,439 | 1,344 | 251 |
| [@cosmos-kit/exodus](https://www.npmjs.com/package/@cosmos-kit/exodus) | 116,975 | 1,438 | 268 |
| [@cosmos-kit/shell](https://www.npmjs.com/package/@cosmos-kit/shell) | 116,280 | 1,368 | 257 |
| [@cosmos-kit/vectis](https://www.npmjs.com/package/@cosmos-kit/vectis) | 111,828 | 1,097 | 129 |
| [@cosmos-kit/vectis-extension](https://www.npmjs.com/package/@cosmos-kit/vectis-extension) | 108,777 | 1,045 | 130 |
| [@cosmos-kit/owallet](https://www.npmjs.com/package/@cosmos-kit/owallet) | 95,731 | 1,238 | 237 |
| [@cosmos-kit/owallet-extension](https://www.npmjs.com/package/@cosmos-kit/owallet-extension) | 95,643 | 1,132 | 234 |
| [@cosmos-kit/tailwind-extension](https://www.npmjs.com/package/@cosmos-kit/tailwind-extension) | 91,421 | 1,182 | 234 |
| [@cosmos-kit/tailwind](https://www.npmjs.com/package/@cosmos-kit/tailwind) | 91,130 | 1,244 | 239 |
| [@cosmos-kit/frontier-extension](https://www.npmjs.com/package/@cosmos-kit/frontier-extension) | 90,481 | 896 | 120 |
| [@cosmos-kit/frontier](https://www.npmjs.com/package/@cosmos-kit/frontier) | 88,861 | 888 | 125 |
| [@cosmos-kit/cosmos-extension-metamask](https://www.npmjs.com/package/@cosmos-kit/cosmos-extension-metamask) | 82,589 | 2,718 | 428 |
| [@cosmos-kit/galaxy-station-extension](https://www.npmjs.com/package/@cosmos-kit/galaxy-station-extension) | 68,165 | 893 | 199 |
| [@cosmos-kit/galaxy-station](https://www.npmjs.com/package/@cosmos-kit/galaxy-station) | 68,090 | 840 | 196 |
| [@cosmos-kit/owallet-mobile](https://www.npmjs.com/package/@cosmos-kit/owallet-mobile) | 57,656 | 864 | 186 |
| [@cosmos-kit/web3auth](https://www.npmjs.com/package/@cosmos-kit/web3auth) | 48,054 | 670 | 93 |
| [@cosmos-kit/ctrl-extension](https://www.npmjs.com/package/@cosmos-kit/ctrl-extension) | 44,736 | 854 | 183 |
| [@cosmos-kit/ctrl](https://www.npmjs.com/package/@cosmos-kit/ctrl) | 44,376 | 852 | 190 |
| [@cosmos-kit/okto-extension](https://www.npmjs.com/package/@cosmos-kit/okto-extension) | 43,096 | 101 | 7 |
| [@cosmos-kit/galaxy-station-mobile](https://www.npmjs.com/package/@cosmos-kit/galaxy-station-mobile) | 38,055 | 748 | 177 |
| [@cosmos-kit/imtoken-extension](https://www.npmjs.com/package/@cosmos-kit/imtoken-extension) | 17,635 | 95 | 5 |
| [@cosmos-kit/imtoken](https://www.npmjs.com/package/@cosmos-kit/imtoken) | 17,418 | 85 | 6 |
| [@cosmos-kit/ninji-extension](https://www.npmjs.com/package/@cosmos-kit/ninji-extension) | 17,109 | 187 | 19 |
| [@cosmos-kit/ninji](https://www.npmjs.com/package/@cosmos-kit/ninji) | 15,772 | 186 | 18 |
| [@cosmos-kit/bitgetwallet-extension](https://www.npmjs.com/package/@cosmos-kit/bitgetwallet-extension) | 14,677 | 248 | 57 |
| [@cosmos-kit/ins](https://www.npmjs.com/package/@cosmos-kit/ins) | 14,139 | 184 | 16 |
| [@cosmos-kit/leap-capsule-social-login](https://www.npmjs.com/package/@cosmos-kit/leap-capsule-social-login) | 13,512 | 143 | 7 |
| [@cosmos-kit/initia-extension](https://www.npmjs.com/package/@cosmos-kit/initia-extension) | 9,274 | 324 | 44 |
| [@cosmos-kit/initia](https://www.npmjs.com/package/@cosmos-kit/initia) | 8,628 | 203 | 21 |
| [@cosmos-kit/walletconnect-v1](https://www.npmjs.com/package/@cosmos-kit/walletconnect-v1) | 7,562 | 187 | 33 |
| [@cosmos-wallet/react](https://www.npmjs.com/package/@cosmos-wallet/react) | 6,939 | 78 | 16 |
| [@cosmos-wallet/core](https://www.npmjs.com/package/@cosmos-wallet/core) | 6,279 | 55 | 5 |
| [@cosmos-kit/gatewallet-extension](https://www.npmjs.com/package/@cosmos-kit/gatewallet-extension) | 5,981 | 252 | 44 |
| [@cosmos-kit/types](https://www.npmjs.com/package/@cosmos-kit/types) | 4,891 | 54 | 10 |
| [@cosmos-wallet/keplr](https://www.npmjs.com/package/@cosmos-wallet/keplr) | 4,419 | 64 | 6 |
| [@cosmos-wallet/types](https://www.npmjs.com/package/@cosmos-wallet/types) | 4,379 | 29 | 3 |
| [@cosmos-wallet/registry](https://www.npmjs.com/package/@cosmos-wallet/registry) | 4,372 | 25 | 2 |
| [@cosmos-kit/registry](https://www.npmjs.com/package/@cosmos-kit/registry) | 4,046 | 107 | 7 |
| [@cosmos-kit/config](https://www.npmjs.com/package/@cosmos-kit/config) | 3,901 | 67 | 11 |
| [@cosmos-kit/walletconnect-v2](https://www.npmjs.com/package/@cosmos-kit/walletconnect-v2) | 3,193 | 52 | 3 |
| [@cosmos-kit/arculus-mobile](https://www.npmjs.com/package/@cosmos-kit/arculus-mobile) | 3,123 | 196 | 60 |
| [@cosmos-kit/arculus](https://www.npmjs.com/package/@cosmos-kit/arculus) | 3,049 | 169 | 57 |
| [@cosmos-kit/aria-extension](https://www.npmjs.com/package/@cosmos-kit/aria-extension) | 2,768 | 84 | 5 |
| [@cosmos-kit/prax-extension](https://www.npmjs.com/package/@cosmos-kit/prax-extension) | 2,726 | 100 | 7 |
| [@cosmos-kit/wallets](https://www.npmjs.com/package/@cosmos-kit/wallets) | 2,624 | 48 | 9 |
| [@cosmos-kit/gatewallet](https://www.npmjs.com/package/@cosmos-kit/gatewallet) | 2,478 | 80 | 5 |
| [@cosmos-kit/terrastation-extension](https://www.npmjs.com/package/@cosmos-kit/terrastation-extension) | 2,366 | 44 | 1 |
| [@cosmos-kit/terrastation](https://www.npmjs.com/package/@cosmos-kit/terrastation) | 2,322 | 47 | 3 |
| [@cosmos-kit/aria-mobile](https://www.npmjs.com/package/@cosmos-kit/aria-mobile) | 1,890 | 58 | 1 |
| [@cosmos-kit/aria](https://www.npmjs.com/package/@cosmos-kit/aria) | 1,860 | 71 | 3 |
| [@cosmos-kit/bitgetwallet](https://www.npmjs.com/package/@cosmos-kit/bitgetwallet) | 1,655 | 77 | 14 |
| [@cosmos-kit/figure-markets-mobile](https://www.npmjs.com/package/@cosmos-kit/figure-markets-mobile) | 1,497 | 56 | 5 |
| [@cosmos-kit/foxwallet-extension](https://www.npmjs.com/package/@cosmos-kit/foxwallet-extension) | 1,407 | 56 | 7 |
| [@cosmos-kit/figure-markets](https://www.npmjs.com/package/@cosmos-kit/figure-markets) | 1,393 | 60 | 3 |
| [@cosmos-kit/foxwallet](https://www.npmjs.com/package/@cosmos-kit/foxwallet) | 1,382 | 60 | 8 |
| [@cosmos-kit/vultisig-extension](https://www.npmjs.com/package/@cosmos-kit/vultisig-extension) | 1,245 | 95 | 4 |
| [@cosmos-kit/vultisig](https://www.npmjs.com/package/@cosmos-kit/vultisig) | 1,131 | 76 | 3 |
| *2 packages hidden (< 1,000 downloads)* | | | |

### telescope

| Name | Total | Monthly | Weekly |
| ------- | ------ | ------- | ----- |
| _Total_ | 14,483,449 | 476,206 | 133,015 |
| [@osmonauts/lcd](https://www.npmjs.com/package/@osmonauts/lcd) | 5,083,136 | 339,707 | 105,117 |
| [@cosmology/types](https://www.npmjs.com/package/@cosmology/types) | 1,196,028 | 24,301 | 4,678 |
| [@cosmology/utils](https://www.npmjs.com/package/@cosmology/utils) | 1,194,783 | 24,343 | 4,682 |
| [@cosmology/proto-parser](https://www.npmjs.com/package/@cosmology/proto-parser) | 1,163,567 | 24,425 | 4,721 |
| [@cosmology/lcd](https://www.npmjs.com/package/@cosmology/lcd) | 1,029,968 | 12,676 | 3,133 |
| [@cosmology/ast](https://www.npmjs.com/package/@cosmology/ast) | 910,458 | 17,785 | 3,262 |
| [@osmonauts/helpers](https://www.npmjs.com/package/@osmonauts/helpers) | 787,456 | 8,033 | 1,611 |
| [@cosmology/telescope](https://www.npmjs.com/package/@cosmology/telescope) | 775,295 | 13,171 | 2,927 |
| [@osmonauts/telescope](https://www.npmjs.com/package/@osmonauts/telescope) | 490,390 | 2,564 | 637 |
| [@osmonauts/ast](https://www.npmjs.com/package/@osmonauts/ast) | 472,970 | 2,348 | 563 |
| [@osmonauts/proto-parser](https://www.npmjs.com/package/@osmonauts/proto-parser) | 469,821 | 2,104 | 493 |
| [@osmonauts/types](https://www.npmjs.com/package/@osmonauts/types) | 465,935 | 1,922 | 459 |
| [@osmonauts/utils](https://www.npmjs.com/package/@osmonauts/utils) | 443,642 | 2,827 | 732 |

### cosmwasm

| Name | Total | Monthly | Weekly |
| ------- | ------ | ------- | ----- |
| _Total_ | 3,650,793 | 46,926 | 11,800 |
| [@cosmwasm/ts-codegen](https://www.npmjs.com/package/@cosmwasm/ts-codegen) | 1,738,135 | 21,916 | 5,139 |
| [wasm-ast-types](https://www.npmjs.com/package/wasm-ast-types) | 1,603,350 | 15,842 | 3,497 |
| [@cosmwasm/ts-codegen-types](https://www.npmjs.com/package/@cosmwasm/ts-codegen-types) | 138,906 | 4,148 | 1,526 |
| [@cosmwasm/ts-codegen-ast](https://www.npmjs.com/package/@cosmwasm/ts-codegen-ast) | 135,308 | 4,446 | 1,535 |
| [cosmwasm-typescript-gen](https://www.npmjs.com/package/cosmwasm-typescript-gen) | 22,996 | 272 | 63 |
| [@cosmjson/wasmswap](https://www.npmjs.com/package/@cosmjson/wasmswap) | 2,893 | 68 | 19 |
| [@cosmjson/stargaze-minter](https://www.npmjs.com/package/@cosmjson/stargaze-minter) | 1,215 | 22 | 2 |
| [@cosmjson/stargaze-sg721](https://www.npmjs.com/package/@cosmjson/stargaze-sg721) | 1,180 | 26 | 3 |
| *13 packages hidden (< 1,000 downloads)* | | | |

### interchain-js

| Name | Total | Monthly | Weekly |
| ------- | ------ | ------- | ----- |
| _Total_ | 3,259,362 | 153,429 | 39,516 |
| [@interchainjs/auth](https://www.npmjs.com/package/@interchainjs/auth) | 344,742 | 14,617 | 3,699 |
| [@interchainjs/utils](https://www.npmjs.com/package/@interchainjs/utils) | 320,277 | 14,281 | 3,445 |
| [@interchainjs/types](https://www.npmjs.com/package/@interchainjs/types) | 319,112 | 13,319 | 3,456 |
| [@interchainjs/math](https://www.npmjs.com/package/@interchainjs/math) | 286,861 | 13,948 | 3,342 |
| [@interchainjs/encoding](https://www.npmjs.com/package/@interchainjs/encoding) | 282,182 | 13,924 | 3,336 |
| [@interchainjs/crypto](https://www.npmjs.com/package/@interchainjs/crypto) | 281,660 | 12,982 | 3,392 |
| [@interchainjs/cosmos-types](https://www.npmjs.com/package/@interchainjs/cosmos-types) | 277,634 | 14,393 | 3,465 |
| [@interchainjs/cosmos](https://www.npmjs.com/package/@interchainjs/cosmos) | 274,824 | 16,024 | 3,721 |
| [@interchainjs/amino](https://www.npmjs.com/package/@interchainjs/amino) | 244,436 | 12,899 | 3,357 |
| [@interchainjs/pubkey](https://www.npmjs.com/package/@interchainjs/pubkey) | 243,159 | 13,790 | 3,324 |
| [interchainjs](https://www.npmjs.com/package/interchainjs) | 199,380 | 5,682 | 2,482 |
| [@interchainjs/ethereum](https://www.npmjs.com/package/@interchainjs/ethereum) | 68,796 | 3,186 | 1,042 |
| [injectivejs](https://www.npmjs.com/package/injectivejs) | 21,379 | 290 | 52 |
| [@interchainjs/injective](https://www.npmjs.com/package/@interchainjs/injective) | 19,475 | 397 | 41 |
| [@interchainjs/react](https://www.npmjs.com/package/@interchainjs/react) | 12,250 | 432 | 101 |
| [injective-react](https://www.npmjs.com/package/injective-react) | 10,674 | 259 | 67 |
| [@interchainjs/solana](https://www.npmjs.com/package/@interchainjs/solana) | 10,079 | 1,427 | 824 |
| [injective-vue](https://www.npmjs.com/package/injective-vue) | 9,622 | 205 | 33 |
| [@interchainjs/vue](https://www.npmjs.com/package/@interchainjs/vue) | 8,947 | 310 | 56 |
| [interchain-rpc](https://www.npmjs.com/package/interchain-rpc) | 7,277 | 374 | 191 |
| [interchain46](https://www.npmjs.com/package/interchain46) | 2,244 | 58 | 14 |
| [interchain-react](https://www.npmjs.com/package/interchain-react) | 1,584 | 74 | 9 |
| [@interchainjs/ethermint](https://www.npmjs.com/package/@interchainjs/ethermint) | 1,525 | 38 | 4 |
| [interchain-vue](https://www.npmjs.com/package/interchain-vue) | 1,136 | 37 | 2 |
| *24 packages hidden (< 1,000 downloads)* | | | |

### hyperwebjs

| Name | Total | Monthly | Weekly |
| ------- | ------ | ------- | ----- |
| _Total_ | 52,545 | 4,174 | 757 |
| [@hyperweb/telescope](https://www.npmjs.com/package/@hyperweb/telescope) | 39,008 | 3,677 | 664 |
| [hyperwebjs](https://www.npmjs.com/package/hyperwebjs) | 4,818 | 148 | 34 |
| [@hyperweb/build](https://www.npmjs.com/package/@hyperweb/build) | 3,141 | 91 | 21 |
| [create-hyperweb-app](https://www.npmjs.com/package/create-hyperweb-app) | 1,273 | 84 | 18 |
| [@hyperweb/mcp-server](https://www.npmjs.com/package/@hyperweb/mcp-server) | 1,231 | 68 | 8 |
| [@hyperweb/parse](https://www.npmjs.com/package/@hyperweb/parse) | 1,184 | 23 | 1 |
| *5 packages hidden (< 1,000 downloads)* | | | |

### interchain-kit

| Name | Total | Monthly | Weekly |
| ------- | ------ | ------- | ----- |
| _Total_ | 204,597 | 4,729 | 781 |
| [@interchain-kit/core](https://www.npmjs.com/package/@interchain-kit/core) | 131,931 | 2,404 | 387 |
| [@interchain-kit/react](https://www.npmjs.com/package/@interchain-kit/react) | 46,412 | 1,529 | 268 |
| [interchain-kit](https://www.npmjs.com/package/interchain-kit) | 16,166 | 278 | 30 |
| [@interchain-kit/vue](https://www.npmjs.com/package/@interchain-kit/vue) | 10,088 | 518 | 96 |

### interchain-kit-wallets

| Name | Total | Monthly | Weekly |
| ------- | ------ | ------- | ----- |
| _Total_ | 491,371 | 12,640 | 908 |
| [@interchain-kit/keplr-extension](https://www.npmjs.com/package/@interchain-kit/keplr-extension) | 87,212 | 1,650 | 276 |
| [@interchain-kit/leap-extension](https://www.npmjs.com/package/@interchain-kit/leap-extension) | 71,769 | 1,021 | 120 |
| [@interchain-kit/okx-extension](https://www.npmjs.com/package/@interchain-kit/okx-extension) | 64,026 | 462 | 12 |
| [@interchain-kit/cosmostation-extension](https://www.npmjs.com/package/@interchain-kit/cosmostation-extension) | 23,910 | 746 | 31 |
| [@interchain-kit/store](https://www.npmjs.com/package/@interchain-kit/store) | 18,636 | 1,010 | 169 |
| [@interchain-kit/keplr-mobile](https://www.npmjs.com/package/@interchain-kit/keplr-mobile) | 17,852 | 679 | 21 |
| [@interchain-kit/leap-mobile](https://www.npmjs.com/package/@interchain-kit/leap-mobile) | 16,720 | 623 | 16 |
| [@interchain-kit/cosmos-extension-metamask](https://www.npmjs.com/package/@interchain-kit/cosmos-extension-metamask) | 16,636 | 446 | 11 |
| [@interchain-kit/coin98-extension](https://www.npmjs.com/package/@interchain-kit/coin98-extension) | 16,234 | 475 | 16 |
| [@interchain-kit/ledger](https://www.npmjs.com/package/@interchain-kit/ledger) | 15,243 | 432 | 15 |
| [@interchain-kit/mock-wallet](https://www.npmjs.com/package/@interchain-kit/mock-wallet) | 13,996 | 599 | 12 |
| [@interchain-kit/frontier-extension](https://www.npmjs.com/package/@interchain-kit/frontier-extension) | 13,857 | 373 | 9 |
| [@interchain-kit/station-extension](https://www.npmjs.com/package/@interchain-kit/station-extension) | 13,534 | 391 | 8 |
| [@interchain-kit/leap-cosmos-extension-metamask](https://www.npmjs.com/package/@interchain-kit/leap-cosmos-extension-metamask) | 13,417 | 530 | 12 |
| [@interchain-kit/galaxy-station-extension](https://www.npmjs.com/package/@interchain-kit/galaxy-station-extension) | 13,321 | 614 | 12 |
| [@interchain-kit/trust-extension](https://www.npmjs.com/package/@interchain-kit/trust-extension) | 12,082 | 432 | 114 |
| [@interchain-kit/xdefi-extension](https://www.npmjs.com/package/@interchain-kit/xdefi-extension) | 10,695 | 328 | 6 |
| [@interchain-kit/metamask-extension](https://www.npmjs.com/package/@interchain-kit/metamask-extension) | 8,600 | 338 | 16 |
| [@interchain-kit/compass-extension](https://www.npmjs.com/package/@interchain-kit/compass-extension) | 8,560 | 356 | 12 |
| [@interchain-kit/fin-extension](https://www.npmjs.com/package/@interchain-kit/fin-extension) | 7,768 | 282 | 4 |
| [@interchain-kit/exodus-extension](https://www.npmjs.com/package/@interchain-kit/exodus-extension) | 7,264 | 227 | 2 |
| [@interchain-kit/ninji-extension](https://www.npmjs.com/package/@interchain-kit/ninji-extension) | 5,964 | 190 | 5 |
| [@interchain-kit/shell-extension](https://www.npmjs.com/package/@interchain-kit/shell-extension) | 5,690 | 150 | 3 |
| [@interchain-kit/phantom-extension](https://www.npmjs.com/package/@interchain-kit/phantom-extension) | 2,831 | 77 | 1 |
| [@interchain-kit/backpack-extension](https://www.npmjs.com/package/@interchain-kit/backpack-extension) | 2,005 | 80 | 3 |
| [@interchain-kit/vultisig-extension](https://www.npmjs.com/package/@interchain-kit/vultisig-extension) | 1,793 | 71 | 0 |
| [@interchain-kit/solflare-extension](https://www.npmjs.com/package/@interchain-kit/solflare-extension) | 1,756 | 58 | 2 |

### interchain-ui

| Name | Total | Monthly | Weekly |
| ------- | ------ | ------- | ----- |
| _Total_ | 543,537 | 29,374 | 4,488 |
| [@interchain-ui/react](https://www.npmjs.com/package/@interchain-ui/react) | 515,364 | 28,116 | 4,196 |
| [@interchain-ui/vue](https://www.npmjs.com/package/@interchain-ui/vue) | 14,404 | 488 | 104 |
| [@interchain-ui/react-no-ssr](https://www.npmjs.com/package/@interchain-ui/react-no-ssr) | 11,640 | 694 | 184 |
| [@interweb-ui/cli](https://www.npmjs.com/package/@interweb-ui/cli) | 1,013 | 36 | 1 |
| *2 packages hidden (< 1,000 downloads)* | | | |

### osmosis

| Name | Total | Monthly | Weekly |
| ------- | ------ | ------- | ----- |
| _Total_ | 913,134 | 16,044 | 3,648 |
| [osmojs](https://www.npmjs.com/package/osmojs) | 775,226 | 13,276 | 3,049 |
| [osmo-query](https://www.npmjs.com/package/osmo-query) | 59,387 | 1,688 | 442 |
| [@osmonauts/math](https://www.npmjs.com/package/@osmonauts/math) | 42,528 | 220 | 30 |
| [@osmosis-labs/math](https://www.npmjs.com/package/@osmosis-labs/math) | 14,350 | 437 | 32 |
| [@osmosis-labs/pools](https://www.npmjs.com/package/@osmosis-labs/pools) | 8,257 | 52 | 6 |
| [@osmosis-labs/proto-codecs](https://www.npmjs.com/package/@osmosis-labs/proto-codecs) | 4,887 | 60 | 7 |
| [@osmosis-labs/stores](https://www.npmjs.com/package/@osmosis-labs/stores) | 4,755 | 120 | 18 |
| [osmojs-rc](https://www.npmjs.com/package/osmojs-rc) | 1,244 | 82 | 44 |
| *6 packages hidden (< 1,000 downloads)* | | | |

### starship

| Name | Total | Monthly | Weekly |
| ------- | ------ | ------- | ----- |
| _Total_ | 142,041 | 4,867 | 704 |
| [@starship-ci/client](https://www.npmjs.com/package/@starship-ci/client) | 45,767 | 1,594 | 211 |
| [@starship-ci/cli](https://www.npmjs.com/package/@starship-ci/cli) | 43,825 | 1,586 | 209 |
| [starshipjs](https://www.npmjs.com/package/starshipjs) | 43,412 | 1,336 | 200 |
| [@starship-ci/types](https://www.npmjs.com/package/@starship-ci/types) | 7,982 | 310 | 81 |
| [@starship-ci/generator](https://www.npmjs.com/package/@starship-ci/generator) | 1,055 | 41 | 3 |

### cosmology

| Name | Total | Monthly | Weekly |
| ------- | ------ | ------- | ----- |
| _Total_ | 550,200 | 11,837 | 2,269 |
| [interchain](https://www.npmjs.com/package/interchain) | 103,034 | 1,352 | 298 |
| [@cosmology/core](https://www.npmjs.com/package/@cosmology/core) | 56,760 | 1,566 | 327 |
| [cosmjs-utils](https://www.npmjs.com/package/cosmjs-utils) | 52,463 | 548 | 133 |
| [@cosmology/cli](https://www.npmjs.com/package/@cosmology/cli) | 42,013 | 1,556 | 321 |
| [cosmology](https://www.npmjs.com/package/cosmology) | 38,198 | 1,730 | 398 |
| [@cosmology-ui/react](https://www.npmjs.com/package/@cosmology-ui/react) | 31,878 | 295 | 38 |
| [@cosmology-ui/utils](https://www.npmjs.com/package/@cosmology-ui/utils) | 26,265 | 175 | 12 |
| [interchain-query](https://www.npmjs.com/package/interchain-query) | 22,964 | 172 | 22 |
| [thorchain](https://www.npmjs.com/package/thorchain) | 13,808 | 127 | 60 |
| [@cosmonauts/telescope](https://www.npmjs.com/package/@cosmonauts/telescope) | 9,188 | 113 | 9 |
| [@cosmonauts/osmosis](https://www.npmjs.com/package/@cosmonauts/osmosis) | 8,832 | 494 | 91 |
| [@osmonauts/osmosis](https://www.npmjs.com/package/@osmonauts/osmosis) | 6,306 | 215 | 46 |
| [@osmonauts/babel](https://www.npmjs.com/package/@osmonauts/babel) | 6,062 | 65 | 3 |
| [create-cosmwasm-app](https://www.npmjs.com/package/create-cosmwasm-app) | 5,978 | 80 | 4 |
| [@cosmology/cosmos-registry](https://www.npmjs.com/package/@cosmology/cosmos-registry) | 5,697 | 122 | 27 |
| [@pyramation/crypto-keys](https://www.npmjs.com/package/@pyramation/crypto-keys) | 5,614 | 86 | 9 |
| [@pyramation/crypto-coins](https://www.npmjs.com/package/@pyramation/crypto-coins) | 4,761 | 85 | 8 |
| [@pyramation/crypto-networks](https://www.npmjs.com/package/@pyramation/crypto-networks) | 4,433 | 84 | 8 |
| [stargaze-zone](https://www.npmjs.com/package/stargaze-zone) | 4,157 | 280 | 40 |
| [dydx](https://www.npmjs.com/package/dydx) | 3,477 | 13 | 2 |
| [cosmscript](https://www.npmjs.com/package/cosmscript) | 3,403 | 44 | 7 |
| [@cosmology-ui/chain-dropdown](https://www.npmjs.com/package/@cosmology-ui/chain-dropdown) | 3,153 | 55 | 7 |
| [@cosmology-ui/theme](https://www.npmjs.com/package/@cosmology-ui/theme) | 3,146 | 56 | 11 |
| [@cosmology-ui/connect-modal](https://www.npmjs.com/package/@cosmology-ui/connect-modal) | 3,094 | 50 | 7 |
| [@cosmology-ui/buttons](https://www.npmjs.com/package/@cosmology-ui/buttons) | 3,080 | 58 | 7 |
| [@cosmology-ui/copy-address-button](https://www.npmjs.com/package/@cosmology-ui/copy-address-button) | 3,078 | 55 | 8 |
| [@osmonauts/ast-gen](https://www.npmjs.com/package/@osmonauts/ast-gen) | 3,019 | 41 | 3 |
| [@cosmology-ui/base](https://www.npmjs.com/package/@cosmology-ui/base) | 3,009 | 59 | 9 |
| [@cosmology-ui/animation](https://www.npmjs.com/package/@cosmology-ui/animation) | 2,981 | 55 | 9 |
| [@pyramation/crypto-cli](https://www.npmjs.com/package/@pyramation/crypto-cli) | 2,845 | 28 | 3 |
| [@cosmology-ui/swap](https://www.npmjs.com/package/@cosmology-ui/swap) | 2,699 | 67 | 10 |
| [@cosmonauts/ast-gen](https://www.npmjs.com/package/@cosmonauts/ast-gen) | 2,392 | 38 | 4 |
| [badkidsjs](https://www.npmjs.com/package/badkidsjs) | 2,316 | 44 | 14 |
| [@cosmonauts/protobuf](https://www.npmjs.com/package/@cosmonauts/protobuf) | 2,264 | 42 | 3 |
| [@cosmology/react](https://www.npmjs.com/package/@cosmology/react) | 1,876 | 43 | 4 |
| [dexmos](https://www.npmjs.com/package/dexmos) | 1,851 | 23 | 1 |
| [@pyramation/cosmos-registry](https://www.npmjs.com/package/@pyramation/cosmos-registry) | 1,797 | 19 | 2 |
| [@cosmology/protobufs](https://www.npmjs.com/package/@cosmology/protobufs) | 1,711 | 125 | 10 |
| [@cosmology/ts-codegen-types](https://www.npmjs.com/package/@cosmology/ts-codegen-types) | 1,577 | 31 | 4 |
| [@uni-sign/cosmos-msgs](https://www.npmjs.com/package/@uni-sign/cosmos-msgs) | 1,572 | 84 | 16 |
| [chain-registry-utils](https://www.npmjs.com/package/chain-registry-utils) | 1,524 | 25 | 3 |
| [@uni-sign/types](https://www.npmjs.com/package/@uni-sign/types) | 1,425 | 55 | 2 |
| [cosmoscript](https://www.npmjs.com/package/cosmoscript) | 1,378 | 19 | 2 |
| [mesh-security](https://www.npmjs.com/package/mesh-security) | 1,369 | 24 | 2 |
| [@uni-sign/cosmos-query](https://www.npmjs.com/package/@uni-sign/cosmos-query) | 1,357 | 86 | 32 |
| [@uni-sign/cosmos](https://www.npmjs.com/package/@uni-sign/cosmos) | 1,354 | 58 | 12 |
| [@cosmology/cosmjs](https://www.npmjs.com/package/@cosmology/cosmjs) | 1,345 | 56 | 3 |
| [@uni-sign/utils](https://www.npmjs.com/package/@uni-sign/utils) | 1,332 | 44 | 3 |
| [teslapi](https://www.npmjs.com/package/teslapi) | 1,325 | 35 | 3 |
| [@cosmonauts/cosmos](https://www.npmjs.com/package/@cosmonauts/cosmos) | 1,173 | 42 | 4 |
| [teritorijs](https://www.npmjs.com/package/teritorijs) | 1,130 | 66 | 14 |
| [cpbf](https://www.npmjs.com/package/cpbf) | 1,057 | 22 | 1 |
| [teritori](https://www.npmjs.com/package/teritori) | 1,002 | 31 | 5 |
| *56 packages hidden (< 1,000 downloads)* | | | |

### stride

| Name | Total | Monthly | Weekly |
| ------- | ------ | ------- | ----- |
| _Total_ | 37,760 | 358 | 93 |
| [stridejs](https://www.npmjs.com/package/stridejs) | 37,760 | 358 | 93 |

### juno

| Name | Total | Monthly | Weekly |
| ------- | ------ | ------- | ----- |
| _Total_ | 46,957 | 455 | 85 |
| [juno-network](https://www.npmjs.com/package/juno-network) | 38,378 | 364 | 75 |
| [@juno-network/assets](https://www.npmjs.com/package/@juno-network/assets) | 8,579 | 91 | 10 |

### stargaze

| Name | Total | Monthly | Weekly |
| ------- | ------ | ------- | ----- |
| _Total_ | 34,366 | 375 | 118 |
| [stargazejs](https://www.npmjs.com/package/stargazejs) | 22,779 | 200 | 59 |
| [@stargaze-zone/contracts](https://www.npmjs.com/package/@stargaze-zone/contracts) | 4,773 | 67 | 27 |
| [@stargaze-zone/chain](https://www.npmjs.com/package/@stargaze-zone/chain) | 4,351 | 61 | 20 |
| [stargaze-query](https://www.npmjs.com/package/stargaze-query) | 2,463 | 47 | 12 |

### dydx

| Name | Total | Monthly | Weekly |
| ------- | ------ | ------- | ----- |
| _Total_ | 3,641,470 | 327,076 | 102,169 |
| [@dydxprotocol/v4-client-js](https://www.npmjs.com/package/@dydxprotocol/v4-client-js) | 3,641,470 | 327,076 | 102,169 |

### chain

| Name | Total | Monthly | Weekly |
| ------- | ------ | ------- | ----- |
| _Total_ | 13,543 | 191 | 18 |
| [@juno-network/swap](https://www.npmjs.com/package/@juno-network/swap) | 4,653 | 32 | 2 |
| [akashjs](https://www.npmjs.com/package/akashjs) | 4,057 | 25 | 4 |
| [autosmosis](https://www.npmjs.com/package/autosmosis) | 1,635 | 17 | 2 |
| [kavajs](https://www.npmjs.com/package/kavajs) | 1,111 | 31 | 2 |
| *4 packages hidden (< 1,000 downloads)* | | | |

### create-cosmos-app

| Name | Total | Monthly | Weekly |
| ------- | ------ | ------- | ----- |
| _Total_ | 21,295 | 297 | 45 |
| [create-cosmos-app](https://www.npmjs.com/package/create-cosmos-app) | 18,471 | 151 | 13 |
| [create-interchain-app](https://www.npmjs.com/package/create-interchain-app) | 2,824 | 146 | 32 |



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


<!-- README.md automatically generated on 2026-09-29T00:02:09.164Z from lib-count repository with latest download stats -->
