import { reactive, readonly } from 'vue';
import type { ObstacleKind, PickupKind } from './components';
import type { Phase } from './components';

export interface HudState {
  phase: Phase;
  ready: boolean;
  distance: number;
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
  fps: number;
  skin: string;
  muted: boolean;
  music: boolean;
  sfx: boolean;
}

const defaults = (): HudState => ({
  phase: 'menu',
  ready: false,
  distance: 0,
  coins: 0,
  gems: 0,
  multiplier: 1,
  speed: 0,
  best: Number(localStorage.getItem('temple.best') ?? 0) || 0,
  totalCoins: Number(localStorage.getItem('temple.coins') ?? 0) || 0,
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
  fps: 60,
  skin: localStorage.getItem('temple.skin') ?? 'jhony',
  muted: false,
  music: true,
  sfx: true,
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

export function recordRun(distance: number, coins: number): void {
  state.best = Math.max(state.best, Math.floor(distance));
  state.totalCoins += coins;
  localStorage.setItem('temple.best', String(state.best));
  localStorage.setItem('temple.coins', String(state.totalCoins));
}

export function setSkin(id: string): void {
  state.skin = id;
  localStorage.setItem('temple.skin', id);
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
  };
  Object.assign(state, defaults(), keep);
}
