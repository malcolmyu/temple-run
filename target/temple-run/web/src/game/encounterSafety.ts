import {nativeJumpVelocity,stepNativeJump} from './nativeMotion';
import type {CourseObstacle,CourseNarrow,CourseBranch} from './coursePlan';
import {lateralSequenceIssues} from './lateralSafety';
import {actionSequenceIssues} from './actionSafety';

/** Native motion/22m exported hole;3m approach+1m landing are web safety budgets.
 * Count only steps with positive airborne height,never the landing step. */
export const LONG_GAP_REQUIRED_DISTANCE=26;
export const MIN_LONG_GAP_SPEED=38;
export function conservativeJumpDistance(speed:number):number {
 if(!Number.isFinite(speed)||speed<=0)return 0;
 return Math.min(...[1/60,.025,.05].map(dt=>{
  let y=0,v=nativeJumpVelocity(speed),distance=0;
  for(let i=0;i<240;i++){
   const next=stepNativeJump(y,v,dt);if(!next.airborne)break;
   distance+=speed*dt;y=next.y;v=next.v;
  }
  return distance;
 }));
}
export function longGapSafety(speed:number){
 const available=conservativeJumpDistance(speed);
 return {allowed:available>=LONG_GAP_REQUIRED_DISTANCE,reason:available>=LONG_GAP_REQUIRED_DISTANCE?null:'jump-span-insufficient' as const,baselineSpeed:speed,available,required:LONG_GAP_REQUIRED_DISTANCE};
}

export interface EncounterLayout {from:number;to:number;fastTurn?:boolean;obstacles:readonly CourseObstacle[];narrows:readonly CourseNarrow[];branches:readonly CourseBranch[];}
/** Structural preflight before publishing a generated group;not a complete path
 * solver. Temporal jump capability is checked again against the actual runner. */
export function validateEncounterLayout(group:EncounterLayout):string[]{
 const reasons=new Set<string>();
 if(!Number.isFinite(group.from)||!Number.isFinite(group.to)||group.to<=group.from)return ['invalid-span'];
 if(group.fastTurn&&(group.obstacles.length||group.narrows.length||group.branches.length))reasons.add('fast-turn-conflict');
 for(const reason of lateralSequenceIssues(group.obstacles,group.narrows,group.from,group.to))reasons.add(reason);
 for(const reason of actionSequenceIssues(group.obstacles,group.from,group.to))reasons.add(reason);
 for(const obstacle of group.obstacles){
  if(!Number.isFinite(obstacle.distance)||obstacle.distance<group.from+36||obstacle.distance>group.to-36)reasons.add('junction-clearance');
  if(obstacle.lane!==undefined&&(!Number.isInteger(obstacle.lane)||obstacle.lane<0||obstacle.lane>2))reasons.add('invalid-lane');
  const pair=obstacle.defId==='pitLongB'?['pitLongA',12]:obstacle.defId==='pitLongA'?['pitLongB',-12]:obstacle.defId==='cliffGapA'?['cliffGapB',12]:obstacle.defId==='cliffGapB'?['cliffGapA',-12]:null;
  if(pair&&!group.obstacles.some(o=>o.defId===pair[0]&&o.distance===obstacle.distance+Number(pair[1])))reasons.add('incomplete-gap-pair');
 }
 for(const span of [...group.narrows,...group.branches]){
  if(!Number.isFinite(span.from)||!Number.isFinite(span.to)||span.to<=span.from||span.from<group.from+6||span.to>group.to-6)reasons.add('support-span-outside-group');
 }
 for(const branch of group.branches){
  if(group.obstacles.some(o=>o.distance>=branch.from-6&&o.distance<=branch.to+6)||group.narrows.some(n=>n.from<branch.to&&n.to>branch.from))reasons.add('branch-support-conflict');
 }
 return [...reasons];
}
