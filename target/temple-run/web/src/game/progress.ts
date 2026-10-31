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

/** One-time import of the legacy (pre-v2) keys, so existing players keep their progress. */
function migrateLegacy(defaults: Progress): Progress | null {
  const charsRaw = localStorage.getItem('atb_temple_run_chars');
  const bestRaw = localStorage.getItem('atb_temple_run_best');
  const statsRaw = localStorage.getItem('atb_temple_run_stats');
  const settingsRaw = localStorage.getItem('atb_temple_run_settings');
  if (!charsRaw && !bestRaw && !statsRaw && !settingsRaw) return null;
  const parse = (raw: string | null): Record<string, unknown> => {
    if (!raw) return {};
    try {
      const value = JSON.parse(raw) as unknown;
      return value && typeof value === 'object' ? (value as Record<string, unknown>) : {};
    } catch {
      return {};
    }
  };
  const chars = parse(charsRaw);
  const stats = parse(statsRaw);
  const settings = parse(settingsRaw);
  const num = (value: unknown): number => {
    const parsed = Number(value);
    return Number.isFinite(parsed) ? parsed : 0;
  };
  const owned = Array.isArray(chars.owned)
    ? [...new Set(chars.owned.filter((id): id is string => typeof id === 'string' && SKINS.some((skin) => skin.id === id)))]
    : [];
  if (!owned.includes(SKINS[0].id)) owned.unshift(SKINS[0].id);
  const equipped = typeof chars.equipped === 'string' && owned.includes(chars.equipped) ? chars.equipped : SKINS[0].id;
  const upgrades = (chars.upgrades ?? {}) as Record<string, unknown>;
  const migrated: Progress = {
    ...defaults,
    coins: num(chars.bank),
    gems: num(chars.gems),
    runs: num(stats.runs),
    bestDistance: num(bestRaw),
    totalDistance: num(stats.totalDistance),
    lifetimeCoins: num(stats.totalCoins),
    bestScore: 0,
    owned,
    equipped,
    claimed: [],
    upgrades: {
      magnet: Math.max(0, Math.min(3, num(upgrades.magnet))),
      coin: Math.max(0, Math.min(3, num(upgrades.coin))),
    },
    music: settings.music !== false,
    sound: settings.sfx !== false,
  };
  try {
    localStorage.setItem(KEY, JSON.stringify(migrated));
  } catch {
    // Storage disabled: still use the migrated values for this session.
  }
  return migrated;
}

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
    if (!raw) return migrateLegacy(defaults) ?? defaults;
    const saved = JSON.parse(raw) as Partial<Progress>;
    const merged: Progress = {
      ...defaults,
      ...saved,
      owned: Array.isArray(saved.owned) && saved.owned.length ? saved.owned : defaults.owned,
      claimed: Array.isArray(saved.claimed) ? saved.claimed : [],
      upgrades: { magnet: 0, coin: 0, ...(saved.upgrades ?? {}) },
    };
    // A removed/unknown character must never stay equipped or unlock a catalogue entry.
    merged.owned = [...new Set([SKINS[0].id, ...merged.owned.filter(
      id => typeof id === 'string' && SKINS.some(skin => skin.id === id),
    )])];
    if (!merged.owned.includes(merged.equipped)) merged.equipped = SKINS[0].id;
    for (const key of ['coins', 'gems', 'runs', 'bestDistance', 'totalDistance', 'lifetimeCoins', 'bestScore'] as const) {
      const value = merged[key];
      merged[key] = typeof value === 'number' && Number.isFinite(value) ? Math.max(0, Math.floor(value)) : 0;
    }
    // Earlier v2 builds could create the new key with defaults before the player ever ran.
    // In that case still import the legacy save instead of treating the empty v2 key as real.
    const meaningful =
      Number(saved.bestDistance) > 0 ||
      Number(saved.coins) > 0 ||
      Number(saved.gems) > 0 ||
      Number(saved.runs) > 0 ||
      Number(saved.totalDistance) > 0 ||
      (Array.isArray(saved.owned) && saved.owned.length > 1) ||
      (Array.isArray(saved.claimed) && saved.claimed.length > 0) ||
      Object.values(merged.upgrades).some(level => Number.isFinite(level) && level > 0);
    if (!meaningful) {
      const legacy = migrateLegacy(defaults);
      if (legacy) {
        return {
          ...legacy,
          music: saved.music ?? legacy.music,
          sound: saved.sound ?? legacy.sound,
        };
      }
    }
    return merged;
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
  if (!SKINS.some(skin => skin.id === id) || !isOwned(id)) return;
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
