import { Database } from "@cosmology/db-client";
import { PoolClient } from "pg";
import * as fs from "fs";
import * as path from "path";
import {
  packages,
  readmeHiddenCategories,
  readmeCategoryOrder,
  readmeCategoryDisplayName,
  brandRollupFor,
} from "../../config";
import { CategoryStats, TotalStats } from "../../types";
import {
  getStatsWindow,
  getAllPackageStats,
  getCategoryStats,
  getUncategorizedPackages,
  describeStatsWindow,
} from "./stats-window";

function formatNumber(num: number): string {
  return num.toLocaleString();
}

const SNIPPETS_DIR = path.resolve(__dirname, "../readme-snippets");

function readSnippet(filename: string): string {
  return fs.readFileSync(path.join(SNIPPETS_DIR, filename), "utf-8");
}

// --- README Generation specific functions ---

function generateOverallStatsTable(totals: TotalStats, windowNote: string): string {
  const lines = [
    `## Overall Download Statistics\n`,
    "| Category | Total | Monthly | Weekly |",
    "| ------- | ------ | ------- | ----- |",
    `| **Total** | ${formatNumber(totals.total.total)} | ${formatNumber(totals.total.monthly)} | ${formatNumber(totals.total.weekly)} |`,
    `| Cloud | ${formatNumber(totals.cloud.total)} | ${formatNumber(totals.cloud.monthly)} | ${formatNumber(totals.cloud.weekly)} |`,
    `| Chain | ${formatNumber(totals.chain.total)} | ${formatNumber(totals.chain.monthly)} | ${formatNumber(totals.chain.weekly)} |`,
    `| Utilities | ${formatNumber(totals.utils.total)} | ${formatNumber(totals.utils.monthly)} | ${formatNumber(totals.utils.weekly)} |`,
  ];
  return lines.join("\n") + "\n\n" + windowNote + "\n\n";
}

function generateBadgesSection(repoName: string): string {
  const rawBaseRepoUrl = `https://raw.githubusercontent.com/${repoName}/main/output/badges/`;
  const encodedTotalDownloadsUrl = encodeURIComponent(
    `${rawBaseRepoUrl}total_downloads.json`
  );
  const encodedMonthlyDownloadsUrl = encodeURIComponent(
    `${rawBaseRepoUrl}monthly_downloads.json`
  );
  const encodedWeeklyDownloadsUrl = encodeURIComponent(
    `${rawBaseRepoUrl}weekly_downloads.json`
  );
  const encodedConstructiveCategoryUrl = encodeURIComponent(
    `${rawBaseRepoUrl}constructive_category.json`
  );
  const encodedUtilsCategoryUrl = encodeURIComponent(
    `${rawBaseRepoUrl}utils_category.json`
  );

  return `
<p align="center" width="100%">
   <img src="https://raw.githubusercontent.com/${repoName}/refs/heads/main/assets/logo.svg" alt="constructive" width="80"><br />
   <a href="https://github.com/${repoName}">
      <img height="20" src="https://img.shields.io/endpoint?url=${encodedTotalDownloadsUrl}"/>
   </a>
   <a href="https://github.com/${repoName}">
      <img height="20" src="https://img.shields.io/endpoint?url=${encodedMonthlyDownloadsUrl}"/>
   </a>
   <a href="https://github.com/${repoName}">
      <img height="20" src="https://img.shields.io/endpoint?url=${encodedWeeklyDownloadsUrl}"/>
   </a>
   <br>
   <a href="https://github.com/${repoName}">
      <img height="20" src="https://img.shields.io/endpoint?url=${encodedConstructiveCategoryUrl}"/>
   </a>
   <a href="https://github.com/${repoName}">
      <img height="20" src="https://img.shields.io/endpoint?url=${encodedUtilsCategoryUrl}"/>
   </a>
</p>

`; // Ensured two newlines at the end to create a blank line before the next section
}

function generateHyperwebBadge(repoName: string): string {
  const url = encodeURIComponent(
    `https://raw.githubusercontent.com/${repoName}/main/output/badges/hyperweb_category.json`
  );
  return `
<p>
   <a href="https://github.com/${repoName}">
      <img height="20" src="https://img.shields.io/endpoint?url=${url}"/>
   </a>
</p>
`;
}

function generateToolsTable(
  repoName: string,
  categoryPackageStats: Map<string, CategoryStats>
): string {
  const getCategoryTotal = (categoryKey: string): string => {
    const stats = categoryPackageStats.get(categoryKey);
    return stats ? formatNumber(stats.total) : "0";
  };
  const productBadgeUrl = (categoryName: string): string => {
    const rawProductUrl = `https://raw.githubusercontent.com/${repoName}/main/badges/products/${categoryName}/total.json`;
    return `https://img.shields.io/endpoint?url=${encodeURIComponent(rawProductUrl)}`;
  };

  return `
| Category             | Tools                                                                                                                  | Downloads                                                                                                 |
|----------------------|------------------------------------------------------------------------------------------------------------------------|--------------------------------------------------------------------------------------------------------|
| **Chain Information**   | [**Chain Registry**](https://github.com/hyperweb-io/chain-registry), [**Utils**](https://www.npmjs.com/package/@chain-registry/utils), [**Client**](https://www.npmjs.com/package/@chain-registry/client) | ![Chain Registry](${productBadgeUrl("chain-registry")}) |
| **Wallet Connectors**| [**Interchain Kit**](https://github.com/hyperweb-io/interchain-kit), [**Cosmos Kit**](https://github.com/hyperweb-io/cosmos-kit) | ![Wallet Connectors](${productBadgeUrl("cosmos-kit")}) |
| **Signing Clients**          | [**InterchainJS**](https://github.com/hyperweb-io/interchainjs), [**CosmJS**](https://github.com/cosmos/cosmjs) | ![Signers](${productBadgeUrl("cosmos-kit")}) |
| **SDK Clients**              | [**Telescope**](https://github.com/hyperweb-io/telescope)                                                          | ![SDK](${productBadgeUrl("telescope")}) |
| **Starter Kits**     | [**Create Interchain App**](https://github.com/hyperweb-io/create-interchain-app), [**Create Cosmos App**](https://github.com/hyperweb-io/create-cosmos-app) | ![Starter Kits](${productBadgeUrl("create-cosmos-app")}) |
| **UI Kits**          | [**Interchain UI**](https://github.com/hyperweb-io/interchain-ui)                                                   | ![UI Kits](${productBadgeUrl("interchain-ui")}) |
| **Testing Frameworks**          | [**Starship**](https://github.com/hyperweb-io/starship)                                                             | ![Testing](${productBadgeUrl("starship")}) |
| **TypeScript Smart Contracts** | [**Create Hyperweb App**](https://github.com/hyperweb-io/create-hyperweb-app)                              | ![TypeScript Smart Contracts](${productBadgeUrl("hyperwebjs")}) |
| **CosmWasm Contracts** | [**CosmWasm TS Codegen**](https://github.com/CosmWasm/ts-codegen)                                                   | ![CosmWasm Contracts](${productBadgeUrl("cosmwasm")}) |
`;
}

function getSortedVisibleCategories(): string[] {
  const visibleCategories = Object.keys(packages).filter(
    (key) => !readmeHiddenCategories.includes(key)
  );
  return visibleCategories.sort((a, b) => {
    const aIndex = readmeCategoryOrder.indexOf(a);
    const bIndex = readmeCategoryOrder.indexOf(b);
    if (aIndex !== -1 && bIndex !== -1) return aIndex - bIndex;
    if (aIndex !== -1) return -1;
    if (bIndex !== -1) return 1;
    return a.localeCompare(b);
  });
}

const MIN_DOWNLOADS_THRESHOLD = 1000;

function categoryHasVisiblePackages(categoryData: CategoryStats): boolean {
  if (!categoryData.packages || categoryData.packages.length === 0) {
    return false;
  }
  return categoryData.packages.some((pkg) => pkg.total >= MIN_DOWNLOADS_THRESHOLD);
}

// Visible categories split into the two README groups. Hyperweb (the Chain
// rollup) is rendered as its own block at the bottom of the README, after all
// the Constructive / Cloud / Utilities content.
function getVisibleCategoryGroups(
  categoryStatsMap: Map<string, CategoryStats>
): { constructive: string[]; hyperweb: string[] } {
  const visible = getSortedVisibleCategories().filter((categoryName) => {
    const categoryData = categoryStatsMap.get(categoryName);
    return categoryData && categoryHasVisiblePackages(categoryData);
  });
  return {
    constructive: visible.filter((key) => brandRollupFor(key) !== "chain"),
    hyperweb: visible.filter((key) => brandRollupFor(key) === "chain"),
  };
}

function generateCategorySections(
  title: string,
  categoryKeys: string[],
  anchors: Map<string, string>,
  categoryStatsMap: Map<string, CategoryStats>
): string {
  let content = generateToc(title, categoryKeys, anchors);
  for (const categoryName of categoryKeys) {
    const categoryData = categoryStatsMap.get(categoryName);
    if (categoryData) {
      content += generateCategoryTableSection(categoryName, categoryData);
    }
  }
  return content;
}

// Anchors for the generated category sections.
//
// The static snippets already contain brand headings (`### Constructive` and
// `### PGPM` in intro.md). When a category's display name matches one of those, GitHub sees
// two identical headings and suffixes the second anchor ("#constructive-1"), so a
// naive slug would link the Table of Contents at the brand blurb instead of the
// package table. Mirror GitHub's rule rather than guessing.
function slugifyHeading(text: string): string {
  return text
    .toLowerCase()
    .replace(/\s+/g, "-")
    .replace(/[^a-z0-9-]/g, "");
}

function headingsInSnippets(): string[] {
  return ["intro.md", "hyperweb-intro.md"].flatMap((filename) => {
    try {
      return readSnippet(filename)
        .split("\n")
        .filter((l) => /^#{1,6}\s/.test(l))
        .map((l) => l.replace(/^#{1,6}\s+/, "").trim());
    } catch {
      return [];
    }
  });
}

function buildAnchorMap(categoryKeys: string[]): Map<string, string> {
  const seen = new Map<string, number>();
  for (const heading of headingsInSnippets()) {
    const slug = slugifyHeading(heading);
    seen.set(slug, (seen.get(slug) ?? 0) + 1);
  }
  const anchors = new Map<string, string>();
  for (const key of categoryKeys) {
    const slug = slugifyHeading(readmeCategoryDisplayName(key));
    const priorCount = seen.get(slug) ?? 0;
    anchors.set(key, priorCount === 0 ? slug : `${slug}-${priorCount}`);
    seen.set(slug, priorCount + 1);
  }
  return anchors;
}

function generateToc(
  title: string,
  packageCategories: string[],
  anchors: Map<string, string>
): string {
  const tocTitle = `## ${title}\n\n`;
  const tocItems = packageCategories.map((categoryName) => {
    // Link text and anchor both come from the display name, so the anchor keeps
    // matching the heading GitHub generates from it.
    const displayName = readmeCategoryDisplayName(categoryName);
    const anchor = anchors.get(categoryName) ?? slugifyHeading(displayName);
    return `- [${displayName}](#${anchor})`;
  });
  return tocTitle + tocItems.join("\n") + "\n\n"; // Ensure a blank line after the ToC list
}

function generateCategoryTableSection(
  categoryName: string,
  categoryData: CategoryStats
): string {
  const lines: string[] = [];
  const displayName = readmeCategoryDisplayName(categoryName);
  lines.push(`### ${displayName}
`); // The heading itself does not need the anchor in its text
  lines.push("| Name | Total | Monthly | Weekly |");
  lines.push("| ------- | ------ | ------- | ----- |");
  lines.push(
    `| _Total_ | ${formatNumber(categoryData.total)} | ${formatNumber(categoryData.monthly)} | ${formatNumber(categoryData.weekly)} |`
  );

  let hiddenCount = 0;
  if (categoryData.packages && categoryData.packages.length > 0) {
    categoryData.packages.forEach((pkg) => {
      if (pkg.total >= MIN_DOWNLOADS_THRESHOLD) {
        lines.push(
          `| [${pkg.name}](https://www.npmjs.com/package/${pkg.name}) | ${formatNumber(pkg.total)} | ${formatNumber(pkg.monthly)} | ${formatNumber(pkg.weekly)} |`
        );
      } else {
        hiddenCount++;
      }
    });
  }

  if (hiddenCount > 0) {
    lines.push(`| *${hiddenCount} package${hiddenCount > 1 ? 's' : ''} hidden (< ${formatNumber(MIN_DOWNLOADS_THRESHOLD)} downloads)* | | | |`);
  }

  return lines.join("\n") + "\n\n";
}

function generateTimestampComment(repoBaseName: string): string {
  return `\n\n<!-- README.md automatically generated on ${new Date().toISOString()} from ${repoBaseName} repository with latest download stats -->\n`;
}

export async function generateReadmeNew(): Promise<string> {
  const db = new Database();
  let readmeContent = "# Constructive NPM Downloads\n";
  let repoName = "constructive-io/lib-count";
  let repoBaseName = "lib-count";

  // Initialize categoryStatsMap and totals
  const categoryStatsMap = new Map<string, CategoryStats>();
  let totals: TotalStats = {
    cloud: { total: 0, monthly: 0, weekly: 0 },
    chain: { total: 0, monthly: 0, weekly: 0 },
    utils: { total: 0, monthly: 0, weekly: 0 },
    total: { total: 0, monthly: 0, weekly: 0 },
    lifetime: 0,
  };

  try {
    const packageJsonPath = path.resolve(
      __dirname,
      "../../../../../package.json"
    );
    if (fs.existsSync(packageJsonPath)) {
      const packageJsonData = JSON.parse(
        fs.readFileSync(packageJsonPath, "utf8")
      );
      const repoUrl = packageJsonData.repository?.url || "";
      if (repoUrl) {
        const githubPrefix = "github.com/";
        const startIndex = repoUrl.indexOf(githubPrefix);
        if (startIndex !== -1) {
          const pathStart = startIndex + githubPrefix.length;
          const endIndex = repoUrl.indexOf(".git", pathStart);
          const extractedName =
            endIndex !== -1
              ? repoUrl.substring(pathStart, endIndex)
              : repoUrl.substring(pathStart);
          if (extractedName) {
            repoName = extractedName;
            repoBaseName = extractedName.split("/")[1] || repoBaseName;
          }
        }
      }
    }
  } catch (e) {
    console.warn(
      "Could not read package.json for repository name, using defaults.",
      e
    );
  }

  const personalTotals = { total: 0, monthly: 0, weekly: 0 };
  let windowNote = "";

  try {
    await db.withTransaction(async (dbClient: PoolClient) => {
      // 1. Per-package lifetime / weekly / monthly stats (shared windows)
      const window = await getStatsWindow(dbClient);
      if (!window) throw new Error("No download data in npm_count.daily_downloads");
      windowNote = describeStatsWindow(window);
      const { packages: allPackages, lifetimeTotal } = await getAllPackageStats(
        dbClient,
        window
      );
      totals.lifetime = lifetimeTotal;
      // Set the grand total for downloads (all-time)
      totals.total.total = lifetimeTotal;

      // 2. Group into categories
      for (const [categoryKey, packageNames] of Object.entries(packages)) {
        const stats = getCategoryStats(allPackages, packageNames);
        categoryStatsMap.set(categoryKey, stats);

        // 3. Aggregate into the brand rollups (shared classifier — see config)
        const rollup = brandRollupFor(categoryKey);
        if (rollup === "personal") {
          // Personal projects are tracked but excluded from every company total.
          personalTotals.total += stats.total;
          personalTotals.monthly += stats.monthly;
          personalTotals.weekly += stats.weekly;
          continue;
        }
        const target = totals[rollup];
        target.total += stats.total;
        target.monthly += stats.monthly;
        target.weekly += stats.weekly;
      }

      // 4. Add uncategorized packages to the utils category totals
      for (const pkg of getUncategorizedPackages(allPackages, packages)) {
        totals.utils.total += pkg.total;
        totals.utils.monthly += pkg.monthly;
        totals.utils.weekly += pkg.weekly;
      }

      // 5. Calculate final overall monthly and weekly totals
      // The lifetime figure is DB-wide, so personal projects are still in it.
      // Monthly/weekly are summed from the rollups and already exclude them.
      totals.total.total = Math.max(0, totals.total.total - personalTotals.total);
      if (personalTotals.total > 0) {
        console.log(
          `Excluded from company totals (personal): ${personalTotals.total.toLocaleString()} lifetime, ` +
            `${personalTotals.monthly.toLocaleString()} monthly, ${personalTotals.weekly.toLocaleString()} weekly`
        );
      }

      totals.total.monthly =
        totals.cloud.monthly + totals.chain.monthly + totals.utils.monthly;
      totals.total.weekly =
        totals.cloud.weekly + totals.chain.weekly + totals.utils.weekly;
    });
  } catch (error) {
    console.error("Failed to fetch data for README generation:", error);
    return "# Hyperweb\n\nError generating README content.";
  }

  // Assemble README sections. Everything Hyperweb lives in one block at the
  // bottom, just above the closing thank-you / downloads / disclaimer snippets.
  const groups = getVisibleCategoryGroups(categoryStatsMap);
  // Anchors are built in document order so GitHub's duplicate-heading suffixes line up.
  const anchors = buildAnchorMap([...groups.constructive, ...groups.hyperweb]);

  readmeContent += generateBadgesSection(repoName);
  readmeContent += readSnippet("intro.md");
  readmeContent += generateOverallStatsTable(totals, windowNote);
  readmeContent += readSnippet("database-stack-intro.md");
  readmeContent += readSnippet("database-tooling.md");
  readmeContent += "\n---\n\n";
  readmeContent += generateCategorySections(
    "Table of Contents",
    groups.constructive,
    anchors,
    categoryStatsMap
  );
  readmeContent += readSnippet("hyperweb-intro.md");
  readmeContent += generateHyperwebBadge(repoName);
  readmeContent += generateToolsTable(repoName, categoryStatsMap);
  readmeContent += "\n";
  readmeContent += generateCategorySections(
    "Hyperweb Packages",
    groups.hyperweb,
    anchors,
    categoryStatsMap
  );
  readmeContent += readSnippet("stack-announcement.md");
  readmeContent += readSnippet("rebrand-info.md");
  readmeContent += readSnippet("whats-next.md");
  readmeContent += readSnippet("thank-you.md");
  readmeContent += readSnippet("understanding-downloads.md");
  readmeContent += readSnippet("credits-disclaimer.md");
  readmeContent += generateTimestampComment(repoBaseName);

  return "\n" + readmeContent;
}

export async function generateAndWriteReadme(): Promise<void> {
  try {
    const readme = await generateReadmeNew();
    fs.writeFileSync(
      path.resolve(__dirname, "../../../../../README.md"),
      readme
    );
    console.log("New README generated");
  } catch (error) {
    console.error("Error in main:", error);
  }
}
