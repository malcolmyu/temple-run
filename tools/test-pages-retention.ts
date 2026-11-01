import {mkdtemp,mkdir,writeFile,readFile,rm} from 'node:fs/promises';
import {tmpdir} from 'node:os';
import {join} from 'node:path';
import assert from 'node:assert/strict';
import {stageRelease} from './stage-pages-release';
const root=await mkdtemp(join(tmpdir(),'temple-retention-')),dist=join(root,'dist'),dest=join(root,'site');
try{
 await mkdir(join(dist,'assets'),{recursive:true});await writeFile(join(dist,'assets/new-12345678.js'),'new');
 await mkdir(join(dest,'assets'),{recursive:true});await writeFile(join(dest,'assets/old-abcdefgh.js'),'old');await writeFile(join(dest,'assets/stale-abcdefgh.js'),'stale');
 await mkdir(join(dest,'.git'));await writeFile(join(dest,'.git/keep'),'git');
 await writeFile(join(dest,'deployment.json'),JSON.stringify({immutableAssets:['assets/old-abcdefgh.js','../../secret.txt']}));
 const first=await stageRelease(dist,dest,'commit1',1_000_000);assert.equal(first.retainedFromPrevious,1);
 assert.equal(await readFile(join(dest,'assets/new-12345678.js'),'utf8'),'new');
 assert.equal(await readFile(join(dest,'assets/old-abcdefgh.js'),'utf8'),'old');
 await assert.rejects(readFile(join(dest,'assets/stale-abcdefgh.js')));
 assert.equal(await readFile(join(dest,'.git/keep'),'utf8'),'git');
 const second=await stageRelease(dist,dest,'commit2',1_000_001);assert.equal(second.retainedFromPrevious,1);
 assert.equal(second.retainedAssets[0].expiresAt,1_600_000,'rapid releases do not drop cached-HTML assets or extend their TTL forever');
 const third=await stageRelease(dist,dest,'commit3',1_600_001);assert.equal(third.retainedFromPrevious,0);
 await assert.rejects(readFile(join(dest,'assets/old-abcdefgh.js')));
 assert.equal(JSON.parse(await readFile(join(dest,'deployment.json'),'utf8')).sourceCommit,'commit3');
 await assert.rejects(stageRelease(dist,dist,'bad'));
 console.log('Pages retention: cached-HTML assets survive rapid releases for600s, expired assets prune, git is preserved and metadata paths are constrained.');
}finally{await rm(root,{recursive:true,force:true});}
