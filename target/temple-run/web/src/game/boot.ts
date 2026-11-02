import {startupMark} from './startupTiming';
import type { Game } from './game';

let game: Game | null = null;

export async function bootGame(canvas: HTMLCanvasElement): Promise<Game> {
  startupMark('game-import-start');
  const {Game}=await import('./game');
  startupMark('game-import-end');
  game = new Game();
  await game.init(canvas);
  return game;
}

export function getGame(): Game | null {
  return game;
}
