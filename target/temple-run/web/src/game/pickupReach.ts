/** Bounds measured from the normalized original runner and native diamond mesh.
 * Legacy challenge/magnet height estimate. Classic non-magnet pickup uses nativePickupCollision.ts.
 */
const RUNNER_HEIGHT = 1.92;
const SLIDE_HEIGHT = .67;
const COIN_HALF_HEIGHT = .331;
const PICKUP_PADDING = .4;

export function pickupHeightAt(base: number, elapsed: number, distance: number): number {
  return base + Math.sin(elapsed*3+distance)*.08;
}

export function coinHeightWithinReach(coinY: number, runnerY: number, sliding: boolean, magnet = false): boolean {
  if(magnet)return true;
  const padding=COIN_HALF_HEIGHT+PICKUP_PADDING;
  return coinY>=runnerY-padding && coinY<=runnerY+(sliding?SLIDE_HEIGHT:RUNNER_HEIGHT)+padding;
}
