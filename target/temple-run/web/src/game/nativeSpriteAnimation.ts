/** UISpriteFrameAnimation.Update12cbc94..12cbd38. One frame at most per Update. */
export interface NativeSpriteAnimation { frame: number; nextFrame: number; remaining: number }
export const createNativeSpriteAnimation=():NativeSpriteAnimation=>({frame:0,nextFrame:0,remaining:0});
export function stepNativeSpriteAnimation(state: NativeSpriteAnimation, dt: number, fps: number, frameCount: number): void {
  if(dt<=0||fps<=0||frameCount<=0)return;
  const f=Math.fround;
  state.remaining=f(state.remaining-f(dt));
  if(state.remaining>0)return;
  // Native explicitly computes (60 / fps) / 60 in single precision.
  state.remaining=f(state.remaining+f(f(60/f(fps))/60));
  state.frame=state.nextFrame;
  state.nextFrame=(state.nextFrame+1)%frameCount;
}
