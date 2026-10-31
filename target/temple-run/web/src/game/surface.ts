import { referenceTileDistance } from './referenceCoordinates';
export type SurfaceKind = 'stone' | 'wood';

export interface SurfaceSection {
  kind: SurfaceKind;
  index: number;
  from: number;
  to: number;
  first: boolean;
  last: boolean;
}

/** Estimated boundaries from BV1ypuKzPErT's zero-coin HUD score / 20,
 * Converted to estimated physical boundaries from the sampled progress curve,
 * even though they are snapped to the current 12 m tile grid. They are not recovered Unity spawn rules.
 * The visible bridge entry/exit brackets are recorded in the reference analysis.
 * No repeated short surface cycle is supported by this recording.
 */
export const REFERENCE_SURFACES: ReadonlyArray<{ kind: SurfaceKind; from: number; to: number }> = ([
  { kind: 'stone', from: 0, to: 564 },
  { kind: 'wood', from: 564, to: 976 },
  { kind: 'stone', from: 976, to: 1908 },
  { kind: 'wood', from: 1908, to: 2172 },
  // Remain on the last observed surface beyond the video until more evidence exists.
  { kind: 'stone', from: 2172, to: Infinity },
] as const).map(section=>({...section,from:referenceTileDistance(section.from),to:referenceTileDistance(section.to)}));

export function surfaceAt(distance: number): SurfaceSection {
  const index = REFERENCE_SURFACES.findIndex(section => distance < section.to);
  const section = REFERENCE_SURFACES[index < 0 ? 4 : index];
  return {
    ...section,
    index: Math.max(0, index),
    first: section.from > 0 && distance >= section.from && distance - section.from < 12,
    last: distance >= 0 && Number.isFinite(section.to) && section.to - distance <= 12,
  };
}

/** Region2D ground is raw0 for stone, raw-15 for plank. */
export const nativeGroundHeightAt=(distance:number):number=>surfaceAt(distance).kind==='wood'?-3:0;
/** Existing plank exports add raw15.25; undo that graphical normalization. */
export const nativeMeshHeightAt=(distance:number):number=>surfaceAt(distance).kind==='wood'?-3.05:0;
