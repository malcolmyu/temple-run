import { TILE } from './config';
import type { TrackPath } from './path';

export type TerrainKind = 'temple' | 'bridge' | 'hall' | 'cliff';

const tileIndex = (distance: number): number => Math.floor((distance + 9) / TILE);

/** Muddy plank bridge over the gorge, every 36 tiles for 3 tiles. */
export function isBridgeTile(distance: number, path?: TrackPath): boolean {
  const index = tileIndex(distance);
  return ((index % 36) + 36) % 36 < 3 && !(path?.nearTurn(distance, 24) ?? false);
}

/** Colonnade hall, every 60 tiles for 3 tiles. */
export function isHallTile(distance: number, path?: TrackPath): boolean {
  if (isBridgeTile(distance, path) || isCliffTile(distance, path)) return false;
  const index = tileIndex(distance);
  const m = ((index % 60) + 60) % 60;
  return m >= 20 && m < 23 && !(path?.nearTurn(distance, 26) ?? false);
}

/** Broken canyon stretch (decorative abyss edges), every 48 tiles. */
export function isCliffTile(distance: number, path?: TrackPath): boolean {
  if (isBridgeTile(distance, path)) return false;
  const index = tileIndex(distance);
  const m = ((index % 48) + 48) % 48;
  return m >= 6 && m < 10 && !(path?.nearTurn(distance, 24) ?? false);
}

export function terrainAt(distance: number, path?: TrackPath): TerrainKind {
  if (isBridgeTile(distance, path)) return 'bridge';
  if (isHallTile(distance, path)) return 'hall';
  if (isCliffTile(distance, path)) return 'cliff';
  return 'temple';
}

export interface NarrowSection {
  from: number;
  to: number;
  keep: number;
  startIdx: number;
}

/**
 * Single-lane stretch: the other lanes have collapsed into the canyon. Starts at 120 m,
 * repeats every 10 tiles for 3 tiles. A lane is dropped for good, so stepping off the
 * surviving lane is a fall.
 */
export function narrowAt(distance: number, path?: TrackPath): NarrowSection | null {
  if (distance < 120) return null;
  const index = tileIndex(distance);
  if (index < 20) return null;
  const phase = ((index % 10) + 10) % 10;
  if (phase >= 3) return null;
  const startIdx = index - phase;
  const from = startIdx * TILE - 9;
  const to = from + 36;
  if (isBridgeTile(from + 1, path) || isCliffTile(from + 1, path) || isHallTile(from + 1, path)) return null;
  if (path?.nearTurn(from, 26) || path?.nearTurn(to, 26)) return null;
  const keep = ((startIdx * 7 + 3) % 3 + 3) % 3;
  return { from, to, keep, startIdx };
}
