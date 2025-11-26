#!/bin/bash

# Exit on error
set -e

# URL to download from
URL="https://raw.githubusercontent.com/hyperweb-io/lib-count-downloads/refs/heads/main/stats_dev_inserts.sql"

# Temporary file for download
TEMP_FILE="temp_stats_inserts.sql"

# Output file
OUTPUT_FILE="deploy/data.sql"

echo "Downloading SQL data from GitHub..."
curl -L -o "$TEMP_FILE" "$URL"

echo "Creating deploy/data.sql with header..."
{
  echo "-- Deploy: data"
  echo "-- made with <3 @ launchql.com"
  echo ""
  cat "$TEMP_FILE"
} > "$OUTPUT_FILE"

echo "Cleaning up temporary file..."
rm "$TEMP_FILE"

echo "Done! SQL data loaded into $OUTPUT_FILE"