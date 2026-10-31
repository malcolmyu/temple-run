/** Video BV1ypuKzPErT: front view at 1 s, side view at 2 s, chase view by 3 s.
 * These poses approximate those sampled frames; they are not recovered Unity keyframes.
 */
export function entranceCameraPose(seconds: number): {
  side: number; behind: number; height: number; lookAhead: number; lookHeight: number;
} | null {
  if (!Number.isFinite(seconds) || seconds < 0 || seconds >= 3) return null;
  const orbit = Math.max(0, Math.min(1, (seconds - 1.72) / 1.18));
  const smooth = orbit * orbit * (3 - 2 * orbit);
  const angle = -Math.PI * (1 - smooth);
  const radius = 19 + (10 - 19) * smooth;
  const reveal = Math.min(1, seconds / .8);
  return {
    side: Math.sin(angle) * radius,
    behind: Math.cos(angle) * radius,
    height: 7,
    lookAhead: -15 * (1 - reveal),
    lookHeight: 5 * (1 - reveal) + 4 * reveal,
  };
}

/** GameStart absolute Unity path, recovered from native GameStart/Simulate.
 * `distance` is along the initial straight from player start(0,0,-10 raw).
 * X retains the renderer's canonical lateral axis; +UnityZ becomes forward distance.
 * The final path node holds until the controller ends IsIntroScene at3s. */
export function nativeEntranceCameraPose(seconds:number):{
  distance:number;side:number;height:number;lookHeight:number;
}|null {
  if(!Number.isFinite(seconds)||seconds<0||seconds>=3)return null;
  const u=Math.max(0,Math.min(1,(seconds-.25)/2.5));
  const ease=u<.5?4*u*u*u:1-4*(1-u)**3;
  return {distance:22+22*ease,side:-4*ease,height:2+7*ease,lookHeight:4};
}
