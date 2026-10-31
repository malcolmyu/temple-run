/** PathElement.UpdatePathDescription12e6730..678c, AddCoins12e4d40..80.
 * Counters measure path elements, not individual coin objects. */
export const NATIVE_STRAIGHT_COIN_OFFSETS=[-5,-2.5,0,2.5,5] as const;
export class NativeCoinRunState {
 spaces=0;
 count=0;
 step(eligible:boolean,minimum:number,maximum=5):boolean {
  const emit=eligible&&this.count<maximum&&this.spaces>minimum;
  if(emit){this.count++;if(this.count>=maximum)this.spaces=0;}
  else{this.count=0;this.spaces++;}
  return emit;
 }
}

/** AddCoins12e5640..5720 and centre-row Y assignments12e5d88..5dc0.
 * Raw jump roots18/20,wood3/5,cliff33/35 minus each ground all yield3.6/4. */
export function nativeTreeCoinHeights(id:string):readonly number[]|null {
 if(id==='treeJump'||id==='treeTrip')return [3.6,4,4,4,3.6];
 if(id==='treeSlide')return [.6,.6,.6,.6,.6];
 return null;
}

/** AddCoins12e567c..56d8: Range(0,2)==0 keeps low roots;
 * result1 raises roots only when sAllowJumpCoins is enabled. */
export function nativeFlameCoinHeights(draw:(limit:number)=>number,allowJumpCoins=true):readonly number[]{
 const high=draw(2)!==0&&allowJumpCoins;
 return high?[3.6,4,4,4,3.6]:[.6,.6,.6,.6,.6];
}

/** AddCoins native tables6b7ca8..7d18,canonical side1 negates X.
 * Parallel subset:0 centre,1 left,2 right. Cliff applies .8 at12e5c40. */
export function nativeParallelCoinSide(row:0|1|2,level:number):number {
 return (row===0?0:row===1?-1.4:1.4)*(level===3?.8:1);
}
