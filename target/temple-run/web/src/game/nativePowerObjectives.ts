/** Original pickup counters and5/10/20 thresholds, verified in
 * analysis/native-objectives/power-pickups.json; original Chinese labels. */
export const NATIVE_POWER_OBJECTIVES = [
  {
    "id": "magnets5",
    "title": "磁铁矿工",
    "detail": "在一局游戏中收集5个磁铁",
    "kind": "magnet",
    "target": 5
  },
  {
    "id": "magnets10",
    "title": "磁力超人",
    "detail": "在一局游戏中收集10个磁铁",
    "kind": "magnet",
    "target": 10
  },
  {
    "id": "magnets20",
    "title": "万磁王",
    "detail": "在一局游戏中收集20个磁铁",
    "kind": "magnet",
    "target": 20
  },
  {
    "id": "coinBonuses5",
    "title": "金币侠",
    "detail": "在一局游戏中收集5个金币强化道具",
    "kind": "bonus",
    "target": 5
  },
  {
    "id": "coinBonuses10",
    "title": "黄金爆炸",
    "detail": "在一局游戏中收集10个金币强化道具",
    "kind": "bonus",
    "target": 10
  },
  {
    "id": "coinBonuses20",
    "title": "黄金之神",
    "detail": "在一局游戏中收集20个金币强化道具",
    "kind": "bonus",
    "target": 20
  },
  {
    "id": "invisibilityBonuses5",
    "title": "隐身",
    "detail": "在一局游戏中收集5个隐身",
    "kind": "shield",
    "target": 5
  },
  {
    "id": "invisibilityBonuses10",
    "title": "万夫莫敌",
    "detail": "在一局游戏中收集10个隐身",
    "kind": "shield",
    "target": 10
  },
  {
    "id": "invisibilityBonuses20",
    "title": "无敌",
    "detail": "在一局游戏中收集20个隐身",
    "kind": "shield",
    "target": 20
  },
  {
    "id": "boosts5",
    "title": "超速侠",
    "detail": "在一局游戏中收集5个加速",
    "kind": "boost",
    "target": 5
  },
  {
    "id": "boosts10",
    "title": "速度狂魔",
    "detail": "在一局游戏中收集10个加速",
    "kind": "boost",
    "target": 10
  },
  {
    "id": "boosts20",
    "title": "火箭",
    "detail": "在一局游戏中收集20个加速",
    "kind": "boost",
    "target": 20
  }
] as const;
