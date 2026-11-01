/** Phone tilt steers across the bridge; it never produces a swipe/turn command. */
export class TiltSteering {
  private neutral: number | null = null;
  private value: number | null = null;

  reset(): void { this.neutral = null; this.value = null; }

  sample(gamma: number | null): number | null {
    if (gamma === null || !Number.isFinite(gamma)) return this.value;
    if (this.neutral === null) this.neutral = gamma;
    const delta = gamma - this.neutral;
    const magnitude = Math.max(0, Math.abs(delta) - 2);
    this.value = Math.sign(delta) * Math.min(1, magnitude / 20);
    return this.value;
  }

  get axis(): number | null { return this.value; }
}

/** Native GameInput.HandleAccelerometerForce12abddc..12abe00 maps filtered
 * Unity accelerationX into PlayerXOffset[-7,7] raw; negative gain is native. */
export const NATIVE_TILT_OFFSET_MAX=1.4;
export const NATIVE_TILT_GAIN=10.125;
export function nativeTiltOffset(accelerationX:number):number {
 return -Math.sign(accelerationX)*Math.min(1,Math.abs(accelerationX)*NATIVE_TILT_GAIN)*NATIVE_TILT_OFFSET_MAX;
}
/** TouchInput default filter interval1/60 / kernel.1 (per Update, not per sensor event). */
export function filterNativeAcceleration(previous:number,sample:number):number {
 const alpha=Math.fround(0.01666666753590107/0.10000000149011612);
 return Math.fround(Math.fround(previous)+Math.fround(Math.fround(sample-previous)*alpha));
}
/** HandleControls126f6e8..126f714 and126f970..126f984, ordinary road branch.
 * Keep the current browser orientation adapter separate from these recovered
 * position dynamics; it is not yet a verified Unity accelerometer equivalent. */
export function stepNativeSteering(current:number,target:number,dt:number,sensitivity=.5):number {
 const step=Math.min(Math.fround(Math.max(0,dt)),0.06666667014360428);
 const response=Math.fround(Math.fround(step*50)*Math.fround(sensitivity*1.75+.25));
 const delta=Math.fround(Math.fround((target-current)/.2)*Math.fround(.10000000149011612*response));
 return Math.fround(Math.fround(current/.2)+delta)*.2;
}

/** GameInput.HandleAccelerometerForce skips offset writes during IsIntroScene. */
export const nativeTiltAllowed=(runSeconds:number):boolean=>runSeconds>3;
