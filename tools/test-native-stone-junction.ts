import assert from 'node:assert/strict';
import {readFileSync} from 'node:fs';
import * as THREE from 'three';
import {OBJLoader} from 'three/examples/jsm/loaders/OBJLoader.js';
import {buildJunction} from '../target/temple-run/web/src/game/render';
import {TrackPath} from '../target/temple-run/web/src/game/path';
import {attachNativeLightmapUV} from '../target/temple-run/web/src/game/nativeLightmap';
const load=(name:string)=>{const p='target/temple-run/web/public/assets/track/'+name;const obj=new OBJLoader().parse(readFileSync(p+'.obj','utf8'));attachNativeLightmapUV(obj,JSON.parse(readFileSync(p+'.uv1.json','utf8')));return obj;};
const assets:any={roadTile:load('temple-road-tile'),stoneCornerLeft:load('stone-turn-a'),stoneCornerRight:load('stone-turn-b')};
for(const direction of [-1,1]as const){
 const group=buildJunction(assets,direction,new TrackPath(),0);group.updateMatrixWorld(true);
 assert.ok(group.getObjectByName('native-stone-corner'));assert.equal(group.children.length,3);
 const hit=(x:number,z:number)=>new THREE.Raycaster(new THREE.Vector3(x,.1,z+3),new THREE.Vector3(0,-1,0),0,.2).intersectObject(group,true);
 for(let d=0;d<11.9;d+=.25){assert.ok(hit(0,d).length,`incoming gap at${d}`);assert.ok(hit(direction*d,0).length,`outgoing gap at${d}`);}
 assert.equal(hit(direction*8,8).length,0,'native turn inner corner remains water');
 group.traverse(o=>{if(!(o as THREE.Mesh).isMesh)return;const mesh=o as THREE.Mesh;assert.ok(mesh.userData.walkableSurface);assert.equal(mesh.geometry.getAttribute('uv1').count,mesh.geometry.getAttribute('position').count);});
}
console.log('Native stone junctions: both directions continuous0..12m, open inner bend, authored-only meshes and matching UV1 after connector clipping');
