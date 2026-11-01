import {stageRelease} from './stage-pages-release.ts';
const [dist,destination,commit]=process.argv.slice(2);
if(!dist||!destination||!commit)throw Error('Usage: stage-pages-cli dist checkout commit');
const result=await stageRelease(dist,destination,commit);
console.log(`Staged ${result.immutableAssets.length} current hashed assets; retained ${result.retainedFromPrevious} prior assets.`);
