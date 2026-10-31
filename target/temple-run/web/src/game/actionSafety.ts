import {nativeJumpVelocity,stepNativeJump,nativeSlideDuration} from './nativeMotion';
import {DEFS,type DefId} from './obstacles/catalog';
import type {ObstacleDef} from './obstacles/types';

/** Web comfort/reaction policy,not recovered native generation constants. */
export const ACTION_SWITCH_SECONDS=.12;
export const REACTION_SECONDS=.75;
export const NORMAL_SAFETY_SPEED=42;
const SINGLE_ACTION_IDS=new Set<string>(['treeJump','treeTrip','treeSlide','flameTower','plankBeam','pit','plankPit']);
function halfWidth(id:DefId):number {const z=DEFS[id].hitbox.z;return Math.max(Math.abs(z[0]),Math.abs(z[1]));}
export function actionRecoverySeconds(id:DefId,speed=NORMAL_SAFETY_SPEED):number {
 if(!SINGLE_ACTION_IDS.has(id))return 0; // narrow paths,paired caps and dodging need separate support/lateral solvers.
 const def:ObstacleDef=DEFS[id];
 const jump=()=>Math.max(...[1/60,.025,.05].map(dt=>{
  let y=0,v=nativeJumpVelocity(speed),elapsed=0;
  for(let i=0;i<240;i++){const next=stepNativeJump(y,v,dt);elapsed+=dt;if(!next.airborne)break;y=next.y;v=next.v;}
  return elapsed;
 }));
 const duration=(action:string)=>action==='slide'?nativeSlideDuration(speed)+.05:jump();
 const options=[def.action,...(def.alternateAction?[def.alternateAction]:[])];
 return Math.min(...options.map(duration))+ACTION_SWITCH_SECONDS;
}
/** Reserve full recovery after the previous obstacle's trailing extent,then
 * a switch buffer and the next leading extent. Conservative design budget,
 * not a claim that tighter spacing is mathematically impossible. */
export function minimumActionSpacing(first:DefId,next:DefId,speed=NORMAL_SAFETY_SPEED):number {
 const seconds=actionRecoverySeconds(first,speed);
 return seconds?seconds*speed+halfWidth(first)+halfWidth(next):0;
}
export function repeatActionSpacing(id:DefId):number {
 return Math.max(36,12*Math.ceil(minimumActionSpacing(id,id)/12));
}
export function actionSequenceIssues(obstacles:readonly {defId:DefId;distance:number}[],from:number,to:number,speed=NORMAL_SAFETY_SPEED):string[]{
 const issues=new Set<string>(),actions=obstacles.filter(o=>SINGLE_ACTION_IDS.has(o.defId)).sort((a,b)=>a.distance-b.distance);
 for(const o of actions){
  const window=speed*REACTION_SECONDS+halfWidth(o.defId);
  if(o.distance-from<window||to-o.distance<window)issues.add('turn-reaction-window');
 }
 for(let i=1;i<actions.length;i++){
  const previous=actions[i-1],next=actions[i];
  if(next.distance-previous.distance<minimumActionSpacing(previous.defId,next.defId,speed))issues.add('action-recovery-window');
 }
 return [...issues];
}
