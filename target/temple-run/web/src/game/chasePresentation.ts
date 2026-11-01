/** Approximate opening retreat from BV1ypuKzPErT: near at 2 s, exiting at 3 s,
 * below the chase camera by 4 s. This affects presentation only, not catch logic.
 */
export function openingChaseGap(seconds: number, actualGap: number): number {
  const t = Math.max(0, Math.min(1, (seconds - 2) / 1.8));
  const retreat = t * t * (3 - 2 * t);
  const closeGap = Math.min(3, actualGap);
  return closeGap + (actualGap - closeGap) * retreat;
}

/** GameController.SimulateEnemies RVA12718c0..12719b8, source units×0.2.
 * CharacterPlayer.Reset initializes TimeSinceStumbleStart to7 seconds.
 */
export function nativeEnemyFollowTarget(secondsSinceStumble:number,intro:boolean,sliding:boolean,duck:boolean):number {
 const value=secondsSinceStumble/10*46-23;
 const base=value<11.5?11.5:value<=25?value:75;
 return (base+(sliding&&duck?75:intro?10:0))*.2;
}
export function stepNativeEnemyFollow(current:number,target:number,dt:number,sliding:boolean,duck:boolean):number {
 const maximum=(target>current&&sliding&&duck?200:20)*Math.max(0,dt);
 return current+Math.sign(target-current)*Math.min(Math.abs(target-current),maximum);
}

/** GameController.SimulateEnemies uses index-1 in native tables6b78bc/6b78d8.
 * Serialized component6396: front/back spread6, left/right spread12, count8.
 * World X retains native lateral sign; positive local Z is behind the runner.
 */
export function nativeEnemyFormation(index:number):{side:number;behind:number} {
 const back=[.4545454680919647,.6363636255264282,4.545454502105713,5.818181991577148,7.309091091156006,9.59999942779541,12.818181991577148];
 const side=[-.2888888716697693,.42222222685813904,-.1666666716337204,.35555556416511536,-.46666663885116577,.02222222276031971,.5333333611488342];
 const slot=index-1;
 return slot>=0&&slot<7?{side:side[slot]*12*.2,behind:back[slot]*6*.2}:{side:0,behind:0};
}

/** Native pack offsets are relative to the player's current forward/right basis,
 * not samples on the path behind a corner. While grounded the native code moves
 * the lateral anchor halfway toward a 60-raw-unit grid centre. The web route is
 * fitted, so its local centreline supplies that grid centre until native world
 * tile origins are reconstructed. Airborne uses the full player position.
 */
export function enemyFollowAnchor(
 point:{x:number;z:number;heading:number},side:number,gap:number,airborne:boolean,
):{x:number;z:number;heading:number} {
 const lateralCorrection=airborne?0:side*.5;
 return {
  x:point.x-Math.cos(point.heading)*lateralCorrection+Math.sin(point.heading)*gap,
  z:point.z+Math.sin(point.heading)*lateralCorrection+Math.cos(point.heading)*gap,
  heading:point.heading,
 };
}
