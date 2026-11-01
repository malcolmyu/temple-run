import assert from 'node:assert/strict';
import { readFileSync } from 'node:fs';
import { OBJLoader } from 'three/addons/loaders/OBJLoader.js';
import * as THREE from 'three';
import { buildJunction } from '../target/temple-run/web/src/game/render';
import { TrackPath } from '../target/temple-run/web/src/game/path';
// A texture crop only needs a canvas draw target for geometry tests.
(globalThis as any).document={createElement:()=>({getContext:()=>({drawImage(){}})})};
const material=new THREE.MeshBasicMaterial();
const texture=new THREE.Texture({width:1024,height:1024} as any);
const assets:any={texture:{wall:texture},material:{stone:material,facade:material}};
for(const direction of [-1,1] as const){
 const corner=buildJunction(assets,direction,new TrackPath(),0);
 corner.updateMatrixWorld(true);
 const decks=corner.children.filter((o:any)=>o.geometry?.type==='PlaneGeometry');
 assert.equal(decks.length,3);
 const area=decks.reduce((sum:number,o:any)=>sum+o.geometry.parameters.width*o.geometry.parameters.height,0);
 assert.equal(area,96);
 const hits=(x:number,z:number)=>new THREE.Raycaster(new THREE.Vector3(x,10,z+3),new THREE.Vector3(0,-1,0)).intersectObjects(decks);
 assert.ok(hits(0,8).length,'incoming arm must remain paved');
 assert.ok(hits(direction*8,0).length,'outgoing arm must remain paved');
 assert.equal(hits(direction*8,8).length,0,'inner corner must show water');
 assert.equal(corner.children.some((o:any)=>o.isSprite||o.geometry?.type==='TorusGeometry'),false);
}
console.log('Left/right junctions: continuous arms, open inner corner, no plaza decorations');

assets.corner=new OBJLoader().parse(readFileSync('target/temple-run/web/public/assets/track/track-wall-corner-a.obj','utf8'));
for(const direction of [-1,1] as const){
 const corner=buildJunction(assets,direction,new TrackPath(),0);
 assert.ok(corner.getObjectByName('original-stone-corner'));
 corner.updateMatrixWorld(true);
 for(const [x,z] of [[0,0],[0,3],[direction*3,0]]){
  const hits=new THREE.Raycaster(new THREE.Vector3(x,10,z+3),new THREE.Vector3(0,-1,0)).intersectObject(corner,true);
  assert.ok(hits.length,'original corner must cover the walking axis');
  assert.ok(hits[0].point.y<.3 && hits[0].point.y>-.1,`corner road axis intersects wall or missing floor at ${x},${z}: ${hits[0].point.y}`);
 }
}
console.log('Original corner: left/right road axes stay paved and clear of parapets');
assets.plankCorner=new OBJLoader().parse(readFileSync('target/temple-run/web/public/assets/track/plank-corner.obj','utf8'));
assets.plankTile=new OBJLoader().parse(readFileSync('target/temple-run/web/public/assets/track/plank-road-tile.obj','utf8'));
for(const object of [assets.plankCorner,assets.plankTile])object.traverse((o:any)=>{if(o.isMesh)o.material.side=THREE.DoubleSide;});
for(const direction of [-1,1] as const){
 const corner=buildJunction(assets,direction,new TrackPath(),0,'wood');corner.updateMatrixWorld(true);
 for(const [x,z]of [[0,0],[0,3],[direction*3,0],[0,9],[direction*9,0]]){
  // Authored missing boards are decorative; sample a small foot area rather
  // than requiring the exact center ray to miss every original board seam.
  let supported=false;
  for(const dx of [-.3,0,.3])for(const dz of [-.3,0,.3]){
   const hits=new THREE.Raycaster(new THREE.Vector3(x+dx,5,z+dz+3),new THREE.Vector3(0,-1,0)).intersectObject(corner,true);
   if(hits.some(hit=>Math.abs(hit.point.y)<.2))supported=true;
  }
  assert.ok(supported,`wood corner missing road near ${direction}:${x},${z}`);
 }
}
console.log('Native wooden corners: both directions, center and connecting arms are paved');
