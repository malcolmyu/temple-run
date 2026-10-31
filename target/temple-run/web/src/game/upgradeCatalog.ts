import {NATIVE_UPGRADE_PRICES} from './nativeStorePrices';
export interface UpgradeDef {id:string;name:string;sub:string;costs:readonly number[];}
/** Native default tiers; coin value remains the explicit web economy adapter. */
export const UPGRADES:readonly UpgradeDef[]=[
 {id:'coinSpawn',name:'高值金币',sub:'红币1500→1000；蓝币3000→2500→2000距离进度解锁',costs:NATIVE_UPGRADE_PRICES.slice(0,5)},
 {id:'boost',name:'加速距离',sub:'先解锁加速道具，距离250至750；末档完成升级',costs:NATIVE_UPGRADE_PRICES},
 {id:'magnet',name:'磁铁时长',sub:'解锁后15至25秒，金币收入最高3倍',costs:NATIVE_UPGRADE_PRICES},
 {id:'shield',name:'护盾时长',sub:'先解锁护盾，持续15至25秒；末档完成升级',costs:NATIVE_UPGRADE_PRICES},
 {id:'bonus',name:'金币奖励',sub:'先解锁奖励道具，奖励50至150金币；末档完成升级',costs:NATIVE_UPGRADE_PRICES},
 {id:'coin',name:'金币价值',sub:'每级 +25% 金币收益',costs:[300,600,1200]},
];
export function upgradeCost(id:string,level:number):number|null {
 if(!Number.isInteger(level)||level<0)return null;
 return UPGRADES.find(u=>u.id===id)?.costs[level]??null;
}
