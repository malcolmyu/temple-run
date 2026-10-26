# Temple Run 1.39 · 原版地图场景逆向清单

来源：`com.imangi.templerun` 1.39.0（Unity 2022.3.62f2）的 135 个 prefab 根节点与 IL2CPP 字段
（`AllowFallOnCliffs` / `AllowFallOnNarrows` / `CanPathExtendOnSide` / `DoesSidePathHaveObstacles` /
`kPathLevelCliff` / `kPathStraightNarrowLongLeftVert` 等）。原版没有固定关卡文件，地图由这些
track-tile prefab 按 path 节点程序化拼接，因此“场景”= 地形主题 + 轨道片段 + 障碍片段。

## 1. 地形主题

| 主题 | 原版 prefab 族 | 特征 | 网页版 |
| --- | --- | --- | --- |
| 神庙 | `templeStraight*`, `templeTurnA-D`, `templeT*` | 石墙、火盆、门楣、树根 | 已有 |
| 木桥 | `plankStraight*`, `plankTurnA-D`, `plankT*` | 木板桥面、绳栏、峡谷 | 已有（bridge） |
| 断崖 | `cliffStraight*`, `cliffTurnA-D`, `cliffT*`, `cliff2/3` | 破碎石台、深渊、树 | 已有（cliff） |
| 柱廊大厅 | `temple` 室内片段 / `templeStraightHorz2-5` | 柱廊、红毯、吊灯 | 已有（hall） |
| 周年神庙 | `anniversary_temple_prefab`, `templeHead` | 金色旗帜、额外火盆 | 新增（anniversary） |

主题之间有 `templeToPlankCapA/B`、`cliffToTempleCapA/B` 过渡片段；网页版在主题边界用门/桥头火盆做过渡。

## 2. 轨道片段

| 片段 | 原版 prefab | 玩法 |
| --- | --- | --- |
| 直道 | `templeStraightHorz/Vert`, `...Horz2-5` | 普通跑动；2-5 为不同布景 |
| 90° 弯 | `templeTurnA-D`, `plankTurnA-D`, `cliffTurnA-D` | 路口按方向转弯 |
| T 路口 | `templeTLeft/TRight/TUp/TDown`（plank/cliff 同） | 分叉/汇入，原版用侧路径扩展 |
| 长窄路 | `templeStraightNarrowLongLeft/Right/Up/Down`（含 A/B） | 只剩半边路，必须移到存活侧，否则坠崖 |
| 短窄路 | `templeStraightNarrowSmallLeft/Right/Up/Down` | 短距离收窄/矮墙 | 已接入 1 tile 短半边路 |
| 短坑 | `templeStraightHoleHorz/Vert` | 跳过 |
| 长坑 A/B | `templeStraightHoleLongA/BHorz/Vert` | 更宽的坑 | 已接入 gapLong |
| 火塔 | `templeStraightFlameTowerHighHorz/Vert` | 两侧火盆，中间可穿过（不用跳） |
| 塔门 | `templeStraightTowerHorz/Vert` | 高塔/横梁，跑过 |
| 树根跳 | `templeStraightTreeJumpLeft/Right/Up/Down` | 跳过倒木 |
| 树根绊 | `templeStraightTreeTripLeft/Right/Up/Down` | 低根，跳/绊倒 |
| 倒木滑铲 | `templeStraightTreeSlideHorz/Vert` | 滑铲穿过 |

## 3. 障碍原型（APK 实际网格）

| OBJ | 原版 prefab | 正确玩法 | 网页版 |
| --- | --- | --- | --- |
| `tree-jump-left/right` | `templeStraightTreeJump*` | 跳过倒木 | 使用原 OBJ |
| `tree-trip-left/right` | `templeStraightTreeTrip*` | 低根，跳/绊倒 | 已接入 trip |
| `tree-slide` | `templeStraightTreeSlide*` | 滑铲 | 使用原 OBJ |
| `flame-tower` | `templeStraightFlameTowerHigh*` | 两侧火盆，中间安全 | 使用原 OBJ + 火焰 |
| `pit`, `pit-long-a/b` | `templeStraightHole*` | 跳过 | 使用原 OBJ（含 gapLong） |
| `tower-arch` | `templeStraightTower*` | 高塔门，跑过 | 作为地标 |
| `stone-pedestal` | flame tower 基座 | 单车道障碍 | 使用原 OBJ |
| `narrow-wall-left/right` | `templeStraightNarrowLong*` | 半边路边缘墙 | 用于半边路装饰 |
| `narrow-beam-left/right` | `templeStraightNarrowSmall*` | 短窄路 | 资源已导出 |

## 4. 本次实现状态

- ✅ 半边路：`narrowAt` 改为 `side: left/right`，左侧只剩 0 道、右侧只剩 2 道；缺失半边覆盖黑色深渊、断口石板和竖向崖面；`narrow-safe` 外车道会坠崖；首个半边路在 87–123 m（仅左侧）。
- ✅ 火塔：中间车道安全，只有左右车道会死；提示改为“换道”。
- ✅ 障碍视觉：树根、倒木、火塔、坑、石墩改用 APK OBJ；坑口补黑幕避免被路面盖住。
- ✅ 主题：神庙 / 木桥 / 断崖 / 柱廊 / 周年神庙； Anniversary 增加金色旗帜。
- ✅ 地标：塔门 arch 在神庙段周期性出现；直道/门/火盆/树随机布景。
- ⏳ T 路口分叉：当前仍是 90° 弯 + 侧向装饰，没有可选的完整侧分支路径；原版 `templeT*` 资源已导出，可继续做。
- ✅ 长坑 A/B 已接入 `gapLong`（原版 `pit-long-a/b`）。
- ✅ 树根绊倒已接入 `trip`（原版 `tree-trip-left`）。
- ✅ 短窄路已接入 1 tile 短半边路（每 12 tile 一次）。
- ⏳ T 路口完整侧分支：资源已导出，生成器尚未接入。

## 5. 后续优先级

1. T 路口做成真正的侧分支（可选金币/宝石路线，再汇回主路）。
2. 长坑 A/B 与短窄路接入 `spawnWaves`，按里程组合。
3. 树根绊倒（trip）与跳（jump）分开行为，而不是都归为 hurdle。
