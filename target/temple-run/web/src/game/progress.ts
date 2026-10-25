import { reactive } from 'vue';
import { SKINS } from './skins';

/** Durable meta-progression: currency banks, unlocks, lifetime stats. */
export interface Progress {
  coins: number;
  gems: number;
  runs: number;
  bestDistance: number;
  totalDistance: number;
  lifetimeCoins: number;
  bestScore: number;
  owned: string[];
  equipped: string;
  claimed: string[];
  upgrades: Record<string, number>;
  music: boolean;
  sound: boolean;
}

const KEY = 'temple.v2.progress';

function load(): Progress {
  const defaults: Progress = {
    coins: 0,
    gems: 0,
    runs: 0,
    bestDistance: 0,
    totalDistance: 0,
    lifetimeCoins: 0,
    bestScore: 0,
    owned: [SKINS[0].id],
    equipped: SKINS[0].id,
    claimed: [],
    upgrades: { magnet: 0, coin: 0 },
    music: true,
    sound: true,
  };
  try {
    const raw = localStorage.getItem(KEY);
    if (!raw) return defaults;
    const saved = JSON.parse(raw) as Partial<Progress>;
    return {
      ...defaults,
      ...saved,
      owned: Array.isArray(saved.owned) && saved.owned.length ? saved.owned : defaults.owned,
      claimed: Array.isArray(saved.claimed) ? saved.claimed : [],
      upgrades: { magnet: 0, coin: 0, ...(saved.upgrades ?? {}) },
    };
  } catch {
    return defaults;
  }
}

export const progress = reactive<Progress>(load());

export function saveProgress(): void {
  try {
    localStorage.setItem(KEY, JSON.stringify(progress));
  } catch {
    /* storage disabled */
  }
}

export function isOwned(id: string): boolean {
  return progress.owned.includes(id);
}

export function canAfford(id: string): boolean {
  const skin = SKINS.find((s) => s.id === id);
  if (!skin) return false;
  return skin.currency === 'gems' ? progress.gems >= skin.price : progress.coins >= skin.price;
}

/** Returns true when the purchase succeeded (deducts the price). */
export function buySkin(id: string): boolean {
  const skin = SKINS.find((s) => s.id === id);
  if (!skin || isOwned(id) || !canAfford(id)) return false;
  if (skin.currency === 'gems') progress.gems -= skin.price;
  else progress.coins -= skin.price;
  progress.owned.push(id);
  progress.equipped = id;
  saveProgress();
  return true;
}

export function equipSkin(id: string): void {
  if (!isOwned(id)) return;
  progress.equipped = id;
  saveProgress();
}

export function claimObjective(id: string, coins: number, gems: number): boolean {
  if (progress.claimed.includes(id)) return false;
  progress.claimed.push(id);
  progress.coins += coins;
  progress.gems += gems;
  saveProgress();
  return true;
}

export function upgradeLevel(id: string): number {
  return progress.upgrades[id] ?? 0;
}

export function buyUpgrade(id: string, cost: number): boolean {
  if (progress.coins < cost) return false;
  progress.coins -= cost;
  progress.upgrades[id] = upgradeLevel(id) + 1;
  saveProgress();
  return true;
}

export function recordRun(distance: number, coins: number, gems: number, score: number): void {
  progress.runs += 1;
  progress.coins += coins;
  progress.gems += gems;
  progress.totalDistance += Math.floor(distance);
  progress.lifetimeCoins += coins;
  progress.bestDistance = Math.max(progress.bestDistance, Math.floor(distance));
  progress.bestScore = Math.max(progress.bestScore, Math.floor(score));
  saveProgress();
}
