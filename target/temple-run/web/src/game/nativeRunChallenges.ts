/** Native ComputeDistanceTraveled126e474..490 freezes the opening coin-free
 * distance on the first collected coin; HandleEndGame1272260..226c uses full
 * distance for a zero-coin run. DidStumble is sticky until a new run. */
export interface RunChallenges {firstCoinDistance:number|null;stumbled:boolean;usedPower:boolean;powerFreeScore:number;}
export interface RunChallengeSummary {coinFreeStart:number;cleanDistance:number;powerFreeScore?:number;}
export const createRunChallenges=():RunChallenges=>({firstCoinDistance:null,stumbled:false,usedPower:false,powerFreeScore:0});
export function stepRunChallenges(s:RunChallenges,distance:number,coins:number,score=0):void {
 recordPowerFreeScore(s,score);
 if(s.firstCoinDistance===null&&coins>0)s.firstCoinDistance=Math.max(0,distance);
}
export function summarizeRunChallenges(s:RunChallenges,distance:number):RunChallengeSummary {
 return {coinFreeStart:s.firstCoinDistance??Math.max(0,distance),cleanDistance:s.stumbled?0:Math.max(0,distance),powerFreeScore:s.powerFreeScore};
}

/** Web interpretation: all powerups/paid aids/revival end the clean prefix.
 * Preserve score earned before use; later rewards cannot bootstrap it. */
export function markChallengePowerUsed(s:RunChallenges,score:number):void {
 recordPowerFreeScore(s,score);
 s.usedPower=true;
}

export function recordPowerFreeScore(s:RunChallenges,score:number):void {
 if(!s.usedPower&&Number.isFinite(score))s.powerFreeScore=Math.max(s.powerFreeScore,Math.floor(score));
}
