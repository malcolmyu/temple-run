import { TILE } from './config';
import type { TrackPath } from './path';
import { surfaceAt } from './surface';

export type TerrainKind = 'temple' | 'bridge' | 'hall' | 'cliff' | 'anniversary';

const tileIndex = (distance: number): number => Math.floor((distance + 9) / TILE);

/** All terrain consumers share the reference surface boundaries. Turn proximity
 * must not change a wooden deck into stone or change its collision/audio rules.
 * Other asset families remain available to the renderer but have no evidenced
 * spawn intervals in this recording.
 */
export function terrainAt(distance: number, _path?: TrackPath): TerrainKind {
  const surface=surfaceAt(distance);
  return surface.kind==='wood'?'bridge':surface.level===3?'cliff':'temple';
}

function stoneSection(from: number, to: number): boolean {
  const section = surfaceAt(from);
  return section.kind === 'stone' && to <= section.to;
}

export interface NarrowSection {
  from: number;
  to: number;
  /** Which half of the road survived. The other half is an open cliff. */
  side: 'left' | 'right';
  /** Lanes on the surviving half (left: 0/1, right: 1/2). */
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
  // Short narrow (NarrowSmall): a single 12 m tile every 12 tiles. It uses the same
  // one-lane fall rule but ends before the player has time to relax.
  const short = ((index % 12) + 12) % 12;
  if (short === 6) {
    const from = index * TILE - 9;
    const to = from + TILE;
    if (!stoneSection(from, to)) return null;
    if (path?.nearTurn(from, 24) || path?.nearTurn(to, 24)) return null;
    const side: 'left' | 'right' = index % 2 === 0 ? 'left' : 'right';
    const safe = side === 'left' ? [0, 1] : [1, 2];
    return { from, to, side, safe, startIdx: index };
  }
  const phase = ((index % 8) + 8) % 8;
  if (phase >= 2) return null;
  const startIdx = index - phase;
  const from = startIdx * TILE - 9;
  const to = from + 24;
  if (!stoneSection(from, to)) return null;
  if (path?.nearTurn(from, 18) || path?.nearTurn(to, 18)) return null;
  const side: 'left' | 'right' = ((startIdx / 3) | 0) % 2 === 0 ? 'left' : 'right';
  const safe = side === 'left' ? [0, 1] : [1, 2];
  return { from, to, side, safe, startIdx };
}

/** Shared by visible half-road cuts and the runner's continuous foot position. */
export const NARROW_EDGE = 0.55;
export function offNarrowSurface(side: 'left' | 'right', x: number): boolean {
  return side === 'left' ? x > NARROW_EDGE : x < -NARROW_EDGE;
}
