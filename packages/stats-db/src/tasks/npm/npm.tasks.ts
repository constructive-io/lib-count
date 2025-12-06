import { execute as fetchPackages } from "./fetch-packages";
import { execute as fetchDownloads } from "./fetch-downloads";

import { generateReport, generateAndWriteBadges } from "./npm.reports";
import { generateAndWriteReadme } from "./npm.gen-readme";
import { listMiscPackages, syncCategories } from "./npm.categories";
import * as fs from "fs";
import * as path from "path";

interface CommandOptions {
  concurrentTasks?: number;
  rateLimitDelay?: number;
  chunkSize?: number;
  backfill?: boolean;
}

function parseCommandOptions(args: string[]): CommandOptions {
  const options: CommandOptions = {};

  for (let i = 0; i < args.length; i++) {
    const arg = args[i];

    if (arg === '--concurrent' || arg === '-c') {
      options.concurrentTasks = parseInt(args[++i], 10);
    } else if (arg === '--delay' || arg === '-d') {
      options.rateLimitDelay = parseInt(args[++i], 10);
    } else if (arg === '--chunk-size' || arg === '-s') {
      options.chunkSize = parseInt(args[++i], 10);
    } else if (arg === '--backfill' || arg === '-b') {
      options.backfill = true;
    }
  }

  return options;
}

async function runCommand(command: string, options: CommandOptions = {}): Promise<void> {
  console.log(`Executing NPM task: ${command}`);

  switch (command) {
    case "fetch:packages":
      await fetchPackages();
      break;

    case "fetch:downloads":
      await fetchDownloads({
        resetDb: false,
        ...options
      });
      break;

    case "generate:report": {
      const report = await generateReport();
      const reportPath = path.join(__dirname, "../../../exports/npm-report.md");
      fs.mkdirSync(path.dirname(reportPath), { recursive: true });
      fs.writeFileSync(reportPath, report);
      console.log(`Report generated at: ${reportPath}`);
      break;
    }

    case "generate:badges": {
      await generateAndWriteBadges();
      break;
    }

    case "generate:readme": {
      await generateAndWriteReadme();
      break;
    }

    case "categories:list-misc": {
      await listMiscPackages();
      break;
    }

    case "categories:sync": {
      await syncCategories();
      break;
    }

    default:
      console.error(`Unknown command: ${command}`);
      process.exit(1);
  }
}

if (require.main === module) {
  const args = process.argv.slice(2);
  const command = args[0];

  if (!command) {
    console.error(
      "Please provide a command: fetch:packages, fetch:downloads, generate:report, generate:badges, generate:readme, categories:list-misc, or categories:sync"
    );
    console.error("\nCommands:");
    console.error("  fetch:packages         Fetch packages from npm registry");
    console.error("  fetch:downloads        Fetch download stats for packages");
    console.error("  generate:report        Generate npm download report");
    console.error("  generate:badges        Generate badge images");
    console.error("  generate:readme        Generate README file");
    console.error("  categories:list-misc   List uncategorized packages (in misc category)");
    console.error("  categories:sync        Sync categories from config to database");
    console.error("\nOptions for fetch:downloads:");
    console.error("  --concurrent, -c <num>   Number of concurrent package downloads (default: 50)");
    console.error("  --delay, -d <ms>         Delay between requests in milliseconds (default: 200)");
    console.error("  --chunk-size, -s <days>  Number of days per chunk (default: 30)");
    console.error("  --backfill, -b           Force scan ALL active packages for gaps (ignores last_fetched_date)");
    console.error("\nExample:");
    console.error("  npm run npm:fetch:downloads -- --concurrent 20 --delay 500");
    console.error("  npm run npm:fetch:downloads -- --backfill  # Fill in missing historical data");
    process.exit(1);
  }

  const options = parseCommandOptions(args.slice(1));

  runCommand(command, options)
    .then(() => {
      console.log("Command completed successfully!");
      process.exit(0);
    })
    .catch((error) => {
      console.error("Command failed:", error);
      process.exit(1);
    });
}

export { runCommand };
