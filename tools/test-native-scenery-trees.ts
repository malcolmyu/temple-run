import assert from 'node:assert/strict';
import {readFileSync} from 'node:fs';
import * as THREE from 'three';
import {OBJLoader} from 'three/addons/loaders/OBJLoader.js';
import {buildSceneryTree,alignNativeSceneryRoots,type Assets} from '../target/temple-run/web/src/game/render';
import {attachNativeLightmapUV} from '../target/temple-run/web/src/game/nativeLightmap';
const manifest=JSON.parse(readFileSync('target/temple-run/analysis/native-scenery-trees/source.json','utf8'));
const trees=[];
for(let i=1;i<=4;i++){
 const base=`target/temple-run/web/public/assets/track/decor-tree-native-${i}`;
 const tree=new OBJLoader().parse(readFileSync(base+'.obj','utf8'));
 attachNativeLightmapUV(tree,JSON.parse(readFileSync(base+'.uv1.json','utf8')));
 tree.updateMatrixWorld(true);const box=new THREE.Box3().setFromObject(tree);
 assert.ok(box.min.y<-6.1,'authored roots reach below original water plane, not normalized to road');
 assert.ok(box.max.y>29&&box.max.y<33,'native world scale already baked');
 assert.equal(manifest.records[String(i)].prefabName,`treeAlone${i===1?'':i}_prefab`);
 assert.notEqual(manifest.records[String(i)].mesh,manifest.replacedLegacyAsset.mesh,'ambient tree must not be cliff slide obstacle');
 trees.push(tree);
}
const assets={tree:trees[0],standaloneTrees:trees} as unknown as Assets;
for(let i=0;i<4;i++){
 const tree=buildSceneryTree(assets,1,i)!;
 assert.deepEqual(tree.scale.toArray(),[1,1,1],'full prefab must not get a second.12 scale');
 assert.equal(tree.position.y,0,'preserve authored submerged base instead of arbitrary-2 sink');
 assert.equal(tree.userData.nativeTreeVariant,i+1);
}
console.log('Four standalone tree prefabs: original scale/pivot, submerged roots, native UV1 and correct asset family. Spawn layout remains fitted.');

import {referenceAmbientTree,REFERENCE_TREE_REVIEW_END} from '../target/temple-run/web/src/game/referenceScenery';
assert.equal(referenceAmbientTree(84),null,'first obstacle supplies its own trunk; no duplicate ambient tree');assert.equal(referenceAmbientTree(444)?.side,1);
for(const d of [48,228,408])assert.equal(referenceAmbientTree(d),null,'remove unsupported periodic opening trunks');
assert.equal(referenceAmbientTree(REFERENCE_TREE_REVIEW_END+12),undefined,'unreviewed suffix is not claimed as source reconstruction');

for(const heading of [0,Math.PI/2,Math.PI,-Math.PI/2])for(const roadY of [0,-3])for(const side of [-1,1]){
 const road=new THREE.Group();road.position.set(20,roadY,30);road.rotation.y=heading;
 const tree=buildSceneryTree(assets,side)!;road.add(tree);alignNativeSceneryRoots(road);road.updateMatrixWorld(true);
 const q=tree.getWorldQuaternion(new THREE.Quaternion());
 assert.ok(q.angleTo(new THREE.Quaternion())<1e-7,'native scenery root retains zero world Euler under every road heading');
 assert.ok(Math.abs(tree.getWorldPosition(new THREE.Vector3()).y)<1e-7,'native scenery root is independent of stone/wood height');
}
console.log('Native scenery roots preserve world orientation and Y0 under all four road headings and both ground heights.');

import {referenceJunctionTrees} from '../target/temple-run/web/src/game/referenceScenery';
import {REFERENCE_OPENING_TURNS} from '../target/temple-run/web/src/game/referenceRoute';
const treesAtThird=referenceJunctionTrees(2,REFERENCE_OPENING_TURNS[2].distance);
assert.deepEqual(treesAtThird,[{variant:0,ahead:10},{variant:2,ahead:22}]);
assert.equal(referenceJunctionTrees(2,900).length,1,'custom route does not inherit source tree cluster');
assert.equal(referenceJunctionTrees(3,REFERENCE_OPENING_TURNS[3].distance).length,1,'unreviewed T keeps its existing provisional tree');
