import {bundledUpgradeCosts} from './nativeStorePrices';
import { nativeBoostProgress } from './nativeBoost';
import { progress, buyUpgrade, upgradeLevel } from './progress';
import { nativeCoinBonusValue, nativeInvincibilityDuration, nativeVacuumDuration } from './nativeCoinBonus';

export interface UpgradeDef {
  id: string;
  name: string;
  sub: string;
  costs: number[];
}

// Default native prices; compact web tiers bundle skipped-tier costs.
// Effect values come from GameController.LoadLevelInformation's recovered tables.
// Skip native tiers with no increase so every purchase has a visible benefit.
const MAGNET_NATIVE_LEVELS = [0, 2, 4] as const;
const SHIELD_NATIVE_LEVELS = [0, 2, 3, 4, 5] as const;
const BOOST_NATIVE_LEVELS = [0, 2, 3, 4, 5] as const;
const BONUS_NATIVE_LEVELS = [0, 2, 3, 4, 5] as const;
export const UPGRADES: UpgradeDef[] = [
  { id: 'coinSpawn', name: '高值金币', sub: '红币1500→1000；蓝币3000→2500→2000距离进度解锁', costs: bundledUpgradeCosts([0,1,2,3,4,5]) },
  { id: 'boost', name: '加速距离', sub: '基础250 → 375 → 500 → 625 → 750 距离进度', costs: bundledUpgradeCosts(BOOST_NATIVE_LEVELS) },
  { id: 'magnet', name: '磁铁时长', sub: '基础15秒 → 20秒 → 25秒', costs: bundledUpgradeCosts(MAGNET_NATIVE_LEVELS) },
  { id: 'shield', name: '护盾时长', sub: '基础15秒，每级增加2.5秒，最高25秒', costs: bundledUpgradeCosts(SHIELD_NATIVE_LEVELS) },
  { id: 'bonus', name: '金币奖励', sub: '奖励道具基础50金币，每级增加25，最高150', costs: bundledUpgradeCosts(BONUS_NATIVE_LEVELS) },
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
export function magnetDuration(): number { return nativeVacuumDuration(MAGNET_NATIVE_LEVELS[levelOf('magnet')]); }
export function shieldDuration(): number { return nativeInvincibilityDuration(SHIELD_NATIVE_LEVELS[levelOf('shield')]); }
export function coinBonusReward(): number { return nativeCoinBonusValue(BONUS_NATIVE_LEVELS[levelOf('bonus')]); }
export function bankCoins(): number { return progress.coins; }

export function boostProgress(): number { return nativeBoostProgress(BOOST_NATIVE_LEVELS[levelOf('boost')]); }
