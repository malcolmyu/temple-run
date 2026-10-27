import * as THREE from 'three';
import { World, type Entity } from './ecs/world';
import { TrackPath } from './path';
import { TrackGraph } from './trackGraph';
import {
  Chase,
  Chaser,
  Jump,
  Lane,
  Obstacle,
  Pickup,
  Power,
  RunStats,
  Runner,
  Slide,
  Speed,
  Tile,
  TrackPos,
  Turn,
  type ObstacleKind,
  type PickupKind,
} from './components';
import {
  CHASE_GAP_MAX,
  COIN_Y,
  GRAVITY,
  JUMP_VELOCITY,
  LANES,
  RUN_SPEED,
  RUN_SPEED_MAX,
  RUN_SPEED_MIN,
  SLIDE_TIME,
  SPEED_GROWTH,
  TILE,
  TURN_CUE_DISTANCE,
  TURN_PREBUILD_DISTANCE,
  laneX,
} from './config';
import { createWorld, buildTile, buildJunction, buildObstacle, buildCoin, buildGem, buildPower, buildChaser, buildNarrowOverlay, mergeStaticMeshes, type Assets, type SceneBundle } from './render';
import { Input, type Action } from './input';
import { narrowAt, terrainAt, type TerrainKind } from './terrain';
import { surfaceAt, type SurfaceKind } from './surface';
import { sidePathAt } from './sidePath';
import { getDifficulty, type DifficultyConfig } from './difficulty';
import { recordRun, resetHud, setHint, showMilestone, setPhase, setSkin, syncBanks, mutableUi as mutateUi } from './state';
import { progress, isOwned, saveProgress } from './progress';
import { coinMultiplier, magnetBonusSeconds } from './upgrades';
import { MAX_COINS_PER_RUN, MIN_BONUS_ITEM_SPACING, MIN_TURN_SPACING } from './pathRules';
import { DEFS, KIND_TO_DEF, type DefId } from './obstacles/catalog';
import type { ObstacleAction, ObstacleDef, ObstaclePlan } from './obstacles/types';
import { pickObstacle, defForKind, ORIGINAL_SPAWNER_CONFIG } from './obstacles/spawner';
import { collisionWouldHit, laneIsBlocked } from './obstacles/collision';
import { SeededRandom } from './obstacles/rng';
import { DEFAULT_RIG_URL, SKINS as SKIN_CATALOG, skinById } from './skins';
import { loadRunnerRig, normalizeRigHeight } from '../runnerRig.js';
import * as sfx from '../sfx.js';

export const SKIN_IDS = SKIN_CATALOG.map((skin) => skin.id);
export const DEFAULT_SKIN_URL = DEFAULT_RIG_URL;

const isGapKind = (kind: ObstacleKind): boolean => kind === 'gap' || kind === 'gapLong';

const BASE = import.meta.env.BASE_URL;

interface ObstacleSpawn {
  kind: ObstacleKind;
  lane: number;
  distance: number;
  full: boolean;
}

export class Game {
  readonly world = new World();
  readonly graph = new TrackGraph();
  get path(): TrackPath { return this.graph.active; }
  readonly input = new Input();
  bundle!: SceneBundle;
  private canvas!: HTMLCanvasElement;
  private runnerEntity: Entity = 0;
  private chaserEntity: Entity = 0;
  private runnerRig: { setClip(name: string, restart?: boolean): void; update(dt: number, timeScale?: number): void; object: THREE.Object3D } | null = null;
  private runnerGroup = new THREE.Group();
  private wingsGroup = new THREE.Group();
  private wingSprites: THREE.Sprite[] = [];
  private chaserGroup = new THREE.Group();
  private rigToken = 0;
  private tiles = new Map<number, Entity>();
  private junctions = new Map<number, THREE.Group>();
  private obstacles: Entity[] = [];
  private pickups: Entity[] = [];
  // Shared prototypes and pools: an endless runner must not allocate new GPU geometry per
  // tile/coin/obstacle. Clones share geometry and materials; only instances are created.
  private tilePrototypes = new Map<string, THREE.Group>();
  private tilePools = new Map<string, THREE.Group[]>();
  private narrowOverlays = new Map<string, THREE.Group>();
  private junctionPrototypes = new Map<1 | -1, THREE.Group>();
  private obstaclePools = new Map<string, THREE.Object3D[]>();
  private pickupPools = new Map<PickupKind, THREE.Object3D[]>();
  private nextSpawn = 80;
  private obstacleRng = new SeededRandom(0x51ed270b);
  private difficulty: DifficultyConfig = getDifficulty();
  private lastObstacleDistance = 0;
  private nextPickup = MIN_BONUS_ITEM_SPACING;
  private deathTimer = 0;
  private lastFrame = 0;
  private raf = 0;
  private running = false;
  private paused = false;
  private hintCooldown = 0;
  private stepAccumulator = 0;
  /** Fractional coin value, so the +25% upgrade is not rounded away coin by coin. */
  private coinValueAcc = 0;
  private cameraPos = new THREE.Vector3(0, 5.25, 10);
  private cameraLook = new THREE.Vector3(0, 1.15, -10);
  private disposed = false;
  private fpsSamples: number[] = [];
  private maxPixelRatio = 2;
  private qualityCheckAt = 0;

  async init(canvas: HTMLCanvasElement): Promise<void> {
    this.canvas = canvas;
    this.bundle = await createWorld(canvas);
    this.maxPixelRatio = this.bundle.renderer.getPixelRatio();
    this.bundle.scene.add(this.runnerGroup);
    this.bundle.scene.add(this.chaserGroup);
    this.input.attach(window, canvas);
    this.resize();
    window.addEventListener('resize', this.resize);
    await this.setSkin(isOwned(progress.equipped) ? progress.equipped : 'jhony');
    this.resetWorld();
    mutateUi.ready = true;
    mutateUi.speed = RUN_SPEED;
    this.bindDebugApi();
    this.renderOnce();
    this.startLoop();
  }

  private bindDebugApi(): void {
    (window as unknown as Record<string, unknown>).__templeGame = {
      state: () => this.debugState(),
      jumpTo: (distance: number) => this.jumpTo(distance),
      start: () => this.start(),
      restart: () => this.restart(),
      toMenu: () => this.toMenu(),
      pause: () => this.togglePause(),
      revive: () => this.revive(),
      progress: () => ({ ...progress }),
      spawnMonkey: () => this.spawnMonkey(this.distance + 10),
      audio: () => sfx.stats(),
      gpu: () => ({
        geometries: this.bundle.renderer.info.memory.geometries,
        textures: this.bundle.renderer.info.memory.textures,
        calls: this.bundle.renderer.info.render.calls,
        triangles: this.bundle.renderer.info.render.triangles,
      }),
      enableTilt: () => this.input.enableTilt(),
      stepLoop: () => this.stepLoop,
      chaserInfo: () => {
        const box = new THREE.Box3().setFromObject(this.chaserGroup);
        const size = box.getSize(new THREE.Vector3());
        const mats: string[] = [];
        this.chaserGroup.traverse((object: THREE.Object3D) => {
          const mesh = object as THREE.Mesh;
          if (mesh.isMesh) {
            const material = mesh.material as THREE.MeshStandardMaterial;
            mats.push(`${material?.type ?? '?'}:${material?.map ? 'map' : 'nomap'}:${mesh.geometry?.type ?? '?'}`);
          }
        });
        return { size: size.toArray().map((n) => +n.toFixed(2)), min: box.min.toArray().map((n) => +n.toFixed(2)), mats };
      },
      chaser: () => ({
        pos: this.chaserGroup.position.toArray().map((n) => +n.toFixed(2)),
        children: this.chaserGroup.children.length,
        visible: this.chaserGroup.visible,
        enemyLoaded: !!this.bundle.assets.enemy,
        gap: this.world.require(this.runnerEntity, Chase).gap,
      }),
      attemptTurn: (dir: 1 | -1) => this.queueTurn(dir),
      setNextTurn: (distance: number) => {
        const turn = this.world.require(this.runnerEntity, Turn);
        turn.next = distance;
      },
      spawnObstacle: (kind: ObstacleKind, ahead = 16) => this.spawnObstacle(kind, Math.floor(Math.random() * 3), this.distance + ahead),
      advance: (ms: number) => this.advance(ms),
      power: (kind: PickupKind) => {
        const power = this.world.require(this.runnerEntity, Power);
        power.kind = kind;
        power.until = this.world.elapsed + 10;
      },
      press: (action: Action) => this.input.push(action),
      setSkin: (id: string, force = false) => this.setSkin(id, force),
      skins: SKIN_IDS,
      camera: () => this.bundle.camera.position.toArray(),
      runner: () => ({
        pos: this.runnerGroup.position.toArray().map((n) => +n.toFixed(2)),
        children: this.runnerGroup.children.length,
        rig: !!this.runnerRig,
        scale: this.runnerGroup.scale.toArray(),
      }),
      scene: () => ({ tiles: this.tiles.size, obstacles: this.obstacles.length, pickups: this.pickups.length }),
      terrain: (d: number) => terrainAt(d, this.path),
      narrow: (d: number) => narrowAt(d, this.path),
      sidePath: (d: number) => sidePathAt(d, this.path),
    };
  }

  private debugState(): Record<string, unknown> {
    const turn = this.world.require(this.runnerEntity, Turn);
    const jump = this.world.require(this.runnerEntity, Jump);
    const slide = this.world.require(this.runnerEntity, Slide);
    const stats = this.world.require(this.runnerEntity, RunStats);
    const chase = this.world.require(this.runnerEntity, Chase);
    return {
      phase: mutateUi.phase,
      distance: Math.floor(this.distance),
      fps: mutateUi.fps,
      coins: stats.coins,
      gems: stats.gems,
      lane: this.world.require(this.runnerEntity, Lane).index,
      jumpY: jump.y,
      sliding: slide.remaining,
      speed: this.speed,
      nextTurn: turn.next,
      turnDirection: turn.direction,
      turnQueued: turn.queued,
      turnCount: turn.count,
      chaseGap: chase.gap,
      obstacles: this.obstacles.map((entity) => {
        const o = this.world.require(entity, Obstacle);
        return { kind: o.kind, lane: o.lane, full: o.full, ahead: Math.round(o.distance - this.distance) };
      }),
      pickups: this.pickups.map((entity) => {
        const p = this.world.require(entity, Pickup);
        return { kind: p.kind, lane: p.lane, ahead: Math.round(p.distance - this.distance) };
      }),
      rig: this.runnerRig ? 'ready' : 'pending',
    };
  }

  private get distance(): number {
    return this.world.require(this.runnerEntity, TrackPos).distance;
  }

  private get speed(): number {
    return this.world.require(this.runnerEntity, Speed).value;
  }

  private resize = (): void => {
    const rect = this.canvas.getBoundingClientRect();
    const width = Math.max(1, rect.width);
    const height = Math.max(1, rect.height);
    this.bundle.renderer.setSize(width, height, false);
    this.bundle.camera.aspect = width / height;
    this.bundle.camera.fov = width / height < 0.7 ? 65 : 58;
    this.bundle.camera.updateProjectionMatrix();
  };

  /** Remove an entity's 3D object from the scene before dropping the entity. */
  private removeEntityObject(entity: Entity): void {
    const obstacle = this.world.get(entity, Obstacle);
    if (obstacle?.object) this.releaseObstacle(obstacle.object);
    const pickup = this.world.get(entity, Pickup);
    if (pickup?.object) this.releasePickup(pickup.kind, pickup.object);
    const tile = this.world.get(entity, Tile);
    if (tile?.object) this.releaseTile(tile.object);
    this.world.destroyEntity(entity);
  }

  private createRunner(): void {
    this.runnerEntity = this.world.createEntity();
    this.world.add(this.runnerEntity, TrackPos, { distance: 0, side: 0, smooth: true });
    this.world.add(this.runnerEntity, Lane, { index: 1, x: 0 });
    this.world.add(this.runnerEntity, Jump);
    this.world.add(this.runnerEntity, Slide);
    this.world.add(this.runnerEntity, Speed, { value: RUN_SPEED });
    this.world.add(this.runnerEntity, RunStats);
    this.world.add(this.runnerEntity, Chase, { gap: CHASE_GAP_MAX });
    this.world.add(this.runnerEntity, Turn, { next: 57 });
    this.world.add(this.runnerEntity, Power);
    this.world.add(this.runnerEntity, Runner, { rig: null });
  }

  private resetWorld(): void {
    if (this.runnerEntity) this.world.destroyEntity(this.runnerEntity);
    if (this.chaserEntity) this.world.destroyEntity(this.chaserEntity);
    for (const entity of [...this.obstacles, ...this.pickups, ...[...this.tiles.values()]]) this.removeEntityObject(entity);
    for (const entity of this.world.query(Obstacle)) this.removeEntityObject(entity);
    this.obstacles = [];
    this.pickups = [];
    this.tiles.clear();
    for (const [distance, group] of this.junctions) {
      this.bundle.scene.remove(group);
      this.junctions.delete(distance);
    }
    if (this.stepLoop) {
      sfx.stopLoop(this.stepLoop, 0.1);
      this.stepLoop = null;
    }
    if (this.monkeyGroup) {
      this.bundle.scene.remove(this.monkeyGroup);
      this.monkeyGroup = null;
    }
    this.runnerGroup.clear();
    if (this.runnerRig) this.runnerGroup.add(this.runnerRig.object);
    this.installWings();
    this.chaserGroup.clear();
    this.path.segments.length = 0;
    this.path.segments.push({ start: 0, end: Infinity, x: 0, z: 3, heading: 0 });
    this.difficulty = getDifficulty();
    this.nextSpawn = 80;
    this.nextPickup = MIN_BONUS_ITEM_SPACING;
    this.lastObstacleDistance = 0;
    this.obstacleRng = new SeededRandom((Date.now() ^ 0x9e3779b9) >>> 0);
    this.deathTimer = 0;
    this.hintCooldown = 0;
    this.narrowWarned = false;
    this.sideWarned = false;
    this.lastMilestone = 0;
    this.invincibleUntil = 0;
    this.reviveUsed = false;
    this.stepAccumulator = 0;
    this.coinValueAcc = 0;
    this.runCommitted = false;
    this.createRunner();
    const chaser = this.world.createEntity();
    this.world.add(chaser, TrackPos, { distance: -6, side: 0, smooth: true });
    this.world.add(chaser, Chaser, { object: null });
    this.chaserEntity = chaser;
    this.chaserGroup.add(buildChaser(this.bundle.assets));
    this.chaserGroup.position.set(0, 0, 9);
    this.cameraPos.set(0, 5.25, 10);
    this.cameraLook.set(0, 1.15, -10);
    this.ensureTiles();
    this.syncRunnerObject();
    resetHud();
  }

  start(): void {
    if (mutateUi.phase === 'ended') this.commitRun();
    this.resetWorld();
    mutateUi.phase = 'playing';
    mutateUi.speed = RUN_SPEED;
    setPhase('playing');
    sfx.unlockAudio();
    if (progress.music) sfx.startMusic('theme');
    this.paused = false;
    this.startLoop();
  }

  restart(): void {
    this.start();
  }

  togglePause(): void {
    if (mutateUi.phase === 'playing') {
      this.paused = true;
      setPhase('paused');
      sfx.pauseMusic();
    } else if (mutateUi.phase === 'paused') {
      this.paused = false;
      setPhase('playing');
      if (progress.music) sfx.startMusic('theme');
    }
  }

  resume(): void {
    if (mutateUi.phase === 'paused') {
      this.paused = false;
      setPhase('playing');
      if (progress.music) sfx.startMusic('theme');
    }
  }

  toMenu(): void {
    if (mutateUi.phase === 'ended') this.commitRun();
    setPhase('menu');
    this.paused = true;
    this.resetWorld();
  }

  async setSkin(id: string, force = false): Promise<void> {
    const skin = skinById(id);
    if (!force && !isOwned(id)) return;
    setSkin(id);
    progress.equipped = id;
    saveProgress();
    const token = ++this.rigToken;
    this.runnerGroup.clear();
    try {
      const rig = await loadRunnerRig(
        `${BASE}assets/characters/rig-${skin.rig}.json`,
        `${BASE}assets/characters/${skin.texture}`,
        {
          scale: 0.27,
          yOffset: 1.32,
          clipFallbackUrl: DEFAULT_SKIN_URL,
        },
      );
      if (token !== this.rigToken || this.disposed) return;
      normalizeRigHeight(rig, 2.55);
      this.runnerRig = rig;
      this.runnerGroup.add(rig.object);
      this.installWings();
    } catch (error) {
      console.warn('runner rig unavailable, using proxy', error);
      const proxy = new THREE.Mesh(new THREE.CapsuleGeometry(0.35, 1.1, 4, 8), new THREE.MeshStandardMaterial({ color: 0xd6b388 }));
      proxy.position.y = 1.1;
      this.runnerGroup.add(proxy);
      this.runnerRig = null;
      this.installWings();
    }
  }

  /** Blue wings are the visual for the shield power-up, not a permanent mod skin. */
  private installWings(): void {
    const texture = this.bundle.assets.texture.wings;
    this.wingsGroup.clear();
    this.wingSprites = [];
    if (!texture) return;
    // wings.png is one complete pair, not a single wing; use one billboard behind the runner.
    const material = new THREE.SpriteMaterial({ map: texture, transparent: true, opacity: 0.9, depthWrite: false });
    const wing = new THREE.Sprite(material);
    wing.scale.set(2.0, 1.25, 1);
    wing.position.set(0, 1.7, 0.36);
    wing.renderOrder = 3;
    this.wingSprites.push(wing);
    this.wingsGroup.add(wing);
    this.wingsGroup.visible = false;
    this.runnerGroup.add(this.wingsGroup);
  }

  private startLoop(): void {
    if (this.running) return;
    this.running = true;
    this.lastFrame = performance.now();
    const frame = (now: number): void => {
      if (this.disposed) return;
      const dt = Math.min(0.05, Math.max(0.001, (now - this.lastFrame) / 1000));
      this.lastFrame = now;
      this.frame(dt);
      this.raf = requestAnimationFrame(frame);
    };
    this.raf = requestAnimationFrame(frame);
  }

  private frame(dt: number): void {
    // Menus need input too: Enter starts a run and Escape pauses without a simulation tick.
    this.drainInput();
    if (mutateUi.phase === 'playing') {
      this.tick(dt);
    } else if (mutateUi.phase === 'dying') {
      this.updateDeath(dt);
    }
    this.syncObjects(dt);
    this.renderOnce();
    this.trackFps(dt);
  }

  /** One deterministic simulation step (also used by the regression bot). */
  tick(dt: number): void {
    // Advance the ECS clock: gameplay timers (invincibility, powers, jump windows) all read
    // world.elapsed, so without this the whole run freezes at t=0.
    this.world.update(dt);
    this.drainInput();
    this.updateTurnCue();
    this.updateRunner(dt);
    this.ensureTiles();
    this.spawnWaves();
    this.updateObstacles(dt);
    this.updatePickups(dt);
    this.updateChase(dt);
    this.updateMonkey(dt);
    this.updateCamera(dt);
    this.syncHud(dt);
  }

  /** The death beat: keep the world frozen, then hand control to the result screen. */
  private updateDeath(dt: number): void {
    this.deathTimer -= dt;
    if (this.deathTimer <= 0) this.finishDeath();
  }

  advance(ms: number): void {
    const steps = Math.max(1, Math.ceil(ms / 25));
    const dt = Math.min(0.05, ms / steps / 1000);
    for (let i = 0; i < steps; i++) {
      if (mutateUi.phase === 'playing') this.tick(dt);
      else if (mutateUi.phase === 'dying') this.updateDeath(dt);
      else break;
    }
  }

  private drainInput(): void {
    for (const action of this.input.drain()) {
      if (action === 'left') this.move(-1);
      else if (action === 'right') this.move(1);
      else if (action === 'jump') this.jump();
      else if (action === 'slide') this.slide();
      else if (action === 'pause') this.togglePause();
      else if (action === 'start' && (mutateUi.phase === 'menu' || mutateUi.phase === 'ended')) this.start();
    }
  }

  private move(dir: 1 | -1): void {
    if (mutateUi.phase !== 'playing') return;
    const turn = this.world.require(this.runnerEntity, Turn);
    const distance = this.distance;
    if (turn.direction !== 0 && distance >= turn.next - TURN_CUE_DISTANCE && distance < turn.next + 2 && dir === turn.direction && !turn.queued) {
      this.queueTurn(dir);
    }
    const lane = this.world.require(this.runnerEntity, Lane);
    lane.index = Math.max(0, Math.min(2, lane.index + dir));
    sfx.play('swish', { gain: 0.55, rate: 0.95 + Math.random() * 0.1 });
  }

  private queueTurn(dir: 1 | -1): void {
    const turn = this.world.require(this.runnerEntity, Turn);
    if (turn.queued) return;
    turn.queued = true;
    sfx.play('click', { gain: 0.5 });
    setHint('方向正确，保持住！');
  }

  private jump(): void {
    if (mutateUi.phase !== 'playing') return;
    const jump = this.world.require(this.runnerEntity, Jump);
    if (jump.y <= 0.02 && jump.v <= 0) {
      jump.v = JUMP_VELOCITY;
      jump.airborne = true;
      jump.lastJumpAt = this.world.elapsed;
      const slide = this.world.require(this.runnerEntity, Slide);
      slide.remaining = 0;
      setHint('跳！');
      sfx.play('jump', { gain: 0.85 });
      sfx.play('whoosh', { gain: 0.32, rate: 1.12 });
    }
  }

  private slide(): void {
    if (mutateUi.phase !== 'playing') return;
    const jump = this.world.require(this.runnerEntity, Jump);
    const slide = this.world.require(this.runnerEntity, Slide);
    if (jump.y < 0.12) {
      slide.remaining = SLIDE_TIME;
      slide.lastSlideAt = this.world.elapsed;
      setHint('滑铲！');
      sfx.play('slide', { gain: 1.3 });
    } else {
      jump.v = -8;
    }
  }

  private updateTurnCue(): void {
    const turn = this.world.require(this.runnerEntity, Turn);
    const distance = this.distance;
    if (turn.direction === 0 && distance > turn.next - TURN_PREBUILD_DISTANCE) {
      this.prebuildTurn();
    }
    if (turn.direction !== 0 && distance > turn.next - TURN_CUE_DISTANCE && !turn.cueShown) {
      turn.cueShown = true;
      sfx.play('whoosh', { gain: 0.8 });
      // Coins arc through the corner so the turn reads clearly.
      for (let i = 0; i < MAX_COINS_PER_RUN; i++) this.spawnCoin(1, turn.next - 5 + i * 2.2, COIN_Y + Math.sin(i / Math.max(1, MAX_COINS_PER_RUN - 1) * Math.PI) * 0.4);
    }
    const remaining = Math.max(0, Math.ceil(turn.next - distance));
    mutateUi.turnDirection = turn.direction;
    mutateUi.turnRemaining = remaining;
    mutateUi.turnQueued = turn.queued;
    if (turn.queued && distance >= turn.next) this.completeTurn();
    if (!turn.queued && distance > turn.next + 4.0) this.die('错过路口', 'missed');
  }

  private prebuildTurn(): void {
    const turn = this.world.require(this.runnerEntity, Turn);
    if (turn.direction !== 0) return;
    const direction: 1 | -1 = Math.random() > 0.5 ? 1 : -1;
    turn.direction = direction;
    // Route through TrackGraph rather than mutating the only path object. The chosen
    // branch becomes the active path; the other branch is retained in the fork for the
    // T/choice implementation in the next milestone.
    const fork = this.graph.fork(turn.next);
    this.graph.choose(fork, direction > 0 ? 'right' : 'left');
    const junction = this.acquireJunction(direction, turn.next);
    this.bundle.scene.add(junction);
    this.junctions.set(turn.next, junction);
    // Terrain classification depends on the corner distance, so rebuild the road ahead.
    this.rebuildTilesAhead();
    this.ensureTiles();
  }

  private completeTurn(): void {
    const turn = this.world.require(this.runnerEntity, Turn);
    turn.count += 1;
    turn.cueShown = false;
    turn.queued = false;
    turn.lastDirection = turn.direction;
    turn.lastTurnDistance = turn.next;
    turn.direction = 0;
    const length = this.difficulty.turnMin + 12 + Math.floor(Math.random() * 3) * 12;
    turn.next = 9 + 12 * Math.max(1, Math.round((turn.next + length - 9) / 12));
    setHint('漂亮的转弯！');
    sfx.play('swish', { rate: 1.15 });
    this.rebuildTilesAhead();
    this.ensureTiles();
  }

  private updateRunner(dt: number): void {
    const distance = this.distance;
    const speed = this.world.require(this.runnerEntity, Speed);
    speed.value = RUN_SPEED_MIN + Math.min(this.difficulty.speedMax - RUN_SPEED_MIN, distance * this.difficulty.speedGrowth);
    const power = this.world.require(this.runnerEntity, Power);
    const boost = power.kind === 'boost' && this.world.elapsed < power.until;
    // Skins carry the same speed flavour as the original store (werewolf lumbers, Scarlett sprints).
    const currentSpeed = speed.value * skinById(progress.equipped).speed * (boost ? 1.35 : 1);
    const trackPos = this.world.require(this.runnerEntity, TrackPos);
    trackPos.distance += currentSpeed * dt;
    const lane = this.world.require(this.runnerEntity, Lane);
    lane.x = THREE.MathUtils.damp(lane.x, laneX(lane.index), 12, dt);

    const jump = this.world.require(this.runnerEntity, Jump);
    if (jump.y > 0 || jump.v > 0) {
      jump.v -= GRAVITY * dt;
      jump.y += jump.v * dt;
      if (jump.y <= 0) {
        jump.y = 0;
        jump.v = 0;
        jump.airborne = false;
        sfx.play('land', { gain: 0.7 });
      }
    }
    const slide = this.world.require(this.runnerEntity, Slide);
    if (slide.remaining > 0) slide.remaining = Math.max(0, slide.remaining - dt);
    // Collapsed-lane sections: leaving the surviving lane drops the runner into the canyon.
    const narrow = narrowAt(trackPos.distance, this.path);
    const activeSide = sidePathAt(trackPos.distance, this.path);
    // Warn before the slab ends: the one surviving lane needs an early lane change.
    // A side-path fork owns the warning slot while it is active.
    if (!narrow && !activeSide && !this.narrowWarned) {
      const ahead = narrowAt(trackPos.distance + 32, this.path);
      if (ahead) {
        this.narrowWarned = true;
        setHint(`前方半边路 · 靠${ahead.side === 'left' ? '左' : '右'}！`);
      }
    }
    if (narrow) {
      if (!this.narrowWarned) {
        this.narrowWarned = true;
        setHint(`半边路 · 靠${narrow.side === 'left' ? '左' : '右'}侧！`);
      }
      if (!narrow.safe.includes(lane.index)) {
        this.die('踩空坠下悬崖', 'fall');
        return;
      }
    } else if (this.narrowWarned) {
      this.narrowWarned = false;
    }
    const side = sidePathAt(trackPos.distance, this.path);
    if (side) {
      if (!this.sideWarned) {
        this.sideWarned = true;
        setHint('左右分路 · 选一边！');
      }
      if (lane.index === 1) {
        this.die('踩空坠下分路缺口', 'fall');
        return;
      }
    } else if (this.sideWarned) {
      this.sideWarned = false;
    } else if (!this.narrowWarned) {
      const ahead = sidePathAt(trackPos.distance + 24, this.path);
      if (ahead) setHint('前方左右分路 · 选一边！');
    }
    this.updateFootsteps(trackPos.distance, currentSpeed);
    const stats = this.world.require(this.runnerEntity, RunStats);
    stats.distance = trackPos.distance;
    if (stats.comboTimer > 0) {
      stats.comboTimer -= dt;
      if (stats.comboTimer <= 0) {
        stats.combo = 0;
        stats.multiplier = 1;
      }
    }
    stats.score = Math.floor(trackPos.distance) + stats.coins * 10 * stats.multiplier + stats.gems * 100;
    const milestone = Math.floor(trackPos.distance / 500);
    if (milestone > 0 && milestone !== this.lastMilestone) {
      this.lastMilestone = milestone;
      const reached = milestone * 500;
      showMilestone(reached, 'm', reached >= Math.max(1000, progress.bestDistance) ? 'highscore' : 'nicejob');
      sfx.play('jingle', { gain: 0.8 });
    }
    mutateUi.distance = Math.floor(trackPos.distance);
    mutateUi.speed = currentSpeed;
    mutateUi.jump = jump.y;
    mutateUi.sliding = slide.remaining;
    mutateUi.lane = lane.index;
    mutateUi.multiplier = stats.multiplier;
  }

  /** Drop generated tiles ahead (their layout depends on the path/turn positions). */
  private rebuildTilesAhead(): void {
    for (const [index, entity] of [...this.tiles]) {
      const tile = this.world.require(entity, Tile);
      if (tile.distance > this.distance + 4) {
        if (tile.object) this.releaseTile(tile.object);
        this.world.destroyEntity(entity);
        this.tiles.delete(index);
      }
    }
  }

  /**
   * Reuse a pooled 12 m tile instance when possible. The prototype / merged geometry is
   * shared; the pool avoids recreating the Object3D tree every 12 m (a steady GC stutter).
   */
  private acquireTile(index: number, terrain: TerrainKind, narrow: ReturnType<typeof narrowAt> | null, clearScenery = false, surface: SurfaceKind = 'stone', sidePath = false, sidePathLast = false, surfaceFirst = false, surfaceLast = false): THREE.Group {
    const firstTile = narrow ? index === Math.floor((narrow.from + 9) / TILE) : false;
    const gate = Boolean(this.bundle.assets.gate && index % 5 === 2 && terrain === 'temple' && !clearScenery);
    const narrowKey = narrow ? `${narrow.side}:${firstTile ? 1 : 0}` : 'none';
    const key = `${terrain}:${surface}:${surfaceFirst ? 1 : 0}:${surfaceLast ? 1 : 0}:${sidePath ? 1 : 0}:${sidePathLast ? 1 : 0}:${clearScenery ? 1 : 0}:${gate ? 1 : 0}:${narrowKey}`;
    const pooled = this.tilePools.get(key)?.pop();
    if (pooled) {
      pooled.visible = true;
      pooled.userData.tileIndex = index;
      return pooled;
    }
    const prototypeKey = `${terrain}:${surface}:${surfaceFirst ? 1 : 0}:${surfaceLast ? 1 : 0}:${sidePath ? 1 : 0}:${sidePathLast ? 1 : 0}:${clearScenery ? 1 : 0}`;
    let prototype = this.tilePrototypes.get(prototypeKey);
    if (!prototype) {
      prototype = buildTile(this.bundle.assets, -1, 0, terrain, null, clearScenery, surface, sidePath, sidePathLast, surfaceFirst, surfaceLast);
      mergeStaticMeshes(prototype);
      this.tilePrototypes.set(prototypeKey, prototype);
    }
    const group = prototype.clone(true);
    group.userData.tileIndex = index;
    group.userData.terrain = terrain;
    group.userData.poolKey = key;
    if (gate && this.bundle.assets.gate) {
      const gateGroup = this.bundle.assets.gate.clone(true);
      gateGroup.scale.setScalar(0.2);
      gateGroup.position.set(0, 0, -TILE / 2);
      gateGroup.rotation.y = Math.PI;
      group.add(gateGroup);
    }
    if (narrow) {
      const overlayKey = `${narrow.side}:${firstTile ? 1 : 0}`;
      let overlay = this.narrowOverlays.get(overlayKey);
      if (!overlay) {
        overlay = new THREE.Group();
        buildNarrowOverlay(this.bundle.assets, overlay, narrow.side, firstTile);
        this.narrowOverlays.set(overlayKey, overlay);
      }
      group.add(overlay.clone(true));
    }
    return group;
  }

  private releaseTile(object: THREE.Object3D): void {
    this.bundle.scene.remove(object);
    const key = typeof object.userData.poolKey === 'string' ? object.userData.poolKey : null;
    if (!key) return;
    const pool = this.tilePools.get(key) ?? [];
    pool.push(object as THREE.Group);
    this.tilePools.set(key, pool);
  }

  /** Clone a cached junction; pad, walls, torches and arrows share their GPU resources. */
  private acquireJunction(direction: 1 | -1, at: number): THREE.Group {
    let prototype = this.junctionPrototypes.get(direction);
    if (!prototype) {
      prototype = buildJunction(this.bundle.assets, direction, new TrackPath(), 0);
      mergeStaticMeshes(prototype);
      this.junctionPrototypes.set(direction, prototype);
    }
    const group = prototype.clone(true);
    const point = this.path.at(at);
    const heading = this.path.at(Math.max(0, at - 0.05)).heading;
    group.position.set(point.x, 0, point.z);
    group.rotation.y = heading;
    return group;
  }

  private acquireObstacle(def: ObstacleDef, prefab: string): THREE.Object3D {
    const key = `${def.id}:${prefab}`;
    const pool = this.obstaclePools.get(key);
    let object = pool?.pop();
    if (!object) {
      object = buildObstacle(this.bundle.assets, def, prefab);
      mergeStaticMeshes(object);
    }
    object.visible = true;
    object.userData.poolKey = key;
    this.bundle.scene.add(object);
    return object;
  }

  private releaseObstacle(object: THREE.Object3D): void {
    this.bundle.scene.remove(object);
    const key = typeof object.userData.poolKey === 'string' ? object.userData.poolKey : null;
    if (!key) return;
    const pool = this.obstaclePools.get(key) ?? [];
    pool.push(object);
    this.obstaclePools.set(key, pool);
  }

  private acquirePickup(kind: PickupKind): THREE.Object3D {
    const pool = this.pickupPools.get(kind);
    let object = pool?.pop();
    if (!object) {
      object = kind === 'coin' ? buildCoin(this.bundle.assets) : kind === 'gem' ? buildGem() : buildPower(kind);
      mergeStaticMeshes(object);
    }
    object.visible = true;
    this.bundle.scene.add(object);
    return object;
  }

  private releasePickup(kind: PickupKind, object: THREE.Object3D): void {
    this.bundle.scene.remove(object);
    const pool = this.pickupPools.get(kind) ?? [];
    pool.push(object);
    this.pickupPools.set(kind, pool);
  }

  private ensureTiles(): void {
    const from = Math.floor((this.distance - 24) / TILE);
    const to = Math.floor((this.distance + 130) / TILE);
    for (let index = from; index <= to; index++) {
      const distance = index * TILE;
      // A 12 m tile that straddles a corner cannot be rotated to both headings: its walls
      // cut across the other leg. Drop it and let the paved junction plaza fill the gap.
      const crossesTurn = this.path.segments.some((segment, segmentIndex) => segmentIndex > 0 && Math.abs(segment.start - distance) < TILE / 2 - 0.01);
      if (crossesTurn) {
        const stale = this.tiles.get(index);
        if (stale) {
          const tile = this.world.require(stale, Tile);
          if (tile.object) this.releaseTile(tile.object);
          this.world.destroyEntity(stale);
          this.tiles.delete(index);
        }
        continue;
      }
      if (this.tiles.has(index)) continue;
      const surface = surfaceAt(distance);
      const terrain = surface.kind === 'wood' ? 'bridge' : terrainAt(distance, this.path);
      const narrow = narrowAt(distance, this.path) ?? narrowAt(distance + TILE * 0.5, this.path);
      const side = sidePathAt(distance, this.path) ?? sidePathAt(distance + TILE * 0.5, this.path);
      const clearScenery = this.path.nearTurn(distance, 26);
      const group = this.acquireTile(index, terrain, narrow, clearScenery, surface.kind, Boolean(side), side?.last ?? false, surface.first, surface.last);
      const point = this.path.at(distance);
      group.position.set(point.x, 0, point.z);
      group.rotation.y = point.heading;
      this.bundle.scene.add(group);
      const entity = this.world.createEntity();
      this.world.add(entity, Tile, { index, distance, object: group });
      this.world.add(entity, TrackPos, { distance, side: 0, smooth: false });
      this.tiles.set(index, entity);
    }
    for (const [index, entity] of [...this.tiles]) {
      const tile = this.world.require(entity, Tile);
      if (tile.distance < this.distance - 40) {
        if (tile.object) this.releaseTile(tile.object);
        this.world.destroyEntity(entity);
        this.tiles.delete(index);
      }
    }
    for (const [distance, junction] of [...this.junctions]) {
      if (distance < this.distance - 30) {
        this.bundle.scene.remove(junction);
        this.junctions.delete(distance);
      }
    }
  }

  private spawnWaves(): void {
    while (this.nextSpawn < this.distance + 95) {
      const base = this.nextSpawn;
      const turn = this.world.require(this.runnerEntity, Turn);
      // The turn is prebuilt only within TURN_PREBUILD_DISTANCE, so use the Turn component
      // rather than path.segments for this exclusion.
      if (Math.abs(base - turn.next) < 42 || Math.abs(base - turn.lastTurnDistance) < 32) {
        this.nextSpawn += 12;
        continue;
      }
      const narrow = narrowAt(base, this.path) ?? narrowAt(base + 6, this.path) ?? narrowAt(base + 14, this.path);
      const side = sidePathAt(base, this.path) ?? sidePathAt(base + 6, this.path);
      const plan = pickObstacle({ nearTurn: false, narrow, sidePath: side }, this.obstacleRng, {
        minGap: this.difficulty.minGap,
        gapJitter: this.difficulty.gapJitter,
        maxBackToBack: 2,
        doubleChance: this.difficulty.doubleChance,
      });
      if (!plan) {
        this.nextSpawn += 12;
        continue;
      }
      plan.distance = base;
      this.spawnPlan(plan);
      if (!narrow && !side && plan.def.lanes === 'one' && this.obstacleRng.next() < this.difficulty.doubleChance) {
        const other = (plan.lane + 1 + this.obstacleRng.int(2)) % 3;
        this.spawnDef(DEFS.stonePedestal, other, base + 8);
      }
      const coinLane = narrow
        ? narrow.safe[this.obstacleRng.int(narrow.safe.length)]
        : this.obstacleRng.int(3);
      for (let i = 0; i < MAX_COINS_PER_RUN; i++) {
        this.spawnCoin(coinLane, base - 8 - i * 2.0, COIN_Y + Math.sin(i / Math.max(1, MAX_COINS_PER_RUN - 1) * Math.PI) * 0.5);
      }
      if (side) {
        // Guide both outer lanes: each gets a short coin run and a dodge cue.
        for (let i = 0; i < 3; i++) {
          for (const lane of side.safe) this.spawnCoin(lane, base - 2 - i * 2.0, COIN_Y);
        }
      }
      if (this.obstacleRng.next() > 0.86) this.spawnGem(this.obstacleRng.int(3), base + 24);
      this.nextSpawn = base + plan.gap;
    }
    while (this.nextPickup < this.distance + 90) {
      const kinds: PickupKind[] = ['magnet', 'shield', 'boost', 'bonus'];
      this.spawnPickup(kinds[this.obstacleRng.int(kinds.length)], this.obstacleRng.int(3), this.nextPickup);
      this.nextPickup += MIN_BONUS_ITEM_SPACING + this.obstacleRng.next() * 240;
    }
  }

  private spawnPlan(plan: ObstaclePlan): void {
    const def = plan.def;
    const lane = def.lanes === 'all' || def.action === 'dodge' ? (def.id === 'stonePedestal' ? plan.lane : 1) : plan.lane;
    this.spawnDef(def, lane, plan.distance);
  }

  private spawnDef(def: ObstacleDef, lane: number, distance: number): void {
    const prefab = def.prefabs[this.obstacleRng.int(def.prefabs.length)];
    const object = this.acquireObstacle(def, prefab);
    const entity = this.world.createEntity();
    this.world.add(entity, Obstacle, {
      kind: def.kind as ObstacleKind,
      defId: def.id,
      action: def.action,
      lanes: def.lanes,
      hitbox: def.hitbox,
      kill: def.kill,
      lane,
      distance,
      full: def.lanes === 'all',
      passed: false,
      warned: false,
      object,
    });
    this.obstacles.push(entity);
  }

  private updateFootsteps(distance: number, speed: number): void {
    const terrain = terrainAt(distance, this.path);
    const loop = terrain === 'bridge' ? 'stepPlank' : terrain === 'cliff' ? 'stepCliff' : 'stepTemple';
    if (loop !== this.stepLoop) {
      if (this.stepLoop) sfx.stopLoop(this.stepLoop, 0.18);
      sfx.startLoop(loop, { gain: 0.55 });
      this.stepLoop = loop;
      if (terrain === 'bridge') sfx.setAmbience('water', 0.4);
      else sfx.setAmbience(null, 0.3);
      sfx.setHallReverb(terrain === 'hall');
    }
    sfx.setLoopRate(loop, 0.82 + Math.max(0, speed - RUN_SPEED_MIN) * 0.028);
  }

  private spawnMonkey(distance: number): void {
    if (this.monkeyGroup) return;
    const group = new THREE.Group();
    const fur = new THREE.MeshStandardMaterial({ color: 0x6b4a2a, roughness: 0.95 });
    const body = new THREE.Mesh(new THREE.SphereGeometry(0.42, 10, 8), fur);
    body.position.y = 0.85;
    group.add(body);
    const head = new THREE.Mesh(new THREE.SphereGeometry(0.27, 10, 8), fur);
    head.position.set(0, 1.3, -0.12);
    group.add(head);
    const tail = new THREE.Mesh(new THREE.CylinderGeometry(0.06, 0.05, 0.9, 6), fur);
    tail.position.set(0, 1.0, 0.42);
    tail.rotation.x = -0.9;
    group.add(tail);
    this.bundle.scene.add(group);
    this.monkeyGroup = group;
    this.monkeyTimer = 5.5;
    sfx.play('monkey', { gain: 0.8 });
    setHint('猴子出现了！小心金币');
    void distance;
  }

  /** The temple monkey runs beside you for a few seconds, then steals a handful of coins. */
  private updateMonkey(dt: number): void {
    if (!this.monkeyGroup) {
      if (this.distance > 260 && Math.random() < dt * 0.02) this.spawnMonkey(this.distance + 12);
      return;
    }
    this.monkeyTimer -= dt;
    const side = LANES[1] + Math.sin(this.world.elapsed * 2.4) * 1.4;
    const point = this.path.at(this.distance + 2.5, side, true);
    this.monkeyGroup.position.set(point.x, 0, point.z);
    this.monkeyGroup.rotation.y = point.heading;
    this.monkeyGroup.scale.setScalar(1 + Math.sin(this.world.elapsed * 9) * 0.03);
    if (this.monkeyTimer <= 0) {
      const stats = this.world.require(this.runnerEntity, RunStats);
      const stolen = Math.min(3, stats.coins);
      if (stolen > 0) {
        stats.coins -= stolen;
        setHint(`猴子偷走了 ${stolen} 金币！`);
        sfx.play('monkey', { gain: 0.9 });
      }
      this.bundle.scene.remove(this.monkeyGroup);
      this.monkeyGroup = null;
    }
  }

  /** Energy bar full: hand out one of the four classic boosts. */
  private grantPower(): void {
    const kinds: PickupKind[] = ['magnet', 'shield', 'boost', 'bonus'];
    const kind = kinds[Math.floor(Math.random() * kinds.length)];
    const power = this.world.require(this.runnerEntity, Power);
    power.kind = kind;
    power.until = this.world.elapsed + (kind === 'magnet' ? 8 : kind === 'boost' ? 5 : 10);
    setHint(kind === 'magnet' ? '能量满！磁铁启动' : kind === 'shield' ? '能量满！护盾就绪' : kind === 'boost' ? '能量满！加速' : '能量满！金币加成');
    sfx.play('meterFull', { gain: 0.8 });
  }

  private spawnObstacle(kind: ObstacleKind, lane: number, distance: number): void {
    const def = defForKind(kind);
    this.spawnDef(def, def.lanes === 'one' ? lane : 1, distance);
  }

  private spawnCoin(lane: number, distance: number, y = COIN_Y): void {
    if (distance < 4) return;
    const entity = this.world.createEntity();
    const group = this.acquirePickup('coin');
    this.world.add(entity, Pickup, { kind: 'coin', lane, distance, baseY: y, taken: false, object: group });
    this.pickups.push(entity);
  }

  private spawnGem(lane: number, distance: number): void {
    const entity = this.world.createEntity();
    const group = this.acquirePickup('gem');
    this.world.add(entity, Pickup, { kind: 'gem', lane, distance, baseY: 1.15, taken: false, object: group });
    this.pickups.push(entity);
  }

  private spawnPickup(kind: PickupKind, lane: number, distance: number): void {
    const entity = this.world.createEntity();
    const group = this.acquirePickup(kind);
    this.world.add(entity, Pickup, { kind, lane, distance, baseY: 1.35, taken: false, object: group });
    this.pickups.push(entity);
  }

  private updateObstacles(dt: number): void {
    const distance = this.distance;
    const previous = this.lastObstacleDistance;
    const lane = this.world.require(this.runnerEntity, Lane);
    const jump = this.world.require(this.runnerEntity, Jump);
    const slide = this.world.require(this.runnerEntity, Slide);
    const power = this.world.require(this.runnerEntity, Power);
    const now = this.world.elapsed;
    let cue: ObstacleAction | null = null;
    let cueAhead = Infinity;

    for (let i = this.obstacles.length - 1; i >= 0; i--) {
      const entity = this.obstacles[i];
      const obstacle = this.world.require(entity, Obstacle);
      const def = DEFS[obstacle.defId as DefId] ?? defForKind(obstacle.kind);
      const ahead = obstacle.distance - distance;
      if (obstacle.object) {
        const x = def.lanes === 'one' ? LANES[obstacle.lane] : 0;
        const point = this.path.at(obstacle.distance, x);
        obstacle.object.position.set(point.x, 0, point.z);
        obstacle.object.rotation.y = point.heading;
        if ((def.kind === 'gap' || def.kind === 'gapLong') && !obstacle.warned && ahead > 3.5 && ahead < 12) {
          obstacle.warned = true;
          setHint('前方坑洞 · 向上跳！');
        }
      }

      if (!obstacle.passed) {
        const hit = collisionWouldHit(
          { def, lane: obstacle.lane, distance: obstacle.distance },
          {
            prevDistance: previous,
            distance,
            laneIndex: lane.index,
            jumpY: jump.y,
            jumpV: jump.v,
            slideRemaining: slide.remaining,
            lastJumpAt: jump.lastJumpAt,
            lastSlideAt: slide.lastSlideAt,
            now,
            jumpWindow: this.difficulty.jumpWindow,
            slideWindow: this.difficulty.slideWindow,
          },
        );
        if (hit) {
          obstacle.passed = true;
          if (power.kind === 'boost' && now < power.until) {
            setHint('冲撞！');
          } else if (power.kind === 'shield' && now < power.until) {
            power.kind = null;
            power.until = 0;
            setHint('护盾抵挡了一次撞击');
            sfx.play('shimmer', { gain: 0.9 });
            this.stumbleCooldown = 4;
          } else if (def.kill) {
            this.die(def.kind === 'gap' || def.kind === 'gapLong' ? '掉进了断桥' : '撞上了路障', 'fall');
          } else {
            this.stumble();
          }
        } else if (distance > obstacle.distance + def.hitbox.z[1] + 0.5) {
          obstacle.passed = true;
        }
      }

      const blocked = laneIsBlocked(def, obstacle.lane, lane.index);
      const threatens = def.action === 'jump' || def.action === 'slide' || (def.action === 'dodge' && blocked);
      if (threatens && ahead > 0 && ahead < 12 && ahead < cueAhead) {
        cueAhead = ahead;
        cue = def.action;
      }

      if (obstacle.distance < distance - 24) {
        if (obstacle.object) this.releaseObstacle(obstacle.object);
        this.world.destroyEntity(entity);
        this.obstacles.splice(i, 1);
      }
    }
    this.lastObstacleDistance = distance;
    mutateUi.nextCue = cue;
  }

  private stumbleCooldown = 0;
  private narrowWarned = false;
  private sideWarned = false;
  private lastMilestone = 0;
  private stepLoop: string | null = null;
  private monkeyTimer = 0;
  private monkeyGroup: THREE.Group | null = null;

  private stumble(): void {
    if (this.world.elapsed < this.invincibleUntil) return;
    const chase = this.world.require(this.runnerEntity, Chase);
    if (this.stumbleCooldown > 0) {
      chase.gap = 1.2;
      this.die('追逐者抓住了你。', 'caught');
      return;
    }
    this.stumbleCooldown = 8;
    chase.gap = 3.8;
    chase.cooldown = 8;
    chase.lunge = 1.6;
    setHint('绊倒了！追逐者靠近了');
    sfx.play('stumble', { gain: 0.9 });
  }

  private updatePickups(dt: number): void {
    const distance = this.distance;
    const lane = this.world.require(this.runnerEntity, Lane);
    const stats = this.world.require(this.runnerEntity, RunStats);
    const power = this.world.require(this.runnerEntity, Power);
    const laneXNow = this.world.require(this.runnerEntity, TrackPos).side;
    for (let i = this.pickups.length - 1; i >= 0; i--) {
      const entity = this.pickups[i];
      const pickup = this.world.require(entity, Pickup);
      if (pickup.object) {
        const point = this.path.at(pickup.distance, LANES[pickup.lane]);
        pickup.object.position.set(point.x, pickup.baseY, point.z);
        pickup.object.rotation.y = point.heading + this.world.elapsed * 2.4;
      }
      const ahead = pickup.distance - distance;
      const magnet = power.kind === 'magnet' && this.world.elapsed < power.until;
      const close = Math.abs(ahead) < (magnet ? 9 : 1.4) && (Math.abs(laneXNow - LANES[pickup.lane]) < (magnet ? 9 : 0.55) || pickup.lane === lane.index);
      if (!pickup.taken && close && ahead > -3 && ahead < 3) {
        pickup.taken = true;
        if (pickup.kind === 'coin') {
          this.coinValueAcc += coinMultiplier();
          const whole = Math.floor(this.coinValueAcc);
          this.coinValueAcc -= whole;
          stats.coins += Math.max(1, whole);
          stats.combo += 1;
          stats.comboTimer = 3;
          stats.multiplier = Math.min(5, 1 + Math.floor(stats.combo / 8));
          stats.charge = Math.min(100, stats.charge + 4);
          stats.score += 10 * stats.multiplier;
          if (stats.charge >= 100) {
            stats.charge = 0;
            this.grantPower();
          }
          sfx.play('coin', { gain: 0.8 });
        } else if (pickup.kind === 'gem') {
          stats.gems += 1;
          stats.score += 100;
          sfx.play('shimmer', { gain: 0.8 });
        } else {
          power.kind = pickup.kind;
          power.until = this.world.elapsed + (pickup.kind === 'magnet' ? 8 + magnetBonusSeconds() : pickup.kind === 'boost' ? 5 : 10);
          setHint(
            pickup.kind === 'magnet' ? '磁铁激活！' : pickup.kind === 'shield' ? '护盾 · 就绪' : pickup.kind === 'boost' ? '加速！' : '金币加成！',
          );
          sfx.play('shimmer', { gain: 0.9 });
        }
        if (pickup.object) this.releasePickup(pickup.kind, pickup.object);
        this.world.destroyEntity(entity);
        this.pickups.splice(i, 1);
        mutateUi.coins = stats.coins;
        mutateUi.gems = stats.gems;
        continue;
      }
      if (pickup.distance < distance - 16) {
        if (pickup.object) this.releasePickup(pickup.kind, pickup.object);
        this.world.destroyEntity(entity);
        this.pickups.splice(i, 1);
      }
    }
  }

  private updateChase(dt: number): void {
    const chase = this.world.require(this.runnerEntity, Chase);
    this.stumbleCooldown = Math.max(0, this.stumbleCooldown - dt);
    chase.cooldown = Math.max(0, chase.cooldown - dt);
    if (chase.lunge > 0) chase.lunge = Math.max(0, chase.lunge - dt);
    const target = chase.cooldown > 0 ? 3.8 : CHASE_GAP_MAX;
    chase.gap = THREE.MathUtils.damp(chase.gap, target, 1.6, dt);
    mutateUi.chaseGap = chase.gap;
  }

  private updateCamera(dt: number): void {
    const lane = this.world.require(this.runnerEntity, Lane);
    const jump = this.world.require(this.runnerEntity, Jump);
    const distance = this.distance;
    const back = this.path.at(distance - 5.6, lane.x * 0.45, true);
    const ahead = this.path.at(distance + 8.5, lane.x * 0.7, true);
    this.cameraPos.lerp(new THREE.Vector3(back.x, 4.55 + jump.y * 0.18, back.z), 1 - Math.exp(-8 * dt));
    this.cameraLook.lerp(new THREE.Vector3(ahead.x, 1.15 + jump.y * 0.25, ahead.z), 1 - Math.exp(-10 * dt));
    this.bundle.camera.position.copy(this.cameraPos);
    this.bundle.camera.lookAt(this.cameraLook);
    this.bundle.camera.rotateZ((lane.x - laneX(lane.index)) * -0.03);
    const speed = this.speed;
    this.bundle.camera.fov = THREE.MathUtils.damp(this.bundle.camera.fov, (this.canvas.clientWidth / this.canvas.clientHeight < 0.7 ? 65 : 58) + Math.max(0, speed - RUN_SPEED) * 0.22, 6, dt);
    this.bundle.camera.updateProjectionMatrix();
    const target = this.distance;
    this.bundle.sky.position.copy(this.cameraPos);
    this.bundle.sun.position.set(this.cameraPos.x - 12, 22, this.cameraPos.z - 24);
    this.bundle.sun.target.position.set(this.cameraPos.x, 0, this.cameraPos.z - 18);
    this.bundle.sun.target.updateMatrixWorld();
    void target;
  }

  private syncHud(dt: number): void {
    const stats = this.world.require(this.runnerEntity, RunStats);
    const power = this.world.require(this.runnerEntity, Power);
    mutateUi.coins = stats.coins;
    mutateUi.gems = stats.gems;
    mutateUi.score = stats.score;
    mutateUi.charge = stats.charge;
    mutateUi.power = power.kind && this.world.elapsed < power.until ? power.kind : null;
    mutateUi.powerRemaining = Math.max(0, power.until - this.world.elapsed);
    mutateUi.multiplier = stats.multiplier;
    mutateUi.turnQueued = this.world.require(this.runnerEntity, Turn).queued;
    mutateUi.sliding = this.world.require(this.runnerEntity, Slide).remaining;
    mutateUi.jump = this.world.require(this.runnerEntity, Jump).y;
    this.hintCooldown = Math.max(0, this.hintCooldown - dt);
  }

  private syncRunnerObject(): void {
    const trackPos = this.world.require(this.runnerEntity, TrackPos);
    const lane = this.world.require(this.runnerEntity, Lane);
    trackPos.side = lane.x;
    const point = this.path.at(trackPos.distance, lane.x, true);
    this.runnerGroup.position.set(point.x, 0, point.z);
    this.runnerGroup.rotation.y = point.heading;
  }

  private syncObjects(dt: number): void {
    const jump = this.world.require(this.runnerEntity, Jump);
    const slide = this.world.require(this.runnerEntity, Slide);
    this.syncRunnerObject();
    this.runnerGroup.position.y = jump.y;
    const squash = slide.remaining > 0 ? 0.55 : 1;
    this.runnerGroup.scale.set(1, squash, 1);
    const shield = this.world.require(this.runnerEntity, Power);
    const wingsOn = shield.kind === 'shield' && this.world.elapsed < shield.until;
    this.wingsGroup.visible = wingsOn;
    if (wingsOn) {
      const flap = Math.sin(this.world.elapsed * 9) * 0.08;
      this.wingSprites.forEach((wing) => {
        wing.scale.y = 1.25 + flap;
        wing.rotation.z = flap * 0.3;
      });
    }
    if (this.runnerRig) {
      this.runnerRig.setClip(slide.remaining > 0 ? 'slide' : jump.y > 0 || jump.v > 0 ? 'jump' : 'run');
      this.runnerRig.update(dt, THREE.MathUtils.clamp(this.speed / RUN_SPEED, 0.65, 1.55));
    }
    const chase = this.world.require(this.runnerEntity, Chase);
    // Same placement as the original: the chaser hovers just behind and to one side, so it
    // stays in frame when it closes in (distance - gap is inside the camera's view).
    const close = chase.gap < 7.5;
    const chaseSide = (close ? 1.35 : 1.9) + Math.sin(this.world.elapsed * 1.3) * 0.3;
    // Slightly ahead of `distance - gap` and hovering higher, so the chaser stays inside the
    // camera frustum when it lunges (the raw original offset ends up below the frame).
    const chaserPos = this.path.at(this.distance - chase.gap + (close ? 0.9 : 0), chaseSide, true);
    this.chaserGroup.position.set(chaserPos.x, (close ? 1.75 : 1.15) + Math.sin(this.world.elapsed * 2.6) * 0.14, chaserPos.z);
    this.chaserGroup.rotation.y = chaserPos.heading;
    const scale = 1.45 + Math.sin(this.world.elapsed * 6) * 0.03 + (chase.lunge > 0 ? 0.18 : 0);
    this.chaserGroup.scale.setScalar(scale);

    for (const entity of this.obstacles) {
      const obstacle = this.world.require(entity, Obstacle);
      if (obstacle.object) {
        const point = this.path.at(obstacle.distance, obstacle.full ? 0 : LANES[obstacle.lane]);
        obstacle.object.position.set(point.x, 0, point.z);
        obstacle.object.rotation.y = point.heading;
      }
    }
    for (const entity of this.pickups) {
      const pickup = this.world.require(entity, Pickup);
      if (!pickup.object) continue;
      const point = this.path.at(pickup.distance, LANES[pickup.lane]);
      pickup.object.position.set(point.x, pickup.baseY + Math.sin(this.world.elapsed * 3 + pickup.distance) * 0.08, point.z);
      pickup.object.rotation.y = point.heading + this.world.elapsed * 2.4;
    }
    // Tiles are placed once in ensureTiles (and rebuilt ahead of a new turn); re-running
    // path.at() for every live tile each frame was pure GC churn.
  }

  private invincibleUntil = 0;
  private reviveUsed = false;
  private runCommitted = false;

  private die(reason: string, kind: 'impact' | 'fall' | 'caught' | 'missed'): void {
    if (mutateUi.phase !== 'playing') return;
    if (this.world.elapsed < this.invincibleUntil) return;
    if (this.stepLoop) {
      sfx.stopLoop(this.stepLoop, 0.15);
      this.stepLoop = null;
    }
    mutateUi.deathReason = reason;
    mutateUi.deathKind = kind;
    mutateUi.phase = 'dying';
    this.deathTimer = 1.25;
    sfx.play(kind === 'fall' ? 'splat' : 'scream', { gain: 0.9 });
    void kind;
  }

  /** Bank the run exactly once: after a revive the same run would otherwise be counted twice. */
  private commitRun(): void {
    if (this.runCommitted) return;
    const stats = this.world.require(this.runnerEntity, RunStats);
    if (stats.distance <= 0) return;
    recordRun(stats.distance, stats.coins, stats.gems, stats.score);
    syncBanks();
    this.runCommitted = true;
  }

  private finishDeath(): void {
    const stats = this.world.require(this.runnerEntity, RunStats);
    mutateUi.phase = 'ended';
    mutateUi.best = Math.max(progress.bestDistance, Math.floor(stats.distance));
    // Gems picked up this run are not banked until the run is committed, but the original
    // lets you spend them on a revive, so count both pools here.
    mutateUi.reviveAvailable = !this.reviveUsed && progress.gems + stats.gems >= mutateUi.reviveCost;
    setPhase('ended');
    sfx.pauseMusic();
  }

  /** Spend gems to get back up on the same run. */
  revive(): void {
    if (mutateUi.phase !== 'ended' || !mutateUi.reviveAvailable) return;
    const stats = this.world.require(this.runnerEntity, RunStats);
    const cost = mutateUi.reviveCost;
    if (progress.gems + stats.gems < cost) return;
    const fromRun = Math.min(stats.gems, cost);
    stats.gems -= fromRun;
    progress.gems -= cost - fromRun;
    saveProgress();
    syncBanks();
    this.reviveUsed = true;
    mutateUi.reviveAvailable = false;
    // Clear the road immediately around the player so the revive is not an instant re-death.
    for (let i = this.obstacles.length - 1; i >= 0; i--) {
      const entity = this.obstacles[i];
      const obstacle = this.world.require(entity, Obstacle);
      if (obstacle.distance > this.distance - 4 && obstacle.distance < this.distance + 34) {
        if (obstacle.object) this.releaseObstacle(obstacle.object);
        this.world.destroyEntity(entity);
        this.obstacles.splice(i, 1);
      }
    }
    const chase = this.world.require(this.runnerEntity, Chase);
    chase.gap = CHASE_GAP_MAX;
    chase.cooldown = 0;
    this.stumbleCooldown = 0;
    // If the death was a missed corner, the old turn is already behind the runner. Leaving
    // it armed makes updateTurnCue kill the revived run as soon as invincibility ends.
    const turn = this.world.require(this.runnerEntity, Turn);
    if (turn.direction !== 0 && this.distance >= turn.next) {
      turn.direction = 0;
      turn.queued = false;
      turn.cueShown = false;
      turn.next = 9 + 12 * Math.max(1, Math.round((this.distance + 72 - 9) / 12));
    }
    // Falling in a collapsed-lane section: put the runner back on the surviving lane.
    const narrow = narrowAt(this.distance, this.path);
    if (narrow) {
      const lane = this.world.require(this.runnerEntity, Lane);
      lane.index = narrow.side === 'left' ? 0 : 2;
      lane.x = laneX(lane.index);
    }
    this.invincibleUntil = this.world.elapsed + 3;
    this.deathTimer = 0;
    setPhase('playing');
    if (progress.music) sfx.startMusic('theme');
    setHint('复活！短暂无敌');
  }

  toMenuAfterDeath(): void {
    this.toMenu();
  }

  private jumpTo(distance: number): void {
    const trackPos = this.world.require(this.runnerEntity, TrackPos);
    const lane = this.world.require(this.runnerEntity, Lane);
    trackPos.distance = distance;
    trackPos.side = lane.x;
    const turn = this.world.require(this.runnerEntity, Turn);
    turn.next = 9 + 12 * Math.max(1, Math.round((distance + 60) / 12));
    turn.direction = 0;
    turn.queued = false;
    turn.cueShown = false;
    turn.prebuilt = false;
    this.path.segments.length = 0;
    this.path.segments.push({ start: 0, end: Infinity, x: 0, z: 3, heading: 0 });
    for (const entity of [...this.obstacles, ...this.pickups]) {
      const obstacle = this.world.get(entity, Obstacle);
      const pickup = this.world.get(entity, Pickup);
      if (obstacle?.object) this.releaseObstacle(obstacle.object);
      if (pickup?.object) this.releasePickup(pickup.kind, pickup.object);
      this.world.destroyEntity(entity);
    }
    this.obstacles = [];
    this.pickups = [];
    this.nextSpawn = distance + 90;
    this.nextPickup = distance + MIN_BONUS_ITEM_SPACING;
    this.lastObstacleDistance = distance;
    this.ensureTiles();
    this.syncRunnerObject();
    this.updateCamera(0.05);
    this.renderOnce();
  }

  private renderOnce(): void {
    this.bundle.renderer.render(this.bundle.scene, this.bundle.camera);
  }

  private trackFps(dt: number): void {
    this.fpsSamples.push(dt);
    if (this.fpsSamples.length > 40) this.fpsSamples.shift();
    const avg = this.fpsSamples.reduce((a, b) => a + b, 0) / this.fpsSamples.length;
    const fps = 1 / Math.max(0.001, avg);
    mutateUi.fps = Math.round(fps);
    // Cheap adaptive resolution: only touch the drawing buffer every few seconds, so a
    // transient loading hitch does not make the whole game blurry.
    const now = performance.now();
    if (now - this.qualityCheckAt < 3000) return;
    const ratio = this.bundle.renderer.getPixelRatio();
    if (fps < 45 && ratio > 1) {
      this.bundle.renderer.setPixelRatio(Math.max(1, ratio - 0.25));
      this.qualityCheckAt = now;
    } else if (fps > 58 && ratio < this.maxPixelRatio) {
      this.bundle.renderer.setPixelRatio(Math.min(this.maxPixelRatio, ratio + 0.25));
      this.qualityCheckAt = now;
    }
  }

  dispose(): void {
    this.disposed = true;
    cancelAnimationFrame(this.raf);
    window.removeEventListener('resize', this.resize);
    this.bundle.renderer.dispose();
  }
}
