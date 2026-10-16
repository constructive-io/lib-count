// Which date ranges to request from npm's downloads API. Pure date arithmetic,
// kept free of DB imports so it can be unit tested. All dates are UTC days.

export interface DateRange {
  start: Date;
  end: Date;
}

const DEFAULT_CHUNK_SIZE = 30; // days per request

export function normalizeDate(date: Date): Date {
  const normalized = new Date(date);
  normalized.setUTCHours(0, 0, 0, 0);
  return normalized;
}

export function getDateChunks(
  startDate: Date,
  endDate: Date,
  chunkSize = DEFAULT_CHUNK_SIZE
): DateRange[] {
  const chunks: DateRange[] = [];
  let currentStart = normalizeDate(startDate);
  const finalEndDate = normalizeDate(
    new Date(Math.min(endDate.getTime(), new Date().getTime()))
  );

  while (currentStart <= finalEndDate) { // <= so a one-day gap still gets a chunk
    // Create a new chunk
    const chunkEnd = new Date(currentStart);
    chunkEnd.setUTCDate(chunkEnd.getUTCDate() + chunkSize - 1);

    // Ensure we don't go past the final end date
    const actualEnd = chunkEnd > finalEndDate ? finalEndDate : chunkEnd;

    chunks.push({
      start: new Date(currentStart),
      end: new Date(actualEnd),
    });

    // Move to next chunk
    currentStart = new Date(actualEnd);
    currentStart.setUTCDate(currentStart.getUTCDate() + 1);
  }

  return chunks;
}

// npm publishes a day's counts some time after the day ends (UTC) and reports 0
// for it until then. So never ask for today, and always re-fetch the trailing
// REFRESH_DAYS: a day that was fetched before npm published it (or during an npm
// outage that was later backfilled) gets its real count on a later run. Costs no
// extra requests -- every run already fetches the newest days as one chunk.
export const REFRESH_DAYS = 30;

export function getMissingDateChunks(
  startDate: Date,
  endDate: Date,
  existingDates: Set<string>,
  chunkSize = DEFAULT_CHUNK_SIZE
): DateRange[] {
  const chunks: DateRange[] = [];
  let currentStart: Date | null = null;
  let current = normalizeDate(startDate);
  const finalEndDate = normalizeDate(
    new Date(Math.min(endDate.getTime(), new Date().getTime()))
  );
  finalEndDate.setUTCDate(finalEndDate.getUTCDate() - 1); // yesterday (UTC)
  const refreshFrom = new Date(finalEndDate);
  refreshFrom.setUTCDate(refreshFrom.getUTCDate() - (REFRESH_DAYS - 1));

  while (current <= finalEndDate) {
    const dateStr = current.toISOString().split('T')[0];
    const isMissing = !existingDates.has(dateStr) || current >= refreshFrom;

    if (isMissing) {
      // Start or continue a missing range
      if (currentStart === null) {
        currentStart = new Date(current);
      }
    } else {
      // If we were tracking a missing range, save it
      if (currentStart !== null) {
        const prevDay = new Date(current);
        prevDay.setUTCDate(prevDay.getUTCDate() - 1);
        chunks.push({
          start: currentStart,
          end: prevDay,
        });
        currentStart = null;
      }
    }

    // Move to next day
    current.setUTCDate(current.getUTCDate() + 1);
  }

  // Close any open range
  if (currentStart !== null) {
    chunks.push({
      start: currentStart,
      end: new Date(finalEndDate),
    });
  }

  // Split large chunks into smaller ones for better progress tracking
  const splitChunks: DateRange[] = [];
  for (const chunk of chunks) {
    const subChunks = getDateChunks(chunk.start, chunk.end, chunkSize);
    splitChunks.push(...subChunks);
  }

  return splitChunks;
}
