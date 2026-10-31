/** Native ComputeDistanceTraveled126e474..490 freezes the opening coin-free
 * distance on the first collected coin; HandleEndGame1272260..226c uses full
 * distance for a zero-coin run. DidStumble is sticky until a new run. */
export interface RunChallenges {firstCoinDistance:number|null;stumbled:boolean;}
export interface RunChallengeSummary {coinFreeStart:number;cleanDistance:number;}
export const createRunChallenges=():RunChallenges=>({firstCoinDistance:null,stumbled:false});
export function stepRunChallenges(s:RunChallenges,distance:number,coins:number):void {
 if(s.firstCoinDistance===null&&coins>0)s.firstCoinDistance=Math.max(0,distance);
}
export function summarizeRunChallenges(s:RunChallenges,distance:number):RunChallengeSummary {
 return {coinFreeStart:s.firstCoinDistance??Math.max(0,distance),cleanDistance:s.stumbled?0:Math.max(0,distance)};
}
