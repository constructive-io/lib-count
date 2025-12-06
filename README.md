
# Interweb, Inc.

<p align="center" width="100%">
   <img src="https://raw.githubusercontent.com/hyperweb-io/lib-count/refs/heads/main/assets/logo.svg" alt="hyperweb" width="80"><br />
   <a href="https://github.com/hyperweb-io/lib-count">
      <img height="20" src="https://img.shields.io/endpoint?url=https%3A%2F%2Fraw.githubusercontent.com%2Fhyperweb-io%2Flib-count%2Fmain%2Foutput%2Fbadges%2Ftotal_downloads.json"/>
   </a>
   <a href="https://github.com/hyperweb-io/lib-count">
      <img height="20" src="https://img.shields.io/endpoint?url=https%3A%2F%2Fraw.githubusercontent.com%2Fhyperweb-io%2Flib-count%2Fmain%2Foutput%2Fbadges%2Fmonthly_downloads.json"/>
   </a>
   <a href="https://github.com/hyperweb-io/lib-count">
      <img height="20" src="https://img.shields.io/endpoint?url=https%3A%2F%2Fraw.githubusercontent.com%2Fhyperweb-io%2Flib-count%2Fmain%2Foutput%2Fbadges%2Fweekly_downloads.json"/>
   </a>
   <br>
   <a href="https://github.com/hyperweb-io/lib-count">
      <img height="20" src="https://img.shields.io/endpoint?url=https%3A%2F%2Fraw.githubusercontent.com%2Fhyperweb-io%2Flib-count%2Fmain%2Foutput%2Fbadges%2Flaunchql_category.json"/>
   </a>
   <a href="https://github.com/hyperweb-io/lib-count">
      <img height="20" src="https://img.shields.io/endpoint?url=https%3A%2F%2Fraw.githubusercontent.com%2Fhyperweb-io%2Flib-count%2Fmain%2Foutput%2Fbadges%2Fhyperweb_category.json"/>
   </a>
   <a href="https://github.com/hyperweb-io/lib-count">
      <img height="20" src="https://img.shields.io/endpoint?url=https%3A%2F%2Fraw.githubusercontent.com%2Fhyperweb-io%2Flib-count%2Fmain%2Foutput%2Fbadges%2Futils_category.json"/>
   </a>
</p>


## 🚀 Brands of Interweb, Inc.

### LaunchQL

Tooling for Postgres

- 🔗 **LaunchQL GitHub Organization:** [**launchql**](https://github.com/launchql)
- 🌐 **LaunchQL Website:** [**launchql.com**](https://launchql.com)

### PGPM

A Postgres Package Manager for Modular Postgres

- 🌐 **PGPM Website:** [**pgpm.io**](https://pgpm.io)

### Hyperweb

We're thrilled to share that [**Cosmology** has rebranded as **Hyperweb**](https://hyperweb.io/blog/01-28-2025-journey-from-cosmology-to-hyperweb)! 🎉

- 🔗 **Hyperweb GitHub Organization:** [**hyperweb-io**](https://github.com/hyperweb-io)
- 🌐 **Hyperweb Website:** [**hyperweb.io**](https://hyperweb.io)

📺 **Watch the [Hyperweb Announcement](https://www.youtube.com/watch?v=a_G2_KXRf1Y&list=PL_XyHnlG9MMvekTCbbJArAOwVlkCY54V5&index=2)**  
## Overall Download Statistics

| Category | Total | Monthly | Weekly |
| ------- | ------ | ------- | ----- |
| **Total** | 90,710,173 | 3,630,311 | 935,627 |
| Web2 | 32,823,319 | 1,853,790 | 463,149 |
| Web3 | 54,753,862 | 1,567,716 | 415,163 |
| Utilities | 3,979,238 | 208,805 | 57,315 |


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

* [launchql/pgsql-test](https://github.com/launchql/launchql/tree/main/packages/pgsql-test): **📊 Isolated testing environments** with per-test transaction rollbacks—ideal for integration tests, complex migrations, and RLS simulation.
* [launchql/supabase-test](https://github.com/launchql/launchql/tree/main/packages/supabase-test): **🧪 Supabase-native test harness** preconfigured for the local Supabase stack—per-test rollbacks, JWT/role context helpers, and CI/GitHub Actions ready.
* [launchql/graphile-test](https://github.com/launchql/launchql/tree/main/packages/graphile-test): **🔐 Authentication mocking** for Graphile-focused test helpers and emulating row-level security contexts.
* [launchql/pg-query-context](https://github.com/launchql/launchql/tree/main/packages/pg-query-context): **🔒 Session context injection** to add session-local context (e.g., `SET LOCAL`) into queries—ideal for setting `role`, `jwt.claims`, and other session settings.

### 🧠 Parsing & AST

* [launchql/pgsql-parser](https://github.com/launchql/pgsql-parser): **🔄 SQL conversion engine** that interprets and converts PostgreSQL syntax.
* [launchql/libpg-query-node](https://github.com/launchql/libpg-query-node): **🌉 Node.js bindings** for `libpg_query`, converting SQL into parse trees.
* [launchql/pg-proto-parser](https://github.com/launchql/pg-proto-parser): **📦 Protobuf parser** for parsing PostgreSQL Protocol Buffers definitions to generate TypeScript interfaces, utility functions, and JSON mappings for enums.
* [@pgsql/enums](https://github.com/launchql/pgsql-parser/tree/main/packages/enums): **🏷️ TypeScript enums** for PostgreSQL AST for safe and ergonomic parsing logic.
* [@pgsql/types](https://github.com/launchql/pgsql-parser/tree/main/packages/types): **📝 Type definitions** for PostgreSQL AST nodes in TypeScript.
* [@pgsql/utils](https://github.com/launchql/pgsql-parser/tree/main/packages/utils): **🛠️ AST utilities** for constructing and transforming PostgreSQL syntax trees.
* [launchql/pg-ast](https://github.com/launchql/launchql/tree/main/packages/pg-ast): **🔍 Low-level AST tools** and transformations for Postgres query structures.

### 🚀 API & Dev Tools

* [launchql/server](https://github.com/launchql/launchql/tree/main/packages/server): **⚡ Express-based API server** powered by PostGraphile to expose a secure, scalable GraphQL API over your Postgres database.
* [launchql/explorer](https://github.com/launchql/launchql/tree/main/packages/explorer): **🔎 Visual API explorer** with GraphiQL for browsing across all databases and schemas—useful for debugging, documentation, and API prototyping.

### 🔁 Streaming & Uploads

* [launchql/s3-streamer](https://github.com/launchql/launchql/tree/main/packages/s3-streamer): **📤 Direct S3 streaming** for large files with support for metadata injection and content validation.
* [launchql/etag-hash](https://github.com/launchql/launchql/tree/main/packages/etag-hash): **🏷️ S3-compatible ETags** created by streaming and hashing file uploads in chunks.
* [launchql/etag-stream](https://github.com/launchql/launchql/tree/main/packages/etag-stream): **🔄 ETag computation** via Node stream transformer during upload or transfer.
* [launchql/uuid-hash](https://github.com/launchql/launchql/tree/main/packages/uuid-hash): **🆔 Deterministic UUIDs** generated from hashed content, great for deduplication and asset referencing.
* [launchql/uuid-stream](https://github.com/launchql/launchql/tree/main/packages/uuid-stream): **🌊 Streaming UUID generation** based on piped file content—ideal for upload pipelines.
* [launchql/upload-names](https://github.com/launchql/launchql/tree/main/packages/upload-names): **📂 Collision-resistant filenames** utility for structured and unique file names for uploads.

### 🧰 CLI & Codegen

* [pgpm](https://github.com/launchql/launchql/tree/main/packages/pgpm): **🖥️ PostgreSQL Package Manager** for modular Postgres development. Works with database workspaces, scaffolding, migrations, seeding, and installing database packages.
* [@launchql/cli](https://github.com/launchql/launchql/tree/main/packages/cli): **🖥️ Command-line toolkit** for managing LaunchQL projects—supports database scaffolding, migrations, seeding, code generation, and automation.
* [launchql/launchql-gen](https://github.com/launchql/launchql/tree/main/packages/launchql-gen): **✨ Auto-generated GraphQL** mutations and queries dynamically built from introspected schema data.
* [@launchql/query-builder](https://github.com/launchql/launchql/tree/main/packages/query-builder): **🏗️ SQL constructor** providing a robust TypeScript-based query builder for dynamic generation of `SELECT`, `INSERT`, `UPDATE`, `DELETE`, and stored procedure calls—supports advanced SQL features like `JOIN`, `GROUP BY`, and schema-qualified queries.
* [@launchql/query](https://github.com/launchql/launchql/tree/main/packages/query): **🧩 Fluent GraphQL builder** for PostGraphile schemas. ⚡ Schema-aware via introspection, 🧩 composable and ergonomic for building deeply nested queries.
---

# Interchain JavaScript Stack

A unified toolkit for building applications and smart contracts in the Interchain ecosystem with JavaScript.

| [Developer Portal](https://hyperweb.io): Quick Start | [Interweb Discord](https://discord.com/invite/xh3ZwHj2qQ): Support & Community | [GitHub Discussions](https://github.com/orgs/hyperweb-io/discussions): Technical Hub |
|:---:|:---:|:---:|

A unified toolkit for building applications and smart contracts in the Interchain ecosystem ⚛️


| Category             | Tools                                                                                                                  | Downloads                                                                                                 |
|----------------------|------------------------------------------------------------------------------------------------------------------------|--------------------------------------------------------------------------------------------------------|
| **Chain Information**   | [**Chain Registry**](https://github.com/hyperweb-io/chain-registry), [**Utils**](https://www.npmjs.com/package/@chain-registry/utils), [**Client**](https://www.npmjs.com/package/@chain-registry/client) | ![Chain Registry](https://img.shields.io/endpoint?url=https%3A%2F%2Fraw.githubusercontent.com%2Fhyperweb-io%2Flib-count%2Fmain%2Fbadges%2Fproducts%2Fchain-registry%2Ftotal.json) |
| **Wallet Connectors**| [**Interchain Kit**](https://github.com/hyperweb-io/interchain-kit), [**Cosmos Kit**](https://github.com/hyperweb-io/cosmos-kit) | ![Wallet Connectors](https://img.shields.io/endpoint?url=https%3A%2F%2Fraw.githubusercontent.com%2Fhyperweb-io%2Flib-count%2Fmain%2Fbadges%2Fproducts%2Fcosmos-kit%2Ftotal.json) |
| **Signing Clients**          | [**InterchainJS**](https://github.com/hyperweb-io/interchainjs), [**CosmJS**](https://github.com/cosmos/cosmjs) | ![Signers](https://img.shields.io/endpoint?url=https%3A%2F%2Fraw.githubusercontent.com%2Fhyperweb-io%2Flib-count%2Fmain%2Fbadges%2Fproducts%2Fcosmos-kit%2Ftotal.json) |
| **SDK Clients**              | [**Telescope**](https://github.com/hyperweb-io/telescope)                                                          | ![SDK](https://img.shields.io/endpoint?url=https%3A%2F%2Fraw.githubusercontent.com%2Fhyperweb-io%2Flib-count%2Fmain%2Fbadges%2Fproducts%2Ftelescope%2Ftotal.json) |
| **Starter Kits**     | [**Create Interchain App**](https://github.com/hyperweb-io/create-interchain-app), [**Create Cosmos App**](https://github.com/hyperweb-io/create-cosmos-app) | ![Starter Kits](https://img.shields.io/endpoint?url=https%3A%2F%2Fraw.githubusercontent.com%2Fhyperweb-io%2Flib-count%2Fmain%2Fbadges%2Fproducts%2Fcreate-cosmos-app%2Ftotal.json) |
| **UI Kits**          | [**Interchain UI**](https://github.com/hyperweb-io/interchain-ui)                                                   | ![UI Kits](https://img.shields.io/endpoint?url=https%3A%2F%2Fraw.githubusercontent.com%2Fhyperweb-io%2Flib-count%2Fmain%2Fbadges%2Fproducts%2Finterchain-ui%2Ftotal.json) |
| **Testing Frameworks**          | [**Starship**](https://github.com/hyperweb-io/starship)                                                             | ![Testing](https://img.shields.io/endpoint?url=https%3A%2F%2Fraw.githubusercontent.com%2Fhyperweb-io%2Flib-count%2Fmain%2Fbadges%2Fproducts%2Fstarship%2Ftotal.json) |
| **TypeScript Smart Contracts** | [**Create Hyperweb App**](https://github.com/hyperweb-io/create-hyperweb-app)                              | ![TypeScript Smart Contracts](https://img.shields.io/endpoint?url=https%3A%2F%2Fraw.githubusercontent.com%2Fhyperweb-io%2Flib-count%2Fmain%2Fbadges%2Fproducts%2Fhyperwebjs%2Ftotal.json) |
| **CosmWasm Contracts** | [**CosmWasm TS Codegen**](https://github.com/CosmWasm/ts-codegen)                                                   | ![CosmWasm Contracts](https://img.shields.io/endpoint?url=https%3A%2F%2Fraw.githubusercontent.com%2Fhyperweb-io%2Flib-count%2Fmain%2Fbadges%2Fproducts%2Fcosmwasm%2Ftotal.json) |
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
| _Total_ | 32,823,319 | 1,853,790 | 463,149 |
| [libpg-query](https://www.npmjs.com/package/libpg-query) | 7,900,316 | 353,548 | 84,079 |
| [pgsql-deparser](https://www.npmjs.com/package/pgsql-deparser) | 6,449,317 | 276,527 | 67,055 |
| [pgsql-enums](https://www.npmjs.com/package/pgsql-enums) | 6,429,781 | 190,844 | 42,197 |
| [pgsql-parser](https://www.npmjs.com/package/pgsql-parser) | 6,249,979 | 269,640 | 65,278 |
| [@pgsql/types](https://www.npmjs.com/package/@pgsql/types) | 3,298,921 | 344,714 | 80,795 |
| [@pgsql/utils](https://www.npmjs.com/package/@pgsql/utils) | 236,213 | 3,828 | 1,060 |
| [@launchql/protobufjs](https://www.npmjs.com/package/@launchql/protobufjs) | 208,759 | 20,570 | 4,471 |
| [@pgql/parse](https://www.npmjs.com/package/@pgql/parse) | 188,085 | 231 | 175 |
| [@pyramation/postgraphile-plugin-fulltext-filter](https://www.npmjs.com/package/@pyramation/postgraphile-plugin-fulltext-filter) | 148,745 | 10,353 | 2,421 |
| [@pgsql/enums](https://www.npmjs.com/package/@pgsql/enums) | 140,698 | 33,021 | 9,282 |
| [pg-proto-parser](https://www.npmjs.com/package/pg-proto-parser) | 114,337 | 17,846 | 4,134 |
| [@pgsql/traverse](https://www.npmjs.com/package/@pgsql/traverse) | 106,748 | 18,380 | 4,073 |
| [skitch-utils](https://www.npmjs.com/package/skitch-utils) | 96,997 | 7,993 | 1,535 |
| [@launchql/cli](https://www.npmjs.com/package/@launchql/cli) | 75,153 | 6,047 | 1,470 |
| [@launchql/graphql-testing](https://www.npmjs.com/package/@launchql/graphql-testing) | 55,261 | 422 | 0 |
| [skitch-templates](https://www.npmjs.com/package/skitch-templates) | 42,656 | 6 | 3 |
| [@launchql/server](https://www.npmjs.com/package/@launchql/server) | 34,302 | 4,666 | 1,474 |
| [skitch-testing](https://www.npmjs.com/package/skitch-testing) | 30,427 | 3 | 1 |
| [@launchql/db-testing](https://www.npmjs.com/package/@launchql/db-testing) | 29,357 | 1,985 | 1,375 |
| [@launchql/explorer](https://www.npmjs.com/package/@launchql/explorer) | 28,396 | 8,213 | 1,665 |
| [pg-query-native-latest](https://www.npmjs.com/package/pg-query-native-latest) | 26,186 | 19 | 2 |
| [@launchql/server-utils](https://www.npmjs.com/package/@launchql/server-utils) | 24,293 | 12,115 | 4,208 |
| [@launchql/db-utils](https://www.npmjs.com/package/@launchql/db-utils) | 23,563 | 1,879 | 1,352 |
| [@launchql/db-migrate](https://www.npmjs.com/package/@launchql/db-migrate) | 22,580 | 275 | 81 |
| [@launchql/types](https://www.npmjs.com/package/@launchql/types) | 22,257 | 13,835 | 5,495 |
| [pgsql-test](https://www.npmjs.com/package/pgsql-test) | 21,966 | 8,596 | 1,816 |
| [@pgsql/parser](https://www.npmjs.com/package/@pgsql/parser) | 20,844 | 923 | 186 |
| [@launchql/db-templates](https://www.npmjs.com/package/@launchql/db-templates) | 20,560 | 28 | 1 |
| [csv-to-pg](https://www.npmjs.com/package/csv-to-pg) | 20,201 | 9,270 | 3,166 |
| [@launchql/core](https://www.npmjs.com/package/@launchql/core) | 20,084 | 13,452 | 4,532 |
| [graphile-meta-schema](https://www.npmjs.com/package/graphile-meta-schema) | 19,064 | 8,328 | 2,899 |
| [@launchql/env](https://www.npmjs.com/package/@launchql/env) | 18,279 | 13,226 | 5,494 |
| [pg-env](https://www.npmjs.com/package/pg-env) | 18,213 | 13,137 | 5,493 |
| [@launchql/templatizer](https://www.npmjs.com/package/@launchql/templatizer) | 18,118 | 12,087 | 4,519 |
| [graphile-search-plugin](https://www.npmjs.com/package/graphile-search-plugin) | 17,747 | 8,725 | 2,882 |
| [pg-cache](https://www.npmjs.com/package/pg-cache) | 17,627 | 12,270 | 4,220 |
| [graphile-simple-inflector](https://www.npmjs.com/package/graphile-simple-inflector) | 17,610 | 8,381 | 2,881 |
| [pg-ast](https://www.npmjs.com/package/pg-ast) | 17,268 | 9,730 | 3,238 |
| [@launchql/logger](https://www.npmjs.com/package/@launchql/logger) | 16,484 | 11,764 | 4,221 |
| [@launchql/s3-streamer](https://www.npmjs.com/package/@launchql/s3-streamer) | 16,069 | 9,005 | 2,813 |
| [postgraphile-derived-upload-field](https://www.npmjs.com/package/postgraphile-derived-upload-field) | 15,702 | 6,249 | 1,481 |
| [graphile-settings](https://www.npmjs.com/package/graphile-settings) | 15,674 | 9,451 | 2,955 |
| [graphile-i18n](https://www.npmjs.com/package/graphile-i18n) | 15,506 | 8,292 | 2,885 |
| [graphile-query](https://www.npmjs.com/package/graphile-query) | 14,803 | 8,265 | 2,876 |
| [@launchql/content-type-stream](https://www.npmjs.com/package/@launchql/content-type-stream) | 14,576 | 8,599 | 2,807 |
| [@launchql/upload-names](https://www.npmjs.com/package/@launchql/upload-names) | 14,285 | 8,363 | 2,804 |
| [graphile-test](https://www.npmjs.com/package/graphile-test) | 12,930 | 5,901 | 1,579 |
| [@launchql/ext-types](https://www.npmjs.com/package/@launchql/ext-types) | 12,832 | 9 | 0 |
| [@launchql/ext-default-roles](https://www.npmjs.com/package/@launchql/ext-default-roles) | 12,774 | 134 | 1 |
| [@launchql/ext-verify](https://www.npmjs.com/package/@launchql/ext-verify) | 12,743 | 94 | 51 |
| [@launchql/ext-measurements](https://www.npmjs.com/package/@launchql/ext-measurements) | 12,626 | 330 | 49 |
| [@launchql/ext-defaults](https://www.npmjs.com/package/@launchql/ext-defaults) | 12,557 | 137 | 0 |
| [@launchql/ext-jobs](https://www.npmjs.com/package/@launchql/ext-jobs) | 12,156 | 128 | 0 |
| [@launchql/base32](https://www.npmjs.com/package/@launchql/base32) | 11,631 | 273 | 47 |
| [graphile-cache](https://www.npmjs.com/package/graphile-cache) | 11,344 | 7,601 | 1,607 |
| [@launchql/totp](https://www.npmjs.com/package/@launchql/totp) | 11,100 | 48 | 40 |
| [@launchql/inflection](https://www.npmjs.com/package/@launchql/inflection) | 11,072 | 54 | 46 |
| [@launchql/url-domains](https://www.npmjs.com/package/@launchql/url-domains) | 11,019 | 6,631 | 1,517 |
| [@launchql/db-transform](https://www.npmjs.com/package/@launchql/db-transform) | 10,902 | 1,478 | 1,280 |
| [graphile-column-privileges-mutations](https://www.npmjs.com/package/graphile-column-privileges-mutations) | 10,624 | 149 | 23 |
| [@launchql/faker](https://www.npmjs.com/package/@launchql/faker) | 10,517 | 29 | 2 |
| [@launchql/graphile-settings](https://www.npmjs.com/package/@launchql/graphile-settings) | 10,365 | 39 | 1 |
| [@launchql/ext-jobs-queue](https://www.npmjs.com/package/@launchql/ext-jobs-queue) | 10,314 | 48 | 38 |
| [@launchql/ext-jwt-claims](https://www.npmjs.com/package/@launchql/ext-jwt-claims) | 10,051 | 93 | 48 |
| [@launchql/ext-achievements](https://www.npmjs.com/package/@launchql/ext-achievements) | 9,832 | 50 | 42 |
| [@launchql/db-template](https://www.npmjs.com/package/@launchql/db-template) | 9,248 | 1,547 | 1,280 |
| [skitch-transform](https://www.npmjs.com/package/skitch-transform) | 8,064 | 22 | 1 |
| [pg-utils](https://www.npmjs.com/package/pg-utils) | 7,898 | 18 | 3 |
| [@launchql/ext-stamps](https://www.npmjs.com/package/@launchql/ext-stamps) | 7,848 | 190 | 25 |
| [@launchql/ext-uuid](https://www.npmjs.com/package/@launchql/ext-uuid) | 7,686 | 107 | 2 |
| [graphile-gen](https://www.npmjs.com/package/graphile-gen) | 7,265 | 10 | 0 |
| [@launchql/codegen](https://www.npmjs.com/package/@launchql/codegen) | 7,011 | 3,747 | 162 |
| [pg-query-context](https://www.npmjs.com/package/pg-query-context) | 6,989 | 3,395 | 1,317 |
| [gql-ast](https://www.npmjs.com/package/gql-ast) | 6,941 | 1,752 | 45 |
| [@launchql/react](https://www.npmjs.com/package/@launchql/react) | 6,727 | 3,722 | 182 |
| [@launchql/ext-utils](https://www.npmjs.com/package/@launchql/ext-utils) | 6,654 | 179 | 24 |
| [skitch-types](https://www.npmjs.com/package/skitch-types) | 6,638 | 2 | 0 |
| [@launchql/proto-cli](https://www.npmjs.com/package/@launchql/proto-cli) | 6,426 | 357 | 43 |
| [@launchql/utils](https://www.npmjs.com/package/@launchql/utils) | 6,350 | 164 | 26 |
| [@launchql/openfaas-job-worker](https://www.npmjs.com/package/@launchql/openfaas-job-worker) | 6,261 | 86 | 0 |
| [skitch-path](https://www.npmjs.com/package/skitch-path) | 6,117 | 4 | 0 |
| [@launchql/db-env](https://www.npmjs.com/package/@launchql/db-env) | 6,034 | 1,555 | 1,288 |
| [pg-codegen](https://www.npmjs.com/package/pg-codegen) | 5,978 | 3,502 | 106 |
| [pg-query-string](https://www.npmjs.com/package/pg-query-string) | 5,687 | 1,481 | 1,280 |
| [supabase-test](https://www.npmjs.com/package/supabase-test) | 4,365 | 4,270 | 158 |
| [@launchql/s3-utils](https://www.npmjs.com/package/@launchql/s3-utils) | 4,201 | 3,261 | 1,311 |
| [skitch-ext-utilities](https://www.npmjs.com/package/skitch-ext-utilities) | 3,921 | 6 | 0 |
| [skitch-ext-verify](https://www.npmjs.com/package/skitch-ext-verify) | 3,882 | 7 | 0 |
| [skitch-prompt](https://www.npmjs.com/package/skitch-prompt) | 3,759 | 1 | 0 |
| [skitch-ext-defaults](https://www.npmjs.com/package/skitch-ext-defaults) | 3,738 | 6 | 0 |
| [skitch-env](https://www.npmjs.com/package/skitch-env) | 3,575 | 5 | 1 |
| [@launchql/openfaas-job-fn](https://www.npmjs.com/package/@launchql/openfaas-job-fn) | 3,437 | 80 | 12 |
| [graphile-gen-js](https://www.npmjs.com/package/graphile-gen-js) | 3,248 | 4 | 0 |
| [@launchql/migrate](https://www.npmjs.com/package/@launchql/migrate) | 3,136 | 281 | 31 |
| [@launchql/graphile-query](https://www.npmjs.com/package/@launchql/graphile-query) | 3,045 | 91 | 1 |
| [@launchql/openfaas-job-service](https://www.npmjs.com/package/@launchql/openfaas-job-service) | 2,928 | 97 | 10 |
| [skitch-extension-verify](https://www.npmjs.com/package/skitch-extension-verify) | 2,925 | 3 | 0 |
| [@launchql/query](https://www.npmjs.com/package/@launchql/query) | 2,808 | 1,420 | 22 |
| [@libpg-query/parser](https://www.npmjs.com/package/@libpg-query/parser) | 2,770 | 1,392 | 366 |
| [skitch-extension-utils](https://www.npmjs.com/package/skitch-extension-utils) | 2,742 | 5 | 1 |
| [skitch-install](https://www.npmjs.com/package/skitch-install) | 2,620 | 15 | 1 |
| [skitch-extension-defaults](https://www.npmjs.com/package/skitch-extension-defaults) | 2,454 | 7 | 0 |
| [skitch-extension-jobs](https://www.npmjs.com/package/skitch-extension-jobs) | 2,401 | 5 | 0 |
| [skitch-extension-default-roles](https://www.npmjs.com/package/skitch-extension-default-roles) | 2,137 | 3 | 0 |
| [launchql-client](https://www.npmjs.com/package/launchql-client) | 2,111 | 6 | 1 |
| [@launchql/protobufjs-cli](https://www.npmjs.com/package/@launchql/protobufjs-cli) | 1,934 | 254 | 6 |
| [@launchql/client](https://www.npmjs.com/package/@launchql/client) | 1,917 | 1,010 | 12 |
| [@launchql/job-worker](https://www.npmjs.com/package/@launchql/job-worker) | 1,867 | 72 | 4 |
| [@launchql/query-builder](https://www.npmjs.com/package/@launchql/query-builder) | 1,816 | 1,018 | 12 |
| [@launchql/orm](https://www.npmjs.com/package/@launchql/orm) | 1,815 | 1,022 | 21 |
| [@pgsql/transform](https://www.npmjs.com/package/@pgsql/transform) | 1,728 | 337 | 5 |
| [@launchql/job-utils](https://www.npmjs.com/package/@launchql/job-utils) | 1,706 | 56 | 0 |
| [@launchql/openfaas-job-util-jobs](https://www.npmjs.com/package/@launchql/openfaas-job-util-jobs) | 1,604 | 56 | 5 |
| [@launchql/postmaster](https://www.npmjs.com/package/@launchql/postmaster) | 1,579 | 65 | 5 |
| [@launchql/job-scheduler](https://www.npmjs.com/package/@launchql/job-scheduler) | 1,509 | 60 | 0 |
| [@launchql/job-pg](https://www.npmjs.com/package/@launchql/job-pg) | 1,469 | 63 | 3 |
| [@launchql/geo-types](https://www.npmjs.com/package/@launchql/geo-types) | 1,452 | 64 | 5 |
| [launchql-gen](https://www.npmjs.com/package/launchql-gen) | 1,345 | 18 | 3 |
| [@launchql/mmmagic](https://www.npmjs.com/package/@launchql/mmmagic) | 1,329 | 55 | 1 |
| [@launchql/openfaas-job-server](https://www.npmjs.com/package/@launchql/openfaas-job-server) | 1,309 | 64 | 4 |
| [graphile-client](https://www.npmjs.com/package/graphile-client) | 1,278 | 3 | 0 |
| [graphile-gen-sql](https://www.npmjs.com/package/graphile-gen-sql) | 1,256 | 4 | 0 |
| [@launchql/openfaas-env](https://www.npmjs.com/package/@launchql/openfaas-env) | 1,196 | 56 | 2 |
| [launchql-test](https://www.npmjs.com/package/launchql-test) | 1,181 | 1,181 | 176 |
| [@launchql/ast](https://www.npmjs.com/package/@launchql/ast) | 1,161 | 79 | 7 |
| [@launchql/job-api-server](https://www.npmjs.com/package/@launchql/job-api-server) | 1,110 | 59 | 3 |
| [csv-to-gql](https://www.npmjs.com/package/csv-to-gql) | 1,095 | 13 | 1 |
| [graphile-postgis](https://www.npmjs.com/package/graphile-postgis) | 1,050 | 334 | 129 |
| [drizzle-orm-test](https://www.npmjs.com/package/drizzle-orm-test) | 1,039 | 1,039 | 100 |
| [@launchql/ext-status](https://www.npmjs.com/package/@launchql/ext-status) | 1,029 | 55 | 3 |
| *56 packages hidden (< 1,000 downloads)* | | | |

### protobufs

| Name | Total | Monthly | Weekly |
| ------- | ------ | ------- | ----- |
| _Total_ | 5,150,404 | 90,432 | 21,811 |
| [@cosmology/protobufjs](https://www.npmjs.com/package/@cosmology/protobufjs) | 1,121,366 | 27,530 | 8,075 |
| [@protobufs/gogoproto](https://www.npmjs.com/package/@protobufs/gogoproto) | 565,851 | 8,927 | 1,993 |
| [@protobufs/google](https://www.npmjs.com/package/@protobufs/google) | 564,874 | 8,933 | 1,990 |
| [@protobufs/cosmos_proto](https://www.npmjs.com/package/@protobufs/cosmos_proto) | 548,136 | 8,712 | 1,957 |
| [@protobufs/cosmos](https://www.npmjs.com/package/@protobufs/cosmos) | 547,611 | 8,750 | 1,959 |
| [@protobufs/tendermint](https://www.npmjs.com/package/@protobufs/tendermint) | 542,888 | 8,705 | 1,954 |
| [@pyramation/protobufjs](https://www.npmjs.com/package/@pyramation/protobufjs) | 400,738 | 5,876 | 1,226 |
| [@protobufs/confio](https://www.npmjs.com/package/@protobufs/confio) | 208,082 | 3,517 | 682 |
| [@protobufs/ibc](https://www.npmjs.com/package/@protobufs/ibc) | 204,192 | 3,340 | 683 |
| [@protobufs/amino](https://www.npmjs.com/package/@protobufs/amino) | 201,117 | 2,905 | 677 |
| [@protobufs/cosmwasm](https://www.npmjs.com/package/@protobufs/cosmwasm) | 190,525 | 2,121 | 473 |
| [@protobufs/osmosis](https://www.npmjs.com/package/@protobufs/osmosis) | 25,211 | 675 | 64 |
| [@protobufs/juno](https://www.npmjs.com/package/@protobufs/juno) | 3,546 | 30 | 12 |
| [@protobufs/injective](https://www.npmjs.com/package/@protobufs/injective) | 3,375 | 233 | 40 |
| [@protobufs/akash](https://www.npmjs.com/package/@protobufs/akash) | 1,939 | 12 | 3 |
| [@protobufs/stargaze](https://www.npmjs.com/package/@protobufs/stargaze) | 1,823 | 16 | 3 |
| [@protobufs/regen](https://www.npmjs.com/package/@protobufs/regen) | 1,699 | 11 | 3 |
| [@protobufs/secret](https://www.npmjs.com/package/@protobufs/secret) | 1,663 | 6 | 2 |
| [@protobufs/bcna](https://www.npmjs.com/package/@protobufs/bcna) | 1,511 | 11 | 4 |
| [@protobufs/pylons](https://www.npmjs.com/package/@protobufs/pylons) | 1,429 | 6 | 1 |
| [@protobufs/comdex](https://www.npmjs.com/package/@protobufs/comdex) | 1,172 | 9 | 2 |
| *29 packages hidden (< 1,000 downloads)* | | | |

### chain-registry

| Name | Total | Monthly | Weekly |
| ------- | ------ | ------- | ----- |
| _Total_ | 11,172,114 | 320,048 | 82,088 |
| [@chain-registry/types](https://www.npmjs.com/package/@chain-registry/types) | 3,714,962 | 102,086 | 24,901 |
| [chain-registry](https://www.npmjs.com/package/chain-registry) | 1,684,476 | 55,698 | 11,014 |
| [@chain-registry/keplr](https://www.npmjs.com/package/@chain-registry/keplr) | 1,468,460 | 35,582 | 11,202 |
| [@chain-registry/utils](https://www.npmjs.com/package/@chain-registry/utils) | 1,201,122 | 33,315 | 8,543 |
| [@chain-registry/cosmostation](https://www.npmjs.com/package/@chain-registry/cosmostation) | 1,097,761 | 25,172 | 8,343 |
| [@chain-registry/client](https://www.npmjs.com/package/@chain-registry/client) | 959,726 | 31,184 | 8,099 |
| [@chain-registry/v2](https://www.npmjs.com/package/@chain-registry/v2) | 183,750 | 4,672 | 1,018 |
| [@chain-registry/v2-types](https://www.npmjs.com/package/@chain-registry/v2-types) | 180,990 | 4,562 | 982 |
| [@chain-registry/osmosis](https://www.npmjs.com/package/@chain-registry/osmosis) | 140,415 | 3,596 | 874 |
| [@chain-registry/assets](https://www.npmjs.com/package/@chain-registry/assets) | 137,301 | 7,138 | 2,080 |
| [@chain-registry/juno](https://www.npmjs.com/package/@chain-registry/juno) | 87,318 | 5,477 | 1,338 |
| [@chain-registry/interfaces](https://www.npmjs.com/package/@chain-registry/interfaces) | 57,225 | 2,859 | 779 |
| [@chain-registry/v2-keplr](https://www.npmjs.com/package/@chain-registry/v2-keplr) | 52,311 | 1,345 | 290 |
| [@chain-registry/workflows](https://www.npmjs.com/package/@chain-registry/workflows) | 50,760 | 3,032 | 768 |
| [@chain-registry/cli](https://www.npmjs.com/package/@chain-registry/cli) | 47,629 | 2,913 | 737 |
| [@chain-registry/v2-utils](https://www.npmjs.com/package/@chain-registry/v2-utils) | 39,794 | 493 | 395 |
| [@chain-registry/v2-client](https://www.npmjs.com/package/@chain-registry/v2-client) | 36,861 | 521 | 392 |
| [@chain-registry/v2-cosmostation](https://www.npmjs.com/package/@chain-registry/v2-cosmostation) | 31,253 | 403 | 333 |

### cosmos-kit

| Name | Total | Monthly | Weekly |
| ------- | ------ | ------- | ----- |
| _Total_ | 2,645,444 | 52,424 | 16,042 |
| [@cosmos-kit/core](https://www.npmjs.com/package/@cosmos-kit/core) | 1,014,374 | 16,082 | 5,064 |
| [@cosmos-kit/walletconnect](https://www.npmjs.com/package/@cosmos-kit/walletconnect) | 746,958 | 13,147 | 4,371 |
| [@cosmos-kit/react-lite](https://www.npmjs.com/package/@cosmos-kit/react-lite) | 335,509 | 8,793 | 2,671 |
| [@cosmos-kit/react](https://www.npmjs.com/package/@cosmos-kit/react) | 314,792 | 8,255 | 2,684 |
| [@interchain-kit/core](https://www.npmjs.com/package/@interchain-kit/core) | 96,300 | 2,761 | 371 |
| [cosmos-kit](https://www.npmjs.com/package/cosmos-kit) | 93,430 | 2,165 | 786 |
| [@interchain-kit/react](https://www.npmjs.com/package/@interchain-kit/react) | 25,065 | 977 | 87 |
| [interchain-kit](https://www.npmjs.com/package/interchain-kit) | 13,202 | 110 | 6 |
| [@interchain-kit/vue](https://www.npmjs.com/package/@interchain-kit/vue) | 5,814 | 134 | 2 |

### cosmos-kit-wallets

| Name | Total | Monthly | Weekly |
| ------- | ------ | ------- | ----- |
| _Total_ | 14,306,329 | 268,275 | 95,320 |
| [@cosmos-kit/keplr-extension](https://www.npmjs.com/package/@cosmos-kit/keplr-extension) | 715,489 | 13,034 | 4,325 |
| [@cosmos-kit/keplr](https://www.npmjs.com/package/@cosmos-kit/keplr) | 706,040 | 12,202 | 4,308 |
| [@cosmos-kit/leap-extension](https://www.npmjs.com/package/@cosmos-kit/leap-extension) | 685,369 | 11,974 | 4,084 |
| [@cosmos-kit/leap-extension](https://www.npmjs.com/package/@cosmos-kit/leap-extension) | 685,369 | 11,974 | 4,084 |
| [@cosmos-kit/keplr-mobile](https://www.npmjs.com/package/@cosmos-kit/keplr-mobile) | 682,481 | 12,616 | 4,317 |
| [@cosmos-kit/leap](https://www.npmjs.com/package/@cosmos-kit/leap) | 664,800 | 11,224 | 3,850 |
| [@cosmos-kit/leap-mobile](https://www.npmjs.com/package/@cosmos-kit/leap-mobile) | 619,706 | 11,099 | 3,772 |
| [@cosmos-kit/cosmostation-extension](https://www.npmjs.com/package/@cosmos-kit/cosmostation-extension) | 603,086 | 10,745 | 3,646 |
| [@cosmos-kit/cosmostation](https://www.npmjs.com/package/@cosmos-kit/cosmostation) | 577,619 | 9,446 | 3,396 |
| [@cosmos-kit/leap-metamask-cosmos-snap](https://www.npmjs.com/package/@cosmos-kit/leap-metamask-cosmos-snap) | 576,077 | 11,298 | 4,067 |
| [@cosmos-kit/cosmostation-mobile](https://www.npmjs.com/package/@cosmos-kit/cosmostation-mobile) | 560,926 | 9,865 | 3,432 |
| [@cosmos-kit/xdefi-extension](https://www.npmjs.com/package/@cosmos-kit/xdefi-extension) | 462,689 | 6,118 | 2,352 |
| [@cosmos-kit/okxwallet-extension](https://www.npmjs.com/package/@cosmos-kit/okxwallet-extension) | 461,849 | 8,155 | 3,022 |
| [@cosmos-kit/trust](https://www.npmjs.com/package/@cosmos-kit/trust) | 436,662 | 8,218 | 3,101 |
| [@cosmos-kit/trust-mobile](https://www.npmjs.com/package/@cosmos-kit/trust-mobile) | 435,938 | 8,238 | 3,092 |
| [@cosmos-kit/station-extension](https://www.npmjs.com/package/@cosmos-kit/station-extension) | 435,558 | 6,327 | 2,369 |
| [@cosmos-kit/station](https://www.npmjs.com/package/@cosmos-kit/station) | 433,846 | 6,328 | 2,367 |
| [@cosmos-kit/xdefi](https://www.npmjs.com/package/@cosmos-kit/xdefi) | 433,763 | 6,064 | 2,311 |
| [@cosmos-kit/trust-extension](https://www.npmjs.com/package/@cosmos-kit/trust-extension) | 423,044 | 7,984 | 3,080 |
| [@cosmos-kit/okxwallet](https://www.npmjs.com/package/@cosmos-kit/okxwallet) | 387,459 | 5,989 | 2,243 |
| [@cosmos-kit/cdcwallet-extension](https://www.npmjs.com/package/@cosmos-kit/cdcwallet-extension) | 364,024 | 8,067 | 2,913 |
| [@cosmos-kit/cdcwallet](https://www.npmjs.com/package/@cosmos-kit/cdcwallet) | 363,836 | 8,045 | 2,909 |
| [@cosmos-kit/omni-mobile](https://www.npmjs.com/package/@cosmos-kit/omni-mobile) | 122,787 | 2,931 | 939 |
| [@cosmos-kit/omni](https://www.npmjs.com/package/@cosmos-kit/omni) | 118,632 | 2,560 | 939 |
| [@cosmos-kit/compass-extension](https://www.npmjs.com/package/@cosmos-kit/compass-extension) | 117,768 | 2,582 | 905 |
| [@cosmos-kit/ledger](https://www.npmjs.com/package/@cosmos-kit/ledger) | 112,681 | 2,675 | 907 |
| [@cosmos-kit/compass](https://www.npmjs.com/package/@cosmos-kit/compass) | 110,654 | 2,548 | 907 |
| [@cosmos-kit/fin-extension](https://www.npmjs.com/package/@cosmos-kit/fin-extension) | 105,771 | 2,477 | 882 |
| [@cosmos-kit/coin98](https://www.npmjs.com/package/@cosmos-kit/coin98) | 105,010 | 2,401 | 884 |
| [@cosmos-kit/coin98-extension](https://www.npmjs.com/package/@cosmos-kit/coin98-extension) | 104,592 | 2,413 | 882 |
| [@cosmos-kit/vectis](https://www.npmjs.com/package/@cosmos-kit/vectis) | 101,834 | 995 | 231 |
| [@cosmos-kit/fin](https://www.npmjs.com/package/@cosmos-kit/fin) | 100,351 | 2,521 | 877 |
| [@cosmos-kit/shell-extension](https://www.npmjs.com/package/@cosmos-kit/shell-extension) | 99,328 | 2,401 | 861 |
| [@cosmos-kit/vectis-extension](https://www.npmjs.com/package/@cosmos-kit/vectis-extension) | 99,291 | 664 | 220 |
| [@cosmos-kit/exodus-extension](https://www.npmjs.com/package/@cosmos-kit/exodus-extension) | 99,063 | 2,385 | 862 |
| [@cosmos-kit/shell](https://www.npmjs.com/package/@cosmos-kit/shell) | 98,009 | 2,356 | 860 |
| [@cosmos-kit/exodus](https://www.npmjs.com/package/@cosmos-kit/exodus) | 97,323 | 2,457 | 863 |
| [@cosmos-kit/frontier-extension](https://www.npmjs.com/package/@cosmos-kit/frontier-extension) | 81,102 | 533 | 172 |
| [@cosmos-kit/frontier](https://www.npmjs.com/package/@cosmos-kit/frontier) | 79,936 | 522 | 177 |
| [@cosmos-kit/owallet-extension](https://www.npmjs.com/package/@cosmos-kit/owallet-extension) | 74,171 | 2,341 | 808 |
| [@cosmos-kit/owallet](https://www.npmjs.com/package/@cosmos-kit/owallet) | 74,067 | 2,326 | 802 |
| [@cosmos-kit/tailwind-extension](https://www.npmjs.com/package/@cosmos-kit/tailwind-extension) | 74,011 | 2,287 | 799 |
| [@cosmos-kit/tailwind](https://www.npmjs.com/package/@cosmos-kit/tailwind) | 73,513 | 2,287 | 797 |
| [@cosmos-kit/cosmos-extension-metamask](https://www.npmjs.com/package/@cosmos-kit/cosmos-extension-metamask) | 62,568 | 1,253 | 457 |
| [@cosmos-kit/galaxy-station](https://www.npmjs.com/package/@cosmos-kit/galaxy-station) | 53,541 | 2,013 | 764 |
| [@cosmos-kit/galaxy-station-extension](https://www.npmjs.com/package/@cosmos-kit/galaxy-station-extension) | 53,365 | 2,012 | 766 |
| [@cosmos-kit/web3auth](https://www.npmjs.com/package/@cosmos-kit/web3auth) | 43,213 | 411 | 139 |
| [@cosmos-kit/okto-extension](https://www.npmjs.com/package/@cosmos-kit/okto-extension) | 42,137 | 66 | 17 |
| [@cosmos-kit/owallet-mobile](https://www.npmjs.com/package/@cosmos-kit/owallet-mobile) | 38,765 | 2,199 | 767 |
| [@cosmos-kit/ctrl-extension](https://www.npmjs.com/package/@cosmos-kit/ctrl-extension) | 31,461 | 2,104 | 754 |
| [@cosmos-kit/ctrl](https://www.npmjs.com/package/@cosmos-kit/ctrl) | 31,181 | 2,087 | 759 |
| [@cosmos-kit/galaxy-station-mobile](https://www.npmjs.com/package/@cosmos-kit/galaxy-station-mobile) | 25,334 | 1,923 | 739 |
| [@cosmos-kit/imtoken-extension](https://www.npmjs.com/package/@cosmos-kit/imtoken-extension) | 16,444 | 62 | 18 |
| [@cosmos-kit/imtoken](https://www.npmjs.com/package/@cosmos-kit/imtoken) | 16,439 | 64 | 19 |
| [@cosmos-kit/ninji-extension](https://www.npmjs.com/package/@cosmos-kit/ninji-extension) | 15,202 | 134 | 45 |
| [@cosmos-kit/ninji](https://www.npmjs.com/package/@cosmos-kit/ninji) | 13,977 | 128 | 45 |
| [@cosmos-kit/ins](https://www.npmjs.com/package/@cosmos-kit/ins) | 12,354 | 126 | 57 |
| [@cosmos-kit/leap-capsule-social-login](https://www.npmjs.com/package/@cosmos-kit/leap-capsule-social-login) | 9,303 | 773 | 212 |
| [@cosmos-kit/initia-extension](https://www.npmjs.com/package/@cosmos-kit/initia-extension) | 7,388 | 134 | 40 |
| [@cosmos-kit/bitgetwallet-extension](https://www.npmjs.com/package/@cosmos-kit/bitgetwallet-extension) | 7,208 | 1,573 | 686 |
| [@cosmos-kit/initia](https://www.npmjs.com/package/@cosmos-kit/initia) | 6,978 | 198 | 38 |
| [@cosmos-kit/walletconnect-v1](https://www.npmjs.com/package/@cosmos-kit/walletconnect-v1) | 6,828 | 16 | 9 |
| [@cosmos-kit/types](https://www.npmjs.com/package/@cosmos-kit/types) | 4,656 | 8 | 3 |
| [@cosmos-kit/config](https://www.npmjs.com/package/@cosmos-kit/config) | 3,547 | 34 | 9 |
| [@cosmos-kit/registry](https://www.npmjs.com/package/@cosmos-kit/registry) | 3,455 | 19 | 13 |
| [@cosmos-wallet/react](https://www.npmjs.com/package/@cosmos-wallet/react) | 3,051 | 20 | 13 |
| [@cosmos-kit/walletconnect-v2](https://www.npmjs.com/package/@cosmos-kit/walletconnect-v2) | 2,806 | 15 | 9 |
| [@cosmos-wallet/core](https://www.npmjs.com/package/@cosmos-wallet/core) | 2,571 | 18 | 11 |
| [@cosmos-kit/gatewallet-extension](https://www.npmjs.com/package/@cosmos-kit/gatewallet-extension) | 2,445 | 509 | 139 |
| [@cosmos-kit/wallets](https://www.npmjs.com/package/@cosmos-kit/wallets) | 2,397 | 8 | 4 |
| [@cosmos-kit/terrastation-extension](https://www.npmjs.com/package/@cosmos-kit/terrastation-extension) | 2,048 | 14 | 8 |
| [@cosmos-kit/arculus-mobile](https://www.npmjs.com/package/@cosmos-kit/arculus-mobile) | 1,996 | 62 | 13 |
| [@cosmos-kit/terrastation](https://www.npmjs.com/package/@cosmos-kit/terrastation) | 1,986 | 14 | 8 |
| [@cosmos-kit/arculus](https://www.npmjs.com/package/@cosmos-kit/arculus) | 1,985 | 54 | 13 |
| [@cosmos-kit/prax-extension](https://www.npmjs.com/package/@cosmos-kit/prax-extension) | 1,780 | 54 | 18 |
| [@cosmos-kit/aria-extension](https://www.npmjs.com/package/@cosmos-kit/aria-extension) | 1,537 | 49 | 16 |
| [@cosmos-kit/gatewallet](https://www.npmjs.com/package/@cosmos-kit/gatewallet) | 1,530 | 52 | 16 |
| [@cosmos-wallet/registry](https://www.npmjs.com/package/@cosmos-wallet/registry) | 1,095 | 9 | 4 |
| *13 packages hidden (< 1,000 downloads)* | | | |

### telescope

| Name | Total | Monthly | Weekly |
| ------- | ------ | ------- | ----- |
| _Total_ | 10,495,939 | 383,208 | 92,145 |
| [@osmonauts/lcd](https://www.npmjs.com/package/@osmonauts/lcd) | 2,555,553 | 192,723 | 41,505 |
| [@cosmology/utils](https://www.npmjs.com/package/@cosmology/utils) | 969,978 | 26,106 | 7,796 |
| [@cosmology/types](https://www.npmjs.com/package/@cosmology/types) | 969,155 | 26,091 | 7,792 |
| [@cosmology/proto-parser](https://www.npmjs.com/package/@cosmology/proto-parser) | 945,556 | 25,854 | 7,719 |
| [@cosmology/lcd](https://www.npmjs.com/package/@cosmology/lcd) | 816,421 | 27,891 | 6,412 |
| [@cosmology/ast](https://www.npmjs.com/package/@cosmology/ast) | 727,725 | 20,756 | 5,655 |
| [@osmonauts/helpers](https://www.npmjs.com/package/@osmonauts/helpers) | 686,071 | 13,652 | 3,016 |
| [@cosmology/telescope](https://www.npmjs.com/package/@cosmology/telescope) | 639,737 | 20,182 | 5,606 |
| [@osmonauts/telescope](https://www.npmjs.com/package/@osmonauts/telescope) | 455,464 | 5,766 | 1,273 |
| [@osmonauts/ast](https://www.npmjs.com/package/@osmonauts/ast) | 442,214 | 5,800 | 1,280 |
| [@osmonauts/proto-parser](https://www.npmjs.com/package/@osmonauts/proto-parser) | 440,919 | 5,912 | 1,283 |
| [@osmonauts/types](https://www.npmjs.com/package/@osmonauts/types) | 438,391 | 5,909 | 1,284 |
| [@osmonauts/utils](https://www.npmjs.com/package/@osmonauts/utils) | 408,755 | 6,566 | 1,524 |

### cosmwasm

| Name | Total | Monthly | Weekly |
| ------- | ------ | ------- | ----- |
| _Total_ | 5,747,936 | 130,066 | 32,675 |
| [@cosmwasm/ts-codegen](https://www.npmjs.com/package/@cosmwasm/ts-codegen) | 1,514,983 | 31,714 | 8,194 |
| [wasm-ast-types](https://www.npmjs.com/package/wasm-ast-types) | 1,417,137 | 28,342 | 7,269 |
| [@pyramation/json-schema-to-typescript](https://www.npmjs.com/package/@pyramation/json-schema-to-typescript) | 1,298,412 | 31,720 | 7,746 |
| [@pyramation/json-schema-ref-parser](https://www.npmjs.com/package/@pyramation/json-schema-ref-parser) | 1,296,452 | 31,775 | 7,825 |
| [@cosmwasm/ts-codegen-ast](https://www.npmjs.com/package/@cosmwasm/ts-codegen-ast) | 96,341 | 3,158 | 804 |
| [@cosmwasm/ts-codegen-types](https://www.npmjs.com/package/@cosmwasm/ts-codegen-types) | 95,445 | 3,154 | 799 |
| [cosmwasm-typescript-gen](https://www.npmjs.com/package/cosmwasm-typescript-gen) | 19,370 | 88 | 3 |
| [@cosmjson/wasmswap](https://www.npmjs.com/package/@cosmjson/wasmswap) | 2,374 | 20 | 3 |
| [@cosmjson/stargaze-minter](https://www.npmjs.com/package/@cosmjson/stargaze-minter) | 1,031 | 9 | 5 |
| *14 packages hidden (< 1,000 downloads)* | | | |

### interchain-js

| Name | Total | Monthly | Weekly |
| ------- | ------ | ------- | ----- |
| _Total_ | 1,517,678 | 59,850 | 9,854 |
| [@interchainjs/types](https://www.npmjs.com/package/@interchainjs/types) | 146,066 | 5,233 | 871 |
| [@interchainjs/utils](https://www.npmjs.com/package/@interchainjs/utils) | 146,024 | 5,208 | 888 |
| [@interchainjs/cosmos-types](https://www.npmjs.com/package/@interchainjs/cosmos-types) | 141,917 | 5,156 | 854 |
| [interchainjs](https://www.npmjs.com/package/interchainjs) | 138,394 | 4,750 | 836 |
| [@interchainjs/cosmos](https://www.npmjs.com/package/@interchainjs/cosmos) | 135,531 | 5,238 | 866 |
| [@interchainjs/auth](https://www.npmjs.com/package/@interchainjs/auth) | 132,275 | 5,109 | 867 |
| [@interchainjs/math](https://www.npmjs.com/package/@interchainjs/math) | 117,219 | 5,161 | 815 |
| [@interchainjs/crypto](https://www.npmjs.com/package/@interchainjs/crypto) | 115,474 | 5,146 | 811 |
| [@interchainjs/encoding](https://www.npmjs.com/package/@interchainjs/encoding) | 114,532 | 5,151 | 819 |
| [@interchainjs/amino](https://www.npmjs.com/package/@interchainjs/amino) | 114,464 | 5,138 | 813 |
| [@interchainjs/pubkey](https://www.npmjs.com/package/@interchainjs/pubkey) | 114,096 | 5,067 | 797 |
| [@interchainjs/ethereum](https://www.npmjs.com/package/@interchainjs/ethereum) | 23,788 | 1,877 | 402 |
| [injectivejs](https://www.npmjs.com/package/injectivejs) | 17,671 | 141 | 18 |
| [@interchainjs/injective](https://www.npmjs.com/package/@interchainjs/injective) | 15,305 | 138 | 13 |
| [injective-react](https://www.npmjs.com/package/injective-react) | 6,934 | 110 | 3 |
| [@interchainjs/react](https://www.npmjs.com/package/@interchainjs/react) | 6,825 | 267 | 5 |
| [injective-vue](https://www.npmjs.com/package/injective-vue) | 6,440 | 181 | 2 |
| [interchain-rpc](https://www.npmjs.com/package/interchain-rpc) | 6,030 | 207 | 44 |
| [@interchainjs/vue](https://www.npmjs.com/package/@interchainjs/vue) | 5,806 | 217 | 70 |
| [interchain46](https://www.npmjs.com/package/interchain46) | 1,527 | 43 | 10 |
| [@interchainjs/ethermint](https://www.npmjs.com/package/@interchainjs/ethermint) | 1,221 | 9 | 1 |
| [interchain-react](https://www.npmjs.com/package/interchain-react) | 1,219 | 9 | 2 |
| *26 packages hidden (< 1,000 downloads)* | | | |

### hyperwebjs

| Name | Total | Monthly | Weekly |
| ------- | ------ | ------- | ----- |
| _Total_ | 10,360 | 436 | 97 |
| [hyperwebjs](https://www.npmjs.com/package/hyperwebjs) | 3,175 | 105 | 35 |
| [@hyperweb/build](https://www.npmjs.com/package/@hyperweb/build) | 2,172 | 97 | 35 |
| [@hyperweb/telescope](https://www.npmjs.com/package/@hyperweb/telescope) | 1,702 | 163 | 13 |
| *8 packages hidden (< 1,000 downloads)* | | | |

### interchain-kit

| Name | Total | Monthly | Weekly |
| ------- | ------ | ------- | ----- |
| _Total_ | 140,381 | 3,982 | 466 |
| [@interchain-kit/core](https://www.npmjs.com/package/@interchain-kit/core) | 96,300 | 2,761 | 371 |
| [@interchain-kit/react](https://www.npmjs.com/package/@interchain-kit/react) | 25,065 | 977 | 87 |
| [interchain-kit](https://www.npmjs.com/package/interchain-kit) | 13,202 | 110 | 6 |
| [@interchain-kit/vue](https://www.npmjs.com/package/@interchain-kit/vue) | 5,814 | 134 | 2 |

### interchain-kit-wallets

| Name | Total | Monthly | Weekly |
| ------- | ------ | ------- | ----- |
| _Total_ | 361,905 | 9,970 | 736 |
| [@interchain-kit/keplr-extension](https://www.npmjs.com/package/@interchain-kit/keplr-extension) | 62,844 | 1,533 | 216 |
| [@interchain-kit/leap-extension](https://www.npmjs.com/package/@interchain-kit/leap-extension) | 61,286 | 1,597 | 217 |
| [@interchain-kit/okx-extension](https://www.npmjs.com/package/@interchain-kit/okx-extension) | 57,862 | 721 | 149 |
| [@interchain-kit/cosmostation-extension](https://www.npmjs.com/package/@interchain-kit/cosmostation-extension) | 18,338 | 349 | 40 |
| [@interchain-kit/keplr-mobile](https://www.npmjs.com/package/@interchain-kit/keplr-mobile) | 12,963 | 583 | 26 |
| [@interchain-kit/leap-mobile](https://www.npmjs.com/package/@interchain-kit/leap-mobile) | 12,566 | 513 | 24 |
| [@interchain-kit/coin98-extension](https://www.npmjs.com/package/@interchain-kit/coin98-extension) | 12,255 | 534 | 3 |
| [@interchain-kit/ledger](https://www.npmjs.com/package/@interchain-kit/ledger) | 11,431 | 334 | 2 |
| [@interchain-kit/mock-wallet](https://www.npmjs.com/package/@interchain-kit/mock-wallet) | 10,488 | 380 | 5 |
| [@interchain-kit/frontier-extension](https://www.npmjs.com/package/@interchain-kit/frontier-extension) | 10,104 | 317 | 2 |
| [@interchain-kit/station-extension](https://www.npmjs.com/package/@interchain-kit/station-extension) | 10,009 | 303 | 2 |
| [@interchain-kit/cosmos-extension-metamask](https://www.npmjs.com/package/@interchain-kit/cosmos-extension-metamask) | 9,899 | 204 | 4 |
| [@interchain-kit/galaxy-station-extension](https://www.npmjs.com/package/@interchain-kit/galaxy-station-extension) | 9,787 | 243 | 3 |
| [@interchain-kit/leap-cosmos-extension-metamask](https://www.npmjs.com/package/@interchain-kit/leap-cosmos-extension-metamask) | 9,546 | 322 | 3 |
| [@interchain-kit/trust-extension](https://www.npmjs.com/package/@interchain-kit/trust-extension) | 8,636 | 277 | 2 |
| [@interchain-kit/xdefi-extension](https://www.npmjs.com/package/@interchain-kit/xdefi-extension) | 6,072 | 225 | 2 |
| [@interchain-kit/vue](https://www.npmjs.com/package/@interchain-kit/vue) | 5,814 | 134 | 2 |
| [@interchain-kit/compass-extension](https://www.npmjs.com/package/@interchain-kit/compass-extension) | 5,703 | 227 | 1 |
| [@interchain-kit/metamask-extension](https://www.npmjs.com/package/@interchain-kit/metamask-extension) | 5,618 | 215 | 1 |
| [@interchain-kit/exodus-extension](https://www.npmjs.com/package/@interchain-kit/exodus-extension) | 4,637 | 218 | 1 |
| [@interchain-kit/fin-extension](https://www.npmjs.com/package/@interchain-kit/fin-extension) | 4,543 | 220 | 2 |
| [@interchain-kit/ninji-extension](https://www.npmjs.com/package/@interchain-kit/ninji-extension) | 3,957 | 167 | 1 |
| [@interchain-kit/shell-extension](https://www.npmjs.com/package/@interchain-kit/shell-extension) | 3,643 | 155 | 1 |
| [@interchain-kit/phantom-extension](https://www.npmjs.com/package/@interchain-kit/phantom-extension) | 1,316 | 40 | 1 |
| [@interchain-kit/store](https://www.npmjs.com/package/@interchain-kit/store) | 1,189 | 92 | 24 |
| *3 packages hidden (< 1,000 downloads)* | | | |

### interchain-ui

| Name | Total | Monthly | Weekly |
| ------- | ------ | ------- | ----- |
| _Total_ | 308,204 | 8,928 | 2,640 |
| [@interchain-ui/react](https://www.npmjs.com/package/@interchain-ui/react) | 288,926 | 8,618 | 2,611 |
| [@interchain-ui/vue](https://www.npmjs.com/package/@interchain-ui/vue) | 10,234 | 23 | 2 |
| [@interchain-ui/react-no-ssr](https://www.npmjs.com/package/@interchain-ui/react-no-ssr) | 7,390 | 269 | 26 |
| *3 packages hidden (< 1,000 downloads)* | | | |

### osmosis

| Name | Total | Monthly | Weekly |
| ------- | ------ | ------- | ----- |
| _Total_ | 691,976 | 19,170 | 3,646 |
| [osmojs](https://www.npmjs.com/package/osmojs) | 575,514 | 17,829 | 3,476 |
| [osmo-query](https://www.npmjs.com/package/osmo-query) | 44,534 | 516 | 97 |
| [@osmonauts/math](https://www.npmjs.com/package/@osmonauts/math) | 40,561 | 232 | 11 |
| [@osmosis-labs/math](https://www.npmjs.com/package/@osmosis-labs/math) | 12,464 | 414 | 46 |
| [@osmosis-labs/pools](https://www.npmjs.com/package/@osmosis-labs/pools) | 7,711 | 63 | 5 |
| [@osmosis-labs/proto-codecs](https://www.npmjs.com/package/@osmosis-labs/proto-codecs) | 4,650 | 9 | 2 |
| [@osmosis-labs/stores](https://www.npmjs.com/package/@osmosis-labs/stores) | 3,881 | 35 | 2 |
| *7 packages hidden (< 1,000 downloads)* | | | |

### starship

| Name | Total | Monthly | Weekly |
| ------- | ------ | ------- | ----- |
| _Total_ | 85,425 | 4,220 | 852 |
| [@starship-ci/client](https://www.npmjs.com/package/@starship-ci/client) | 27,531 | 1,370 | 268 |
| [starshipjs](https://www.npmjs.com/package/starshipjs) | 27,387 | 1,241 | 271 |
| [@starship-ci/cli](https://www.npmjs.com/package/@starship-ci/cli) | 25,563 | 1,359 | 265 |
| [@starship-ci/types](https://www.npmjs.com/package/@starship-ci/types) | 4,471 | 235 | 45 |
| *1 package hidden (< 1,000 downloads)* | | | |

### cosmology

| Name | Total | Monthly | Weekly |
| ------- | ------ | ------- | ----- |
| _Total_ | 472,404 | 5,025 | 1,247 |
| [interchain](https://www.npmjs.com/package/interchain) | 90,049 | 467 | 156 |
| [@cosmology/core](https://www.npmjs.com/package/@cosmology/core) | 48,630 | 724 | 151 |
| [cosmjs-utils](https://www.npmjs.com/package/cosmjs-utils) | 45,734 | 1,946 | 302 |
| [cosmology](https://www.npmjs.com/package/cosmology) | 31,551 | 13 | 3 |
| [@cosmology-ui/react](https://www.npmjs.com/package/@cosmology-ui/react) | 29,598 | 151 | 69 |
| [@cosmology/cli](https://www.npmjs.com/package/@cosmology/cli) | 28,085 | 161 | 139 |
| [@cosmology-ui/utils](https://www.npmjs.com/package/@cosmology-ui/utils) | 25,043 | 79 | 31 |
| [interchain-query](https://www.npmjs.com/package/interchain-query) | 20,673 | 264 | 29 |
| [create-cosmos-app](https://www.npmjs.com/package/create-cosmos-app) | 16,359 | 43 | 21 |
| [@cosmonauts/telescope](https://www.npmjs.com/package/@cosmonauts/telescope) | 7,974 | 47 | 40 |
| [thorchain](https://www.npmjs.com/package/thorchain) | 7,924 | 88 | 23 |
| [@cosmonauts/osmosis](https://www.npmjs.com/package/@cosmonauts/osmosis) | 6,731 | 93 | 34 |
| [create-cosmwasm-app](https://www.npmjs.com/package/create-cosmwasm-app) | 5,422 | 9 | 1 |
| [@osmonauts/babel](https://www.npmjs.com/package/@osmonauts/babel) | 5,284 | 8 | 2 |
| [@pyramation/crypto-keys](https://www.npmjs.com/package/@pyramation/crypto-keys) | 5,039 | 7 | 1 |
| [@cosmology/cosmos-registry](https://www.npmjs.com/package/@cosmology/cosmos-registry) | 4,912 | 23 | 13 |
| [@osmonauts/osmosis](https://www.npmjs.com/package/@osmonauts/osmosis) | 4,680 | 14 | 2 |
| [@pyramation/crypto-coins](https://www.npmjs.com/package/@pyramation/crypto-coins) | 4,231 | 4 | 0 |
| [@pyramation/crypto-networks](https://www.npmjs.com/package/@pyramation/crypto-networks) | 3,955 | 5 | 0 |
| [dydx](https://www.npmjs.com/package/dydx) | 3,390 | 4 | 0 |
| [stargaze-zone](https://www.npmjs.com/package/stargaze-zone) | 3,112 | 95 | 18 |
| [cosmscript](https://www.npmjs.com/package/cosmscript) | 3,082 | 7 | 1 |
| [@cosmology-ui/chain-dropdown](https://www.npmjs.com/package/@cosmology-ui/chain-dropdown) | 2,550 | 25 | 10 |
| [@cosmology-ui/theme](https://www.npmjs.com/package/@cosmology-ui/theme) | 2,530 | 25 | 9 |
| [@cosmology-ui/copy-address-button](https://www.npmjs.com/package/@cosmology-ui/copy-address-button) | 2,519 | 27 | 10 |
| [@cosmology-ui/connect-modal](https://www.npmjs.com/package/@cosmology-ui/connect-modal) | 2,495 | 33 | 12 |
| [@pyramation/crypto-cli](https://www.npmjs.com/package/@pyramation/crypto-cli) | 2,490 | 8 | 1 |
| [@cosmology-ui/base](https://www.npmjs.com/package/@cosmology-ui/base) | 2,474 | 26 | 9 |
| [@cosmology-ui/buttons](https://www.npmjs.com/package/@cosmology-ui/buttons) | 2,462 | 27 | 10 |
| [@cosmology-ui/animation](https://www.npmjs.com/package/@cosmology-ui/animation) | 2,428 | 24 | 9 |
| [@cosmology-ui/swap](https://www.npmjs.com/package/@cosmology-ui/swap) | 2,180 | 23 | 8 |
| [badkidsjs](https://www.npmjs.com/package/badkidsjs) | 2,002 | 6 | 0 |
| [@osmonauts/ast-gen](https://www.npmjs.com/package/@osmonauts/ast-gen) | 1,922 | 8 | 2 |
| [@cosmonauts/protobuf](https://www.npmjs.com/package/@cosmonauts/protobuf) | 1,875 | 18 | 10 |
| [@cosmonauts/ast-gen](https://www.npmjs.com/package/@cosmonauts/ast-gen) | 1,811 | 28 | 8 |
| [dexmos](https://www.npmjs.com/package/dexmos) | 1,628 | 8 | 3 |
| [@pyramation/cosmos-registry](https://www.npmjs.com/package/@pyramation/cosmos-registry) | 1,579 | 5 | 1 |
| [@cosmology/react](https://www.npmjs.com/package/@cosmology/react) | 1,511 | 18 | 8 |
| [chain-registry-utils](https://www.npmjs.com/package/chain-registry-utils) | 1,289 | 6 | 2 |
| [@cosmology/protobufs](https://www.npmjs.com/package/@cosmology/protobufs) | 1,264 | 10 | 5 |
| [cosmoscript](https://www.npmjs.com/package/cosmoscript) | 1,177 | 10 | 1 |
| [teslapi](https://www.npmjs.com/package/teslapi) | 1,162 | 3 | 0 |
| [mesh-security](https://www.npmjs.com/package/mesh-security) | 1,153 | 6 | 1 |
| [@cosmology/ts-codegen-types](https://www.npmjs.com/package/@cosmology/ts-codegen-types) | 1,124 | 10 | 6 |
| [@uni-sign/types](https://www.npmjs.com/package/@uni-sign/types) | 1,063 | 3 | 0 |
| *65 packages hidden (< 1,000 downloads)* | | | |

### stride

| Name | Total | Monthly | Weekly |
| ------- | ------ | ------- | ----- |
| _Total_ | 34,717 | 220 | 39 |
| [stridejs](https://www.npmjs.com/package/stridejs) | 34,717 | 220 | 39 |

### juno

| Name | Total | Monthly | Weekly |
| ------- | ------ | ------- | ----- |
| _Total_ | 43,301 | 255 | 28 |
| [juno-network](https://www.npmjs.com/package/juno-network) | 35,747 | 248 | 28 |
| [@juno-network/assets](https://www.npmjs.com/package/@juno-network/assets) | 7,554 | 7 | 0 |

### stargaze

| Name | Total | Monthly | Weekly |
| ------- | ------ | ------- | ----- |
| _Total_ | 31,156 | 137 | 17 |
| [stargazejs](https://www.npmjs.com/package/stargazejs) | 20,976 | 102 | 15 |
| [@stargaze-zone/contracts](https://www.npmjs.com/package/@stargaze-zone/contracts) | 4,252 | 5 | 0 |
| [@stargaze-zone/chain](https://www.npmjs.com/package/@stargaze-zone/chain) | 3,812 | 5 | 0 |
| [stargaze-query](https://www.npmjs.com/package/stargaze-query) | 2,116 | 25 | 2 |

### dydx

| Name | Total | Monthly | Weekly |
| ------- | ------ | ------- | ----- |
| _Total_ | 1,293,717 | 163,795 | 37,151 |
| [@dydxprotocol/v4-client-js](https://www.npmjs.com/package/@dydxprotocol/v4-client-js) | 1,293,717 | 163,795 | 37,151 |

### utils

| Name | Total | Monthly | Weekly |
| ------- | ------ | ------- | ----- |
| _Total_ | 3,801,431 | 175,114 | 49,154 |
| [inquirerer](https://www.npmjs.com/package/inquirerer) | 1,414,213 | 40,115 | 11,173 |
| [ast-stringify](https://www.npmjs.com/package/ast-stringify) | 1,323,897 | 30,420 | 7,949 |
| [nested-obj](https://www.npmjs.com/package/nested-obj) | 443,480 | 30,410 | 8,383 |
| [strfy-js](https://www.npmjs.com/package/strfy-js) | 126,878 | 20,072 | 4,202 |
| [skitch](https://www.npmjs.com/package/skitch) | 125,349 | 51 | 6 |
| [etag-hash](https://www.npmjs.com/package/etag-hash) | 93,436 | 9,876 | 3,205 |
| [uuid-hash](https://www.npmjs.com/package/uuid-hash) | 65,158 | 7,840 | 1,705 |
| [publish-scripts](https://www.npmjs.com/package/publish-scripts) | 28,755 | 1,594 | 283 |
| [@pyramation/babel-preset-env](https://www.npmjs.com/package/@pyramation/babel-preset-env) | 27,760 | 796 | 11 |
| [symlink-workspace](https://www.npmjs.com/package/symlink-workspace) | 19,850 | 685 | 276 |
| [schema-typescript](https://www.npmjs.com/package/schema-typescript) | 19,486 | 1,747 | 122 |
| [json-schema-patch](https://www.npmjs.com/package/json-schema-patch) | 16,242 | 522 | 75 |
| [file-ts](https://www.npmjs.com/package/file-ts) | 15,919 | 527 | 76 |
| [skitch-template](https://www.npmjs.com/package/skitch-template) | 13,950 | 4 | 0 |
| [mime-bytes](https://www.npmjs.com/package/mime-bytes) | 13,165 | 8,537 | 2,805 |
| [introspectron](https://www.npmjs.com/package/introspectron) | 12,755 | 4,217 | 206 |
| [yanse](https://www.npmjs.com/package/yanse) | 6,263 | 6,263 | 4,273 |
| [komoji](https://www.npmjs.com/package/komoji) | 4,192 | 4,192 | 2,884 |
| [schema-sdk](https://www.npmjs.com/package/schema-sdk) | 4,074 | 1,316 | 58 |
| [etag-stream](https://www.npmjs.com/package/etag-stream) | 3,674 | 1,169 | 19 |
| [uuid-stream](https://www.npmjs.com/package/uuid-stream) | 3,393 | 1,051 | 19 |
| [makage](https://www.npmjs.com/package/makage) | 2,581 | 2,581 | 1,366 |
| [niftymagick](https://www.npmjs.com/package/niftymagick) | 1,994 | 7 | 0 |
| [@yamlize/cli](https://www.npmjs.com/package/@yamlize/cli) | 1,912 | 44 | 1 |
| [yamlize](https://www.npmjs.com/package/yamlize) | 1,745 | 47 | 1 |
| [12factor-env](https://www.npmjs.com/package/12factor-env) | 1,577 | 11 | 1 |
| [airpage-cli](https://www.npmjs.com/package/airpage-cli) | 1,404 | 5 | 0 |
| [@webql/base32](https://www.npmjs.com/package/@webql/base32) | 1,319 | 214 | 1 |
| [airpage](https://www.npmjs.com/package/airpage) | 1,175 | 2 | 1 |
| *12 packages hidden (< 1,000 downloads)* | | | |

### create-cosmos-app

| Name | Total | Monthly | Weekly |
| ------- | ------ | ------- | ----- |
| _Total_ | 18,402 | 59 | 23 |
| [create-cosmos-app](https://www.npmjs.com/package/create-cosmos-app) | 16,359 | 43 | 21 |
| [create-interchain-app](https://www.npmjs.com/package/create-interchain-app) | 2,043 | 16 | 2 |

### kubernetesjs

| Name | Total | Monthly | Weekly |
| ------- | ------ | ------- | ----- |
| _Total_ | 8,061 | 1,362 | 58 |
| [kubernetesjs](https://www.npmjs.com/package/kubernetesjs) | 5,335 | 551 | 56 |
| [@kubernetesjs/cli](https://www.npmjs.com/package/@kubernetesjs/cli) | 1,196 | 137 | 1 |
| [@kubernetesjs/react](https://www.npmjs.com/package/@kubernetesjs/react) | 1,020 | 164 | 1 |
| *4 packages hidden (< 1,000 downloads)* | | | |

### pgpm

| Name | Total | Monthly | Weekly |
| ------- | ------ | ------- | ----- |
| _Total_ | 44,503 | 43,191 | 17,938 |
| [pgpm](https://www.npmjs.com/package/pgpm) | 8,131 | 8,131 | 3,035 |
| [@pgpm/verify](https://www.npmjs.com/package/@pgpm/verify) | 2,758 | 2,758 | 1,112 |
| [@pgpm/types](https://www.npmjs.com/package/@pgpm/types) | 2,205 | 2,205 | 1,102 |
| [@pgpm/default-roles](https://www.npmjs.com/package/@pgpm/default-roles) | 2,097 | 2,097 | 1,113 |
| [@pgpm/database-jobs](https://www.npmjs.com/package/@pgpm/database-jobs) | 1,968 | 1,968 | 1,102 |
| [@pgpm/defaults](https://www.npmjs.com/package/@pgpm/defaults) | 1,827 | 1,827 | 1,113 |
| [@pgpm/inflection](https://www.npmjs.com/package/@pgpm/inflection) | 1,818 | 1,818 | 950 |
| [@pgpm/meta-db](https://www.npmjs.com/package/@pgpm/meta-db) | 1,773 | 1,773 | 951 |
| [@pgpm/jwt-claims](https://www.npmjs.com/package/@pgpm/jwt-claims) | 1,761 | 1,761 | 951 |
| [@pgpm/meta-db-modules](https://www.npmjs.com/package/@pgpm/meta-db-modules) | 1,737 | 1,737 | 951 |
| [@pgpm/base32](https://www.npmjs.com/package/@pgpm/base32) | 1,698 | 1,698 | 950 |
| [@pgpm/utils](https://www.npmjs.com/package/@pgpm/utils) | 1,671 | 1,671 | 951 |
| [@pgpm/stamps](https://www.npmjs.com/package/@pgpm/stamps) | 1,661 | 1,661 | 951 |
| [@pgpm/totp](https://www.npmjs.com/package/@pgpm/totp) | 1,658 | 1,658 | 951 |
| [@pgpm/uuid](https://www.npmjs.com/package/@pgpm/uuid) | 1,655 | 1,655 | 951 |
| [@pgsql/cli](https://www.npmjs.com/package/@pgsql/cli) | 1,636 | 324 | 3 |
| [@pgpm/faker](https://www.npmjs.com/package/@pgpm/faker) | 1,415 | 1,415 | 710 |
| *17 packages hidden (< 1,000 downloads)* | | | |


---

# Interchain JavaScript Stack Announcement

🎥 Watch the [Interchain JS presentation](https://www.youtube.com/watch?v=locvOlLDoVY&list=PL_XyHnlG9MMvekTCbbJArAOwVlkCY54V5&index=1).

<a href="https://www.youtube.com/watch?v=locvOlLDoVY&list=PL_XyHnlG9MMvekTCbbJArAOwVlkCY54V5&index=1">
<img width="400px" src="https://github.com/user-attachments/assets/9d34000e-56ff-4e83-8e4d-612bc79712f4" />
</a>


---

## What Does This Rebrand Mean?

### 🌟 **A Unified Vision**
Hyperweb represents the evolution of Cosmology's mission, focusing on accessibility, innovation, and empowering cross-chain development for everyone.

### 🤝 **Same Great Tools, New Identity**
All the tools and projects you know and love from Cosmology are now part of the Hyperweb ecosystem. Expect the same commitment to open-source collaboration with a fresh perspective.


---

## What's Next?

1. **Explore Hyperweb**
   Visit [**hyperweb-io on GitHub**](https://github.com/hyperweb-io) to find all the tools, repositories, and resources under the new brand.

2. **Follow Our Growth**
   Stay tuned as we continue to innovate and expand the possibilities of cross-chain development with Hyperweb.

3. **Join the Movement**
   Be part of the Hyperweb community and help us shape the future of decentralized technology.


---

### Thank You 💖

To the amazing Cosmology community: thank you for being part of our journey. With Hyperweb, we're taking everything you love to the next level—and we're thrilled to have you with us.

Let's build the future, together. 🚀



<!-- README.md automatically generated on 2025-12-06T07:59:54.744Z from lib-count repository with latest download stats -->
