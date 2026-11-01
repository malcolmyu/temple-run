/** Only actual HandleBonusItemPickup equivalents count; timed-effect activation
 * (resurrection/mega/debug), coin-meter rewards and ordinary coins do not. */
export const POWER_PICKUP_KINDS=['magnet','shield','boost','bonus'] as const;
export type PowerPickupKind=typeof POWER_PICKUP_KINDS[number];
export type PowerPickupCounts=Record<PowerPickupKind,number>;
export const createPowerPickupCounts=():PowerPickupCounts=>({magnet:0,shield:0,boost:0,bonus:0});
export function countPowerPickup(counts:PowerPickupCounts,kind:string):void {
 if(POWER_PICKUP_KINDS.includes(kind as PowerPickupKind))counts[kind as PowerPickupKind]++;
}
export function sanitizePowerPickupCounts(value:unknown):PowerPickupCounts {
 const result=createPowerPickupCounts();
 if(!value||typeof value!=='object')return result;
 for(const kind of POWER_PICKUP_KINDS){const count=(value as Record<string,unknown>)[kind];if(typeof count==='number'&&Number.isFinite(count))result[kind]=Math.max(0,Math.floor(count));}
 return result;
}
