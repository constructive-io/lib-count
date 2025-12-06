import { Database } from "@cosmology/db-client";
import { PoolClient } from "pg";
import { packages, blacklistConfig } from "../../config";

/**
 * List all packages that are currently in the "misc" category (uncategorized)
 * These are packages that exist in the database but are not assigned to any
 * specific category in the config.
 */
export async function listMiscPackages(): Promise<void> {
  const db = new Database();

  try {
    await db.withTransaction(async (dbClient: PoolClient) => {
      // Get the misc category ID
      const miscResult = await dbClient.query(
        `SELECT id FROM npm_count.category WHERE name = 'misc'`
      );

      if (miscResult.rows.length === 0) {
        console.log("No 'misc' category found in database.");
        return;
      }

      const miscCategoryId = miscResult.rows[0].id;

      // Get all packages in the misc category with their download stats
      const result = await dbClient.query(
        `
        SELECT
          p.package_name,
          p.creation_date,
          p.last_publish_date,
          COALESCE(
            (SELECT SUM(download_count)
             FROM npm_count.daily_downloads
             WHERE package_name = p.package_name),
            0
          ) as total_downloads
        FROM npm_count.npm_package p
        JOIN npm_count.package_category pc ON pc.package_id = p.package_name
        WHERE pc.category_id = $1
          AND p.is_active = true
        ORDER BY total_downloads DESC
        `,
        [miscCategoryId]
      );

      console.log("\n========================================");
      console.log("  UNCATEGORIZED PACKAGES (misc)");
      console.log("========================================\n");

      if (result.rows.length === 0) {
        console.log("No uncategorized packages found.");
        return;
      }

      console.log(`Found ${result.rows.length} uncategorized packages:\n`);
      console.log(
        "Package Name".padEnd(50) +
          "Total Downloads".padStart(15) +
          "  Created"
      );
      console.log("-".repeat(80));

      for (const row of result.rows) {
        const downloads = Number(row.total_downloads).toLocaleString();
        const created = row.creation_date
          ? new Date(row.creation_date).toISOString().split("T")[0]
          : "N/A";
        console.log(
          row.package_name.padEnd(50) + downloads.padStart(15) + "  " + created
        );
      }

      console.log("\n" + "-".repeat(80));
      console.log(`Total: ${result.rows.length} packages\n`);

      // Also output as a simple list for easy copying
      console.log("\n--- Simple list (for copying to config) ---\n");
      for (const row of result.rows) {
        console.log(`"${row.package_name}",`);
      }
    });
  } catch (error) {
    console.error("Failed to list misc packages:", error);
    throw error;
  }
}

/**
 * Sync categories from config to database
 * This will:
 * 1. Create any new categories that don't exist
 * 2. Update package-category associations based on config
 * 3. Move uncategorized packages to "misc"
 */
export async function syncCategories(): Promise<void> {
  const db = new Database();

  try {
    await db.withTransaction(async (dbClient: PoolClient) => {
      console.log("\n========================================");
      console.log("  SYNCING CATEGORIES FROM CONFIG");
      console.log("========================================\n");

      // Step 1: Ensure all categories from config exist in DB
      const categoryNames = [...new Set([...Object.keys(packages), "misc"])];
      console.log(`Ensuring ${categoryNames.length} categories exist...`);

      const categoryMap = new Map<string, string>();
      for (const name of categoryNames) {
        const result = await dbClient.query(
          `
          INSERT INTO npm_count.category (name)
          VALUES ($1)
          ON CONFLICT (name) DO UPDATE SET updated_at = now()
          RETURNING id
          `,
          [name]
        );
        categoryMap.set(name, result.rows[0].id);
      }
      console.log(`✓ Categories ensured\n`);

      // Step 2: Build package -> categories mapping from config
      const packageCategories = new Map<string, string[]>();
      for (const [category, packageNames] of Object.entries(packages)) {
        for (const packageName of packageNames) {
          const categories = packageCategories.get(packageName) || [];
          categories.push(category);
          packageCategories.set(packageName, categories);
        }
      }

      // Step 3: Get all existing packages from DB
      const existingResult = await dbClient.query(
        `SELECT package_name FROM npm_count.npm_package WHERE is_active = true`
      );
      const existingPackages = new Set(
        existingResult.rows.map((row) => row.package_name)
      );

      console.log(`Found ${existingPackages.size} active packages in database`);
      console.log(
        `Config defines ${packageCategories.size} categorized packages\n`
      );

      // Step 4: Clear ALL existing package-category associations
      console.log("Clearing existing category associations...");
      await dbClient.query(`DELETE FROM npm_count.package_category`);
      console.log("✓ Cleared\n");

      // Step 5: Apply categories from config for packages that exist in DB
      console.log("Applying category assignments from config...\n");

      let categorizedCount = 0;
      let skippedCount = 0;

      for (const [packageName, categories] of packageCategories.entries()) {
        if (!existingPackages.has(packageName)) {
          skippedCount++;
          continue;
        }

        // Deduplicate category IDs (a package might be listed multiple times in a category)
        const categoryIds = [...new Set(categories.map((cat) => categoryMap.get(cat)!))];
        if (categoryIds.length > 0) {
          const values = categoryIds
            .map((_, i) => `($1, $${i + 2})`)
            .join(", ");
          await dbClient.query(
            `
            INSERT INTO npm_count.package_category (package_id, category_id)
            VALUES ${values}
            ON CONFLICT DO NOTHING
            `,
            [packageName, ...categoryIds]
          );
          categorizedCount++;
        }
      }

      console.log(`✓ Categorized ${categorizedCount} packages from config`);
      if (skippedCount > 0) {
        console.log(
          `⚠ Skipped ${skippedCount} packages (not found in database)`
        );
      }

      // Step 6: Assign uncategorized packages to "misc"
      const whitelistedPackages = Array.from(packageCategories.keys());
      const miscCategoryId = categoryMap.get("misc")!;

      // Find packages not in the whitelist
      let uncategorizedResult;
      if (whitelistedPackages.length > 0) {
        uncategorizedResult = await dbClient.query(
          `
          SELECT package_name
          FROM npm_count.npm_package
          WHERE is_active = true
            AND package_name NOT IN (
              SELECT package_id FROM npm_count.package_category
            )
          `
        );
      } else {
        uncategorizedResult = await dbClient.query(
          `SELECT package_name FROM npm_count.npm_package WHERE is_active = true`
        );
      }

      if (uncategorizedResult.rows.length > 0) {
        console.log(
          `\nAssigning ${uncategorizedResult.rows.length} uncategorized packages to 'misc'...`
        );

        for (const row of uncategorizedResult.rows) {
          await dbClient.query(
            `
            INSERT INTO npm_count.package_category (package_id, category_id)
            VALUES ($1, $2)
            ON CONFLICT DO NOTHING
            `,
            [row.package_name, miscCategoryId]
          );
        }
        console.log(`✓ Done`);
      }

      // Step 7: Apply blacklist
      console.log("\nApplying blacklist...");
      const blacklistResult = await dbClient.query(
        `
        UPDATE npm_count.npm_package
        SET is_active = false, updated_at = now()
        WHERE package_name LIKE ANY($1)
        OR package_name = ANY($2)
        RETURNING package_name
        `,
        [
          blacklistConfig.namespaces.map((namespace) => `${namespace}%`),
          blacklistConfig.packages,
        ]
      );

      if (blacklistResult.rows.length > 0) {
        console.log(`✓ Deactivated ${blacklistResult.rows.length} packages`);
      } else {
        console.log(`✓ No packages to blacklist`);
      }

      // Summary
      console.log("\n========================================");
      console.log("  SYNC COMPLETE");
      console.log("========================================");
      console.log(`Categories: ${categoryNames.length}`);
      console.log(`Categorized packages: ${categorizedCount}`);
      console.log(`Uncategorized (misc): ${uncategorizedResult.rows.length}`);
      console.log(`Blacklisted: ${blacklistResult.rows.length}`);
      console.log("");
    });
  } catch (error) {
    console.error("Failed to sync categories:", error);
    throw error;
  }
}
