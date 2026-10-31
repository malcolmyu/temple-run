import assert from 'node:assert/strict';
import {readFileSync} from 'node:fs';
import * as THREE from 'three';
import {OBJLoader} from 'three/examples/jsm/loaders/OBJLoader.js';
import {nativeCliffSupported,CLIFF_MESH_Y} from '../target/temple-run/web/src/game/nativeCliff';
import {buildTile,type Assets} from '../target/temple-run/web/src/game/render';
import {attachNativeLightmapUV} from '../target/temple-run/web/src/game/nativeLightmap';
for(const side of [-1.3,0,1.3])assert.ok(nativeCliffSupported(side));
for(const side of [-1.301,1.301,-1.9,1.9])assert.equal(nativeCliffSupported(side),false);
const cliff=new OBJLoader().parse(readFileSync('target/temple-run/web/public/assets/track/cliff-road-tile.obj','utf8'));
attachNativeLightmapUV(cliff,JSON.parse(readFileSync('target/temple-run/web/public/assets/track/cliff-road-tile.uv1.json','utf8')));
const assets={cliffTile:cliff,roadTile:new THREE.Group()} as Assets;
const tile=buildTile(assets,0,0,'cliff');
assert.equal(tile.children.length,1);assert.equal(tile.userData.nativeCliff,true);
const model=tile.children[0];assert.equal(model.name,'native-cliff-straight');assert.equal(model.position.y,CLIFF_MESH_Y);
let count=0;model.traverse(o=>{if((o as THREE.Mesh).isMesh){assert.equal(o.userData.walkableSurface,true);count++;}});assert.ok(count>0);
const box=new THREE.Box3().setFromObject(model);assert.ok(box.max.y<.01&&box.max.y>-.1,'template floor is relative0 before parent world placement');
assert.equal(cliff.position.y,0,'shared original is not moved by a tile instance');
console.log('Cliff:three lane centres supported, analogue edges fall, authored geometry/UV selected, normalized floor and shared source preserved');

const {buildJunction}=await import('../target/temple-run/web/src/game/render');
const {TrackPath}=await import('../target/temple-run/web/src/game/path');
const loadCorner=(letter:string)=>{
 const object=new OBJLoader().parse(readFileSync(`target/temple-run/web/public/assets/track/cliff-turn-${letter}.obj`,'utf8'));
 attachNativeLightmapUV(object,JSON.parse(readFileSync(`target/temple-run/web/public/assets/track/cliff-turn-${letter}.uv1.json`,'utf8')));return object;
};
assets.cliffCornerLeft=loadCorner('a');assets.cliffCornerRight=loadCorner('b');
for(const direction of [-1,1]as const){
 const junction=buildJunction(assets,direction,new TrackPath(),0,'stone','cliff');
 assert.equal(junction.userData.nativeCliffCorner,true);assert.equal(junction.children.length,3);
 assert.equal(junction.children[0].name,'native-cliff-corner');assert.equal(junction.children[0].position.y,-3);
 assert.equal(junction.children[1].position.z,9);assert.equal(junction.children[2].position.x,direction*9);
 for(const part of junction.children)assert.equal(part.position.y,-3);
}
const family=JSON.parse(readFileSync('target/temple-run/analysis/native-cliff-road/family.json','utf8'));
function inside(x:number,z:number,poly:number[][]){let yes=false;for(let i=0,j=poly.length-1;i<poly.length;j=i++){const a=poly[i],b=poly[j];if((a[1]>z)!==(b[1]>z)&&x<(b[0]-a[0])*(z-a[1])/(b[1]-a[1])+a[0])yes=!yes;}return yes;}
for(const [letter,sign]of [['A',-1],['B',1]]as const){
 const r=family.records.find((r:any)=>r.names.includes(`cliffTurn${letter}_prefab`));
 const poly=r.regions[0].pointsRaw.map(([x,z]:number[])=>[x*.2,-z*.2]);
 for(const[x,z]of [[0,0],[0,5.5],[sign*5.5,0],[-1.299,3],[1.299,3],[sign*3,-1.299],[sign*3,1.299]])assert.ok(inside(x,z,poly),`${letter} support ${x},${z}`);
 assert.equal(inside(sign*5,5,poly),false);assert.equal(inside(-sign*5,0,poly),false);
}
const {createHash}=await import('node:crypto');
for(const [folder,prefix]of [['native-corners','stone'],['native-cliff-corners','cliff']]){
 const source=JSON.parse(readFileSync(`target/temple-run/analysis/${folder}/source.json`,'utf8'));
 for(const letter of ['a','b','c','d'])assert.equal(createHash('sha256').update(readFileSync(`target/temple-run/web/public/assets/track/${prefix}-turn-${letter}.obj`)).digest('hex'),source.records[letter.toUpperCase()].objSHA256);
}
console.log('Cliff A/B corners:authored directions/support polygons, normalized connectors, separate prototypes and stone/cliff asset hashes pass');

const {buildTJunction}=await import('../target/temple-run/web/src/game/render');
assets.cliffTJunction=new OBJLoader().parse(readFileSync('target/temple-run/web/public/assets/track/cliff-t-down.obj','utf8'));
attachNativeLightmapUV(assets.cliffTJunction,JSON.parse(readFileSync('target/temple-run/web/public/assets/track/cliff-t-down.uv1.json','utf8')));
const tee=buildTJunction(assets,'stone','cliff');assert.equal(tee.userData.nativeCliffT,true);assert.equal(tee.children.length,3);
assert.deepEqual(tee.children.map(o=>o.position.y),[-3,-3,-3]);assert.deepEqual(tee.children.slice(1).map(o=>o.position.x),[-7.5,7.5]);
const down=family.records.find((r:any)=>r.names.includes('cliffTDown_prefab'));
const tpoly=down.regions[0].pointsRaw.map(([x,z]:number[])=>[x*.2,-z*.2]);
for(const[x,z]of [[0,0],[0,5.5],[-5.5,0],[5.5,0],[-1.299,3],[1.299,3]])assert.ok(inside(x,z,tpoly));
assert.equal(inside(0,-5,tpoly),false,'native T has no straight-ahead exit');
console.log('Cliff TDown:canonical incoming+Z, both exits, no forward exit and normalized independent geometry pass');

const {CoursePlan,setActiveCourse}=await import('../target/temple-run/web/src/game/coursePlan');
const {nativeMeshHeightAt}=await import('../target/temple-run/web/src/game/surface');
const heightPlan=new CoursePlan(1,489);heightPlan.surfaces.splice(0,heightPlan.surfaces.length,{kind:'stone',level:3,from:0,to:Infinity});setActiveCourse(heightPlan);
tile.position.y=nativeMeshHeightAt(100);tile.updateMatrixWorld(true);const worldBox=new THREE.Box3().setFromObject(tile);
assert.equal(tile.position.y,3);assert.ok(worldBox.max.y>2.9&&worldBox.max.y<3.01,'world cliff floor restores native3m');setActiveCourse(null);
console.log('Native cliff world elevation restored by3m parent and relative mesh template');

const {DEFS}=await import('../target/temple-run/web/src/game/obstacles/catalog');
const {collisionWouldHit}=await import('../target/temple-run/web/src/game/obstacles/collision');
const {buildObstacle}=await import('../target/temple-run/web/src/game/render');
const state={prevDistance:0,distance:0,laneIndex:1,side:0,jumpY:0,jumpV:0,slideRemaining:0,lastJumpAt:-100,lastSlideAt:-100,now:100,jumpWindow:0,slideWindow:0};
for(const side of [-1.3,0,1.3])for(const distance of [81.9,82,86,87,93,99,100,106,106.1]){
 const a=collisionWouldHit({def:DEFS.cliffGapA,lane:1,distance:88},{...state,distance,prevDistance:distance,side});
 const b=collisionWouldHit({def:DEFS.cliffGapB,lane:1,distance:100},{...state,distance,prevDistance:distance,side});
 assert.equal(a||b,distance>87&&distance<101,`paired cliff support ${side}/${distance}`);
}
assets.obstacles={};
assets.cliffCapA=new OBJLoader().parse(readFileSync('target/temple-run/web/public/assets/track/cliff-cap-a.obj','utf8'));assets.cliffCapB=new OBJLoader().parse(readFileSync('target/temple-run/web/public/assets/track/cliff-cap-b.obj','utf8'));
assets.cliffSlide=new OBJLoader().parse(readFileSync('target/temple-run/web/public/assets/track/cliff-tree-slide.obj','utf8'));
for(const[id,prefab,source]of [['cliffGapA','cliff-gap-a',assets.cliffCapA],['cliffGapB','cliff-gap-b',assets.cliffCapB],['treeSlide','cliff-tree-slide',assets.cliffSlide]]as const){
 const o=buildObstacle(assets,DEFS[id],prefab);assert.ok(o.children.length);assert.equal(o.children[0].position.y,-3);assert.equal(source.position.y,0);
}
assert.equal(DEFS.treeSlide.hitbox.y[1],1.6);
console.log('Cliff pool: paired14m ground gap across all lane centres; independent native templates and relative1.6m slide collider pass');
