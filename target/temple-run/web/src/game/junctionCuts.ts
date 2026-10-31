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
   if(from<3&&to>-4)cuts.push(['z',from,to]);
  }else if(Math.abs(direction)>.9){
   const a=direction*(delta+gap.interval[0]),b=direction*(delta+gap.interval[1]);
   const from=Math.min(a,b),to=Math.max(a,b);
   if(from<9.1&&to>-9.1)cuts.push(['x',from,to]);
  }
 }
 return cuts;
}
