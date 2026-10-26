export type SurfaceKind = 'stone' | 'wood';

export interface SurfaceSection {
  kind: SurfaceKind;
  index: number;
  from: number;
  to: number;
  first: boolean;
  last: boolean;
}

/**
 * Long surface runs, not per-tile decoration. A stone causeway lasts 168 m, then a
 * 144 m plank bridge, then stone again. Boundaries are multiples of the 12 m tile so
 * a cap tile can be rebuilt without cutting the tile in half.
 */
const PATTERN: ReadonlyArray<{ kind: SurfaceKind; length: number }> = [
  { kind: 'stone', length: 168 },
  { kind: 'wood', length: 144 },
  { kind: 'stone', length: 144 },
  { kind: 'wood', length: 168 },
];
const TOTAL = PATTERN.reduce((sum, part) => sum + part.length, 0);

export function surfaceAt(distance: number): SurfaceSection {
  const wrapped = ((distance % TOTAL) + TOTAL) % TOTAL;
  let start = 0;
  for (let i = 0; i < PATTERN.length; i++) {
    const part = PATTERN[i];
    const end = start + part.length;
    if (wrapped < end || i === PATTERN.length - 1) {
      return {
        kind: part.kind,
        index: i,
        from: start,
        to: end,
        first: wrapped - start < 12,
        last: end - wrapped <= 12,
      };
    }
    start = end;
  }
  return { kind: 'stone', index: 0, from: 0, to: 168, first: true, last: false };
}
