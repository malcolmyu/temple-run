/** BonusItem.Instantiate sets coin AngularVelocity=-257 degrees/s. Native +Z
 * becomes renderer -Z, reversing the Y rotation sign. Update uses MovingObject.
 * Standard PathElement.AddCoins positions the root at Y3raw; the mesh retains
 * its authored positive Y offset. Reference arc heights remain fitted offsets.
 */
export const NATIVE_COIN_ROOT_Y=.6;
export const NATIVE_COIN_ANGULAR_SPEED=257*Math.PI/180;
export function nativeCoinYaw(heading:number,age:number):number {
 return heading+Math.max(0,age)*NATIVE_COIN_ANGULAR_SPEED;
}
export function nativeCoinRootHeight(referenceHeight:number,referenceBase:number):number {
 return referenceHeight-referenceBase+NATIVE_COIN_ROOT_Y;
}
