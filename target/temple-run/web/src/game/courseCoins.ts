import {nativePathPacing} from './nativePathPacing';
import {NativeCoinRunState,NATIVE_STRAIGHT_COIN_OFFSETS,nativeTreeCoinHeights,nativeFlameCoinHeights} from './nativeCoinRuns';
import {nativeCoinRowCandidates,nativeCoinRowEnd,nativeCoinRowSides} from './nativeCoinRows';
import {nativePathTypeAllowsCoins} from './nativeCoinEligibility';
import {SeededRandom} from './obstacles/rng';
import type {CoursePlan} from './coursePlan';
export interface GeneratedCourseCoin {distance:number;lane:number;height:number;side:number;pattern:number}
/** Native counters/straight array on web12m cells. Safety eligibility is a web
 * adapter: exclude junction margins, transitions, obstacles and split paths.
 * Tree jump/trip heights and low slide row are native; flame uses native low/high gate;all seven rows use native offsets/start/end links. Corner centre-predecessor and native T exclusion integrated;other special eligibility remains unported. */
export class CourseCoinDirector {
 private next:number;
 private turnIndex=0;
 private random:SeededRandom|null=null;
 private sideRandom:SeededRandom|null=null;
 private row=0;
 private previousEnd:number|null=null;
 readonly state=new NativeCoinRunState();
 constructor(private from=489){this.next=12*Math.ceil((from+6)/12);}
 takeThrough(to:number,course:CoursePlan):GeneratedCourseCoin[]{
  const coins:GeneratedCourseCoin[]=[];
  this.sideRandom??=new SeededRandom(course.seed^0x726f7773);
  this.random??=new SeededRandom(course.seed^0x636f696e); // Web seeded stream, not Unity Random reproduction.
  while(true){
   let turn=course.turns[this.turnIndex];
   while(turn&&(turn.distance<=this.from||turn.distance<=489)){this.turnIndex++;turn=course.turns[this.turnIndex];}
   const cornerNext=turn&&turn.distance<this.next;
   const at=cornerNext?turn.distance:this.next;if(at>=to)break;
   if(cornerNext){
    this.turnIndex++;
    const feature=course.features.find(f=>Math.abs(f.to-turn.distance)<.001);
    const minimum=feature?.fastTurn?0:nativePathPacing(feature?.generatedAtProgress??0).minCoinRunSpaces;
    // Native IsTurn requires centre predecessor;AddCoins explicitly excludes all T types7..10.
    const eligible=nativePathTypeAllowsCoins(turn.junction==='tee'?7:3)&&this.previousEnd===1&&this.state.count>0;
    if(this.state.step(eligible,minimum)){
     for(const offset of NATIVE_STRAIGHT_COIN_OFFSETS)coins.push({distance:turn.distance+offset,lane:1,height:.6,side:0,pattern:7});
     this.previousEnd=1;
    }else this.previousEnd=null;
    continue;
   }
   const centre=this.next;this.next+=12;
   // Web12m grid adapter:5m half-array + existing6m junction margin replaces overlapping straight cells.
   if(course.turns.some(t=>Math.abs(t.distance-centre)<11))continue;
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
    // Web enables all7 rows; preserve native endpoint continuity on adjacent emitting cells.
    if(startsRun)this.previousEnd=null;
    const candidates=nativeCoinRowCandidates(this.previousEnd);
    this.row=narrow?(safeLane===0?1:2):candidates[this.sideRandom!.int(candidates.length)];
    this.previousEnd=nativeCoinRowEnd(this.row);
    const sides=narrow?Array(5).fill((safeLane-1)*1.3):nativeCoinRowSides(this.row,f.pathLevel??(f.surface==='wood'?1:2));
    // Jump coins enabled in this web mode; remote native enable config is unknown.
    const selected=obstacle?.defId==='flameTower'?nativeFlameCoinHeights(limit=>this.random!.int(limit)):heights;
    for(const [index,offset] of NATIVE_STRAIGHT_COIN_OFFSETS.entries()){
     const side=sides[index],lane=side<-.65?0:side>.65?2:1;
     coins.push({distance:centre+offset,lane,height:selected?.[index]??.6,side,pattern:this.row});
    }
   }else this.previousEnd=null;
  }
  return coins;
 }
}
