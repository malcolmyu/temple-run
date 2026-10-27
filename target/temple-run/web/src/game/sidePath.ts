import { TILE } from './config';
import type { TrackPath } from './path';
import { narrowAt } from './terrain';

export interface SidePathSection {
  from: number;
  to: number;
  startIdx: number;
  first: boolean;
  last: boolean;
  /** Both outer lanes survive; the middle is a broken gap. */
  safe: readonly number[];
}

/**
 * A left/right fork: both outer lanes are walkable, the centre is a broken gap.
 * It is a gameplay lane split, not a separate graph branch yet; this gives the
 * visual/route choice the reference video shows without replacing TrackPath.
 */
export function sidePathAt(distance: number, path?: TrackPath): SidePathSection | null {
  const index = Math.floor((distance + 9) / TILE);
  if (index < 12) return null;
  const phase = ((index % 24) + 24) % 24;
  if (phase !== 15 && phase !== 16) return null;
  const startIdx = index - (phase - 15);
  const from = startIdx * TILE - 9;
  const to = from + TILE * 2;
  if (path?.nearTurn(from, 24) || path?.nearTurn(to, 24)) return null;
  if (narrowAt(from + 1, path)) return null;
  return { from, to, startIdx, first: phase === 15, last: phase === 16, safe: [0, 2] };
}
