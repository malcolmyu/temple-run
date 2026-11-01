# 原版地图生成规则逆向

来源：Temple Run 1.39（Unity 2022.3.62f2）的 `global-metadata.dat` + `libil2cpp.so`。
用 Il2CppDumper 还原类/字段/方法，再对关键方法做反汇编；路径类型与静态默认值来自
`PathElement` 的 `.cctor` 和 `GameController.LoadLevelInformation`。

## 1. 数据结构

原版不是“一条直线 + 周期主题”，而是 **以约60×60原坐标单位路段拼接的四向图**（不是已证实60×60个格子的固定地图）：

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

## 4. 当前网页与原版的边界（2026-11-01更正）

原版T/直路/过渡帽有真实几何，早期“无mesh”结论已作废。四向Path引用与侧路径扩展存在；图结构可表达共享连接节点。但现有反汇编不足以证明原版会生成网页的“平行双路、同里程、固定距离合流”，也没有恢复其回环/合流出现率。详见[证据与限制](original-topology-evidence.md)。

网页T左右出口可选；平行分路与合流明确是网页设计。现在保留原路宽内两条残余通道，避免路外铺板/选路位移，并保留合流到转弯96m预算。

上表为静态构造默认值，**不代表当前正常局全程固定6/6/0**。原版HandlePacing正常开局写12转弯space，随后按进度分阶段降至2，障碍6降至2，双障碍0升至.2；完整表见src/game/nativePathPacing.ts及analysis/native-path-pacing.json。网页采用这些阶段读取值，但120m组长度下限、组合回退、概率权重/恢复段、半边路介绍顺序都是网页安全与节奏设计，不能称参数级完整复刻。

生成器是流式CoursePlan+TrackGraph，非原版60×60场景节点网格的完整重写；主题按进度请求拼接，随机序列受玩家进度影响。seed不单独保证整条固定路线。精确候选概率/合流规则仍未恢复。
