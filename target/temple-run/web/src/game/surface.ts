import {nativeThemeCaps,transitionSupportOffsets} from './nativeThemeTransition';
import type {NativePathLevel} from './nativeThemePacing';
import { activeCourse } from './coursePlan';
import { referenceTileDistance } from './referenceCoordinates';
export type SurfaceKind = 'stone' | 'wood';

export interface SurfaceSection {
  kind: SurfaceKind;
  level?:1|2|3;
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
  const sections=activeCourse()?.surfaces??REFERENCE_SURFACES;
  const index = sections.findIndex(section => distance < section.to);
  const section = sections[index < 0 ? sections.length-1 : index];
  return {
    ...section,
    index: Math.max(0, index),
    first: section.from > 0 && distance >= section.from && distance - section.from < 12,
    last: distance >= 0 && Number.isFinite(section.to) && section.to - distance <= 12,
  };
}

const levelOfSurface=(s:{kind:SurfaceKind;level?:NativePathLevel}):NativePathLevel=>s.level??(s.kind==='wood'?1:2);
function capAt(distance:number):string|null {
 const sections=activeCourse()?.surfaces??REFERENCE_SURFACES;
 for(let i=1;i<sections.length;i++){
  const boundary=sections[i].from,pair=nativeThemeCaps(levelOfSurface(sections[i-1]),levelOfSurface(sections[i]));
  if(Math.abs(distance-(boundary-12))<.01&&pair.departure)return pair.departure;
  if(Math.abs(distance-boundary)<.01&&pair.arrival)return pair.arrival;
 }
 return null;
}
export function nativeTransitionAt(distance:number):'a'|'b'|null {
 const cap=capAt(distance);return cap==='stoneA'?'a':cap==='stoneB'?'b':null;
}
export function nativeCliffTransitionAt(distance:number):'a'|'b'|null {
 const cap=capAt(distance);return cap==='cliffA'?'a':cap==='cliffB'?'b':null;
}
export function nativeTransitionSupported(distance:number):boolean {
 const sections=activeCourse()?.surfaces??REFERENCE_SURFACES;
 for(let i=1;i<sections.length;i++){
  const b=sections[i].from,offsets=transitionSupportOffsets(levelOfSurface(sections[i-1]),levelOfSurface(sections[i]));
  if(distance>b+offsets.oldEnd&&distance<b+offsets.newStart)return false;
 }
 return true;
}
/** Retain the previous support height through a gap;switch at first new support. */
export function nativeGroundHeightAt(distance:number):number {
 const sections=activeCourse()?.surfaces??REFERENCE_SURFACES;
 let level=levelOfSurface(sections[0]);
 for(let i=1;i<sections.length;i++){
  const from=levelOfSurface(sections[i-1]),to=levelOfSurface(sections[i]);
  if(distance>=sections[i].from+transitionSupportOffsets(from,to).newStart)level=to;
 }
 return level===1?-3:level===3?3:0;
}
/** Existing plank exports add raw15.25; undo graphical normalization only. */
export const nativeMeshHeightAt=(distance:number):number=>surfaceAt(distance).kind==='wood'?-3.05:surfaceAt(distance).level===3?3:0;
