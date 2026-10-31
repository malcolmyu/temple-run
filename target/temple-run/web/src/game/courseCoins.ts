import {MAX_COINS_PER_RUN} from './pathRules';
import type {CourseFeature} from './coursePlan';
import {nativePathPacing} from './nativePathPacing';
/** AddCoins12e4d64..80 rejects SpacesSinceLastCoinRun <= minimum.
 * Adapter: grouped web courses measure empty complete12m cells from the last
 * emitted run's end. Native per-PathElement counter propagation is not restored.
 * Six-metre corner clearance,2m coin spacing and the existing5-coin cap are web layout choices. */
export function courseCoinRun(feature:CourseFeature,lastEnd:number|null):number[] {
 const mid=12*Math.round((feature.from+feature.to)/24);
 const start=Math.max(feature.from+6,mid-36),end=Math.min(feature.to-6,start+(MAX_COINS_PER_RUN-1)*2);
 const minSpaces=feature.fastTurn?0:nativePathPacing(feature.generatedAtProgress??0).minCoinRunSpaces;
 if(lastEnd!==null&&Math.floor((start-lastEnd)/12)<=minSpaces)return [];
 const result:number[]=[];
 for(let at=start;at<=end+.00001&&result.length<MAX_COINS_PER_RUN;at+=2)result.push(at);
 return result;
}
