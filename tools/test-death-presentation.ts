import assert from 'node:assert/strict';
import {readFileSync} from 'node:fs';
import {createHash} from 'node:crypto';
import {resultIllustration,type DeathKind,type DeathCause} from '../target/temple-run/web/src/game/deathPresentation';
const source=JSON.parse(readFileSync('target/temple-run/analysis/native-death-profile-source.json','utf8'));
const types:Record<string,[DeathKind,DeathCause]>={tree:['impact','treeJump'],slide:['impact','treeSlide'],burnt:['impact','fireWall'],fall:['fall','fall'],water:['water','water'],caught:['caught','caught']};
for(const s of source.selections){
 const [kind,cause]=types[s.group],file=resultIllustration(kind,cause,s.skin);
 assert.equal(file,s.selected);assert.ok(s.candidatePool.includes(file),'image belongs to audited native character/fallback pool');
 const bytes=readFileSync('target/temple-run/web/public/assets/ui/'+file),proof=source.textures[file.slice(0,-4)];
 assert.equal(createHash('sha256').update(bytes).digest('hex'),proof.pngSHA256,'actual PNG matches original export');
 assert.equal(bytes.readUInt32BE(16),proof.width);assert.equal(bytes.readUInt32BE(20),proof.height);
}
for(const skin of ['selene','werewolf','ghost','skeleton','unknown'])for(const [kind,cause]of Object.values(types))assert.equal(resultIllustration(kind,cause,skin),resultIllustration(kind,cause,'jhony'),'unverified roles explicitly use default, not a guessed family');
assert.equal(resultIllustration('',''),'deathIllustrationSlide@2x.png');
console.log('Death presentation:24 native-pool choices,21 PNG provenance hashes/dimensions and unverified-role fallback pass');
