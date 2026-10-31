import * as THREE from 'three';

// sharedassets0: Safety Net Visual193, Sprite216, UISpriteFrameAnimation1966.
// Pixel rectangles from UIAtlas1957; safetyNet1.png ... safetyNet5.png, 15 FPS.
export const SAFETY_NET_FRAMES = [[166,568],[166,326],[84,568],[84,326],[2,568]] as const;
export function makeSafetyNet(atlas: THREE.Texture): THREE.Mesh {
  const texture=atlas.clone();
  texture.repeat.set(80/1024,240/1024);
  texture.needsUpdate=true;
  const net=new THREE.Mesh(new THREE.PlaneGeometry(4,12),new THREE.MeshBasicMaterial({map:texture,transparent:true,depthWrite:false,side:THREE.DoubleSide}));
  net.name='native-safety-net';net.rotation.x=-Math.PI/2;net.visible=false;
  setSafetyNetFrame(net,0);
  return net;
}
export function setSafetyNetFrame(net: THREE.Mesh, seconds: number): void {
  const [x,y]=SAFETY_NET_FRAMES[Math.floor(Math.max(0,seconds)*15)%SAFETY_NET_FRAMES.length];
  const texture=(net.material as THREE.MeshBasicMaterial).map!;
  texture.offset.set(x/1024,1-(y+240)/1024);
}
