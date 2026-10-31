/** Project sightline budget around turns; trees are decoration, never collision.
 * Separate from recorded replay placement and obstacle tree/root mechanics. */
export const JUNCTION_TREE_CLEARANCE=48;
export function ambientTreeAllowed(distance:number,turns:readonly {distance:number}[]):boolean {
 return Number.isFinite(distance)&&!turns.some(t=>Math.abs(t.distance-distance)<JUNCTION_TREE_CLEARANCE);
}
