import { referenceTileDistance,referenceWorldDistance } from './referenceCoordinates';
import { REFERENCE_OPENING_TURNS } from './referenceRoute';
/** Fitted physical exit offset; old8 score-coordinate units placed the tower behind the camera too early. */
export const REFERENCE_EXIT_GATE_OFFSET=20;
/** BV1ypuKzPErT021/022: glyph columns remain ahead;023 passes their bases.
 * The first portal is fitted to those multi-frame projections, not the old periodic tile192.
 */
export const REFERENCE_STRAIGHT_GATES = [
  { tileDistance:204, distance:210, variant:'tower' as const, frames:[20,21,22,23] },
  { tileDistance:420, distance:426, variant:'tower' as const, frames:[48,49,50] },
  { tileDistance:1410, distance:1416, variant:'tower' as const, frames:[156,157,158] },
  { tileDistance:1572, distance:1578, variant:'tower' as const, frames:[174,175,176] },
  { tileDistance:2313, distance:2319, variant:'tower' as const, frames:[256,257,258] },
].map(gate=>({...gate,tileDistance:referenceTileDistance(gate.tileDistance),distance:referenceTileDistance(gate.tileDistance)+6}));
export function referenceStraightGate(tileDistance: number): 'tower' | null {
 return REFERENCE_STRAIGHT_GATES.find(g=>Math.abs(g.tileDistance-tileDistance)<.001)?.variant??null;
}

/** Reviewed prefix plus one96m visibility buffer; the buffer is a presentation
 * policy, not an assertion about unseen source geometry. Explicit pits still cut it.
 */
export function referenceFullWidthAt(distance: number): boolean {
 return distance>=0 && distance<=referenceWorldDistance(2380)+96;
}

/** Prevent a periodic low portal from duplicating a reviewed tall portal nearby. */
export function overlapsReferenceGate(tileDistance: number): boolean {
 return REFERENCE_STRAIGHT_GATES.some(g=>Math.abs(g.tileDistance-tileDistance)<=36)
   || REFERENCE_OPENING_TURNS.some(t=>t.gate==='exit'&&Math.abs(t.distance+REFERENCE_EXIT_GATE_OFFSET-(tileDistance+6))<=36);
}

/** Observed opening background trunks; positions are fitted to source005/006
 * and021/022, not recovered generator output. Variant1 is the native standalone
 * family default; exact source variant remains unverified. */
export const REFERENCE_OPENING_AMBIENT_TREES = [
 {tileDistance:84,side:1 as const,variant:0,frames:[5,6]},
 {tileDistance:444,side:1 as const,variant:0,frames:[21,22]},
];
export const REFERENCE_TREE_REVIEW_END=REFERENCE_OPENING_TURNS[2].distance;
/** null suppresses invented periodic trees inside the reviewed opening.
 * undefined leaves the unreviewed suffix's existing approximate policy. */
export function referenceAmbientTree(distance:number):typeof REFERENCE_OPENING_AMBIENT_TREES[number]|null|undefined {
 if(distance<0||distance>REFERENCE_TREE_REVIEW_END)return undefined;
 return REFERENCE_OPENING_AMBIENT_TREES.find(t=>Math.abs(t.tileDistance-distance)<.01)??null;
}
