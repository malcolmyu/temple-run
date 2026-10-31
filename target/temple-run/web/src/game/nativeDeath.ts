/** Normal GameController.Update126d418 calls EndGame(.5,false).
 * EndGame1272198 zeroes elapsed, stores delay11c. Update126c7e8..126c804
 * accumulates float32 smoothDt and retains the wait while elapsed<=delay. */
export const NATIVE_RESULT_DELAY=.5;
export const NATIVE_LEDGE_RECOVERY_DEPTH=1.2;
/** CharacterPlayer.Update1297994..12979ac: absolute rawY < -35. */
export const NATIVE_WATER_FALL_DEPTH=7;
export function stepNativeDeathTimer(elapsed:number,dt:number):{elapsed:number;finished:boolean} {
 const next=Math.fround(Math.fround(elapsed)+Math.fround(dt));
 return {elapsed:next,finished:next>NATIVE_RESULT_DELAY};
}

/** Flat road: missing support alone is NOT the controller ledge condition.
 * Returning below the supported ledge's recovery range kills as Ledge4.
 * Continued unsupported descent reaches the absolute water kill plane (Fall1).
 * The player Update checks absolute depth before the controller ledge branch. */
export function nativeGroundContact(y:number,supported:boolean,wasFalling:boolean):{
 landed:boolean;dead:boolean;stumble:boolean;deathType:1|4|null;
} {
 const deathType=y < -NATIVE_WATER_FALL_DEPTH ? 1
  : supported&&y < -NATIVE_LEDGE_RECOVERY_DEPTH ? 4 : null;
 const dead=deathType!==null;
 return {dead,deathType,landed:!dead&&supported&&y<=0,stumble:!dead&&supported&&wasFalling&&y<-.4};
}
