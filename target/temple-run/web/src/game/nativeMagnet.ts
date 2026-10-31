/** LoadLevelInformation:levels3/4 give2x;5/6 give3x. Radius/force do not scale. */
export function nativeMagnetMultiplier(level:number):number{return [1,1,1,2,2,3,3][Math.max(0,Math.min(6,Math.trunc(level)))]??1;}
export type MagnetVector=[number,number,number];
export interface NativeMagnetCoin {position:MagnetVector;velocity:MagnetVector;force:MagnetVector;}
export const MAGNET_RADIUS=18; // sqrt(8100)raw*.2
export const MAGNET_PICKUP_RADIUS=2.4; //12raw*.2
const FORCE=80000; //10000000raw * worldScale^3
/** MovingObject.Simulate first integrates last frame's force,clamps500raw,
 * moves by min(dt,1/15). HandleBonusItemPickup then queues inverse-square force.
 * Once pulled,the coin remains eligible after the timer expires,without bonus multiplier. */
export function stepNativeMagnetCoin(state:NativeMagnetCoin|null,origin:MagnetVector,target:MagnetVector,active:boolean,dt:number):{state:NativeMagnetCoin|null;pulling:boolean}{
 if(state){
  for(let i=0;i<3;i++)state.velocity[i]+=state.force[i]*dt;
  const speed=Math.hypot(...state.velocity);if(speed>100)for(let i=0;i<3;i++)state.velocity[i]*=100/speed;
  for(let i=0;i<3;i++){state.position[i]+=state.velocity[i]*Math.min(dt,1/15);state.force[i]=0;}
 }
 if(!active&&!state)return {state:null,pulling:false};
 const pos=state?.position??origin,delta=target.map((v,i)=>v-pos[i])as MagnetVector;
 const squared=delta.reduce((sum,v)=>sum+v*v,0);
 if(squared<=0||squared>MAGNET_RADIUS*MAGNET_RADIUS)return {state,pulling:false};
 state??={position:[...origin],velocity:[0,0,0],force:[0,0,0]};
 const distance=Math.sqrt(squared);for(let i=0;i<3;i++)state.force[i]=delta[i]/distance*FORCE/squared;
 return {state,pulling:true};
}
