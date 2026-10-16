import { getDateChunks, getMissingDateChunks } from '../src/tasks/npm/date-chunks';

const day = (s: string) => new Date(`${s}T00:00:00Z`);
const fmt = (ranges: { start: Date; end: Date }[]) =>
  ranges.map((r) => `${r.start.toISOString().slice(0, 10)}..${r.end.toISOString().slice(0, 10)}`);

function daysBetween(start: string, end: string): string[] {
  const out: string[] = [];
  for (let d = day(start); d <= day(end); d.setUTCDate(d.getUTCDate() + 1)) {
    out.push(d.toISOString().slice(0, 10));
  }
  return out;
}

describe('fetch-downloads date chunks', () => {
  beforeAll(() => {
    jest.useFakeTimers().setSystemTime(new Date('2026-09-29T05:00:00Z'));
  });
  afterAll(() => {
    jest.useRealTimers();
  });

  it('gives a one-day range its own chunk', () => {
    expect(fmt(getDateChunks(day('2026-01-10'), day('2026-01-10')))).toEqual([
      '2026-01-10..2026-01-10',
    ]);
  });

  it('never asks npm for today, and always re-fetches the last 30 days', () => {
    // Everything stored through yesterday: only the refresh window is fetched.
    const existing = new Set(daysBetween('2026-01-01', '2026-09-28'));
    expect(fmt(getMissingDateChunks(day('2026-01-01'), new Date(), existing))).toEqual([
      '2026-08-30..2026-09-28',
    ]);
  });

  it('fills an older one-day gap', () => {
    const existing = new Set(daysBetween('2026-01-01', '2026-09-28'));
    existing.delete('2026-03-15');
    expect(fmt(getMissingDateChunks(day('2026-01-01'), new Date(), existing))).toEqual([
      '2026-03-15..2026-03-15',
      '2026-08-30..2026-09-28',
    ]);
  });
});
