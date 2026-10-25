export type Action = 'left' | 'right' | 'jump' | 'slide' | 'pause' | 'start';

type Handler = (action: Action) => void;

/**
 * Input adapter: keyboard, touch swipes and on-screen buttons all push into one queue that
 * the input system drains once per tick. Keeping it queue-based makes the game deterministic
 * for tests (the bot can call `push()` directly).
 */
export class Input {
  private queue: Action[] = [];
  private handlers: Handler[] = [];
  private touchStart: { x: number; y: number } | null = null;

  push(action: Action): void {
    this.queue.push(action);
  }

  drain(): Action[] {
    const out = this.queue;
    this.queue = [];
    return out;
  }

  onAction(handler: Handler): void {
    this.handlers.push(handler);
  }

  private emit(action: Action): void {
    for (const handler of this.handlers) handler(action);
  }

  attach(windowTarget: Window, canvas: HTMLCanvasElement): void {
    windowTarget.addEventListener('keydown', (event) => {
      if (event.repeat) return;
      const map: Record<string, Action> = {
        ArrowLeft: 'left',
        KeyA: 'left',
        ArrowRight: 'right',
        KeyD: 'right',
        ArrowUp: 'jump',
        KeyW: 'jump',
        Space: 'jump',
        ArrowDown: 'slide',
        KeyS: 'slide',
        Escape: 'pause',
        KeyP: 'pause',
        Enter: 'start',
      };
      const action = map[event.code];
      if (action) {
        if (event.code.startsWith('Arrow') || event.code === 'Space') event.preventDefault();
        this.push(action);
      }
    });

    canvas.addEventListener('pointerdown', (event) => {
      this.touchStart = { x: event.clientX, y: event.clientY };
    });
    canvas.addEventListener('pointerup', (event) => {
      if (!this.touchStart) return;
      const dx = event.clientX - this.touchStart.x;
      const dy = event.clientY - this.touchStart.y;
      this.touchStart = null;
      const absX = Math.abs(dx);
      const absY = Math.abs(dy);
      if (Math.max(absX, absY) < 18) {
        this.push('jump');
        return;
      }
      if (absX > absY) this.push(dx > 0 ? 'right' : 'left');
      else this.push(dy > 0 ? 'slide' : 'jump');
    });
    canvas.addEventListener('pointercancel', () => {
      this.touchStart = null;
    });
  }
}
