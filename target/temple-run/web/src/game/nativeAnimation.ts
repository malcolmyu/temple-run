/** CharacterPlayer.AdjustAnimationSpeed129803c..1298078, setter248d3cc.
 * Applies to every AnimationState. Native speed is float32 |Velocity|/100*.65.
 * Inputs here are world units (.2 native scale), not clip frame rates. */
export const NATIVE_ANIMATION_COEFFICIENT=0.6499999761581421;
export function nativeAnimationSpeed(forward:number,vertical=0,lateral=0):number {
 const x=Math.fround(lateral/.2),y=Math.fround(vertical/.2),z=Math.fround(forward/.2);
 const squared=Math.fround(Math.fround(Math.fround(x*x)+Math.fround(y*y))+Math.fround(z*z));
 const rawSpeed=Math.fround(Math.sqrt(squared));
 return Math.fround(Math.fround(rawSpeed/100)*NATIVE_ANIMATION_COEFFICIENT);
}
