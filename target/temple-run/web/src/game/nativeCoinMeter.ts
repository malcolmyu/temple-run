/** CharacterPlayer.Start1296e98 sets threshold100; AddCoins1298aa8 awards
 * 500*ScoreMultiplier and consumes ONE threshold per positive call, even if
 * a large bonus leaves another full threshold. Stumble1297aec resets level1/count0. */
export const NATIVE_COIN_METER_THRESHOLD=100;
export const NATIVE_COIN_METER_SCORE=500;
export function addNativeCoinMeter(count:number,level:number,maxLevel:number,coins:number) {
 if(coins<1)return {count,level,maxLevel,scoreValue:0};
 count+=coins;
 if(count<NATIVE_COIN_METER_THRESHOLD)return {count,level,maxLevel,scoreValue:0};
 count-=NATIVE_COIN_METER_THRESHOLD;level++;
 return {count,level,maxLevel:Math.max(maxLevel,level),scoreValue:NATIVE_COIN_METER_SCORE};
}
