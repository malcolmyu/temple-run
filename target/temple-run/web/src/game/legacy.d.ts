declare module '*/objNormals.js' {
  import type { Object3D } from 'three';
  export function repairObjNormals(root: Object3D): number;
}

declare module '*/runnerRig.js' {
  import type { Object3D } from 'three';
  export interface RunnerRig {
    object: Object3D;
    setClip(name: string, restart?: boolean): void;
    update(dt: number, timeScale?: number): void;
    setTime(t: number): void;
    joints?(): Record<string, [number, number, number]>;
  }
  export function loadRunnerRig(url: string, textureUrl: string, options?: Record<string, unknown>): Promise<RunnerRig>;
  export function buildRunnerRig(data: unknown, options?: Record<string, unknown>): RunnerRig;
  export function normalizeRigHeight(rig: RunnerRig, targetH?: number): RunnerRig;
}

declare module '*/sfx.js' {
  export function play(name: string, options?: Record<string, unknown>): void;
  export function unlockAudio(): void;
  export function startMusic(track?: string): void;
  export function pauseMusic(): void;
  export function setMuted(value: boolean): void;
  export function startLoop(name: string, options?: Record<string, unknown>): void;
  export function stopLoop(name: string, fade?: number): void;
  export function setLoopRate(name: string, rate: number): void;
  export function setAmbience(kind: string | null, level?: number): void;
  export function stopAmbience(fade?: number): void;
  export function setHallReverb(on: boolean): void;
  export function stopAllLoops(): void;
  export function stats(): Record<string, unknown>;
}
