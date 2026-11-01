import type { TrackPath } from './path';
export type SurfaceCut = [axis:'x'|'z',from:number,to:number,span?:readonly[number,number]];
export interface GapSurface { distance:number; interval:readonly[number,number] }
/** Junction local Z follows the incoming road; outgoing left/right arms follow local X. */
export function junctionGapCuts(at:number,path:TrackPath,gaps:readonly GapSurface[]):SurfaceCut[]{
 const incoming=path.at(at-.01).heading,outgoing=path.at(at+.01).heading;
 const direction=-Math.sin(outgoing-incoming);
 const next=path.segments.find(s=>s.start>at+.01)?.start??Infinity;
 const cuts:SurfaceCut[]=[];
 for(const gap of gaps){
  const delta=gap.distance-at;
  if(Math.abs(delta)>24 || gap.distance>=next)continue;
  if(delta<0){
   const from=-delta-gap.interval[1],to=-delta-gap.interval[0];
   if(from<6.1&&to>-4)cuts.push(['z',from,to]);
  }else if(Math.abs(direction)>.9){
   const a=direction*(delta+gap.interval[0]),b=direction*(delta+gap.interval[1]);
   const from=Math.min(a,b),to=Math.max(a,b);
   if(from<9.1&&to>-9.1)cuts.push(['x',from,to]);
  }
 }
 return cuts;
}

/** Native T stem reaches six metres back along the incoming road. Trim the
 * adjoining straight, rather than cutting away the authored platform stem.
 */
export function tJunctionApproachCut(tileDistance:number,at:number):SurfaceCut|null {
 if(tileDistance>=at||tileDistance+6<=at-6)return null;
 return ['z',-100,tileDistance-(at-6)];
}

/** The authored crossbar plus short native arms owns nine metres on either exit. */
export function tJunctionExitCut(tileDistance:number,at:number):SurfaceCut|null {
 if(tileDistance<=at||tileDistance-6>=at+9)return null;
 return ['z',tileDistance-(at+9),100];
}
