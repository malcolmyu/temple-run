import {SeededRandom} from './obstacles/rng';
import type {NativePathLevel} from './nativeThemePacing';
export const COURSE_RULE_VERSION='beats-v5';
/** Project pacing policy; weights/cooldowns are not recovered native values. */
const THEMES:Record<NativePathLevel,readonly string[]>={
 1:['plankPit','plankBeam'],
 2:['treeJump','treeTrip','treeSlide','flameTower','fireWall','stonePedestal','pit','narrowSmall','narrowLong','branch','longGap'],
 3:['treeJump','treeTrip','treeSlide','cliffGap','cliffStraight'],
};
export interface BeatDecision {kind:string;intent:'recovery'|'single'|'practised';allowCombination:boolean;}
export class CourseDirector {
 private rng:SeededRandom;
 private seen=new Map<string,number>();
 private recent:string[]=[];
 private pressure=0;
 constructor(seed:number){this.rng=new SeededRandom(seed^0x62656174);}
 record(kind:string):void {
  if(['recovery','transition','fastTurn','cliffStraight'].includes(kind)){this.pressure=0;return;}
  this.pressure++;this.seen.set(kind,(this.seen.get(kind)??0)+1);
  this.recent.push(kind);if(this.recent.length>2)this.recent.shift();
 }
 hasPractised(kind:string):boolean{return (this.seen.get(kind)??0)>0;}
 choose(level:NativePathLevel,progress:number,at:number):BeatDecision {
  if(this.pressure>=3)return {kind:'recovery',intent:'recovery',allowCombination:false};
  const eligible=THEMES[level].filter(k=>{
   if(progress<1000&&k==='fireWall')return false;
   if(progress<500&&['treeSlide','flameTower'].includes(k))return false;
   if(progress<1500&&['narrowSmall','narrowLong'].includes(k))return false;
   return k!=='longGap'||at>=1400;
  });
  // Two-item wood pool still alternates: relax oldest cooldown only if needed.
  let candidates=eligible.filter(k=>!this.recent.includes(k));
  if(!candidates.length)candidates=eligible.filter(k=>k!==this.recent.at(-1));
  if(!candidates.length)candidates=eligible;
  const weights=candidates.map(k=>3/(1+(this.seen.get(k)??0)));
  let roll=this.rng.next()*weights.reduce((a,b)=>a+b,0),kind=candidates.at(-1)!;
  for(let i=0;i<candidates.length;i++){roll-=weights[i];if(roll<0){kind=candidates[i];break;}}
  const practised=(this.seen.get(kind)??0)>0;
  return {kind,intent:practised?'practised':'single',allowCombination:practised&&progress>=2000};
 }
}
