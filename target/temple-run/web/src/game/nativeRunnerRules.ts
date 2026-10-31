/** Reset RVA129846c stores a literal7 as initial elapsed age.
 * Stumble RVA1297a48..1297a60 compares elapsed age to a separate10-second literal. */
export const NATIVE_STUMBLE_RESET_AGE=7;
export const STUMBLE_KILL_WINDOW=10;
export function nativeStumbleIsFatal(timeSinceStumble:number):boolean {
 return timeSinceStumble<STUMBLE_KILL_WINDOW;
}

/** GameController.Update126cb80..126cba0 releases CharacterPlayer.Hold only
 * after TimeSinceGameStart exceeds1s during IsIntroScene. */
export const NATIVE_INTRO_HOLD_SECONDS=1;
export function nativeIntroHeld(secondsSinceStart:number):boolean {
 return secondsSinceStart<=NATIVE_INTRO_HOLD_SECONDS;
}

/** Stumble duration is based on speed after the .85 velocity reduction.
 * CharacterPlayer.Stumble1297adc..1297b08, source coefficient6976ac. */
export const NATIVE_STUMBLE_DURATION_COEFFICIENT=.004999999888241291;
export function nativeStumbleDuration(worldSpeed:number):number {
 return Math.min(.5,Math.fround(Math.fround(worldSpeed/.2)*NATIVE_STUMBLE_DURATION_COEFFICIENT));
}

/** Flat rejected-turn input calls Stumble(.25); CharacterPlayer.Update subtracts
 * float32 smoothDt and invokes immediate Stumble once the delay is <=0. */
export const NATIVE_REJECTED_TURN_DELAY=.25;
export const NATIVE_REJECTED_TURN_OFFSET=1.9;
export function stepNativeStumbleDelay(remaining:number,dt:number):number {
 return Math.fround(Math.fround(remaining)-Math.fround(dt));
}
