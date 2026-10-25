import { Game } from './game';

let game: Game | null = null;

export async function bootGame(canvas: HTMLCanvasElement): Promise<Game> {
  game = new Game();
  await game.init(canvas);
  return game;
}

export function getGame(): Game | null {
  return game;
}
