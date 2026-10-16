#!/usr/bin/env bash
# update_stats.sh — refresh the npm download stats and open a PR with the result.
#
#   ./update_stats.sh            # full refresh, then commit, push and open a PR
#   ./update_stats.sh --no-pr    # full refresh, leave the changes uncommitted
#
# Steps (see packages/stats-db/README.md for each command):
#   1. branch from the latest upstream main
#   2. check stored dates line up with npm's (npm:fix:date-offset; a no-op
#      unless an old dump with dates stored one day early was loaded)
#   3. discover new packages          npm:fetch:packages
#   4. fetch downloads                npm:fetch:downloads (also re-fetches the last
#                                     30 days, so days npm had not published yet
#                                     get their real counts)
#   5. verify: no missing days; report npm outage days (all-zero days)
#   6. generate report, badges and README
#   7. commit, push to the fork, open a PR against upstream
#
# npm rate-limits aggressively (429); each network step is retried with a pause.
#
# Environment (defaults in brackets):
#   DATABASE_URL     [postgresql://postgres:password@localhost:5432/stats_dev]
#   UPSTREAM_REMOTE  git remote for constructive-io/lib-count  [upstream]
#   FORK_REMOTE      git remote the branch is pushed to        [origin]
#   UPSTREAM_REPO    GitHub repo the PR is opened against      [constructive-io/lib-count]
set -euo pipefail

ROOT="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
DB_DIR="$ROOT/packages/stats-db"
export DATABASE_URL="${DATABASE_URL:-postgresql://postgres:password@localhost:5432/stats_dev}"
UPSTREAM_REMOTE="${UPSTREAM_REMOTE:-upstream}"
FORK_REMOTE="${FORK_REMOTE:-origin}"
UPSTREAM_REPO="${UPSTREAM_REPO:-constructive-io/lib-count}"
MAX_ATTEMPTS=10
RETRY_PAUSE=120

OPEN_PR=1
for arg in "$@"; do
  case "$arg" in
    --no-pr) OPEN_PR=0 ;;
    -h|--help) sed -n '2,25p' "$0"; exit 0 ;;
    *) echo "unknown option: $arg" >&2; exit 1 ;;
  esac
done

step() { printf '\n==> %s\n' "$*"; }
sql() { psql "$DATABASE_URL" -v ON_ERROR_STOP=1 -Atc "$1"; }

# Run a pnpm script in packages/stats-db, retrying on failure (usually a 429).
with_retry() {
  local attempt=1
  until (cd "$DB_DIR" && pnpm "$@"); do
    if [ "$attempt" -ge "$MAX_ATTEMPTS" ]; then
      echo "pnpm $* failed $attempt times, giving up" >&2
      return 1
    fi
    echo "pnpm $* failed (attempt $attempt/$MAX_ATTEMPTS, likely npm rate limiting); retrying in ${RETRY_PAUSE}s..."
    attempt=$((attempt + 1))
    sleep "$RETRY_PAUSE"
  done
}

# ---------------------------------------------------------------------------
step "Preflight"
cd "$ROOT"
sql "SELECT 1" >/dev/null || { echo "cannot reach the database at DATABASE_URL" >&2; exit 1; }
if [ "$OPEN_PR" -eq 1 ]; then
  if ! git diff --quiet || ! git diff --cached --quiet; then
    echo "working tree has uncommitted changes; commit or stash them first" >&2
    exit 1
  fi
  gh auth status >/dev/null 2>&1 || { echo "gh is not authenticated (run: gh auth login)" >&2; exit 1; }
fi

if [ "$OPEN_PR" -eq 1 ]; then
  step "Branching from $UPSTREAM_REMOTE/main"
  git fetch -q "$UPSTREAM_REMOTE"
  BRANCH="chore/npm-stats-$(date +%Y-%m-%d)"
  git checkout -b "$BRANCH" "$UPSTREAM_REMOTE/main"
fi

step "Checking stored dates against npm"
# Not retried: it refuses (non-zero) when dates match neither layout, which a retry will not fix.
(cd "$DB_DIR" && pnpm npm:fix:date-offset)

step "Discovering new packages"
with_retry npm:fetch:packages

step "Fetching downloads"
with_retry npm:fetch:downloads

# ---------------------------------------------------------------------------
step "Verifying the data"
LATEST=$(sql "SELECT MAX(date) FROM (SELECT date FROM npm_count.daily_downloads GROUP BY date HAVING SUM(download_count) > 0) d")
GAPS_SQL="
  SELECT COUNT(*)
  FROM npm_count.npm_package p
  CROSS JOIN LATERAL generate_series(GREATEST(p.creation_date, '2024-01-01'::date), '$LATEST'::date, interval '1 day') AS day
  WHERE p.is_active
    AND NOT EXISTS (
      SELECT 1 FROM npm_count.daily_downloads d
      WHERE d.package_name = p.package_name AND d.date = day::date
    )"
GAPS=$(sql "$GAPS_SQL")
if [ "$GAPS" -gt 0 ]; then
  echo "$GAPS missing (package, day) rows; running a backfill..."
  with_retry npm:fetch:downloads -- --backfill
  GAPS=$(sql "$GAPS_SQL")
  if [ "$GAPS" -gt 0 ]; then
    echo "still $GAPS missing (package, day) rows after backfill; stopping" >&2
    exit 1
  fi
fi
echo "No missing days. Latest published day: $LATEST"

OUTAGES=$(sql "
  SELECT string_agg(to_char(day, 'YYYY-MM-DD'), ', ' ORDER BY day)
  FROM generate_series('$LATEST'::date - 29, '$LATEST'::date, interval '1 day') AS day
  WHERE NOT EXISTS (
    SELECT 1 FROM npm_count.daily_downloads d WHERE d.date = day::date AND d.download_count > 0
  )")
if [ -n "$OUTAGES" ]; then
  echo "npm reported zero downloads for every package on: $OUTAGES"
  echo "(npm-side outages; the README excludes them from the monthly/weekly windows)"
fi

MISC=$(cd "$DB_DIR" && pnpm -s npm:categories:list-misc 2>/dev/null | sed -n 's/^Found \([0-9]*\) uncategorized.*/\1/p')
echo "Uncategorized (misc) packages: ${MISC:-0}  (review with: pnpm npm:categories:list-misc)"

# ---------------------------------------------------------------------------
step "Generating report, badges and README"
(cd "$DB_DIR" && pnpm npm:report >/dev/null && pnpm npm:badges >/dev/null && pnpm npm:readme)

SUMMARY=$(sed -n '/^## Overall Download Statistics/,/^---/p' README.md | sed '$d')

if [ "$OPEN_PR" -eq 0 ]; then
  step "Done (--no-pr): changes left uncommitted"
  echo "$SUMMARY"
  exit 0
fi

# ---------------------------------------------------------------------------
step "Committing and opening a PR"
git add README.md badges output
if git diff --cached --quiet; then
  echo "no changes to commit"
  exit 0
fi
git commit -q -m "chore(stats): refresh npm download stats through $LATEST"
git push -q -u "$FORK_REMOTE" "$BRANCH"

FORK_OWNER=$(git remote get-url "$FORK_REMOTE" | sed -E 's#.*github\.com[:/]([^/]+)/.*#\1#')
PR_BODY="Refreshes the npm download stats through **$LATEST** (generated by \`update_stats.sh\`).

$SUMMARY"
if [ -n "$OUTAGES" ]; then
  PR_BODY="$PR_BODY

npm outage days in the monthly window (zero for every package, excluded and scaled): $OUTAGES"
fi
if [ "${MISC:-0}" -gt 0 ]; then
  PR_BODY="$PR_BODY

$MISC packages are uncategorized (counted under Utilities); see \`pnpm npm:categories:list-misc\`."
fi

gh pr create --repo "$UPSTREAM_REPO" --base main --head "$FORK_OWNER:$BRANCH" \
  --title "chore(stats): refresh npm download stats through $LATEST" \
  --body "$PR_BODY"
