# @interweb-utils/developers-private

pgpm module for the private half of the developers graph: accounts, people, organizations,
repository ownership, employment claims, commit events and annotations, plus the
`developers_by_company`, `champions` and `contributor_overlap` reports. It requires
`developers`; `developers` never requires it. See `docs/developers/PLAN.md`.

Every inferred row carries `source_id`, `confidence` and `evidence`. No email is stored.
Nothing from this schema is published or committed; exports go to `data/exports/private/` only.

## Deploy

```sh
pgpm docker start --image docker.io/constructiveio/postgres-plus:18
eval "$(pgpm env)"
pgpm admin-users bootstrap --yes
pgpm admin-users add --test --yes
pgpm install
pgpm deploy --package developers-private --database developers_dev --createdb --yes
```

## Test

```sh
pnpm --filter @interweb-utils/developers-private test
```
