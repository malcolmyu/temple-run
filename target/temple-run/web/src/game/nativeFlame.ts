import * as THREE from 'three';
import source from './nativeFlameFrames.json';
function select(map:THREE.Texture,index:number):void {
 const [x,y,w,h]=source.frames[index];
 map.repeat.set(w/source.atlasSize[0],h/source.atlasSize[1]);
 map.offset.set(x/source.atlasSize[0],1-(y+h)/source.atlasSize[1]);
}
/** Original Flame Position/Flame UISprite, not substitute particle jets. */
export function buildNativeFlame(atlas:THREE.Texture):THREE.Mesh {
 const map=atlas.clone();select(map,0);map.needsUpdate=true;
 const material=new THREE.MeshBasicMaterial({map,transparent:true,depthWrite:false,
  toneMapped:false,fog:false,premultipliedAlpha:true,side:THREE.DoubleSide});
 const flame=new THREE.Mesh(new THREE.PlaneGeometry(...source.size as [number,number]),material);
 flame.name='native-flame';flame.position.fromArray(source.position);
 flame.scale.x=source.horizontalSign;return flame;
}
export function updateNativeFlame(object:THREE.Object3D,elapsed:number):void {
 const flame=object.getObjectByName('native-flame') as THREE.Mesh|undefined;
 if(flame)select((flame.material as THREE.MeshBasicMaterial).map!,Math.floor(elapsed*source.fps)%source.frames.length);
}
