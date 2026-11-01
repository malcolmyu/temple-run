/** GameController.ComputeDistanceTraveled, arm64 RVA0x126e280.
 * Native progress uses squared horizontal frame travel / Time.smoothDeltaTime, distinct from physical path length.
 * Active in classic mode; physical path length remains distinct from this metric.
 */
export const NATIVE_REFERENCE_STEP = 0.01666666753590107;
export function nativeProgressDelta(dx:number,dz:number,smoothDt:number,worldScale=.2):number {
 if(smoothDt<=0||worldScale<=0)return 0;
 const rawSpeedSquared=(dx*dx+dz*dz)/(worldScale*worldScale*smoothDt*smoothDt);
 return rawSpeedSquared*NATIVE_REFERENCE_STEP*smoothDt/20;
}
export function nativeProgressScore(remainder:number,delta:number,multiplier:number):{
 remainder:number;scoreDelta:number;
}{
 const total=remainder+delta,whole=Math.trunc(total);
 return {remainder:total-whole,scoreDelta:whole>0?whole*multiplier:0};
}
