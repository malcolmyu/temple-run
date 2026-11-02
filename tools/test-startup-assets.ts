import {readFileSync} from 'node:fs';
import {createHash} from 'node:crypto';
import {gzipSync} from 'node:zlib';
import assert from 'node:assert/strict';
import manifest from '../target/temple-run/web/src/game/startupAssets.generated.json';
const pub='target/temple-run/web/public/';
const raw=readFileSync(pub+manifest.pack);const pack=JSON.parse(raw.toString());
assert.ok(manifest.pack.includes(createHash('sha256').update(raw).digest('hex').slice(0,12)));
assert.ok(gzipSync(raw).length<125000,'Opening pack must fit the measured transfer budget');
for(const [path,hash]of Object.entries(manifest.sources))assert.equal(createHash('sha256').update(readFileSync(pub+path)).digest('hex'),hash);
for(const [path,value]of Object.entries(pack.models)as Array<[string,{obj:string;uv:number[]|null}]>){
 const source=readFileSync(pub+path,'utf8');
 const points=source.split('\n').filter(l=>l.startsWith('v ')).map(l=>l.split(/\s+/).slice(1,4).map(Number));
 const authored=new Set(points.map(p=>p.map(n=>Math.round(n*1e4)/1e4).join(',')));
 for(const line of value.obj.split('\n').filter(l=>l.startsWith('v ')))assert.ok(authored.has(line.split(/\s+/).slice(1,4).map(n=>Math.round(Number(n)*1e4)/1e4).join(',')),`Unsupported new vertex:${path}`);
 const faces=value.obj.split('\n').filter(l=>l.startsWith('f ')).length;
 if(value.uv)assert.equal(value.uv.length,faces*6,`UV1 triangle order:${path}`);
}
for(const name of ['temple-road-tile','stone-turn-a','stone-turn-b','temple-t-junction','plank-road-tile','plank-t-junction','cliff-road-tile','cliff-t-down'])assert.ok(pack.models[`assets/track/${name}.obj`].obj.includes('f '),`Missing structural floor:${name}`);
console.log('Opening pack: hashed payload <125KB gzip, source texture hashes, native-only vertices, UV1 order and structural floors pass.');
