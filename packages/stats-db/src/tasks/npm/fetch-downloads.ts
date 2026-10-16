import { Database } from "@cosmology/db-client";
import { PoolClient } from "pg";
import { NPMApiClient } from "../../npm-client";
import {
  getPackagesWithoutDownloads,
  getAllPackages,
  getAllActivePackages,
  insertDailyDownloads,
  updateLastFetchedDate,
  getTotalLifetimeDownloads,
  getPackagesWithMissingDates,
  getExistingDownloadDates,
} from "./npm.queries";
import { delay } from "../../utils";
import { DateRange, normalizeDate, getMissingDateChunks } from "./date-chunks";

const npmClient = new NPMApiClient();

// Default configuration - can be overridden via options
const DEFAULT_CONCURRENT_TASKS = 2; // Reduced from 200 to avoid rate limits
const DEFAULT_RATE_LIMIT_DELAY = 2500; // Increased from 50ms to 200ms
const DEFAULT_CHUNK_SIZE = 30; // days per chunk
const PACKAGE_WHITELIST = new Set([]);
const USE_WHITELIST = PACKAGE_WHITELIST.size > 0;

const MAX_RETRIES = 3;
const INITIAL_RETRY_DELAY = 1000; // 1 second

// Active configuration (set by run function)
let CONCURRENT_TASKS = DEFAULT_CONCURRENT_TASKS;
let RATE_LIMIT_DELAY = DEFAULT_RATE_LIMIT_DELAY;
let CHUNK_SIZE = DEFAULT_CHUNK_SIZE;


function is429Error(error: unknown): boolean {
  return (
    typeof error === "object" &&
    error !== null &&
    "status" in error &&
    (error as any).status === 429
  );
}

interface PackageInfo {
  packageName: string;
  creationDate: Date;
}

function formatDateRange(range: DateRange): string {
  const start = range.start.toISOString().split("T")[0];
  const end = range.end.toISOString().split("T")[0];
  const days =
    Math.floor(
      (range.end.getTime() - range.start.getTime()) / (1000 * 60 * 60 * 24)
    ) + 1;
  return `${start} to ${end} (${days} days)`;
}

async function processPackageChunk(
  db: Database,
  packageName: string,
  dateRange: DateRange,
  chunkIndex: number,
  totalChunks: number,
  current: number,
  total: number
): Promise<void> {
  const startTime = Date.now();
  const dateRangeStr = formatDateRange(dateRange);

  try {
    console.log(
      `[${current}/${total}] Starting chunk ${chunkIndex}/${totalChunks} for ${packageName}: ${dateRangeStr}`
    );

    // Format dates for npm API - ensure UTC dates
    const downloadData = await npmClient.download({
      startDate: [
        dateRange.start.getUTCFullYear(),
        dateRange.start.getUTCMonth() + 1,
        dateRange.start.getUTCDate(),
      ],
      endDate: [
        dateRange.end.getUTCFullYear(),
        dateRange.end.getUTCMonth() + 1,
        dateRange.end.getUTCDate(),
      ],
      packageName,
    });

    if (!downloadData.downloads || downloadData.downloads.length === 0) {
      console.log(
        `[${current}/${total}] ⚠ ${packageName} chunk ${chunkIndex}/${totalChunks}: No downloads for ${dateRangeStr}`
      );
      return;
    }

    // Ensure all dates are normalized to UTC
    const normalizedDownloads = downloadData.downloads.map((d) => ({
      date: normalizeDate(new Date(d.day)),
      downloadCount: d.downloads,
    }));

    // Insert in its own transaction - this ensures the data is committed even if later chunks fail
    await db.withTransaction(async (dbClient: PoolClient) => {
      await insertDailyDownloads(dbClient, packageName, normalizedDownloads);
    });

    const totalDownloads = normalizedDownloads.reduce(
      (sum, d) => sum + d.downloadCount,
      0
    );

    const duration = ((Date.now() - startTime) / 1000).toFixed(2);
    console.log(
      `[${current}/${total}] ✓ ${packageName} chunk ${chunkIndex}/${totalChunks}: Processed ${
        normalizedDownloads.length
      } days in ${duration}s\n\tPeriod: ${dateRangeStr}\n\tTotal Downloads: ${totalDownloads.toLocaleString()}`
    );
  } catch (error) {
    const duration = ((Date.now() - startTime) / 1000).toFixed(2);
    console.error(
      `[${current}/${total}] ✗ ${packageName} chunk ${chunkIndex}/${totalChunks} failed after ${duration}s:\n\tPeriod: ${dateRangeStr}\n\tError: ${
        error instanceof Error ? error.message : error
      }`
    );
    throw error;
  }
}

async function processPackageDownloads(
  db: Database,
  packageName: string,
  creationDate: Date,
  current: number,
  total: number
): Promise<void> {
  let lastError: Error | unknown;

  for (let attempt = 1; attempt <= MAX_RETRIES; attempt++) {
    try {
      const today = new Date();
      let existingDates: Set<string>;

      // Get existing download dates in a read-only transaction
      await db.withTransaction(async (dbClient: PoolClient) => {
        existingDates = await getExistingDownloadDates(dbClient, packageName);
      });

      // Calculate chunks to fetch: missing days plus the trailing refresh window
      const dateChunks = getMissingDateChunks(
        creationDate,
        today,
        existingDates!,
        CHUNK_SIZE
      );

      if (dateChunks.length === 0) {
        console.log(
          `[${current}/${total}] ✓ ${packageName}: All downloads up to date, skipping`
        );
        // Still update the last_fetched_date to mark it as checked
        await db.withTransaction(async (dbClient: PoolClient) => {
          await updateLastFetchedDate(dbClient, packageName);
        });
        return;
      }

      const totalDays =
        Math.floor(
          (today.getTime() - creationDate.getTime()) / (1000 * 60 * 60 * 24)
        ) + 1;
      const existingDaysCount = existingDates!.size;
      const missingDaysCount = totalDays - existingDaysCount;

      if (attempt > 1) {
        console.log(
          `[${current}/${total}] 🔄 Retry attempt ${attempt}/${MAX_RETRIES} for ${packageName}`
        );
      }

      console.log(
        `\n[${current}/${total}] Starting ${packageName}:\n` +
          `\tPeriod: ${creationDate.toISOString().split("T")[0]} to ${today.toISOString().split("T")[0]}\n` +
          `\tTotal Days: ${totalDays} (${existingDaysCount} existing, ${missingDaysCount} missing)\n` +
          `\tChunks to fetch: ${dateChunks.length}`
      );

      // Process each chunk individually - each chunk commits its own transaction
      for (let i = 0; i < dateChunks.length; i++) {
        await delay(RATE_LIMIT_DELAY);
        await processPackageChunk(
          db,
          packageName,
          dateChunks[i],
          i + 1,
          dateChunks.length,
          current,
          total
        );
      }

      // Update the last_fetched_date after all chunks are processed successfully
      await db.withTransaction(async (dbClient: PoolClient) => {
        await updateLastFetchedDate(dbClient, packageName);
      });

      // Get and log total lifetime downloads
      let lifetimeDownloads: number;
      await db.withTransaction(async (dbClient: PoolClient) => {
        lifetimeDownloads = await getTotalLifetimeDownloads(dbClient, packageName);
      });

      console.log(
        `[${current}/${total}] ✅ Completed all chunks for ${packageName}\n` +
          `\tTotal Lifetime Downloads: ${lifetimeDownloads!.toLocaleString()}\n`
      );

      // If we get here, processing was successful
      return;
    } catch (error) {
      lastError = error;

      // Immediately fail on 429 errors without retrying
      if (is429Error(error)) {
        console.error(
          `[${current}/${total}] 🚨 RATE LIMIT (429) detected for ${packageName} - STOPPING ALL PROCESSING`
        );
        throw error;
      }

      if (attempt < MAX_RETRIES) {
        const backoffDelay = INITIAL_RETRY_DELAY * Math.pow(2, attempt - 1);
        console.error(
          `[${current}/${total}] ⚠️ Attempt ${attempt}/${MAX_RETRIES} failed for ${packageName}:`,
          error instanceof Error ? error.message : error,
          `\n\tRetrying in ${backoffDelay / 1000} seconds...`
        );
        await delay(backoffDelay);
      }
    }
  }

  // If we get here, all retries failed
  console.error(
    `[${current}/${total}] ❌ All ${MAX_RETRIES} attempts failed for ${packageName}:`,
    lastError instanceof Error ? lastError.message : lastError
  );
  throw lastError;
}

async function processBatch(
  db: Database,
  packages: Array<PackageInfo>,
  startIndex: number,
  total: number
): Promise<void> {
  try {
    // Use Promise.all instead of allSettled so we fail fast on any error
    await Promise.all(
      packages.map((pkg, index) =>
        (async () => {
          await delay(index * RATE_LIMIT_DELAY); // Stagger the requests
          return processPackageDownloads(
            db,
            pkg.packageName,
            pkg.creationDate,
            startIndex + index + 1,
            total
          );
        })()
      )
    );
  } catch (error) {
    // If it's a 429 error, immediately propagate it to stop all processing
    if (is429Error(error)) {
      console.error(`\n🚨 RATE LIMIT (429) ERROR - STOPPING ALL PROCESSING IMMEDIATELY`);
      throw error;
    }

    // For other errors, log but don't stop the entire process
    console.error(`\nBatch processing error:`, error);
    throw error;
  }
}

interface RunOptions {
  resetDb?: boolean;
  backfill?: boolean;
  concurrentTasks?: number;
  rateLimitDelay?: number;
  chunkSize?: number;
}

async function run(options: RunOptions = {}): Promise<void> {
  const {
    resetDb: shouldResetDb = false,
    backfill: shouldBackfill = false,
    concurrentTasks = DEFAULT_CONCURRENT_TASKS,
    rateLimitDelay = DEFAULT_RATE_LIMIT_DELAY,
    chunkSize = DEFAULT_CHUNK_SIZE,
  } = options;

  // Set active configuration
  CONCURRENT_TASKS = concurrentTasks;
  RATE_LIMIT_DELAY = rateLimitDelay;
  CHUNK_SIZE = chunkSize;

  const db = new Database();
  const scriptStartTime = Date.now();

  try {
    // Get packages that need fetching - this can be outside transaction
    let packages: PackageInfo[] = [];

    await db.withTransaction(async (dbClient: PoolClient) => {
      // In reset mode, get all packages (including inactive)
      // In backfill mode, get all active packages (ignores last_fetched_date to find gaps)
      // Otherwise, get packages with missing dates (stale last_fetched_date)
      if (shouldResetDb) {
        packages = await getAllPackages(dbClient);
      } else if (shouldBackfill) {
        packages = await getAllActivePackages(dbClient);
      } else {
        packages = await getPackagesWithMissingDates(dbClient);
      }
    });

    // Convert to simpler package info format
    packages = packages.map((pkg) => ({
      packageName: pkg.packageName,
      creationDate: pkg.creationDate,
    }));

    // Filter by whitelist if enabled
    if (USE_WHITELIST) {
      const originalCount = packages.length;
      packages = packages.filter((pkg) =>
        PACKAGE_WHITELIST.has(pkg.packageName)
      );
      console.log(
        `Filtered ${originalCount} packages to ${packages.length} whitelisted packages`
      );
    }

    const totalPackages = packages.length;
    if (totalPackages === 0) {
      console.log("No packages to process!");
      return;
    }

    const modeStr = shouldResetDb
      ? " (RESET mode)"
      : shouldBackfill
        ? " (BACKFILL mode - scanning for gaps)"
        : "";
    console.log(
      `Found ${totalPackages} package${
        totalPackages === 1 ? "" : "s"
      } to process${modeStr}${
        USE_WHITELIST ? " (WHITELIST mode)" : ""
      }\n` +
        `Configuration:\n` +
        `\tConcurrent Tasks: ${CONCURRENT_TASKS}\n` +
        `\tRate Limit Delay: ${RATE_LIMIT_DELAY}ms\n` +
        `\tChunk Size: ${CHUNK_SIZE} days`
    );

    let successCount = 0;
    let failureCount = 0;

    // Process packages in batches
    for (let i = 0; i < packages.length; i += CONCURRENT_TASKS) {
      const batch = packages.slice(i, i + CONCURRENT_TASKS);
      console.log(
        `\nProcessing batch ${Math.floor(i / CONCURRENT_TASKS) + 1}/${Math.ceil(
          packages.length / CONCURRENT_TASKS
        )}...`
      );

      try {
        await processBatch(db, batch, i, totalPackages);
        successCount += batch.length;
      } catch (error) {
        // If it's a 429 error, stop all processing immediately
        if (is429Error(error)) {
          console.error(
            `\n🚨 RATE LIMIT (429) ERROR DETECTED - TERMINATING PROCESS\n` +
            `Processed: ${successCount} successful, ${failureCount} failed\n` +
            `Stopping to avoid further rate limit violations.`
          );
          throw error;
        }

        failureCount += batch.length;
        console.error(`Batch processing error:`, error);
      }
    }

    const duration = ((Date.now() - scriptStartTime) / 1000).toFixed(2);
    console.log(
      `\nProcessing completed in ${duration} seconds!\n` +
        `Successful packages: ${successCount}\n` +
        `Failed packages: ${failureCount}`
    );
  } catch (error) {
    const duration = ((Date.now() - scriptStartTime) / 1000).toFixed(2);

    // Handle 429 errors specially
    if (is429Error(error)) {
      console.error(
        `\n🚨 Script terminated after ${duration} seconds due to rate limiting (429)\n` +
        `Please wait before retrying to avoid further rate limit violations.`
      );
    } else {
      console.error(`Script error after ${duration} seconds:`, error);
    }

    throw error;
  }
}

type FetchDownloadsOptions = {
  resetDb?: boolean;
  backfill?: boolean;
  concurrentTasks?: number;
  rateLimitDelay?: number;
  chunkSize?: number;
};

export function execute(options: FetchDownloadsOptions = {}): Promise<void> {
  return run(options)
    .then(() => {
      console.log(`Script completed successfully!`);
      process.exit(0);
    })
    .catch((error) => {
      // Exit with special code for rate limiting
      if (is429Error(error)) {
        console.error(`\n🚨 Script failed due to rate limiting (429)`);
        process.exit(2); // Exit code 2 for rate limiting
      } else {
        console.error(`Script failed:`, error);
        process.exit(1);
      }
    });
}
