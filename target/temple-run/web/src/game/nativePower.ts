import * as THREE from 'three';
import frames from './nativePickupFrames.json';
import type { PickupKind } from './components';

type NativePowerKind = keyof typeof frames.icons;
function selectFrame(texture: THREE.Texture, rect: readonly number[]): void {
  const [x,y,w,h]=rect;
  texture.repeat.set(w/frames.atlasSize[0],h/frames.atlasSize[1]);
  texture.offset.set(x/frames.atlasSize[0],1-(y+h)/frames.atlasSize[1]);
}
type PowerPlane = THREE.Mesh<THREE.PlaneGeometry, THREE.MeshBasicMaterial>;
const cameraUp=new THREE.Vector3(),cameraRotation=new THREE.Quaternion();
function sprite(atlas: THREE.Texture, rect: readonly number[], size: readonly number[]): PowerPlane {
  const map=atlas.clone();
  selectFrame(map,rect);
  map.needsUpdate=true;
  const result=new THREE.Mesh(new THREE.PlaneGeometry(1,1),new THREE.MeshBasicMaterial({map,transparent:true,depthWrite:false,side:THREE.DoubleSide,
    toneMapped:false,fog:false,premultipliedAlpha:true}));
  // Native world +Z maps to web -Z; reflect local X to retain native UI orientation.
  result.scale.set(-size[0],size[1],1);
  return result;
}
/** Original UISprite/FaceCamera pickup, not a lit geometric substitute. */
export function buildNativePower(kind: PickupKind, atlas: THREE.Texture): THREE.Group {
  const group=new THREE.Group();
  if(!(kind in frames.icons))return group;
  const icon=sprite(atlas,frames.icons[kind as NativePowerKind],frames.iconSizes[kind as NativePowerKind]);
  icon.name='native-pickup-icon';
  const sparkle=sprite(atlas,frames.sparkles[0],frames.sparkleSize);
  sparkle.name='native-pickup-sparkle';
  setSparkleFrame(sparkle,0);
  sparkle.renderOrder=1;
  group.add(icon,sparkle);
  return group;
}
/** UISpriteFrameAnimation calls UISprite.MakePixelPerfect after switching texture rect.
 * Preserve the atlas trimmed rectangle and its position in the original173x283 canvas. */
function setSparkleFrame(sparkle: PowerPlane, index: number): void {
  const rect=frames.sparkles[index], [left,right,top,bottom]=frames.sparklePadding[index];
  selectFrame(sparkle.material.map!,rect);
  sparkle.scale.set(-rect[2]*.02,rect[3]*.02,1);
  sparkle.position.set((right-left)*.01,(bottom-top)*.01,0);
}
export function updateNativePower(group: THREE.Object3D, elapsed: number, camera?: THREE.Camera): void {
  if(camera){
    camera.getWorldQuaternion(cameraRotation);
    group.up.copy(cameraUp.set(0,1,0).applyQuaternion(cameraRotation));
    group.lookAt(camera.getWorldPosition(cameraUp));
  }
  const sparkle=group.getObjectByName('native-pickup-sparkle') as PowerPlane|undefined;
  if(!sparkle)return;
  setSparkleFrame(sparkle,Math.floor(elapsed*frames.fps)%frames.sparkles.length);
}
