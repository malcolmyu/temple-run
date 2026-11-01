/** Recovered SceneryManager.Simulate lifecycle in native world axes.
 * RNG is injected: source Unity random state has not been recovered.
 * Not yet connected to rendering; do not replace reference placements with a guessed seed.
 */
export type ScenerySlot = { assigned: boolean; visible: boolean; cellX: number; cellZ: number; x: number; z: number };
export type SceneryRandom = (minInclusive: number, maxExclusive: number) => number;
export class NativeSceneryGrid {
  readonly slots: ScenerySlot[] = Array.from({length:361},()=>({assigned:false,visible:false,cellX:0,cellZ:0,x:0,z:0}));
  private lastX = -99999;
  private lastZ = -99999;
  constructor(private readonly random: SceneryRandom, readonly density = .25) {}
  simulate(cameraX: number,cameraZ: number,roadPoints: ReadonlyArray<readonly [number,number]>,force=false): boolean {
    const cx=Math.trunc(cameraX/12),cz=Math.trunc(cameraZ/12);
    if(!force&&cx===this.lastX&&cz===this.lastZ)return false;
    this.lastX=cx;this.lastZ=cz;
    const minX=cx-9,maxX=cx+9,minZ=cz-9,maxZ=cz+9;
    const occupied=new Set(roadPoints.map(([x,z])=>`${Math.trunc(x/12)},${Math.trunc(z/12)}`));
    // Assignment persists independently of GameObject visibility/density result.
    for(const s of this.slots)if(s.assigned&&(s.cellX<minX||s.cellX>maxX||s.cellZ<minZ||s.cellZ>maxZ||occupied.has(`${s.cellX},${s.cellZ}`))){s.assigned=false;s.visible=false;}
    const retained=new Set(this.slots.filter(s=>s.assigned).map(s=>`${s.cellX},${s.cellZ}`));
    for(let x=minX;x<=maxX;x++)for(let z=minZ;z<=maxZ;z++){
      const key=`${x},${z}`;
      if(retained.has(key)||occupied.has(key))continue;
      // ARM unsigned compares: raw Z in [0,240], raw X in [-60,60].
      if(z>=0&&z<=4&&x>=-1&&x<=1)continue;
      const slot=this.slots.find(s=>!s.assigned);if(!slot)continue;
      slot.assigned=true;slot.cellX=x;slot.cellZ=z;
      slot.x=x*12+(this.random(0,21)-10)*.2;
      slot.z=z*12+(this.random(0,21)-10)*.2;
      slot.visible=Math.fround(this.random(0,1000)/1000)<Math.fround(this.density);
    }
    return true;
  }
}

/** Start fixes a resource per pool slot once; recycling does not choose a new variant.
 * Resource names resolved independently from IL2CPP encoded string literals.
 * 17/18 use a fixed resource but share native Type=1 with trees.
 */
export type NativeSceneryResource = { type: 1|2|3|4|5; group: 'tree'|'group2'|'group3'|'fixedType1'|'fixedType5'|'fixedType4'; variant: number };
export function initializeSceneryResources(random: SceneryRandom): NativeSceneryResource[] {
  return Array.from({length:361},()=>{
    const roll=random(0,21);
    if(roll<=10)return {type:1,group:'tree',variant:random(0,4)};
    if(roll<=14)return {type:2,group:'group2',variant:random(0,3)};
    if(roll<=16)return {type:3,group:'group3',variant:random(0,3)};
    if(roll<=18)return {type:1,group:'fixedType1',variant:0};
    if(roll===19)return {type:5,group:'fixedType5',variant:0};
    return {type:4,group:'fixedType4',variant:0};
  });
}

/** Order matches native Start string arrays, not alphabetical asset order. */
export const NATIVE_SCENERY_RESOURCES: Readonly<Record<NativeSceneryResource['group'],readonly string[]>> = {
 tree:['Trees/treeAlone','Trees/treeAlone2','Trees/treeAlone3','Trees/treeAlone4'],
 group2:['Trees/rock','Trees/rock2','Trees/rock3'],
 group3:['Trees/cliff','Trees/cliff2','Trees/cliff3'],
 fixedType1:['Trees/overgrowthTrees'],
 fixedType5:['Trees/templeHead'],
 fixedType4:['Trees/groundPatchTemple'],
};
export function sceneryResourcePath(resource: NativeSceneryResource): string {
 return NATIVE_SCENERY_RESOURCES[resource.group][resource.variant];
}
