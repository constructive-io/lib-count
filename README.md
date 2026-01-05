
# Constructive NPM Downloads

<p align="center" width="100%">
   <img src="https://raw.githubusercontent.com/constructive-io/lib-count/refs/heads/main/assets/logo.svg" alt="hyperweb" width="80"><br />
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
      <img height="20" src="https://img.shields.io/endpoint?url=https%3A%2F%2Fraw.githubusercontent.com%2Fconstructive-io%2Flib-count%2Fmain%2Foutput%2Fbadges%2Flaunchql_category.json"/>
   </a>
   <a href="https://github.com/constructive-io/lib-count">
      <img height="20" src="https://img.shields.io/endpoint?url=https%3A%2F%2Fraw.githubusercontent.com%2Fconstructive-io%2Flib-count%2Fmain%2Foutput%2Fbadges%2Fhyperweb_category.json"/>
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

### Hyperweb (formerly Cosmology)

- 🔗 **Hyperweb GitHub Organization:** [**hyperweb-io**](https://github.com/hyperweb-io)
- 🌐 **Hyperweb Website:** [**hyperweb.io**](https://hyperweb.io)

📺 **Watch the [Hyperweb Announcement](https://www.youtube.com/watch?v=a_G2_KXRf1Y&list=PL_XyHnlG9MMvekTCbbJArAOwVlkCY54V5&index=2)**  
## Overall Download Statistics

| Category | Total | Monthly | Weekly |
| ------- | ------ | ------- | ----- |
| **Total** | 94,629,569 | 3,936,163 | 830,709 |
| Web2 | 34,726,258 | 1,902,939 | 400,228 |
| Web3 | 56,198,427 | 1,443,832 | 259,251 |
| Utilities | 4,568,630 | 589,392 | 171,230 |


---

# Modular Postgres Stack

Modular PostgreSQL tooling for full-stack TypeScript development.

| [Modular Postgres Portal](https://launchql.com): Quick Start | [PGPM](https://pgpm.io/): Postgres Package Manager | 
|:---:|:---:|

Modular PostgreSQL development with pgpm workspaces, reusable database modules, and end-to-end TypeScript testing 🐘

## Education and Tutorials

 1. 🚀 [Quickstart: Getting Up and Running](https://launchql.com/learn/quickstart)
Get started with modular databases in minutes. Install prerequisites and deploy your first module.

 2. 📦 [Modular PostgreSQL Development with Database Packages](https://launchql.com/learn/modular-postgres)
Learn to organize PostgreSQL projects with pgpm workspaces and reusable database modules.

 3. ✏️ [Authoring Database Changes](https://launchql.com/learn/authoring-database-changes)
Master the workflow for adding, organizing, and managing database changes with pgpm.

 4. 🧪 [End-to-End PostgreSQL Testing with TypeScript](https://launchql.com/learn/e2e-postgres-testing)
Master end-to-end PostgreSQL testing with ephemeral databases, RLS testing, and CI/CD automation.

 5. ⚡ [Supabase Testing](https://launchql.com/learn/supabase)
Use TypeScript-first tools to test Supabase projects with realistic RLS, policies, and auth contexts.

 6. 💧 [Drizzle ORM Testing](https://launchql.com/learn/drizzle-testing)
Run full-stack tests with Drizzle ORM, including database setup, teardown, and RLS enforcement.

 7. 🔧 [Troubleshooting](https://launchql.com/learn/troubleshooting)
Common issues and solutions for pgpm, PostgreSQL, and testing.

### 🧪 Testing

* [launchql/pgsql-test](https://github.com/constructive-io/launchql/tree/main/packages/pgsql-test): **📊 Isolated testing environments** with per-test transaction rollbacks—ideal for integration tests, complex migrations, and RLS simulation.
* [launchql/supabase-test](https://github.com/constructive-io/launchql/tree/main/packages/supabase-test): **🧪 Supabase-native test harness** preconfigured for the local Supabase stack—per-test rollbacks, JWT/role context helpers, and CI/GitHub Actions ready.
* [launchql/graphile-test](https://github.com/constructive-io/launchql/tree/main/packages/graphile-test): **🔐 Authentication mocking** for Graphile-focused test helpers and emulating row-level security contexts.
* [launchql/pg-query-context](https://github.com/constructive-io/launchql/tree/main/packages/pg-query-context): **🔒 Session context injection** to add session-local context (e.g., `SET LOCAL`) into queries—ideal for setting `role`, `jwt.claims`, and other session settings.

### 🧠 Parsing & AST

* [launchql/pgsql-parser](https://github.com/constructive-io/pgsql-parser): **🔄 SQL conversion engine** that interprets and converts PostgreSQL syntax.
* [launchql/libpg-query-node](https://github.com/constructive-io/libpg-query-node): **🌉 Node.js bindings** for `libpg_query`, converting SQL into parse trees.
* [launchql/pg-proto-parser](https://github.com/constructive-io/pg-proto-parser): **📦 Protobuf parser** for parsing PostgreSQL Protocol Buffers definitions to generate TypeScript interfaces, utility functions, and JSON mappings for enums.
* [@pgsql/enums](https://github.com/constructive-io/pgsql-parser/tree/main/packages/enums): **🏷️ TypeScript enums** for PostgreSQL AST for safe and ergonomic parsing logic.
* [@pgsql/types](https://github.com/constructive-io/pgsql-parser/tree/main/packages/types): **📝 Type definitions** for PostgreSQL AST nodes in TypeScript.
* [@pgsql/utils](https://github.com/constructive-io/pgsql-parser/tree/main/packages/utils): **🛠️ AST utilities** for constructing and transforming PostgreSQL syntax trees.
* [launchql/pg-ast](https://github.com/constructive-io/launchql/tree/main/packages/pg-ast): **🔍 Low-level AST tools** and transformations for Postgres query structures.

### 🚀 API & Dev Tools

* [launchql/server](https://github.com/constructive-io/launchql/tree/main/packages/server): **⚡ Express-based API server** powered by PostGraphile to expose a secure, scalable GraphQL API over your Postgres database.
* [launchql/explorer](https://github.com/constructive-io/launchql/tree/main/packages/explorer): **🔎 Visual API explorer** with GraphiQL for browsing across all databases and schemas—useful for debugging, documentation, and API prototyping.

### 🔁 Streaming & Uploads

* [launchql/s3-streamer](https://github.com/constructive-io/launchql/tree/main/packages/s3-streamer): **📤 Direct S3 streaming** for large files with support for metadata injection and content validation.
* [launchql/etag-hash](https://github.com/constructive-io/launchql/tree/main/packages/etag-hash): **🏷️ S3-compatible ETags** created by streaming and hashing file uploads in chunks.
* [launchql/etag-stream](https://github.com/constructive-io/launchql/tree/main/packages/etag-stream): **🔄 ETag computation** via Node stream transformer during upload or transfer.
* [launchql/uuid-hash](https://github.com/constructive-io/launchql/tree/main/packages/uuid-hash): **🆔 Deterministic UUIDs** generated from hashed content, great for deduplication and asset referencing.
* [launchql/uuid-stream](https://github.com/constructive-io/launchql/tree/main/packages/uuid-stream): **🌊 Streaming UUID generation** based on piped file content—ideal for upload pipelines.
* [launchql/upload-names](https://github.com/constructive-io/launchql/tree/main/packages/upload-names): **📂 Collision-resistant filenames** utility for structured and unique file names for uploads.

### 🧰 CLI & Codegen

* [pgpm](https://github.com/constructive-io/launchql/tree/main/packages/pgpm): **🖥️ PostgreSQL Package Manager** for modular Postgres development. Works with database workspaces, scaffolding, migrations, seeding, and installing database packages.
* [@launchql/cli](https://github.com/constructive-io/launchql/tree/main/packages/cli): **🖥️ Command-line toolkit** for managing LaunchQL projects—supports database scaffolding, migrations, seeding, code generation, and automation.
* [launchql/launchql-gen](https://github.com/constructive-io/launchql/tree/main/packages/launchql-gen): **✨ Auto-generated GraphQL** mutations and queries dynamically built from introspected schema data.
* [@launchql/query-builder](https://github.com/constructive-io/launchql/tree/main/packages/query-builder): **🏗️ SQL constructor** providing a robust TypeScript-based query builder for dynamic generation of `SELECT`, `INSERT`, `UPDATE`, `DELETE`, and stored procedure calls—supports advanced SQL features like `JOIN`, `GROUP BY`, and schema-qualified queries.
* [@launchql/query](https://github.com/constructive-io/launchql/tree/main/packages/query): **🧩 Fluent GraphQL builder** for PostGraphile schemas. ⚡ Schema-aware via introspection, 🧩 composable and ergonomic for building deeply nested queries.
---

# Interchain JavaScript Stack

A unified toolkit for building applications and smart contracts in the Interchain ecosystem with JavaScript.

A unified toolkit for building applications and smart contracts in the Interchain ecosystem ⚛️


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
## Table of Contents

- [launchql](#launchql)
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
- [utils](#utils)
- [create-cosmos-app](#create-cosmos-app)
- [kubernetesjs](#kubernetesjs)
- [pgpm](#pgpm)

### launchql

| Name | Total | Monthly | Weekly |
| ------- | ------ | ------- | ----- |
| _Total_ | 34,726,258 | 1,902,939 | 400,228 |
| [libpg-query](https://www.npmjs.com/package/libpg-query) | 8,188,609 | 288,293 | 48,885 |
| [pgsql-deparser](https://www.npmjs.com/package/pgsql-deparser) | 6,702,038 | 252,721 | 46,081 |
| [pgsql-enums](https://www.npmjs.com/package/pgsql-enums) | 6,556,981 | 127,200 | 16,989 |
| [pgsql-parser](https://www.npmjs.com/package/pgsql-parser) | 6,472,406 | 222,427 | 38,876 |
| [@pgsql/types](https://www.npmjs.com/package/@pgsql/types) | 3,586,655 | 287,734 | 49,061 |
| [@pgsql/utils](https://www.npmjs.com/package/@pgsql/utils) | 262,482 | 26,269 | 10,437 |
| [@launchql/protobufjs](https://www.npmjs.com/package/@launchql/protobufjs) | 246,510 | 37,751 | 8,158 |
| [@pgql/parse](https://www.npmjs.com/package/@pgql/parse) | 188,978 | 893 | 335 |
| [@pgsql/enums](https://www.npmjs.com/package/@pgsql/enums) | 170,004 | 29,306 | 5,352 |
| [@pyramation/postgraphile-plugin-fulltext-filter](https://www.npmjs.com/package/@pyramation/postgraphile-plugin-fulltext-filter) | 153,250 | 4,505 | 227 |
| [pg-proto-parser](https://www.npmjs.com/package/pg-proto-parser) | 151,474 | 37,137 | 6,536 |
| [@pgsql/traverse](https://www.npmjs.com/package/@pgsql/traverse) | 122,822 | 16,074 | 2,740 |
| [skitch-utils](https://www.npmjs.com/package/skitch-utils) | 105,095 | 8,098 | 2,118 |
| [@launchql/cli](https://www.npmjs.com/package/@launchql/cli) | 77,613 | 2,460 | 16 |
| [csv-to-pg](https://www.npmjs.com/package/csv-to-pg) | 57,926 | 37,725 | 11,053 |
| [@launchql/graphql-testing](https://www.npmjs.com/package/@launchql/graphql-testing) | 55,280 | 19 | 4 |
| [pg-ast](https://www.npmjs.com/package/pg-ast) | 52,805 | 35,537 | 9,185 |
| [pg-env](https://www.npmjs.com/package/pg-env) | 52,134 | 33,921 | 11,591 |
| [pg-cache](https://www.npmjs.com/package/pg-cache) | 50,259 | 32,632 | 11,497 |
| [skitch-templates](https://www.npmjs.com/package/skitch-templates) | 42,986 | 330 | 3 |
| [pgsql-test](https://www.npmjs.com/package/pgsql-test) | 42,400 | 20,434 | 6,828 |
| [graphile-meta-schema](https://www.npmjs.com/package/graphile-meta-schema) | 36,950 | 17,886 | 6,072 |
| [@launchql/server](https://www.npmjs.com/package/@launchql/server) | 36,551 | 2,249 | 11 |
| [graphile-search-plugin](https://www.npmjs.com/package/graphile-search-plugin) | 35,642 | 17,895 | 6,090 |
| [graphile-simple-inflector](https://www.npmjs.com/package/graphile-simple-inflector) | 35,380 | 17,770 | 6,046 |
| [graphile-i18n](https://www.npmjs.com/package/graphile-i18n) | 33,305 | 17,799 | 6,060 |
| [graphile-settings](https://www.npmjs.com/package/graphile-settings) | 33,218 | 17,544 | 6,055 |
| [@launchql/explorer](https://www.npmjs.com/package/@launchql/explorer) | 31,197 | 2,801 | 11 |
| [skitch-testing](https://www.npmjs.com/package/skitch-testing) | 30,678 | 251 | 0 |
| [@launchql/types](https://www.npmjs.com/package/@launchql/types) | 30,227 | 7,970 | 190 |
| [@launchql/db-testing](https://www.npmjs.com/package/@launchql/db-testing) | 30,113 | 756 | 7 |
| [@launchql/server-utils](https://www.npmjs.com/package/@launchql/server-utils) | 29,576 | 5,283 | 104 |
| [graphile-test](https://www.npmjs.com/package/graphile-test) | 29,544 | 16,614 | 6,105 |
| [graphile-query](https://www.npmjs.com/package/graphile-query) | 28,272 | 13,469 | 4,787 |
| [pg-query-native-latest](https://www.npmjs.com/package/pg-query-native-latest) | 26,194 | 8 | 1 |
| [@launchql/core](https://www.npmjs.com/package/@launchql/core) | 25,347 | 5,263 | 106 |
| [@launchql/env](https://www.npmjs.com/package/@launchql/env) | 25,332 | 7,053 | 133 |
| [@launchql/db-utils](https://www.npmjs.com/package/@launchql/db-utils) | 24,317 | 754 | 6 |
| [graphile-cache](https://www.npmjs.com/package/graphile-cache) | 24,249 | 12,905 | 4,998 |
| [@launchql/db-migrate](https://www.npmjs.com/package/@launchql/db-migrate) | 22,593 | 13 | 3 |
| [@pgsql/parser](https://www.npmjs.com/package/@pgsql/parser) | 22,555 | 1,711 | 372 |
| [@launchql/templatizer](https://www.npmjs.com/package/@launchql/templatizer) | 22,101 | 3,983 | 83 |
| [@launchql/logger](https://www.npmjs.com/package/@launchql/logger) | 21,649 | 5,165 | 96 |
| [@launchql/db-templates](https://www.npmjs.com/package/@launchql/db-templates) | 20,576 | 16 | 5 |
| [@launchql/s3-streamer](https://www.npmjs.com/package/@launchql/s3-streamer) | 19,712 | 3,643 | 16 |
| [pg-query-context](https://www.npmjs.com/package/pg-query-context) | 17,834 | 10,845 | 4,601 |
| [@launchql/content-type-stream](https://www.npmjs.com/package/@launchql/content-type-stream) | 17,769 | 3,193 | 13 |
| [@launchql/postmaster](https://www.npmjs.com/package/@launchql/postmaster) | 17,558 | 15,979 | 3,216 |
| [gql-ast](https://www.npmjs.com/package/gql-ast) | 17,541 | 10,600 | 4,710 |
| [graphile-postgis](https://www.npmjs.com/package/graphile-postgis) | 17,466 | 16,416 | 6,121 |
| [@launchql/upload-names](https://www.npmjs.com/package/@launchql/upload-names) | 17,385 | 3,100 | 14 |
| [graphile-plugin-connection-filter](https://www.npmjs.com/package/graphile-plugin-connection-filter) | 17,132 | 16,813 | 6,292 |
| [postgraphile-derived-upload-field](https://www.npmjs.com/package/postgraphile-derived-upload-field) | 16,910 | 1,208 | 3 |
| [@launchql/mjml](https://www.npmjs.com/package/@launchql/mjml) | 16,799 | 15,979 | 3,219 |
| [@launchql/styled-email](https://www.npmjs.com/package/@launchql/styled-email) | 16,581 | 15,980 | 3,216 |
| [graphile-plugin-fulltext-filter](https://www.npmjs.com/package/graphile-plugin-fulltext-filter) | 16,517 | 16,082 | 6,074 |
| [graphile-plugin-connection-filter-postgis](https://www.npmjs.com/package/graphile-plugin-connection-filter-postgis) | 16,331 | 16,155 | 6,089 |
| [graphile-pg-type-mappings](https://www.npmjs.com/package/graphile-pg-type-mappings) | 16,145 | 16,036 | 6,075 |
| [graphile-upload-plugin](https://www.npmjs.com/package/graphile-upload-plugin) | 16,084 | 15,793 | 6,038 |
| [pg-query-string](https://www.npmjs.com/package/pg-query-string) | 14,722 | 9,035 | 4,277 |
| [@launchql/url-domains](https://www.npmjs.com/package/@launchql/url-domains) | 13,335 | 2,316 | 18 |
| [@launchql/ext-types](https://www.npmjs.com/package/@launchql/ext-types) | 12,892 | 60 | 5 |
| [@launchql/ext-default-roles](https://www.npmjs.com/package/@launchql/ext-default-roles) | 12,836 | 62 | 4 |
| [@launchql/ext-verify](https://www.npmjs.com/package/@launchql/ext-verify) | 12,802 | 59 | 2 |
| [@launchql/ext-measurements](https://www.npmjs.com/package/@launchql/ext-measurements) | 12,683 | 57 | 2 |
| [@launchql/ext-defaults](https://www.npmjs.com/package/@launchql/ext-defaults) | 12,615 | 58 | 3 |
| [@launchql/ext-jobs](https://www.npmjs.com/package/@launchql/ext-jobs) | 12,213 | 57 | 2 |
| [@launchql/base32](https://www.npmjs.com/package/@launchql/base32) | 11,729 | 98 | 5 |
| [@launchql/db-transform](https://www.npmjs.com/package/@launchql/db-transform) | 11,654 | 752 | 6 |
| [pg-codegen](https://www.npmjs.com/package/pg-codegen) | 11,221 | 5,243 | 1,368 |
| [@launchql/inflection](https://www.npmjs.com/package/@launchql/inflection) | 11,177 | 105 | 1 |
| [@launchql/totp](https://www.npmjs.com/package/@launchql/totp) | 11,155 | 55 | 6 |
| [graphile-column-privileges-mutations](https://www.npmjs.com/package/graphile-column-privileges-mutations) | 10,724 | 100 | 29 |
| [@launchql/faker](https://www.npmjs.com/package/@launchql/faker) | 10,575 | 58 | 5 |
| [supabase-test](https://www.npmjs.com/package/supabase-test) | 10,443 | 6,078 | 1,406 |
| [@launchql/graphile-settings](https://www.npmjs.com/package/@launchql/graphile-settings) | 10,392 | 27 | 1 |
| [@launchql/ext-jobs-queue](https://www.npmjs.com/package/@launchql/ext-jobs-queue) | 10,376 | 62 | 4 |
| [@launchql/ext-jwt-claims](https://www.npmjs.com/package/@launchql/ext-jwt-claims) | 10,105 | 54 | 4 |
| [@launchql/db-template](https://www.npmjs.com/package/@launchql/db-template) | 9,996 | 748 | 2 |
| [@launchql/ext-achievements](https://www.npmjs.com/package/@launchql/ext-achievements) | 9,882 | 50 | 4 |
| [@launchql/codegen](https://www.npmjs.com/package/@launchql/codegen) | 8,693 | 1,682 | 10 |
| [skitch-transform](https://www.npmjs.com/package/skitch-transform) | 8,162 | 98 | 3 |
| [pg-utils](https://www.npmjs.com/package/pg-utils) | 7,952 | 54 | 11 |
| [@launchql/react](https://www.npmjs.com/package/@launchql/react) | 7,932 | 1,205 | 4 |
| [@launchql/ext-stamps](https://www.npmjs.com/package/@launchql/ext-stamps) | 7,889 | 41 | 3 |
| [@launchql/ext-uuid](https://www.npmjs.com/package/@launchql/ext-uuid) | 7,730 | 44 | 4 |
| [graphile-gen](https://www.npmjs.com/package/graphile-gen) | 7,275 | 10 | 3 |
| [@launchql/db-env](https://www.npmjs.com/package/@launchql/db-env) | 6,784 | 750 | 5 |
| [skitch-types](https://www.npmjs.com/package/skitch-types) | 6,728 | 90 | 2 |
| [@launchql/ext-utils](https://www.npmjs.com/package/@launchql/ext-utils) | 6,690 | 36 | 3 |
| [@launchql/proto-cli](https://www.npmjs.com/package/@launchql/proto-cli) | 6,459 | 33 | 2 |
| [@launchql/utils](https://www.npmjs.com/package/@launchql/utils) | 6,409 | 59 | 2 |
| [@launchql/openfaas-job-worker](https://www.npmjs.com/package/@launchql/openfaas-job-worker) | 6,266 | 5 | 2 |
| [@libpg-query/parser](https://www.npmjs.com/package/@libpg-query/parser) | 6,253 | 3,483 | 2,078 |
| [skitch-path](https://www.npmjs.com/package/skitch-path) | 6,171 | 54 | 3 |
| [drizzle-orm-test](https://www.npmjs.com/package/drizzle-orm-test) | 6,127 | 5,088 | 1,277 |
| [@launchql/s3-utils](https://www.npmjs.com/package/@launchql/s3-utils) | 5,975 | 1,774 | 8 |
| [skitch-ext-utilities](https://www.npmjs.com/package/skitch-ext-utilities) | 3,928 | 7 | 1 |
| [skitch-ext-verify](https://www.npmjs.com/package/skitch-ext-verify) | 3,889 | 7 | 2 |
| [skitch-prompt](https://www.npmjs.com/package/skitch-prompt) | 3,792 | 33 | 0 |
| [skitch-ext-defaults](https://www.npmjs.com/package/skitch-ext-defaults) | 3,749 | 11 | 1 |
| [skitch-env](https://www.npmjs.com/package/skitch-env) | 3,606 | 31 | 0 |
| [@launchql/openfaas-job-fn](https://www.npmjs.com/package/@launchql/openfaas-job-fn) | 3,444 | 7 | 2 |
| [@launchql/query](https://www.npmjs.com/package/@launchql/query) | 3,343 | 535 | 6 |
| [graphile-gen-js](https://www.npmjs.com/package/graphile-gen-js) | 3,250 | 2 | 0 |
| [@launchql/migrate](https://www.npmjs.com/package/@launchql/migrate) | 3,153 | 17 | 0 |
| [@launchql/graphile-query](https://www.npmjs.com/package/@launchql/graphile-query) | 3,055 | 10 | 0 |
| [skitch-extension-verify](https://www.npmjs.com/package/skitch-extension-verify) | 2,957 | 32 | 2 |
| [@launchql/openfaas-job-service](https://www.npmjs.com/package/@launchql/openfaas-job-service) | 2,938 | 10 | 3 |
| [@launchql/job-utils](https://www.npmjs.com/package/@launchql/job-utils) | 2,791 | 1,085 | 19 |
| [skitch-extension-utils](https://www.npmjs.com/package/skitch-extension-utils) | 2,772 | 30 | 1 |
| [@launchql/job-worker](https://www.npmjs.com/package/@launchql/job-worker) | 2,723 | 856 | 6 |
| [skitch-install](https://www.npmjs.com/package/skitch-install) | 2,654 | 34 | 3 |
| [@pgsql/transform](https://www.npmjs.com/package/@pgsql/transform) | 2,651 | 923 | 246 |
| [skitch-extension-defaults](https://www.npmjs.com/package/skitch-extension-defaults) | 2,479 | 25 | 1 |
| [@launchql/job-scheduler](https://www.npmjs.com/package/@launchql/job-scheduler) | 2,443 | 934 | 5 |
| [skitch-extension-jobs](https://www.npmjs.com/package/skitch-extension-jobs) | 2,421 | 20 | 0 |
| [@launchql/job-pg](https://www.npmjs.com/package/@launchql/job-pg) | 2,389 | 920 | 14 |
| [@launchql/client](https://www.npmjs.com/package/@launchql/client) | 2,386 | 469 | 2 |
| [@launchql/protobufjs-cli](https://www.npmjs.com/package/@launchql/protobufjs-cli) | 2,330 | 396 | 243 |
| [launchql-test](https://www.npmjs.com/package/launchql-test) | 2,317 | 1,136 | 5 |
| [@launchql/orm](https://www.npmjs.com/package/@launchql/orm) | 2,272 | 457 | 2 |
| [@launchql/query-builder](https://www.npmjs.com/package/@launchql/query-builder) | 2,265 | 449 | 2 |
| [skitch-extension-default-roles](https://www.npmjs.com/package/skitch-extension-default-roles) | 2,161 | 24 | 0 |
| [launchql-client](https://www.npmjs.com/package/launchql-client) | 2,116 | 5 | 1 |
| [@launchql/openfaas-job-util-jobs](https://www.npmjs.com/package/@launchql/openfaas-job-util-jobs) | 1,607 | 3 | 1 |
| [@launchql/geo-types](https://www.npmjs.com/package/@launchql/geo-types) | 1,460 | 8 | 1 |
| [launchql-gen](https://www.npmjs.com/package/launchql-gen) | 1,361 | 16 | 0 |
| [@launchql/mmmagic](https://www.npmjs.com/package/@launchql/mmmagic) | 1,336 | 7 | 0 |
| [@launchql/openfaas-job-server](https://www.npmjs.com/package/@launchql/openfaas-job-server) | 1,312 | 3 | 1 |
| [graphile-client](https://www.npmjs.com/package/graphile-client) | 1,281 | 3 | 0 |
| [graphile-gen-sql](https://www.npmjs.com/package/graphile-gen-sql) | 1,258 | 2 | 1 |
| [@launchql/ast](https://www.npmjs.com/package/@launchql/ast) | 1,202 | 41 | 8 |
| [@launchql/openfaas-env](https://www.npmjs.com/package/@launchql/openfaas-env) | 1,202 | 6 | 1 |
| [@launchql/job-api-server](https://www.npmjs.com/package/@launchql/job-api-server) | 1,113 | 3 | 1 |
| [csv-to-gql](https://www.npmjs.com/package/csv-to-gql) | 1,102 | 7 | 2 |
| [@launchql/ext-status](https://www.npmjs.com/package/@launchql/ext-status) | 1,035 | 6 | 1 |
| *49 packages hidden (< 1,000 downloads)* | | | |

### protobufs

| Name | Total | Monthly | Weekly |
| ------- | ------ | ------- | ----- |
| _Total_ | 5,213,682 | 63,278 | 8,284 |
| [@cosmology/protobufjs](https://www.npmjs.com/package/@cosmology/protobufjs) | 1,144,648 | 23,282 | 3,693 |
| [@protobufs/gogoproto](https://www.npmjs.com/package/@protobufs/gogoproto) | 571,185 | 5,334 | 536 |
| [@protobufs/google](https://www.npmjs.com/package/@protobufs/google) | 570,257 | 5,383 | 535 |
| [@protobufs/cosmos_proto](https://www.npmjs.com/package/@protobufs/cosmos_proto) | 553,377 | 5,241 | 539 |
| [@protobufs/cosmos](https://www.npmjs.com/package/@protobufs/cosmos) | 552,872 | 5,261 | 545 |
| [@protobufs/tendermint](https://www.npmjs.com/package/@protobufs/tendermint) | 548,109 | 5,221 | 521 |
| [@pyramation/protobufjs](https://www.npmjs.com/package/@pyramation/protobufjs) | 403,490 | 2,752 | 164 |
| [@protobufs/confio](https://www.npmjs.com/package/@protobufs/confio) | 210,781 | 2,699 | 390 |
| [@protobufs/ibc](https://www.npmjs.com/package/@protobufs/ibc) | 206,875 | 2,683 | 395 |
| [@protobufs/amino](https://www.npmjs.com/package/@protobufs/amino) | 203,995 | 2,878 | 424 |
| [@protobufs/cosmwasm](https://www.npmjs.com/package/@protobufs/cosmwasm) | 192,473 | 1,948 | 368 |
| [@protobufs/osmosis](https://www.npmjs.com/package/@protobufs/osmosis) | 25,587 | 376 | 86 |
| [@protobufs/juno](https://www.npmjs.com/package/@protobufs/juno) | 3,556 | 10 | 4 |
| [@protobufs/injective](https://www.npmjs.com/package/@protobufs/injective) | 3,472 | 97 | 22 |
| [@protobufs/akash](https://www.npmjs.com/package/@protobufs/akash) | 1,945 | 6 | 4 |
| [@protobufs/stargaze](https://www.npmjs.com/package/@protobufs/stargaze) | 1,852 | 29 | 5 |
| [@protobufs/regen](https://www.npmjs.com/package/@protobufs/regen) | 1,710 | 11 | 6 |
| [@protobufs/secret](https://www.npmjs.com/package/@protobufs/secret) | 1,668 | 5 | 2 |
| [@protobufs/bcna](https://www.npmjs.com/package/@protobufs/bcna) | 1,520 | 9 | 3 |
| [@protobufs/pylons](https://www.npmjs.com/package/@protobufs/pylons) | 1,432 | 3 | 2 |
| [@protobufs/comdex](https://www.npmjs.com/package/@protobufs/comdex) | 1,177 | 5 | 3 |
| *29 packages hidden (< 1,000 downloads)* | | | |

### chain-registry

| Name | Total | Monthly | Weekly |
| ------- | ------ | ------- | ----- |
| _Total_ | 11,442,460 | 270,346 | 52,093 |
| [@chain-registry/types](https://www.npmjs.com/package/@chain-registry/types) | 3,799,167 | 84,205 | 13,245 |
| [chain-registry](https://www.npmjs.com/package/chain-registry) | 1,731,963 | 47,487 | 11,287 |
| [@chain-registry/keplr](https://www.npmjs.com/package/@chain-registry/keplr) | 1,501,085 | 32,625 | 5,727 |
| [@chain-registry/utils](https://www.npmjs.com/package/@chain-registry/utils) | 1,228,785 | 27,663 | 4,174 |
| [@chain-registry/cosmostation](https://www.npmjs.com/package/@chain-registry/cosmostation) | 1,122,077 | 24,316 | 4,586 |
| [@chain-registry/client](https://www.npmjs.com/package/@chain-registry/client) | 985,545 | 25,819 | 3,920 |
| [@chain-registry/v2](https://www.npmjs.com/package/@chain-registry/v2) | 187,947 | 4,197 | 1,057 |
| [@chain-registry/v2-types](https://www.npmjs.com/package/@chain-registry/v2-types) | 184,577 | 3,587 | 855 |
| [@chain-registry/assets](https://www.npmjs.com/package/@chain-registry/assets) | 143,686 | 6,385 | 1,953 |
| [@chain-registry/osmosis](https://www.npmjs.com/package/@chain-registry/osmosis) | 142,878 | 2,463 | 932 |
| [@chain-registry/juno](https://www.npmjs.com/package/@chain-registry/juno) | 91,166 | 3,848 | 1,512 |
| [@chain-registry/interfaces](https://www.npmjs.com/package/@chain-registry/interfaces) | 59,499 | 2,274 | 623 |
| [@chain-registry/v2-keplr](https://www.npmjs.com/package/@chain-registry/v2-keplr) | 52,862 | 551 | 311 |
| [@chain-registry/workflows](https://www.npmjs.com/package/@chain-registry/workflows) | 52,493 | 1,733 | 195 |
| [@chain-registry/cli](https://www.npmjs.com/package/@chain-registry/cli) | 49,643 | 2,014 | 594 |
| [@chain-registry/v2-utils](https://www.npmjs.com/package/@chain-registry/v2-utils) | 40,209 | 415 | 398 |
| [@chain-registry/v2-client](https://www.npmjs.com/package/@chain-registry/v2-client) | 37,273 | 412 | 392 |
| [@chain-registry/v2-cosmostation](https://www.npmjs.com/package/@chain-registry/v2-cosmostation) | 31,605 | 352 | 332 |

### cosmos-kit

| Name | Total | Monthly | Weekly |
| ------- | ------ | ------- | ----- |
| _Total_ | 2,698,767 | 53,323 | 7,959 |
| [@cosmos-kit/core](https://www.npmjs.com/package/@cosmos-kit/core) | 1,031,178 | 16,804 | 2,671 |
| [@cosmos-kit/walletconnect](https://www.npmjs.com/package/@cosmos-kit/walletconnect) | 760,085 | 13,127 | 1,939 |
| [@cosmos-kit/react-lite](https://www.npmjs.com/package/@cosmos-kit/react-lite) | 343,776 | 8,267 | 1,196 |
| [@cosmos-kit/react](https://www.npmjs.com/package/@cosmos-kit/react) | 322,911 | 8,119 | 1,443 |
| [@interchain-kit/core](https://www.npmjs.com/package/@interchain-kit/core) | 99,477 | 3,177 | 420 |
| [cosmos-kit](https://www.npmjs.com/package/cosmos-kit) | 95,723 | 2,293 | 135 |
| [@interchain-kit/react](https://www.npmjs.com/package/@interchain-kit/react) | 26,025 | 960 | 133 |
| [interchain-kit](https://www.npmjs.com/package/interchain-kit) | 13,545 | 343 | 11 |
| [@interchain-kit/vue](https://www.npmjs.com/package/@interchain-kit/vue) | 6,047 | 233 | 11 |

### cosmos-kit-wallets

| Name | Total | Monthly | Weekly |
| ------- | ------ | ------- | ----- |
| _Total_ | 14,577,788 | 271,459 | 38,527 |
| [@cosmos-kit/keplr-extension](https://www.npmjs.com/package/@cosmos-kit/keplr-extension) | 728,186 | 12,697 | 1,952 |
| [@cosmos-kit/keplr](https://www.npmjs.com/package/@cosmos-kit/keplr) | 717,979 | 11,939 | 1,655 |
| [@cosmos-kit/leap-extension](https://www.npmjs.com/package/@cosmos-kit/leap-extension) | 697,424 | 12,055 | 1,824 |
| [@cosmos-kit/leap-extension](https://www.npmjs.com/package/@cosmos-kit/leap-extension) | 697,424 | 12,055 | 1,824 |
| [@cosmos-kit/keplr-mobile](https://www.npmjs.com/package/@cosmos-kit/keplr-mobile) | 694,845 | 12,364 | 1,924 |
| [@cosmos-kit/leap](https://www.npmjs.com/package/@cosmos-kit/leap) | 675,933 | 11,133 | 1,712 |
| [@cosmos-kit/leap-mobile](https://www.npmjs.com/package/@cosmos-kit/leap-mobile) | 630,694 | 10,988 | 1,677 |
| [@cosmos-kit/cosmostation-extension](https://www.npmjs.com/package/@cosmos-kit/cosmostation-extension) | 613,770 | 10,684 | 1,584 |
| [@cosmos-kit/leap-metamask-cosmos-snap](https://www.npmjs.com/package/@cosmos-kit/leap-metamask-cosmos-snap) | 587,338 | 11,261 | 1,592 |
| [@cosmos-kit/cosmostation](https://www.npmjs.com/package/@cosmos-kit/cosmostation) | 586,554 | 8,935 | 1,303 |
| [@cosmos-kit/cosmostation-mobile](https://www.npmjs.com/package/@cosmos-kit/cosmostation-mobile) | 570,573 | 9,647 | 1,315 |
| [@cosmos-kit/okxwallet-extension](https://www.npmjs.com/package/@cosmos-kit/okxwallet-extension) | 470,173 | 8,324 | 1,235 |
| [@cosmos-kit/xdefi-extension](https://www.npmjs.com/package/@cosmos-kit/xdefi-extension) | 469,129 | 6,440 | 1,167 |
| [@cosmos-kit/trust](https://www.npmjs.com/package/@cosmos-kit/trust) | 444,922 | 8,260 | 1,316 |
| [@cosmos-kit/trust-mobile](https://www.npmjs.com/package/@cosmos-kit/trust-mobile) | 444,224 | 8,286 | 1,303 |
| [@cosmos-kit/station-extension](https://www.npmjs.com/package/@cosmos-kit/station-extension) | 442,320 | 6,762 | 1,173 |
| [@cosmos-kit/station](https://www.npmjs.com/package/@cosmos-kit/station) | 440,610 | 6,764 | 1,172 |
| [@cosmos-kit/xdefi](https://www.npmjs.com/package/@cosmos-kit/xdefi) | 440,105 | 6,342 | 1,118 |
| [@cosmos-kit/trust-extension](https://www.npmjs.com/package/@cosmos-kit/trust-extension) | 431,304 | 8,260 | 1,301 |
| [@cosmos-kit/okxwallet](https://www.npmjs.com/package/@cosmos-kit/okxwallet) | 393,824 | 6,365 | 1,094 |
| [@cosmos-kit/cdcwallet-extension](https://www.npmjs.com/package/@cosmos-kit/cdcwallet-extension) | 371,814 | 7,790 | 1,140 |
| [@cosmos-kit/cdcwallet](https://www.npmjs.com/package/@cosmos-kit/cdcwallet) | 371,620 | 7,784 | 1,161 |
| [@cosmos-kit/omni-mobile](https://www.npmjs.com/package/@cosmos-kit/omni-mobile) | 125,346 | 2,559 | 312 |
| [@cosmos-kit/omni](https://www.npmjs.com/package/@cosmos-kit/omni) | 121,303 | 2,671 | 304 |
| [@cosmos-kit/compass-extension](https://www.npmjs.com/package/@cosmos-kit/compass-extension) | 120,202 | 2,434 | 243 |
| [@cosmos-kit/ledger](https://www.npmjs.com/package/@cosmos-kit/ledger) | 115,110 | 2,429 | 253 |
| [@cosmos-kit/compass](https://www.npmjs.com/package/@cosmos-kit/compass) | 113,065 | 2,411 | 246 |
| [@cosmos-kit/fin-extension](https://www.npmjs.com/package/@cosmos-kit/fin-extension) | 108,156 | 2,385 | 235 |
| [@cosmos-kit/coin98-extension](https://www.npmjs.com/package/@cosmos-kit/coin98-extension) | 107,273 | 2,681 | 249 |
| [@cosmos-kit/coin98](https://www.npmjs.com/package/@cosmos-kit/coin98) | 107,243 | 2,233 | 150 |
| [@cosmos-kit/fin](https://www.npmjs.com/package/@cosmos-kit/fin) | 102,779 | 2,428 | 233 |
| [@cosmos-kit/vectis](https://www.npmjs.com/package/@cosmos-kit/vectis) | 102,684 | 850 | 191 |
| [@cosmos-kit/shell-extension](https://www.npmjs.com/package/@cosmos-kit/shell-extension) | 101,712 | 2,384 | 230 |
| [@cosmos-kit/exodus-extension](https://www.npmjs.com/package/@cosmos-kit/exodus-extension) | 101,408 | 2,345 | 235 |
| [@cosmos-kit/shell](https://www.npmjs.com/package/@cosmos-kit/shell) | 100,243 | 2,234 | 143 |
| [@cosmos-kit/vectis-extension](https://www.npmjs.com/package/@cosmos-kit/vectis-extension) | 99,883 | 592 | 31 |
| [@cosmos-kit/exodus](https://www.npmjs.com/package/@cosmos-kit/exodus) | 99,677 | 2,354 | 231 |
| [@cosmos-kit/frontier-extension](https://www.npmjs.com/package/@cosmos-kit/frontier-extension) | 81,801 | 699 | 148 |
| [@cosmos-kit/frontier](https://www.npmjs.com/package/@cosmos-kit/frontier) | 80,613 | 677 | 147 |
| [@cosmos-kit/owallet-extension](https://www.npmjs.com/package/@cosmos-kit/owallet-extension) | 76,368 | 2,197 | 161 |
| [@cosmos-kit/owallet](https://www.npmjs.com/package/@cosmos-kit/owallet) | 76,173 | 2,106 | 158 |
| [@cosmos-kit/tailwind-extension](https://www.npmjs.com/package/@cosmos-kit/tailwind-extension) | 76,162 | 2,151 | 135 |
| [@cosmos-kit/tailwind](https://www.npmjs.com/package/@cosmos-kit/tailwind) | 75,674 | 2,161 | 163 |
| [@cosmos-kit/cosmos-extension-metamask](https://www.npmjs.com/package/@cosmos-kit/cosmos-extension-metamask) | 64,076 | 1,508 | 224 |
| [@cosmos-kit/galaxy-station](https://www.npmjs.com/package/@cosmos-kit/galaxy-station) | 55,541 | 2,000 | 150 |
| [@cosmos-kit/galaxy-station-extension](https://www.npmjs.com/package/@cosmos-kit/galaxy-station-extension) | 55,401 | 2,036 | 142 |
| [@cosmos-kit/web3auth](https://www.npmjs.com/package/@cosmos-kit/web3auth) | 43,798 | 585 | 249 |
| [@cosmos-kit/okto-extension](https://www.npmjs.com/package/@cosmos-kit/okto-extension) | 42,359 | 222 | 36 |
| [@cosmos-kit/owallet-mobile](https://www.npmjs.com/package/@cosmos-kit/owallet-mobile) | 40,809 | 2,044 | 144 |
| [@cosmos-kit/ctrl-extension](https://www.npmjs.com/package/@cosmos-kit/ctrl-extension) | 33,447 | 1,986 | 140 |
| [@cosmos-kit/ctrl](https://www.npmjs.com/package/@cosmos-kit/ctrl) | 33,182 | 2,001 | 132 |
| [@cosmos-kit/galaxy-station-mobile](https://www.npmjs.com/package/@cosmos-kit/galaxy-station-mobile) | 27,280 | 1,946 | 129 |
| [@cosmos-kit/imtoken-extension](https://www.npmjs.com/package/@cosmos-kit/imtoken-extension) | 16,686 | 242 | 37 |
| [@cosmos-kit/imtoken](https://www.npmjs.com/package/@cosmos-kit/imtoken) | 16,660 | 221 | 24 |
| [@cosmos-kit/ninji-extension](https://www.npmjs.com/package/@cosmos-kit/ninji-extension) | 15,473 | 271 | 55 |
| [@cosmos-kit/ninji](https://www.npmjs.com/package/@cosmos-kit/ninji) | 14,266 | 289 | 91 |
| [@cosmos-kit/ins](https://www.npmjs.com/package/@cosmos-kit/ins) | 12,631 | 277 | 100 |
| [@cosmos-kit/leap-capsule-social-login](https://www.npmjs.com/package/@cosmos-kit/leap-capsule-social-login) | 10,019 | 716 | 40 |
| [@cosmos-kit/bitgetwallet-extension](https://www.npmjs.com/package/@cosmos-kit/bitgetwallet-extension) | 8,861 | 1,653 | 97 |
| [@cosmos-kit/initia-extension](https://www.npmjs.com/package/@cosmos-kit/initia-extension) | 7,797 | 409 | 80 |
| [@cosmos-kit/initia](https://www.npmjs.com/package/@cosmos-kit/initia) | 7,257 | 279 | 82 |
| [@cosmos-kit/walletconnect-v1](https://www.npmjs.com/package/@cosmos-kit/walletconnect-v1) | 6,849 | 21 | 9 |
| [@cosmos-kit/types](https://www.npmjs.com/package/@cosmos-kit/types) | 4,667 | 11 | 4 |
| [@cosmos-kit/config](https://www.npmjs.com/package/@cosmos-kit/config) | 3,559 | 12 | 8 |
| [@cosmos-kit/registry](https://www.npmjs.com/package/@cosmos-kit/registry) | 3,471 | 16 | 13 |
| [@cosmos-wallet/react](https://www.npmjs.com/package/@cosmos-wallet/react) | 3,067 | 16 | 13 |
| [@cosmos-kit/gatewallet-extension](https://www.npmjs.com/package/@cosmos-kit/gatewallet-extension) | 3,047 | 602 | 76 |
| [@cosmos-kit/walletconnect-v2](https://www.npmjs.com/package/@cosmos-kit/walletconnect-v2) | 2,820 | 14 | 4 |
| [@cosmos-wallet/core](https://www.npmjs.com/package/@cosmos-wallet/core) | 2,585 | 14 | 11 |
| [@cosmos-kit/wallets](https://www.npmjs.com/package/@cosmos-kit/wallets) | 2,400 | 3 | 1 |
| [@cosmos-kit/arculus-mobile](https://www.npmjs.com/package/@cosmos-kit/arculus-mobile) | 2,244 | 248 | 32 |
| [@cosmos-kit/arculus](https://www.npmjs.com/package/@cosmos-kit/arculus) | 2,216 | 231 | 33 |
| [@cosmos-kit/terrastation-extension](https://www.npmjs.com/package/@cosmos-kit/terrastation-extension) | 2,060 | 12 | 8 |
| [@cosmos-kit/prax-extension](https://www.npmjs.com/package/@cosmos-kit/prax-extension) | 2,000 | 220 | 26 |
| [@cosmos-kit/terrastation](https://www.npmjs.com/package/@cosmos-kit/terrastation) | 1,999 | 13 | 8 |
| [@cosmos-kit/aria-extension](https://www.npmjs.com/package/@cosmos-kit/aria-extension) | 1,950 | 413 | 162 |
| [@cosmos-kit/gatewallet](https://www.npmjs.com/package/@cosmos-kit/gatewallet) | 1,758 | 228 | 35 |
| [@cosmos-kit/aria-mobile](https://www.npmjs.com/package/@cosmos-kit/aria-mobile) | 1,288 | 364 | 139 |
| [@cosmos-kit/aria](https://www.npmjs.com/package/@cosmos-kit/aria) | 1,256 | 344 | 135 |
| [@cosmos-wallet/registry](https://www.npmjs.com/package/@cosmos-wallet/registry) | 1,098 | 3 | 1 |
| [@cosmos-kit/bitgetwallet](https://www.npmjs.com/package/@cosmos-kit/bitgetwallet) | 1,050 | 239 | 23 |
| *10 packages hidden (< 1,000 downloads)* | | | |

### telescope

| Name | Total | Monthly | Weekly |
| ------- | ------ | ------- | ----- |
| _Total_ | 10,758,608 | 262,669 | 33,277 |
| [@osmonauts/lcd](https://www.npmjs.com/package/@osmonauts/lcd) | 2,671,558 | 116,005 | 10,233 |
| [@cosmology/utils](https://www.npmjs.com/package/@cosmology/utils) | 991,867 | 21,889 | 3,450 |
| [@cosmology/types](https://www.npmjs.com/package/@cosmology/types) | 991,036 | 21,881 | 3,459 |
| [@cosmology/proto-parser](https://www.npmjs.com/package/@cosmology/proto-parser) | 967,521 | 21,965 | 3,417 |
| [@cosmology/lcd](https://www.npmjs.com/package/@cosmology/lcd) | 838,756 | 22,335 | 4,571 |
| [@cosmology/ast](https://www.npmjs.com/package/@cosmology/ast) | 744,020 | 16,295 | 2,484 |
| [@osmonauts/helpers](https://www.npmjs.com/package/@osmonauts/helpers) | 693,779 | 7,708 | 942 |
| [@cosmology/telescope](https://www.npmjs.com/package/@cosmology/telescope) | 658,871 | 19,134 | 2,950 |
| [@osmonauts/telescope](https://www.npmjs.com/package/@osmonauts/telescope) | 458,542 | 3,078 | 484 |
| [@osmonauts/ast](https://www.npmjs.com/package/@osmonauts/ast) | 445,272 | 3,058 | 423 |
| [@osmonauts/proto-parser](https://www.npmjs.com/package/@osmonauts/proto-parser) | 443,898 | 2,979 | 331 |
| [@osmonauts/types](https://www.npmjs.com/package/@osmonauts/types) | 441,256 | 2,865 | 228 |
| [@osmonauts/utils](https://www.npmjs.com/package/@osmonauts/utils) | 412,232 | 3,477 | 305 |

### cosmwasm

| Name | Total | Monthly | Weekly |
| ------- | ------ | ------- | ----- |
| _Total_ | 5,838,278 | 90,342 | 13,057 |
| [@cosmwasm/ts-codegen](https://www.npmjs.com/package/@cosmwasm/ts-codegen) | 1,538,290 | 23,307 | 3,487 |
| [wasm-ast-types](https://www.npmjs.com/package/wasm-ast-types) | 1,437,763 | 20,626 | 2,877 |
| [@pyramation/json-schema-to-typescript](https://www.npmjs.com/package/@pyramation/json-schema-to-typescript) | 1,319,123 | 20,711 | 2,900 |
| [@pyramation/json-schema-ref-parser](https://www.npmjs.com/package/@pyramation/json-schema-ref-parser) | 1,317,207 | 20,755 | 2,904 |
| [@cosmwasm/ts-codegen-ast](https://www.npmjs.com/package/@cosmwasm/ts-codegen-ast) | 98,765 | 2,424 | 422 |
| [@cosmwasm/ts-codegen-types](https://www.npmjs.com/package/@cosmwasm/ts-codegen-types) | 97,842 | 2,397 | 423 |
| [cosmwasm-typescript-gen](https://www.npmjs.com/package/cosmwasm-typescript-gen) | 19,407 | 37 | 9 |
| [@cosmjson/wasmswap](https://www.npmjs.com/package/@cosmjson/wasmswap) | 2,408 | 34 | 3 |
| [@cosmjson/stargaze-minter](https://www.npmjs.com/package/@cosmjson/stargaze-minter) | 1,034 | 3 | 1 |
| *14 packages hidden (< 1,000 downloads)* | | | |

### interchain-js

| Name | Total | Monthly | Weekly |
| ------- | ------ | ------- | ----- |
| _Total_ | 1,574,755 | 57,077 | 10,574 |
| [@interchainjs/utils](https://www.npmjs.com/package/@interchainjs/utils) | 150,945 | 4,921 | 885 |
| [@interchainjs/types](https://www.npmjs.com/package/@interchainjs/types) | 150,858 | 4,792 | 759 |
| [@interchainjs/cosmos-types](https://www.npmjs.com/package/@interchainjs/cosmos-types) | 146,627 | 4,710 | 733 |
| [interchainjs](https://www.npmjs.com/package/interchainjs) | 143,058 | 4,664 | 1,056 |
| [@interchainjs/cosmos](https://www.npmjs.com/package/@interchainjs/cosmos) | 140,919 | 5,388 | 1,270 |
| [@interchainjs/auth](https://www.npmjs.com/package/@interchainjs/auth) | 136,811 | 4,536 | 723 |
| [@interchainjs/math](https://www.npmjs.com/package/@interchainjs/math) | 121,871 | 4,652 | 887 |
| [@interchainjs/crypto](https://www.npmjs.com/package/@interchainjs/crypto) | 120,035 | 4,561 | 798 |
| [@interchainjs/encoding](https://www.npmjs.com/package/@interchainjs/encoding) | 119,113 | 4,581 | 844 |
| [@interchainjs/amino](https://www.npmjs.com/package/@interchainjs/amino) | 119,047 | 4,583 | 734 |
| [@interchainjs/pubkey](https://www.npmjs.com/package/@interchainjs/pubkey) | 118,449 | 4,353 | 705 |
| [@interchainjs/ethereum](https://www.npmjs.com/package/@interchainjs/ethereum) | 25,815 | 2,027 | 316 |
| [injectivejs](https://www.npmjs.com/package/injectivejs) | 18,112 | 441 | 112 |
| [@interchainjs/injective](https://www.npmjs.com/package/@interchainjs/injective) | 15,623 | 318 | 101 |
| [injective-react](https://www.npmjs.com/package/injective-react) | 7,421 | 487 | 107 |
| [@interchainjs/react](https://www.npmjs.com/package/@interchainjs/react) | 7,320 | 495 | 178 |
| [injective-vue](https://www.npmjs.com/package/injective-vue) | 6,909 | 469 | 99 |
| [@interchainjs/vue](https://www.npmjs.com/package/@interchainjs/vue) | 6,273 | 467 | 176 |
| [interchain-rpc](https://www.npmjs.com/package/interchain-rpc) | 6,148 | 118 | 35 |
| [interchain46](https://www.npmjs.com/package/interchain46) | 1,607 | 80 | 17 |
| [interchain-react](https://www.npmjs.com/package/interchain-react) | 1,238 | 19 | 1 |
| [@interchainjs/ethermint](https://www.npmjs.com/package/@interchainjs/ethermint) | 1,231 | 10 | 0 |
| *26 packages hidden (< 1,000 downloads)* | | | |

### hyperwebjs

| Name | Total | Monthly | Weekly |
| ------- | ------ | ------- | ----- |
| _Total_ | 10,946 | 586 | 38 |
| [hyperwebjs](https://www.npmjs.com/package/hyperwebjs) | 3,268 | 93 | 18 |
| [@hyperweb/build](https://www.npmjs.com/package/@hyperweb/build) | 2,261 | 89 | 16 |
| [@hyperweb/telescope](https://www.npmjs.com/package/@hyperweb/telescope) | 1,909 | 207 | 3 |
| *8 packages hidden (< 1,000 downloads)* | | | |

### interchain-kit

| Name | Total | Monthly | Weekly |
| ------- | ------ | ------- | ----- |
| _Total_ | 145,094 | 4,713 | 575 |
| [@interchain-kit/core](https://www.npmjs.com/package/@interchain-kit/core) | 99,477 | 3,177 | 420 |
| [@interchain-kit/react](https://www.npmjs.com/package/@interchain-kit/react) | 26,025 | 960 | 133 |
| [interchain-kit](https://www.npmjs.com/package/interchain-kit) | 13,545 | 343 | 11 |
| [@interchain-kit/vue](https://www.npmjs.com/package/@interchain-kit/vue) | 6,047 | 233 | 11 |

### interchain-kit-wallets

| Name | Total | Monthly | Weekly |
| ------- | ------ | ------- | ----- |
| _Total_ | 375,179 | 13,274 | 1,152 |
| [@interchain-kit/keplr-extension](https://www.npmjs.com/package/@interchain-kit/keplr-extension) | 64,544 | 1,700 | 246 |
| [@interchain-kit/leap-extension](https://www.npmjs.com/package/@interchain-kit/leap-extension) | 62,846 | 1,560 | 239 |
| [@interchain-kit/okx-extension](https://www.npmjs.com/package/@interchain-kit/okx-extension) | 59,237 | 1,375 | 122 |
| [@interchain-kit/cosmostation-extension](https://www.npmjs.com/package/@interchain-kit/cosmostation-extension) | 18,937 | 599 | 39 |
| [@interchain-kit/keplr-mobile](https://www.npmjs.com/package/@interchain-kit/keplr-mobile) | 13,423 | 460 | 32 |
| [@interchain-kit/leap-mobile](https://www.npmjs.com/package/@interchain-kit/leap-mobile) | 12,826 | 260 | 16 |
| [@interchain-kit/coin98-extension](https://www.npmjs.com/package/@interchain-kit/coin98-extension) | 12,667 | 412 | 4 |
| [@interchain-kit/ledger](https://www.npmjs.com/package/@interchain-kit/ledger) | 11,664 | 233 | 8 |
| [@interchain-kit/mock-wallet](https://www.npmjs.com/package/@interchain-kit/mock-wallet) | 10,708 | 220 | 6 |
| [@interchain-kit/frontier-extension](https://www.npmjs.com/package/@interchain-kit/frontier-extension) | 10,539 | 435 | 9 |
| [@interchain-kit/cosmos-extension-metamask](https://www.npmjs.com/package/@interchain-kit/cosmos-extension-metamask) | 10,395 | 496 | 112 |
| [@interchain-kit/station-extension](https://www.npmjs.com/package/@interchain-kit/station-extension) | 10,238 | 229 | 8 |
| [@interchain-kit/galaxy-station-extension](https://www.npmjs.com/package/@interchain-kit/galaxy-station-extension) | 10,215 | 428 | 7 |
| [@interchain-kit/leap-cosmos-extension-metamask](https://www.npmjs.com/package/@interchain-kit/leap-cosmos-extension-metamask) | 10,017 | 471 | 108 |
| [@interchain-kit/trust-extension](https://www.npmjs.com/package/@interchain-kit/trust-extension) | 8,891 | 255 | 6 |
| [@interchain-kit/xdefi-extension](https://www.npmjs.com/package/@interchain-kit/xdefi-extension) | 6,300 | 228 | 9 |
| [@interchain-kit/compass-extension](https://www.npmjs.com/package/@interchain-kit/compass-extension) | 6,090 | 387 | 8 |
| [@interchain-kit/vue](https://www.npmjs.com/package/@interchain-kit/vue) | 6,047 | 233 | 11 |
| [@interchain-kit/metamask-extension](https://www.npmjs.com/package/@interchain-kit/metamask-extension) | 5,955 | 337 | 79 |
| [@interchain-kit/exodus-extension](https://www.npmjs.com/package/@interchain-kit/exodus-extension) | 5,042 | 405 | 5 |
| [@interchain-kit/fin-extension](https://www.npmjs.com/package/@interchain-kit/fin-extension) | 4,948 | 405 | 7 |
| [@interchain-kit/ninji-extension](https://www.npmjs.com/package/@interchain-kit/ninji-extension) | 4,200 | 243 | 6 |
| [@interchain-kit/shell-extension](https://www.npmjs.com/package/@interchain-kit/shell-extension) | 3,871 | 228 | 9 |
| [@interchain-kit/store](https://www.npmjs.com/package/@interchain-kit/store) | 1,709 | 520 | 39 |
| [@interchain-kit/phantom-extension](https://www.npmjs.com/package/@interchain-kit/phantom-extension) | 1,528 | 212 | 5 |
| *3 packages hidden (< 1,000 downloads)* | | | |

### interchain-ui

| Name | Total | Monthly | Weekly |
| ------- | ------ | ------- | ----- |
| _Total_ | 316,050 | 7,846 | 986 |
| [@interchain-ui/react](https://www.npmjs.com/package/@interchain-ui/react) | 296,312 | 7,386 | 962 |
| [@interchain-ui/vue](https://www.npmjs.com/package/@interchain-ui/vue) | 10,533 | 299 | 4 |
| [@interchain-ui/react-no-ssr](https://www.npmjs.com/package/@interchain-ui/react-no-ssr) | 7,543 | 153 | 20 |
| *3 packages hidden (< 1,000 downloads)* | | | |

### osmosis

| Name | Total | Monthly | Weekly |
| ------- | ------ | ------- | ----- |
| _Total_ | 703,136 | 11,160 | 1,801 |
| [osmojs](https://www.npmjs.com/package/osmojs) | 585,910 | 10,396 | 1,671 |
| [osmo-query](https://www.npmjs.com/package/osmo-query) | 44,946 | 412 | 59 |
| [@osmonauts/math](https://www.npmjs.com/package/@osmonauts/math) | 40,616 | 55 | 13 |
| [@osmosis-labs/math](https://www.npmjs.com/package/@osmosis-labs/math) | 12,614 | 150 | 34 |
| [@osmosis-labs/pools](https://www.npmjs.com/package/@osmosis-labs/pools) | 7,721 | 10 | 2 |
| [@osmosis-labs/proto-codecs](https://www.npmjs.com/package/@osmosis-labs/proto-codecs) | 4,653 | 3 | 3 |
| [@osmosis-labs/stores](https://www.npmjs.com/package/@osmosis-labs/stores) | 3,926 | 45 | 2 |
| *7 packages hidden (< 1,000 downloads)* | | | |

### starship

| Name | Total | Monthly | Weekly |
| ------- | ------ | ------- | ----- |
| _Total_ | 89,885 | 4,460 | 442 |
| [@starship-ci/client](https://www.npmjs.com/package/@starship-ci/client) | 28,950 | 1,419 | 144 |
| [starshipjs](https://www.npmjs.com/package/starshipjs) | 28,505 | 1,118 | 128 |
| [@starship-ci/cli](https://www.npmjs.com/package/@starship-ci/cli) | 27,076 | 1,513 | 151 |
| [@starship-ci/types](https://www.npmjs.com/package/@starship-ci/types) | 4,766 | 295 | 18 |
| *1 package hidden (< 1,000 downloads)* | | | |

### cosmology

| Name | Total | Monthly | Weekly |
| ------- | ------ | ------- | ----- |
| _Total_ | 476,374 | 3,970 | 975 |
| [interchain](https://www.npmjs.com/package/interchain) | 90,672 | 623 | 113 |
| [@cosmology/core](https://www.npmjs.com/package/@cosmology/core) | 48,869 | 239 | 136 |
| [cosmjs-utils](https://www.npmjs.com/package/cosmjs-utils) | 46,874 | 1,140 | 48 |
| [cosmology](https://www.npmjs.com/package/cosmology) | 31,558 | 7 | 2 |
| [@cosmology-ui/react](https://www.npmjs.com/package/@cosmology-ui/react) | 29,763 | 165 | 9 |
| [@cosmology/cli](https://www.npmjs.com/package/@cosmology/cli) | 28,236 | 151 | 139 |
| [@cosmology-ui/utils](https://www.npmjs.com/package/@cosmology-ui/utils) | 25,077 | 34 | 7 |
| [interchain-query](https://www.npmjs.com/package/interchain-query) | 20,837 | 164 | 55 |
| [create-cosmos-app](https://www.npmjs.com/package/create-cosmos-app) | 16,858 | 499 | 101 |
| [thorchain](https://www.npmjs.com/package/thorchain) | 8,034 | 110 | 37 |
| [@cosmonauts/telescope](https://www.npmjs.com/package/@cosmonauts/telescope) | 7,978 | 4 | 2 |
| [@cosmonauts/osmosis](https://www.npmjs.com/package/@cosmonauts/osmosis) | 6,770 | 39 | 35 |
| [create-cosmwasm-app](https://www.npmjs.com/package/create-cosmwasm-app) | 5,427 | 5 | 2 |
| [@osmonauts/babel](https://www.npmjs.com/package/@osmonauts/babel) | 5,296 | 12 | 2 |
| [@pyramation/crypto-keys](https://www.npmjs.com/package/@pyramation/crypto-keys) | 5,044 | 5 | 1 |
| [@cosmology/cosmos-registry](https://www.npmjs.com/package/@cosmology/cosmos-registry) | 4,937 | 25 | 14 |
| [@osmonauts/osmosis](https://www.npmjs.com/package/@osmonauts/osmosis) | 4,684 | 4 | 2 |
| [@pyramation/crypto-coins](https://www.npmjs.com/package/@pyramation/crypto-coins) | 4,236 | 5 | 1 |
| [@pyramation/crypto-networks](https://www.npmjs.com/package/@pyramation/crypto-networks) | 3,959 | 4 | 1 |
| [dydx](https://www.npmjs.com/package/dydx) | 3,404 | 14 | 0 |
| [stargaze-zone](https://www.npmjs.com/package/stargaze-zone) | 3,193 | 81 | 22 |
| [cosmscript](https://www.npmjs.com/package/cosmscript) | 3,086 | 4 | 1 |
| [@cosmology-ui/chain-dropdown](https://www.npmjs.com/package/@cosmology-ui/chain-dropdown) | 2,566 | 16 | 9 |
| [@cosmology-ui/theme](https://www.npmjs.com/package/@cosmology-ui/theme) | 2,538 | 8 | 2 |
| [@cosmology-ui/copy-address-button](https://www.npmjs.com/package/@cosmology-ui/copy-address-button) | 2,535 | 16 | 9 |
| [@cosmology-ui/connect-modal](https://www.npmjs.com/package/@cosmology-ui/connect-modal) | 2,504 | 9 | 2 |
| [@pyramation/crypto-cli](https://www.npmjs.com/package/@pyramation/crypto-cli) | 2,498 | 8 | 2 |
| [@cosmology-ui/base](https://www.npmjs.com/package/@cosmology-ui/base) | 2,488 | 14 | 8 |
| [@cosmology-ui/buttons](https://www.npmjs.com/package/@cosmology-ui/buttons) | 2,478 | 16 | 9 |
| [@cosmology-ui/animation](https://www.npmjs.com/package/@cosmology-ui/animation) | 2,442 | 14 | 8 |
| [@cosmology-ui/swap](https://www.npmjs.com/package/@cosmology-ui/swap) | 2,187 | 7 | 2 |
| [badkidsjs](https://www.npmjs.com/package/badkidsjs) | 2,007 | 5 | 2 |
| [@osmonauts/ast-gen](https://www.npmjs.com/package/@osmonauts/ast-gen) | 1,927 | 5 | 3 |
| [@cosmonauts/protobuf](https://www.npmjs.com/package/@cosmonauts/protobuf) | 1,890 | 15 | 11 |
| [@cosmonauts/ast-gen](https://www.npmjs.com/package/@cosmonauts/ast-gen) | 1,821 | 10 | 8 |
| [dexmos](https://www.npmjs.com/package/dexmos) | 1,633 | 5 | 2 |
| [@pyramation/cosmos-registry](https://www.npmjs.com/package/@pyramation/cosmos-registry) | 1,583 | 4 | 1 |
| [@cosmology/react](https://www.npmjs.com/package/@cosmology/react) | 1,522 | 11 | 8 |
| [chain-registry-utils](https://www.npmjs.com/package/chain-registry-utils) | 1,291 | 2 | 1 |
| [@cosmology/protobufs](https://www.npmjs.com/package/@cosmology/protobufs) | 1,267 | 3 | 1 |
| [cosmoscript](https://www.npmjs.com/package/cosmoscript) | 1,183 | 6 | 1 |
| [teslapi](https://www.npmjs.com/package/teslapi) | 1,166 | 4 | 0 |
| [mesh-security](https://www.npmjs.com/package/mesh-security) | 1,157 | 4 | 0 |
| [@cosmology/ts-codegen-types](https://www.npmjs.com/package/@cosmology/ts-codegen-types) | 1,137 | 13 | 6 |
| [@uni-sign/types](https://www.npmjs.com/package/@uni-sign/types) | 1,075 | 12 | 1 |
| [@uni-sign/utils](https://www.npmjs.com/package/@uni-sign/utils) | 1,009 | 13 | 1 |
| *64 packages hidden (< 1,000 downloads)* | | | |

### stride

| Name | Total | Monthly | Weekly |
| ------- | ------ | ------- | ----- |
| _Total_ | 34,935 | 218 | 38 |
| [stridejs](https://www.npmjs.com/package/stridejs) | 34,935 | 218 | 38 |

### juno

| Name | Total | Monthly | Weekly |
| ------- | ------ | ------- | ----- |
| _Total_ | 43,514 | 213 | 98 |
| [juno-network](https://www.npmjs.com/package/juno-network) | 35,938 | 191 | 95 |
| [@juno-network/assets](https://www.npmjs.com/package/@juno-network/assets) | 7,576 | 22 | 3 |

### stargaze

| Name | Total | Monthly | Weekly |
| ------- | ------ | ------- | ----- |
| _Total_ | 31,340 | 184 | 67 |
| [stargazejs](https://www.npmjs.com/package/stargazejs) | 21,132 | 156 | 55 |
| [@stargaze-zone/contracts](https://www.npmjs.com/package/@stargaze-zone/contracts) | 4,257 | 5 | 2 |
| [@stargaze-zone/chain](https://www.npmjs.com/package/@stargaze-zone/chain) | 3,821 | 9 | 2 |
| [stargaze-query](https://www.npmjs.com/package/stargaze-query) | 2,130 | 14 | 8 |

### dydx

| Name | Total | Monthly | Weekly |
| ------- | ------ | ------- | ----- |
| _Total_ | 1,398,033 | 104,316 | 9,284 |
| [@dydxprotocol/v4-client-js](https://www.npmjs.com/package/@dydxprotocol/v4-client-js) | 1,398,033 | 104,316 | 9,284 |

### utils

| Name | Total | Monthly | Weekly |
| ------- | ------ | ------- | ----- |
| _Total_ | 4,265,634 | 464,203 | 137,176 |
| [inquirerer](https://www.npmjs.com/package/inquirerer) | 1,490,937 | 76,724 | 22,466 |
| [ast-stringify](https://www.npmjs.com/package/ast-stringify) | 1,344,990 | 21,093 | 2,990 |
| [nested-obj](https://www.npmjs.com/package/nested-obj) | 532,135 | 88,655 | 20,856 |
| [strfy-js](https://www.npmjs.com/package/strfy-js) | 162,639 | 35,761 | 6,338 |
| [skitch](https://www.npmjs.com/package/skitch) | 126,106 | 757 | 10 |
| [etag-hash](https://www.npmjs.com/package/etag-hash) | 108,659 | 15,223 | 5,195 |
| [uuid-hash](https://www.npmjs.com/package/uuid-hash) | 79,270 | 14,112 | 4,983 |
| [yanse](https://www.npmjs.com/package/yanse) | 67,769 | 61,506 | 25,375 |
| [komoji](https://www.npmjs.com/package/komoji) | 46,862 | 42,670 | 13,439 |
| [publish-scripts](https://www.npmjs.com/package/publish-scripts) | 29,726 | 971 | 66 |
| [makage](https://www.npmjs.com/package/makage) | 28,991 | 26,410 | 7,911 |
| [introspectron](https://www.npmjs.com/package/introspectron) | 27,916 | 15,161 | 6,065 |
| [@pyramation/babel-preset-env](https://www.npmjs.com/package/@pyramation/babel-preset-env) | 27,907 | 147 | 21 |
| [mime-bytes](https://www.npmjs.com/package/mime-bytes) | 27,198 | 14,033 | 5,023 |
| [schema-typescript](https://www.npmjs.com/package/schema-typescript) | 20,629 | 1,143 | 130 |
| [symlink-workspace](https://www.npmjs.com/package/symlink-workspace) | 20,217 | 367 | 71 |
| [12factor-env](https://www.npmjs.com/package/12factor-env) | 17,565 | 15,988 | 3,221 |
| [clean-ansi](https://www.npmjs.com/package/clean-ansi) | 17,311 | 16,927 | 3,272 |
| [json-schema-patch](https://www.npmjs.com/package/json-schema-patch) | 16,669 | 427 | 73 |
| [file-ts](https://www.npmjs.com/package/file-ts) | 16,334 | 415 | 71 |
| [skitch-template](https://www.npmjs.com/package/skitch-template) | 14,108 | 158 | 0 |
| [genomic](https://www.npmjs.com/package/genomic) | 12,816 | 12,655 | 9,231 |
| [schema-sdk](https://www.npmjs.com/package/schema-sdk) | 4,869 | 795 | 56 |
| [etag-stream](https://www.npmjs.com/package/etag-stream) | 4,589 | 915 | 148 |
| [uuid-stream](https://www.npmjs.com/package/uuid-stream) | 4,339 | 946 | 136 |
| [niftymagick](https://www.npmjs.com/package/niftymagick) | 1,994 | 0 | 0 |
| [@yamlize/cli](https://www.npmjs.com/package/@yamlize/cli) | 1,942 | 30 | 4 |
| [yamlize](https://www.npmjs.com/package/yamlize) | 1,773 | 28 | 3 |
| [airpage-cli](https://www.npmjs.com/package/airpage-cli) | 1,414 | 10 | 2 |
| [@webql/base32](https://www.npmjs.com/package/@webql/base32) | 1,324 | 5 | 1 |
| [airpage](https://www.npmjs.com/package/airpage) | 1,183 | 8 | 3 |
| *10 packages hidden (< 1,000 downloads)* | | | |

### create-cosmos-app

| Name | Total | Monthly | Weekly |
| ------- | ------ | ------- | ----- |
| _Total_ | 19,048 | 646 | 105 |
| [create-cosmos-app](https://www.npmjs.com/package/create-cosmos-app) | 16,858 | 499 | 101 |
| [create-interchain-app](https://www.npmjs.com/package/create-interchain-app) | 2,190 | 147 | 4 |

### kubernetesjs

| Name | Total | Monthly | Weekly |
| ------- | ------ | ------- | ----- |
| _Total_ | 10,318 | 2,257 | 125 |
| [kubernetesjs](https://www.npmjs.com/package/kubernetesjs) | 6,004 | 669 | 110 |
| [@kubernetesjs/cli](https://www.npmjs.com/package/@kubernetesjs/cli) | 1,424 | 228 | 5 |
| [@kubernetesjs/react](https://www.npmjs.com/package/@kubernetesjs/react) | 1,271 | 251 | 4 |
| *4 packages hidden (< 1,000 downloads)* | | | |

### pgpm

| Name | Total | Monthly | Weekly |
| ------- | ------ | ------- | ----- |
| _Total_ | 232,677 | 187,441 | 75,191 |
| [pgpm](https://www.npmjs.com/package/pgpm) | 35,799 | 27,668 | 10,351 |
| [@pgpm/verify](https://www.npmjs.com/package/@pgpm/verify) | 14,460 | 11,702 | 4,799 |
| [@pgpm/types](https://www.npmjs.com/package/@pgpm/types) | 13,297 | 11,092 | 4,716 |
| [@pgpm/database-jobs](https://www.npmjs.com/package/@pgpm/database-jobs) | 12,650 | 10,682 | 4,709 |
| [@pgpm/inflection](https://www.npmjs.com/package/@pgpm/inflection) | 12,637 | 10,819 | 4,717 |
| [@pgpm/jwt-claims](https://www.npmjs.com/package/@pgpm/jwt-claims) | 12,068 | 10,307 | 4,365 |
| [@pgpm/defaults](https://www.npmjs.com/package/@pgpm/defaults) | 11,928 | 10,101 | 4,362 |
| [@pgpm/base32](https://www.npmjs.com/package/@pgpm/base32) | 11,904 | 10,206 | 4,468 |
| [@pgpm/stamps](https://www.npmjs.com/package/@pgpm/stamps) | 11,859 | 10,198 | 4,383 |
| [@pgpm/utils](https://www.npmjs.com/package/@pgpm/utils) | 11,748 | 10,077 | 4,381 |
| [@pgpm/uuid](https://www.npmjs.com/package/@pgpm/uuid) | 11,719 | 10,064 | 4,367 |
| [@pgpm/totp](https://www.npmjs.com/package/@pgpm/totp) | 11,708 | 10,050 | 4,363 |
| [@pgpm/faker](https://www.npmjs.com/package/@pgpm/faker) | 10,795 | 9,380 | 4,357 |
| [@pgpm/db-meta-schema](https://www.npmjs.com/package/@pgpm/db-meta-schema) | 10,368 | 9,990 | 4,588 |
| [@pgpm/db-meta-modules](https://www.npmjs.com/package/@pgpm/db-meta-modules) | 10,285 | 9,930 | 4,587 |
| [@pgpm/default-roles](https://www.npmjs.com/package/@pgpm/default-roles) | 3,705 | 1,608 | 16 |
| [@pgsql/cli](https://www.npmjs.com/package/@pgsql/cli) | 2,669 | 1,033 | 332 |
| [@pgpm-testing/verify](https://www.npmjs.com/package/@pgpm-testing/verify) | 2,638 | 2,264 | 463 |
| [@pgpm-testing/base32](https://www.npmjs.com/package/@pgpm-testing/base32) | 2,347 | 1,961 | 470 |
| [@pgpm/meta-db](https://www.npmjs.com/package/@pgpm/meta-db) | 2,304 | 531 | 15 |
| [@pgpm/meta-db-modules](https://www.npmjs.com/package/@pgpm/meta-db-modules) | 2,283 | 546 | 15 |
| [@pgpm/encrypted-secrets-table](https://www.npmjs.com/package/@pgpm/encrypted-secrets-table) | 1,673 | 920 | 46 |
| [@pgpm/achievements](https://www.npmjs.com/package/@pgpm/achievements) | 1,657 | 942 | 37 |
| [@pgpm/geotypes](https://www.npmjs.com/package/@pgpm/geotypes) | 1,636 | 923 | 19 |
| [@pgpm/jobs](https://www.npmjs.com/package/@pgpm/jobs) | 1,590 | 877 | 35 |
| [@pgpm/encrypted-secrets](https://www.npmjs.com/package/@pgpm/encrypted-secrets) | 1,557 | 830 | 23 |
| [@pgpm/measurements](https://www.npmjs.com/package/@pgpm/measurements) | 1,511 | 811 | 23 |
| [@pgpm-testing/utils](https://www.npmjs.com/package/@pgpm-testing/utils) | 1,021 | 672 | 105 |
| *8 packages hidden (< 1,000 downloads)* | | | |



---

### Thank You 💖

To the amazing Constructive community: thank you for being part of our journey. We're taking everything you love to the next level—and we're thrilled to have you with us.

Let's build the future, together. 🚀



<!-- README.md automatically generated on 2026-01-05T08:01:26.265Z from lib-count repository with latest download stats -->
