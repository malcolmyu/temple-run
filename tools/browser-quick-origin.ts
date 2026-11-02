/** Real startup seam: the native entrance normally owns cell0. A quick scene
 * without that mesh must provide an actual rendered origin tile, not just
 * simulation ground. Run before leaving the opening. */
export function inspectQuickOrigin(){
 const g=window.__templeGame,s=g.state(),origin=g.roadTiles().find((t:{distance:number})=>t.distance===0);
 return{passed:s.startup.quick&&!!origin&&g.runner().rig,phase:s.phase,distance:s.distanceExact,quick:s.startup.quick,origin:origin??null,runnerPresent:g.runner().rig};
}
