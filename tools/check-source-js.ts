/** Explicit legacy exception; generated JS belongs outside versioned source. */
import {execFileSync} from 'node:child_process';
import {createHash} from 'node:crypto';
import {readFileSync,existsSync} from 'node:fs';
const exemptions=JSON.parse(readFileSync('docs/architecture/javascript-exemptions.json','utf8')) as Record<string,{reason:string;sha256:string}>;
const files=[...new Set(execFileSync('git',['ls-files','--cached','--others','--exclude-standard','-z','*.js'],{encoding:'utf8'}).split('\0'))].filter(p=>p&&existsSync(p));
for(const file of files){
 const exemption=exemptions[file];
 if(!exemption)throw Error(`Unapproved JavaScript source: ${file}`);
 const hash=createHash('sha256').update(readFileSync(file)).digest('hex');
 if(hash!==exemption.sha256)throw Error(`Legacy exception changed; migrate it or audit the reason: ${file}`);
}
for(const file of Object.keys(exemptions))if(!files.includes(file))throw Error(`Stale JavaScript exemption: ${file}`);
const inventory=JSON.parse(readFileSync('docs/architecture/javascript-inventory.json','utf8')) as {items:Array<{kind:string;original:string;target:string}>};
for(const item of inventory.items)if(item.kind==='source-to-migrate'&&(!existsSync(item.target)||existsSync(item.original)))throw Error(`Incomplete migration: ${item.original} -> ${item.target}`);
console.log(`Source policy: ${files.length} explicit hash-locked legacy exception; all active JavaScript migrated.`);
