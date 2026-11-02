import {readFileSync,existsSync} from 'node:fs';
import {createHash} from 'node:crypto';
import assert from 'node:assert/strict';
import {execFileSync} from 'node:child_process';
const root='target/temple-run/web/public/design-evidence/';
const doc=JSON.parse(readFileSync(root+'evidence.json','utf8'));
const content=JSON.parse(readFileSync('docs/design-evidence/content.json','utf8'));
const frames=JSON.parse(readFileSync('target/temple-run/web/public/screenshots/BV1ypuKzPErT/frames.json','utf8'));
const page=readFileSync(root+'index.html','utf8');
assert.equal(doc.sections.length,8);
assert.equal(doc.sourceCommit,content.sourceCommit);
const normalized=JSON.parse(JSON.stringify(doc));
for(const section of normalized.sections)for(const card of section.cards){for(const source of card.sources)delete source.sha256;for(const frame of card.frames){delete frame.sourceSHA256;delete frame.deliverySHA256;}}
assert.deepEqual(normalized,content,'Published evidence must match authored content');
assert.equal(readFileSync(root+'style.css','utf8'),readFileSync('tools/design-evidence.css','utf8')); 
let count=0;
for(const [i,section]of doc.sections.entries()){
 assert.equal(section.id,content.sections[i].id);
 assert.ok(page.includes(`id="${section.id}"`));
 for(const [j,card]of section.cards.entries()){
  count++;
  assert.equal(card.conclusion,content.sections[i].cards[j].conclusion);
  assert.ok(card.rules&&card.modules.length&&card.sources.length);
  assert.ok(['已实现','部分','未做','网页假设'].includes(card.status));
  assert.ok(page.includes(`id="${card.id}"`));
  for(const source of card.sources){
   assert.ok(existsSync(source.path),source.path);
   assert.equal(source.sha256,createHash('sha256').update(execFileSync('git',['show',`${doc.sourceCommit}:${source.path}`],{maxBuffer:20*1024*1024})).digest('hex'));
  }
  for(const frame of card.frames){assert.equal(frame.sourceSHA256,frames[frame.second].sourceSHA256);assert.ok(page.includes(frame.observation));}
 }
}
assert.ok(page.indexOf('一局的系统关系')<page.indexOf('<article'));
assert.ok(page.includes('frames.html')&&page.includes('本片未取得该项直接帧证据'));
assert.equal(count,28);
console.log(`Design evidence:8 dimensions,${count} cards,source hashes,frame references and appendix links verified.`);
