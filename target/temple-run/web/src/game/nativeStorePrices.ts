/** StoreConfigData.ctor12aa7d0..12abcc4 defaults; remote overrides unresolved. */
export const NATIVE_UPGRADE_PRICES=[250,1000,2500,5000,7500,25000] as const;
export const NATIVE_UTILITY_PRICES={wings:500,headStart:10000,megaStart:2500,permanentWings:10000} as const;
/** Web compact tiers skip unchanged effects; charge all intervening native tiers. */
export function bundledUpgradeCosts(levels:readonly number[]):number[] {
 return levels.slice(1).map((next,i)=>{
  const from=levels[i];
  if(!Number.isInteger(from)||!Number.isInteger(next)||from<0||next<=from||next>NATIVE_UPGRADE_PRICES.length)throw new RangeError('Invalid native upgrade level interval');
  return NATIVE_UPGRADE_PRICES.slice(from,next).reduce<number>((sum,cost)=>sum+cost,0);
 });
}
