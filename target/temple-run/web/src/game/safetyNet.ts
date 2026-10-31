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

/** GameController.HandleInvincibility 0x1270b14: last 2.5 seconds dim all RGBA
 * channels at 2/second, wrapping to white when the next value is <= zero. */
export function safetyNetIntensity(previous: number, remaining: number, dt: number): number {
  if (remaining > 2.5 || remaining <= 0) return 1;
  const value = Math.fround(Math.fround(previous) - Math.fround(Math.fround(dt) * 2));
  return value > 0 ? value : 1;
}

export function setSafetyNetIntensity(net: THREE.Mesh, value: number): void {
  const material = net.material as THREE.MeshBasicMaterial;
  material.color.setRGB(value, value, value);
  material.opacity = value;
}
