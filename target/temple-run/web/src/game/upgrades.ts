import {nativeMagnetMultiplier} from './nativeMagnet';
import {NATIVE_UPGRADE_PRICES} from './nativeStorePrices';
import type {BonusAvailability} from './nativeBonusSpawn';
import { nativeBoostProgress } from './nativeBoost';
import { progress, buyUpgrade, upgradeLevel } from './progress';
import { nativeCoinBonusValue, nativeInvincibilityDuration, nativeVacuumDuration } from './nativeCoinBonus';

export interface UpgradeDef {
  id: string;
  name: string;
  sub: string;
  costs: number[];
}

// Native level1 unlocks generation; unchanged effect tiers must not be silently skipped.
const nativeCosts=[...NATIVE_UPGRADE_PRICES];
export const UPGRADES: UpgradeDef[] = [
  { id: 'coinSpawn', name: '高值金币', sub: '红币1500→1000；蓝币3000→2500→2000距离进度解锁', costs: nativeCosts.slice(0,5) },
  { id: 'boost', name: '加速距离', sub: '先解锁加速道具，距离250至750；末档完成升级', costs: nativeCosts },
  { id: 'magnet', name: '磁铁时长', sub: '解锁后15至25秒，金币收入最高3倍', costs: nativeCosts },
  { id: 'shield', name: '护盾时长', sub: '先解锁护盾，持续15至25秒；末档完成升级', costs: nativeCosts },
  { id: 'bonus', name: '金币奖励', sub: '先解锁奖励道具，奖励50至150金币；末档完成升级', costs: nativeCosts },
  { id: 'coin', name: '金币价值', sub: '每级 +25% 金币收益', costs: [300, 600, 1200] },
];

export function levelOf(id: string): number {
  const max = UPGRADES.find(u => u.id === id)?.costs.length ?? 0;
  const saved = upgradeLevel(id);
  return Number.isFinite(saved) ? Math.max(0, Math.min(max, Math.trunc(saved))) : 0;
}

export function nextCost(id: string): number | null {
  const def = UPGRADES.find(u => u.id === id);
  return def?.costs[levelOf(id)] ?? null;
}

export function purchase(id: string): boolean {
  const cost = nextCost(id);
  if (cost === null) return false;
  return buyUpgrade(id, cost);
}

/** Kept as the existing web economy rule; not a recovered native coin upgrade. */
export function coinMultiplier(): number { return 1 + levelOf('coin') * 0.25; }
export function magnetDuration(): number { return nativeVacuumDuration(levelOf('magnet')); }
export function shieldDuration(): number { return nativeInvincibilityDuration(levelOf('shield')); }
export function coinBonusReward(): number { return nativeCoinBonusValue(levelOf('bonus')); }
export function bankCoins(): number { return progress.coins; }

export function boostProgress(): number { return nativeBoostProgress(levelOf('boost')); }

export function isPowerUpgrade(id:string):boolean{return ['magnet','shield','boost','bonus'].includes(id);}
/** LoadLevelInformation writes0 probability before each switch;levels1..6 enable .2.
 * AddBonusItems treats positive values as eligibility,not relative weights. */
export function powerAvailability():BonusAvailability {
 return {bonus:levelOf('bonus')>0?1:0,shield:levelOf('shield')>0?1:0,magnet:levelOf('magnet')>0?1:0,boost:levelOf('boost')>0?1:0};
}
export function upgradeEffect(id:string,level=levelOf(id)):string {
 if(isPowerUpgrade(id)&&level===0)return '未解锁';
 if(id==='boost')return `加速${nativeBoostProgress(level)}距离进度`;
 if(id==='magnet')return `磁铁${nativeVacuumDuration(level)}秒 · 收入${nativeMagnetMultiplier(level)}倍`;
 if(id==='shield')return `护盾${nativeInvincibilityDuration(level)}秒`;
 if(id==='bonus')return `奖励${nativeCoinBonusValue(level)}金币`;
 return '';
}

export function magnetMultiplier():number{return nativeMagnetMultiplier(levelOf('magnet'));}
