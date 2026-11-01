import {readFileSync,readdirSync,statSync} from 'node:fs';
import {createHash} from 'node:crypto';
import assert from 'node:assert/strict';
const root='target/temple-run/web/public/screenshots/BV1ypuKzPErT';
const frames=JSON.parse(readFileSync(root+'/frames.json','utf8'))as Array<{second:number;image:string;sourceSHA256:string;deliverySHA256:string}>;
assert.equal(frames.length,271);
const hash=(p:string)=>createHash('sha256').update(readFileSync(p)).digest('hex');
for(const [i,f]of frames.entries()){
 assert.equal(f.second,i);assert.match(f.image,/^\d{3}\.webp$/);assert.equal(hash(root+'/'+f.image),f.deliverySHA256);
 assert.equal(hash(`docs/screenshots/BV1ypuKzPErT/${String(i).padStart(3,'0')}.jpg`),f.sourceSHA256);
}
const pages=readdirSync(root).filter(f=>f.endsWith('.html'));assert.equal(pages.length,17);
let total=0;for(const page of pages){const s=readFileSync(root+'/'+page,'utf8');const imgs=[...s.matchAll(/<img[^>]+src="([^"]+)"/g)];total+=imgs.length;assert.ok(imgs.length<=18);for(const m of imgs){assert.ok(statSync(root+'/'+m[1]).isFile());assert.ok(m[0].includes('loading="lazy"'));}}
assert.equal(total,271);console.log('Video reference:271 source/delivery hashes,16 appendix pages + evidence redirect,18 frames/page and lazy loading pass.');
