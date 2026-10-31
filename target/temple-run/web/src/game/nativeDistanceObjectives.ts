/** Original SetupAchievements IDs and Chinese localization bundle labels.
 * Distance1000 runtime percent uses current DistanceTraveled /1000 *100.
 * Currency rewards are not inferred from the original catalogue. */
export const NATIVE_DISTANCE_OBJECTIVES = [
  {
    "id": "distance1000",
    "title": "短跑运动员",
    "detail": "单局奔跑1000米",
    "target": 1000
  },
  {
    "id": "distance2500",
    "title": "运动员",
    "detail": "单局奔跑2500米",
    "target": 2500
  },
  {
    "id": "distance5000",
    "title": "5000米奔跑者",
    "detail": "单局跑到5000米",
    "target": 5000
  },
  {
    "id": "distance10000",
    "title": "万米长跑者",
    "detail": "单局跑到10000米",
    "target": 10000
  }
] as const;
