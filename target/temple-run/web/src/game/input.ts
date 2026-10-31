import { TiltSteering } from './steering';

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
  private touchStart: { x: number; y: number; id: number } | null = null;

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

  private tiltEnabled = false;
  private tiltListening = false;
  private readonly tilt = new TiltSteering();

  private classicControls=false;
  private leanLeft=false;
  private leanRight=false;
  setClassicControls(enabled:boolean):void {
    this.classicControls=enabled;this.leanLeft=false;this.leanRight=false;
  }
  // Desktop equivalent of holding a phone tilted; arrows/swipes change lanes, or turn at a junction.
  get steeringAxis(): number | null {
    if(this.classicControls&&(this.leanLeft||this.leanRight))return Number(this.leanRight)-Number(this.leanLeft);
    return this.tiltEnabled?this.tilt.axis:null;
  }
  get isTiltEnabled(): boolean { return this.tiltEnabled; }

  /** Opt-in device orientation steering (the original's "tilt to turn"). */
  async enableTilt(): Promise<boolean> {
    if (typeof DeviceOrientationEvent === 'undefined') return false;
    this.tilt.reset();
    this.tiltEnabled = true;
    const anyOrientation = DeviceOrientationEvent as unknown as { requestPermission?: () => Promise<'granted' | 'denied'> };
    if (typeof anyOrientation.requestPermission === 'function') {
      try {
        const granted = await anyOrientation.requestPermission();
        if (granted !== 'granted') {
          this.tiltEnabled = false;
          return false;
        }
      } catch {
        this.tiltEnabled = false;
        return false;
      }
    }
    if (!this.tiltListening) {
      this.tiltListening = true;
      window.addEventListener('deviceorientation', (event) => {
        if (!this.tiltEnabled) return;
        this.tilt.sample(event.gamma);
      });
    }
    return true;
  }

  disableTilt(): void {
    this.tiltEnabled = false;
    this.tilt.reset();
  }

  attach(windowTarget: Window, canvas: HTMLCanvasElement): void {
    const clearPointer=():void=>{
      const start=this.touchStart;this.touchStart=null;
      if(start&&canvas.hasPointerCapture?.(start.id))canvas.releasePointerCapture(start.id);
    };
    windowTarget.addEventListener('keydown', (event) => {
      if (event.repeat) return;
      if(this.classicControls&&(event.code==='KeyA'||event.code==='KeyD')){
        event.preventDefault();
        if(event.code==='KeyA')this.leanLeft=true;else this.leanRight=true;
        return;
      }
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

    windowTarget.addEventListener('keyup',event=>{
      if(event.code==='KeyA')this.leanLeft=false;
      if(event.code==='KeyD')this.leanRight=false;
    });
    windowTarget.addEventListener('blur',()=>{this.leanLeft=false;this.leanRight=false;clearPointer();});

    canvas.addEventListener('pointerdown', (event) => {
      if(event.button!==0||this.touchStart)return;
      this.touchStart = { x: event.clientX, y: event.clientY, id:event.pointerId };
      // Keep mouse/pen swipes bound when they leave the canvas. Synthetic test
      // pointers have no active browser pointer and may reject capture.
      try { canvas.setPointerCapture?.(event.pointerId); } catch { /* no active pointer */ }
    });
    canvas.addEventListener('pointerup', (event) => {
      if (event.button!==0||!this.touchStart||this.touchStart.id!==event.pointerId) return;
      const dx = event.clientX - this.touchStart.x;
      const dy = event.clientY - this.touchStart.y;
      clearPointer();
      const absX = Math.abs(dx);
      const absY = Math.abs(dy);
      if (Math.max(absX, absY) < 18) {
        this.push('jump');
        return;
      }
      if (absX > absY) this.push(dx > 0 ? 'right' : 'left');
      else this.push(dy > 0 ? 'slide' : 'jump');
    });
    canvas.addEventListener('pointercancel', event => {
      if(this.touchStart?.id===event.pointerId)clearPointer();
    });
    canvas.addEventListener('lostpointercapture', event => {
      if(this.touchStart?.id===event.pointerId)this.touchStart=null;
    });
  }
}
