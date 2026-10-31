/** StartAngelWings1298c6c / UseAngelWings12776a0 / Update1297524..7590. */
export const ANGEL_WINGS_SECONDS=30;
export const ANGEL_WINGS_RECHARGE_SECONDS=45;
export interface AngelWingsState {remaining:number;cooldown:number;}
export const createAngelWings=():AngelWingsState=>({remaining:0,cooldown:0});
export function startAngelWings(s:AngelWingsState):boolean {
 if(s.remaining>0||s.cooldown>0)return false;
 s.remaining=ANGEL_WINGS_SECONDS;s.cooldown=ANGEL_WINGS_RECHARGE_SECONDS;return true;
}
export function stepAngelWings(s:AngelWingsState,dt:number):void {
 s.remaining=Math.max(0,Math.fround(Math.fround(s.remaining)-Math.fround(dt)));
 s.cooldown=Math.max(0,Math.fround(Math.fround(s.cooldown)-Math.fround(dt)));
}
/** Web store price, not recovered native economic configuration. */
export const ANGEL_WINGS_PRICE=500;
