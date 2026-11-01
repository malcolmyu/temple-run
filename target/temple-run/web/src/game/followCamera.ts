/** Serialized GameCamera 6397, level0. Original units × 0.2.
 * Field mapping verified against IL2CPP field visibility and component byte layout.
 * Jump-height offsets and speed-limited following verified in native GameCamera.Update.
 */
export function followCameraPose(needsToDuckCamera: boolean, airborne: boolean, jumpHeight = 0): {
  height: number; behind: number; focusHeight: number;
} {
  return needsToDuckCamera
    ? { height: 1.2, behind: 12, focusHeight: 2.8 }
    : airborne
      ? { height: 7 + jumpHeight*.5, behind: 10 + jumpHeight*.5, focusHeight: 4 + jumpHeight*.25 }
      : { height: 7, behind: 10, focusHeight: 4 };
}

/** GameController.Update clears the flag when not sliding. Its nearest element's
 * active MustSlideUnder obstacles set it for slide, or invincibility when the
 * obstacle does not also require a jump. Leaving the element while sliding
 * retains the previous flag until the slide ends.
 */
export function nextNativeDuckCamera(previous:boolean,sliding:boolean,invincible:boolean,
 obstacles:readonly {mustSlideUnder:boolean;mustJumpOver:boolean}[]):boolean {
 return (sliding&&previous)||obstacles.some(obstacle=>obstacle.mustSlideUnder
  &&(sliding||(invincible&&!obstacle.mustJumpOver)));
}

/** Keep follow distance relative to the actor's tangent through a corner.
 * Sampling distance-behind on the track leaves the camera on the previous arm.
 * Camera position advances separately using the native speed-limited step.
 */
export function followCameraBack(anchor: { x: number; z: number; heading: number }, behind: number): { x: number; z: number } {
  return { x: anchor.x + Math.sin(anchor.heading) * behind, z: anchor.z + Math.cos(anchor.heading) * behind };
}

/** GameCamera.Update12afeb8..12afecc: max step is |Velocity|*1.25*dt.
 * The original clamps at the target instead of exponential interpolation.
 * Positions and velocity use world units here; the coefficient is scale-invariant. */
export function stepNativeFollowCamera(
 current:readonly number[],target:readonly number[],velocityMagnitude:number,dt:number,
):[number,number,number] {
 const delta=target.map((value,i)=>value-current[i]);
 const distance=Math.hypot(...delta);
 const step=Math.max(0,velocityMagnitude)*1.25*Math.max(0,dt);
 const fraction=distance===0?1:Math.min(1,step/distance);
 return [current[0]+delta[0]*fraction,current[1]+delta[1]*fraction,current[2]+delta[2]*fraction];
}
