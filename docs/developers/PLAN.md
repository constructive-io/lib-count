# developers — plan

**Status:** plan only. Nothing in `packages/` changes in this PR. A follow-up session implements it phase by phase using this document as the brief (Section 6). The schema in `SCHEMA.sql` and the checks in `PHASE0_CHECKS.sql` were executed on PostgreSQL 18.6 (Appendix B); `intent.example.yaml` is the crawler's configuration contract.

Inspiration: Dan's scaffold branch on `pyramation-studio/lib-count` (commit a94b6cb: README, PROPOSAL, AGENT_PROMPT, ~20 Python reference scripts). This plan replaces it; the scaffold is not merged.

## 1. Goal, non-goals, glossary

**Goal.** A deterministic, re-runnable map of **who uses our code**: which npm packages and GitHub repositories depend on packages published from the `constructive-io` GitHub org and the `pyramation` npm account — direct dependents, a bounded second hop, **current and past** usage with added/removed dates, the owning company, the developer who added the dependency, and that developer's self-reported employer with source and confidence on every inferred claim. Everything lands in Postgres as pgpm modules so weeks can be diffed (`new_developers`, `lost_developers`, `developers_by_company`).

**Non-goals.** No change to how lib-count counts downloads, builds badges or publishes `stats_dev`. No publishing of any people data; not even aggregate counts in this work. No npm-web scraping from CI. No commit e-mails, ever.

**Glossary (naming is mandatory).**

| term | meaning |
|---|---|
| **developers** | the name of this feature everywhere: packages, schemas, DB, docs. Never "customer", "customer graph" or "users". |
| **ours / target** | one of our packages (`developers.tracked_target`, seeded from `npm_count.npm_package`). A **target** is the package a crawl run looks for dependents of (ours for hop 1, a hop-1 dependent for hop 2). |
| **dependent** | an npm package or a GitHub repository whose manifest or lockfile references a target. |
| **edge** | `developers.dependency_edge`: dependent → target, per manifest path and hop. |
| **observation** | `developers.edge_observation`: "run R, via source S, saw edge E at time T". Append-only. |
| **run** | `developers.crawl_run`: one crawler execution over a set of targets with params and the crawler git sha. Only a `complete` run can remove edges. |
| **discovery source** | proposes candidates, may be incomplete (ecosyste.ms, GitHub dependents HTML, npm-web). |
| **verifying source** | authoritative for an edge: the registry packument (`npm-registry`) or the dependent repo's default-branch manifests/lockfiles via the GitHub API (`github-api`). |
| **family** | lib-count brand rollup of a target: `cloud` (Constructive), `chain`, `utils`, `personal` — same semantics as `brandRollupFor` in `stats-db/src/config/categories.ts`. |
| **private** | schema `developers_private`: accounts, people, organizations, employment claims, commit events. Lives only in the `developers_dev` database; never in `stats_dev`, never dumped, never exported, never committed. |

## 2. Decisions log

Each entry: decision → alternatives → why. Dan delegated every decision; nothing here is open unless listed in Section 8.

**D1. Three new workspace packages, nothing else touched.**
`packages/developers` (pgpm module, schema `developers`, public-safe graph), `packages/developers-private` (pgpm module, schema `developers_private`, people), `packages/developers-crawler` (TypeScript CLI). npm names follow the siblings: `@interweb-utils/developers`, `@interweb-utils/developers-private`, `@interweb-utils/developers-crawler`, all `"private": true`.
*Alternatives:* (a) a separate `developers/` workspace with its own `pgpm.json`/`pnpm-workspace.yaml` (the scaffold's choice); (b) a fourth `developers-reports` module. *Why:* Dan asked for "a couple of new packages inside of our workspace". Being in the workspace is what lets the modules `requires` the existing `npm` and `github` modules (D3) and reuse the root toolchain. A separate reports module adds a package for ~10 views; views live in the module whose schema they read (PII-free views in `developers`, people views in `developers_private`), which also makes the isolation test (C3) trivial.

**D2. Own database `developers_dev`; `stats_dev` is read-only input.**
The developers modules deploy into their own database (`developers_dev` locally, mirroring `stats_dev`). lib-count data is brought in by a one-way `sync-lib-count` crawler task that reads `stats_dev` over a second connection and upserts into the **local copies** of `npm_count.*` and `github.*` created by D3.
*Alternatives:* (a) a public-safe graph schema inside `stats_dev` plus a private schema elsewhere; (b) `postgres_fdw` foreign tables instead of copying. *Why:* `packages/stats-db/src/dump.ts` runs `pg_dump stats_dev` (whole database) and the dump is published to the public `constructive-io/lib-count-downloads`; `dump.ts` must not change, so **nothing** of this feature may live in `stats_dev` — not even the "public-safe" half, because an edge list of third-party dependents is still a product decision Dan has not made. FDW was rejected because (1) it makes every test need a live second database (pgsql-test cannot provide one), (2) views over foreign tables are slow and non-deterministic across runs, and (3) a copy is what makes `adoption_by_week` a plain local join. The copy is small: ~1.2k `npm_package` rows, categories, and `daily_downloads` incrementally (last 35 days re-copied each run, like `update_stats.sh` re-fetches 30 days).

**D3. `developers` `requires = 'plpgsql,uuid-ossp,citext,pgpm-verify,npm,github'`; `developers-private` requires `developers`.**
*Alternatives:* no module dependency, join by name only; or copy only the npm module. *Why:* Dan: "it can include or import the other schemas there, but not the other way around." Requiring `npm` and `github` means one `pgpm deploy --package developers-private --database developers_dev --createdb` creates `npm_count`, `github`, `developers`, `developers_private` in dependency order, and views can join `npm_count.npm_package` / `package_category` / `daily_downloads` and `github.contributor` directly. The dependency direction is strictly new → old (Section 3).

**D4. No foreign keys into `npm_count.*` or `github.*`; joins by natural key.**
`developers.our_package` joins `npm_count.npm_package` by `package_name`; `developers_private.contributor_overlap` joins `github.contributor` by `login`. *Why:* in `stats_dev` the `github.*` tables are wiped by `gh:fetch` (`CLEAR_DATA_BEFORE_FETCH: true`), and their uuid PKs are `uuid_generate_v4()` so ids change on every refetch. Our copy is never wiped, but the sync must map rows by `github_id`/`login` anyway, and an FK would freeze an id that upstream regenerates. `npm_count.npm_package` rows are never deleted, so an FK would be safe there, but the natural key is the same join and keeps `developers` independent of lib-count's internal ids.

**D5. Third-party packages never enter `npm_count.npm_package`.**
Every third-party package (dependents, hop-2 targets) is a row in `developers.package`. The only writer to `npm_count.*` in `developers_dev` is `sync-lib-count`, and it only copies rows that already exist in `stats_dev`. *Why:* every `npm_count.npm_package` row counts toward public totals and badges. Enforced by review rule plus a test that greps the crawler for `INSERT INTO npm_count` outside `sync-lib-count.ts` (Phase 1 acceptance).

**D6. Reuse of stats-db code: read its *data*, port its *clients*.**
- Brand/category mapping: **not imported**. `stats-db`'s `npm:categories:sync` already materializes `categories.ts` into `npm_count.category`/`package_category`; the sync copies those rows, and `developers.our_package` computes `family` from them plus the small seed table `developers.category_family` (the `chainCategories` / `personalCategories` / `utilsCategories` lists; everything else → `cloud`, exactly like `brandRollupFor`). A jest test in the crawler imports `../../stats-db/src/config/categories` **test-only** and asserts the seed equals `brandRollupFor` for every category name, so drift fails CI without a runtime dependency.
- Octokit client (`src/tasks/github/octokit-client.ts`) and registry search (`fetch-packages.ts`, `npm-client/`): **ported** into `packages/developers-crawler/src/lib/{octokit,npm-registry}.ts` (the throttling/retry options, ~60 lines; the `maintainer:/author:/publisher:` search pagination, ~40 lines).
*Alternatives:* a `workspace:*` dependency on `@interweb-utils/stats-db`. *Why:* stats-db has **no entry point** (`main: index.js` does not exist in source; no `src/index.ts`), its `defaultOctokit` reads `process.env` at import time, and adding an entry would edit stats-db, which is forbidden. Porting ~100 lines is cheaper than build-coupling to a package that cannot be changed.

**D7. Data-source strategy: discover widely, verify authoritatively, no silent fallbacks.**
Verified on 2026-10-21 from a Devin VM: npmjs.com `x-spiferack: 1` JSON → Cloudflare 403 even with a browser UA; `registry.npmjs.org` packuments and `/-/v1/search` (which returns a `dependents` count per package) → 200; ecosyste.ms `dependent_packages` (`latest=true|false`, 5000 req/h anonymous, `link` pagination) → 200; deps.dev `v3alpha` dependents → 200 (counts only); GitHub `network/dependents` HTML → 200 (301 to the canonical owner first).
- **npm edges:** candidates = ecosyste.ms (`latest=false`, any version) ∪ already-known dependents in the DB ∪ (optional) npm-web. Each candidate's **packument** is fetched and the edge is recorded only if `dist-tags.latest`'s manifest declares the target (`dependencies`/`devDependencies`/`peerDependencies`/`optionalDependencies`, plus `npm:` aliases). The run's verifying source is `npm-registry`. Because known dependents are always re-verified, ecosyste.ms undercounting can delay *discovery* but never causes a *false removal*.
- **GitHub edges:** candidates = GitHub dependents HTML (REPOSITORY and PACKAGE types, per `package_id`) ∪ already-known repositories. Verification reads the default-branch tree via Octokit and the manifests (`package.json`, ≤ `max_manifests_per_repo`) and lockfiles (`package-lock.json`, `pnpm-lock.yaml`, `yarn.lock`, `bun.lock`, `npm-shrinkwrap.json`, ≤ `max_lockfiles_per_repo`); direct = manifest, `transitive` = lockfile only. Verifying source `github-api`.
- **npm-web** is a source row and a crawler source, disabled by default (`sources.npm-web.enabled: false`). When enabled on a machine that is not blocked, it adds candidates and a `target_count_snapshot`. When enabled and the response is not JSON 200, the run **fails** (`status='failed'`, `error` set) — never a silent skip.
- **Counts for cross-checking:** `target_count_snapshot` from ecosyste.ms (`dependent_packages_count`, `dependent_repos_count`), deps.dev (`directDependentCount`, `indirectDependentCount`), and the registry search `dependents` field. Sources disagree; all are kept.
- **History:** npm packument version walk (`package_dependency_history`) and git history of dependent repos (`edge_commit_event`).

**D8. Removal semantics are run-scoped and kind-scoped.**
`close_run(run, 'complete')` sets `removed_at` on an edge only if: same target, same hop, same `dependent_kind` as the run, no observation from this run, **and** `last_seen_at < run.started_at` (a concurrent run that saw it since keeps it alive). `partial`/`failed` runs never remove, and only `role='verification'` sources (`npm-registry`, `github-api`) can own edge-observing runs: discovery sources cannot call `start_run` at all, enrichment sources (`npm-downloads`, `depsdev`) own snapshot-only runs with `dependent_kind = NULL` that `close_run` never uses for removal. A complete `npm-registry` run therefore never removes repository edges and vice versa; a complete run for `pgsql-parser` never touches `libpg-query` edges. Validated in T3–T7, T9, T11.

**D9. Deterministic ids are SQL functions, not application code.**
`developers.package_id(ecosystem, name)`, `repository_id(host, full_name)`, `edge_id(kind, key, target, manifest_path, hop)` are `IMMUTABLE` uuid v5 (`uuid_ns_url()` namespace, `developers:` prefix) and the tables `CHECK (id = developers.package_id(ecosystem, name))`, so a row cannot exist with a wrong id regardless of which client wrote it. `developers_private.account` uses the same construction. `crawl_run`, `person`, `organization`, `employment_claim`, `annotation` are v4: they are events or judgments, not natural facts.

**D10. The intent file is the configuration contract; `pg-env` is the connection contract.**
`intent.yaml` (gitignored; `docs/developers/intent.example.yaml` is the template) holds what to track, thresholds, source toggles, cadence. Connections come from `getPgEnvOptions()` (`pg-env`): the crawler's own DB from `PG*` env (`eval "$(pgpm env)"`, `PGDATABASE=developers_dev`), and the lib-count source DB from the same host/port/user with `database: intent.lib_count.database` (default `stats_dev`). No `process.env` reads outside `src/config.ts`; no `dotenv`.

**D11. `code_version` is the crawler's git sha, required.**
`start_run` is called with `git rev-parse HEAD` of the lib-count checkout; `--code-version <text>` overrides; if neither is available the CLI exits 2. No "unknown" fallback.

**D12. HTTP fetching is injected; tests use recorded synthetic fixtures.**
Every source class takes a `fetch`-compatible function. Tests pass a fixture fetcher that serves JSON/HTML from `__fixtures__/` (synthetic names only: `example-org/example-repo`, `example-app`, `jdoe`). No `nock`, no live network in tests. The on-disk cache (D13) wraps the real `fetch` the same way.

**D13. Cache, retry, rate limits.**
Raw responses are cached at `packages/developers-crawler/data/cache/<source>/<sha1(url)>.json` (`{url, status, fetched_at, body}`), TTL per source from `intent.cache_ttl_hours` (default 24h; packuments 6h), `--no-cache` bypasses. Retry: 429/5xx/network → exponential backoff 2s·2ⁿ, max 5 attempts, honour `Retry-After`; 404 is a result (`unpublished`/`gone`), not an error; any other 4xx throws. Concurrency: registry 4 in flight + 100 ms spacing (the 1015 block appears after ~500 fast requests), ecosyste.ms 4, GitHub API via Octokit throttling plugin, dependents HTML sequential with 1.5 s between pages and 5 s doubling backoff. A fetch that still fails after retries marks the run `partial` with the error, and the CLI exits 1.

**D14. Python scripts are not ported line by line; their algorithms are.**
Section 5.4 maps each script to a task. The regex manifest matcher from `current_state.py`/`git_history.py` is replaced by real JSON/YAML/lockfile parsing (false positives from prose mentions were the main noise). Git history keeps the scaffold's approach (blobless clone, `--first-parent` manifest log, 48 samples + bisection, `git log -S` fast path) but reads blobs with `git show <sha>:<path>` (lazy fetch) instead of `raw.githubusercontent.com`.

**D15. Reports are SQL (views + two set-returning functions per side) and a CSV/Markdown export task.**
Exports go to `packages/developers-crawler/data/exports/` (gitignored). No README, badge or dump integration. `developers.public_counts` exists so a future publication decision has a PII-free, tested surface; publishing it is explicitly out of scope.

**D16. No CI additions.** lib-count has no active workflow (`.github/workflows/get-data.do-not-run-yml` is disabled). Phases ship with `pnpm test` runnable locally against `pgpm docker start`; adding CI is Dan's call, not this plan's.

**D17. pgpm-verify comes from `pgpm install @pgpm/verify` into the gitignored `extensions/`**, declared as a `dependencies` entry in both modules' `package.json` (as `@pgpm/stamps` does in pgpm-modules). `extensions/` is already in root `pgpm.json`; `.gitignore` gains `extensions/`. `@pgpm/verify` requires `pgpm-defaults`, which requires postgis/vector/pg_textsearch, so the development database must be the `constructiveio/postgres-plus:18` image lib-count already recommends. (The validation in Appendix B used a stock PG 18 with `pgpm-verify` copied and its `pgpm-defaults` requirement dropped; the `developers` SQL itself needs only `uuid-ossp` and `citext`.)

## 3. Proof the lib-count process is untouched

```
   stats_dev (existing, public dump)            developers_dev (new, private)
 ┌──────────────────────────────┐   read-only   ┌──────────────────────────────────┐
 │ npm_count  ◄── stats-db ──►  │ ───────────►  │ npm_count (copy)   github (copy) │
 │ github                       │  sync-lib-    │        ▲              ▲          │
 │ (pg_dump → lib-count-        │  count task   │  developers ──requires──┘        │
 │  downloads, public)          │               │        ▲                          │
 └──────────────────────────────┘               │  developers_private               │
                                                └──────────────────────────────────┘
 pgpm modules:   npm ◄── stats-db ◄── data-loaded          (existing; unchanged)
                 npm, github ◄── developers ◄── developers-private   (new; depends on old)
 TypeScript:     stats-db (unchanged)      developers-crawler (ports, does not import stats-db at runtime)
```

**Files never edited by any phase:** `packages/npm/**`, `packages/github/**`, `packages/stats-db/**` (incl. `src/dump.ts`, `src/tasks/**`, `src/config/categories.ts`), `packages/stats-db-loaded/**`, `update_stats.sh`, `badges/**`, `output/**`, `README.md` (root), root `package.json` `scripts`, `pgpm.json`, `pnpm-workspace.yaml`, `lerna.json`, `scripts/**`. Allowed root edits: `.gitignore` (add `extensions/`), `pnpm-lock.yaml` (new packages' dependencies), `pnpm-policy.yaml` only if a new dependency needs an allow entry (none expected: `yaml`, `pg`, `pg-env`, `@octokit/*`).

**Root `pnpm -r run build`:** only `developers-crawler` has a `build` script (`tsc`, same shape as stats-db); the two pgpm modules have no `build`, so `-r` skips them exactly as it skips `packages/npm` today. **Root `pnpm -r run lint`:** new packages get the same `"lint": "eslint . --fix"` as their siblings and the root `.eslintrc.json` applies. `pnpm policy:check` must stay green (new deps are ≥ 2 days old or first-party).

**Deploys:** `cd packages/stats-db && pgpm deploy --database stats_dev` resolves `stats-db` → `npm`, `github` only; the new modules are not in that closure. `pgpm deploy --package developers-private --database developers_dev --createdb` resolves `pgpm-verify`, `npm`, `github`, `developers`, `developers-private` — into a different database. `update_stats.sh` opens its own PR from `chore/npm-stats-*` branches and reads `DATABASE_URL`; it never sees `developers_dev`.

## 4. Schema

Complete, validated deploy SQL for every change is in `SCHEMA.sql` (51 changes: 36 in `developers`, 15 in `developers-private`), in `pgpm.plan` order with `-- requires:` lines and the revert/verify bodies. This section is the reading guide; when they disagree, `SCHEMA.sql` wins.

Conventions (all enforced by `PHASE0_CHECKS.sql` C1–C3): one change per object at `schemas/<schema>/{schema,types/<t>,tables/<t>/table,procedures/<f>,views/<v>,seeds/<s>}`; `COMMENT ON` every schema, table, view and column; an index on every FK (the PK covers FKs that are a PK prefix); verify via `assert_schema/assert_type/assert_table/assert_index/assert_function/assert_view`; no `CREATE OR REPLACE`; no `BEGIN/COMMIT`; snake_case.

### 4.1 Module `developers` (schema `developers`, public-safe)

| change | object | purpose |
|---|---|---|
| `schema` | `developers` | |
| `types/confidence` | enum `high, medium, low, unknown` | shared by the private module |
| `procedures/set_updated_at` | trigger fn | `updated_at` on `package`, `repository` |
| `procedures/package_id`, `repository_id`, `edge_id` | IMMUTABLE uuid v5 | D9 |
| `tables/source` | `id text PK, description, base_url, dependent_kind ∈ {package,repository,NULL}, role ∈ {discovery,verification,enrichment,history,manual}` | provenance catalogue |
| `tables/package` | `id, ecosystem='npm', name, description, homepage, repository_url, latest_version, created_on, last_publish_on, deprecated, unpublished, fetched_at, first_seen_at, updated_at`; `UNIQUE(ecosystem,name)`; `CHECK(id = package_id(...))` | any package, ours or not |
| `tables/tracked_target` | `package_id PK → package, reason ∈ {lib-count,intent}, added_at` | "ours" |
| `tables/category_family` | `category_name PK, family ∈ {cloud,chain,utils,personal}` | seed; D6 |
| `tables/crawl_run` | `id v4, task, source_id → source, dependent_kind (NULL for enrichment runs), hop ∈ {1,2}, params jsonb, code_version, started_at, finished_at, status ∈ {running,complete,partial,failed}, stats jsonb, error`; `CHECK((finished_at IS NULL) = (status='running'))` | idx `(source_id)`, `(task, started_at DESC)` |
| `tables/crawl_run_target` | `(run_id → crawl_run CASCADE, package_id → package) PK` | idx `(package_id)` |
| `tables/repository` | `id, host='github.com', full_name citext, owner_login citext, owner_kind, github_id UNIQUE, default_branch, is_fork, parent_full_name, archived, description, homepage, primary_language, pushed_at, gone, fetched_at, first_seen_at, updated_at`; `UNIQUE(host,full_name)`; `CHECK(id = repository_id(...))` | idx `(owner_login)` |
| `tables/repository_snapshot` | `(repository_id, observed_on) PK, stars, forks, run_id` | idx `(run_id)` |
| `tables/package_repository` | `(package_id, repository_id) PK, directory, source_id, is_upstream_of_fork` | idx `(repository_id)`, `(source_id)` |
| `tables/package_download_snapshot` | `(package_id, period ∈ {last-week,last-month}, window_end) PK, window_start, downloads, run_id` | third-party downloads only |
| `tables/dependency_edge` | `id, dependent_kind, dependent_package_id, dependent_repository_id, target_package_id, hop, manifest_path='package.json', dep_type ∈ {prod,dev,peer,optional,transitive,unknown}, version_range, first_seen_at, last_seen_at, removed_at, removed_by_run_id`; CHECKs: kind ⇔ which dependent column is set, `first_seen_at <= last_seen_at`, `removed_at` ⇔ `removed_by_run_id` | idx on the 4 FKs + partial `(target_package_id, hop) WHERE removed_at IS NULL` |
| `tables/edge_observation` | `(edge_id → edge CASCADE, run_id, source_id) PK, observed_at, dep_type, version_range, evidence` | append-only |
| `tables/discovery_hit` | `(run_id CASCADE, source_id, target_package_id, dependent_key) PK, dependent_kind, payload jsonb` | per-source undercount audit |
| `tables/target_count_snapshot` | `(package_id, source_id, observed_on) PK, direct_count, indirect_count, repo_count, run_id` | |
| `tables/package_dependency_history` | `(dependent_package_id, target_package_id) PK, first_version, first_version_at, last_version_with, last_version_with_at, removed_in_version, removed_in_at, in_latest, versions_scanned, run_id, updated_at` | npm added/removed dates |
| `procedures/ensure_package(_name, _ecosystem='npm') → uuid` | insert-if-missing | |
| `procedures/ensure_repository(_full_name, _host='github.com') → uuid` | insert-if-missing | |
| `procedures/start_run`, `observe_edge`, `close_run` | see 4.3 | |
| `seeds/source` | the 9 source rows (npm-registry, npm-downloads, ecosystems, npm-web, depsdev, github-dependents-html, github-api, git-history, manual) | |
| `seeds/category_family` | 25 rows: `chainCategories` (22, incl. `boilerplates`), `personalCategories` (`math`), `utilsCategories` (`utils`, `misc`) | |
| `views/our_package` | tracked targets joined to `npm_count.npm_package`, categories, `family` | requires `npm:npm` |
| `views/current_dependents` | edges with `removed_at IS NULL`, names resolved | |
| `procedures/new_dependents(_since timestamptz)`, `lost_dependents(_since)` | set-returning | views cannot take parameters |
| `views/adoption_by_week` | per target per ISO week: live hop-1 dependents vs `npm_count.daily_downloads` sum | Dan's "daily_downloads vs adoption over time" |
| `views/transitive_reach` | direct, hop-2 distinct, latest deps.dev indirect count | |
| `views/top_dependents` | hop-1 dependents with latest weekly downloads / stars | |
| `views/public_counts` | per target: dependent packages, dependent repositories | the only publishable surface; not published in this work |

### 4.2 Module `developers-private` (schema `developers_private`, PII)

| change | object | notes |
|---|---|---|
| `schema` | `developers_private` | requires `developers:schemas/developers/schema` |
| `tables/account` | `id (v5 of platform+lower(login), CHECKed), platform ∈ {github,npm}, login citext, kind, display_name, company_raw, blog, location, bio, platform_id, source_id, fetched_at`; `UNIQUE(platform,login)` | **no email column** (the scaffold's `email_public` is dropped) |
| `tables/person` | `id v4, display_name, notes, created_at` | |
| `tables/person_account` | `(person_id CASCADE, account_id CASCADE) PK, UNIQUE(account_id), method ∈ {same-login,npm-repo-owner,name-match,manual}, confidence, source_id, evidence` | one person per account |
| `tables/organization` | `id v4, name, domain citext UNIQUE, kind ∈ {company,oss-project,affiliated,individual,noise}, github_account_id → account, npm_scope, source_id, confidence, evidence` | |
| `tables/repository_owner` | `(repository_id → developers.repository CASCADE, organization_id CASCADE) PK, source_id, confidence, evidence` | |
| `tables/employment_claim` | `id v4, person_id CASCADE, organization_id, title, evidence NOT NULL, evidence_url, source_id NOT NULL, confidence NOT NULL, observed_at, valid_from, valid_to, superseded_by → self` | never a bare fact |
| `tables/package_maintainer` | `(package_id → developers.package CASCADE, account_id CASCADE, role ∈ {maintainer,publisher,author}) PK, source_id, first_seen_at, last_seen_at` | |
| `tables/edge_commit_event` | `(edge_id → developers.dependency_edge CASCADE, event ∈ {added,removed,last_touched,version_bump}, commit_sha) PK, committed_on, author_account_id → account, author_name, message, source_id` | no email |
| `tables/annotation` | `id v4, entity_type ∈ {package,repository,account,person,organization,edge}, entity_id, key, value, source_id, confidence, author, created_at` | replaces `annotations.py` |
| `views/developers_by_company` | organization → owned repositories → current hop-1 edges: `company, kind, domain, current_edges, repositories, our_packages_used, packages[]` | |
| `views/champions` | `added`/`last_touched` commit events on current edges with the author account | |
| `views/contributor_overlap` | `account(platform='github')` ⋈ `github.contributor` by login | requires `github:contributors` |
| `procedures/new_developers(_since)`, `lost_developers(_since)` | authors behind edges first seen / removed since | |

### 4.3 Function contracts

```sql
developers.start_run(_task text, _source_id text, _target_names text[],
                     _hop integer DEFAULT 1, _params jsonb DEFAULT '{}', _code_version text DEFAULT 'unknown') RETURNS uuid
```
Opens a `crawl_run` and inserts one `crawl_run_target` per name (via `ensure_package`). Only sources with `role = 'verification'` (`npm-registry`, `github-api`) or `role = 'enrichment'` (`npm-downloads`, `depsdev`) may own runs: verification runs get the source's `dependent_kind`; enrichment runs get `dependent_kind = NULL` and exist only so snapshots carry a `run_id`. Raises `start_run: unknown source`, `… has role discovery; only verification and enrichment sources own runs` (so `ecosystems`, `npm-web`, `github-dependents-html`, `git-history`, `manual` can never open a run and therefore never remove an edge; their findings are recorded as `discovery_hit`/`edge_commit_event` rows under the verification run or with their own `source_id`), `… a run needs at least one target`. (The crawler passes the real git sha — D11; the SQL default exists only so ad-hoc psql sessions work.)

```sql
developers.observe_edge(_run_id uuid, _target_name text, _dependent_key text,
                        _manifest_path text DEFAULT 'package.json', _dep_type text DEFAULT NULL,
                        _version_range text DEFAULT NULL, _evidence text DEFAULT NULL,
                        _observed_at timestamptz DEFAULT now()) RETURNS uuid  -- edge id
```
Preconditions (each raises): run exists; `run.status = 'running'`; `run.dependent_kind IS NOT NULL` (an enrichment run cannot observe edges); `package_id('npm', _target_name)` is in the run's targets. Effects: ensures the dependent row (`ensure_package` or `ensure_repository` by `run.dependent_kind`; `_dependent_key` is an npm name or `owner/name`); upserts `dependency_edge` with `id = edge_id(kind, key, target, manifest_path, run.hop)`: on conflict `first_seen_at = LEAST`, `last_seen_at = GREATEST`, `dep_type/version_range = COALESCE(new, old)`, `removed_at = NULL`, `removed_by_run_id = NULL`; inserts `edge_observation(edge, run, run.source_id)` `ON CONFLICT DO NOTHING`. Idempotent: calling it twice with the same arguments yields one edge and one observation (T1).

```sql
developers.close_run(_run_id uuid, _status text, _stats jsonb DEFAULT NULL, _error text DEFAULT NULL) RETURNS integer  -- edges removed
```
`_status ∈ {complete, partial, failed}` else raises; run must be `running` else raises (`FOR UPDATE` lock). Sets `status, finished_at = now(), stats, error`. If `complete` **and** `run.dependent_kind IS NOT NULL` (verification source): `UPDATE dependency_edge SET removed_at = now(), removed_by_run_id = _run_id WHERE removed_at IS NULL AND hop = run.hop AND dependent_kind = run.dependent_kind AND target_package_id IN (run targets) AND last_seen_at < run.started_at AND NOT EXISTS (observation for this edge in this run)`; returns the count. `partial`/`failed` runs and enrichment-source runs return 0 and change no edge.

Helper contracts: `ensure_package(_name, _ecosystem='npm')` / `ensure_repository(_full_name, _host='github.com')` insert a minimal row if absent and return the deterministic id; they never update existing rows (enrichment tasks do that with explicit `UPDATE`s).

### 4.4 Validated behaviour (what `PHASE0_CHECKS.sql` proves; Phase 0 turns each into a jest test)

| id | check |
|---|---|
| family | `our_package.family` is `cloud` for a `launchql`-categorised package and `chain` for `telescope` |
| T1 | same observation twice → 1 edge, 1 observation; a second dependent → 2/2 |
| T2 | `observe_edge` raises for a non-target; after `close_run` it raises "not running"; closing an empty-diff complete run removes 0 |
| T3 | `partial` run that saw only one of two edges removes nothing |
| T4 | `complete` run that saw only `example-app` removes exactly `example-lib`, stamps `removed_by_run_id`; `lost_dependents(now()-1min)` returns 1 |
| T5 | re-observing `example-lib` clears `removed_at` and keeps the original `first_seen_at` |
| T6 | a complete `github-api` (repository) run over two targets removes no package edges; `current_dependents` has 4 rows |
| T7 | run A starts, run B starts later, B observes both edges and completes, A observes one and completes → A removes 0 (concurrency guard) |
| T8 | a hop-2 run over `example-app` produces `transitive_reach.hop2_dependents = 1` for `example-parser` and does not touch hop-1 counts; `public_counts` and `adoption_by_week` (joined to synthetic `npm_count.daily_downloads`) return the expected rows |
| T9 | `start_run` raises for `ecosystems` and `manual` (not verification/enrichment) and for an empty target list |
| T11 | an enrichment run (`depsdev`) owns a `target_count_snapshot` row (visible in `transitive_reach.depsdev_indirect_count`), `observe_edge` on it raises, and `close_run(…,'complete')` removes 0 even though the target has edges; its `dependent_kind` is NULL |
| T10 | private side: deterministic `account.id`, `developers_by_company` → `Example Org, 2 edges, 1 repo`, `champions` and `new_developers` return `JDoe` |
| C1 | every column and every table/view in both schemas has a comment |
| C2 | every FK has an index whose leading columns are exactly the FK columns |
| C3 | no view or function in `developers` depends on anything in `developers_private`; no column named `%email%` in either schema |

## 5. Crawler (`packages/developers-crawler`)

### 5.1 Layout

```
packages/developers-crawler/
  package.json            name @interweb-utils/developers-crawler, private, bin "developers-crawl": "dist/cli.js"
                          scripts: build (tsc), lint, test (jest), crawl ("ts-node src/cli.ts")
                          deps: pg, pg-env, yaml, @octokit/rest, @octokit/plugin-throttling, @octokit/plugin-retry, @octokit/graphql
                          devDeps: pgsql-test, ts-node, typescript, jest, ts-jest, @types/pg
  tsconfig.json           extends ../../tsconfig.json (CommonJS, es2022; no .js import extensions)
  jest.config.js          copy of packages/stats-db/jest.config.js
  intent.example.yaml     symlink-free copy of docs/developers/intent.example.yaml (kept identical by a test)
  data/                   gitignored: cache/, exports/, clones/
  src/
    cli.ts                argv router: developers-crawl <task> [--intent path] [--targets a,b] [--source s] [--no-cache] [--code-version sha] [--limit n]
    config.ts             loads intent.yaml (yaml), resolves PG options via pg-env for both databases; the only process.env reader
    db.ts                 pg Pool factories: developers() and libCount(); helpers startRun/observeEdge/closeRun calling the SQL functions
    http.ts               fetchWithRetry(fetchImpl, policy), DiskCache(fetchImpl, dir, ttl), RateGate(concurrency, spacingMs)
    lib/octokit.ts        ported createOctokitClient (throttling + retry plugins), no module-level instance
    lib/npm-registry.ts   ported search pagination (maintainer:/author:/publisher:), packument fetch, manifest dependency extraction (incl. npm: aliases)
    lib/manifests.ts      package.json / package-lock / pnpm-lock / yarn.lock / bun.lock parsers → {name → {depType, range}}
    lib/git.ts            blobless clone, first-parent manifest log, sampled+bisected state, `git show sha:path`, `git log -S`
    sources/              one class per developers.source id, each taking fetch + cache: npmRegistry, npmDownloads, ecosystems, npmWeb, depsdev,
                          githubDependentsHtml, githubApi, gitHistory
    tasks/                one file per task (5.2); each exports run(ctx): Promise<RunResult>
  __tests__/              pgsql-test integration tests + unit tests with __fixtures__/ (synthetic)
```

### 5.2 Tasks

Invocation: `pnpm --filter @interweb-utils/developers-crawler crawl <task> [flags]` (or `developers-crawl <task>` after build). Every task that writes edges opens exactly one `crawl_run` per (task, source) and closes it with `complete` if every candidate was processed, `partial` with `error` if any fetch exhausted retries or a candidate could not be verified, `failed` if the task aborted before processing. `stats` always records `{candidates, verified, edges_observed, discovery_hits, fetched, cached, errors}`.

| task | phase | source (run) | reads | writes | notes |
|---|---|---|---|---|---|
| `sync-lib-count` | 1 | — (no run) | `stats_dev`, **explicit column lists only**: `npm_count.npm_package(package_name, creation_date, last_publish_date, last_fetched_date, is_active)`, `category(name, description)`, `package_category(package_id, category_id)` (category remapped by `name`), `daily_downloads(package_name, date, download_count)` for `date ≥ max(local) − 35d`; `github.organization(github_id, login, name, description, avatar_url, is_active)`, `repository(github_id, name, full_name, description, url, is_fork, fork_date, parent_repo, source_repo, fork_detection_method, fork_detection_confidence, owner_id→remapped, stars_count, forks_count, commits_count, primary_language, is_active)`, `author(github_id, login, name, avatar_url)` — **`primary_email` is never selected**, `contributor(github_id, login, name, avatar_url)`, `contributor_organization(contributor_id→remapped, organization_id→remapped, role)` | same tables in `developers_dev`, upsert by natural key (`package_name`, `(package_name,date)`, `name`, `github_id`, `login`) | never `author_email`/`contributor_email`; never `SELECT *`; never deletes |
| `seed-targets` | 1 | — | local `npm_count.npm_package WHERE is_active`, intent `ours.extra_packages`, `ours.exclude_packages` | `developers.package` (via `ensure_package`), `tracked_target(reason)` | removes `tracked_target` rows for excluded/inactive names |
| `enrich-registry` | 1 | — | packument per package in `tracked_target` ∪ dependents | `package.{description,homepage,repository_url,latest_version,created_on,last_publish_on,deprecated,unpublished,fetched_at}`, `package_repository` (parsed `repository.url` + `directory`), `developers_private.package_maintainer` + `account(platform='npm')` | refresh when `fetched_at` older than `cadence.enrichment_refresh_days` |
| `npm-dependents` | 1 | `npm-registry`, hop 1 | per target: ecosyste.ms `dependent_packages?latest=false` (all pages) → `discovery_hit`; optional `npm-web` pages → `discovery_hit`; ∪ known dependents | `observe_edge` per (dependent, target) whose **latest** manifest declares the target: `dep_type` ∈ prod/dev/peer/optional, `version_range`, `evidence = '<name>@<latest>'`; `target_count_snapshot` for ecosystems (+ npm-web, + registry search `dependents`) | candidates maintained by our own npm accounts (`ours.npm_maintainers`) are recorded as hits but not observed as edges |
| `npm-history` | 1 | — (updates, no run needed; records `run_id` of the latest `npm-dependents` run) | packument `versions` + `time` of every package that is or was a dependent | `package_dependency_history` | same walk as `npm_history.py` |
| `npm-downloads` | 1 | `npm-downloads` (enrichment run, `dependent_kind` NULL) | `api.npmjs.org/downloads/point/last-week/<name>` (bulk `a,b,c` for unscoped, one call per scoped) | `package_download_snapshot(run_id)` for dependents | ours stay in `npm_count`; the run only carries provenance, it cannot touch edges |
| `depsdev-counts` | 1 | `depsdev` (enrichment run) | `api.deps.dev/v3alpha/systems/npm/packages/<t>/versions/<latest>:dependents` | `target_count_snapshot(source='depsdev', run_id)` | |
| `hop` | 1 | `npm-registry`, hop 2 | top-N (`thresholds.npm.hop2_top_n`) hop-1 package dependents by `weekly_downloads` as targets | edges with `hop = 2` | same verification as `npm-dependents` |
| `github-dependents` | 2 | `github-api`, hop 1 | per repository hosting a target (`package_repository` of tracked targets ∪ `ours.github_orgs` repos via Octokit): dependents HTML, REPOSITORY and PACKAGE types, each `package_id` → `discovery_hit`; ∪ known repository dependents | for every candidate with `stars ≥ thresholds.github.min_stars_verify` (default 0 = all): `current-state` verification (below) then `observe_edge` per (repo, target, manifest_path); `repository.*`, `repository_snapshot` | 301 → follow once to canonical owner |
| `current-state` | 2 | part of `github-dependents`; also runnable alone for `--targets` | Octokit: `GET repos/{o}/{r}` (fork, parent, archived, default_branch, stars), `git/trees/{branch}?recursive=1`, then `contents` of ≤ `max_manifests_per_repo` `package.json` (sorted by depth; skipping `node_modules`, `fixture`) and ≤ `max_lockfiles_per_repo` lockfiles | direct edges per manifest (`dep_type` from section), `transitive` edges per lockfile path, `repository.gone` on 404 | a candidate with no manifests/lockfiles is classified `no-js-manifest` in `discovery_hit.payload` and not observed |
| `who-added` | 2 | — (`edge_commit_event.source_id` = `git-history` or `github-api`) | repositories with current/removed edges and `stars ≥ min_stars_history`: `git log -S'"<target>"' --first-parent` fast path; else sampled (`history_samples`) + bisected manifest history; GraphQL `blame` on the dependency line | `edge_commit_event(added|removed|last_touched)`, `author_account_id` when the commit has a GitHub login (`author.user.login` via API), `author_name` from git | **no emails read into the DB** |
| `people` | 2 | — | GitHub profiles of accounts seen in `edge_commit_event`/repository owners (`GET users/{login}`), npm maintainers | `developers_private.account(github)`, `person` + `person_account` (`same-login` high when npm login == github login **and** the npm package's repo is owned by that login; `name-match` low otherwise), `organization` + `repository_owner` (org-owned repo → high), `employment_claim(confidence='medium', source='github-api', evidence = company_raw)` | never invents an employer; empty `company` → no claim |
| `export` | 3 | — | report views/functions | `data/exports/*.csv|md` | no git operations |
| `run-all` | 3 | — | runs the above in order with the intent cadence | | `packages/developers-crawler/run.sh` wraps it with retries like `update_stats.sh` but **no** commit/push/PR |

### 5.3 Intent file

`docs/developers/intent.example.yaml` is normative; the crawler validates the file against a typed schema at startup and exits 2 on unknown keys. Key blocks: `ours` (orgs, npm maintainers, scopes, extra/exclude packages, affiliated owners that are flagged not counted), `thresholds` (npm/github), `sources` (per-source `enabled`, `cache_ttl_hours`, `concurrency`), `cadence`, `lib_count.database`, `privacy` (constants the tests assert against the schema).

### 5.4 Reference script → task mapping

| scaffold script | becomes |
|---|---|
| `npm/01_list_packages.py` | `seed-targets` (+ `lib/npm-registry.ts` search, used only for `ours.extra_from_search: true`) |
| `npm/02_downloads.py` | `npm-downloads` |
| `npm/03_dependents.py` | `npm-dependents` (ecosystems + optional npm-web discovery, packument verification) |
| `npm/04_enrich.py` | `enrich-registry` + the GitHub part of `people` |
| `npm/05_hop2_and_depsdev.py` | `hop`, `depsdev-counts` |
| `npm/06_flags.py` | `package_repository.is_upstream_of_fork`, `repository.is_fork`, surfaced in `top_dependents` |
| `npm/npm_history.py` | `npm-history` |
| `github/list_packages.py` | `github-dependents` target repo discovery (`package_repository` + org listing) |
| `github/scrape_dependents.py` | `sources/githubDependentsHtml.ts` (same row/next-page selectors, `dependents_after`) |
| `github/enrich.py`, `current_state.py`, `who_pulls.py` | `current-state` with real manifest/lockfile parsing (`lib/manifests.ts`) |
| `github/git_history.py`, `who_added.sh`, `who_added_blame.py` | `who-added` (`lib/git.ts`) |
| `github/champions.py`, `build_past_users.py`, `build_outputs.py` | `people`, `lost_dependents`/`lost_developers`, `export` |
| `github/annotations.py` | `developers_private.annotation` rows |

## 6. Phases

One PR per phase into `constructive-io/lib-count:main` from `feat/developers-<phase>`; each PR body states what was run locally (deploy/verify/revert output, `pnpm test` summary). Local environment for every phase:

```bash
pgpm docker start --image docker.io/constructiveio/postgres-plus:18
eval "$(pgpm env)"
pgpm admin-users bootstrap --yes && pgpm admin-users add --test --yes
pgpm install                      # @pgpm/verify → extensions/ (gitignored)
pgpm deploy --package developers-private --database developers_dev --createdb --yes
```

### Phase 0 — schema (`feat/developers-schema`)

**Build**
1. `packages/developers/`: `developers.control` (requires as in D3), `pgpm.plan` (Appendix A), `deploy|revert|verify/schemas/developers/**` — 36 changes split from `SCHEMA.sql` verbatim; `package.json` (`@interweb-utils/developers`, `dependencies: {"@pgpm/verify": "^0.47"}`, scripts `lint`, `test`), `jest.config.js`, `README.md` (what the schema is, how to deploy, the privacy rule), `__tests__/`.
2. `packages/developers-private/`: same shape, 15 changes, control requires `plpgsql,uuid-ossp,citext,pgpm-verify,developers`.
3. `.gitignore`: add `extensions/`.
4. Tests (pgsql-test, `getConnections({}, [seed.pgpm(<module dir>)])`, `beforeEach/afterEach` hooks, never `new pg.Pool()`): `packages/developers/__tests__/{ids,observe_edge,close_run,views,catalog}.test.ts` and `packages/developers-private/__tests__/{people,isolation}.test.ts` implementing T1–T10, C1–C3 from 4.4 with the same synthetic fixtures as `PHASE0_CHECKS.sql`.

**Accept when**
- `pgpm deploy --package developers-private --database developers_test --createdb --yes`, `pgpm verify …`, `pgpm revert --package developers-private …` then `pgpm revert --package developers …` all succeed, and after the reverts only `npm_count`/`github` remain (`SELECT nspname FROM pg_namespace WHERE nspname LIKE 'developers%'` is empty).
- `pnpm --filter @interweb-utils/developers test` and `… developers-private test` pass; every row of 4.4 is a named test.
- `psql developers_test -f docs/developers/PHASE0_CHECKS.sql` prints `ALL SEMANTIC CHECKS PASSED`.
- Root `pnpm -r run build` and `pnpm -r run lint` behave as before (new modules have no build; lint runs).
- Diff touches only the files listed in Build.

### Phase 1 — npm (`feat/developers-npm`)

**Build** `packages/developers-crawler` per 5.1 with tasks `sync-lib-count`, `seed-targets`, `enrich-registry`, `npm-dependents`, `npm-history`, `npm-downloads`, `depsdev-counts`, `hop`; sources `npmRegistry`, `ecosystems`, `npmWeb` (disabled by default), `depsdev`, `npmDownloads`; `http.ts`, `db.ts`, `config.ts`, `cli.ts`; `docs/developers/intent.example.yaml` copied to the package and the package README "How to run".

**Tests (no live network)**
- unit: manifest dependency extraction (`dependencies`/`dev`/`peer`/`optional`/`npm:` alias), packument version walk → history row (added, removed, still-in-latest), lockfile parsers (one synthetic fixture per format), retry policy (429 → backoff → success; 5 failures → throws), disk cache hit/miss/TTL, intent validation (unknown key → error).
- integration (pgsql-test, module seeded): `npm-dependents` against a fixture fetcher for 3 synthetic targets: first run → N edges, N observations, run `complete`; second identical run → **0 new edges**, N new observations; a fixture where one candidate's packument 503s forever → run `partial`, 0 removals; a fixture where a dependent's latest dropped the target → `complete`, that edge `removed_at` set and `package_dependency_history.in_latest = false`.
- `sync-lib-count` against a second pgsql-test database seeded with `packages/npm` + `packages/github` and synthetic rows (including an `author.primary_email` and `author_email` rows) → rows copied, `owner_id` remapped, local `github.author.primary_email` is NULL for every row, `author_email`/`contributor_email` are empty, and a scan of **every text/citext column in every schema** of the target database for `[A-Za-z0-9._%+-]+@[A-Za-z0-9.-]+\.[a-z]{2,}` returns 0 rows (npm scopes like `@pgsql/types` do not match because there is nothing before the `@`); running twice is a no-op.
- categories drift test: imports `../../stats-db/src/config/categories` and asserts `developers.category_family` seed ⇔ `brandRollupFor`.
- static test: `grep -R "INSERT INTO npm_count" src/` matches only `src/tasks/sync-lib-count.ts`.

**Accept when** all of the above pass; `pnpm --filter @interweb-utils/developers-crawler crawl npm-dependents --targets pgsql-parser,libpg-query,@pgsql/types` completes against the live network from a dev machine and a second run reports `edges_new: 0` in `stats`; `crawl_run.stats` has per-source counts; `pnpm -r build` builds the crawler; `pnpm policy:check` green.

### Phase 2 — GitHub (`feat/developers-github`)

**Build** sources `githubDependentsHtml`, `githubApi`, `gitHistory`; tasks `github-dependents`, `current-state`, `who-added`, `people`; `lib/octokit.ts`, `lib/git.ts`, `lib/manifests.ts` extensions for lockfile transitive paths (which package pulls the target, recorded in `evidence`).

**Tests** fixtures: a dependents HTML page (synthetic repos), a repo tree + manifests + a `pnpm-lock.yaml`; a stale candidate whose manifests no longer reference us; a fork. Assertions: `min_stars_verify` comes from the intent file; the stale candidate yields no `observe_edge` and, if it had an edge, a `complete` run removes it; `who-added` on a tiny local git fixture repo (created in the test, synthetic author `jdoe`, no emails stored) yields `added` and `removed` `edge_commit_event`s with the right shas/dates; `people` turns `company: '@example-org'` into one `employment_claim(confidence='medium', source_id='github-api', evidence='@example-org')` and skips an empty company; `repository.is_fork`/`parent_full_name` set from the API fixture; the `github-dependents-html` 403/429 path backs off and, after exhausting retries, closes the run `partial`.

**Accept when** tests pass; a live run for one of our repositories (e.g. the repo hosting `pgsql-parser`) ends `complete` or `partial` with `error` populated, never silently; `discovery_hit` rows exist for every HTML row and `dependency_edge` only for verified ones.

### Phase 3 — reports (`feat/developers-reports`)

The views and functions are already in Phase 0's modules (they were validated together). Phase 3 adds: `export` and `run-all` tasks, `packages/developers-crawler/run.sh`, the Markdown export templates (`new_dependents`, `lost_dependents`, `developers_by_company`, `champions`, `adoption_by_week`), and a README section on reading the reports.

**Tests** `export` writes one file per view with the fixture rows; the export of anything from `developers_private` lands only under `data/exports/private/`; a test asserts that `public_counts` and every other `developers.*` view has no dependency on `developers_private` (C3, re-run at the crawler level via `pg_depend`).

**Accept when** `run.sh` runs the full pipeline locally end-to-end against the live network for 3 targets and writes exports; no git operation occurs; `pnpm -r build|lint|test` green.

### Phase 4 — optional, not planned in detail
Extract `src/sources/*` + `lib/manifests.ts` into a standalone public CLI emitting JSONL with no DB and no PII. Only if Dan asks.

## 7. Privacy checklist and pre-commit grep

Checklist (every phase PR body ticks it):
- [ ] No row of real data committed: no CSV/JSON/JSONL/SQL fixtures with real names, logins, companies, repos; fixtures use `example-org/example-repo`, `example-app`, `jdoe`.
- [ ] No e-mail address stored or logged: no `email` column in either new schema (C3); `sync-lib-count` uses explicit column lists, never selects `github.author.primary_email` and never touches `author_email`/`contributor_email`; the Phase 1 sync test scans every text column of the whole `developers_dev` database for email-shaped values and expects none; `who-added` reads `%an`, never `%ae`.
- [ ] `developers_private` is never read by anything in `developers` (C3) and never exported outside `data/exports/private/`.
- [ ] Every inferred row (`person_account`, `organization`, `repository_owner`, `employment_claim`, `annotation`) has `source_id`, `confidence`, and `evidence`/`evidence_url` (NOT NULL where the schema says so).
- [ ] `data/` is gitignored; `exports`, `*.log`, `cache` already are at the root.
- [ ] Nothing in this feature writes to `stats_dev`, `README.md`, `badges/`, `output/`, or the dump.

Pre-commit grep (run from the repo root before every commit in Phases 0–3; must print nothing):

```bash
git diff --cached --name-only -z | xargs -0 grep -nE '[A-Za-z0-9._%+-]+@[A-Za-z0-9.-]+\.[a-z]{2,}' -- 2>/dev/null \
  | grep -vE 'developers@constructive\.io|pyramation@gmail\.com|agent@constructive\.io|launchql@|skitch@|devin@cognition\.ai|@[a-z0-9-]+/[a-z0-9-]+'   # package scopes are fine
git diff --cached -- 'packages/developers*' 'docs/developers' | grep -nE '^\+.*github\.com/' | grep -vE 'constructive-io/|pyramation-studio/|example-org/|api\.github\.com|github\.com/<'
git diff --cached -- 'packages/developers*' 'docs/developers' | grep -niE '^\+.*(customer|customer.graph|\busers?\b)' | grep -viE 'users/\{login\}|GET users'
```

## 8. Risks / open items

1. **ecosyste.ms coverage.** Known to undercount; the design makes that a discovery delay, not a correctness bug, but the first run's edge list will be smaller than npm's own `dependents` count. `target_count_snapshot` makes the gap visible per target. If Dan wants npm-web from a non-blocked machine, flip `sources.npm-web.enabled` there; nothing else changes.
2. **GitHub dependents HTML is unauthenticated and can be throttled or redesigned.** The parser is fixture-tested; a markup change surfaces as `partial` runs with `error`, never as silent emptiness.
3. **`@pgpm/verify` pulls `pgpm-defaults`** (postgis, vector, pg_textsearch) → the dev database must be the postgres-plus image. Acceptable since lib-count already recommends it; noted in both module READMEs.
4. **Hop-2 scope.** Bounded to the top-N hop-1 *packages* by weekly downloads (repositories have no hop 2). N defaults to 20.
5. **People resolution is deliberately conservative**: only `same-login` with repo-owner corroboration gets `high`; everything else is `low`/`medium` and reviewable via `annotation`. Manual research is a later, human activity.
6. **Retention** of profile data is not automated; a `--purge-accounts-older-than` flag is a Phase 4 candidate if Dan wants it.

## Appendix A — `pgpm.plan` entries (dependencies in brackets; timestamps/author are placeholders the implementer regenerates with `pgpm add`)

```
# packages/developers/pgpm.plan
schemas/developers/schema
schemas/developers/types/confidence [schemas/developers/schema]
schemas/developers/procedures/set_updated_at [schemas/developers/schema]
schemas/developers/procedures/package_id [schemas/developers/schema]
schemas/developers/procedures/repository_id [schemas/developers/schema]
schemas/developers/procedures/edge_id [schemas/developers/schema]
schemas/developers/tables/source/table [schemas/developers/schema]
schemas/developers/tables/package/table [schemas/developers/schema schemas/developers/procedures/package_id schemas/developers/procedures/set_updated_at]
schemas/developers/tables/tracked_target/table [schemas/developers/tables/package/table]
schemas/developers/tables/category_family/table [schemas/developers/schema]
schemas/developers/tables/crawl_run/table [schemas/developers/tables/source/table]
schemas/developers/tables/crawl_run_target/table [schemas/developers/tables/crawl_run/table schemas/developers/tables/package/table]
schemas/developers/tables/repository/table [schemas/developers/schema schemas/developers/procedures/repository_id schemas/developers/procedures/set_updated_at]
schemas/developers/tables/repository_snapshot/table [schemas/developers/tables/repository/table schemas/developers/tables/crawl_run/table]
schemas/developers/tables/package_repository/table [schemas/developers/tables/package/table schemas/developers/tables/repository/table schemas/developers/tables/source/table]
schemas/developers/tables/package_download_snapshot/table [schemas/developers/tables/package/table schemas/developers/tables/crawl_run/table]
schemas/developers/tables/dependency_edge/table [schemas/developers/tables/package/table schemas/developers/tables/repository/table schemas/developers/tables/crawl_run/table schemas/developers/procedures/edge_id]
schemas/developers/tables/edge_observation/table [schemas/developers/tables/dependency_edge/table schemas/developers/tables/crawl_run/table schemas/developers/tables/source/table]
schemas/developers/tables/discovery_hit/table [schemas/developers/tables/crawl_run/table schemas/developers/tables/source/table schemas/developers/tables/package/table]
schemas/developers/tables/target_count_snapshot/table [schemas/developers/tables/package/table schemas/developers/tables/source/table schemas/developers/tables/crawl_run/table]
schemas/developers/tables/package_dependency_history/table [schemas/developers/tables/package/table schemas/developers/tables/crawl_run/table]
schemas/developers/procedures/ensure_package [schemas/developers/tables/package/table]
schemas/developers/procedures/ensure_repository [schemas/developers/tables/repository/table]
schemas/developers/procedures/start_run [schemas/developers/tables/crawl_run/table schemas/developers/tables/crawl_run_target/table schemas/developers/procedures/ensure_package schemas/developers/tables/source/table]
schemas/developers/procedures/observe_edge [schemas/developers/tables/dependency_edge/table schemas/developers/tables/edge_observation/table schemas/developers/procedures/start_run schemas/developers/procedures/ensure_repository schemas/developers/procedures/edge_id]
schemas/developers/procedures/close_run [schemas/developers/tables/dependency_edge/table schemas/developers/tables/edge_observation/table schemas/developers/tables/crawl_run_target/table schemas/developers/procedures/start_run]
schemas/developers/seeds/source [schemas/developers/tables/source/table]
schemas/developers/seeds/category_family [schemas/developers/tables/category_family/table]
schemas/developers/views/our_package [schemas/developers/tables/tracked_target/table schemas/developers/tables/package/table schemas/developers/tables/category_family/table npm:npm]
schemas/developers/views/current_dependents [schemas/developers/tables/dependency_edge/table schemas/developers/tables/package/table schemas/developers/tables/repository/table]
schemas/developers/procedures/new_dependents [schemas/developers/views/current_dependents]
schemas/developers/procedures/lost_dependents [schemas/developers/tables/dependency_edge/table schemas/developers/tables/package/table schemas/developers/tables/repository/table]
schemas/developers/views/adoption_by_week [schemas/developers/views/our_package schemas/developers/tables/dependency_edge/table npm:npm]
schemas/developers/views/transitive_reach [schemas/developers/views/our_package schemas/developers/tables/dependency_edge/table schemas/developers/tables/target_count_snapshot/table]
schemas/developers/views/top_dependents [schemas/developers/views/current_dependents schemas/developers/tables/package_download_snapshot/table schemas/developers/tables/repository_snapshot/table]
schemas/developers/views/public_counts [schemas/developers/views/our_package schemas/developers/tables/dependency_edge/table]

# packages/developers-private/pgpm.plan
schemas/developers_private/schema [developers:schemas/developers/schema]
schemas/developers_private/tables/account/table [schemas/developers_private/schema developers:schemas/developers/tables/source/table]
schemas/developers_private/tables/person/table [schemas/developers_private/schema]
schemas/developers_private/tables/person_account/table [schemas/developers_private/tables/person/table schemas/developers_private/tables/account/table developers:schemas/developers/tables/source/table developers:schemas/developers/types/confidence]
schemas/developers_private/tables/organization/table [schemas/developers_private/tables/account/table developers:schemas/developers/tables/source/table developers:schemas/developers/types/confidence]
schemas/developers_private/tables/repository_owner/table [schemas/developers_private/tables/organization/table developers:schemas/developers/tables/repository/table developers:schemas/developers/tables/source/table developers:schemas/developers/types/confidence]
schemas/developers_private/tables/employment_claim/table [schemas/developers_private/tables/person/table schemas/developers_private/tables/organization/table developers:schemas/developers/tables/source/table developers:schemas/developers/types/confidence]
schemas/developers_private/tables/package_maintainer/table [schemas/developers_private/tables/account/table developers:schemas/developers/tables/package/table developers:schemas/developers/tables/source/table]
schemas/developers_private/tables/edge_commit_event/table [schemas/developers_private/tables/account/table developers:schemas/developers/tables/dependency_edge/table developers:schemas/developers/tables/source/table]
schemas/developers_private/tables/annotation/table [schemas/developers_private/schema developers:schemas/developers/tables/source/table developers:schemas/developers/types/confidence]
schemas/developers_private/views/developers_by_company [schemas/developers_private/tables/organization/table schemas/developers_private/tables/repository_owner/table developers:schemas/developers/views/current_dependents]
schemas/developers_private/views/champions [schemas/developers_private/tables/edge_commit_event/table schemas/developers_private/tables/account/table developers:schemas/developers/views/current_dependents]
schemas/developers_private/views/contributor_overlap [schemas/developers_private/tables/account/table github:contributors]
schemas/developers_private/procedures/new_developers [schemas/developers_private/views/champions]
schemas/developers_private/procedures/lost_developers [schemas/developers_private/tables/edge_commit_event/table schemas/developers_private/tables/account/table developers:schemas/developers/procedures/lost_dependents]
```

## Appendix B — validation log (2026-10-21)

Environment: PostgreSQL 18.6 (pgdg, Ubuntu 22.04), pgpm 5.38.5, a throwaway pgpm workspace containing copies of `packages/npm`, `packages/github`, `pgpm-modules/packages/verify` (with its `pgpm-defaults` requirement dropped, see D17) and the two generated modules. The Docker image `constructiveio/postgres-plus:18` could not be pulled from the VM (Docker Hub 429), so the stock server was used; the developers SQL needs only `uuid-ossp` and `citext`.

```
pgpm deploy --database developers_test --yes --package developers-private   → ✅ 51 changes + npm, github, pgpm-verify
pgpm verify --database developers_test --yes --package developers-private   → ✅ Verification complete
psql developers_test -f PHASE0_CHECKS.sql                                   → ALL SEMANTIC CHECKS PASSED (T1–T10, C1–C3)
pgpm revert --database developers_test --yes --package developers-private   → ✅
pgpm revert --database developers_test --yes --package developers           → ✅ ; remaining schemas: npm_count, github
pgpm deploy (again, after a signature fix) + PHASE0_CHECKS.sql              → ✅ (second full cycle)
revert → deploy → verify → PHASE0_CHECKS.sql (T1–T11, C1–C3) → revert     → ✅ (third cycle, after the review fixes: role-gated start_run, enrichment runs, boilerplates seed)
```

Nothing from that workspace is committed; `SCHEMA.sql` is its deploy output and Phase 0 recreates the per-object files from it.
