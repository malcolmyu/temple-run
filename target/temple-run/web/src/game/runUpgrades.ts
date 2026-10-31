import {UPGRADES} from './upgradeCatalog';
import {nativeBoostProgress} from './nativeBoost';
import {nativeVacuumDuration,nativeInvincibilityDuration,nativeCoinBonusValue} from './nativeCoinBonus';
import {nativeMagnetMultiplier} from './nativeMagnet';
/** LoadLevelInformation-style per-run values; no live Progress dependency.
 * coinMultiplier remains the documented web economy extension. */
export function captureRunUpgrades(readLevel:(id:string)=>number){
 const level=(id:string)=>{const value=readLevel(id),max=UPGRADES.find(u=>u.id===id)!.costs.length;return Number.isFinite(value)?Math.max(0,Math.min(max,Math.trunc(value))):0;};
 const levels=Object.freeze({coinSpawn:level('coinSpawn'),coin:level('coin'),boost:level('boost'),magnet:level('magnet'),shield:level('shield'),bonus:level('bonus')});
 return Object.freeze({levels,boostProgress:nativeBoostProgress(levels.boost),magnetDuration:nativeVacuumDuration(levels.magnet),shieldDuration:nativeInvincibilityDuration(levels.shield),coinBonusReward:nativeCoinBonusValue(levels.bonus),coinMultiplier:1+levels.coin*.25,magnetMultiplier:nativeMagnetMultiplier(levels.magnet),availability:Object.freeze({boost:levels.boost>0?1:0,magnet:levels.magnet>0?1:0,shield:levels.shield>0?1:0,bonus:levels.bonus>0?1:0})});
}
