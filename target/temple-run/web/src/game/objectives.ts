import { progress, claimObjective } from './progress';

export interface Objective {
  id: string;
  title: string;
  detail: string;
  coins: number;
  gems: number;
  done: () => boolean;
  current: () => number;
  target: number;
}

export const OBJECTIVES: Objective[] = [
  {
    id: 'first-500',
    title: '初次远征',
    detail: '单局跑出 500 m',
    coins: 100,
    gems: 0,
    target: 500,
    current: () => Math.min(progress.bestDistance, 500),
    done: () => progress.bestDistance >= 500,
  },
  {
    id: 'coin-hoard',
    title: '金币猎人',
    detail: '累计收集 200 枚金币',
    coins: 150,
    gems: 0,
    target: 200,
    current: () => Math.min(Math.max(progress.lifetimeCoins, progress.claimed.includes('coin-hoard') ? 200 : 0), 200),
    done: () => progress.lifetimeCoins >= 200 || progress.claimed.includes('coin-hoard'),
  },
  {
    id: 'collector',
    title: '收藏家',
    detail: '解锁 3 个角色',
    coins: 0,
    gems: 2,
    target: 3,
    current: () => Math.min(progress.owned.length, 3),
    done: () => progress.owned.length >= 3,
  },
  {
    id: 'marathon',
    title: '长跑者',
    detail: '单局跑出 1500 m',
    coins: 300,
    gems: 1,
    target: 1500,
    current: () => Math.min(progress.bestDistance, 1500),
    done: () => progress.bestDistance >= 1500,
  },
];

export function objectiveClaimed(id: string): boolean {
  return progress.claimed.includes(id);
}

export function claim(id: string): boolean {
  const objective = OBJECTIVES.find((o) => o.id === id);
  if (!objective || !objective.done()) return false;
  return claimObjective(id, objective.coins, objective.gems);
}
