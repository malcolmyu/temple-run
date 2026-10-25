import { reactive, readonly } from 'vue';
import { progress, recordRun as recordProgressRun, saveProgress } from './progress';
import type { ObstacleKind, PickupKind } from './components';
import type { Phase } from './components';

export interface HudState {
  phase: Phase;
  ready: boolean;
  distance: number;
  score: number;
  charge: number;
  coins: number;
  gems: number;
  multiplier: number;
  speed: number;
  best: number;
  totalCoins: number;
  lane: number;
  jump: number;
  sliding: number;
  turnDirection: 0 | 1 | -1;
  turnRemaining: number;
  turnQueued: boolean;
  chaseGap: number;
  power: PickupKind | null;
  powerRemaining: number;
  nextCue: ObstacleKind | null;
  hint: string;
  deathReason: string;
  deathKind: 'impact' | 'fall' | 'caught' | 'missed' | '';
  fps: number;
  skin: string;
  bankCoins: number;
  bankGems: number;
  muted: boolean;
  music: boolean;
  sfx: boolean;
  reviveAvailable: boolean;
  reviveCost: number;
}

const defaults = (): HudState => ({
  phase: 'menu',
  ready: false,
  distance: 0,
  score: 0,
  charge: 0,
  coins: 0,
  gems: 0,
  multiplier: 1,
  speed: 0,
  best: progress.bestDistance,
  totalCoins: progress.coins,
  lane: 1,
  jump: 0,
  sliding: 0,
  turnDirection: 0,
  turnRemaining: 0,
  turnQueued: false,
  chaseGap: 11.5,
  power: null,
  powerRemaining: 0,
  nextCue: null,
  hint: '',
  deathReason: '',
  deathKind: '',
  fps: 60,
  skin: progress.equipped,
  bankCoins: progress.coins,
  bankGems: progress.gems,
  muted: false,
  music: progress.music,
  sfx: progress.sound,
  reviveAvailable: false,
  reviveCost: 2,
});

const state = reactive<HudState>(defaults());

export const ui = readonly(state) as Readonly<HudState>;
export const mutableUi = state;

export function setPhase(phase: Phase): void {
  state.phase = phase;
}

export function setHint(text: string): void {
  state.hint = text;
  window.clearTimeout(hintTimer);
  hintTimer = window.setTimeout(() => {
    if (state.hint === text) state.hint = '';
  }, 1400);
}
let hintTimer = 0;

export function recordRun(distance: number, coins: number, gems: number, score: number): void {
  recordProgressRun(distance, coins, gems, score);
  state.best = progress.bestDistance;
  state.totalCoins = progress.coins;
  state.bankCoins = progress.coins;
  state.bankGems = progress.gems;
}

export function setSkin(id: string): void {
  state.skin = id;
}

export function syncBanks(): void {
  state.bankCoins = progress.coins;
  state.bankGems = progress.gems;
  state.totalCoins = progress.coins;
  state.best = progress.bestDistance;
}

export function setAudioSettings(music: boolean, sound: boolean): void {
  state.music = music;
  state.sfx = sound;
  progress.music = music;
  progress.sound = sound;
  saveProgress();
}

export function resetHud(): void {
  const keep = {
    best: state.best,
    totalCoins: state.totalCoins,
    skin: state.skin,
    muted: state.muted,
    music: state.music,
    sfx: state.sfx,
    ready: state.ready,
    bankCoins: state.bankCoins,
    bankGems: state.bankGems,
  };
  Object.assign(state, defaults(), keep);
}
