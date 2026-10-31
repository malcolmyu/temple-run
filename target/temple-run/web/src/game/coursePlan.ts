import {branchRewardChoice} from './branchRewards';
import {CourseDirector,COURSE_RULE_VERSION,type BeatDecision} from './courseDirector';
import type { NativePathLevel } from './nativeThemePacing';
import { nativeObstacleEligible } from './nativeObstacleGate';
import { nativePathPacing, COURSE_GROUP_MIN_LENGTH } from './nativePathPacing';
import { NativeFastTurnState } from './nativeFastTurn';
import type { DefId } from './obstacles/catalog';
import { SeededRandom } from './obstacles/rng';
import {generateCourseOpening,historicalCourseFixture} from './courseOpening';
import {validateEncounterLayout} from './encounterSafety';
import {repeatActionSpacing,NORMAL_SAFETY_SPEED} from './actionSafety';
import {lateralTravelSeconds} from './lateralSafety';
export {MIN_LONG_GAP_SPEED} from './encounterSafety';
export interface CourseTurn {distance:number;direction:1|-1;junction:'corner'|'tee';}
export interface CourseObstacle {distance:number;defId:DefId;prefab:string;lane?:number;branch?:'left'|'right';}
export interface CourseSurface {kind:'stone'|'wood';from:number;to:number;level?:NativePathLevel;}
export interface CourseNarrow {from:number;to:number;side:'left'|'right';}
export interface CourseBranch {from:number;to:number;riskyArm?:'left'|'right';}
export interface CourseFeature {kind:string;from:number;to:number;surface:'stone'|'wood';generatedAtProgress?:number;minTurnSpaces?:number;nativeStageKnown?:boolean;fastTurn?:boolean;extraObstacleAt?:number;combo?:'repeat'|'jump-slide'|'slide-jump'|'dodge-jump'|'dodge-slide';pathLevel?:NativePathLevel;themeRequestedAtProgress?:number;beatIntent?:BeatDecision['intent'];}
const STONE_FEATURES=['treeJump','treeTrip','treeSlide','flameTower','stonePedestal','pit','narrowSmall','narrowLong','branch','longGap'] as const;
/** Web course design, not recovered native generation weights.
 * Native constraints:12m grid, progress-dependent turn minimums, paired long-hole caps and support polygons.
 * Normal mode uses independent weighted beat selection; fixture retains coverage bags.
 * Jitter, weights/recovery beats and the120m grouped-geometry floor are web assumptions.
 */
export class CoursePlan {
 readonly rulesVersion=COURSE_RULE_VERSION;
 turnOffset=0;
 surfaceOffset=0;
 retainedFrom=0;
 readonly turns:CourseTurn[]=[];
 readonly obstacles:CourseObstacle[]=[];
 readonly surfaces:CourseSurface[]=[{kind:'stone',from:0,to:Infinity,level:2}];
 readonly narrows:CourseNarrow[]=[];
 readonly branches:CourseBranch[]=[];
 readonly features:CourseFeature[]=[];
 readonly rejectedEncounters:{from:number;to:number;kind:string;reasons:string[]}[]=[];
 private readonly rng:SeededRandom;
 private readonly pairRng:SeededRandom;
 private readonly narrowRng:SeededRandom;
 private readonly director:CourseDirector;
 private bag:string[]=[];
 private cliffBag:string[]=[];
 private blocks=0;
 private pendingThemes:{level:NativePathLevel;progress:number}[]=[];
 turnAt(index:number):CourseTurn|undefined {return this.turns[index-this.turnOffset];}
 /** Reclaim consumed history only; RNG/director state and unpublished tail stay intact.
  * Callers remap their obstacle/feature cursors by the returned prefix lengths. */
 compactBefore(distance:number):{obstacles:number;features:number}{
  if(!Number.isFinite(distance)||distance<=this.retainedFrom)return {obstacles:0,features:0};
  const remove=<T>(items:T[],old:(item:T)=>boolean,previous=0):number=>{
   let n=0;while(n<items.length&&old(items[n]))n++;
   n=Math.max(0,n-previous);if(n)items.splice(0,n);return n;
  };
  this.turnOffset+=remove(this.turns,t=>t.distance<distance,1);
  this.surfaceOffset+=remove(this.surfaces,s=>s.to<distance,1);
  const obstacles=remove(this.obstacles,o=>o.distance<distance-36);
  const features=remove(this.features,f=>f.to<distance,1);
  remove(this.narrows,n=>n.to<distance);remove(this.branches,b=>b.to<distance);
  this.retainedFrom=distance;return {obstacles,features};
 }

 requestTheme(level:NativePathLevel,progress:number):void {
  const previous=this.pendingThemes.at(-1)?.level??this.surfaces.at(-1)!.level??2;
  if(previous!==level)this.pendingThemes.push({level,progress});
 }
 extent=0;
 readonly coinStart:number;
 constructor(readonly seed:number,initialExtent=6000,readonly opening:'generated'|'fixture'='generated'){
  this.director=new CourseDirector(seed);
  this.rng=new SeededRandom(seed^0x636f7572);this.pairRng=new SeededRandom(seed^0x70616972);this.narrowRng=new SeededRandom(seed^0x6e617272);
  this.coinStart=opening==='generated'?0:489;
  const plan=opening==='generated'?generateCourseOpening(seed):historicalCourseFixture();
  for(const feature of plan.features){
   const reasons=validateEncounterLayout({...feature,obstacles:plan.obstacles.filter(o=>o.distance>=feature.from&&o.distance<feature.to),narrows:[],branches:[]});
   if(reasons.length){
    this.rejectedEncounters.push({from:feature.from,to:feature.to,kind:feature.kind,reasons});
    plan.obstacles=plan.obstacles.filter(o=>o.distance<feature.from||o.distance>=feature.to);feature.kind='recovery';
   }
  }
  this.turns.push(...plan.turns);this.obstacles.push(...plan.obstacles);
  this.features.push(...plan.features);this.extent=plan.extent;
  for(const f of plan.features)this.director.record(f.kind);
  this.ensureThrough(initialExtent);
 }
 private stoneFeature(at:number,progress?:number):string {
  if(!this.bag.length){this.bag=[...STONE_FEATURES];for(let i=this.bag.length-1;i>0;i--){const j=this.rng.int(i+1);[this.bag[i],this.bag[j]]=[this.bag[j],this.bag[i]];}}
  const feature=this.bag.shift()!;
  if(progress!==undefined&&((progress<500&&(feature==='treeSlide'||feature==='flameTower'))||(progress<1500&&(feature==='narrowSmall'||feature==='narrowLong')))){this.bag.push(feature);return 'pit';}
  if(feature==='longGap'&&at<1400){this.bag.push(feature);return 'pit';}
  return feature;
 }
 // Native prefab availability; shuffled coverage/weights remain a web assumption.
 private cliffFeature():string {
  if(!this.cliffBag.length){this.cliffBag=['treeJump','treeTrip','treeSlide','cliffGap','cliffStraight'];for(let i=this.cliffBag.length-1;i>0;i--){const j=this.rng.int(i+1);[this.cliffBag[i],this.cliffBag[j]]=[this.cliffBag[j],this.cliffBag[i]];}}
  return this.cliffBag.shift()!;
 }
 ensureThrough(distance:number,progress?:number,fastTurn=false):void {
  while(this.extent<distance){
   const requested=this.pendingThemes[0];
   const transition=Boolean(requested)||progress===undefined&&!fastTurn&&this.blocks%4===3;
   const fast=fastTurn&&!transition;
   const mode=new NativeFastTurnState();mode.active=fast;
   const pacing=progress===undefined?null:mode.apply(nativePathPacing(progress));
   //48m fast floor and obstacle-free groups are web safety adapters, not native length weights.
   const minimum=pacing?Math.max(fast?48:COURSE_GROUP_MIN_LENGTH,pacing.minTurnSpaces*12):144;
   const from=this.extent,length=minimum+this.rng.int(3)*(fast?12:24);
   let to=from+length;
   let mid=12*Math.round((from+length/2)/12);
   let surface=this.surfaces.at(-1)!.kind;
   let level=this.surfaces.at(-1)!.level??(surface==='wood'?1:2);
   let kind:string;
   let beat:BeatDecision|undefined;
   if(fast)kind='fastTurn';
   else if(transition){
    const boundary=mid;
    this.surfaces.at(-1)!.to=boundary;
    level=requested?.level??(surface==='stone'?1:2);
    surface=level===1?'wood':'stone';
    this.surfaces.push({kind:surface,from:boundary,to:Infinity,level});
    if(requested)this.pendingThemes.shift();
    kind='transition';
   }else if(this.opening==='generated'){beat=this.director.choose(level,progress??2000,mid);kind=beat.kind;}
   else kind=surface==='wood'?(this.rng.int(2)===0?'plankPit':'plankBeam'):level===3?this.cliffFeature():this.stoneFeature(mid,progress);
   // Native compatibility permits repeated long-narrow body tiles. The three
   // equally likely 36/48/60m variants are web pacing policy, not native weights.
   const narrowBodyTiles=kind==='narrowLong'&&this.opening==='generated'?1+this.narrowRng.int(3):1;
   if(kind==='narrowSmall'||kind==='narrowLong'){
    // Keep the mechanic: allocate a draft approach/exit instead of rejecting
    // short groups. No already-published turn is moved.
    const half=kind==='narrowLong'?18:6;
    const reserve=NORMAL_SAFETY_SPEED*lateralTravelSeconds(1,0);
    mid=Math.max(mid,12*Math.ceil((from+half+reserve)/12));
    to+=12*Math.ceil(Math.max(0,mid+(kind==='narrowLong'?12*narrowBodyTiles+6:half)+reserve-to)/12);
   }
   if(kind==='branch'&&this.opening==='generated'&&(progress??2000)>=1000){
    mid=Math.max(mid,from+96);to=Math.max(to,mid+120);
   }
   const obstacleStart=this.obstacles.length,narrowStart=this.narrows.length,branchStart=this.branches.length;
   const add=(defId:DefId,prefab:string,at=mid,lane?:number)=>this.obstacles.push({defId,prefab,distance:at,lane});
   const right=this.rng.int(2)===0;
   switch(kind){
    case 'transition':break;
    case 'treeJump':add('treeJump',right?'tree-jump-right':'tree-jump-left');break;
    case 'treeTrip':add('treeTrip',right?'tree-trip-right':'tree-trip-left');break;
    case 'treeSlide':add('treeSlide',level===3?'cliff-tree-slide':'tree-slide');break;
    case 'flameTower':add('flameTower','flame-tower');break;
    case 'stonePedestal':add('stonePedestal','stone-pedestal',mid,this.rng.int(3));break;
    case 'fireWall':add('fireWall','fire-wall');break;
    case 'pit':add('pit','pit');break;
    case 'plankPit':add('plankPit','plank-pit');break;
    case 'plankBeam':add('plankBeam','plank-beam');break;
    case 'cliffGap':add('cliffGapA','cliff-gap-a',mid-12);add('cliffGapB','cliff-gap-b',mid);break;
    case 'longGap':add('pitLongB','pit-long-b',mid-12);add('pitLongA','pit-long-a',mid);break;
    case 'narrowSmall':{
     add(right?'narrowBeamRight':'narrowBeamLeft',right?'narrow-beam-right':'narrow-beam-left');
     this.narrows.push({from:mid-6,to:mid+6,side:right?'left':'right'});break;
    }
    case 'narrowLong':{
     add(right?'narrowWallRightB':'narrowWallLeftB',right?'narrow-wall-right-b':'narrow-wall-left-b',mid-12);
     for(let i=0;i<narrowBodyTiles;i++)add(right?'narrowWallRight':'narrowWallLeft',right?'narrow-wall-right':'narrow-wall-left',mid+i*12);
     add(right?'narrowWallRightA':'narrowWallLeftA',right?'narrow-wall-right-a':'narrow-wall-left-a',mid+narrowBodyTiles*12);
     this.narrows.push({from:mid-18,to:mid+narrowBodyTiles*12+6,side:right?'left':'right'});break;
    }
    case 'branch':{
     if(this.opening==='generated'&&(progress??2000)>=1000){
      const span={from:mid-54,to:mid+78};
      const riskyArm=branchRewardChoice(this.seed,span.from).special;
      this.branches.push({...span,riskyArm});
      this.obstacles.push({defId:'fireWall',prefab:'branch-fire-wall',distance:mid,branch:riskyArm});
     }else this.branches.push({from:mid-18,to:mid+18});
     break;
    }
   }
   // Web candidate adapter: reserve motion recovery and corner clearance.
   // Candidate25% is not a native weight;spacing comes from actionSafety.
   let extraObstacleAt:number|undefined;
   let combo:CourseFeature['combo'];
   const repeatable=['treeJump','treeTrip','treeSlide','flameTower','plankBeam',...(this.opening==='generated'?['stonePedestal']:[])];
   const first=this.obstacles.at(-1),candidate=mid+(first?repeatActionSpacing(first.defId):36);
   if(pacing&&!fast&&(beat?.allowCombination??true)&&repeatable.includes(kind)&&first?.distance===mid&&this.pairRng.int(4)===0
     &&nativeObstacleEligible(Math.floor((candidate-from)/12),1,3,pacing.minObstacleSpaces,pacing.doubleObstaclePercent,()=>this.pairRng.int(1000))){
    // Reserve the unpublished exit tail instead of deleting all combinations
    // when the longer recovery spacing does not fit the original group.
    to+=12*Math.ceil(Math.max(0,candidate+36-to)/12);
    let second={...first,distance:candidate};combo='repeat';
    // Web encounter variety,not recovered native pairing probabilities.
    // Keep fixture routes stable; wood has its own repeated beam grammar.
    if(first.defId==='stonePedestal'){
     first.lane=1; // clear central dodge cue; either side remains a legal solution.
     const slide=this.director.hasPractised('treeSlide')&&this.pairRng.int(2)===0;
     second={...second,defId:slide?'treeSlide':'treeJump',lane:1,prefab:slide?'tree-slide':right?'tree-jump-right':'tree-jump-left'};
     combo=slide?'dodge-slide':'dodge-jump';
    }else if(this.opening==='generated'&&surface==='stone'&&this.pairRng.int(2)===0){
     if((first.defId==='treeJump'||first.defId==='treeTrip')&&this.director.hasPractised('treeSlide')){
      second={...second,defId:'treeSlide',prefab:level===3?'cliff-tree-slide':right?'tree-slide-right':'tree-slide-left'};combo='jump-slide';
     }else if(first.defId==='treeSlide'&&this.director.hasPractised('treeJump')){
      second={...second,defId:'treeJump',prefab:right?'tree-jump-right':'tree-jump-left'};combo='slide-jump';
     }
    }
    this.obstacles.push(second);extraObstacleAt=candidate;
   }
   const reasons=validateEncounterLayout({from,to,fastTurn:fast,obstacles:this.obstacles.slice(obstacleStart),narrows:this.narrows.slice(narrowStart),branches:this.branches.slice(branchStart)});
   if(reasons.length){
    this.rejectedEncounters.push({from,to,kind,reasons});if(this.rejectedEncounters.length>128)this.rejectedEncounters.shift();
    this.obstacles.length=obstacleStart;this.narrows.length=narrowStart;this.branches.length=branchStart;
    kind='recovery';extraObstacleAt=undefined;combo=undefined;
   }
   if(this.opening==='generated')this.director.record(kind);
   this.features.push({kind,from,to,surface,pathLevel:level,...(beat?{beatIntent:beat.intent}:{}),...(requested?{themeRequestedAtProgress:requested.progress}:{}),...(extraObstacleAt!==undefined?{extraObstacleAt,combo}:{}),...(pacing?{generatedAtProgress:progress,minTurnSpaces:pacing.minTurnSpaces,nativeStageKnown:pacing.known,fastTurn:fast}:{})});
   this.turns.push({distance:to,direction:right?1:-1,junction:this.rng.int(4)===0?'tee':'corner'});
   this.extent=to;this.blocks++;
  }
 }
}
let active:CoursePlan|null=null;
export function setActiveCourse(course:CoursePlan|null):void {active=course;}
export const activeCourse=():CoursePlan|null=>active;
