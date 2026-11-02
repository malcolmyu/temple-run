import assert from 'node:assert/strict';
import {readFileSync} from 'node:fs';
import {createHash} from 'node:crypto';
import {replaceVisualTextures} from '../target/temple-run/web/src/game/visualTextures';
import * as THREE from 'three';
import ktx from '../target/temple-run/web/src/game/ktxAssets.generated.json';
const pub='target/temple-run/web/public/';
for(const [source,row]of Object.entries(ktx.textures)){
 const b=readFileSync(pub+row.path);
 assert.ok(row.path.includes(createHash('sha256').update(b).digest('hex').slice(0,12)));
 assert.deepEqual([...b.subarray(0,12)],[171,75,84,88,32,50,48,187,13,10,26,10]);
 assert.equal(b.readUInt32LE(20),row.width);assert.equal(b.readUInt32LE(24),row.height);
 assert.ok(b.readUInt32LE(40)>1,'Mipmaps required');assert.equal(b.length,row.bytes);
 assert.equal(createHash('sha256').update(readFileSync(pub+source)).digest('hex'),row.sourceHash);
}
const old=new THREE.Texture();old.userData.sourceAsset='wall';old.colorSpace=THREE.NoColorSpace;old.repeat.set(2,3);
const next=new THREE.CompressedTexture([],4,4);next.colorSpace=THREE.SRGBColorSpace;
const material=new THREE.ShaderMaterial({uniforms:{mainTexture:{value:old}}});
assert.equal(replaceVisualTextures([material],new Map([['wall',next]])),1);
const value=material.uniforms.mainTexture.value as THREE.Texture;
assert.notEqual(value,old);assert.equal(value.colorSpace,THREE.NoColorSpace);assert.deepEqual(value.repeat.toArray(),[2,3]);
console.log('KTX2 hash/mips/dimensions/source; live shader replacement preserves native Gamma and UV transforms.');
