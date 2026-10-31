/** PathElement.GetRandomPathElementForSide12e3fac..12e4034.
 * This gate grants eligibility; it does not choose an obstacle from candidates. */
export function nativeObstacleEligible(spacesSinceTurn:number,consecutive:number,spacesSinceObstacle:number,minSpaces:number,doublePercent:number,roll:()=>number):boolean {
 if(spacesSinceTurn===1||consecutive>=2)return false;
 if(spacesSinceObstacle>=minSpaces)return true;
 return roll()<Math.fround(Math.fround(doublePercent)*1000);
}
