-- Deploy schemas/developers/seeds/source to pg

-- requires: schemas/developers/tables/source/table

INSERT INTO developers.source (id, description, base_url, dependent_kind, role) VALUES
  ('npm-registry', 'registry.npmjs.org packuments and search: package metadata, maintainers, version history, dependents count; authoritative for what a published version declares', 'https://registry.npmjs.org', 'package', 'verification'),
  ('npm-downloads', 'api.npmjs.org point downloads (bulk only for unscoped names)', 'https://api.npmjs.org/downloads/point', NULL, 'enrichment'),
  ('ecosystems', 'packages.ecosyste.ms dependent_packages (latest and any-version); undercounts, discovery only', 'https://packages.ecosyste.ms/api/v1', 'package', 'discovery'),
  ('npm-web', 'www.npmjs.com x-spiferack JSON dependents pages; blocked by Cloudflare from CI/VMs, optional and explicit', 'https://www.npmjs.com', 'package', 'discovery'),
  ('depsdev', 'api.deps.dev dependent counts (no names)', 'https://api.deps.dev/v3alpha', NULL, 'enrichment'),
  ('github-dependents-html', 'github.com network/dependents HTML; inflated, stale, transitive: discovery only', 'https://github.com', 'repository', 'discovery'),
  ('github-api', 'GitHub REST/GraphQL via Octokit: repo metadata, default-branch manifests and lockfiles, profiles, blame; authoritative for repository edges', 'https://api.github.com', 'repository', 'verification'),
  ('git-history', 'blobless clone + sampled/bisected manifest history and git log -S', NULL, NULL, 'history'),
  ('manual', 'human research; must cite evidence text or URL', NULL, NULL, 'manual');
