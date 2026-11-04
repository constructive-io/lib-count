// Which days npm has not published download counts for.
//
// npm's downloads API answers HTTP 200 with `"downloads": 0` for a day it has
// not published yet, and for days lost to an npm-side outage -- for EVERY
// package, `react` included. Those zeros look exactly like a real zero-download
// day, and once stored as a row they counted as "fetched": the gap check passed
// and nothing re-requested the day after it left the 30-day refresh window. npm
// sometimes fills an outage day in weeks later (2026-07-12 and 2026-08-14 were
// both backfilled by npm), so those days must stay retryable.
//
// A reference package that is never really at 0 tells the two apart: a day it
// reports as 0 is unpublished. Such days are not stored (and stale 0 rows on
// them are removed), so they stay missing until npm publishes them.

import { NPMApiClient } from "../../npm-client";
import { delay } from "../../utils";

export const REFERENCE_PACKAGE = "react";

// npm's range endpoint caps a request at 18 months; stay well under.
const REFERENCE_CHUNK_DAYS = 365;

const fmt = (d: Date) => d.toISOString().split("T")[0];

export class UnpublishedDays {
  private checked = new Set<string>();
  private unpublished = new Set<string>();

  constructor(
    private client: NPMApiClient,
    private requestDelayMs: number
  ) {}

  /**
   * Unpublished days in [start, end] (UTC days, inclusive). Fetches the
   * reference package for any part of the range not checked yet in this run,
   * one request per REFERENCE_CHUNK_DAYS.
   */
  async between(start: Date, end: Date): Promise<Set<string>> {
    let chunkStart: Date | null = null;
    const ranges: Array<[Date, Date]> = [];
    for (const d = new Date(start); d <= end; d.setUTCDate(d.getUTCDate() + 1)) {
      if (this.checked.has(fmt(d))) {
        if (chunkStart) ranges.push([chunkStart, new Date(d.getTime() - 86400000)]);
        chunkStart = null;
      } else if (!chunkStart) {
        chunkStart = new Date(d);
      }
    }
    if (chunkStart) ranges.push([chunkStart, new Date(end)]);

    for (const [rangeStart, rangeEnd] of ranges) {
      for (let s = new Date(rangeStart); s <= rangeEnd; ) {
        const e = new Date(s);
        e.setUTCDate(e.getUTCDate() + REFERENCE_CHUNK_DAYS - 1);
        const chunkEnd = e > rangeEnd ? rangeEnd : e;
        await delay(this.requestDelayMs);
        const res = await this.client.download({
          startDate: [s.getUTCFullYear(), s.getUTCMonth() + 1, s.getUTCDate()],
          endDate: [chunkEnd.getUTCFullYear(), chunkEnd.getUTCMonth() + 1, chunkEnd.getUTCDate()],
          packageName: REFERENCE_PACKAGE,
        });
        const returned = new Set<string>();
        for (const { day, downloads } of res.downloads ?? []) {
          returned.add(day);
          if (downloads === 0) this.unpublished.add(day);
        }
        // A day missing from the response is not published either.
        for (const d = new Date(s); d <= chunkEnd; d.setUTCDate(d.getUTCDate() + 1)) {
          const key = fmt(d);
          if (!returned.has(key)) this.unpublished.add(key);
          this.checked.add(key);
        }
        s = new Date(chunkEnd);
        s.setUTCDate(s.getUTCDate() + 1);
      }
    }

    const out = new Set<string>();
    for (const d = new Date(start); d <= end; d.setUTCDate(d.getUTCDate() + 1)) {
      if (this.unpublished.has(fmt(d))) out.add(fmt(d));
    }
    return out;
  }
}

/**
 * Split npm's response into rows to store and days to treat as unpublished.
 * A 0 on an unpublished day is not a count; anything else is stored as is.
 */
export function partitionDownloads<T extends { date: Date; downloadCount: number }>(
  rows: T[],
  unpublished: Set<string>
): { store: T[]; unpublishedDates: string[] } {
  const store: T[] = [];
  const unpublishedDates: string[] = [];
  for (const row of rows) {
    const key = fmt(row.date);
    if (row.downloadCount === 0 && unpublished.has(key)) unpublishedDates.push(key);
    else store.push(row);
  }
  return { store, unpublishedDates };
}
