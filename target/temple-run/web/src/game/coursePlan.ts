import { nativePathPacing, COURSE_GROUP_MIN_LENGTH } from './nativePathPacing';
import type { DefId } from './obstacles/catalog';
import { SeededRandom } from './obstacles/rng';
export interface CourseTurn {distance:number;direction:1|-1;junction:'corner'|'tee';}
export interface CourseObstacle {distance:number;defId:DefId;prefab:string;lane?:number;}
export interface CourseSurface {kind:'stone'|'wood';from:number;to:number;}
export interface CourseNarrow {from:number;to:number;side:'left'|'right';}
export interface CourseBranch {from:number;to:number;}
export interface CourseFeature {kind:string;from:number;to:number;surface:'stone'|'wood';generatedAtProgress?:number;minTurnSpaces?:number;nativeStageKnown?:boolean;}
// At20fps the native jump stays airborne~.75s.35m/s covers26.25m,
// enough for the22m hole plus3m approach and1m landing margin.
export const MIN_LONG_GAP_SPEED=35;
const STONE_FEATURES=['treeJump','treeTrip','treeSlide','flameTower','stonePedestal','pit','narrowSmall','narrowLong','branch','longGap'] as const;
/** Web course design, not recovered native generation weights.
 * Native constraints:12m grid, progress-dependent turn minimums, paired long-hole caps and support polygons.
 * A shuffled coverage bag makes all requested mechanics reachable; jitter, coverage bag and the120m grouped-geometry floor are web assumptions.
 */
export class CoursePlan {
 readonly turns:CourseTurn[]=[{distance:153,direction:1,junction:'corner'},{distance:321,direction:1,junction:'corner'},{distance:489,direction:-1,junction:'tee'}];
 readonly obstacles:CourseObstacle[]=[{distance:108,defId:'treeTrip',prefab:'tree-trip-left'},{distance:285,defId:'treeJump',prefab:'tree-jump-left'},{distance:366,defId:'treeJump',prefab:'tree-jump-right'},{distance:453,defId:'pit',prefab:'pit'}];
 readonly surfaces:CourseSurface[]=[{kind:'stone',from:0,to:Infinity}];
 readonly narrows:CourseNarrow[]=[];
 readonly branches:CourseBranch[]=[];
 readonly features:CourseFeature[]=[];
 private readonly rng:SeededRandom;
 private bag:string[]=[];
 private blocks=0;
 extent=489;
 constructor(readonly seed:number,initialExtent=6000){this.rng=new SeededRandom(seed^0x636f7572);this.ensureThrough(initialExtent);}
 private stoneFeature(at:number,progress?:number):string {
  if(!this.bag.length){this.bag=[...STONE_FEATURES];for(let i=this.bag.length-1;i>0;i--){const j=this.rng.int(i+1);[this.bag[i],this.bag[j]]=[this.bag[j],this.bag[i]];}}
  const feature=this.bag.shift()!;
  if(progress!==undefined&&((progress<500&&(feature==='treeSlide'||feature==='flameTower'))||(progress<1500&&(feature==='narrowSmall'||feature==='narrowLong')))){this.bag.push(feature);return 'pit';}
  if(feature==='longGap'&&at<1400){this.bag.push(feature);return 'pit';}
  return feature;
 }
 ensureThrough(distance:number,progress?:number):void {
  while(this.extent<distance){
   const pacing=progress===undefined?null:nativePathPacing(progress);
   const minimum=pacing?Math.max(COURSE_GROUP_MIN_LENGTH,pacing.minTurnSpaces*12):144;
   const from=this.extent,length=minimum+this.rng.int(3)*24,to=from+length;
   const mid=12*Math.round((from+length/2)/12);
   let surface=this.surfaces.at(-1)!.kind;
   const transition=this.blocks%4===3;
   let kind:string;
   if(transition){
    const boundary=mid;
    this.surfaces.at(-1)!.to=boundary;surface=surface==='stone'?'wood':'stone';
    this.surfaces.push({kind:surface,from:boundary,to:Infinity});kind='transition';
   }else kind=surface==='wood'?(this.rng.int(2)===0?'plankPit':'plankBeam'):this.stoneFeature(mid,progress);
   const add=(defId:DefId,prefab:string,at=mid,lane?:number)=>this.obstacles.push({defId,prefab,distance:at,lane});
   const right=this.rng.int(2)===0;
   switch(kind){
    case 'transition':break;
    case 'treeJump':add('treeJump',right?'tree-jump-right':'tree-jump-left');break;
    case 'treeTrip':add('treeTrip',right?'tree-trip-right':'tree-trip-left');break;
    case 'treeSlide':add('treeSlide','tree-slide');break;
    case 'flameTower':add('flameTower','flame-tower');break;
    case 'stonePedestal':add('stonePedestal','stone-pedestal',mid,this.rng.int(3));break;
    case 'pit':add('pit','pit');break;
    case 'plankPit':add('plankPit','plank-pit');break;
    case 'plankBeam':add('plankBeam','plank-beam');break;
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
   this.features.push({kind,from,to,surface,...(pacing?{generatedAtProgress:progress,minTurnSpaces:pacing.minTurnSpaces,nativeStageKnown:pacing.known}:{})});
   this.turns.push({distance:to,direction:right?1:-1,junction:this.rng.int(4)===0?'tee':'corner'});
   this.extent=to;this.blocks++;
  }
 }
}
let active:CoursePlan|null=null;
export function setActiveCourse(course:CoursePlan|null):void {active=course;}
export const activeCourse=():CoursePlan|null=>active;
