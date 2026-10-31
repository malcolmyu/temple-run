/** Static IL2CPP HandlePacing126eee8..126f01c; deliberately separate from
 * CoursePlan until short-corner geometry and candidate filtering are integrated.
 * Thresholds are arguments: pacing/config may overwrite serialized defaults. */
export class NativeFastTurnState {
 active=false;
 elapsed=0;
 reset():void {this.active=false;this.elapsed=0;}
 advance(metricDelta:number,roll:()=>number,thresholds={inactive:1000,active:100}):boolean {
  if(!Number.isFinite(metricDelta)||metricDelta<0)throw new RangeError('metricDelta must be finite and nonnegative');
  this.elapsed=Math.fround(this.elapsed+Math.fround(metricDelta));
  if(this.elapsed <= (this.active?thresholds.active:thresholds.inactive))return false;
  this.elapsed=0;
  if(roll()<=2)this.active=!this.active;
  return true; // A draw occurred, including roll3 which keeps the current mode.
 }
 apply<T extends {minTurnSpaces:number;minCoinRunSpaces:number}>(normal:T):T {
  return this.active?{...normal,minTurnSpaces:Math.max(2,Math.trunc(Math.fround(normal.minTurnSpaces*Math.fround(.65)))),minCoinRunSpaces:0}:{...normal};
 }
}
