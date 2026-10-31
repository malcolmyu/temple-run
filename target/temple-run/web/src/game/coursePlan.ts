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
export interface CourseObstacle {distance:number;defId:DefId;prefab:string;lane?:number;}
export interface CourseSurface {kind:'stone'|'wood';from:number;to:number;level?:NativePathLevel;}
export interface CourseNarrow {from:number;to:number;side:'left'|'right';}
export interface CourseBranch {from:number;to:number;}
export interface CourseFeature {kind:string;from:number;to:number;surface:'stone'|'wood';generatedAtProgress?:number;minTurnSpaces?:number;nativeStageKnown?:boolean;fastTurn?:boolean;extraObstacleAt?:number;combo?:'repeat'|'jump-slide'|'slide-jump'|'dodge-jump'|'dodge-slide';pathLevel?:NativePathLevel;themeRequestedAtProgress?:number;beatIntent?:BeatDecision['intent'];}
const STONE_FEATURES=['treeJump','treeTrip','treeSlide','flameTower','stonePedestal','pit','narrowSmall','narrowLong','branch','longGap'] as const;
/** Web course design, not recovered native generation weights.
 * Native constraints:12m grid, progress-dependent turn minimums, paired long-hole caps and support polygons.
 * Normal mode uses independent weighted beat selection; fixture retains coverage bags.
 * Jitter, weights/recovery beats and the120m grouped-geometry floor are web assumptions.
 */
export class CoursePlan {
 readonly rulesVersion=COURSE_RULE_VERSION;
 readonly turns:CourseTurn[]=[];
 readonly obstacles:CourseObstacle[]=[];
 readonly surfaces:CourseSurface[]=[{kind:'stone',from:0,to:Infinity,level:2}];
 readonly narrows:CourseNarrow[]=[];
 readonly branches:CourseBranch[]=[];
 readonly features:CourseFeature[]=[];
 readonly rejectedEncounters:{from:number;to:number;kind:string;reasons:string[]}[]=[];
 private readonly rng:SeededRandom;
 private readonly pairRng:SeededRandom;
 private readonly director:CourseDirector;
 private bag:string[]=[];
 private cliffBag:string[]=[];
 private blocks=0;
 private pendingThemes:{level:NativePathLevel;progress:number}[]=[];
 requestTheme(level:NativePathLevel,progress:number):void {
  const previous=this.pendingThemes.at(-1)?.level??this.surfaces.at(-1)!.level??2;
  if(previous!==level)this.pendingThemes.push({level,progress});
 }
 extent=0;
 readonly coinStart:number;
 constructor(readonly seed:number,initialExtent=6000,readonly opening:'generated'|'fixture'='generated'){
  this.director=new CourseDirector(seed);
  this.rng=new SeededRandom(seed^0x636f7572);this.pairRng=new SeededRandom(seed^0x70616972);
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
   if(kind==='narrowSmall'||kind==='narrowLong'){
    // Keep the mechanic: allocate a draft approach/exit instead of rejecting
    // short groups. No already-published turn is moved.
    const half=kind==='narrowLong'?18:6;
    const reserve=NORMAL_SAFETY_SPEED*lateralTravelSeconds(1,0);
    mid=Math.max(mid,12*Math.ceil((from+half+reserve)/12));
    to+=12*Math.ceil(Math.max(0,mid+half+reserve-to)/12);
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
     if(right){add('narrowWallRightB','narrow-wall-right-b',mid-12);add('narrowWallRight','narrow-wall-right');add('narrowWallRightA','narrow-wall-right-a',mid+12);}
     else{add('narrowWallLeftB','narrow-wall-left-b',mid-12);add('narrowWallLeft','narrow-wall-left');add('narrowWallLeftA','narrow-wall-left-a',mid+12);}
     this.narrows.push({from:mid-18,to:mid+18,side:right?'left':'right'});break;
    }
    case 'branch':this.branches.push({from:mid-18,to:mid+18});break;
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
