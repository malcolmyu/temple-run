import type {CoinValue} from './coinValues';
/** CoinSpawnConfigData..ctor129d324, native upgrade0..5. Remote overrides unknown. */
export const COIN_DISABLED_DISTANCE=999999999;
const DOUBLE=[COIN_DISABLED_DISTANCE,1500,1000,1000,1000,1000];
const TRIPLE=[COIN_DISABLED_DISTANCE,COIN_DISABLED_DISTANCE,COIN_DISABLED_DISTANCE,3000,2500,2000];
export function nativeCoinThresholds(level:number):{double:number;triple:number}{
 const index=Number.isFinite(level)?Math.max(0,Math.min(5,Math.trunc(level))):0;
 return {double:DOUBLE[index],triple:TRIPLE[index]};
}
/** HandlePacing compares DistanceTraveled>=threshold. AddCoins selects prefab pair
 * [yellow,red] then [red,blue]. Alternating placement is a web layout adapter. */
export function nativeCoinValue(progress:number,level:number,index:number):CoinValue {
 const threshold=nativeCoinThresholds(level),double=progress>=threshold.double,triple=progress>=threshold.triple;
 const pair:readonly [CoinValue,CoinValue]=double?(triple?[2,3]:[1,2]):triple?[3,3]:[1,1];
 return pair[Math.abs(Math.trunc(index))%2];
}
