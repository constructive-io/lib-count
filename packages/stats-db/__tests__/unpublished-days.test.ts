import { UnpublishedDays, partitionDownloads } from '../src/tasks/npm/unpublished-days';

const day = (s: string) => new Date(`${s}T00:00:00Z`);

describe('partitionDownloads', () => {
  it('drops a 0 on an unpublished day and keeps every other row', () => {
    const rows = [
      { date: day('2026-10-12'), downloadCount: 259236 },
      { date: day('2026-10-13'), downloadCount: 0 }, // npm outage
      { date: day('2026-10-16'), downloadCount: 0 }, // real zero on a published day
      { date: day('2026-10-17'), downloadCount: 5 },
    ];
    const { store, unpublishedDates } = partitionDownloads(rows, new Set(['2026-10-13']));
    expect(store.map((r) => r.date.toISOString().slice(0, 10))).toEqual([
      '2026-10-12',
      '2026-10-16',
      '2026-10-17',
    ]);
    expect(unpublishedDates).toEqual(['2026-10-13']);
  });

  it('keeps a real count even on a day the reference package missed', () => {
    const { store, unpublishedDates } = partitionDownloads(
      [{ date: day('2026-10-13'), downloadCount: 12 }],
      new Set(['2026-10-13'])
    );
    expect(store).toHaveLength(1);
    expect(unpublishedDates).toEqual([]);
  });
});

describe('UnpublishedDays', () => {
  const reference = (days: Record<string, number>) => {
    const calls: string[] = [];
    const client = {
      download: async ({ startDate, endDate }: any) => {
        const s = day(startDate.map((n: number) => String(n).padStart(2, '0')).join('-'));
        const e = day(endDate.map((n: number) => String(n).padStart(2, '0')).join('-'));
        calls.push(`${s.toISOString().slice(0, 10)}..${e.toISOString().slice(0, 10)}`);
        const downloads = [];
        for (const d = new Date(s); d <= e; d.setUTCDate(d.getUTCDate() + 1)) {
          const k = d.toISOString().slice(0, 10);
          if (k in days) downloads.push({ day: k, downloads: days[k] });
        }
        return { downloads };
      },
    };
    return { client: client as any, calls };
  };

  it('flags zero and missing days, and caches what it has checked', async () => {
    const { client, calls } = reference({
      '2026-10-12': 35000000,
      '2026-10-13': 0,
      // 2026-10-14 absent from the response
      '2026-10-15': 36000000,
    });
    const checker = new UnpublishedDays(client, 0);
    const first = await checker.between(day('2026-10-12'), day('2026-10-15'));
    expect([...first].sort()).toEqual(['2026-10-13', '2026-10-14']);
    await checker.between(day('2026-10-13'), day('2026-10-14'));
    expect(calls).toEqual(['2026-10-12..2026-10-15']); // second lookup hit the cache
  });
});
