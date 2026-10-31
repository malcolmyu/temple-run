import {LANES} from './config';
import {DEFS} from './obstacles/catalog';
import {collisionWouldHit} from './obstacles/collision';
import type {CourseObstacle,CourseNarrow} from './coursePlan';
import {NORMAL_SAFETY_SPEED,REACTION_SECONDS} from './actionSafety';

interface Corridor {from:number;to:number;lanes:number[];}
/** Keyboard lane damping is exp(-12t). Reserve .15m settling tolerance.
 * Reaction time/tolerance are web design budgets, not native generator rules. */
export function lateralTravelSeconds(from:number,to:number):number {
 const delta=Math.abs(LANES[from]-LANES[to]);
 return delta===0?0:REACTION_SECONDS+Math.log(delta/.15)/12;
}
/** Conservative corridor contract: hold one supported lane throughout each
 * overlapping hazard cluster. Does not search jumps across missing floor or
 * branch-local coordinates; branches retain their separate exclusion contract. */
export function lateralSequenceIssues(obstacles:readonly CourseObstacle[],narrows:readonly CourseNarrow[],from:number,to:number,speed=NORMAL_SAFETY_SPEED):string[]{
 const spans:Corridor[]=narrows.map(n=>({from:n.from,to:n.to,lanes:[0,1,2].filter(l=>n.side==='left'?LANES[l]<=.55:LANES[l]>=-.55)}));
 for(const o of obstacles){
  const def=DEFS[o.defId];
  if(def.action!=='dodge'&&!o.defId.startsWith('narrow'))continue;
  const start=o.distance+def.hitbox.z[0],end=o.distance+def.hitbox.z[1];
  const lanes=[0,1,2].filter(l=>{
   for(let d=start;d<=end+1e-8;d=Math.min(end,d+.25)){
    if(collisionWouldHit({def,lane:o.lane??1,distance:o.distance},{prevDistance:d,distance:d,laneIndex:l,side:LANES[l],jumpY:0,jumpV:0,slideRemaining:0,lastJumpAt:-Infinity,lastSlideAt:-Infinity,now:0,jumpWindow:0,slideWindow:0}))return false;
    if(d===end)break;
   }
   return true;
  });
  spans.push({from:start,to:end,lanes});
 }
 spans.sort((a,b)=>a.from-b.from);
 const clusters:Corridor[]=[];
 for(const s of spans){
  const last=clusters.at(-1);
  if(last&&s.from<=last.to){last.to=Math.max(last.to,s.to);last.lanes=last.lanes.filter(l=>s.lanes.includes(l));}
  else clusters.push({...s,lanes:[...s.lanes]});
 }
 let previous:Corridor={from,to:from,lanes:[1]};
 for(const next of [...clusters,{from:to,to,lanes:[1]}]){
  if(!next.lanes.length)return ['lateral-corridor-blocked'];
  const reachable=next.lanes.filter(b=>previous.lanes.some(a=>next.from-previous.to+1e-7>=speed*lateralTravelSeconds(a,b)));
  if(!reachable.length)return ['lateral-transfer-window'];
  previous={...next,lanes:reachable};
 }
 return [];
}
