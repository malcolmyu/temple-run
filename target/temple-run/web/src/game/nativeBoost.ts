/** IL2CPP StartBoost adds a50-progress braking allowance to the configured250.
 * ComputeDistanceTraveled subtracts its metric delta, not physical world metres.
 */
export const BOOST_PROGRESS = 250;
export const BOOST_BRAKING_PROGRESS = 50;
export const BOOST_TAIL_SECONDS = 4;
export const BOOST_ACCELERATION = 30; // HandleControls raw force +/-150, scale.2
export interface NativeBoostState { active:boolean; left:number; speedBefore:number; }
export const createNativeBoost=():NativeBoostState=>({active:false,left:0,speedBefore:0});
export function startNativeBoost(state:NativeBoostState,speed:number):boolean {
 const first=!state.active;
 if(first)state.speedBefore=speed;
 state.active=true;state.left=BOOST_PROGRESS+BOOST_BRAKING_PROGRESS;
 return first;
}
export const boostCruising=(state:NativeBoostState):boolean=>state.active&&state.left>BOOST_BRAKING_PROGRESS;
export function boostAcceleration(state:NativeBoostState,speed:number,normalForce:number):number {
 if(!state.active)return normalForce;
 if(boostCruising(state))return BOOST_ACCELERATION;
 return speed>state.speedBefore?-BOOST_ACCELERATION:normalForce;
}
export function consumeBoostProgress(state:NativeBoostState,delta:number):void {
 if(state.active)state.left-=Math.max(0,delta);
}
