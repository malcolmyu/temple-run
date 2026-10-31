import { createNativeBoost, startNativeBoost, BOOST_TAIL_SECONDS, BOOST_BRAKING_PROGRESS, type NativeBoostState } from './nativeBoost';
export const TIMED_POWERS = ['magnet', 'shield', 'boost'] as const;
export type TimedPower = typeof TIMED_POWERS[number];
export interface PowerEffects {
  /** Most recently collected effect, retained for the single-effect legacy HUD API. */
  boost: NativeBoostState;
  kind: TimedPower | null;
  until: number;
  expires: Record<TimedPower, number>;
}
export function createPowerEffects(): PowerEffects {
  return {boost:createNativeBoost(),kind:null,until:0,expires:{magnet:0,shield:0,boost:0}};
}
export function activatePower(power: PowerEffects, kind: string, now: number, duration: number, speed=20, boostProgress=250,mega=false): void {
  if (!TIMED_POWERS.includes(kind as TimedPower)) return;
  const timed=kind as TimedPower;
  if(timed==='boost'){
    if(startNativeBoost(power.boost,speed,boostProgress,mega))power.expires.shield=now+BOOST_TAIL_SECONDS;
    power.kind=timed;return;
  }
  // Native StartInvincibility/StartVacuum assign their own remaining time.
  // Refresh this effect without changing another effect's clock.
  power.expires[timed]=now+duration;
  power.kind=timed;
  power.until=power.expires[timed];
}
export function hasPower(power: PowerEffects, kind: TimedPower, now: number): boolean {
  return kind==='boost'?power.boost.active:power.expires[kind]>now;
}
export interface ActivePower {kind:TimedPower;remaining:number;unit:'s'|'m';slowing?:boolean;}
export function activePowers(power: PowerEffects, now: number): ActivePower[] {
  return TIMED_POWERS.filter(kind=>hasPower(power,kind,now)).map(kind=>{
    if(kind==='boost'){
      const slowing=power.boost.left<=BOOST_BRAKING_PROGRESS;
      return {kind,slowing,remaining:slowing?Math.max(0,power.expires.shield-now):power.boost.left-BOOST_BRAKING_PROGRESS,unit:slowing?'s':'m'};
    }
    return {kind,remaining:power.expires[kind]-now,unit:'s'};
  });
}

/** CharacterPlayer.Update freezes the invincibility clock through the cruise budget. */
export function stepPowerEffects(power:PowerEffects,now:number,dt:number):void {
  if(!power.boost.active)return;
  if(!hasPower(power,'shield',now))power.boost.active=false;
  else if(power.boost.left>=BOOST_BRAKING_PROGRESS)power.expires.shield+=dt;
}
