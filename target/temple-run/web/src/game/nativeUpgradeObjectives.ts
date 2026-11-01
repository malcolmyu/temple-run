/** GameController.UpdateAchievementRecords1275514..5840:
 * counts the five native upgrades at >=1 or >=5, then count/5*100.
 * Legacy web coin-value upgrade is deliberately excluded. */
export const NATIVE_OBJECTIVE_UPGRADES = ['magnet','shield','coinSpawn','bonus','boost'] as const;
export function nativeUpgradeObjectiveCount(levels:Readonly<Record<string,number>>,threshold:number):number {
  return NATIVE_OBJECTIVE_UPGRADES.filter(id=>Number.isFinite(levels[id])&&levels[id]>=threshold).length;
}
export const NATIVE_UPGRADE_OBJECTIVES = [
  {id:'upgrade1',title:'基础能力',detail:'所有强化道具达到1级',level:1},
  {id:'upgrade5',title:'超能力',detail:'所有强化道具达到5级',level:5},
] as const;
