// Test script to verify date chunking logic
const CHUNK_SIZE = 365;

function normalizeDate(date) {
  const normalized = new Date(date);
  normalized.setUTCHours(0, 0, 0, 0);
  return normalized;
}

function getDateChunks(startDate, endDate) {
  const chunks = [];
  let currentStart = normalizeDate(startDate);
  const finalEndDate = normalizeDate(
    new Date(Math.min(endDate.getTime(), new Date().getTime()))
  );

  while (currentStart < finalEndDate) {
    // Create a new chunk with proper 365-day boundaries
    const chunkEnd = new Date(currentStart);
    chunkEnd.setUTCDate(chunkEnd.getUTCDate() + CHUNK_SIZE - 1);

    // Ensure we don't go past the final end date
    const actualEnd = chunkEnd > finalEndDate ? finalEndDate : chunkEnd;

    // Only add chunk if there's at least one day to process
    if (currentStart <= actualEnd) {
      chunks.push({
        start: new Date(currentStart),
        end: new Date(actualEnd),
      });
    }

    // Move to next chunk (start day after current chunk ends)
    currentStart = new Date(actualEnd);
    currentStart.setUTCDate(currentStart.getUTCDate() + 1);

    // Prevent infinite loop
    if (currentStart > finalEndDate) {
      break;
    }
  }

  return chunks;
}

// Test with @dydxprotocol/v4-client-js creation date
const packageCreationDate = new Date('2023-08-22T19:52:57.520Z');
const today = new Date();

console.log('=== Date Chunking Test ===');
console.log(`Package: @dydxprotocol/v4-client-js`);
console.log(`Creation Date: ${packageCreationDate.toISOString().split('T')[0]}`);
console.log(`Today: ${today.toISOString().split('T')[0]}`);

const chunks = getDateChunks(packageCreationDate, today);

console.log(`\nTotal Chunks: ${chunks.length}`);
console.log(`Expected Days: ${Math.floor((today.getTime() - packageCreationDate.getTime()) / (1000 * 60 * 60 * 24)) + 1}`);

let totalDays = 0;
chunks.forEach((chunk, index) => {
  const days = Math.floor((chunk.end.getTime() - chunk.start.getTime()) / (1000 * 60 * 60 * 24)) + 1;
  totalDays += days;
  console.log(`Chunk ${index + 1}: ${chunk.start.toISOString().split('T')[0]} to ${chunk.end.toISOString().split('T')[0]} (${days} days)`);
});

console.log(`\nTotal Days in Chunks: ${totalDays}`);
console.log(`Chunk Size Setting: ${CHUNK_SIZE} days`);
