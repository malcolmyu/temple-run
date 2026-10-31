import {UPGRADES} from './upgradeCatalog';
/** Version2 stores native levels;version1 used compact useful-effect tiers. */
export const UPGRADE_SCHEMA=2;
const OLD:Record<string,readonly number[]>={magnet:[0,2,4],shield:[0,2,3,4,5],boost:[0,2,3,4,5],bonus:[0,2,3,4,5]};
const MAX:Record<string,number>=Object.fromEntries(UPGRADES.map(u=>[u.id,u.costs.length]));
export function migrateUpgradeLevels(saved:Record<string,unknown>={},version=0):Record<string,number>{
 const result:Record<string,number>={};
 for(const[id,max]of Object.entries(MAX)){
  const raw=saved[id],level=typeof raw==='number'&&Number.isFinite(raw)?Math.max(0,Math.trunc(raw)):0;
  const map=version<UPGRADE_SCHEMA?OLD[id]:undefined;
  result[id]=map?map[Math.min(map.length-1,level)]:Math.min(max,level);
 }
 return result;
}
