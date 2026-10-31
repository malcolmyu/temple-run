import {nativePathPacing} from './nativePathPacing';
import {NativeCoinRunState,NATIVE_STRAIGHT_COIN_OFFSETS,nativeTreeCoinHeights,nativeFlameCoinHeights,nativeParallelCoinSide} from './nativeCoinRuns';
import {SeededRandom} from './obstacles/rng';
import type {CoursePlan} from './coursePlan';
export interface GeneratedCourseCoin {distance:number;lane:number;height:number;side:number}
/** Native counters/straight array on web12m cells. Safety eligibility is a web
 * adapter: exclude junction margins, transitions, obstacles and split paths.
 * Tree jump/trip heights and low slide row are native; flame uses native low/high gate;parallel rows use native offsets. Native slants and full predecessor eligibility remain unported. */
export class CourseCoinDirector {
 private next:number;
 private random:SeededRandom|null=null;
 private sideRandom:SeededRandom|null=null;
 private row:0|1|2=0;
 readonly state=new NativeCoinRunState();
 constructor(from=489){this.next=12*Math.ceil((from+6)/12);}
 takeThrough(to:number,course:CoursePlan):GeneratedCourseCoin[]{
  const coins:GeneratedCourseCoin[]=[];
  this.sideRandom??=new SeededRandom(course.seed^0x726f7773);
  this.random??=new SeededRandom(course.seed^0x636f696e); // Web seeded stream, not Unity Random reproduction.
  while(this.next<to){
   const centre=this.next;this.next+=12;
   const f=course.features.find(f=>centre>=f.from&&centre<f.to);
   if(!f)continue;
   const narrow=course.narrows.find(n=>centre>=n.from-6&&centre<=n.to+6);
   const safeLane=narrow?(narrow.side==='left'?0:2):1;
   const obstacle=course.obstacles.find(o=>Math.abs(o.distance-centre)<.001);
   const heights=obstacle?nativeTreeCoinHeights(obstacle.defId):null;
   const safeObstacle=!course.obstacles.some(o=>o!==obstacle&&Math.abs(o.distance-centre)<12)&&(!obstacle||heights!==null||obstacle.defId==='flameTower');
   const eligible=centre-5>=f.from+6&&centre+5<=f.to-6&&f.kind!=='transition'&&f.kind!=='branch'&&safeObstacle;
   const minimum=f.fastTurn?0:nativePathPacing(f.generatedAtProgress??0).minCoinRunSpaces;
   const startsRun=this.state.count===0;
   if(this.state.step(eligible,minimum)){
    // Web mode enables centre/side coins and chooses the parallel subset.
    // Keep the row through this run; full native predecessor/slant gates remain pending.
    if(startsRun)this.row=this.sideRandom!.int(3)as 0|1|2;
    const lane=narrow?safeLane:this.row===0?1:this.row===1?0:2;
    const side=narrow?(lane-1)*1.3:nativeParallelCoinSide(this.row,f.pathLevel??(f.surface==='wood'?1:2));
    // Jump coins enabled in this web mode; remote native enable config is unknown.
    const selected=obstacle?.defId==='flameTower'?nativeFlameCoinHeights(limit=>this.random!.int(limit)):heights;
    for(const [index,offset] of NATIVE_STRAIGHT_COIN_OFFSETS.entries())coins.push({distance:centre+offset,lane,height:selected?.[index]??.6,side});
   }
  }
  return coins;
 }
}
