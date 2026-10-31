import { referenceJunctionDistance } from './referenceCoordinates';
import type { DefId } from './obstacles/catalog';
// Authored long narrow pieces are adjacent12m cells. Round the cluster anchor
// once; independent score interpolation can otherwise insert a missing cell.
const narrowClusters:readonly (readonly number[])[]=[[1719,1725],[1765,1771,1777],[1801,1807,1813],[2359,2363,2367]];
function referenceObstacleDistance(legacy:number):number {
 // Source006/007 branch projections plus first stumble7.2..7.3 constrain this
 // center better than the old score/20 bracket, which includes travel past it.
 // This is a reviewed physical fit, not a global change of grid phase.
 if(legacy===63)return 108;
 // Correct right-root variant, source018/019 crest and bent-root projection.
 // Physical fit: retain3m uncertainty rather than imply original generator phase.
 if(legacy===177)return 366;
 const cluster=narrowClusters.find(c=>c.includes(legacy));
 return cluster?referenceJunctionDistance(cluster[0])+12*cluster.indexOf(legacy):referenceJunctionDistance(legacy);
}


/** Video-derived legacy-coordinate estimates; native progress is not world length.
 * Converted to estimated physical centers on the12m grid; brackets remain original score/20 observations. */
export const REFERENCE_OPENING_OBSTACLES: ReadonlyArray<{
  legacyDistance: number; distance: number; defId: DefId; prefab: string; frames: readonly number[]; distanceBracket: readonly [number,number];
}> = ([
  { distance: 63, defId: 'treeTrip', prefab: 'tree-trip-left', frames: [6,7,8], distanceBracket: [56,66] },
  { distance: 141, defId: 'treeJump', prefab: 'tree-jump-left', frames: [14,15,16], distanceBracket: [133,143] },
  { distance: 177, defId: 'treeJump', prefab: 'tree-jump-right', frames: [18,19,20], distanceBracket: [162,182] },
  { distance: 213, defId: 'pit', prefab: 'pit', frames: [23,24,25], distanceBracket: [206,222] },
  { distance: 297, defId: 'pit', prefab: 'pit', frames: [34,35,36], distanceBracket: [295,310] },
  { distance: 393, defId: 'pit', prefab: 'pit', frames: [45,46,47], distanceBracket: [383,399] },
  { distance: 417, defId: 'pit', prefab: 'pit', frames: [48,49,50], distanceBracket: [406,428] },
  { distance: 453, defId: 'pit', prefab: 'pit', frames: [53,54,55], distanceBracket: [443,458] },
  { distance: 477, defId: 'pit', prefab: 'pit', frames: [56,57,58], distanceBracket: [466,490] },
  { distance: 513, defId: 'pit', prefab: 'pit', frames: [61,62,63], distanceBracket: [507,524] },
  { distance: 549, defId: 'pit', prefab: 'pit', frames: [64,65,66], distanceBracket: [532,550] },
  { distance: 633, defId: 'plankPit', prefab: 'plank-pit', frames: [76,77,78], distanceBracket: [628,644] },
  { distance: 681, defId: 'plankBeam', prefab: 'plank-beam', frames: [81,82,83], distanceBracket: [673,692] },
  { distance: 717, defId: 'plankBeam', prefab: 'plank-beam', frames: [84,85,86], distanceBracket: [701,720] },
  { distance: 745, defId: 'plankBeam', prefab: 'plank-beam', frames: [87,88,89], distanceBracket: [730,749] },
  { distance: 777, defId: 'plankBeam', prefab: 'plank-beam', frames: [90,91,92], distanceBracket: [759,778] },
  { distance: 817, defId: 'plankPit', prefab: 'plank-pit', frames: [95,96,97], distanceBracket: [808,828] },
  { distance: 857, defId: 'plankBeam', prefab: 'plank-beam', frames: [99,100,101], distanceBracket: [848,868] },
  { distance: 887, defId: 'plankBeam', prefab: 'plank-beam', frames: [102,103,104], distanceBracket: [878,898] },
  { distance: 937, defId: 'plankPit', prefab: 'plank-pit', frames: [107,108,109], distanceBracket: [929,949] },
  { distance: 1007, defId: 'treeSlide', prefab: 'tree-slide', frames: [114,115,116], distanceBracket: [997,1014] },
  { distance: 1031, defId: 'flameTower', prefab: 'flame-tower', frames: [116,117,118,119], distanceBracket: [1014,1039] },
  { distance: 1271, defId: 'treeTrip', prefab: 'tree-trip-right', frames: [143,144,145], distanceBracket: [1258,1277] },
  { distance: 1335, defId: 'treeJump', prefab: 'tree-jump-right', frames: [147, 148, 149], distanceBracket: [1321, 1339] },
  { distance: 1371, defId: 'pit', prefab: 'pit', frames: [152, 153], distanceBracket: [1363, 1379] },
  { distance: 1397, defId: 'pit', prefab: 'pit', frames: [155, 156], distanceBracket: [1391, 1400] },
  { distance: 1427, defId: 'treeSlide', prefab: 'tree-slide', frames: [158, 159, 160], distanceBracket: [1417, 1437] },
  { distance: 1455, defId: 'flameTower', prefab: 'flame-tower', frames: [160, 161, 162, 163], distanceBracket: [1440, 1463] },
  { distance: 1479, defId: 'flameTower', prefab: 'flame-tower', frames: [163, 164, 165], distanceBracket: [1463, 1483] },
  { distance: 1505, defId: 'flameTower', prefab: 'flame-tower', frames: [166, 167, 168], distanceBracket: [1492, 1511] },
  { distance: 1533, defId: 'pit', prefab: 'pit', frames: [169, 170, 171], distanceBracket: [1520, 1541] },
  { distance: 1565, defId: 'treeTrip', prefab: 'tree-trip-left', frames: [173, 174, 175], distanceBracket: [1559, 1577] },
  { distance: 1609, defId: 'flameTower', prefab: 'flame-tower', frames: [177, 178, 179, 180], distanceBracket: [1592, 1614] },
  { distance: 1627, defId: 'narrowBeamLeft', prefab: 'narrow-beam-left', frames: [180, 181, 182], distanceBracket: [1614, 1633] },
  { distance: 1669, defId: 'treeTrip', prefab: 'tree-trip-left', frames: [183, 184, 185], distanceBracket: [1664, 1681] },
  { distance: 1697, defId: 'narrowBeamLeft', prefab: 'narrow-beam-left', frames: [186, 187, 188], distanceBracket: [1689, 1703] },
  { distance: 1719, defId: 'narrowWallLeftB', prefab: 'narrow-wall-left-b', frames: [189,190,191], distanceBracket: [1711,1733] },
  { distance: 1725, defId: 'narrowWallLeftA', prefab: 'narrow-wall-left-a', frames: [190,191], distanceBracket: [1718,1733] },
  { distance: 1731, defId: 'treeTrip', prefab: 'tree-trip-right', frames: [191, 192], distanceBracket: [1725, 1739] },
  { distance: 1765, defId: 'narrowWallRightB', prefab: 'narrow-wall-right-b', frames: [195, 196, 197], distanceBracket: [1756, 1779] },
  { distance: 1771, defId: 'narrowWallRight', prefab: 'narrow-wall-right', frames: [195, 196, 197], distanceBracket: [1756, 1779] },
  { distance: 1777, defId: 'narrowWallRightA', prefab: 'narrow-wall-right-a', frames: [195, 196, 197], distanceBracket: [1756, 1779] },
  { distance: 1783, defId: 'treeTrip', prefab: 'tree-trip-right', frames: [197, 198, 199], distanceBracket: [1774, 1788] },
  { distance: 1801, defId: 'narrowWallRightB', prefab: 'narrow-wall-right-b', frames: [200, 201, 202], distanceBracket: [1796, 1817] },
  { distance: 1807, defId: 'narrowWallRight', prefab: 'narrow-wall-right', frames: [200, 201, 202], distanceBracket: [1796, 1817] },
  { distance: 1813, defId: 'narrowWallRightA', prefab: 'narrow-wall-right-a', frames: [200, 201, 202], distanceBracket: [1796, 1817] },
  { distance: 1817, defId: 'treeJump', prefab: 'tree-jump-left', frames: [201, 202, 203], distanceBracket: [1804, 1821] },
  { distance: 1841, defId: 'pit', prefab: 'pit', frames: [204, 205, 206], distanceBracket: [1831, 1848] },
  { distance: 1877, defId: 'flameTower', prefab: 'flame-tower', frames: [207, 208, 209], distanceBracket: [1866, 1882] },
  { distance: 1897, defId: 'narrowBeamRight', prefab: 'narrow-beam-right', frames: [210, 211, 212], distanceBracket: [1887, 1903] },
  { distance: 1911, defId: 'plankPit', prefab: 'plank-pit', frames: [212, 213, 214], distanceBracket: [1903, 1917] },
  { distance: 1949, defId: 'plankPit', prefab: 'plank-pit', frames: [217, 218, 219], distanceBracket: [1943, 1959] },
  { distance: 1983, defId: 'plankBeam', prefab: 'plank-beam', frames: [220, 221, 222], distanceBracket: [1970, 1989] },
  { distance: 1999, defId: 'plankPit', prefab: 'plank-pit', frames: [222, 223, 224], distanceBracket: [1989, 2007] },
  { distance: 2027, defId: 'plankBeam', prefab: 'plank-beam', frames: [225, 226, 227], distanceBracket: [2017, 2035] },
  { distance: 2055, defId: 'plankPit', prefab: 'plank-pit', frames: [228, 229, 230], distanceBracket: [2045, 2064] },
  { distance: 2083, defId: 'plankPit', prefab: 'plank-pit', frames: [231, 232, 233], distanceBracket: [2074, 2093] },
  { distance: 2123, defId: 'plankPit', prefab: 'plank-pit', frames: [235, 236, 237], distanceBracket: [2113, 2132] },
  { distance: 2143, defId: 'plankBeam', prefab: 'plank-beam', frames: [237, 238, 239], distanceBracket: [2132, 2152] },
  { distance: 2261, defId: 'treeTrip', prefab: 'tree-trip-left', frames: [250, 251, 252], distanceBracket: [2252, 2265] },
  { distance: 2287, defId: 'treeSlide', prefab: 'tree-slide', frames: [253, 254, 255], distanceBracket: [2273, 2291] },
  { distance: 2307, defId: 'flameTower', prefab: 'flame-tower', frames: [255, 256, 257, 258], distanceBracket: [2291, 2319] },
  { distance: 2327, defId: 'narrowBeamRight', prefab: 'narrow-beam-right', frames: [258, 259, 260], distanceBracket: [2319, 2340] },
  { distance: 2359, defId: 'narrowWallLeftB', prefab: 'narrow-wall-left-b', frames: [261, 262], distanceBracket: [2350, 2390] },
  { distance: 2363, defId: 'narrowWallLeft', prefab: 'narrow-wall-left', frames: [261, 262], distanceBracket: [2350, 2390] },
  { distance: 2367, defId: 'narrowWallLeft', prefab: 'narrow-wall-left', frames: [261, 262], distanceBracket: [2350, 2390] },
] as const).map(obstacle=>({...obstacle,legacyDistance:obstacle.distance,distance:referenceObstacleDistance(obstacle.distance)}));
/** 261–262 show the final half-road continuing to the fog horizon, with no
 * return to full width. Extend its visible surface by eight native12m tiles.
 * This is a visibility lower bound/buffer, not the recovered end of the stretch;
 * no source score-coordinate positions are invented for these distant tiles.
 */
export const REFERENCE_FINAL_NARROW_CONTINUATION = Array.from({length:8},(_,i)=>({
  distance:REFERENCE_OPENING_OBSTACLES.at(-1)!.distance+12*(i+1),
  defId:'narrowWallLeft' as const,prefab:'narrow-wall-left',frames:[261,262] as const,
}));
export const REFERENCE_VISIBLE_OBSTACLES = [
  ...REFERENCE_OPENING_OBSTACLES,...REFERENCE_FINAL_NARROW_CONTINUATION,
];

// Keep unreviewed random content outside the camera view of the last reviewed frame.
export const REFERENCE_RANDOM_OBSTACLES_FROM = referenceJunctionDistance(2433);

/** These native obstacles already contain a full trunk; avoid an extra periodic tree. */
export function overlapsReferenceTree(distance: number): boolean {
  return REFERENCE_OPENING_OBSTACLES.some(obstacle=>obstacle.defId.startsWith('tree') && Math.abs(obstacle.distance-distance)<24);
}
