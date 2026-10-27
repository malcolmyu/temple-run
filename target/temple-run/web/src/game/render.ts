import * as THREE from 'three';
import { OBJLoader } from 'three/addons/loaders/OBJLoader.js';
import { mergeGeometries } from 'three/addons/utils/BufferGeometryUtils.js';
import { repairObjNormals } from '../objNormals.js';
import { LANES, PLAYER_Z, TILE } from './config';
import type { ObstacleKind, PickupKind } from './components';
import type { TrackPath } from './path';
import type { NarrowSection, TerrainKind } from './terrain';
import type { ObstacleDef } from './obstacles/types';
import type { SurfaceKind } from './surface';

const BASE = import.meta.env.BASE_URL;
const asset = (name: string): string => `${BASE}assets/apk/${name}`;

export interface Assets {
  texture: {
    wall: THREE.Texture;
    tree: THREE.Texture;
    leaf: THREE.Texture;
    flame: THREE.Texture;
    spark: THREE.Texture;
    coinFace: THREE.Texture;
    wings: THREE.Texture | null;
  };
  material: Record<string, THREE.Material>;
  roadTile: THREE.Group | null;
  wall: THREE.Group | null;
  tree: THREE.Group | null;
  gate: THREE.Group | null;
  enemy: THREE.Group | null;
  obstacles: Record<string, THREE.Group | null>;
}

export interface SceneBundle {
  renderer: THREE.WebGLRenderer;
  scene: THREE.Scene;
  camera: THREE.PerspectiveCamera;
  sun: THREE.DirectionalLight;
  sky: THREE.Mesh;
  assets: Assets;
  material: Record<string, THREE.Material>;
}

const loadTexture = (url: string): Promise<THREE.Texture> =>
  new Promise((resolve, reject) => {
    new THREE.TextureLoader().load(
      url,
      (texture: THREE.Texture) => {
        texture.colorSpace = THREE.SRGBColorSpace;
        resolve(texture);
      },
      undefined,
      reject,
    );
  });

const loadObj = (url: string): Promise<THREE.Group | null> =>
  new Promise((resolve) => {
    new OBJLoader().load(url, (obj: THREE.Group) => resolve(obj), undefined, () => resolve(null));
  });

export async function createWorld(canvas: HTMLCanvasElement): Promise<SceneBundle> {
  // Mobile GPUs are fill-rate bound: lower the render resolution and skip the shadow pass.
  // Desktop keeps the full-quality path. The game loop can lower the ratio further if FPS dips.
  const mobile = window.matchMedia('(pointer: coarse)').matches || /Mobi|Android|iPhone|iPad|iPod/i.test(navigator.userAgent);
  const renderer = new THREE.WebGLRenderer({ canvas, antialias: !mobile, powerPreference: 'high-performance' });
  renderer.setPixelRatio(Math.min(window.devicePixelRatio || 1, mobile ? 1.5 : 2));
  renderer.shadowMap.enabled = !mobile;
  renderer.shadowMap.type = THREE.PCFSoftShadowMap;
  renderer.outputColorSpace = THREE.SRGBColorSpace;
  renderer.toneMapping = THREE.ACESFilmicToneMapping;
  renderer.toneMappingExposure = 1.18;

  const scene = new THREE.Scene();
  scene.fog = new THREE.Fog(0x193b31, 30, 145);

  const camera = new THREE.PerspectiveCamera(60, 1, 0.1, 190);
  camera.position.set(0, 5.25, PLAYER_Z + 7.5);

  scene.add(new THREE.HemisphereLight(0xb8d6bc, 0x0b1712, 1.55));
  const sun = new THREE.DirectionalLight(0xc8d6ae, 2.55);
  sun.position.set(-12, 22, -24);
  sun.castShadow = !mobile;
  sun.shadow.mapSize.set(1024, 1024);
  sun.shadow.camera.left = -24;
  sun.shadow.camera.right = 24;
  sun.shadow.camera.top = 28;
  sun.shadow.camera.bottom = -28;
  sun.shadow.camera.near = 1;
  sun.shadow.camera.far = 80;
  scene.add(sun);
  scene.add(sun.target);
  const fill = new THREE.DirectionalLight(0x3f6f62, 0.35);
  fill.position.set(10, 8, 8);
  scene.add(fill);

  // Dark jungle canopy light: the reference video is teal-green, not blue daylight.
  const sky = new THREE.Mesh(
    new THREE.SphereGeometry(160, 24, 16),
    new THREE.ShaderMaterial({
      side: THREE.BackSide,
      depthWrite: false,
      uniforms: { top: { value: new THREE.Color(0x143b33) }, mid: { value: new THREE.Color(0x275345) }, bottom: { value: new THREE.Color(0x0a1512) } },
      vertexShader: 'varying vec3 vP; void main(){ vP = position; gl_Position = projectionMatrix * modelViewMatrix * vec4(position,1.0); }',
      fragmentShader:
        'varying vec3 vP; uniform vec3 top; uniform vec3 mid; uniform vec3 bottom;' +
        'void main(){ float h = clamp(normalize(vP).y * 0.5 + 0.5, 0.0, 1.0);' +
        'vec3 c = h > 0.5 ? mix(mid, top, (h - 0.5) * 2.0) : mix(bottom, mid, h * 2.0);' +
        'gl_FragColor = vec4(c, 1.0); }',
    }),
  );
  sky.frustumCulled = false;
  scene.add(sky);

  // Jungle floor far below the corridor: gives the scenery something to sit on.
  const ground = new THREE.Mesh(
    new THREE.BoxGeometry(260, 3, 260),
    new THREE.MeshStandardMaterial({ map: null, color: 0x13241b, roughness: 0.98 }),
  );
  ground.position.y = -3.4;
  scene.add(ground);

  const [wall, tree, leaf, flame, spark, coinFace, wingsTexture] = await Promise.all([
    loadTexture(asset('wallTexture.webp')),
    loadTexture(asset('treeTexture.webp')),
    loadTexture(asset('leafTexture.webp')),
    loadTexture(`${BASE}assets/ui/fx-flame.png`),
    loadTexture(`${BASE}assets/ui/fx-spark.png`),
    loadTexture(`${BASE}assets/ui/coin-face.png`),
    loadTexture(`${BASE}assets/ui/wings.png`).catch(() => null),
  ]);
  leaf.wrapS = leaf.wrapT = THREE.RepeatWrapping;

  const material: Record<string, THREE.Material> = {
    road: new THREE.MeshStandardMaterial({
      map: wall,
      color: 0xd8c394,
      side: THREE.DoubleSide,
      roughness: 0.95,
      emissive: 0x5a3f1c,
      emissiveIntensity: 0.85,
    }),
    facade: new THREE.MeshStandardMaterial({
      map: wall,
      color: 0x9d9179,
      side: THREE.DoubleSide,
      roughness: 0.95,
      emissive: 0x3a2f1e,
      emissiveIntensity: 0.6,
    }),
    tree: new THREE.MeshStandardMaterial({ color: 0x26331f, side: THREE.DoubleSide, roughness: 0.98, emissive: 0x0d1409, emissiveIntensity: 0.6 }),
    leaf: new THREE.MeshStandardMaterial({ map: leaf, color: 0x4f7057, side: THREE.DoubleSide, roughness: 0.95, emissive: 0x0d1a11, emissiveIntensity: 0.55 }),
    stone: new THREE.MeshStandardMaterial({ color: 0x9f947c, map: wall, roughness: 0.95 }),
    wood: new THREE.MeshStandardMaterial({ map: tree, color: 0x8e7b5e, roughness: 0.97 }),
    gold: new THREE.MeshStandardMaterial({ color: 0xf5bb43, metalness: 0.72, roughness: 0.25, emissive: 0x6b4309, emissiveIntensity: 0.3 }),
    moss: new THREE.MeshStandardMaterial({ color: 0x496f4c, roughness: 0.9 }),
    fire: new THREE.MeshStandardMaterial({ color: 0xff7a24, emissive: 0xff5a12, emissiveIntensity: 1.15 }),
    void: new THREE.MeshBasicMaterial({ color: 0x05070a }),
    water: new THREE.MeshBasicMaterial({ color: 0x0b2b27, transparent: true, opacity: 0.72 }),
  };

  const [roadTile, wallTemplate, treeTemplate, gateTemplate, enemyMesh, enemyTexture] = await Promise.all([
    loadObj(`${BASE}assets/track/temple-road-tile.obj`),
    loadObj(`${BASE}assets/track/track-wall-straight-a.obj`),
    loadObj(`${BASE}assets/track/decor-tree-a.obj`),
    loadObj(`${BASE}assets/track/track-gate-a.obj`),
    loadObj(asset('mesh-96-enemy.obj')),
    loadTexture(asset('texture-53-enemyTexture.webp')).catch(() => null),
  ]);
  if (enemyMesh && enemyTexture) {
    enemyTexture.flipY = false;
    const enemyMaterial = new THREE.MeshStandardMaterial({
      map: enemyTexture,
      color: 0x9c7a66,
      emissive: 0x8a5a3a,
      emissiveIntensity: 0.5,
      roughness: 0.95,
      side: THREE.DoubleSide,
    });
    enemyMesh.traverse((part: THREE.Object3D) => {
      const meshPart = part as THREE.Mesh;
      if (meshPart.isMesh) {
        meshPart.material = enemyMaterial;
        meshPart.castShadow = true;
      }
    });
    repairObjNormals(enemyMesh);
    enemyMesh.rotation.x = -Math.PI / 2;
    enemyMesh.scale.set(0.085, 0.085, 0.12);
  }
  const paint = (obj: THREE.Group | null, mat: THREE.Material, shadow: boolean): THREE.Group | null => {
    if (!obj) return null;
    obj.traverse((part: THREE.Object3D) => {
      if ((part as THREE.Mesh).isMesh) {
        (part as THREE.Mesh).material = mat;
        part.castShadow = shadow;
        part.receiveShadow = true;
      }
    });
    repairObjNormals(obj);
    return obj;
  };

  // Original obstacle prefabs, exported from the APK. Keep their authored origin (road at
  // y=0) and use the same 0.18 player-matched scale the APK analysis recommends.
  const obstacleTreeMat = new THREE.MeshStandardMaterial({ map: tree, side: THREE.DoubleSide, roughness: 0.95, alphaTest: 0.4 });
  const obstacleStoneMat = new THREE.MeshStandardMaterial({ map: wall, color: 0xd8c8a8, side: THREE.DoubleSide, roughness: 0.95 });
  const obstacleNames = [
    'tree-jump-left',
    'tree-jump-right',
    'tree-jump-left-vert',
    'tree-jump-right-vert',
    'tree-trip-left',
    'tree-trip-right',
    'tree-trip-left-vert',
    'tree-trip-right-vert',
    'tree-slide',
    'tree-slide-vert',
    'flame-tower',
    'flame-tower-vert',
    'pit',
    'pit-vert',
    'pit-long-a',
    'pit-long-b',
    'tower-arch',
    'tower-arch-vert',
    'narrow-wall-left',
    'narrow-wall-right',
    'narrow-beam-left',
    'narrow-beam-right',
    'stone-pedestal',
  ];
  const obstacleObjects = await Promise.all(obstacleNames.map((name) => loadObj(`${BASE}assets/obstacles/${name}.obj`)));
  const obstacles: Record<string, THREE.Group | null> = {};
  for (let i = 0; i < obstacleNames.length; i++) {
    const name = obstacleNames[i];
    const obj = obstacleObjects[i];
    if (!obj) {
      obstacles[name] = null;
      continue;
    }
    paint(obj, name.startsWith('tree') ? obstacleTreeMat : obstacleStoneMat, !name.startsWith('pit'));
    // The exporter baked the prefab-root frame: origin is the track-tile centre and y=0
    // is the road. Do NOT re-centre on the bounding box; a tree's canopy would move into
    // the running lane. Just match the player scale.
    obj.rotation.y = Math.PI;
    obj.scale.setScalar(name.startsWith('tree') ? 0.14 : 0.18);
    obstacles[name] = obj;
  }

  return {
    renderer,
    scene,
    camera,
    sun,
    sky,
    material,
    assets: {
      texture: { wall, tree, leaf, flame, spark, coinFace, wings: wingsTexture },
      material,
      roadTile: paint(roadTile, material.road, false),
      wall: paint(wallTemplate, material.facade, true),
      tree: paint(treeTemplate, material.tree, false),
      gate: paint(gateTemplate, material.facade, false),
      enemy: enemyMesh,
      obstacles,
    },
  };
}

const ROAD_TILE_LIFT = 1.36;
const WALL_SCALE = 0.2;
const WALL_X = 4.0;
const LOW_WALL_SINK = -6.0;

function flameSprite(assets: Assets, scale: number, color = 0xffb066): THREE.Sprite {
  const sprite = new THREE.Sprite(
    new THREE.SpriteMaterial({ map: assets.texture.flame, color, transparent: true, opacity: 0.8, depthWrite: false, blending: THREE.AdditiveBlending }),
  );
  sprite.scale.set(scale, scale * 1.5, 1);
  sprite.renderOrder = 2;
  return sprite;
}

function torch(group: THREE.Group, assets: Assets, x: number, z: number): void {
  const pole = new THREE.Mesh(new THREE.CylinderGeometry(0.09, 0.11, 1.9, 8), lightsMaterial());
  pole.position.set(x, 0.95, z);
  pole.castShadow = true;
  group.add(pole);
  const bowl = new THREE.Mesh(new THREE.CylinderGeometry(0.26, 0.16, 0.28, 8), lightsMaterial());
  bowl.position.set(x, 1.95, z);
  group.add(bowl);
  const flame = flameSprite(assets, 0.85);
  flame.position.set(x, 2.3, z);
  group.add(flame);
}

let cachedLightMat: THREE.MeshStandardMaterial | null = null;
function lightsMaterial(): THREE.MeshStandardMaterial {
  cachedLightMat ??= new THREE.MeshStandardMaterial({ color: 0x9d8f74, roughness: 0.8 });
  return cachedLightMat;
}

const cropCache = new Map<string, THREE.Texture>();

/** Crop one square out of an atlas and tile it, so columns don't show the atlas artwork. */
function croppedTexture(base: THREE.Texture, sx: number, sy: number, size: number, rx: number, ry: number): THREE.Texture {
  const key = `${base.uuid}:${sx}:${sy}:${size}:${rx}:${ry}`;
  const cached = cropCache.get(key);
  if (cached) return cached;
  const image = base.image as CanvasImageSource & { width: number; height: number };
  const canvas = document.createElement('canvas');
  canvas.width = canvas.height = size;
  canvas.getContext('2d')?.drawImage(image, sx, sy, size, size, 0, 0, size, size);
  const texture = new THREE.CanvasTexture(canvas);
  texture.wrapS = texture.wrapT = THREE.RepeatWrapping;
  texture.repeat.set(rx, ry);
  texture.colorSpace = THREE.SRGBColorSpace;
  cropCache.set(key, texture);
  return texture;
}

/** Procedural plank deck texture, tinted from the tree atlas so bridges match the palette. */
function plankMaterial(assets: Assets): THREE.MeshStandardMaterial {
  // The APK has no plank floor mesh, but its single wall atlas contains a real wood
  // plank region. Crop that region instead of tinting tree foliage.
  const crop = croppedTexture(assets.texture.wall, 8, 252, 280, 1.4, 7.5);
  return new THREE.MeshStandardMaterial({ map: crop, color: 0xb98453, roughness: 0.94 });
}

function ropeMaterial(): THREE.MeshStandardMaterial {
  return new THREE.MeshStandardMaterial({ color: 0x6b5334, roughness: 0.9 });
}


/**
 * Merge a static group's meshes by material. Tiles and junctions repeat the same few
 * materials dozens of times; without this each bush/torch is its own draw call. Merged
 * geometry is shared by every clone of the prototype.
 */
export function mergeStaticMeshes(root: THREE.Object3D): void {
  root.updateMatrixWorld(true);
  const inverse = root.matrixWorld.clone().invert();
  const byMaterial = new Map<THREE.Material, THREE.Mesh[]>();
  root.traverse((object) => {
    const mesh = object as THREE.Mesh;
    if (!mesh.isMesh || Array.isArray(mesh.material)) return;
    const list = byMaterial.get(mesh.material) ?? [];
    list.push(mesh);
    byMaterial.set(mesh.material, list);
  });
  for (const [material, meshes] of byMaterial) {
    if (meshes.length < 2) continue;
    const geometries: THREE.BufferGeometry[] = [];
    let castShadow = false;
    const matrix = new THREE.Matrix4();
    for (const mesh of meshes) {
      const geometry = mesh.geometry.index ? mesh.geometry.toNonIndexed() : mesh.geometry.clone();
      matrix.multiplyMatrices(inverse, mesh.matrixWorld);
      geometry.applyMatrix4(matrix);
      geometries.push(geometry);
      castShadow ||= mesh.castShadow;
    }
    const merged = mergeGeometries(geometries, false);
    for (const geometry of geometries) geometry.dispose();
    if (!merged) continue;
    const mergedMesh = new THREE.Mesh(merged, material);
    mergedMesh.castShadow = castShadow;
    mergedMesh.receiveShadow = true;
    root.add(mergedMesh);
    for (const mesh of meshes) mesh.removeFromParent();
  }
}

const LANE_SIDE = [-1.3, 0, 1.3] as const;

/** Muddy plank bridge: deck, rope rails, lantern posts and the gorge underneath. */
function buildBridgeDeck(assets: Assets, group: THREE.Group): void {
  const deck = new THREE.Mesh(new THREE.PlaneGeometry(7.2, TILE + 0.2), plankMaterial(assets));
  deck.rotation.x = -Math.PI / 2;
  deck.position.y = 0.02;
  deck.receiveShadow = true;
  group.add(deck);
  const water = new THREE.Mesh(
    new THREE.PlaneGeometry(30, TILE + 1),
    new THREE.MeshStandardMaterial({ color: 0x8fd0bd, map: assets.texture.leaf, transparent: true, opacity: 0.9, roughness: 0.3, metalness: 0.15 }),
  );
  water.rotation.x = -Math.PI / 2;
  water.position.y = -1.35;
  group.add(water);
  for (const side of [-1, 1] as const) {
    for (const z of [-4.5, -1.5, 1.5, 4.5]) {
      const post = new THREE.Mesh(new THREE.CylinderGeometry(0.16, 0.18, 1.9, 8), lightsMaterial());
      post.position.set(side * 3.5, 0.95, z);
      post.castShadow = true;
      group.add(post);
      for (const y of [1.15, 1.65]) {
        const rope = new THREE.Mesh(new THREE.CylinderGeometry(0.035, 0.035, 2.5, 5), ropeMaterial());
        rope.rotation.x = Math.PI / 2;
        rope.position.set(side * 3.5, y, z + 1.5);
        group.add(rope);
      }
    }
    for (const z of [-3, 3]) {
      const pole = new THREE.Mesh(new THREE.CylinderGeometry(0.1, 0.12, 2.0, 8), lightsMaterial());
      pole.position.set(side * 3.2, 1.0, z);
      group.add(pole);
      const lamp = new THREE.Mesh(new THREE.BoxGeometry(0.38, 0.5, 0.38), new THREE.MeshStandardMaterial({ color: 0xffdc9a, emissive: 0xffb43a, emissiveIntensity: 1.1 }));
      lamp.position.set(side * 3.2, 2.25, z);
      group.add(lamp);
    }
  }
}

/** Colonnade hall: columns, overhead beams, red carpet. */
function buildHallInterior(assets: Assets, group: THREE.Group): void {
  const columnMat = new THREE.MeshStandardMaterial({ map: croppedTexture(assets.texture.wall, 256, 0, 256, 3, 2), color: 0xd8c8a8, roughness: 0.9, metalness: 0.02 });
  const carpet = new THREE.Mesh(
    new THREE.PlaneGeometry(2.6, TILE),
    new THREE.MeshStandardMaterial({ color: 0x8e2f2a, roughness: 0.95, emissive: 0x2a0806, emissiveIntensity: 0.4 }),
  );
  carpet.rotation.x = -Math.PI / 2;
  carpet.position.y = 0.03;
  group.add(carpet);
  for (const side of [-1, 1] as const) {
    for (const z of [-4, 0, 4]) {
      const column = new THREE.Mesh(new THREE.CylinderGeometry(0.46, 0.5, 6.4, 12), columnMat);
      column.position.set(side * 3.3, 3.2, z);
      column.castShadow = true;
      group.add(column);
      const base = new THREE.Mesh(new THREE.BoxGeometry(0.8, 0.4, 0.8), columnMat);
      base.position.set(side * 3.3, 0.2, z);
      group.add(base);
      const cap = new THREE.Mesh(new THREE.BoxGeometry(0.78, 0.36, 0.78), columnMat);
      cap.position.set(side * 3.3, 6.35, z);
      group.add(cap);
    }
    const beam = new THREE.Mesh(new THREE.BoxGeometry(7.4, 0.55, 0.8), columnMat);
    beam.position.set(0, 6.62, side * 2.5);
    beam.castShadow = true;
    group.add(beam);
  }
  // A per-tile PointLight used to make the hall glow, but cloned tiles turned that into
  // several dynamic lights and a shader cost on every material. The warm palette is already
  // in the emissive/hemisphere lighting, so keep the hall light-free.
}

/** Canyon: broken slab edges, mist, no walls — the drop is the point. */
function buildCanyonEdges(assets: Assets, group: THREE.Group): void {
  for (const side of [-1, 1] as const) {
    for (let i = 0; i < 5; i++) {
      const slab = new THREE.Mesh(new THREE.BoxGeometry(0.7, 0.22, 1.6), assets.material.stone);
      slab.position.set(side * 3.7, 0.08, -4.8 + i * 2.4);
      slab.rotation.y = side * (0.1 + i * 0.05);
      group.add(slab);
    }
    if (assets.roadTile === null) continue;
    const abyss = new THREE.Mesh(new THREE.PlaneGeometry(16, TILE + 1), assets.material.void);
    abyss.rotation.x = -Math.PI / 2;
    abyss.position.set(side * 12.2, -2.6, 0);
    group.add(abyss);
  }
}

/** Half-road: one side of the slab has fallen into the canyon, leaving a ragged lip. */
export function buildNarrowOverlay(assets: Assets, group: THREE.Group, side: 'left' | 'right', firstTile: boolean, surface: SurfaceKind = 'stone'): void {
  const dir = side === 'left' ? 1 : -1; // missing half is on this side (+1 = right)
  const edge = 0.55 * dir;
  const width = 3.6;
  const center = edge + (dir * width) / 2;
  // Dark teal water/abyss rather than a flat black rectangle; the video's broken
  // right edge reads as depth, not a missing texture.
  const abyss = new THREE.MeshBasicMaterial({ color: 0x06241f });
  const hole = new THREE.Mesh(new THREE.PlaneGeometry(width, TILE + 0.02), abyss);
  hole.rotation.x = -Math.PI / 2;
  hole.position.set(center, 0.062, 0);
  group.add(hole);
  // Vertical cliff face under the broken lip.
  const face = new THREE.Mesh(new THREE.BoxGeometry(0.35, 3.6, TILE + 0.02), assets.material.stone);
  face.position.set(edge, -1.8, 0);
  group.add(face);
  const deep = new THREE.Mesh(new THREE.PlaneGeometry(width * 1.3, TILE + 3), new THREE.MeshBasicMaterial({ color: 0x0b3b34 }));
  deep.rotation.x = -Math.PI / 2;
  deep.position.set(center, -2.1, 0);
  group.add(deep);
  // APK narrow-wall prefab as the surviving broken lip, rather than a generic box.
  const lipName = side === 'left' ? 'narrow-wall-right' : 'narrow-wall-left';
  const lip = assets.obstacles[lipName];
  if (lip) {
    const edge = lip.clone(true);
    edge.position.set(dir * 3.05, 0, 0);
    edge.rotation.y = dir > 0 ? Math.PI : 0;
    group.add(edge);
  }
  // Broken paving/planks tumbling off the edge.
  for (let i = 0; i < 6; i++) {
    const slab = new THREE.Mesh(
      new THREE.BoxGeometry(surface === 'wood' ? 0.75 + (i % 2) * 0.25 : 0.55 + (i % 2) * 0.25, surface === 'wood' ? 0.12 : 0.2, 0.75),
      surface === 'wood' ? plankMaterial(assets) : assets.material.stone,
    );
    slab.position.set(edge + dir * (0.25 + (i % 3) * 0.32), 0.07 - (i % 2) * 0.06, -4.6 + i * 1.9);
    slab.rotation.set((i % 2 ? 0.12 : -0.08), i * 0.37, (i % 2 ? 0.18 : -0.12));
    group.add(slab);
  }
  if (!firstTile) return;
  // Gold chevrons on the surviving slab, pointing to the safe side.
  for (let i = 0; i < 3; i++) {
    const arrow = new THREE.Mesh(
      new THREE.ConeGeometry(0.4, 0.9, 3),
      new THREE.MeshStandardMaterial({ color: 0xf5bb43, emissive: 0x8a5811, emissiveIntensity: 0.8 }),
    );
    arrow.rotation.x = Math.PI / 2;
    arrow.rotation.z = dir * Math.PI / 2;
    arrow.position.set(-dir * 1.3, 0.13, -3.5 + i * 1.4);
    group.add(arrow);
  }
}

/** Broken centre of a left/right fork: both outer lanes survive, middle falls. */
export function buildSidePathOverlay(assets: Assets, group: THREE.Group, first: boolean, last = false): void {
  const gap = new THREE.Mesh(new THREE.PlaneGeometry(1.08, TILE + 0.02), assets.material.water);
  gap.rotation.x = -Math.PI / 2;
  gap.position.set(0, 0.065, 0);
  group.add(gap);
  const face = new THREE.Mesh(new THREE.BoxGeometry(0.25, 2.4, TILE + 0.02), assets.material.stone);
  face.position.set(0, -1.15, 0);
  group.add(face);
  for (const side of [-1, 1] as const) {
    for (let i = 0; i < 4; i++) {
      const slab = new THREE.Mesh(new THREE.BoxGeometry(0.42, 0.18, 0.62), assets.material.stone);
      slab.position.set(side * (0.66 + (i % 2) * 0.08), 0.08, -4.2 + i * 2.8);
      slab.rotation.set(0, side * 0.18, side * (i % 2 ? 0.2 : -0.14));
      group.add(slab);
    }
  }
  if (last) {
    // The two roads merge back into the normal corridor at the end of the fork.
    const merge = new THREE.Mesh(new THREE.PlaneGeometry(1.08, 2.2), assets.material.stone);
    merge.rotation.x = -Math.PI / 2;
    merge.position.set(0, 0.07, TILE / 2 - 1.0);
    group.add(merge);
  }
  if (!first) return;
  for (const side of [-1, 1] as const) {
    const arrow = new THREE.Mesh(
      new THREE.ConeGeometry(0.3, 0.7, 3),
      new THREE.MeshStandardMaterial({ color: 0xf5bb43, emissive: 0x8a5811, emissiveIntensity: 0.8 }),
    );
    arrow.rotation.x = Math.PI / 2;
    arrow.rotation.z = side > 0 ? -Math.PI / 2 : Math.PI / 2;
    arrow.position.set(side * 1.25, 0.13, -3.0);
    group.add(arrow);
  }
}

/** One 12 m road tile with its walls, torches and jungle dressing. */
export function buildTile(
  assets: Assets,
  index: number,
  distance: number,
  terrain: TerrainKind = 'temple',
  narrow: NarrowSection | null = null,
  clearScenery = false,
  surface: SurfaceKind = 'stone',
  sidePath = false,
  sidePathLast = false,
  surfaceFirst = false,
  surfaceLast = false,
): THREE.Group {
  const group = new THREE.Group();
  group.position.z = -distance;
  group.userData.tileIndex = index;
  group.userData.terrain = terrain;

  if (surface === 'stone' && assets.roadTile) {
    const road = assets.roadTile.clone(true);
    road.position.y = ROAD_TILE_LIFT;
    road.scale.x = 0.84;
    group.add(road);
  } else if (surface === 'stone') {
    const slab = new THREE.Mesh(new THREE.BoxGeometry(7.0, 0.65, TILE + 0.1), lightsMaterial());
    slab.position.y = -0.38;
    slab.receiveShadow = true;
    group.add(slab);
    const paving = new THREE.Mesh(new THREE.PlaneGeometry(6.9, TILE), new THREE.MeshStandardMaterial({ map: assets.texture.wall, color: 0xb59c76, roughness: 0.96 }));
    paving.rotation.x = -Math.PI / 2;
    paving.position.y = -0.03;
    group.add(paving);
  }

  if (surface === 'wood') {
    buildBridgeDeck(assets, group);
  } else if (terrain === 'hall') {
    buildHallInterior(assets, group);
  } else if (terrain === 'cliff') {
    buildCanyonEdges(assets, group);
  } else if (assets.wall) {
    for (const side of [-1, 1] as const) {
      const wall = assets.wall.clone(true);
      wall.scale.setScalar(WALL_SCALE);
      wall.position.set(side * WALL_X, LOW_WALL_SINK, 0);
      wall.rotation.y = side > 0 ? 0 : Math.PI;
      group.add(wall);
      for (const z of [-3.3, 3.3]) torch(group, assets, side * 3.05, z);
    }
  }

  // Jungle fringing the ruin wall (skipped on bridges, where the gorge opens up).
  if (terrain !== 'bridge' && !clearScenery) {
    for (const side of [-1, 1] as const) {
      for (let i = 0; i < 3; i++) {
        const bush = new THREE.Mesh(new THREE.SphereGeometry(1, 7, 5), assets.material.leaf);
        bush.scale.set(1.4 + i * 0.2, 0.65, 1.2);
        bush.position.set(side * (7.8 + i * 0.6), 1.35 + (i % 2) * 0.4, -4 + i * 3.4);
        bush.castShadow = false;
        group.add(bush);
      }
      for (let i = 0; i < 2; i++) {
        const bush = new THREE.Mesh(new THREE.SphereGeometry(1, 6, 4), assets.material.tree);
        bush.scale.set(3.2 + i, 1.6, 2.6);
        bush.position.set(side * (14 + i * 3), 0.4, -3 + i * 5);
        group.add(bush);
      }
    }
  }

  // Dark canopy and hanging vines, matching the reference video's enclosed jungle.
  if (terrain !== 'hall' && !clearScenery) {
    for (const side of [-1, 1] as const) {
      for (let i = 0; i < 4; i++) {
        const canopy = new THREE.Mesh(new THREE.SphereGeometry(1, 7, 5), assets.material.leaf);
        canopy.scale.set(3.1 + i * 0.35, 0.75, 2.4);
        canopy.position.set(side * (6.8 + i * 0.4), 7.6 + (i % 2) * 0.5, -5.5 + i * 3.2);
        group.add(canopy);
      }
      for (let i = 0; i < 4; i++) {
        const vine = new THREE.Mesh(new THREE.CylinderGeometry(0.035, 0.055, 4.6 + i * 0.5, 5), assets.material.moss);
        vine.position.set(side * (5.0 + i * 0.35), 4.2 - i * 0.25, -5.0 + i * 3.4);
        vine.rotation.z = side * (0.06 + i * 0.04);
        group.add(vine);
        const leaves = new THREE.Mesh(new THREE.SphereGeometry(1, 5, 4), assets.material.leaf);
        leaves.scale.set(0.55, 0.35, 0.5);
        leaves.position.set(side * (5.1 + i * 0.35), 6.2 - i * 0.25, -5.0 + i * 3.4);
        group.add(leaves);
      }
      if (assets.tree && index % 3 === 0) {
        const tree = assets.tree.clone(true);
        tree.scale.setScalar(0.09);
        tree.position.set(side * 9.6, 0, -2.5);
        tree.rotation.y = side > 0 ? Math.PI : 0;
        group.add(tree);
      }
    }
  }

  if (surfaceFirst || surfaceLast) {
    // A short threshold makes the long surface switch read as a built transition,
    // not a texture pop between two 12 m tiles.
    const capMat = surface === 'wood' ? assets.material.stone : plankMaterial(assets);
    const z = surfaceFirst ? -TILE / 2 + 0.45 : TILE / 2 - 0.45;
    const cap = new THREE.Mesh(new THREE.BoxGeometry(7.22, 0.14, 0.9), capMat);
    cap.position.set(0, 0.075, z);
    cap.receiveShadow = true;
    group.add(cap);
    const trim = new THREE.Mesh(new THREE.BoxGeometry(7.24, 0.05, 0.12), assets.material.gold);
    trim.position.set(0, 0.15, z);
    group.add(trim);
  }
  if (narrow) {
    const firstTile = index === Math.floor((narrow.from + 9) / TILE);
    buildNarrowOverlay(assets, group, narrow.side, firstTile, surface);
  }
  if (sidePath) buildSidePathOverlay(assets, group, index === -1, sidePathLast);

  if (assets.obstacles['tower-arch'] && terrain === 'temple' && index % 7 === 3 && !clearScenery) {
    const tower = assets.obstacles['tower-arch'].clone(true);
    tower.scale.setScalar(0.07);
    group.add(tower);
  }
  if (terrain === 'anniversary' && !clearScenery) {
    // Golden anniversary set-piece: banners and braziers frame the surviving corridor.
    const bannerMat = new THREE.MeshStandardMaterial({ color: 0x8e2f2a, side: THREE.DoubleSide, roughness: 0.9, emissive: 0x2a0806, emissiveIntensity: 0.35 });
    for (const side of [-1, 1] as const) {
      const pole = new THREE.Mesh(new THREE.CylinderGeometry(0.07, 0.09, 4.4, 6), assets.material.gold);
      pole.position.set(side * 3.25, 2.2, 0);
      group.add(pole);
      const banner = new THREE.Mesh(new THREE.PlaneGeometry(1.05, 2.7), bannerMat);
      banner.position.set(side * 2.8, 3.15, 0);
      banner.rotation.y = side * Math.PI / 2;
      group.add(banner);
    }
  }
  if (assets.gate && index % 5 === 2 && (terrain === 'temple' || terrain === 'anniversary')) {
    const gate = assets.gate.clone(true);
    gate.scale.setScalar(0.2);
    gate.position.set(0, 0, -TILE / 2);
    gate.rotation.y = Math.PI;
    group.add(gate);
  }
  return group;
}

/** Turn platform: square paving, rim stones and three glowing arrows. */
export function buildJunction(assets: Assets, direction: 1 | -1, path: TrackPath, at: number): THREE.Group {
  const group = new THREE.Group();
  const point = path.at(at);
  // Rotate to the incoming heading: the corner paving belongs to the approach side.
  // Using the outgoing heading turns the pad 90° and leaves a wedge-shaped seam at the bend.
  const heading = path.at(Math.max(0, at - 0.05)).heading;
  group.position.set(point.x, 0, point.z);
  group.rotation.y = heading;
  // The 12 m tile that straddles the turn is skipped, so one 12 m paving square covers the
  // hole; a larger apron sits underneath so any hairline shows paving instead of the gorge.
  const pad = new THREE.Mesh(
    new THREE.PlaneGeometry(12, 12),
    new THREE.MeshStandardMaterial({ map: croppedTexture(assets.texture.wall, 516, 6, 250, 3, 1), color: 0xb59c76, roughness: 0.96 }),
  );
  pad.rotation.x = -Math.PI / 2;
  pad.position.y = -0.012;
  pad.receiveShadow = true;
  group.add(pad);
  const apron = new THREE.Mesh(
    new THREE.PlaneGeometry(20, 20),
    new THREE.MeshStandardMaterial({
      map: croppedTexture(assets.texture.wall, 516, 6, 250, 5, 1.67),
      color: 0x9e8f6e,
      roughness: 0.96,
      side: THREE.DoubleSide,
    }),
  );
  apron.rotation.x = -Math.PI / 2;
  apron.position.y = -0.03;
  apron.receiveShadow = true;
  group.add(apron);
  for (const [x, z] of [[-4.2, 4.2], [4.2, 4.2], [-4.2, -4.2], [4.2, -4.2]] as const) {
    const post = new THREE.Mesh(new THREE.CylinderGeometry(0.32, 0.36, 1.8, 8), cachedLightMat ?? lightsMaterial());
    post.position.set(x, 0.9, z);
    post.castShadow = true;
    group.add(post);
    group.add(flameSprite(assets, 0.9).clone());
    const flame = group.children[group.children.length - 1] as THREE.Sprite;
    flame.position.set(x, 2.05, z);
  }
  // Low wing walls frame the corner without blocking the view.
  const wallMat = new THREE.MeshStandardMaterial({ map: croppedTexture(assets.texture.wall, 256, 0, 256, 3, 1), color: 0xcbb693, roughness: 0.95 });
  for (const side of [-1, 1] as const) {
    for (const z of [-3.4, 3.4]) {
      const wall = new THREE.Mesh(new THREE.BoxGeometry(0.5, 1.1, 2.6), wallMat);
      wall.position.set(side * 3.9, 0.55, z);
      wall.castShadow = true;
      group.add(wall);
    }
  }
  const ring = new THREE.Mesh(new THREE.TorusGeometry(2.4, 0.06, 6, 40), new THREE.MeshStandardMaterial({ color: 0xd9b36a, metalness: 0.6, roughness: 0.35, emissive: 0x3a2a10, emissiveIntensity: 0.4 }));
  ring.rotation.x = Math.PI / 2;
  ring.position.y = 0.04;
  group.add(ring);

  // Flat golden chevrons across the approach, pointing into the turn.
  const arrowMat = new THREE.MeshStandardMaterial({ color: 0xf5bb43, emissive: 0x8a5811, emissiveIntensity: 0.7, roughness: 0.4, metalness: 0.3 });
  for (let i = 0; i < 3; i++) {
    const arrow = new THREE.Mesh(new THREE.ConeGeometry(0.34, 0.85, 3), arrowMat);
    arrow.rotation.z = direction > 0 ? -Math.PI / 2 : Math.PI / 2;
    arrow.position.set(0, 0.09, 2.2 - i * 1.3);
    group.add(arrow);
  }
  return group;
}

function contactShadow(group: THREE.Group, radius: number): void {
  const mat = new THREE.MeshBasicMaterial({ color: 0x0b0f09, transparent: true, opacity: 0.18, depthWrite: false });
  const shadow = new THREE.Mesh(new THREE.CircleGeometry(radius, 20), mat);
  shadow.rotation.x = -Math.PI / 2;
  shadow.position.y = 0.035;
  shadow.renderOrder = 2;
  group.add(shadow);
}

export function buildObstacle(assets: Assets, def: ObstacleDef, prefabName: string): THREE.Group {
  const group = new THREE.Group();
  const kind = def.kind as ObstacleKind;
  // Use the actual APK prefab. The exporter baked the prefab-root frame: origin is the
  // track-tile centre and y=0 is the road surface.
  const prefab = assets.obstacles[prefabName] ?? null;
  if (prefab) {
    if (kind === 'gap' || kind === 'gapLong') {
      // The APK pit is an open shaft, but the web tile underneath still has a stone top.
      // Cover that top with void so the hole reads as a hole, not a painted road.
      const mouth = new THREE.Mesh(new THREE.PlaneGeometry(kind === 'gapLong' ? 8.4 : 7.6, kind === 'gapLong' ? 11 : 9.4), assets.material.void);
      mouth.rotation.x = -Math.PI / 2;
      mouth.position.y = 0.046;
      group.add(mouth);
    }
    const clone = prefab.clone(true);
    if (kind === 'gap' || kind === 'gapLong') clone.position.y = 0.05;
    group.add(clone);
    if (def.id === 'fireWall') {
      const base = new THREE.Mesh(new THREE.BoxGeometry(7.4, 0.2, 1.4), assets.material.stone);
      base.position.y = 0.08;
      group.add(base);
      for (let i = 0; i < 8; i++) {
        const flame = flameSprite(assets, 1.0 + (i % 3) * 0.08);
        flame.position.set(-3.15 + i * 0.9, 1.1, 0);
        group.add(flame);
      }
      return group;
    }
    if (kind === 'fire') {
      // The APK flame is a particle system (no mesh); put the two jets on the real pedestals.
      for (const x of [-2.75, 2.75] as const) {
        const flame = flameSprite(assets, 1.15);
        flame.position.set(x, 2.5, 0);
        group.add(flame);
      }
    }
    return group;
  }
  const cutMat = new THREE.MeshStandardMaterial({ color: 0xd8b97e, roughness: 0.85 });

  if (kind === 'hurdle') {
    for (const [x, r, h] of [[0, 1.02, 1.02], [-2.05, 0.62, 0.78], [2.05, 0.62, 0.78]] as const) {
      const stump = new THREE.Mesh(new THREE.CylinderGeometry(r, r * 1.08, h, 10), assets.material.wood);
      stump.position.set(x, h / 2, 0);
      stump.castShadow = true;
      group.add(stump);
      const cut = new THREE.Mesh(new THREE.CylinderGeometry(r * 0.92, r * 0.92, 0.06, 10), cutMat);
      cut.position.set(x, h + 0.02, 0);
      group.add(cut);
      const moss = new THREE.Mesh(new THREE.CylinderGeometry(r * 0.55, r * 0.55, 0.03, 8), assets.material.moss);
      moss.position.set(x, h + 0.05, 0);
      group.add(moss);
    }
    for (const [x, y, rz] of [[-0.95, 0.42, 1.5], [1.0, 0.36, 1.66]] as const) {
      const branch = new THREE.Mesh(new THREE.CylinderGeometry(0.18, 0.2, 2.0, 7), assets.material.wood);
      branch.position.set(x, y, 0.1);
      branch.rotation.z = rz;
      branch.castShadow = true;
      group.add(branch);
    }
  } else if (kind === 'arch') {
    for (const side of [-1, 1] as const) {
      const post = new THREE.Mesh(new THREE.CylinderGeometry(0.36, 0.4, 1.04, 8), assets.material.wood);
      post.position.set(side * 3.25, 0.52, 0);
      post.castShadow = true;
      group.add(post);
    }
    const trunk = new THREE.Mesh(new THREE.CylinderGeometry(0.3, 0.3, 7.1, 9), assets.material.wood);
    trunk.rotation.z = Math.PI / 2;
    trunk.position.y = 1.14;
    trunk.castShadow = true;
    group.add(trunk);
    for (const [x, ln] of [[-1.15, 0.42], [0.35, 0.6], [1.25, 0.34]] as const) {
      const vine = new THREE.Mesh(new THREE.CylinderGeometry(0.035, 0.035, ln, 5), assets.material.moss);
      vine.position.set(x, 1.02 - ln / 2, 0.14);
      group.add(vine);
    }
  } else if (kind === 'gap') {
    const depth = 4.6;
    const water = new THREE.Mesh(new THREE.PlaneGeometry(6.3, 5.4), assets.material.water);
    water.rotation.x = -Math.PI / 2;
    water.position.set(0, 0.047, 0.2);
    group.add(water);
    const hole = (w: number, d: number, z: number, rot: number): void => {
      const mesh = new THREE.Mesh(new THREE.PlaneGeometry(w, d), assets.material.void);
      mesh.rotation.x = -Math.PI / 2;
      mesh.rotation.z = rot;
      mesh.position.set(0, 0.042, z);
      group.add(mesh);
    };
    hole(7.5, depth, 0, 0);
    hole(6.1, depth * 0.62, depth * 0.34, 0.16);
    hole(4.6, depth * 0.5, -depth * 0.36, -0.22);
    for (const rz of [1, -1] as const) {
      for (let i = -6; i <= 6; i++) {
        const slab = new THREE.Mesh(new THREE.BoxGeometry(0.38 + (i % 3) * 0.05, 0.2, 0.6), assets.material.stone);
        slab.position.set(i * 0.58 + rz * 0.06, 0.06, rz * (depth / 2 + 0.12));
        slab.rotation.y = i * 0.3;
        group.add(slab);
      }
      for (const x of [-3.4, 3.4] as const) {
        const pole = new THREE.Mesh(new THREE.CylinderGeometry(0.12, 0.14, 1.05, 8), assets.material.wood);
        pole.position.set(x, 0.55, rz * (depth / 2 + 0.55));
        group.add(pole);
        const flame = flameSprite(assets, 0.8);
        flame.position.set(x, 1.18, rz * (depth / 2 + 0.55));
        group.add(flame);
      }
    }
    contactShadow(group, 1.8);
  } else if (kind === 'fire') {
    const slab = new THREE.Mesh(new THREE.BoxGeometry(7.8, 0.2, 1.3), assets.material.stone);
    slab.position.y = 0.08;
    group.add(slab);
    for (const side of [-1, 1] as const) {
      const ped = new THREE.Mesh(new THREE.BoxGeometry(0.7, 1.1, 0.8), assets.material.stone);
      ped.position.set(side * 3.2, 0.55, 0.15);
      group.add(ped);
    }
    for (let i = 0; i < 6; i++) {
      const x = -2.4 + i * 0.96;
      const sc = 0.85 + ((i * 37) % 23) / 60;
      const cone = new THREE.Mesh(new THREE.ConeGeometry(0.4 * sc, 2.0 * sc, 7), assets.material.fire);
      cone.position.set(x, 0.28 + sc, 0.12);
      group.add(cone);
      const flame = flameSprite(assets, 1.1 * sc, 0xffe0a8);
      flame.position.set(x, 1.0 * sc + 0.4, 0.14);
      group.add(flame);
    }
    contactShadow(group, 1.4);
  } else {
    // Stone pedestal blocker with a fire bowl.
    const body = new THREE.Mesh(new THREE.BoxGeometry(1.9, 2.15, 1.15), assets.material.stone);
    body.position.y = 1.07;
    body.castShadow = true;
    group.add(body);
    const top = new THREE.Mesh(new THREE.BoxGeometry(2.08, 0.32, 1.32), assets.material.stone);
    top.position.y = 2.25;
    group.add(top);
    const cap = new THREE.Mesh(new THREE.BoxGeometry(1.6, 0.4, 0.9), assets.material.gold);
    cap.position.y = 2.46;
    group.add(cap);
    const bowl = new THREE.Mesh(new THREE.CylinderGeometry(0.48, 0.4, 0.24, 10), assets.material.stone);
    bowl.position.y = 2.66;
    group.add(bowl);
    const flame = flameSprite(assets, 0.95, 0xffc06a);
    flame.position.y = 3.05;
    group.add(flame);
    contactShadow(group, 1.15);
  }
  return group;
}

export function buildCoin(assets: Assets): THREE.Object3D {
  const group = new THREE.Group();
  const face = new THREE.MeshStandardMaterial({ map: assets.texture.coinFace, metalness: 0.32, roughness: 0.38, emissive: 0x8a5a12, emissiveIntensity: 0.6, transparent: true, alphaTest: 0.35, side: THREE.DoubleSide });
  const side = new THREE.MeshStandardMaterial({ color: 0xc98a26, metalness: 0.7, roughness: 0.35 });
  const coin = new THREE.Mesh(new THREE.CylinderGeometry(0.3, 0.3, 0.06, 16), side);
  coin.rotation.x = Math.PI / 2;
  group.add(coin);
  for (const z of [0.032, -0.032]) {
    const disc = new THREE.Mesh(new THREE.CircleGeometry(0.3, 18), face);
    disc.position.z = z;
    if (z < 0) disc.rotation.y = Math.PI;
    group.add(disc);
  }
  return group;
}

export function buildGem(): THREE.Object3D {
  const group = new THREE.Group();
  const gem = new THREE.Mesh(
    new THREE.OctahedronGeometry(0.34, 0),
    new THREE.MeshStandardMaterial({ color: 0x62e0ff, metalness: 0.4, roughness: 0.15, emissive: 0x1b6f9c, emissiveIntensity: 1.1 }),
  );
  group.add(gem);
  const ring = new THREE.Mesh(new THREE.TorusGeometry(0.5, 0.03, 6, 20), new THREE.MeshStandardMaterial({ color: 0xbfefff, emissive: 0x4aa8d8, emissiveIntensity: 1.2 }));
  ring.rotation.x = Math.PI / 2;
  group.add(ring);
  return group;
}

export function buildPower(kind: PickupKind): THREE.Object3D {
  const colors: Record<string, number> = { magnet: 0xff5c5c, shield: 0x7fd4ff, boost: 0x7dff9b, bonus: 0xffd76a };
  const group = new THREE.Group();
  const core = new THREE.Mesh(
    new THREE.OctahedronGeometry(0.36, 0),
    new THREE.MeshStandardMaterial({ color: colors[kind] ?? 0xffffff, emissive: colors[kind] ?? 0xffffff, emissiveIntensity: 0.8, metalness: 0.3, roughness: 0.25 }),
  );
  group.add(core);
  const ring = new THREE.Mesh(new THREE.TorusGeometry(0.52, 0.04, 6, 20), new THREE.MeshStandardMaterial({ color: 0xffffff, emissive: colors[kind] ?? 0xffffff, emissiveIntensity: 0.9 }));
  ring.rotation.x = Math.PI / 2;
  group.add(ring);
  return group;
}

export function buildChaser(assets: Assets): THREE.Object3D {
  const group = new THREE.Group();
  if (assets.enemy) {
    group.add(assets.enemy.clone(true));
    return group;
  }
  const body = new THREE.Mesh(
    new THREE.SphereGeometry(0.8, 12, 10),
    new THREE.MeshStandardMaterial({ color: 0x231a16, roughness: 0.9 }),
  );
  body.scale.set(0.85, 1.15, 0.9);
  body.position.y = 1.15;
  group.add(body);
  for (const side of [-1, 1] as const) {
    const eye = new THREE.Mesh(new THREE.SphereGeometry(0.09, 8, 6), new THREE.MeshStandardMaterial({ color: 0xffb43a, emissive: 0xff8a12, emissiveIntensity: 1.4 }));
    eye.position.set(side * 0.26, 1.5, 0.62);
    group.add(eye);
  }
  return group;
}

/** Lane index -> world side offset. */
export const sideOfLane = (lane: number): number => LANES[Math.max(0, Math.min(2, lane))];
