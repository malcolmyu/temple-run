import nativeTreeCollision from '../nativeTreeCollision.json';
import nativeLongHoleRegions from '../nativeLongHoleRegions.json';
const longSupport=(name:keyof typeof nativeLongHoleRegions):readonly (readonly [number,number])[]=>nativeLongHoleRegions[name].map(p=>[p[0],p[1]] as const);
import nativeNarrowRegions from '../nativeNarrowRegions.json';
const support=(name:keyof typeof nativeNarrowRegions):readonly (readonly [number,number])[]=>nativeNarrowRegions[name].map(p=>[p[0],p[1]] as const);
import type { ObstacleDef, Hitbox } from './types';

const box = (x: readonly [number, number], y: readonly [number, number], z: readonly [number, number]): Hitbox => ({ x, y, z });
const treeBox=(name:keyof typeof nativeTreeCollision):Hitbox=>{const b=nativeTreeCollision[name];return box([b.x[0],b.x[1]],[b.y[0],b.y[1]],[b.z[0],b.z[1]]);};
const FULL_X = [-3.6, 3.6] as const;
const LANE_X = [
  [-1.95, -0.65],
  [-0.65, 0.65],
  [0.65, 1.95],
] as const;

/**
 * Behaviour is taken from the APK Obstacle component (MustJumpOver /
 * MustSlideUnder / DoesKill) and the exported manifest's lane heights.
 * The video only confirms the visual shapes; it is a modded one-lane run.
 */
export const DEFS = {
  treeJump: {
    id: 'treeJump',
    kind: 'hurdle',
    action: 'jump',
    lanes: 'all',
    hitbox: treeBox('tree-jump-left'),nativeRegion:true,strictActionTiming:true,
    variantHitboxes:{'tree-jump-left':treeBox('tree-jump-left'),'tree-jump-right':treeBox('tree-jump-right')},
    kill: true,
    prefabs: ['tree-jump-left', 'tree-jump-right'],
    placement: 'straight',
    weight: 4,
    note: 'Native TreeJump flags jump/fatal; Region24 height1.2, longitudinal progress+.6..+1.4. Separate road retained.',
  },
  treeTrip: {
    id: 'treeTrip',
    kind: 'trip',
    action: 'jump',
    lanes: 'all',
    hitbox:treeBox('tree-trip-left'),nativeRegion:true,strictActionTiming:true,
    variantHitboxes:{'tree-trip-left':treeBox('tree-trip-left'),'tree-trip-right':treeBox('tree-trip-right')},
    kill: false,
    prefabs: ['tree-trip-left', 'tree-trip-right'],
    placement: 'straight',
    weight: 3,
    note: 'Native TreeTrip Region24 height.2, longitudinal+/- .2; lateral region differs by prefab. A miss stumbles.',
  },
  treeSlide: {
    id: 'treeSlide',
    kind: 'arch',
    action: 'slide', strictActionTiming:true,
    lanes: 'all',
    hitbox: box([-2,2], [1.6,1.6], [-.6,.6]),
    kill: true,
    prefabs: ['tree-slide','cliff-tree-slide'],
    placement: 'straight',
    weight: 3,
    note: 'Native tree-slide Obstacle21 is slide-only/fatal; Region24 canonical Z+/-0.6 at height1.6. Exported tree excludes floor, so retain the base road.',
  },
  flameTower: {
    id: 'flameTower',
    kind: 'fire',
    action: 'slide', alternateAction:'jump', strictActionTiming:true,
    lanes: 'all',
    hitbox: box([-2,2], [1.6,1.6], [-.5,.5]),
    surfaceCut:[-6,6],
    kill: true,
    prefabs: ['flame-tower'],
    placement: 'straight',
    weight: 2,
    note: 'Native Obstacle18 flags jump/slide/kill; Region19 canonical full-width plane at height1.6. Standing centre is blocked.',
  },
  pit: {
    id: 'pit',
    kind: 'gap',
    action: 'jump',
    lanes: 'all',
    hitbox: box(FULL_X, [-3, 0.08], [-5, 5]),
    surfaceCut: [-6, 6],
    kill: true,
    prefabs: ['pit'],
    placement: 'straight',
    weight: 2,
    note: 'Hole: every lane is open; jump or die.',
  },
  plankPit: {
    id: 'plankPit', kind: 'gap', action: 'jump', lanes: 'all',
    hitbox: box(FULL_X, [-6, .08], [-6, 6]), surfaceCut: [-6, 6],
    kill: true, prefabs: ['plank-pit'], placement: 'straight', weight: 0,
    note: 'Native broken plank tile; full-tile unsupported interval fitted from geometry, stripped native collision data.',
  },
  plankBeam: {
    id: 'plankBeam', kind: 'arch', action: 'slide', alternateAction: 'jump', strictActionTiming:true, lanes: 'all',
    hitbox: box([-2,2], [1.4,1.4], [-.5,.5]), surfaceCut: [-6,6],
    kill: true, prefabs: ['plank-beam'], placement: 'straight', weight: 0,
    note: 'Native plank tower flags allow jump/slide and kill a collision; Region2D15 spans +/-2.5 source Z at height -8.',
  },
  pitLongA: {
    id:'pitLongA',kind:'gapLong',action:'jump',lanes:'all',
    hitbox:box([-2,2],[-6,.08],[-6,6]),surfaceCut:[-6,6],
    groundSupportRegion:longSupport('pit-long-a'),kill:true,
    prefabs:['pit-long-a'],placement:'straight',weight:0,
    note:'Native far endcap: local Z -6..-5 supports ground; must follow the near endcap in a complete long-hole span.',
  },
  pitLongB: {
    id:'pitLongB',kind:'gapLong',action:'jump',lanes:'all',
    hitbox:box([-2,2],[-6,.08],[-6,6]),surfaceCut:[-6,6],
    groundSupportRegion:longSupport('pit-long-b'),kill:true,
    prefabs:['pit-long-b'],placement:'straight',weight:0,
    note:'Native near endcap: local Z5..6 supports ground; must precede the far endcap in a complete long-hole span.',
  },
  cliffGapA:{
    id:'cliffGapA',kind:'gapLong',action:'jump',lanes:'all',hitbox:box([-1.3,1.3],[-6,.08],[-6,6]),surfaceCut:[-6,6],
    groundSupportRegion:[[-1.3,1],[-1.3,6],[1.3,6],[1.3,1]],kill:true,prefabs:['cliff-gap-a'],placement:'straight',weight:0,
    note:'Native cliff long-hole alias uses near A cap;local+Z1..6 support,14m paired gap in12m web grid.'
  },
  cliffGapB:{
    id:'cliffGapB',kind:'gapLong',action:'jump',lanes:'all',hitbox:box([-1.3,1.3],[-6,.08],[-6,6]),surfaceCut:[-6,6],
    groundSupportRegion:[[-1.3,-6],[-1.3,-1],[1.3,-1],[1.3,-6]],kill:true,prefabs:['cliff-gap-b'],placement:'straight',weight:0,
    note:'Native cliff long-hole alias uses far B cap;local-Z-6..-1 support.'
  },
  fireWall: {
    id: 'fireWall',
    kind: 'fire',
    action: 'jump',
    lanes: 'all',
    hitbox: box(FULL_X, [0, 1.25], [-1.4, 1.4]),
    kill: true,
    prefabs: ['flame-tower'],
    placement: 'straight',
    weight: 1,
    note: 'Video-style full-width low fire wall; jump. Uses the flame tower base + a row of jets.',
  },
  stonePedestal: {
    id: 'stonePedestal',
    kind: 'block',
    action: 'dodge',
    lanes: 'one',
    hitbox: box([-0.65, 0.65], [0, 2.5], [-1.2, 1.2]),
    kill: false,
    prefabs: ['stone-pedestal'],
    placement: 'straight',
    weight: 2,
    note: 'Stone pedestal: one lane; change lane.',
  },
  towerArch: {
    id: 'towerArch',
    kind: 'tower',
    action: 'run',
    lanes: 'all',
    hitbox: box(FULL_X, [5.2, 8.5], [-1.0, 1.0]),
    kill: false,
    prefabs: ['tower-arch'],
    placement: 'scenery',
    weight: 0,
    note: 'Tower arch: scenery, underside clears the player; no collision.',
  },
  narrowWallLeft: {
    id:'narrowWallLeft', kind:'gap', action:'jump', lanes:'all',
    hitbox:box([-2,2],[-6,.08],[-6,6]), surfaceCut:[-6,6],
    groundSupportRegion:support('narrow-wall-left'), kill:true,
    prefabs:['narrow-wall-left'],placement:'narrow',weight:0,
    note:'Native narrow floor: Region2D support polygon, original mesh supplies road; any airborne feet may cross missing support.',
  },
  narrowWallRight: {
    id:'narrowWallRight', kind:'gap', action:'jump', lanes:'all',
    hitbox:box([-2,2],[-6,.08],[-6,6]), surfaceCut:[-6,6],
    groundSupportRegion:support('narrow-wall-right'), kill:true,
    prefabs:['narrow-wall-right'],placement:'narrow',weight:0,
    note:'Native narrow floor: Region2D support polygon, original mesh supplies road; any airborne feet may cross missing support.',
  },
  narrowWallLeftA: {
    id:'narrowWallLeftA',kind:'gap',action:'jump',lanes:'all',
    hitbox:box([-2,2],[-6,.08],[-6,6]),surfaceCut:[-6,6],
    groundSupportRegion:support('narrow-wall-left-a'),kill:true,
    prefabs:['narrow-wall-left-a'],placement:'narrow',weight:0,
    note:'Native long-narrow endcap with original tapered ground region and submerged collapsed slab.',
  },
  narrowWallLeftB: {
    id:'narrowWallLeftB',kind:'gap',action:'jump',lanes:'all',
    hitbox:box([-2,2],[-6,.08],[-6,6]),surfaceCut:[-6,6],
    groundSupportRegion:support('narrow-wall-left-b'),kill:true,
    prefabs:['narrow-wall-left-b'],placement:'narrow',weight:0,
    note:'Native long-narrow endcap with original tapered ground region and submerged collapsed slab.',
  },
  narrowWallRightA: {
    id:'narrowWallRightA',kind:'gap',action:'jump',lanes:'all',
    hitbox:box([-2,2],[-6,.08],[-6,6]),surfaceCut:[-6,6],
    groundSupportRegion:support('narrow-wall-right-a'),kill:true,
    prefabs:['narrow-wall-right-a'],placement:'narrow',weight:0,
    note:'Native long-narrow endcap with original tapered ground region and submerged collapsed slab.',
  },
  narrowWallRightB: {
    id:'narrowWallRightB',kind:'gap',action:'jump',lanes:'all',
    hitbox:box([-2,2],[-6,.08],[-6,6]),surfaceCut:[-6,6],
    groundSupportRegion:support('narrow-wall-right-b'),kill:true,
    prefabs:['narrow-wall-right-b'],placement:'narrow',weight:0,
    note:'Native long-narrow endcap with original tapered ground region and submerged collapsed slab.',
  },
  narrowBeamLeft: {
    id:'narrowBeamLeft', kind:'gap', action:'jump', lanes:'all',
    hitbox:box([-2,2],[-6,.08],[-6,6]), surfaceCut:[-6,6],
    groundSupportRegion:support('narrow-beam-left'), kill:true,
    prefabs:['narrow-beam-left'],placement:'narrow',weight:0,
    note:'Native narrow floor: Region2D support polygon, original mesh supplies road; any airborne feet may cross missing support.',
  },
  narrowBeamRight: {
    id:'narrowBeamRight', kind:'gap', action:'jump', lanes:'all',
    hitbox:box([-2,2],[-6,.08],[-6,6]), surfaceCut:[-6,6],
    groundSupportRegion:support('narrow-beam-right'), kill:true,
    prefabs:['narrow-beam-right'],placement:'narrow',weight:0,
    note:'Native narrow floor: Region2D support polygon, original mesh supplies road; any airborne feet may cross missing support.',
  },
} as const satisfies Record<string, ObstacleDef>;

export type DefId = keyof typeof DEFS;

/** All exported OBJ files mapped to their logic definition. */
export const ASSET_DEFS: Record<string, { defId: DefId; variant: string; vertical: boolean }> = {
  'tree-jump-left': { defId: 'treeJump', variant: 'left', vertical: false },
  'tree-jump-right': { defId: 'treeJump', variant: 'right', vertical: false },
  'tree-jump-left-vert': { defId: 'treeJump', variant: 'left-vert', vertical: true },
  'tree-jump-right-vert': { defId: 'treeJump', variant: 'right-vert', vertical: true },
  'tree-trip-left': { defId: 'treeTrip', variant: 'left', vertical: false },
  'tree-trip-right': { defId: 'treeTrip', variant: 'right', vertical: false },
  'tree-trip-left-vert': { defId: 'treeTrip', variant: 'left-vert', vertical: true },
  'tree-trip-right-vert': { defId: 'treeTrip', variant: 'right-vert', vertical: true },
  'tree-slide': { defId: 'treeSlide', variant: 'horizontal', vertical: false },
  'tree-slide-vert': { defId: 'treeSlide', variant: 'vertical', vertical: true },
  'flame-tower': { defId: 'flameTower', variant: 'horizontal', vertical: false },
  'flame-tower-vert': { defId: 'flameTower', variant: 'vertical', vertical: true },
  'pit': { defId: 'pit', variant: 'horizontal', vertical: false },
  'plank-beam': { defId: 'plankBeam', variant: 'native-vertical', vertical: true },
  'plank-pit': { defId: 'plankPit', variant: 'native-vertical', vertical: true },
  'pit-vert': { defId: 'pit', variant: 'vertical', vertical: true },
  'pit-long-a': { defId: 'pitLongA', variant: 'horizontal', vertical: false },
  'pit-long-b': { defId: 'pitLongB', variant: 'horizontal', vertical: false },
  'tower-arch': { defId: 'towerArch', variant: 'horizontal', vertical: false },
  'tower-arch-vert': { defId: 'towerArch', variant: 'vertical', vertical: true },
  'narrow-wall-left-a': { defId:'narrowWallLeftA',variant:'native',vertical:false },
  'narrow-wall-left-b': { defId:'narrowWallLeftB',variant:'native',vertical:false },
  'narrow-wall-right-a': { defId:'narrowWallRightA',variant:'native',vertical:false },
  'narrow-wall-right-b': { defId:'narrowWallRightB',variant:'native',vertical:false },
  'narrow-wall-left': { defId: 'narrowWallLeft', variant: 'left', vertical: false },
  'narrow-wall-right': { defId: 'narrowWallRight', variant: 'right', vertical: false },
  'narrow-beam-left': { defId: 'narrowBeamLeft', variant: 'left', vertical: false },
  'narrow-beam-right': { defId: 'narrowBeamRight', variant: 'right', vertical: false },
  'stone-pedestal': { defId: 'stonePedestal', variant: 'horizontal', vertical: false },
};

export const PLAYABLE_DEFS: readonly ObstacleDef[] = [
  DEFS.treeJump,
  DEFS.treeTrip,
  DEFS.treeSlide,
  DEFS.flameTower,
  DEFS.pit,
  DEFS.stonePedestal,
];

export const KIND_TO_DEF: Record<string, DefId> = {
  hurdle: 'treeJump',
  trip: 'treeTrip',
  arch: 'treeSlide',
  fire: 'flameTower',
  gap: 'pit',
  gapLong: 'pitLongA',
  block: 'stonePedestal',
};

export const laneHitboxX = (lane: number): readonly [number, number] => LANE_X[Math.max(0, Math.min(2, lane))];
