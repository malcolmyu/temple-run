/** HandlePacing126eb5c..126f1a4: normal monotonic run, not fast-turn overrides.
 * Constructor defaults alone are insufficient; normal start writes12 turn spaces.
 * The4500+ normal stage is verified at126f184..126f1a0. */
export function nativePathPacing(progress:number) {
 const stages=[
  [0,12,6,12,0],[250,10,5,10,0],[500,8,4,9,.05],
  [1000,6,4,8,.05],[1500,5,3,7,.1],[2000,4,3,6,.15],[3250,3,3,6,.175],[4500,2,2,6,.2],
 ];
 let stage=stages[0];
 for(const candidate of stages)if(Number.isFinite(progress)&&progress>=candidate[0])stage=candidate;
 return {from:stage[0],minTurnSpaces:stage[1],minObstacleSpaces:stage[2],minCoinRunSpaces:stage[3],doubleObstaclePercent:stage[4],known:Number.isFinite(progress)&&progress>=0};
}
export const COURSE_LOOKAHEAD=360; // Web streaming buffer, beyond visible tiles/pickups.
export const COURSE_GROUP_MIN_LENGTH=120; // Web safety margin for complete paired geometry.
