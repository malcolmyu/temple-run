/** Original IDs and labels; sticky-stumble/opening-coin-free gates from IL2CPP.
 * Web records only at settlement; complete native runtime update timing pending. */
export const NATIVE_CHALLENGE_OBJECTIVES = [
  {
    "id": "distance500NoCoins",
    "target": 500,
    "metric": "bestCoinFreeStart",
    "detail": "开局500米不收集金币",
    "title": "吝啬之跑"
  },
  {
    "id": "distance1000NoCoins",
    "target": 1000,
    "metric": "bestCoinFreeStart",
    "detail": "开局1000米不收集金币",
    "title": "黄金过敏"
  },
  {
    "id": "notrip2500",
    "target": 2500,
    "metric": "bestCleanRunDistance",
    "detail": "单局2500米不绊倒",
    "title": "健步如飞"
  },
  {
    "id": "notrip5000",
    "target": 5000,
    "metric": "bestCleanRunDistance",
    "detail": "单局5000米不绊倒",
    "title": "你绊我不到"
  }
] as const;
