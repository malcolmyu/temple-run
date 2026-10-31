/** Source world scale used by the recovered native meshes and camera. */
export const NATIVE_WORLD_SCALE=.2;
/** CharacterPlayer.Slide RVA12987d8..12987f4, literal at697524. */
export const NATIVE_SLIDE_COEFFICIENT=0.007000000216066837;
/** PlayerConfigData constructor float32; CharacterPlayer.Stumble scales velocity. */
export const NATIVE_STUMBLE_SPEED_FACTOR=0.8500000238418579;
export function nativeSlideDuration(worldSpeed:number):number {
 return Math.min(.75,Math.fround(Math.fround(Math.max(0,worldSpeed)/NATIVE_WORLD_SCALE)*NATIVE_SLIDE_COEFFICIENT));
}
/** Active classic-mode constructor defaults; video remote overrides remain unverified.
 * GameController.HandleControls produces no NEW forward force while airborne/sliding.
 * A previously queued force can still accelerate the next action frame.
 * Threshold getters divide serialized percentages by100; force getters /100.
 */
export function nativeForwardAcceleration(worldSpeed:number,maxWorldSpeed=42,airborne=false,sliding=false):number {
 if(airborne||sliding||worldSpeed>=maxWorldSpeed)return 0;
 const ratio=worldSpeed/maxWorldSpeed;
 const rawForce=ratio<.5?30:ratio<=.65?10:ratio<=.85?1.5:.5;
 return rawForce*NATIVE_WORLD_SCALE;
}
/** CharacterPlayer.Jump clamps raw horizontal speed to[80,100]. */
export function nativeJumpVelocity(worldSpeed:number):number {
 return Math.max(16,Math.min(20,worldSpeed));
}

/** CharacterPlayer.Update1297884..12978c0 increments float32 elapsed and clears
 * IsSliding only for elapsed>duration. Equality is still active. `remaining`
 * represents that separate native bool with EPSILON at the exact zero boundary;
 * no collision padding or extra grace interval is introduced. */
export function stepNativeSlideTimer(elapsed:number,duration:number,dt:number):{elapsed:number;remaining:number} {
 const next=Math.fround(Math.fround(elapsed)+Math.fround(dt));
 return {elapsed:next,remaining:next>duration?0:Math.max(Number.EPSILON,duration-next)};
}

/** CharacterPlayer.Update applies raw gravity250, then CommonPlayer.Update calls
 * MovingObject.Simulate before the floor clamp. Native fields are float32 raw
 * Unity units; position uses min(smoothDt,1/15), velocity uses the full step. */
export const NATIVE_POSITION_STEP_MAX=0.06666667014360428;
export function stepNativeVertical(y:number,v:number,dt:number):{y:number;v:number} {
 const rawDt=Math.fround(Math.max(0,dt));
 const rawV=Math.fround(Math.fround(v/NATIVE_WORLD_SCALE)-Math.fround(250*rawDt));
 const rawY=Math.fround(Math.fround(y/NATIVE_WORLD_SCALE)+Math.fround(rawV*Math.min(rawDt,NATIVE_POSITION_STEP_MAX)));
 return {y:rawY*NATIVE_WORLD_SCALE,v:rawV*NATIVE_WORLD_SCALE};
}

export function stepNativeJump(y:number,v:number,dt:number):{y:number;v:number;airborne:boolean} {
 const next=stepNativeVertical(y,v,dt);
 return next.y<=0?{y:0,v:0,airborne:false}:{...next,airborne:true};
}

/** TouchInput(-3) changes actions, CharacterPlayer(220) consumes the force
 * queued by GameController(280) in the preceding frame. Force is then cleared.
 * Action state may have changed since the force was produced. */
export function stepNativeForwardVelocity(speed:number,queuedForce:number,dt:number):number {
 const rawSpeed=Math.fround(speed/NATIVE_WORLD_SCALE);
 const rawForce=Math.fround(queuedForce/NATIVE_WORLD_SCALE);
 const rawNext=Math.fround(rawSpeed+Math.fround(rawForce*Math.fround(Math.max(0,dt))));
 return Math.min(42,rawNext*NATIVE_WORLD_SCALE);
}
