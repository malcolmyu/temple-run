import { TILE } from './config';
import type { TrackPath } from './path';

export type TerrainKind = 'temple' | 'bridge' | 'hall' | 'cliff' | 'anniversary';

const tileIndex = (distance: number): number => Math.floor((distance + 9) / TILE);

/** Muddy plank bridge over the gorge, every 36 tiles for 3 tiles. */
export function isBridgeTile(distance: number, path?: TrackPath): boolean {
  const index = tileIndex(distance);
  const m = ((index % 36) + 36) % 36;
  return m >= 12 && m < 15 && !(path?.nearTurn(distance, 24) ?? false);
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

/** Rare golden temple set-piece (anniversary_temple in the APK), every 48 tiles. */
export function isAnniversaryTile(distance: number, path?: TrackPath): boolean {
  if (isBridgeTile(distance, path) || isHallTile(distance, path)) return false;
  const index = tileIndex(distance);
  const m = ((index % 48) + 48) % 48;
  return m >= 40 && m < 43 && !(path?.nearTurn(distance, 24) ?? false);
}

export function terrainAt(distance: number, path?: TrackPath): TerrainKind {
  if (isBridgeTile(distance, path)) return 'bridge';
  if (isHallTile(distance, path)) return 'hall';
  if (isCliffTile(distance, path)) return 'cliff';
  if (isAnniversaryTile(distance, path)) return 'anniversary';
  return 'temple';
}

export interface NarrowSection {
  from: number;
  to: number;
  /** Which half of the road survived. The other half is an open cliff. */
  side: 'left' | 'right';
  /** Lanes that are on the surviving slab (left: 0, right: 2). */
  safe: readonly number[];
  startIdx: number;
}

/**
 * Half-road stretch: one side of the slab has collapsed into the canyon. Starts at 96 m,
 * repeats every 8 tiles for 3 tiles. The surviving half is 2 lanes wide; the outer lane on
 * the missing side is a fall, so the player must shift to the named side.
 */
export function narrowAt(distance: number, path?: TrackPath): NarrowSection | null {
  const index = tileIndex(distance);
  if (index < 8) return null;
  const phase = ((index % 8) + 8) % 8;
  if (phase >= 3) return null;
  const startIdx = index - phase;
  const from = startIdx * TILE - 9;
  const to = from + 36;
  if (isBridgeTile(from + 1, path) || isHallTile(from + 1, path) || isAnniversaryTile(from + 1, path)) return null;
  if (path?.nearTurn(from, 18) || path?.nearTurn(to, 18)) return null;
  const side: 'left' | 'right' = ((startIdx / 3) | 0) % 2 === 0 ? 'left' : 'right';
  const safe = side === 'left' ? [0] : [2];
  return { from, to, side, safe, startIdx };
}
