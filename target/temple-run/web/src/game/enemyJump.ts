import { nativeJumpVelocity, stepNativeVertical } from './nativeMotion';

export interface EnemyJumpState { y:number; v:number; delay:number|null; jumping:boolean }
export const newEnemyJump = ():EnemyJumpState => ({y:0,v:0,delay:null,jumping:false});

/** HandleDelayedJumping126fe4c..70: horizontal separation / player speed.
 * Enemy.Jump rejects an already airborne enemy; positive delays are queued. */
export function queueEnemyJump(state:EnemyJumpState,distance:number,speed:number):void {
  if(state.jumping||state.y<-.4||speed<=0)return;
  const delay=Math.fround(distance/speed);
  state.delay=delay>0?delay:null;
  if(delay<=0){state.jumping=true;state.v=nativeJumpVelocity(speed);}
}

/** Enemy.Update12ae284..334, raw velocity clamp80..100, gravity250, scale.2.
 * Ground height here is relative to the current flat road plane. */
export function stepEnemyJump(state:EnemyJumpState,dt:number,held=false,speed=16):void {
  if(held||dt<=0)return;
  if(state.delay!==null){
    state.delay=Math.fround(state.delay-Math.fround(dt));
    if(state.delay<=0&&!state.jumping){state.delay=null;state.jumping=true;state.v=nativeJumpVelocity(speed);}
  }
  if(!state.jumping)return;
  Object.assign(state,stepNativeVertical(state.y,state.v,dt));
  if(state.y<0){state.y=0;state.v=0;state.jumping=false;}
}
