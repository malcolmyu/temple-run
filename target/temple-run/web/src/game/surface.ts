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

/** Transition cells replace the last stone cell before wood and the first
 * stone cell after wood. Placement follows the current fitted reference grid. */
export function nativeTransitionAt(distance:number):'a'|'b'|null {
 for(const section of activeCourse()?.surfaces??REFERENCE_SURFACES)if(section.kind==='wood'){
  if(Math.abs(distance-(section.from-12))<.01)return 'a';
  if(Math.abs(distance-section.to)<.01)return 'b';
 }
 return null;
}
/** Canonical Vert cliff caps:A ends cliff,B starts cliff. Direct wood links
 * retain the existing wood adapter until mixed native transitions are ported. */
export function nativeCliffTransitionAt(distance:number):'a'|'b'|null {
 const sections=activeCourse()?.surfaces;if(!sections)return null;
 for(let i=0;i<sections.length;i++){
  const s=sections[i];if(s.level!==3)continue;
  if(i>0&&sections[i-1].level===2&&Math.abs(distance-s.from)<.01)return 'b';
  if(sections[i+1]?.level===2&&Math.abs(distance-(s.to-12))<.01)return 'a';
 }
 return null;
}
export function nativeTransitionSupported(distance:number):boolean {
 const sections=activeCourse()?.surfaces??REFERENCE_SURFACES;
 if(sections.some(s=>s.kind==='wood'&&(distance>s.from-12&&distance<s.from-6||distance>s.to-6&&distance<s.to)))return false;
 if(activeCourse())for(let i=0;i<sections.length;i++){
  const s=sections[i] as SurfaceSection;if(s.level!==3)continue;
  if(i>0&&(sections[i-1] as SurfaceSection).level===2&&distance>s.from-6&&distance<s.from+1)return false;
  if((sections[i+1] as SurfaceSection|undefined)?.level===2&&distance>s.to-13&&distance<s.to-6)return false;
 }
 return true;
}
/** First plank region starts six metres before its centre; the exit cap's
 * stone support starts at its centre. Missing regions retain the previous level. */
export function nativeGroundHeightAt(distance:number):number {
 const sections=activeCourse()?.surfaces??REFERENCE_SURFACES;
 if(sections.some(s=>s.kind==='wood'&&distance>=s.from-6&&distance<s.to))return -3;
 if(activeCourse())for(let i=0;i<sections.length;i++){
  const s=sections[i] as SurfaceSection;if(s.level!==3)continue;
  const start=(sections[i-1] as SurfaceSection|undefined)?.level===2?s.from+1:s.from-6;
  const end=(sections[i+1] as SurfaceSection|undefined)?.level===2?s.to-6:s.to;
  if(distance>=start&&distance<end)return 3;
 }
 return 0;
}
/** Existing plank exports add raw15.25; undo graphical normalization only. */
export const nativeMeshHeightAt=(distance:number):number=>surfaceAt(distance).kind==='wood'?-3.05:surfaceAt(distance).level===3?3:0;
