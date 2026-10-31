import assert from 'node:assert/strict';
import {readFileSync} from 'node:fs';
import * as THREE from 'three';
import {OBJLoader} from 'three/addons/loaders/OBJLoader.js';
import {buildSceneryTree,type Assets} from '../target/temple-run/web/src/game/render';
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
assert.equal(referenceAmbientTree(84)?.side,1);assert.equal(referenceAmbientTree(444)?.side,1);
for(const d of [48,228,408])assert.equal(referenceAmbientTree(d),null,'remove unsupported periodic opening trunks');
assert.equal(referenceAmbientTree(REFERENCE_TREE_REVIEW_END+12),undefined,'unreviewed suffix is not claimed as source reconstruction');
