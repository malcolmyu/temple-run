import {acceptsTurn,nativeTurnQueryRadius,TURN_INPUT_BEFORE} from './turnInput';

export interface DirectionalContext {
  playing:boolean;
  held:boolean;
  falling:boolean;
  lane:number;
  side?:number;
  junction:'corner'|'tee';
  turnDirection:number;
  remaining:number;
  queued:boolean;
  autoQueued:boolean;
  alternateBranchAvailable:boolean;
}
export type DirectionalDecision =
  | {kind:'ignore';reason:'inactive'|'held'|'falling'}
  | {kind:'turn';direction:-1|1;selectAlternateBranch:boolean}
  | {kind:'buffer';direction:-1|1}
  | {kind:'lane';index:number};

/** One directional event has one meaning. Rejected/distant turns fall back to
 * lane movement; only the collision/session systems can produce failure. */
export function routeDirection(context:DirectionalContext,direction:-1|1):DirectionalDecision {
  if(!context.playing)return {kind:'ignore',reason:'inactive'};
  if(context.held)return {kind:'ignore',reason:'held'};
  if(context.falling)return {kind:'ignore',reason:'falling'};
  const tee=context.junction==='tee';
  const alternate=tee&&direction!==context.turnDirection;
  if((!alternate||context.alternateBranchAvailable)&&acceptsTurn(
    tee?direction:context.turnDirection,direction,context.remaining,
    context.queued&&!(context.autoQueued&&tee),
  ))return {kind:'turn',direction,selectAlternateBranch:alternate};
  if((!context.queued||context.autoQueued&&tee)&&(!alternate||context.alternateBranchAvailable)
    &&(tee||direction===context.turnDirection)&&context.turnDirection!==0
    &&context.remaining>TURN_INPUT_BEFORE
    &&Math.hypot(context.remaining,context.side??0)<=nativeTurnQueryRadius())return {kind:'buffer',direction};
  return {kind:'lane',index:Math.max(0,Math.min(2,context.lane+direction))};
}
