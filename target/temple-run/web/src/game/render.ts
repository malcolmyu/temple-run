import {NATIVE_SCENERY_RESOURCES} from './nativeSceneryGrid';
import { nativeCoinMaterial } from './nativeCoinMaterial';
import { nativeWaterGeometry, NATIVE_WATER_HEIGHT } from './nativeWater';
import { buildNativePower } from './nativePower';
import { buildNativeFlame } from './nativeFlame';
import { extractNativeGate } from './nativeGate';
import { nativeUnlitMaterial } from '../nativeUnlit.js';
import { nativeLightmapMaterial, attachNativeLightmapUV } from './nativeLightmap';
import { cutSurfaceGeometry } from './cutSurface';
import { NARROW_EDGE } from './terrain';
import * as THREE from 'three';
import { OBJLoader } from 'three/addons/loaders/OBJLoader.js';
import { mergeGeometries } from 'three/addons/utils/BufferGeometryUtils.js';
import { repairObjNormals } from '../objNormals.js';
import { CAMERA_FOV, LANES, PLAYER_Z, TILE } from './config';
import type { ObstacleKind, PickupKind } from './components';
import type { TrackPath } from './path';
import type { NarrowSection, TerrainKind } from './terrain';
import type { ObstacleDef } from './obstacles/types';
import type { SurfaceKind } from './surface';
import { branchSurfaceOffsets } from './sidePath';

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
    glow?: THREE.Texture;
    safetyNet?: THREE.Texture;
  };
  material: Record<string, THREE.Material>;
  roadTile: THREE.Group | null;
  wall: THREE.Group | null;
  corner?: THREE.Group | null;
  transitionA?: THREE.Group | null;
  transitionB?: THREE.Group | null;
  stoneCornerLeft?: THREE.Group | null;
  stoneCornerRight?: THREE.Group | null;
  tJunction?: THREE.Group | null;
  plankTJunction?: THREE.Group | null;
  coin?: THREE.Group | null;
  coinRed?: THREE.Group | null;
  coinBlue?: THREE.Group | null;
  plankTile?: THREE.Group | null;
  plankCorner?: THREE.Group | null;
  tree: THREE.Group | null;
  standaloneTrees?: ReadonlyArray<THREE.Group | null>;
  sceneryTemplates?: Readonly<Record<string,THREE.Group|null>>;
  gate: THREE.Group | null;
  towerGate?: THREE.Group | null;
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

const lightmappedMeshes = new Set(['decor-tree-native-1','decor-tree-native-2','decor-tree-native-3','decor-tree-native-4','stone-plank-cap-a','stone-plank-cap-b','stone-turn-a', 'stone-turn-b', 'temple-road-tile', 'plank-road-tile', 'plank-corner', 'track-wall-corner-a', 'decor-tree-a', 'track-gate-a', 'track-wall-straight-a', 'temple-entrance', 'entrance-surroundings', 'temple-t-junction', 'plank-t-junction']);
const loadObj = async (url: string): Promise<THREE.Group | null> => {
  try {
    const response=await fetch(url);
    if(!response.ok)return null;
    const obj=new OBJLoader().parse(await response.text());
    const name=url.split('/').pop()?.replace(/\.obj$/, '') ?? '';
    if(name.startsWith('decor-scenery-') || lightmappedMeshes.has(name) || (url.includes('/assets/obstacles/') && name !== 'stone-pedestal')) {
      const uv=await fetch(url.replace(/\.obj$/, '.uv1.json'));
      if(!uv.ok)throw new Error('Missing native lightmap UV: '+name);
      attachNativeLightmapUV(obj, await uv.json());
    }
    return obj;
  } catch(error) { console.warn('Unable to load OBJ', url, error); return null; }
};

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
  renderer.toneMappingExposure = 1.35;

  const scene = new THREE.Scene();
  scene.fog = new THREE.Fog(0x325256, 20, 80);

  const camera = new THREE.PerspectiveCamera(CAMERA_FOV, 1, 0.1, 190);
  camera.position.set(0, 5.25, PLAYER_Z + 7.5);

  scene.add(new THREE.HemisphereLight(0xe4dfca, 0x253c36, 1.9));
  const sun = new THREE.DirectionalLight(0xffe5ac, 2.25);
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

  // BV1ypuKzPErT: blue-grey mist over open water, warm sunlit masonry.
  const sky = new THREE.Mesh(
    new THREE.SphereGeometry(160, 24, 16),
    new THREE.ShaderMaterial({
      side: THREE.BackSide,
      toneMapped: false,
      depthWrite: false,
      uniforms: { top: { value: new THREE.Color(0x325256) }, mid: { value: new THREE.Color(0x325256) }, bottom: { value: new THREE.Color(0x325256) } },
      vertexShader: 'varying vec3 vP; void main(){ vP = position; gl_Position = projectionMatrix * modelViewMatrix * vec4(position,1.0); }',
      fragmentShader:
        'varying vec3 vP; uniform vec3 top; uniform vec3 mid; uniform vec3 bottom;' +
        'void main(){ float h = clamp(normalize(vP).y * 0.5 + 0.5, 0.0, 1.0);' +
        'vec3 c = h > 0.5 ? mix(mid, top, (h - 0.5) * 2.0) : mix(bottom, mid, h * 2.0);' +
        'gl_FragColor = vec4(c, 1.0);\n#include <tonemapping_fragment>\n#include <colorspace_fragment>\n}',
    }),
  );
  sky.frustumCulled = false;
  scene.add(sky);

  // Water material in sharedassets0 references terrainTexture (path ID 58).
  const waterTexture = await loadTexture(asset('terrainTexture.webp'));
  // Native PlayerSettings m_ActiveColorSpace=0 (Gamma): sample and fog-mix encoded RGB.
  waterTexture.colorSpace = THREE.NoColorSpace;
  waterTexture.wrapS = waterTexture.wrapT = THREE.RepeatWrapping;
  waterTexture.anisotropy = Math.min(4, renderer.capabilities.getMaxAnisotropy());
  // Native Water_Plane UV0, geometry and scene height; no invented texture drift.
  const water = new THREE.Mesh(
    nativeWaterGeometry(),
    new THREE.ShaderMaterial({
      toneMapped: false,
      uniforms: { waterTexture: { value: waterTexture }, fogColor: { value: new THREE.Color(50/255,82/255,86/255) } },
      vertexShader: `varying vec2 waterUv; varying float waterFog;
        void main(){vec4 p=modelMatrix*vec4(position,1.);waterUv=uv;
        waterFog=clamp((distance(p.xyz,cameraPosition)-20.)/60.,0.,1.);
        gl_Position=projectionMatrix*viewMatrix*p;}`,
      fragmentShader: `varying vec2 waterUv; varying float waterFog; uniform vec3 fogColor;
        uniform sampler2D waterTexture;
        void main(){
          vec3 color=texture2D(waterTexture,waterUv).rgb;
          color=mix(color,fogColor,waterFog);
          gl_FragColor=vec4(color,1.);
          #include <tonemapping_fragment>
          // Gamma project: native encoded RGB is already the display output.
        }`,
    }),
  );
  water.name = 'reference-water';
  water.position.y = NATIVE_WATER_HEIGHT;
  scene.add(water);

  const [wall, tree, leaf, flame, spark, coinFace, wingsTexture, glowTexture, safetyNetAtlas] = await Promise.all([
    loadTexture(asset('wallTexture.webp')),
    loadTexture(asset('treeTexture.webp')),
    loadTexture(asset('leafTexture.webp')),
    loadTexture(`${BASE}assets/ui/fx-flame.png`),
    loadTexture(`${BASE}assets/ui/fx-spark.png`),
    loadTexture(`${BASE}assets/ui/coin-face.png`),
    loadTexture(`${BASE}assets/ui/wings.png`).catch(() => null),
    loadTexture(asset('playerGlowTexture.webp')),
    loadTexture(`${BASE}assets/ui/EffectsTexture2x.png`),
  ]);
  leaf.wrapS = leaf.wrapT = THREE.RepeatWrapping;

  const bakedLight=await loadTexture(asset('lightMapTexture.webp'));
  const nativeRoadMaterial=nativeLightmapMaterial(wall,bakedLight);
  const nativeTreeMaterial=nativeLightmapMaterial(tree,bakedLight);
  const coinMaterial=nativeCoinMaterial(wall);
  const material: Record<string, THREE.Material> = {
    road: new THREE.MeshStandardMaterial({
      map: wall,
      color: 0xd8c394,
      side: THREE.DoubleSide,
      roughness: 0.95,
      emissive: 0x5a3f1c,
      emissiveIntensity: 0.35,
    }),
    facade: new THREE.MeshStandardMaterial({
      map: wall,
      color: 0x9d9179,
      side: THREE.DoubleSide,
      roughness: 0.95,
      emissive: 0x3a2f1e,
      emissiveIntensity: 0.25,
    }),
    tree: new THREE.MeshStandardMaterial({ map: tree, color: 0xc7bc98, side: THREE.DoubleSide, roughness: 0.98 }),
    leaf: new THREE.MeshStandardMaterial({ map: leaf, color: 0x4f7057, side: THREE.DoubleSide, roughness: 0.95, emissive: 0x0d1a11, emissiveIntensity: 0.55 }),
    stone: new THREE.MeshStandardMaterial({ color: 0x9f947c, map: wall, roughness: 0.95 }),
    wood: new THREE.MeshStandardMaterial({ map: tree, color: 0x8e7b5e, roughness: 0.97 }),
    gold: new THREE.MeshStandardMaterial({ color: 0xf5bb43, metalness: 0.72, roughness: 0.25, emissive: 0x6b4309, emissiveIntensity: 0.3 }),
    moss: new THREE.MeshStandardMaterial({ color: 0x496f4c, roughness: 0.9 }),
    fire: new THREE.MeshStandardMaterial({ color: 0xff7a24, emissive: 0xff5a12, emissiveIntensity: 1.15 }),
    void: new THREE.MeshBasicMaterial({ color: 0x05070a }),
    water: new THREE.MeshBasicMaterial({ color: 0x0b2b27, transparent: true, opacity: 0.72 }),
  };

  const sceneryPaths=Object.entries(NATIVE_SCENERY_RESOURCES).filter(([group])=>group!=='tree').flatMap(([,paths])=>paths);
  const sceneryLoad=Promise.all(sceneryPaths.map(path=>loadObj(`${BASE}assets/track/decor-scenery-${path.slice(6).toLowerCase()}.obj`)));
  const [roadTile, wallTemplate, treeTemplate, gateTemplate, enemyMesh, enemyTexture, entranceMesh, cornerMesh, coinMesh, plankMesh, plankCorner, redCoin, blueCoin, tJunction, plankTJunction, stoneCornerLeft, stoneCornerRight, transitionA, transitionB, tree2, tree3, tree4] = await Promise.all([
    loadObj(`${BASE}assets/track/temple-road-tile.obj`),
    loadObj(`${BASE}assets/track/track-wall-straight-a.obj`),
    loadObj(`${BASE}assets/track/decor-tree-native-1.obj`),
    loadObj(`${BASE}assets/track/track-gate-a.obj`),
    loadObj(asset('mesh-96-enemy.obj')),
    loadTexture(asset('texture-53-enemyTexture.webp')).catch(() => null),
    loadObj(`${BASE}assets/track/temple-entrance.obj`),
    loadObj(`${BASE}assets/track/track-wall-corner-a.obj`),
    loadObj(`${BASE}assets/track/coin-yellow.obj`),
    loadObj(`${BASE}assets/track/plank-road-tile.obj`),
    loadObj(`${BASE}assets/track/plank-corner.obj`),
    loadObj(`${BASE}assets/track/coin-red.obj`),
    loadObj(`${BASE}assets/track/coin-blue.obj`),
    loadObj(`${BASE}assets/track/temple-t-junction.obj`),
    loadObj(`${BASE}assets/track/plank-t-junction.obj`),
    loadObj(`${BASE}assets/track/stone-turn-a.obj`),
    loadObj(`${BASE}assets/track/stone-turn-b.obj`),
    loadObj(`${BASE}assets/track/stone-plank-cap-a.obj`),
    loadObj(`${BASE}assets/track/stone-plank-cap-b.obj`),
    ...[2,3,4].map(i=>loadObj(`${BASE}assets/track/decor-tree-native-${i}.obj`)),
  ]);
  if (enemyMesh && enemyTexture) {
    enemyTexture.flipY = false;
    const enemyMaterial = nativeUnlitMaterial(enemyTexture, THREE.DoubleSide);
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
    'plank-pit',
    'plank-beam',
    'pit-long-a',
    'pit-long-b',
    'tower-arch',
    'tower-arch-vert',
    'narrow-wall-left-a',
    'narrow-wall-left-b',
    'narrow-wall-right-a',
    'narrow-wall-right-b',
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
    paint(obj, name === 'stone-pedestal' ? obstacleStoneMat : name.startsWith('tree') ? nativeTreeMaterial : nativeRoadMaterial, !name.startsWith('pit'));
    // The exporter baked the prefab-root frame: origin is the track-tile centre and y=0
    // is the road. Do NOT re-centre on the bounding box; a tree's canopy would move into
    // the running lane. Just match the player scale.
    const bakedWorld=['tree-trip-left','tree-trip-right','tree-jump-left','tree-jump-right'].includes(name)||name.startsWith('plank-')||name.startsWith('pit-long-')||name.startsWith('narrow-')||name==='flame-tower';
    obj.rotation.y = bakedWorld?0:Math.PI;
    obj.scale.setScalar(bakedWorld?1:name==='tree-slide' ? .2 : name.startsWith('tree') ? 0.14 : name==='pit'||name==='pit-vert' ? .2 : .18);
    obstacles[name] = obj;
  }

  if (entranceMesh) {
    const entrance = new THREE.Group();
    // The close entrance in reference 002/003 retains its black mouth. Use the
    // original shader's no-vertex-fog variant, not the road's fogged variant.
    paint(entranceMesh, nativeLightmapMaterial(wall, bakedLight, false), true);
    entrance.add(entranceMesh);
    entrance.name = 'reference-entrance';
    entrance.visible = false;
    // Path distance0 is native UnityZ0; classic player starts at distance-2.
    // Translate the native entrance by the same world origin as the road.
    entrance.position.set(0, 0, PLAYER_Z);
    entrance.scale.setScalar(1);
    entrance.rotation.set(0, 0, 0);
    scene.add(entrance);
  }

  const standaloneTrees=[treeTemplate,tree2,tree3,tree4].map(obj=>paint(obj,nativeTreeMaterial,false));
  const sceneryTemplates:Record<string,THREE.Group|null>=Object.fromEntries(NATIVE_SCENERY_RESOURCES.tree.map((path,i)=>[path,standaloneTrees[i]]));
  const sceneryObjects=await sceneryLoad;
  sceneryPaths.forEach((path,i)=>{sceneryTemplates[path]=paint(sceneryObjects[i],path==='Trees/templeHead'||path==='Trees/groundPatchTemple'?nativeRoadMaterial:nativeTreeMaterial,false);});
  return {
    renderer,
    scene,
    camera,
    sun,
    sky,
    material,
    assets: {
      texture: { wall, tree, leaf, flame, spark, coinFace, wings: wingsTexture, glow: glowTexture, safetyNet: safetyNetAtlas },
      material,
      roadTile: paint(roadTile, nativeRoadMaterial, false),
      wall: paint(wallTemplate, nativeRoadMaterial, true),
      corner: paint(cornerMesh, nativeRoadMaterial, true),
      transitionA: paint(transitionA, nativeRoadMaterial, true),
      transitionB: paint(transitionB, nativeRoadMaterial, true),
      stoneCornerLeft: paint(stoneCornerLeft, nativeRoadMaterial, true),
      stoneCornerRight: paint(stoneCornerRight, nativeRoadMaterial, true),
      tJunction: paint(tJunction, nativeRoadMaterial, true),
      plankTJunction: paint(plankTJunction, nativeRoadMaterial, true),
      plankCorner: paint(plankCorner, nativeRoadMaterial, true),
      plankTile: paint(plankMesh, nativeRoadMaterial, true),
      coinRed: paint(redCoin, coinMaterial, false),
      coinBlue: paint(blueCoin, coinMaterial, false),
      coin: paint(coinMesh, coinMaterial, false),
      tree: standaloneTrees[0],
      standaloneTrees,
      sceneryTemplates,
      gate: extractNativeGate(paint(gateTemplate, nativeRoadMaterial, false)),
      towerGate: extractNativeGate(obstacles['tower-arch'], 'tower'),
      enemy: enemyMesh,
      obstacles,
    },
  };
}

const ROAD_TILE_Y = 0; // Full native prefab TRS already places the road floor.
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
  const byMaterial = new Map<string, THREE.Mesh[]>();
  root.traverse((object) => {
    const mesh = object as THREE.Mesh;
    if (!mesh.isMesh || Array.isArray(mesh.material)) return;
    const key = `${mesh.material.uuid}:${mesh.userData.walkableSurface ? 1 : 0}`;
    const list = byMaterial.get(key) ?? [];
    list.push(mesh);
    byMaterial.set(key, list);
  });
  for (const meshes of byMaterial.values()) {
    const material = meshes[0].material as THREE.Material;
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
    mergedMesh.userData.walkableSurface = meshes.some(mesh => mesh.userData.walkableSurface);
    root.add(mergedMesh);
    for (const mesh of meshes) mesh.removeFromParent();
  }
}

const LANE_SIDE = [-1.3, 0, 1.3] as const;

/** Timber causeway: reference 68s/76s shows cross-planks, bound piles and skulls. */
function buildBridgeDeck(assets: Assets, group: THREE.Group): void {
  if (assets.plankTile) {
    const deck = assets.plankTile.clone(true);
    deck.traverse(part => { if ((part as THREE.Mesh).isMesh) part.userData.walkableSurface = true; });
    group.add(deck);
    return;
  }
  const wood = plankMaterial(assets);
  const grain = croppedTexture(assets.texture.wall, 8, 268, 224, 1, 1);
  grain.center.set(.5, .5);
  grain.rotation = Math.PI / 2;
  const boardMat = new THREE.MeshStandardMaterial({ map: grain, color: 0xe2d3ad, roughness: 1, emissive: 0x705025, emissiveIntensity: .32 });
  // Board pitch divides the tile exactly: prototypes meet without overlapping boards.
  const count = 24;
  for (let i = 0; i < count; i++) {
    const width = 7.05 + Math.sin(i * 2.1) * .16;
    const board = new THREE.Mesh(new THREE.BoxGeometry(width, .16, .475), boardMat);
    board.position.set(Math.sin(i * 1.7) * .055, -.07, -TILE / 2 + (i + .5) * TILE / count);
    board.rotation.z = Math.sin(i * 2.8) * .005;
    board.receiveShadow = true;
    board.userData.walkableSurface = true;
    group.add(board);
  }
  const rope = new THREE.MeshStandardMaterial({
    map: croppedTexture(assets.texture.wall, 778, 446, 128, 1, 2), color: 0xa69d80, roughness: 1,
  });
  // The atlas uses an ochre packing background, not alpha. Remove that colour
  // from the skull patch so the ornament has a silhouette instead of a square sign.
  const skullSource = croppedTexture(assets.texture.wall, 916, 446, 96, 1, 1);
  const skullCanvas = document.createElement('canvas');
  skullCanvas.width = skullCanvas.height = 96;
  const ctx = skullCanvas.getContext('2d')!;
  ctx.drawImage(skullSource.image as HTMLCanvasElement, 0, 0);
  const pixels = ctx.getImageData(0, 0, 96, 96);
  for (let i = 0; i < pixels.data.length; i += 4) {
    const r = pixels.data[i], g = pixels.data[i + 1], b = pixels.data[i + 2];
    if (r > 70 && r > g * 1.15 && b < r * .65) pixels.data[i + 3] = 0;
  }
  ctx.putImageData(pixels, 0, 0);
  const skullTexture = new THREE.CanvasTexture(skullCanvas);
  skullTexture.colorSpace = THREE.SRGBColorSpace;
  const skull = new THREE.MeshBasicMaterial({ map: skullTexture, side: THREE.DoubleSide, transparent: true, alphaTest: .5 });
  const brace = (x: number, a: THREE.Vector3, b: THREE.Vector3): void => {
    const delta = b.clone().sub(a);
    const beam = new THREE.Mesh(new THREE.BoxGeometry(.22, delta.length(), .22), wood);
    beam.position.copy(a).add(b).multiplyScalar(.5);
    beam.position.x = x;
    beam.quaternion.setFromUnitVectors(new THREE.Vector3(0, 1, 0), delta.normalize());
    group.add(beam);
  };
  for (const side of [-1, 1]) {
    const stringer = new THREE.Mesh(new THREE.BoxGeometry(.35, .38, TILE), wood);
    stringer.position.set(side * 2.9, -.32, 0);
    group.add(stringer);
    const positions = [-4.5, -1.5, 1.5, 4.5];
    for (const z of positions) {
      const pile = new THREE.Mesh(new THREE.CylinderGeometry(.25, .32, 3.2, 6), wood);
      pile.position.set(side * 3.35, -.45, z);
      pile.castShadow = true;
      group.add(pile);
      for (const y of [-.12, .8]) {
        const binding = new THREE.Mesh(new THREE.CylinderGeometry(.34, .34, .46, 8), rope);
        binding.position.set(side * 3.35, y, z);
        group.add(binding);
      }
      // Original skull atlas patch on a small plaque at the top of the pile.
      const ornament = new THREE.Mesh(new THREE.PlaneGeometry(.55, .55), skull);
      ornament.position.set(side * 3.35, 1.27, z + .26);
      ornament.rotation.z = side * -.18;
      group.add(ornament);
    }
    for (let i = 0; i < positions.length - 1; i++) {
      const from = positions[i], to = positions[i + 1];
      brace(side * 3.1, new THREE.Vector3(0, -1.65, from), new THREE.Vector3(0, -.35, to));
      brace(side * 3.1, new THREE.Vector3(0, -.35, from), new THREE.Vector3(0, -1.65, to));
    }
  }
  // The global world-space water remains visible between planks and outside the piles.
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
      slab.userData.walkableSurface = true;
      slab.rotation.y = side * (0.1 + i * 0.05);
      group.add(slab);
    }

  }
}

/** Half-road: one side of the slab has fallen into the canyon, leaving a ragged lip. */
export function buildNarrowOverlay(assets: Assets, group: THREE.Group, side: 'left' | 'right', firstTile: boolean, surface: SurfaceKind = 'stone', short = false): void {
  const dir = side === 'left' ? 1 : -1; // missing half is on this side (+1 = right)
  const edge = NARROW_EDGE * dir;
  // Vertical cliff face under the broken lip.
  const face = new THREE.Mesh(new THREE.BoxGeometry(0.35, 3.6, TILE + 0.02), assets.material.stone);
  face.position.set(edge - dir * .175, -1.8, 0);
  group.add(face);
  // The missing floor and its outer parapet are cut by the tile geometry system.
  // Broken paving/planks tumbling off the edge.
  for (let i = 0; i < 6; i++) {
    const slab = new THREE.Mesh(
      new THREE.BoxGeometry(surface === 'wood' ? 0.75 + (i % 2) * 0.25 : 0.55 + (i % 2) * 0.25, surface === 'wood' ? 0.12 : 0.2, 0.75),
      surface === 'wood' ? plankMaterial(assets) : assets.material.stone,
    );
    slab.position.set(edge + dir * (0.25 + (i % 3) * 0.32), -0.2 - (i % 3) * 0.22, -4.6 + i * 1.9);
    slab.rotation.set((i % 2 ? 0.12 : -0.08), i * 0.37, (i % 2 ? 0.18 : -0.12));
    group.add(slab);
  }

}

/** Broken centre of a left/right fork: both outer lanes survive, middle falls. */
export function buildSidePathOverlay(assets: Assets, group: THREE.Group, first: boolean, last = false, activeLateral = 0, surface: SurfaceKind = 'stone'): void {
  // Render the non-active branch too. The opposite branch is a real TrackPath clone
  // with its own lateral offset; without this its surface disappears from the scene.
  const offsets = branchSurfaceOffsets(activeLateral);
  for (const offset of offsets) {
    if (Math.abs(offset) < 0.01) continue;
    const branchSurface = new THREE.Mesh(
      new THREE.PlaneGeometry(2.7, TILE + 0.02),
      surface === 'wood' ? plankMaterial(assets) : assets.material.stone,
    );
    branchSurface.rotation.x = -Math.PI / 2;
    branchSurface.position.set(offset, 0.064, 0);
    group.add(branchSurface);
    for (const z of [-4.8, 4.8]) {
      const post = new THREE.Mesh(new THREE.CylinderGeometry(0.07, 0.09, 1.0, 6), assets.material.wood);
      post.position.set(offset + (offset > 0 ? -1.5 : 1.5), 0.5, z);
      group.add(post);
    }
  }
  // Once a graph branch is chosen, this tile is the complete active road.
  // Its centre must stay supported; the opposite branch was added above.
  if(Math.abs(activeLateral)>.001)return;
  const gap = new THREE.Mesh(new THREE.PlaneGeometry(1.08, TILE + 0.02), assets.material.water);
  gap.rotation.x = -Math.PI / 2;
  gap.position.set(0, 0.065, 0);
  group.add(gap);
  const face = new THREE.Mesh(new THREE.BoxGeometry(0.25, 2.4, TILE + 0.02), assets.material.stone);
  face.position.set(0, -1.4, 0);
  group.add(face);
  for (const side of [-1, 1] as const) {
    for (let i = 0; i < 4; i++) {
      const slab = new THREE.Mesh(new THREE.BoxGeometry(0.42, 0.18, 0.62), assets.material.stone);
      slab.position.set(side * (0.66 + (i % 2) * 0.08), 0.08, -4.2 + i * 2.8);
      slab.rotation.set(0, side * 0.18, side * (i % 2 ? 0.2 : -0.14));
      group.add(slab);
    }
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

/** Native standalone tree geometry already includes full prefab TRS and world scale.
 * Side spacing/yaw and chosen variant remain authoring estimates. */
export function buildSceneryTree(assets: Assets, side: number, variant = 0): THREE.Group | null {
  const native=assets.standaloneTrees?.[variant];
  const source=native??assets.tree;if(!source)return null;
  const tree=source.clone(true);tree.name=native?'native-standalone-tree':'legacy-scenery-tree';
  tree.scale.setScalar(native?1:.12);
  tree.position.set(side*6.2,native?0:-2,-2.5);
  tree.rotation.y=native?0:side>0?Math.PI:0;
  tree.userData.nativeTreeVariant=native?variant+1:null;
  return tree;
}

/** Clone one verified native resource without rescaling or recentering its authored pivot. */
export function buildNativeScenery(assets:Assets,resource:string):THREE.Group|null {
  const template=assets.sceneryTemplates?.[resource];if(!template)return null;
  const object=template.clone(true);object.name='native-scenery';
  object.position.set(0,0,0);object.rotation.set(0,0,0);object.scale.setScalar(1);
  object.userData.nativeSceneryResource=resource;
  return object;
}

/** SceneryElement.Instantiate clears root Euler; it is independent of road heading.
 * Current fitted scenery is parented under road groups, so cancel that parent basis.
 * These groups are direct scene children with yaw-only rotation and unit scale.
 */
export function alignNativeSceneryRoots(road: THREE.Group): void {
  for(const child of road.children)if(child.name==='native-standalone-tree') {
    child.quaternion.copy(road.quaternion).invert();
    child.position.y=-road.position.y;
  }
}

/** Use authored portal geometry; procedural masonry is an asset fallback. */
export function buildStoneGate(assets: Assets, tower = false): THREE.Group {
  if(tower && assets.towerGate)return assets.towerGate.clone(true);
  if(assets.gate)return assets.gate.clone(true);
  const gate = new THREE.Group();
  const stone = new THREE.MeshStandardMaterial({ map: croppedTexture(assets.texture.wall, 0, 0, 256, 1, 2), color: 0xc8b47e, roughness: 1 });
  const glyph = new THREE.MeshStandardMaterial({ map: croppedTexture(assets.texture.wall, 0, 640, 160, 1, 1), roughness: 1 });
  const block = (w: number, h: number, d: number, x: number, y: number) => {
    const mesh = new THREE.Mesh(new THREE.BoxGeometry(w, h, d), stone);
    mesh.position.set(x, y, 0); mesh.castShadow = true; mesh.receiveShadow = true; gate.add(mesh);
  };
  for (const side of [-1, 1]) {
    block(1.1, 5.5, 1.2, side * 3.6, 2.75);
    block(1.65, .5, 1.7, side * 3.6, .25);
    block(1.6, .35, 1.6, side * 3.6, 5.35);
    const face = new THREE.Mesh(new THREE.PlaneGeometry(.85, 1.1), glyph);
    face.position.set(side * 3.6, 2.3, .61); gate.add(face);
  }
  block(8.3, 1.05, 1.3, 0, 5.65);
  block(8.7, .28, 1.6, 0, 6.3);
  return gate;
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
  branchOffset = 0,
  surfaceFirst = false,
  surfaceLast = false,
): THREE.Group {
  const group = new THREE.Group();
  group.position.z = -distance;
  group.userData.tileIndex = index;
  group.userData.terrain = terrain;

  if (surface === 'stone' && assets.roadTile) {
    const road = assets.roadTile.clone(true);
    road.traverse(part => { if ((part as THREE.Mesh).isMesh) part.userData.walkableSurface = true; });
    road.position.y = ROAD_TILE_Y;
    // Native straight prefab TRS has unit scale; keep its 4m floor width.
    road.scale.x = 1;
    group.add(road);
  } else if (surface === 'stone') {
    const slab = new THREE.Mesh(new THREE.BoxGeometry(7.0, 0.65, TILE + 0.1), lightsMaterial());
    slab.position.y = -0.38;
    slab.receiveShadow = true;
    slab.userData.walkableSurface = true;
    group.add(slab);
    const paving = new THREE.Mesh(new THREE.PlaneGeometry(6.9, TILE), new THREE.MeshStandardMaterial({ map: assets.texture.wall, color: 0xb59c76, roughness: 0.96 }));
    paving.userData.walkableSurface = true;
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
  } else if (assets.wall && !assets.roadTile) {
    // The original road prefab already includes both parapets. Only the fallback
    // slab needs separate wall meshes; adding them to the prefab doubles the walls.
    for (const side of [-1, 1] as const) {
      const wall = assets.wall.clone(true);
      wall.traverse(part => { if ((part as THREE.Mesh).isMesh) part.userData.walkableSurface = true; });
      wall.scale.setScalar(WALL_SCALE);
      wall.position.set(side * WALL_X, LOW_WALL_SINK, 0);
      wall.rotation.y = side > 0 ? 0 : Math.PI;
      group.add(wall);
      // Reference stone causeways have crenellated parapets, not rows of torches.
      if (index % 14 === 9) torch(group, assets, side * 3.05, 0);
    }
  }

  // The reference giant trunks stand close to the parapets, alternating sides.
  if (surface === 'stone' && !clearScenery && assets.tree && index >= 0 && index % 3 === 1) {
    const side = index % 6 === 1 ? -1 : 1;
    const tree=buildSceneryTree(assets,side);
    if(tree)group.add(tree);
  }

  if (narrow) {
    const firstTile = index === Math.floor((narrow.from + 9) / TILE);
    const short = narrow.to - narrow.from <= TILE + 1;
    buildNarrowOverlay(assets, group, narrow.side, firstTile, surface, short);
  }
  if (sidePath) buildSidePathOverlay(assets, group, index === -1, sidePathLast, branchOffset, surface);

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
  if (index % 7 === 2 && terrain === 'temple' && !clearScenery) {
    const gate = buildStoneGate(assets);
    gate.position.z = -TILE / 2;
    group.add(gate);
  }
  return group;
}

/** Turn platform: square paving, rim stones and three glowing arrows. */
export function buildJunction(assets: Assets, direction: 1 | -1, path: TrackPath, at: number, surface: SurfaceKind = 'stone'): THREE.Group {
  const group = new THREE.Group();
  const point = path.at(at);
  // Rotate to the incoming heading: the corner paving belongs to the approach side.
  // Using the outgoing heading turns the pad 90° and leaves a wedge-shaped seam at the bend.
  const heading = path.at(Math.max(0, at - 0.05)).heading;
  group.position.set(point.x, 0, point.z);
  group.rotation.y = heading;
  const stoneCorner=direction<0?assets.stoneCornerLeft:assets.stoneCornerRight;
  if(surface==='stone'&&stoneCorner&&assets.roadTile) {
    const corner=stoneCorner.clone(true);
    corner.name='native-stone-corner';
    corner.traverse(o=>{if((o as THREE.Mesh).isMesh)o.userData.walkableSurface=true;});
    group.add(corner);
    // Native corner arms end at6m. Preserve native straight triangles/UVs to
    // connect to the current global road grid (whose turn phase is fitted).
    for(const outgoing of [false,true]) {
      const arm=assets.roadTile.clone(true);
      arm.name='native-stone-connector';
      arm.traverse(part=>{
        const mesh=part as THREE.Mesh;if(!mesh.isMesh)return;
        mesh.userData.walkableSurface=true;
        const first=cutSurfaceGeometry(mesh.geometry,-100,-3);
        const kept=cutSurfaceGeometry(first,3,100);first.dispose();mesh.geometry=kept;
      });
      arm.position.set(outgoing?direction*9:0,0,outgoing?0:9);
      if(outgoing)arm.rotation.y=direction*Math.PI/2;
      group.add(arm);
    }
    return group;
  }
  if (surface === 'wood' && assets.plankCorner && assets.plankTile) {
    const corner = assets.plankCorner.clone(true);
    corner.rotation.y = Math.PI;
    corner.scale.x = -direction;
    group.add(corner);
    for (const outgoing of [false, true]) {
      const arm = assets.plankTile.clone(true);
      arm.traverse(part => {
        const mesh = part as THREE.Mesh;
        if (!mesh.isMesh) return;
        const first = cutSurfaceGeometry(mesh.geometry, -100, -3);
        const kept = cutSurfaceGeometry(first, 3, 100);
        first.dispose();
        mesh.geometry = kept;
      });
      arm.position.set(outgoing ? direction * 9 : 0, 0, outgoing ? 0 : 9);
      if (outgoing) arm.rotation.y = direction * Math.PI / 2;
      group.add(arm);
    }
    return group;
  }
  // Replace the skipped tile with two road-width arms, keeping water visible
  // inside the bend. The reference has parapets, without a plaza or floor arrows.
  const roadMat = new THREE.MeshStandardMaterial({
    map: croppedTexture(assets.texture.wall, 516, 6, 250, 1, 1),
    color: 0xd8c394, roughness: .96, side: THREE.DoubleSide,
  });
  const addDeck = (width: number, length: number, x: number, z: number): void => {
    const geometry = new THREE.PlaneGeometry(width, length);
    const positions = geometry.getAttribute('position');
    const uv = geometry.getAttribute('uv');
    for (let i = 0; i < positions.count; i++) {
      uv.setXY(i, (positions.getX(i) + x) / 7, (-positions.getY(i) + z) / 7);
    }
    const deck = new THREE.Mesh(geometry, roadMat);
    deck.rotation.x = -Math.PI / 2;
    deck.position.set(x, -.012, z);
    deck.receiveShadow = true;
    group.add(deck);
    const support = new THREE.Mesh(new THREE.BoxGeometry(width, .65, length), assets.material.stone);
    support.position.set(x, -.36, z);
    group.add(support);
  };
  // The original road mesh includes tall base geometry out to x=4, but its
  // visible parapets stand near x=2 after scaling. Match the walking span.
  addDeck(4, 4, 0, 0);
  addDeck(4, 10, 0, 7);
  addDeck(10, 4, direction * 7, 0);
  const parapet = (x: number, z: number, length: number, horizontal: boolean): void => {
    const wall = new THREE.Mesh(new THREE.BoxGeometry(horizontal ? length : .5, .75, horizontal ? .5 : length), assets.material.facade);
    wall.position.set(x, .375, z);
    wall.castShadow = true;
    group.add(wall);
    const count = Math.floor(length / 2.4);
    for (let i = 0; i <= count; i++) {
      const offset = -length / 2 + .3 + (length - .6) * i / Math.max(1, count);
      const post = new THREE.Mesh(new THREE.BoxGeometry(.7, .5, .7), assets.material.facade);
      post.position.set(x + (horizontal ? offset : 0), 1, z + (horizontal ? 0 : offset));
      post.castShadow = true;
      group.add(post);
    }
  };
  if (assets.corner) {
    // Authored outer corner is at (-17.5,-17.5), inside corner near (+5,+5).
    // Recenter the two road axes rather than centering the mesh bounding box.
    const corner = assets.corner.clone(true);
    corner.name = 'original-stone-corner';
    corner.scale.set(direction * .18, .2, .18);
    corner.position.set(direction * 1.08, -6, 1.08);
    group.add(corner);
    // The authored corner reaches ~5.6 m along both arms; connect to the
    // global 12 m tile grid without putting a second parapet over the prefab.
    parapet(-direction * 2.1, 8.8, 6.4, false);
    parapet(direction * 8.8, -2.1, 6.4, true);
    parapet(direction * 2.1, 8.8, 6.4, false);
    parapet(direction * 8.8, 2.1, 6.4, true);
  } else {
  parapet(-direction * 2.1, 4.95, 14.1, false);
  parapet(direction * 4.95, -2.1, 14.1, true);
  parapet(direction * 2.1, 7.05, 9.9, false);
  parapet(direction * 7.05, 2.1, 9.9, true);
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
    const clone = prefab.clone(true);
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
    if (def.id === 'flameTower' && assets.texture.safetyNet) {
      group.add(buildNativeFlame(assets.texture.safetyNet));
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

export function buildCoin(assets: Assets, value = 1): THREE.Object3D {
  const native = value === 2 ? assets.coinRed : value === 3 ? assets.coinBlue : assets.coin;
  if (native) return native.clone(true);
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

export function buildPower(kind: PickupKind, assets: Assets): THREE.Object3D {
  return buildNativePower(kind, assets.texture.safetyNet!);
}

function buildChaserBody(assets: Assets): THREE.Object3D {
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

/** The reference pursuit is a pack of three demon monkeys abreast. */
export function buildChaser(assets: Assets): THREE.Object3D {
  const pack = new THREE.Group();
  for (let i = 0; i < 3; i++) {
    const monkey = buildChaserBody(assets);
    monkey.position.set((i - 1) * 1.25, 0, i === 1 ? 0.25 : 0);
    pack.add(monkey);
  }
  return pack;
}

/** Lane index -> world side offset. */
export const sideOfLane = (lane: number): number => LANES[Math.max(0, Math.min(2, lane))];

/** Native TUp at the node origin; the incoming grid tile joins at z=3. */
export function buildTJunction(assets: Assets, surface: SurfaceKind = 'stone'): THREE.Group {
  const group=new THREE.Group();group.name=surface==='wood'?'original-plank-t-junction':'original-t-junction';
  const source=surface==='wood'?assets.plankTJunction:assets.tJunction;
  const road=surface==='wood'?assets.plankTile:assets.roadTile;
  if(!source)return group;
  const centre=source.clone(true);
  centre.traverse(o=>{const mesh=o as THREE.Mesh;if(mesh.isMesh){mesh.userData.walkableSurface=true;}});
  group.add(centre);
  if(road)for(const side of [-1,1]){
    const arm=road.clone(true);
    arm.traverse(o=>{const mesh=o as THREE.Mesh;if(!mesh.isMesh)return;
      const first=cutSurfaceGeometry(mesh.geometry,-100,-1.52);
      mesh.geometry=cutSurfaceGeometry(first,1.52,100);first.dispose();mesh.userData.walkableSurface=true;
    });
    arm.position.set(side*7.5,surface==='wood'?0:ROAD_TILE_Y,0);arm.rotation.y=side*Math.PI/2;arm.scale.x=1;group.add(arm);
  }
  return group;
}
