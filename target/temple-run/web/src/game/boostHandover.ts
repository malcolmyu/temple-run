import {REACTION_SECONDS} from './actionSafety';
export interface BoostHandoverContext {
 speed:number; supported:boolean; airborne:boolean;
 turnAhead:number;
 hazards:readonly {from:number;to:number}[];
}
/** Web handover policy. Preserve boost control/protection together until a
 * supported, grounded exit offers a reaction window at the current speed.
 * This does not alter the recovered native cruise/braking budget. */
export function boostHandoverReasons(ctx:BoostHandoverContext):string[]{
 const reasons:string[]=[];
 if(!ctx.supported)reasons.push('unsupported-exit');
 if(ctx.airborne)reasons.push('airborne-exit');
 const horizon=Math.max(0,ctx.speed)*REACTION_SECONDS+2;
 if(ctx.turnAhead>=-4&&ctx.turnAhead<=horizon)reasons.push('junction-exit');
 if(ctx.hazards.some(h=>h.to>=-2&&h.from<=horizon))reasons.push('hazard-exit');
 return reasons;
}
