import { startNativeCameraShake, stepNativeCameraShake, type NativeCameraShake } from './nativeCameraShake';
import { NATIVE_RESULT_DELAY, stepNativeDeathTimer, nativeGroundContact } from './nativeDeath';
import { nativeAnimationSpeed } from './nativeAnimation';
import { NATIVE_TILT_OFFSET_MAX, stepNativeSteering, nativeTiltAllowed } from './steering';
import { nativePickupWithinReach } from './nativePickupCollision';
import { junctionGapCuts, type SurfaceCut } from './junctionCuts';
import { referenceStraightGate, referenceFullWidthAt, overlapsReferenceGate, REFERENCE_EXIT_GATE_OFFSET } from './referenceScenery';
import { STUMBLE_KILL_WINDOW, NATIVE_STUMBLE_RESET_AGE, nativeStumbleIsFatal, nativeIntroHeld, nativeStumbleDuration, NATIVE_REJECTED_TURN_DELAY, NATIVE_REJECTED_TURN_OFFSET, stepNativeStumbleDelay } from './nativeRunnerRules';
import { nativeWaterAnchor } from './nativeWater';
import { nativeCoinBonusValue, NATIVE_POWER_SCORE_VALUE, NATIVE_COIN_SCORE_VALUE, NATIVE_BASE_POWER_DURATION } from './nativeCoinBonus';
import { nativeSlideDuration, stepNativeSlideTimer, stepNativeVertical, nativeForwardAcceleration, stepNativeForwardVelocity, nativeJumpVelocity, NATIVE_STUMBLE_SPEED_FACTOR } from './nativeMotion';
import { nativeProgressDelta, nativeProgressScore } from './nativeProgress';
import { referencePickupsForTurn, REFERENCE_SHIELD_DURATION } from './referencePickups';
import { updateNativePower } from './nativePower';
import { updateNativeFlame } from './nativeFlame';
import { nativeCoinYaw, nativeCoinRootHeight } from './nativeCoinPresentation';
import { pickupHeightAt, coinHeightWithinReach } from './pickupReach';
import { referenceCoinsForTurn } from './referenceCoins';
import { REFERENCE_VISIBLE_OBSTACLES, REFERENCE_RANDOM_OBSTACLES_FROM, overlapsReferenceTree } from './referenceObstacles';
import { referenceTurnDirection, referenceNextTurnDistance, referenceGate, referenceJunction } from './referenceRoute';
import { followCameraPose, followCameraBack, stepNativeFollowCamera, nextNativeDuckCamera } from './followCamera';
import { makeSafetyNet, setSafetyNetFrame } from './safetyNet';
import { referenceCoinValue } from './coinValues';
import { FIRST_TURN_DISTANCE, openingSpeedFactor } from './pacing';
import { openingChaseGap, nativeEnemyFollowTarget, stepNativeEnemyFollow, nativeEnemyFormation, enemyFollowAnchor } from './chasePresentation';
import { distanceScoreDelta, REFERENCE_SCORE_MULTIPLIER } from './scoring';
import { entranceCameraPose, nativeEntranceCameraPose } from './introCamera';
import { acceptsTurn } from './turnInput';
import { NARROW_EDGE, offNarrowSurface } from './terrain';
import { cutSurfaceGeometry } from './cutSurface';
import * as THREE from 'three';
import { World, type Entity } from './ecs/world';
import { TrackPath } from './path';
import { TrackGraph, type TrackGraphFork } from './trackGraph';
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
  CAMERA_FOV, NATIVE_CAMERA_NEAR, NATIVE_CAMERA_FAR,
  RUN_SPEED,
  RUN_SPEED_MAX,
  RUN_SPEED_MIN,
  SPEED_GROWTH,
  TILE,
  TURN_CUE_DISTANCE,
  TURN_PREBUILD_DISTANCE,
  laneX,
} from './config';
import { createWorld, buildTile, buildStoneGate, buildJunction, buildTJunction, buildObstacle, buildCoin, buildGem, buildPower, buildChaser, buildNarrowOverlay, mergeStaticMeshes, type Assets, type SceneBundle } from './render';
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
  private runnerRig: Awaited<ReturnType<typeof loadRunnerRig>> | null = null;
  private runnerGroup = new THREE.Group();
  private wingsGroup = new THREE.Group();
  private wingSprites: THREE.Sprite[] = [];
  private chaserGroup = new THREE.Group();
  private safetyNet: THREE.Mesh | null = null;
  private chaserRigs: Awaited<ReturnType<typeof loadRunnerRig>>[] = [];
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
  private junctionPrototypes = new Map<string, THREE.Group>();
  private obstaclePools = new Map<string, THREE.Object3D[]>();
  private pickupPools = new Map<string, THREE.Object3D[]>();
  private nextSpawn = 80;
  private referenceObstacleIndex = 0;
  private obstacleRng = new SeededRandom(0x51ed270b);
  private difficulty: DifficultyConfig = getDifficulty();
  private lastObstacleDistance = 0;
  private lastObstacleSide = 0;
  private sideFork: TrackGraphFork | null = null;
  private sideBranch: 'left' | 'right' | null = null;
  private basePath: TrackPath | null = null;
  private nextPickup = MIN_BONUS_ITEM_SPACING;
  private deathTimer = 0;
  private deathElapsed = 0;
  private lastFrame = 0;
  private raf = 0;
  private running = false;
  private paused = false;
  private hintCooldown = 0;
  private stepAccumulator = 0;
  /** Fractional coin value, so the +25% upgrade is not rounded away coin by coin. */
  private coinValueAcc = 0;
  private cameraPos = new THREE.Vector3(0, 5.8, 10.1);
  private cameraLook = new THREE.Vector3(0, 0.65, -7.5);
  private disposed = false;
  private runStartedAt = 0;
  private needsToDuckCamera = false;
  private nativeCameraShake:NativeCameraShake|null=null;
  private nativeCameraShakeOffset:[number,number,number]=[0,0,0];
  private nativeTimeSinceStumble = NATIVE_STUMBLE_RESET_AGE;
  private nativeFalling=false;
  private nativeForwardForce=0;
  private nativeTiltTargetX=0;
  private nativeSwipeStumbleDelay:number|null=null;
  private nativeSwipeOffset:number|null=null;
  private nativeStumbleElapsed=0;
  private nativeStumbleSeconds=0;
  private nativeStumbleRemaining=0;
  private stumbleAnimation:'stumble'|'run'|null=null;
  private nativeEnemyGap = 0;
  private cutMeshes = new WeakMap<THREE.Mesh, { original: THREE.BufferGeometry; cut: THREE.BufferGeometry }>();
  private fpsSamples: number[] = [];
  private maxPixelRatio = 2;
  private qualityCheckAt = 0;

  async init(canvas: HTMLCanvasElement): Promise<void> {
    this.canvas = canvas;
    this.bundle = await createWorld(canvas);
    if (this.disposed) { this.bundle.renderer.dispose(); return; }
    this.maxPixelRatio = this.bundle.renderer.getPixelRatio();
    this.bundle.scene.add(this.runnerGroup);
    this.bundle.scene.add(this.chaserGroup);
    if (this.bundle.assets.texture.safetyNet) {
      this.safetyNet = makeSafetyNet(this.bundle.assets.texture.safetyNet);
      this.bundle.scene.add(this.safetyNet);
    }
    this.input.attach(window, canvas);
    this.resize();
    window.addEventListener('resize', this.resize);
    await this.setSkin(isOwned(progress.equipped) ? progress.equipped : 'jhony');
    try {
      this.chaserRigs = await Promise.all(Array.from({length:8},(_,i)=>i).map(async (i) => {
        const rig = await loadRunnerRig(`${BASE}assets/characters/rig-enemy.json`, `${BASE}assets/apk/texture-53-enemyTexture.webp`, { scale: .2, yOffset: 0, authoredSkeleton: true });
        rig.setClip('run');
        rig.setTime(i * 0.11, true);
        return rig;
      }));
    } catch (error) {
      console.warn('enemy rig unavailable; using pursuit proxy', error);
    }
    if (this.disposed) return;
    this.resetWorld();
    mutateUi.ready = true;
    mutateUi.speed = RUN_SPEED;
    this.bindDebugApi();
    this.showEntranceCamera();
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
        presentationGap: this.nativeEnemyGap,
        formation: this.chaserRigs.map(rig=>({visible:rig.object.parent?.visible,position:rig.object.parent?.position.toArray(),modelScale:rig.object.scale.toArray(),modelPosition:rig.object.position.toArray(),animation:rig.getTime()})),
      }),
      junctionCuts: () => [...this.junctions].map(([distance,group])=>({distance,cuts:group.userData.cutSignature??null})),
      attemptTurn: (dir: 1 | -1) => this.queueTurn(dir),
      setNextTurn: (distance: number) => {
        const turn = this.world.require(this.runnerEntity, Turn);
        turn.next = distance;
      },
      spawnObstacle: (kind: ObstacleKind, ahead = 16) => this.spawnObstacle(kind, Math.floor(Math.random() * 3), this.distance + ahead),
      spawnCoin: (lane = 1, ahead = 6, height = COIN_Y) => this.spawnCoin(lane, this.distance + ahead, height),
      spawnPickup: (kind: PickupKind, lane = 1, ahead = 6, height = 1.35) => this.spawnPickup(kind, lane, this.distance + ahead, height),
      advance: (ms: number) => this.advance(ms),
      freeze: () => { cancelAnimationFrame(this.raf); this.syncObjects(0); this.renderOnce(); },
      power: (kind: PickupKind) => {
        const power = this.world.require(this.runnerEntity, Power);
        power.kind = kind;
        power.until = this.world.elapsed + this.powerDuration(kind);
      },
      press: (action: Action) => this.input.push(action),
      setSkin: (id: string, force = false) => this.setSkin(id, force),
      skins: SKIN_IDS,
      camera: () => this.bundle.camera.position.toArray(),
      snapFollowCamera: () => {
        const lane=this.world.require(this.runnerEntity,Lane),jump=this.world.require(this.runnerEntity,Jump);
        const point=this.path.at(this.distance,lane.x,true),pose=followCameraPose(this.needsToDuckCamera,jump.airborne,jump.y);
        const back=followCameraBack(point,pose.behind);
        this.cameraPos.set(back.x,pose.height,back.z);this.updateCamera(0);this.renderOnce();
      },
      cameraDetails: () => ({ position:this.cameraPos.toArray(), look: this.cameraLook.toArray(), forward: this.bundle.camera.getWorldDirection(new THREE.Vector3()).toArray(), runnerNdc: this.runnerGroup.position.clone().project(this.bundle.camera).toArray(), waterPosition: this.bundle.scene.getObjectByName('reference-water')?.position.toArray(), needsToDuckCamera:this.needsToDuckCamera,clip:{near:this.bundle.camera.near,far:this.bundle.camera.far},shake:this.nativeCameraShake,shakeOffset:this.nativeCameraShakeOffset,rightY:this.bundle.camera.matrixWorld.elements[1] }),
      entranceSample: (pixelY = 480) => {
        const root=this.bundle.scene.getObjectByName('reference-entrance');
        if(!root)return null;
        const ray=new THREE.Raycaster();
        ray.setFromCamera(new THREE.Vector2(0,1-2*pixelY/896),this.bundle.camera);
        const meshes:THREE.Mesh[]=[];
        this.bundle.scene.traverseVisible(o=>{if((o as THREE.Mesh).isMesh)meshes.push(o as THREE.Mesh);});
        return ray.intersectObjects(meshes,false).slice(0,6).map(hit=>{
          const material=(hit.object as THREE.Mesh).material as THREE.ShaderMaterial;
          return {name:hit.object.name,type:material.type,transparent:material.transparent,depthWrite:material.depthWrite,point:hit.point.toArray(),uv:hit.uv?.toArray(),fogEnabled:material.uniforms?.fogEnabled?.value,mapFlipY:material.uniforms?.mainTexture?.value.flipY};
        });
      },
      cameraOcclusion: () => {
        this.bundle.scene.updateMatrixWorld(true);
        const origin=this.bundle.camera.position;
        const target=this.runnerGroup.position.clone().add(new THREE.Vector3(0,1,0));
        const ray=new THREE.Raycaster(origin,target.clone().sub(origin).normalize(),.1,origin.distanceTo(target)-.3);
        const meshes:THREE.Mesh[]=[];
        this.bundle.scene.traverseVisible(object=>{
          if(!(object as THREE.Mesh).isMesh)return;
          let ancestor:THREE.Object3D|null=object;
          while(ancestor){if(ancestor===this.runnerGroup)return;ancestor=ancestor.parent;}
          meshes.push(object as THREE.Mesh);
        });
        return ray.intersectObjects(meshes,false).slice(0,8).map(hit=>{
          let owner:THREE.Object3D|null=hit.object;
          while(owner && owner.userData.tileIndex===undefined && owner.parent!==this.bundle.scene)owner=owner.parent;
          return {distance:hit.distance,name:hit.object.name,owner:owner?.name,tile:owner?.userData.tileIndex,poolKey:owner?.userData.poolKey};
        });
      },
      entranceView: () => this.showEntranceCamera(),
      runner: () => ({
        pos: this.runnerGroup.position.toArray().map((n) => +n.toFixed(2)),
        heading: this.runnerGroup.rotation.y,
        children: this.runnerGroup.children.length,
        rig: !!this.runnerRig,
        animation: this.runnerRig?.getTime() ?? null,
        modelScale: this.runnerRig?.object.scale.toArray() ?? null,
        modelPosition: this.runnerRig?.object.position.toArray() ?? null,
        scale: this.runnerGroup.scale.toArray(),
      }),
      pickupDetails: () => this.pickups.map(entity=>{
        const p=this.world.require(entity,Pickup),o=p.object;
        const bounds=o?new THREE.Box3().setFromObject(o,true):null;
        return {kind:p.kind,value:p.value,lane:p.lane,distance:p.distance,baseY:p.baseY,
          position:o?.position.toArray(),yaw:o?.rotation.y,age:o?this.world.elapsed-o.userData.nativeCoinSpawnTime:null,
          bounds:bounds?{min:bounds.min.toArray(),max:bounds.max.toArray()}:null};
      }),
      scene: () => ({ tiles: this.tiles.size, obstacles: this.obstacles.length, pickups: this.pickups.length }),
      terrain: (d: number) => terrainAt(d, this.path),
      narrow: (d: number) => this.narrowAt(d, this.path),
      sidePath: (d: number) => this.sidePathAt(d, this.path),
      graph: () => ({ forks: this.graph.forks.map((f) => ({ at: f.at, chosen: f.chosen })), activeSegments: this.graph.active.segments.length }),
      death: () => ({ reason: mutateUi.deathReason, kind: mutateUi.deathKind, elapsed:this.deathElapsed, delay:this.deathTimer }),
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
      distanceExact: this.distance,
      runElapsed: this.world.elapsed-this.runStartedAt,
      progressDistance: stats.distance,
      score: stats.score,
      fps: mutateUi.fps,
      coins: stats.coins,
      gems: stats.gems,
      lane: this.world.require(this.runnerEntity, Lane).index,
      jumpY: jump.y,
      jumpVelocity:jump.v,
      airborne:jump.airborne,
      sliding: slide.remaining,
      slideDuration: slide.duration,
      speed: this.speed,
      recoveringFromStumble: this.recoveringFromStumble,
      stumbleRemaining:this.nativeStumbleRemaining,
      falling:this.nativeFalling,
      queuedForwardForce:this.nativeForwardForce,
      swipeStumbleDelay:this.nativeSwipeStumbleDelay,
      side:this.world.require(this.runnerEntity,Lane).x,
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
    this.bundle.camera.fov = CAMERA_FOV;
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
    this.world.add(this.runnerEntity, Speed, { value: this.difficulty.name === 'classic' ? 20 : RUN_SPEED });
    this.world.add(this.runnerEntity, RunStats);
    this.world.add(this.runnerEntity, Chase, { gap: CHASE_GAP_MAX });
    this.world.add(this.runnerEntity, Turn, { next: FIRST_TURN_DISTANCE });
    this.world.add(this.runnerEntity, Power);
    this.world.add(this.runnerEntity, Runner, { rig: null });
  }

  private resetWorld(): void {
    const entrance = this.bundle.scene.getObjectByName('reference-entrance');
    if (entrance) entrance.visible = false;
    this.runStartedAt = this.world.elapsed;
    this.needsToDuckCamera = false;this.nativeCameraShake=null;this.nativeCameraShakeOffset=[0,0,0];
    this.nativeTimeSinceStumble = NATIVE_STUMBLE_RESET_AGE;
    this.nativeFalling=false;this.nativeForwardForce=0;
    this.nativeTiltTargetX=0;this.nativeSwipeStumbleDelay=null;this.nativeSwipeOffset=null;
    this.nativeStumbleElapsed=0;this.nativeStumbleSeconds=0;this.nativeStumbleRemaining=0;this.stumbleAnimation=null;
    this.nativeEnemyGap = 0;
    this.recoveringFromStumble = false;
    this.stumbleCooldown = 0;
    if (this.safetyNet) this.safetyNet.visible = false;
    this.runnerRig?.setInvincibility(false);
    if (this.runnerEntity) this.world.destroyEntity(this.runnerEntity);
    if (this.chaserEntity) this.world.destroyEntity(this.chaserEntity);
    for (const entity of [...this.obstacles, ...this.pickups, ...[...this.tiles.values()]]) this.removeEntityObject(entity);
    for (const entity of this.world.query(Obstacle)) this.removeEntityObject(entity);
    this.obstacles = [];
    this.pickups = [];
    this.tiles.clear();
    for (const [distance, group] of this.junctions) {
      this.releaseTile(group);
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
    this.graph.reset();
    this.difficulty = getDifficulty();
    this.input.setClassicControls(this.difficulty.name==='classic');
    this.bundle.camera.near=this.difficulty.name==='classic'?NATIVE_CAMERA_NEAR:.1;
    this.bundle.camera.far=this.difficulty.name==='classic'?NATIVE_CAMERA_FAR:190;
    this.bundle.camera.updateProjectionMatrix();
    // Keep the constant-colour background sphere inside the actual far plane.
    this.bundle.sky.scale.setScalar(this.difficulty.name==='classic'?.5:1);
    this.nextSpawn = this.difficulty.name === 'classic' ? REFERENCE_RANDOM_OBSTACLES_FROM : 80;
    this.referenceObstacleIndex = 0;
    this.nextPickup = this.difficulty.name==='classic' ? Math.max(MIN_BONUS_ITEM_SPACING,REFERENCE_RANDOM_OBSTACLES_FROM) : MIN_BONUS_ITEM_SPACING;
    this.lastObstacleDistance = 0;
    this.lastObstacleSide = 0;
    this.obstacleRng = new SeededRandom((Date.now() ^ 0x9e3779b9) >>> 0);
    this.deathTimer = 0;this.deathElapsed=0;
    this.hintCooldown = 0;
    this.narrowWarned = false;
    this.sideWarned = false;
    this.sideFork = null;
    this.sideBranch = null;
    this.basePath = null;
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
    if (this.chaserRigs.length === 8) {
      const pack = new THREE.Group();
      this.chaserRigs.forEach((rig, i) => {
        const monkey = new THREE.Group();
        const formation=nativeEnemyFormation(i);
        monkey.position.set(formation.side, 0, formation.behind);
        monkey.add(rig.object);
        pack.add(monkey);
      });
      this.chaserGroup.add(pack);
    } else {
      this.chaserGroup.add(buildChaser(this.bundle.assets));
    }
    this.chaserGroup.position.set(0, 0, 9);
    this.cameraPos.set(0, 5.8, 10.1);
    this.cameraLook.set(0, 0.65, -7.5);
    this.ensureTiles();
    this.syncRunnerObject();
    resetHud();
  }

  start(): void {
    if (mutateUi.phase === 'ended') this.commitRun();
    this.resetWorld();
    const entrance = this.bundle.scene.getObjectByName('reference-entrance');
    if (entrance) entrance.visible = true;
    mutateUi.phase = 'playing';
    mutateUi.speed = RUN_SPEED;
    setPhase('playing');
    sfx.unlockAudio();
    if (progress.music) sfx.startMusic('theme');
    this.paused = false;
    this.updateCamera(0);
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
    this.showEntranceCamera();
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
          // SetupCharacter parents the default prefab and sets localPosition(0,1,0).
          // Native world units are scaled by .2; preserve its authored bone TRS.
          scale: skin.id === 'jhony' ? .2 : .27,
          yOffset: skin.id === 'jhony' ? .2 : 1.32,
          authoredSkeleton: skin.id === 'jhony',
          clipFallbackUrl: DEFAULT_SKIN_URL,
        },
      );
      if (token !== this.rigToken || this.disposed) return;
      if (skin.id !== 'jhony') normalizeRigHeight(rig, 1.85);
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

  /** Reserved angel-wing artwork; invisibility uses the native cyan body texture. */
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
    // Native GameController280 produces force after CharacterPlayer220's
    // movement and action expiry. Input next frame cannot erase that force.
    this.captureNativeForwardForce();
    this.updateMonkey(dt);
    this.updateCamera(dt);
    this.syncHud(dt);
  }

  /** The death beat: keep the world frozen, then hand control to the result screen. */
  private updateDeath(dt: number): void {
    if(this.difficulty.name==='classic'){
      const timer=stepNativeDeathTimer(this.deathElapsed,dt);this.deathElapsed=timer.elapsed;
      if(timer.finished)this.finishDeath();
      this.updateCamera(dt);
    }else{
      this.deathTimer-=dt;if(this.deathTimer<=0)this.finishDeath();
    }
  }

  advance(ms: number): void {
    const steps = Math.max(1, Math.ceil(ms / 25));
    const dt = Math.min(0.05, ms / steps / 1000);
    for (let i = 0; i < steps; i++) {
      if (mutateUi.phase === 'playing') this.tick(dt);
      else if (mutateUi.phase === 'dying') this.updateDeath(dt);
      else break;
      this.syncObjects(dt);
    }
    this.renderOnce();
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

  private introHeld(): boolean {
    return this.difficulty.name === 'classic' && nativeIntroHeld(this.world.elapsed - this.runStartedAt);
  }

  private move(dir: 1 | -1): void {
    if (mutateUi.phase !== 'playing' || this.introHeld()) return;
    // A swipe used to turn must not also displace the runner across the new road.
    if (this.queueTurn(dir)) return;
    if(this.difficulty.name==='classic'){
      const jump=this.world.require(this.runnerEntity,Jump);
      const slide=this.world.require(this.runnerEntity,Slide);
      const power=this.world.require(this.runnerEntity,Power);
      if(jump.airborne||slide.remaining>0||this.nativeFalling||(power.kind==='boost'&&this.world.elapsed<power.until))return;
      this.nativeSwipeStumbleDelay=NATIVE_REJECTED_TURN_DELAY;
      this.nativeSwipeOffset=dir*NATIVE_REJECTED_TURN_OFFSET;
      this.nativeTiltTargetX=this.nativeSwipeOffset;
      return;
    }
    const lane = this.world.require(this.runnerEntity, Lane);
    lane.index = Math.max(0, Math.min(2, lane.index + dir));
    sfx.play('swish', { gain: 0.55, rate: 0.95 + Math.random() * 0.1 });
  }

  private queueTurn(dir: 1 | -1): boolean {
    if (mutateUi.phase !== 'playing' || this.introHeld()) return false;
    const turn = this.world.require(this.runnerEntity, Turn);
    const tee=this.difficulty.name==='classic' && referenceJunction(turn.count,turn.next)==='tee';
    if (!acceptsTurn(tee?dir:turn.direction, dir, turn.next - this.distance, turn.queued)) return false;
    if(tee && dir!==turn.direction) {
      const fork=[...this.graph.forks].reverse().find(f=>f.at===turn.next);
      if(!fork)return false;
      this.graph.choose(fork,dir>0?'right':'left');turn.direction=dir;
      this.rebuildTilesAhead();this.ensureTiles();
    }
    turn.queued = true;
    sfx.play('click', { gain: 0.5 });
    setHint('转弯');
    return true;
  }

  private jump(): void {
    if (mutateUi.phase !== 'playing' || this.introHeld() || this.difficulty.name==='classic'&&(this.nativeStumbleRemaining>0||this.nativeFalling)) return;
    const jump = this.world.require(this.runnerEntity, Jump);
    // Native Jump1297bb4 rejects IsJumping, not an approximate foot height.
    if (this.difficulty.name==='classic' ? !jump.airborne : jump.y <= 0.02 && jump.v <= 0) {
      jump.v = this.difficulty.name === 'classic' ? nativeJumpVelocity(this.speed) : JUMP_VELOCITY;
      jump.airborne = true;
      this.stumbleAnimation=null;
      jump.lastJumpAt = this.world.elapsed;
      const slide = this.world.require(this.runnerEntity, Slide);
      slide.remaining = 0;
      setHint('跳！');
      sfx.play('jump', { gain: 0.85 });
      sfx.play('whoosh', { gain: 0.32, rate: 1.12 });
    }
  }

  private slide(): void {
    if (mutateUi.phase !== 'playing' || this.introHeld() || this.difficulty.name==='classic'&&this.nativeFalling) return;
    const jump = this.world.require(this.runnerEntity, Jump);
    const slide = this.world.require(this.runnerEntity, Slide);
    if (slide.remaining > 0) return;
    // Native Slide12987a8 rejects IsJumping; down in midair does not
    // replace vertical velocity or queue a slide for landing.
    const native=this.difficulty.name==='classic';
    if(native&&jump.airborne)return;
    if (native || jump.y < 0.12) {
      const power = this.world.require(this.runnerEntity, Power);
      const boosted = power.kind === 'boost' && this.world.elapsed < power.until;
      const speed = this.world.require(this.runnerEntity, Speed).value
        * (this.difficulty.name === 'classic' ? 1 : skinById(progress.equipped).speed) * (boosted ? 1.35 : 1);
      slide.duration = nativeSlideDuration(speed);
      this.stumbleAnimation=null;
      slide.elapsed = 0;
      slide.remaining = slide.duration;
      this.runnerRig?.setClip('slide', true);
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
      if(this.difficulty.name==='classic')for(const pickup of referencePickupsForTurn(turn.count,turn.next))
        this.spawnPickup(pickup.kind,pickup.lane,pickup.distance,pickup.height);
      const recordedCoins=this.difficulty.name==='classic' ? referenceCoinsForTurn(turn.count,turn.next) : null;
      if(recordedCoins) {
        for(const coin of recordedCoins)this.spawnCoin(coin.lane,coin.distance,coin.height);
      } else {
        for (let i = 0; i < MAX_COINS_PER_RUN; i++) this.spawnCoin(1, turn.next - 5 + i * 2.2, COIN_Y + Math.sin(i / Math.max(1, MAX_COINS_PER_RUN - 1) * Math.PI) * 0.4);
      }
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
    const recordedDirection = this.difficulty.name === 'classic' ? referenceTurnDirection(turn.count, turn.next) : null;
    const direction: 1 | -1 = recordedDirection ?? (Math.random() > 0.5 ? 1 : -1);
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
    const recordedNext = this.difficulty.name === 'classic' ? referenceNextTurnDistance(turn.count, turn.next) : null;
    const reviewedEnd = this.difficulty.name === 'classic' && recordedNext === null
      && referenceTurnDirection(turn.count-1,turn.lastTurnDistance)!==null
      ? REFERENCE_RANDOM_OBSTACLES_FROM : 0;
    turn.next = recordedNext ?? (9 + 12 * Math.max(1, Math.ceil((Math.max(turn.next + length,reviewedEnd) - 9) / 12)));
    setHint('漂亮的转弯！');
    sfx.play('swish', { rate: 1.15 });
    this.rebuildTilesAhead();
    this.ensureTiles();
  }

  private nativeGroundSupported(distance:number,side:number,laneIndex:number):boolean {
    const branch=this.sidePathAt(distance,this.path);
    if(branch&&laneIndex===1)return false;
    const narrow=branch?null:this.narrowAt(distance,this.path);
    if(narrow&&offNarrowSurface(narrow.side,side))return false;
    for(const entity of this.obstacles){
      const obstacle=this.world.require(entity,Obstacle);
      if(!isGapKind(obstacle.kind))continue;
      const base=DEFS[obstacle.defId as DefId]??defForKind(obstacle.kind);
      if(collisionWouldHit({def:{...base,hitbox:obstacle.hitbox},lane:obstacle.lane,distance:obstacle.distance},
        {prevDistance:distance,distance,laneIndex,side,jumpY:0,jumpV:0,slideRemaining:0,
          lastJumpAt:-Infinity,lastSlideAt:-Infinity,now:this.world.elapsed,jumpWindow:0,slideWindow:0}))return false;
    }
    return true;
  }

  private captureNativeForwardForce():void {
    if(this.difficulty.name!=='classic'||mutateUi.phase!=='playing'||this.introHeld()){
      this.nativeForwardForce=0;return;
    }
    const jump=this.world.require(this.runnerEntity,Jump),slide=this.world.require(this.runnerEntity,Slide);
    this.nativeForwardForce=nativeForwardAcceleration(this.speed,42,jump.airborne,slide.remaining>0);
  }

  private updateRunner(dt: number): void {
    // Native Hold skips CharacterPlayer.Update, including motion and scoring.
    if (this.introHeld()) return;
    const distance = this.distance;
    const nativeMotion = this.difficulty.name === 'classic';
    if(nativeMotion&&this.nativeSwipeStumbleDelay!==null){
      this.nativeSwipeStumbleDelay=stepNativeStumbleDelay(this.nativeSwipeStumbleDelay,dt);
      if(this.nativeSwipeStumbleDelay<=0){
        this.nativeSwipeStumbleDelay=null;this.stumble();
        if(mutateUi.phase!=='playing')return;
      }
    }
    if(nativeMotion&&this.nativeSwipeStumbleDelay===null&&this.nativeStumbleRemaining<=0)this.nativeSwipeOffset=null;
    const laneBefore = this.world.require(this.runnerEntity, Lane);
    const beforePose = this.path.at(distance, laneBefore.x, true);
    const speed = this.world.require(this.runnerEntity, Speed);
    const targetSpeed = (RUN_SPEED_MIN + Math.min(this.difficulty.speedMax - RUN_SPEED_MIN, distance * this.difficulty.speedGrowth))
      * openingSpeedFactor(this.world.elapsed - this.runStartedAt);
    if (nativeMotion) {
      speed.value=stepNativeForwardVelocity(speed.value,this.nativeForwardForce,dt);
      this.nativeForwardForce=0;
      this.recoveringFromStumble = false;
    } else if (this.recoveringFromStumble) {
      // Preserve the source velocity drop across frames. Normal cruise still
      // uses the legacy route target until physical route/scoring migration;
      // recovery applies native force and pauses during jump/slide.
      const jump = this.world.require(this.runnerEntity, Jump);
      const slide = this.world.require(this.runnerEntity, Slide);
      speed.value = Math.min(targetSpeed, speed.value + nativeForwardAcceleration(
        speed.value, 42, jump.airborne, slide.remaining > 0,
      ) * dt);
      if (speed.value >= targetSpeed) this.recoveringFromStumble = false;
    } else speed.value = targetSpeed;
    const power = this.world.require(this.runnerEntity, Power);
    const boost = power.kind === 'boost' && this.world.elapsed < power.until;
    const invisible = power.kind === 'shield' && this.world.elapsed < power.until;
    // Skins carry the same speed flavour as the original store (werewolf lumbers, Scarlett sprints).
    const currentSpeed = speed.value * (nativeMotion ? 1 : skinById(progress.equipped).speed) * (boost ? 1.35 : 1);
    const trackPos = this.world.require(this.runnerEntity, TrackPos);
    trackPos.distance += currentSpeed * dt;
    const lane = this.world.require(this.runnerEntity, Lane);
    const steering = nativeMotion && !nativeTiltAllowed(this.world.elapsed-this.runStartedAt)
      ? null : this.input.steeringAxis;
    let targetX = steering === null ? laneX(lane.index)
      : steering * (nativeMotion?NATIVE_TILT_OFFSET_MAX:LANES[2]);
    if(nativeMotion&&steering!==null){
      if(this.nativeSwipeOffset!==null)this.nativeTiltTargetX=this.nativeSwipeOffset;
      else if(this.nativeStumbleRemaining<=0)this.nativeTiltTargetX=targetX;
      targetX=this.nativeTiltTargetX;
    }
    if(!nativeMotion||!this.nativeFalling) lane.x = nativeMotion && steering !== null
      ? stepNativeSteering(lane.x,targetX,dt)
      : THREE.MathUtils.damp(lane.x,targetX,12,dt);
    if (steering !== null && (!nativeMotion||!this.nativeFalling)) lane.index = lane.x < -0.65 ? 0 : lane.x > 0.65 ? 2 : 1;

    // GameController.Update126cc78 computes XZ progress before the ledge
    // Kill branch126d2a0. Preserve the final moving frame in result totals.
    const stats = this.world.require(this.runnerEntity, RunStats);
    if (nativeMotion) {
      const afterPose = this.path.at(trackPos.distance, lane.x, true);
      const delta = nativeProgressDelta(afterPose.x-beforePose.x, afterPose.z-beforePose.z, dt);
      const award = nativeProgressScore(stats.progressRemainder, delta, REFERENCE_SCORE_MULTIPLIER);
      stats.progressRemainder = award.remainder;
      stats.score += award.scoreDelta;
      stats.distance += delta;
    }

    const jump = this.world.require(this.runnerEntity, Jump);
    if(nativeMotion){
      const supported=invisible||boost||this.world.elapsed<this.invincibleUntil
        ||this.nativeGroundSupported(trackPos.distance,lane.x,lane.index);
      if(jump.airborne||this.nativeFalling||!supported){
        const wasFalling=this.nativeFalling;
        Object.assign(jump,stepNativeVertical(jump.y,jump.v,dt));
        const contact=nativeGroundContact(jump.y,supported,wasFalling);
        if(contact.dead){this.die(contact.deathType===1?'掉进了水里':'撞到了断崖',contact.deathType===1?'water':'fall');if(contact.deathType===4)this.nativeCameraShake=startNativeCameraShake(1,1);return;}
        if(contact.landed){
          jump.y=0;jump.v=0;jump.airborne=false;this.nativeFalling=false;
          if(contact.stumble)this.stumble();
          sfx.play('land',{gain:.7});
        }else this.nativeFalling=jump.y<0;
      }
    }else if(jump.y>0||jump.v>0){
      jump.v-=GRAVITY*dt;jump.y+=jump.v*dt;
      if(jump.y<=0){jump.y=0;jump.v=0;jump.airborne=false;sfx.play('land',{gain:.7});}
    }
    const slide = this.world.require(this.runnerEntity, Slide);
    if (slide.remaining > 0) {
      if (nativeMotion) Object.assign(slide,stepNativeSlideTimer(slide.elapsed,slide.duration,dt));
      else slide.remaining = Math.max(0, slide.remaining - dt);
      if (nativeMotion && slide.remaining===0) this.stumbleAnimation=null;
    }
    if (nativeMotion && this.nativeStumbleRemaining>0) {
      const timer=stepNativeSlideTimer(this.nativeStumbleElapsed,this.nativeStumbleSeconds,dt);
      this.nativeStumbleElapsed=timer.elapsed;this.nativeStumbleRemaining=timer.remaining;
    }
    // Collapsed-lane sections: leaving the surviving lane drops the runner into the canyon.
    // A side-road fork owns the whole width; narrow must not overlap its branch lanes.
    const activeSide = this.sidePathAt(trackPos.distance, this.path);
    const narrow = activeSide ? null : this.narrowAt(trackPos.distance, this.path);
    // Warn before the slab ends: the one surviving lane needs an early lane change.
    // A side-path fork owns the warning slot while it is active.
    if (!narrow && !activeSide && !this.narrowWarned) {
      const ahead = this.narrowAt(trackPos.distance + 32, this.path);
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
      if (!nativeMotion && !invisible && offNarrowSurface(narrow.side, lane.x)) {
        this.die('踩空坠下悬崖', this.difficulty.name==='classic'?'water':'fall');
        return;
      }
    } else if (this.narrowWarned) {
      this.narrowWarned = false;
    }
    const side = this.sidePathAt(trackPos.distance, this.path);
    if (side && !this.sideFork && lane.index !== 1) {
      // Enter a real lateral branch: both branches are parallel paths with their own
      // active distance; the player's lane chooses which one drives camera/obstacles.
      this.basePath = this.path.clone();
      this.sideFork = this.graph.forkLateral(side.from, 1.9);
      this.sideBranch = lane.index === 0 ? 'left' : 'right';
      this.graph.choose(this.sideFork, this.sideBranch);
      sfx.play('branchChime');
      this.rebuildTilesAhead();
    } else if (side && this.sideFork && lane.index !== 1) {
      const wanted = lane.index === 0 ? 'left' : 'right';
      if (wanted !== this.sideBranch) {
        this.sideBranch = wanted;
        this.graph.choose(this.sideFork, wanted);
        this.rebuildTilesAhead();
      }
    }
    if (side) {
      if (!this.sideWarned) {
        this.sideWarned = true;
        setHint('左右分路 · 选一边！');
      }
      if (!nativeMotion && !invisible && lane.index === 1) {
        this.die('踩空坠下分路缺口', this.difficulty.name==='classic'?'water':'fall');
        return;
      }
    } else if (this.sideWarned) {
      this.sideWarned = false;
      if (this.sideFork) {
        this.sideFork = null;
        this.sideBranch = null;
        if (this.basePath) this.graph.merge(this.basePath);
        this.basePath = null;
        this.rebuildTilesAhead();
      }
    } else if (!this.narrowWarned) {
      const ahead = this.sidePathAt(trackPos.distance + 24, this.path);
      if (ahead) setHint('前方左右分路 · 选一边！');
    }
    this.updateFootsteps(trackPos.distance, currentSpeed);
    if (!nativeMotion) {
      stats.score += distanceScoreDelta(stats.distance, trackPos.distance);
      stats.distance = trackPos.distance;
    }
    if (stats.comboTimer > 0) {
      stats.comboTimer -= dt;
      if (stats.comboTimer <= 0) {
        stats.combo = 0;
        stats.multiplier = 1;
      }
    }
    const milestone = Math.floor(stats.distance / 500);
    if (milestone > 0 && milestone !== this.lastMilestone) {
      this.lastMilestone = milestone;
      const reached = milestone * 500;
      showMilestone(reached, 'm', reached >= Math.max(1000, progress.bestDistance) ? 'highscore' : 'nicejob');
      sfx.play('jingle', { gain: 0.8 });
    }
    mutateUi.distance = Math.floor(stats.distance);
    mutateUi.speed = currentSpeed;
    mutateUi.jump = jump.y;
    mutateUi.sliding = slide.remaining;
    mutateUi.lane = lane.index;
    mutateUi.multiplier = stats.multiplier;
  }

  private narrowAt(distance: number, path = this.path): ReturnType<typeof narrowAt> {
    return this.difficulty.name==='classic' && referenceFullWidthAt(distance) ? null : narrowAt(distance,path);
  }

  private sidePathAt(distance: number, path = this.path): ReturnType<typeof sidePathAt> {
    return this.difficulty.name==='classic' && referenceFullWidthAt(distance) ? null : sidePathAt(distance,path);
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
  private acquireTile(index: number, terrain: TerrainKind, narrow: ReturnType<typeof narrowAt> | null, clearScenery = false, surface: SurfaceKind = 'stone', sidePath = false, sidePathLast = false, surfaceFirst = false, surfaceLast = false, branchOffset = 0): THREE.Group {
    const firstTile = narrow ? index === Math.floor((narrow.from + 9) / TILE) : false;
    const recordedStraightGate = this.difficulty.name === 'classic' ? referenceStraightGate(index*TILE) : null;
    const gate = recordedStraightGate !== null || index * TILE >= (this.difficulty.name === 'classic' ? 180 : 80) && index % 7 === 2 && terrain === 'temple' && !clearScenery
      && !(this.difficulty.name==='classic' && (referenceFullWidthAt(index*TILE) || overlapsReferenceGate(index*TILE)));
    const treeSide = surface === 'stone' && !this.path.nearTurn(index * TILE, 8) && index >= 4 && index % 3 === 1 && !(this.difficulty.name === 'classic' && overlapsReferenceTree(index * TILE)) ? (index % 6 === 1 ? -1 : 1) : 0;
    const narrowKey = narrow ? `${narrow.side}:${firstTile ? 1 : 0}` : 'none';
    const key = `${terrain}:${surface}:${surfaceFirst ? 1 : 0}:${surfaceLast ? 1 : 0}:${sidePath ? 1 : 0}:${sidePathLast ? 1 : 0}:${branchOffset.toFixed(2)}:${clearScenery ? 1 : 0}:${gate ? recordedStraightGate ?? 'side' : 'none'}:${treeSide}:${narrowKey}`;
    const pooled = this.tilePools.get(key)?.pop();
    if (pooled) {
      pooled.visible = true;
      pooled.userData.tileIndex = index;
      pooled.userData.narrowSection = narrow;
      return pooled;
    }
    const prototypeKey = `${terrain}:${surface}:${surfaceFirst ? 1 : 0}:${surfaceLast ? 1 : 0}:${sidePath ? 1 : 0}:${sidePathLast ? 1 : 0}:${branchOffset.toFixed(2)}:${clearScenery ? 1 : 0}`;
    let prototype = this.tilePrototypes.get(prototypeKey);
    if (!prototype) {
      prototype = buildTile(this.bundle.assets, -1, 0, terrain, null, clearScenery, surface, sidePath, sidePathLast, branchOffset, surfaceFirst, surfaceLast);
      mergeStaticMeshes(prototype);
      this.tilePrototypes.set(prototypeKey, prototype);
    }
    const group = prototype.clone(true);
    group.userData.tileIndex = index;
    group.userData.terrain = terrain;
    group.userData.poolKey = key;
    group.userData.narrowSection = narrow;
    if (gate) {
      const arch = buildStoneGate(this.bundle.assets,recordedStraightGate==='tower');
      arch.position.z = -TILE / 2;
      group.add(arch);
    }
    if (treeSide && this.bundle.assets.tree) {
      const tree = this.bundle.assets.tree.clone(true);
      tree.scale.setScalar(0.12);
      tree.position.set(treeSide * 6.2, -2, -2.5);
      tree.rotation.y = treeSide > 0 ? Math.PI : 0;
      group.add(tree);
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

  /** Surface holes share the obstacle's longitudinal collision interval. */
  private cutTileSurface(group: THREE.Object3D, distance: number): void {
    const cuts: SurfaceCut[] = [];
    const narrow = group.userData.narrowSection as ReturnType<typeof narrowAt>;
    if (narrow) {
      const span = [distance - narrow.to, distance - narrow.from] as const;
      cuts.push(narrow.side === 'left' ? ['x', NARROW_EDGE, 1000, span] : ['x', -1000, -NARROW_EDGE, span]);
    }
    for (const entity of this.obstacles) {
      const obstacle = this.world.require(entity, Obstacle);
      const definition = DEFS[obstacle.defId as DefId] as ObstacleDef | undefined;
      if (!isGapKind(obstacle.kind) && !definition?.surfaceCut) continue;
      const interval = definition?.surfaceCut ?? obstacle.hitbox.z;
      const from = distance - obstacle.distance - interval[1];
      const to = distance - obstacle.distance - interval[0];
      if (from < TILE / 2 && to > -TILE / 2) cuts.push(['z', from, to]);
    }
    this.applySurfaceCuts(group,cuts);
  }

  private cutJunctionSurface(group: THREE.Object3D, distance: number): void {
    const gaps=this.obstacles.flatMap(entity=>{
      const obstacle=this.world.require(entity,Obstacle);
      const definition=DEFS[obstacle.defId as DefId] as ObstacleDef|undefined;
      if(!isGapKind(obstacle.kind)&&!definition?.surfaceCut)return [];
      return [{distance:obstacle.distance,interval:definition?.surfaceCut??obstacle.hitbox.z}];
    });
    this.applySurfaceCuts(group,junctionGapCuts(distance,this.path,gaps));
  }

  private applySurfaceCuts(group: THREE.Object3D, cuts: SurfaceCut[]): void {
    const signature = JSON.stringify(cuts);
    if (group.userData.cutSignature === signature) return;
    group.userData.cutSignature = signature;
    group.updateMatrixWorld(true);
    const inverse = group.matrixWorld.clone().invert();
    group.traverse(part => {
      const mesh = part as THREE.Mesh;
      if (!mesh.isMesh || !mesh.userData.walkableSurface) return;
      const previous = this.cutMeshes.get(mesh);
      if (previous) { previous.cut.dispose(); mesh.geometry = previous.original; this.cutMeshes.delete(mesh); }
      if (!cuts.length) return;
      const original = mesh.geometry;
      const matrix = inverse.clone().multiply(mesh.matrixWorld);
      let geometry = original.clone().applyMatrix4(matrix);
      for (const [axis, from, to, span] of cuts) {
        const next = cutSurfaceGeometry(geometry, from, to, axis, span);
        geometry.dispose();
        geometry = next;
      }
      geometry.applyMatrix4(matrix.clone().invert());
      mesh.geometry = geometry;
      this.cutMeshes.set(mesh, { original, cut: geometry });
    });
  }

  private releaseTile(object: THREE.Object3D): void {
    this.bundle.scene.remove(object);
    if (object.userData.cutSignature !== undefined) {
      object.traverse(part => {
        const mesh = part as THREE.Mesh;
        const saved = this.cutMeshes.get(mesh);
        if (saved) { saved.cut.dispose(); mesh.geometry = saved.original; this.cutMeshes.delete(mesh); }
      });
      delete object.userData.cutSignature;
    }
    const key = typeof object.userData.poolKey === 'string' ? object.userData.poolKey : null;
    if (!key) return;
    const pool = this.tilePools.get(key) ?? [];
    pool.push(object as THREE.Group);
    this.tilePools.set(key, pool);
  }

  /** Clone the cached road-width corner and parapets. */
  private acquireJunction(direction: 1 | -1, at: number): THREE.Group {
    const surface = surfaceAt(at).kind;
    const turnState=this.world.require(this.runnerEntity,Turn);
    const kind=this.difficulty.name==='classic'?referenceJunction(turnState.count,at):'corner';
    const key = `${surface}:${kind}:${direction}`;
    let prototype = this.junctionPrototypes.get(key);
    if (!prototype) {
      prototype = kind==='tee' && (surface==='wood'?this.bundle.assets.plankTJunction:this.bundle.assets.tJunction) ? buildTJunction(this.bundle.assets,surface) : buildJunction(this.bundle.assets, direction, new TrackPath(), 0, surface);
      mergeStaticMeshes(prototype);
      this.junctionPrototypes.set(key, prototype);
    }
    const group = prototype.clone(true);
    if(kind==='tee' && this.bundle.assets.tree) {
      const tree=this.bundle.assets.tree.clone(true);tree.scale.setScalar(.12);tree.position.set(0,-2,-10);group.add(tree);
    }
    const turn=this.world.require(this.runnerEntity,Turn);
    const recordedGate=this.difficulty.name==='classic'?referenceGate(turn.count,at):null;
    if(recordedGate) {
      const arch=buildStoneGate(this.bundle.assets,recordedGate==='exit');
      if(recordedGate==='exit') { arch.position.set(direction*REFERENCE_EXIT_GATE_OFFSET,0,0);arch.rotation.y=direction*Math.PI/2; }
      else arch.position.set(0,0,-2);
      group.add(arch);
    }
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

  private acquirePickup(kind: PickupKind, value = 1): THREE.Object3D {
    const key = kind === 'coin' ? `coin:${value}` : kind;
    const pool = this.pickupPools.get(key);
    let object = pool?.pop();
    if (!object) {
      object = kind === 'coin' ? buildCoin(this.bundle.assets, value) : kind === 'gem' ? buildGem() : buildPower(kind, this.bundle.assets);
      mergeStaticMeshes(object);
    }
    object.visible = true;
    object.userData.pickupPoolKey = key;
    this.bundle.scene.add(object);
    return object;
  }

  private releasePickup(kind: PickupKind, object: THREE.Object3D): void {
    this.bundle.scene.remove(object);
    const key = object.userData.pickupPoolKey ?? kind;
    const pool = this.pickupPools.get(key) ?? [];
    pool.push(object);
    this.pickupPools.set(key, pool);
  }

  private ensureTiles(): void {
    const from = Math.floor((this.distance - 24) / TILE);
    const to = Math.floor((this.distance + 130) / TILE);
    for (let index = from; index <= to; index++) {
      const distance = index * TILE;
      // A 12 m tile that straddles a corner cannot be rotated to both headings: its walls
      // cut across the other leg. Drop it and let the road-width corner fill the gap.
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
      if (this.tiles.has(index)) {
        const tile = this.world.require(this.tiles.get(index)!, Tile);
        if (tile.object) this.cutTileSurface(tile.object, tile.distance);
        continue;
      }
      const surface = surfaceAt(distance);
      const terrain = terrainAt(distance, this.path);
      const side = this.sidePathAt(distance, this.path) ?? this.sidePathAt(distance + TILE * 0.5, this.path);
      const narrow = side ? null : this.narrowAt(distance, this.path) ?? this.narrowAt(distance + TILE * 0.5, this.path);
      const clearScenery = this.path.nearTurn(distance, 26);
      const group = this.acquireTile(index, terrain, narrow, clearScenery, surface.kind, Boolean(side), side?.last ?? false, surface.first, surface.last, side ? this.path.lateral : 0);
      const point = this.path.at(distance);
      group.position.set(point.x, 0, point.z);
      group.rotation.y = point.heading;
      this.cutTileSurface(group, distance);
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
      this.cutJunctionSurface(junction,distance);
      if (distance < this.distance - 30) {
        this.releaseTile(junction);
        this.junctions.delete(distance);
      }
    }
  }

  private spawnWaves(): void {
    if(this.difficulty.name === 'classic') {
      while(this.referenceObstacleIndex<REFERENCE_VISIBLE_OBSTACLES.length) {
        const recorded=REFERENCE_VISIBLE_OBSTACLES[this.referenceObstacleIndex];
        if(recorded.distance>=this.distance+95)break;
        this.referenceObstacleIndex++;
        // Debug jumps must not reinsert a recorded obstacle far behind the actor.
        if(recorded.distance<this.distance-10)continue;
        this.spawnDef(DEFS[recorded.defId],1,recorded.distance,recorded.prefab);
      }
    }
    while (this.nextSpawn < this.distance + 95) {
      const base = this.nextSpawn;
      const turn = this.world.require(this.runnerEntity, Turn);
      // The turn is prebuilt only within TURN_PREBUILD_DISTANCE, so use the Turn component
      // rather than path.segments for this exclusion.
      if (Math.abs(base - turn.next) < 42 || Math.abs(base - turn.lastTurnDistance) < 32) {
        this.nextSpawn += 12;
        continue;
      }
      const narrow = this.narrowAt(base, this.path) ?? this.narrowAt(base + 6, this.path) ?? this.narrowAt(base + 14, this.path);
      const side = this.sidePathAt(base, this.path) ?? this.sidePathAt(base + 6, this.path);
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

  private spawnDef(def: ObstacleDef, lane: number, distance: number, recordedPrefab?: string): void {
    const prefab = recordedPrefab ?? def.prefabs[this.obstacleRng.int(def.prefabs.length)];
    const object = this.acquireObstacle(def, prefab);
    const entity = this.world.createEntity();
    this.world.add(entity, Obstacle, {
      kind: def.kind as ObstacleKind,
      defId: def.id,
      action: def.action,
      lanes: def.lanes,
      hitbox: def.variantHitboxes?.[prefab]??def.hitbox,
      kill: def.kill,
      lane,
      distance,
      full: def.lanes === 'all',
      passed: false,
      warned: false,
      object,
    });
    this.obstacles.push(entity);
    if (isGapKind(def.kind as ObstacleKind)) {
      for (const tileEntity of this.tiles.values()) {
        const tile = this.world.require(tileEntity, Tile);
        if (tile.object) this.cutTileSurface(tile.object, tile.distance);
      }
    }
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
      if (this.difficulty.name !== 'classic' && this.distance > 260 && Math.random() < dt * 0.02) this.spawnMonkey(this.distance + 12);
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

  private powerDuration(kind:PickupKind):number {
    if(this.difficulty.name==='classic'&&kind==='shield')return REFERENCE_SHIELD_DURATION;
    if(this.difficulty.name==='classic'&&kind==='magnet')return NATIVE_BASE_POWER_DURATION;
    return kind==='magnet'?8+magnetBonusSeconds():kind==='boost'?5:10;
  }

  /** Energy bar full: hand out one of the four classic boosts. */
  private grantPower(): void {
    const kinds: PickupKind[] = ['magnet', 'shield', 'boost', 'bonus'];
    const kind = kinds[Math.floor(Math.random() * kinds.length)];
    if (kind === 'bonus') {
      this.world.require(this.runnerEntity, RunStats).coins += nativeCoinBonusValue();
      setHint(`金币奖励 +${nativeCoinBonusValue()}`);
      sfx.play('meterFull', { gain: 0.8 });
      return;
    }
    const power = this.world.require(this.runnerEntity, Power);
    power.kind = kind;
    power.until = this.world.elapsed + this.powerDuration(kind);
    setHint(kind === 'magnet' ? '能量满！磁铁启动' : kind === 'shield' ? '能量满！无敌启动' : kind === 'boost' ? '能量满！加速' : '能量满！金币加成');
    sfx.play('meterFull', { gain: 0.8 });
  }

  private spawnObstacle(kind: ObstacleKind, lane: number, distance: number): void {
    const def = defForKind(kind);
    this.spawnDef(def, def.lanes === 'one' ? lane : 1, distance);
  }

  private spawnCoin(lane: number, distance: number, y = COIN_Y): void {
    if (distance < 4) return;
    const entity = this.world.createEntity();
    const value = referenceCoinValue(distance);
    const group = this.acquirePickup('coin', value);
    group.userData.nativeCoinSpawnTime=this.world.elapsed;
    if(this.difficulty.name==='classic')y=nativeCoinRootHeight(y,COIN_Y);
    this.world.add(entity, Pickup, { kind: 'coin', lane, distance, baseY: y, value, taken: false, object: group });
    this.pickups.push(entity);
  }

  private spawnGem(lane: number, distance: number): void {
    const entity = this.world.createEntity();
    const group = this.acquirePickup('gem');
    this.world.add(entity, Pickup, { kind: 'gem', lane, distance, baseY: 1.15, taken: false, object: group });
    this.pickups.push(entity);
  }

  private spawnPickup(kind: PickupKind, lane: number, distance: number, height = 1.35): void {
    const entity = this.world.createEntity();
    const group = this.acquirePickup(kind);
    this.world.add(entity, Pickup, { kind, lane, distance, baseY: height, taken: false, object: group });
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
      const baseDef = DEFS[obstacle.defId as DefId] ?? defForKind(obstacle.kind);
      const def:ObstacleDef={...baseDef,hitbox:obstacle.hitbox};
      const ahead = obstacle.distance - distance;
      if (obstacle.object) {
        if(def.id==='flameTower')updateNativeFlame(obstacle.object,this.world.elapsed);
        const x = def.lanes === 'one' ? LANES[obstacle.lane] : 0;
        const point = this.path.at(obstacle.distance, x);
        obstacle.object.position.set(point.x, 0, point.z);
        obstacle.object.rotation.y = point.heading;
        if ((def.kind === 'gap' || def.kind === 'gapLong') && !obstacle.warned && ahead > 3.5 && ahead < 12) {
          obstacle.warned = true;
          setHint('前方坑洞 · 向上跳！');
        }
      }

      // A hole remains unsupported ground after its first protected crossing.
      // Recheck until it leaves the swept interval, including power expiry or landing.
      if (!obstacle.passed || isGapKind(obstacle.kind)) {
        const hit = collisionWouldHit(
          { def, lane: obstacle.lane, distance: obstacle.distance },
          {
            prevDistance: previous,
            distance,
            laneIndex: lane.index,
            side: lane.x,
            prevSide: this.lastObstacleSide,
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
          const firstContact = !obstacle.passed;
          obstacle.passed = true;
          if (power.kind === 'boost' && now < power.until) {
            if (firstContact) setHint('冲撞！');
          } else if (power.kind === 'shield' && now < power.until) {
            if (firstContact) {
              setHint('无敌 · 穿过障碍');
              sfx.play('shimmer', { gain: 0.9 });
              this.stumbleCooldown = 4;
            }
          } else if (def.kill) {
            const hole=isGapKind(obstacle.kind);
            if(!(hole&&this.difficulty.name==='classic')){
              this.die(hole?'掉进了断桥':'撞上了路障',hole?'fall':'impact');
              if(this.difficulty.name==='classic')this.nativeCameraShake=startNativeCameraShake(1,1);
            }
          } else {
            this.stumble();
            if(this.difficulty.name==='classic')this.nativeCameraShake=startNativeCameraShake(1,1.5);
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
    this.lastObstacleSide = lane.x;
    mutateUi.nextCue = cue;
  }

  private stumbleCooldown = 0;
  private recoveringFromStumble = false;
  private narrowWarned = false;
  private sideWarned = false;
  private lastMilestone = 0;
  private stepLoop: string | null = null;
  private monkeyTimer = 0;
  private monkeyGroup: THREE.Group | null = null;

  private stumble(): void {
    this.nativeSwipeStumbleDelay=null;
    if (this.world.elapsed < this.invincibleUntil) return;
    const chase = this.world.require(this.runnerEntity, Chase);
    if (this.difficulty.name==='classic' ? nativeStumbleIsFatal(this.nativeTimeSinceStumble) : this.stumbleCooldown > 0) {
      chase.gap = 1.2;
      this.die('追逐者抓住了你。', 'caught');
      return;
    }
    this.stumbleCooldown = this.difficulty.name==='classic' ? STUMBLE_KILL_WINDOW : 7;
    this.nativeTimeSinceStumble = 0;
    const speed = this.world.require(this.runnerEntity, Speed);
    speed.value *= NATIVE_STUMBLE_SPEED_FACTOR;
    this.world.require(this.runnerEntity, Jump).v *= NATIVE_STUMBLE_SPEED_FACTOR;
    this.recoveringFromStumble = true;
    if(this.difficulty.name==='classic'){
      this.nativeStumbleElapsed=0;this.nativeStumbleSeconds=nativeStumbleDuration(speed.value);
      this.nativeStumbleRemaining=this.nativeStumbleSeconds;
      if(this.runnerRig?.clips.includes('stumble')){
        this.stumbleAnimation='stumble';this.runnerRig.setClip('stumble',true);
      }
    }
    chase.gap = 3.8;
    chase.cooldown = 8;
    chase.lunge = 1.6;
    setHint('绊倒了！追逐者靠近了');
    sfx.play('stumble', { gain: 0.9 });
    // CharacterPlayer.Stumble1297b30 also plays Effects.monkeys(20).
    if(this.difficulty.name==='classic')sfx.play('monkeys');
  }

  private updatePickups(dt: number): void {
    const distance = this.distance;
    const lane = this.world.require(this.runnerEntity, Lane);
    const stats = this.world.require(this.runnerEntity, RunStats);
    const power = this.world.require(this.runnerEntity, Power);
    const laneXNow = this.world.require(this.runnerEntity, TrackPos).side;
    const jump = this.world.require(this.runnerEntity, Jump);
    const slide = this.world.require(this.runnerEntity, Slide);
    for (let i = this.pickups.length - 1; i >= 0; i--) {
      const entity = this.pickups[i];
      const pickup = this.world.require(entity, Pickup);
      const nativeCoin=this.difficulty.name==='classic'&&pickup.kind==='coin';
      const pickupY=nativeCoin?pickup.baseY:pickupHeightAt(pickup.baseY,this.world.elapsed,pickup.distance);
      if (pickup.object) {
        const point = this.path.at(pickup.distance, LANES[pickup.lane]);
        pickup.object.position.set(point.x, pickupY, point.z);
        pickup.object.rotation.y = nativeCoin?nativeCoinYaw(point.heading,this.world.elapsed-pickup.object.userData.nativeCoinSpawnTime):point.heading+this.world.elapsed*2.4;
        if(pickup.kind!=='coin' && pickup.kind!=='gem')updateNativePower(pickup.object,this.world.elapsed);
      }
      const ahead = pickup.distance - distance;
      const magnet = power.kind === 'magnet' && this.world.elapsed < power.until;
      const nativeReach=this.difficulty.name==='classic'&&!magnet&&pickup.kind!=='gem';
      const close = nativeReach
        ? nativePickupWithinReach(pickup.kind,pickup.value,LANES[pickup.lane]-laneXNow,pickupY-jump.y,ahead)
        : Math.abs(ahead) < (magnet ? 9 : 1.4) && Math.abs(laneXNow - LANES[pickup.lane]) < (magnet ? 9 : 0.55);
      const heightClose = nativeReach || pickup.kind !== 'coin' || coinHeightWithinReach(
        pickupY, jump.y, slide.remaining>0, magnet,
      );
      if (!pickup.taken && close && heightClose) {
        pickup.taken = true;
        if (pickup.kind !== 'coin' && pickup.kind !== 'gem') {
          stats.score += NATIVE_POWER_SCORE_VALUE * REFERENCE_SCORE_MULTIPLIER;
        }
        if (pickup.kind === 'coin') {
          this.coinValueAcc += (this.difficulty.name === 'classic' ? 1 : coinMultiplier()) * pickup.value;
          const whole = Math.floor(this.coinValueAcc);
          this.coinValueAcc -= whole;
          stats.coins += Math.max(1, whole);
          stats.combo += 1;
          stats.comboTimer = 3;
          stats.multiplier = Math.min(5, 1 + Math.floor(stats.combo / 8));
          stats.charge = Math.min(100, stats.charge + 4);
          stats.score += this.difficulty.name === 'classic'
            ? NATIVE_COIN_SCORE_VALUE * REFERENCE_SCORE_MULTIPLIER * pickup.value
            : 10 * stats.multiplier * pickup.value;
          if (stats.charge >= 100) {
            stats.charge = 0;
            this.grantPower();
          }
          sfx.play('coin', { gain: 0.8 });
        } else if (pickup.kind === 'gem') {
          stats.gems += 1;
          stats.score += 100;
          sfx.play('shimmer', { gain: 0.8 });
        } else if (pickup.kind === 'bonus') {
          // Native StartCoinBonus calls AddCoins immediately; it does not
          // replace an active timed power or multiply later coin pickups.
          stats.coins += nativeCoinBonusValue();
          setHint(`金币奖励 +${nativeCoinBonusValue()}`);
          sfx.play('shimmer', { gain: 0.9 });
        } else {
          power.kind = pickup.kind;
          power.until = this.world.elapsed + this.powerDuration(pickup.kind);
          setHint(
            pickup.kind === 'magnet' ? '磁铁激活！' : pickup.kind === 'shield' ? '无敌激活' : pickup.kind === 'boost' ? '加速！' : '金币加成！',
          );
          sfx.play('shimmer', { gain: 0.9 });
        }
        if (pickup.object) this.releasePickup(pickup.kind, pickup.object);
        this.world.destroyEntity(entity);
        this.pickups.splice(i, 1);
        mutateUi.distance = Math.floor(stats.distance);
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
    if (!this.introHeld()) this.nativeTimeSinceStumble += dt;
    const chase = this.world.require(this.runnerEntity, Chase);
    this.stumbleCooldown = Math.max(0, this.stumbleCooldown - dt);
    chase.cooldown = Math.max(0, chase.cooldown - dt);
    if (chase.lunge > 0) chase.lunge = Math.max(0, chase.lunge - dt);
    const target = chase.cooldown > 0 ? 3.8 : CHASE_GAP_MAX;
    chase.gap = THREE.MathUtils.damp(chase.gap, target, 1.6, dt);
    mutateUi.chaseGap = chase.gap;
  }

  private showEntranceCamera(): void {
    const entrance = this.bundle.scene.getObjectByName('reference-entrance');
    if (entrance) entrance.visible = true;
    this.cameraPos.set(0, 7, -16);
    this.cameraLook.set(0, 5, 18);
    this.bundle.camera.position.copy(this.cameraPos);
    this.bundle.camera.lookAt(this.cameraLook);
    this.bundle.sky.position.copy(this.cameraPos);
    this.renderOnce();
  }

  private updateCamera(dt: number): void {
    const lane = this.world.require(this.runnerEntity, Lane);
    const jump = this.world.require(this.runnerEntity, Jump);
    const distance = this.distance;
    const slide = this.world.require(this.runnerEntity, Slide);
    const power = this.world.require(this.runnerEntity, Power);
    // NearestElement is approximated by the native12m floor footprint around
    // each authored obstacle, not its narrower collision interval.
    const nearestObstacles=this.obstacles.flatMap(entity=>{
      const obstacle=this.world.require(entity,Obstacle);
      if(Math.abs(obstacle.distance-distance)>6)return [];
      const def=DEFS[obstacle.defId as DefId];
      return def?[{mustSlideUnder:def.action==='slide',mustJumpOver:def.action==='jump'||('alternateAction'in def&&def.alternateAction==='jump')}]:[];
    });
    this.needsToDuckCamera=nextNativeDuckCamera(this.needsToDuckCamera,slide.remaining>0,
      power.kind==='shield'&&this.world.elapsed<power.until,nearestObstacles);
    const follow = followCameraPose(this.needsToDuckCamera, jump.airborne, jump.y);
    const back = followCameraBack(this.path.at(distance, lane.x * (this.difficulty.name === 'classic' ? 1 : .22), true), follow.behind);
    const ahead = this.path.at(distance, lane.x * (this.difficulty.name === 'classic' ? 1 : .3), true);
    const nativeIntro = this.difficulty.name === 'classic'
      ? nativeEntranceCameraPose(this.world.elapsed - this.runStartedAt) : null;
    const intro = entranceCameraPose(this.world.elapsed - this.runStartedAt);
    if (nativeIntro) {
      const pose=this.path.at(nativeIntro.distance,nativeIntro.side);
      const target=this.path.at(distance,lane.x);
      this.cameraPos.set(pose.x,nativeIntro.height,pose.z);
      this.cameraLook.set(target.x,nativeIntro.lookHeight,target.z);
    } else if (intro && (this.difficulty.name === 'classic' || distance < 50)) {
      const pose = this.path.at(distance - intro.behind, intro.side, true);
      const target = this.path.at(distance + intro.lookAhead, 0, true);
      this.cameraPos.set(pose.x, intro.height, pose.z);
      this.cameraLook.set(target.x, intro.lookHeight, target.z);
    } else if (this.difficulty.name === 'classic') {
      const next=stepNativeFollowCamera(this.cameraPos.toArray(),[back.x,follow.height,back.z],
        mutateUi.phase==='dying'||mutateUi.phase==='ended'?0:Math.hypot(this.speed,jump.v),dt);
      this.cameraPos.set(...next);
      // Native focus transform copies the player's full position each frame,
      // then replaces Y with GroundHeight+FocusHeight; no independent look lag.
      this.cameraLook.set(ahead.x,follow.focusHeight,ahead.z);
    } else {
      this.cameraPos.lerp(new THREE.Vector3(back.x, follow.height, back.z), 1 - Math.exp(-8 * dt));
      this.cameraLook.lerp(new THREE.Vector3(ahead.x, follow.focusHeight, ahead.z), 1 - Math.exp(-10 * dt));
    }
    this.bundle.camera.position.copy(this.cameraPos);
    this.bundle.camera.lookAt(this.cameraLook);
    if(this.difficulty.name==='classic'){
      const shake=stepNativeCameraShake(this.nativeCameraShake,dt);
      this.nativeCameraShake=shake.state;this.nativeCameraShakeOffset=shake.offset;
      this.bundle.camera.translateX(shake.offset[0]);this.bundle.camera.translateY(shake.offset[1]);
      this.cameraPos.copy(this.bundle.camera.position);
    }else this.bundle.camera.rotateZ((lane.x-laneX(lane.index))*-.03);
    this.bundle.camera.fov = CAMERA_FOV;
    this.bundle.camera.updateProjectionMatrix();
    const target = this.distance;
    this.bundle.sky.position.copy(this.cameraPos);
    const water = this.bundle.scene.getObjectByName('reference-water') as THREE.Mesh | undefined;
    if (water) {
      water.position.x = nativeWaterAnchor(this.cameraPos.x);
      water.position.z = nativeWaterAnchor(this.cameraPos.z);
    }
    this.bundle.sun.position.set(this.cameraPos.x - 12, 22, this.cameraPos.z - 24);
    this.bundle.sun.target.position.set(this.cameraPos.x, 0, this.cameraPos.z - 18);
    this.bundle.sun.target.updateMatrixWorld();
    void target;
  }

  private syncHud(dt: number): void {
    const stats = this.world.require(this.runnerEntity, RunStats);
    const power = this.world.require(this.runnerEntity, Power);
    mutateUi.distance = Math.floor(stats.distance);
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
    if (mutateUi.phase==='paused') return;
    const lane = this.world.require(this.runnerEntity, Lane);
    const jump = this.world.require(this.runnerEntity, Jump);
    const slide = this.world.require(this.runnerEntity, Slide);
    this.syncRunnerObject();
    this.runnerGroup.position.y = jump.y;
    this.runnerGroup.scale.set(1, 1, 1);
    const shield = this.world.require(this.runnerEntity, Power);
    const invisible = shield.kind === 'shield' && this.world.elapsed < shield.until;
    this.wingsGroup.visible = false;
    if (this.safetyNet) {
      this.safetyNet.visible = invisible;
      if (invisible) {
        const ground = this.path.at(this.distance, 0, true);
        this.safetyNet.position.set(ground.x, -.035, ground.z);
        this.safetyNet.rotation.set(-Math.PI/2, 0, ground.heading);
        setSafetyNetFrame(this.safetyNet, this.world.elapsed);
      }
    }
    this.runnerRig?.setInvincibility(invisible, this.bundle.assets.texture.glow);
    if (this.runnerRig) {
      const slideElapsed = this.difficulty.name==='classic'?slide.elapsed:slide.duration-slide.remaining;
      const animation=this.runnerRig.getTime();
      const native=this.difficulty.name==='classic';
      const slideLoop = this.runnerRig.clips.includes('slideLoop') && (native
        ? animation.clipName==='slideLoop'||animation.clipName==='slide'&&animation.clipTime>=this.runnerRig.clipDuration('slide')
        : slideElapsed>=this.runnerRig.clipDuration('slide'));
      if(this.stumbleAnimation==='stumble'&&animation.clipName==='stumble'
        &&animation.clipTime>=this.runnerRig.clipDuration('stumble'))this.stumbleAnimation='run';
      this.runnerRig.setClip(native&&this.stumbleAnimation?this.stumbleAnimation
        :slide.remaining>0?(slideLoop?'slideLoop':'slide'):jump.airborne?'jump':'run');
      const playback=native?(this.introHeld()?1:nativeAnimationSpeed(this.speed,jump.v))
        :THREE.MathUtils.clamp(this.speed/RUN_SPEED,.65,1.55);
      this.runnerRig.update(dt,playback,native);
    }
    const chase = this.world.require(this.runnerEntity, Chase);
    // The pack closes behind the runner after a stumble, then drops below the
    // camera as the gap opens. Keep its feet at road height, never hovering beside us.
    const nativeTarget=nativeEnemyFollowTarget(this.nativeTimeSinceStumble,
      this.world.elapsed-this.runStartedAt<3,slide.remaining>0,this.needsToDuckCamera);
    this.nativeEnemyGap=stepNativeEnemyFollow(this.nativeEnemyGap,nativeTarget,dt,slide.remaining>0,this.needsToDuckCamera);
    const gap = this.difficulty.name==='classic' ? this.nativeEnemyGap
      : openingChaseGap(this.world.elapsed - this.runStartedAt, chase.gap);
    const chaserPos = this.difficulty.name==='classic'
      ? enemyFollowAnchor(this.path.at(this.distance,lane.x,true),lane.x,gap,jump.airborne)
      : this.path.at(this.distance-gap,lane.x*.4,true);
    this.chaserGroup.position.set(chaserPos.x, 0, chaserPos.z);
    this.chaserGroup.rotation.y = chaserPos.heading;
    this.chaserGroup.scale.setScalar(this.difficulty.name==='classic'?1:1 + (chase.lunge > 0 ? 0.12 : 0));
    for (let i=0;i<this.chaserRigs.length;i++) {
      const rig=this.chaserRigs[i];
      const active=i<3||this.world.elapsed-this.runStartedAt<3;
      if(rig.object.parent)rig.object.parent.visible=active;
      if(active)rig.update(dt,this.difficulty.name==='classic'?1:this.speed/RUN_SPEED);
    }


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
      const nativeCoin=this.difficulty.name==='classic'&&pickup.kind==='coin';
      pickup.object.position.set(point.x,nativeCoin?pickup.baseY:pickupHeightAt(pickup.baseY,this.world.elapsed,pickup.distance),point.z);
      pickup.object.rotation.y=nativeCoin?nativeCoinYaw(point.heading,this.world.elapsed-pickup.object.userData.nativeCoinSpawnTime):point.heading+this.world.elapsed*2.4;
        if(pickup.kind!=='coin' && pickup.kind!=='gem')updateNativePower(pickup.object,this.world.elapsed);
    }
    // Tiles are placed once in ensureTiles (and rebuilt ahead of a new turn); re-running
    // path.at() for every live tile each frame was pure GC churn.
  }

  private invincibleUntil = 0;
  private reviveUsed = false;
  private runCommitted = false;

  private die(reason: string, kind: 'impact' | 'fall' | 'water' | 'caught' | 'missed'): void {
    if (mutateUi.phase !== 'playing') return;
    if (this.world.elapsed < this.invincibleUntil) return;
    if (this.stepLoop) {
      sfx.stopLoop(this.stepLoop, 0.15);
      this.stepLoop = null;
    }
    mutateUi.deathReason = reason;
    mutateUi.deathKind = kind;
    mutateUi.phase = 'dying';
    this.deathElapsed=0;
    this.deathTimer = this.difficulty.name==='classic'?NATIVE_RESULT_DELAY:1.25;
    sfx.play(this.difficulty.name==='classic'&&kind==='water'?'splash':kind === 'fall' || kind === 'water' ? 'splat' : 'scream', { gain: 0.9 });
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
    const narrow = this.narrowAt(this.distance, this.path);
    if (narrow) {
      const lane = this.world.require(this.runnerEntity, Lane);
      lane.index = narrow.side === 'left' ? 0 : 2;
      lane.x = laneX(lane.index);
    }
    this.nativeFalling=false;this.nativeForwardForce=0;this.nativeCameraShake=null;this.nativeCameraShakeOffset=[0,0,0];this.nativeSwipeStumbleDelay=null;this.nativeSwipeOffset=null;
    Object.assign(this.world.require(this.runnerEntity,Jump),{y:0,v:0,airborne:false});
    this.invincibleUntil = this.world.elapsed + 3;
    this.deathTimer = 0;this.deathElapsed=0;
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
    this.graph.reset();
    for (const entity of [...this.obstacles, ...this.pickups]) {
      const obstacle = this.world.get(entity, Obstacle);
      const pickup = this.world.get(entity, Pickup);
      if (obstacle?.object) this.releaseObstacle(obstacle.object);
      if (pickup?.object) this.releasePickup(pickup.kind, pickup.object);
      this.world.destroyEntity(entity);
    }
    this.obstacles = [];
    this.pickups = [];
    this.nextSpawn = this.difficulty.name==='classic' ? Math.max(distance+90,REFERENCE_RANDOM_OBSTACLES_FROM) : distance+90;
    this.referenceObstacleIndex = 0;
    this.nextPickup = this.difficulty.name==='classic' ? Math.max(distance+MIN_BONUS_ITEM_SPACING,REFERENCE_RANDOM_OBSTACLES_FROM) : distance+MIN_BONUS_ITEM_SPACING;
    this.lastObstacleDistance = distance;
    this.lastObstacleSide = lane.x;
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
    this.bundle?.renderer.dispose();
  }
}
