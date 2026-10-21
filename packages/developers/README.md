# @interweb-utils/developers

pgpm module for the public-safe half of the developers graph: which npm packages and GitHub
repositories depend on our packages (`npm_count.npm_package`), with current and past edges,
crawl runs, discovery hits and aggregate counts. See `docs/developers/PLAN.md`.

It lives in its own database, `developers_dev`. `stats_dev` is read-only input, and nothing in
`npm_count` or `github` depends on this module.

## Deploy

```sh
pgpm docker start --image docker.io/constructiveio/postgres-plus:18
eval "$(pgpm env)"
pgpm admin-users bootstrap --yes
pgpm admin-users add --test --yes
pgpm install
pgpm deploy --package developers --database developers_dev --createdb --yes
```

## Privacy rule

Schema `developers` holds no people data and never references `developers_private`. No table
in either schema has an email column. Only `developers.public_counts` is publishable.

## Test

```sh
pnpm --filter @interweb-utils/developers test
```
