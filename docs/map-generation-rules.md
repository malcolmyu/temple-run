# 原版地图生成规则逆向

来源：Temple Run 1.39（Unity 2022.3.62f2）的 `global-metadata.dat` + `libil2cpp.so`。
用 Il2CppDumper 还原类/字段/方法，再对关键方法做反汇编；路径类型与静态默认值来自
`PathElement` 的 `.cctor` 和 `GameController.LoadLevelInformation`。

## 1. 数据结构

原版不是“一条直线 + 周期主题”，而是 **60×60 单位的网格图**：

- `PathElement` 是一个格子/路段，四向连接：`PathNorth` / `PathEast` / `PathWest` / `PathSouth`。
- `PathElement.PathType` 是 0–37 的枚举：直道、A–D 弯、T Left/Right/Up/Down、短/长坑、
  NarrowSmall、NarrowLong Left/Right/Up/Down（A/B）、FlameTower、StepDownCap、Temple。
- `PathElement.PathLevel`：`Plank=1`、`Temple=2`、`Cliff=3`；`ChangeLevel` 只在三者间切换，
  且新等级不会等于当前等级。
- `PathElement.ObstacleType`：无 / Hole / Narrow / TreeStumble / TreeJump / TreeSlide /
  FlameTower / LevelChange。
- 每个节点还记录：`SpacesSinceLastTurn`、`SpacesSinceLastObstacle`、`BackToBackObstacleCount`、
  `SpacesSinceLastCoinRun`、`CoinRunCount`、`SpacesSinceLastBonusItem`。

## 2. 静态默认参数（.cctor 实际写入值）

| 字段 | 默认值 | 含义 |
| --- | ---: | --- |
| `sMinSpaceBetweenTurns` | **6** | 两次转弯之间至少 6 个 path element |
| `sMaxBackToBackObstacles` | **2** | 连续障碍最多 2 个 |
| `sMinSpaceBetweenObstacles` | **6** | 两个障碍之间至少 6 个 path element |
| `sDoubleObstaclePercent` | **0** | 默认不生成双障碍 |
| `sMinSpacesBetweenCoinRuns` | **6** | 两段金币至少隔 6 个 path element |
| `sMaxCoinsPerRun` | **5** | 单段金币最多 5 枚 |
| `sMinSpacesBetweenBonusItems` | **50** | 道具之间至少 50 个 path element |
| `sPathLevel` | **2 (Temple)** | 初始主题 |
| `sAllowVariations` | true | 允许直道变体 |
| 其余 `sAllow*` | false（后由关卡/教程设置） | 转弯/坑/窄路/火塔/树障碍/侧路径等开关 |

一个 path element 在网页版对应 12 m tile，所以 **6 个 space = 72 m**。

## 3. 生成算法

`GameController.LoadLevelInformation` 的关键流程：

1. 实例化 `kPathTemple`（37）作为 `PathRoot`，`PathRootOrigin = 3`；
2. `AddRandomPath(6, 3)` 建第一段，`AddRandomPath(8, 3)` 继续扩展；
3. `AddRandomPath(depth, origin)` 对四个方向（1–4）依次：
   - `CanPathExtendOnSide(direction)` 判断该方向是否可延伸；
   - 已有邻格则取已有 PathElement，否则 `GetRandomPathElementForSide(direction)`；
   - `SetPath(path, direction)` 连接父子；
   - 递归 `AddRandomPath(depth-1, opposite direction)` 继续；
   - 通过 `DoesSidePathHaveObstacles()` / `DoesSidePathhaveCoins()` 处理侧路径。
4. `GetRandomPathElementForSide` 从候选 prefab/path 片段中过滤：
   `DoesPieceTypeFitOnSide`、`WillPieceTypeConnectOnSide`、`ACertainTypeCheck`、
   `CanPathExtendOnSide2`，再选一个可用类型。
5. `ChangeLevel` 在当前等级之外随机选 1/2/3，保证不会连续同主题。
6. `SetupTerrain` 根据 PathType 生成实际 prefab（直道/弯/T/坑/窄路/火塔/树障碍/过渡帽）。

目前只反汇编到“类型选择和递归框架”这一层；**每种 PathType 的精确权重表**没有从代码中直接读出，
因为 `GetRandomPathElementForSide` 使用候选列表过滤而不是显式概率数组。

## 4. 网页版严格对齐情况

已对齐（`web/src/game/pathRules.ts`）：

- 转弯最小间距：72 m（`sMinSpaceBetweenTurns=6`）；
- 障碍最小间距：72 m（`sMinSpaceBetweenObstacles=6`）；
- 连续障碍上限：2；默认双障碍概率 0；
- 金币段最少 72 m，单段最多 5 枚；
- 初始等级 Temple，等级切换不连续相同。

未严格对齐：

- 网页版是 **单条 TrackPath 折线**，原版是 **四向网格图**；T 路口、可选侧路径、
  真正的分支/汇合无法只靠改参数实现，需要把 `TrackPath` 改成图结构。
- 主题切换仍是周期函数，不是原版的 level 节点切换。
- `GetRandomPathElementForSide` 的类型权重没有完整恢复；当前按可用类型 + 间距过滤。
- 转弯版本的 `*-vert` prefab 按设计不在转弯区生成障碍；网页版直接清空转弯区。

## 5. 结论

“严格对齐”分成两层：

1. **参数级严格对齐**：已经做（6/6/2/0/6/5/50 等）。
2. **图结构级严格对齐**：需要重写路径系统为四向网格 + 侧路径，工作量大于本次路障/难度修复；
   当前明确标记为 pending，而不是假装已经 100% 还原。

如果继续做图结构，优先级是：T 路口侧分支 → 真正 side path（带金币/障碍）→ 主题切换节点。
