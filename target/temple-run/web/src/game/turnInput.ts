/** Existing web geometry confirmation/late bounds, not native search radii. */
export const TURN_INPUT_BEFORE = 6;
// Keep input available through the same 4m grace period used by missed-turn death.
// Previously the last 2m accepted a lane change but could never confirm the turn.
export const TURN_INPUT_AFTER = 4;
export const TURN_INTENT_RULE_VERSION='turn-intent-v2';
/** TouchInput.TouchMoved/ctor; scene/saved sensitivity overrides are unresolved. */
export function nativeTurnQueryRadius(sensitivity=.5):number {
  const f=Math.fround;
  return f(88*f(f(f(1-f(sensitivity))*f(1.75))+f(.25)))*.2;
}
export const TURN_INTENT_SECONDS=1; // GameInput.Update clears only for age>1.

export interface BufferedTurn {target:number;direction:-1|1;elapsed:number;}
/** Buffer belongs to a specific junction. Geometry confirmation remains separate. */
export class TurnIntentBuffer {
  private value:BufferedTurn|null=null;
  offer(target:number,direction:-1|1):void {this.value={target,direction,elapsed:0};}
  clear():void {this.value=null;}
  snapshot():BufferedTurn|null {return this.value?{...this.value}:null;}
  step(dt:number,target:number):void {
    if(!this.value)return;
    if(this.value.target!==target){this.clear();return;}
    this.value.elapsed=Math.fround(Math.fround(this.value.elapsed)+Math.fround(dt));
    if(this.value.elapsed>TURN_INTENT_SECONDS)this.clear();
  }
}

export function acceptsTurn(direction: number, requested: number, remaining: number, queued: boolean): boolean {
  return !queued && (requested === -1 || requested === 1) && direction === requested
    && Number.isFinite(remaining) && remaining <= TURN_INPUT_BEFORE && remaining >= -TURN_INPUT_AFTER;
}
