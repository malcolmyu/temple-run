export type DifficultyName = 'classic' | 'challenge';

export interface DifficultyConfig {
  name: DifficultyName;
  minGap: number;
  gapJitter: number;
  turnMin: number;
  doubleChance: number;
  jumpWindow: number;
  slideWindow: number;
  speedMax: number;
  speedGrowth: number;
}

export const DIFFICULTIES: Record<DifficultyName, DifficultyConfig> = {
  /** Recovered APK spacing: 6 path spaces, no double obstacle. */
  classic: {
    name: 'classic',
    minGap: 72,
    gapJitter: 24,
    turnMin: 84,
    doubleChance: 0,
    jumpWindow: 1.0,
    slideWindow: 0.75,
    speedMax: 20,
    speedGrowth: 0.012,
  },
  /** Player-tuned mode: more obstacles, tighter timing, faster late game. */
  challenge: {
    name: 'challenge',
    minGap: 38,
    gapJitter: 14,
    turnMin: 60,
    doubleChance: 0.15,
    jumpWindow: 0.58,
    slideWindow: 0.46,
    speedMax: 22,
    speedGrowth: 0.02,
  },
};

const STORAGE_KEY = 'temple.difficulty';

export function getDifficulty(): DifficultyConfig {
  try {
    const query = new URLSearchParams(window.location.search).get('difficulty');
    const stored = window.localStorage.getItem(STORAGE_KEY);
    const name = query === 'classic' || query === 'challenge'
      ? query
      : stored === 'classic' || stored === 'challenge'
        ? stored
        : 'challenge';
    return DIFFICULTIES[name];
  } catch {
    return DIFFICULTIES.challenge;
  }
}

export function setDifficulty(name: DifficultyName): void {
  try {
    window.localStorage.setItem(STORAGE_KEY, name);
  } catch {
    // Storage can be unavailable in private mode; the query parameter still works.
  }
}
