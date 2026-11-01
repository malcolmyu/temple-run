import {NATIVE_UTILITY_PRICES} from './nativeStorePrices';
/** StartAngelWings1298c6c / UseAngelWings12776a0 / Update1297524..7590. */
export const ANGEL_WINGS_SECONDS=30;
export const ANGEL_WINGS_RECHARGE_SECONDS=45;
export interface AngelWingsState {remaining:number;cooldown:number;permanent?:boolean;}
export const createAngelWings=():AngelWingsState=>({remaining:0,cooldown:0});
export function startAngelWings(s:AngelWingsState,permanent=false):boolean {
 if(s.remaining>0||s.cooldown>0)return false;
 s.permanent=permanent;s.remaining=ANGEL_WINGS_SECONDS;if(!permanent)s.cooldown=ANGEL_WINGS_RECHARGE_SECONDS;return true;
}
export function stepAngelWings(s:AngelWingsState,dt:number):void {
 if(!s.permanent)s.remaining=Math.max(0,Math.fround(Math.fround(s.remaining)-Math.fround(dt)));
 s.cooldown=Math.max(0,Math.fround(Math.fround(s.cooldown)-Math.fround(dt)));
}
/** StoreConfigData.UtilityCostList[0] constructor default; remote overrides unknown. */
export const ANGEL_WINGS_PRICE=NATIVE_UTILITY_PRICES.wings;

/** Controller126d3c4..d3d0 sets15 cooldown when permanent wings revive. */
export function consumeAngelWings(s:AngelWingsState):boolean {
 if(s.remaining<=0)return false;
 if(s.permanent)s.cooldown=15;
 s.remaining=0;s.permanent=false;return true;
}
export const PERMA_WINGS_PRICE=NATIVE_UTILITY_PRICES.permanentWings;
