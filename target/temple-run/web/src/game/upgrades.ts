import { progress, buyUpgrade, upgradeLevel } from './progress';

export interface UpgradeDef {
  id: string;
  name: string;
  sub: string;
  costs: number[];
}

export const UPGRADES: UpgradeDef[] = [
  { id: 'magnet', name: '磁铁时长', sub: '每级 +1.2 秒', costs: [200, 400, 800] },
  { id: 'coin', name: '金币价值', sub: '每级 +25% 收益', costs: [300, 600, 1200] },
];

export function levelOf(id: string): number {
  return upgradeLevel(id);
}

export function nextCost(id: string): number | null {
  const def = UPGRADES.find((u) => u.id === id);
  if (!def) return null;
  const level = levelOf(id);
  return level >= def.costs.length ? null : def.costs[level];
}

export function purchase(id: string): boolean {
  const cost = nextCost(id);
  if (cost === null) return false;
  return buyUpgrade(id, cost);
}

/** Runtime modifiers derived from the purchased levels. */
export function coinMultiplier(): number {
  return 1 + levelOf('coin') * 0.25;
}

export function magnetBonusSeconds(): number {
  return levelOf('magnet') * 1.2;
}

export function bankCoins(): number {
  return progress.coins;
}
