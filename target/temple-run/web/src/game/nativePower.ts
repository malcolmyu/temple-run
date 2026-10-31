import * as THREE from 'three';
import frames from './nativePickupFrames.json';
import type { PickupKind } from './components';

type NativePowerKind = keyof typeof frames.icons;
function selectFrame(texture: THREE.Texture, rect: readonly number[]): void {
  const [x,y,w,h]=rect;
  texture.repeat.set(w/frames.atlasSize[0],h/frames.atlasSize[1]);
  texture.offset.set(x/frames.atlasSize[0],1-(y+h)/frames.atlasSize[1]);
}
function sprite(atlas: THREE.Texture, rect: readonly number[], size: readonly number[]): THREE.Sprite {
  const map=atlas.clone();
  selectFrame(map,rect);
  map.needsUpdate=true;
  const result=new THREE.Sprite(new THREE.SpriteMaterial({map,transparent:true,depthWrite:false,
    toneMapped:false,fog:false,premultipliedAlpha:true}));
  result.scale.set(size[0],size[1],1);
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
  sparkle.renderOrder=1;
  group.add(icon,sparkle);
  return group;
}
export function updateNativePower(group: THREE.Object3D, elapsed: number): void {
  const sparkle=group.getObjectByName('native-pickup-sparkle') as THREE.Sprite|undefined;
  if(!sparkle)return;
  selectFrame(sparkle.material.map!,frames.sparkles[Math.floor(elapsed*frames.fps)%frames.sparkles.length]);
}
