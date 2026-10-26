# 路障系统技术方案（Review 版）

状态：**仅方案，未开工**。目标是把路障从“按 kind 硬编码 + 距离近似碰撞”升级为
“APK 数据驱动的定义 + 可验证的生成器 + 连续碰撞”，并对齐原版碰撞语义和参考视频的视觉。

## 1. 目标与非目标

### 目标

1. 23 个 APK obstacle OBJ 全部有明确归属：行为、lane、hitbox、视觉变体、是否可用于窄路/转弯。
2. 路障生成满足原版约束：6 space 间距、连续障碍上限、双障碍 0、转弯/窄路安全。
3. 碰撞从“`abs(ahead)<0.6`”升级为**连续位置 + 2D region**，不再出现高速穿透/碰到空气。
4. 所有路障都有正确的动作提示：跳 / 滑铲 / 换道 / 直接跑过。
5. 视觉按视频校准：低树根、倒木横梁、火塔两侧、石框坑、塔门，不再用巨大树冠挡路。
6. 能量/护盾/加速对路障的结算保持一致。

### 非目标（本轮不做）

- 63×、永久翅膀等参考视频里的 mod 数值/皮肤。
- TrackPath 四向图改造、T 路口真正的可选侧分支（属于地图生成第二阶段）。
- 重新制作 APK 之外的模型/动画。

## 2. 逆向证据

来自 `libil2cpp.so` + `global-metadata.dat`：

- `Obstacle` MonoBehaviour 只有三个行为布尔：
  `MustJumpOver`、`MustSlideUnder`、`DoesKill`；此外有
  `DoesLineSegementIntersect(Vector2 p1, Vector2 p2)` 和 `IsPointInRegion(Vector2 p)`。
  → 原版碰撞是**二维线段/多边形区域**，不是简单的 lane + 距离。
- `PathElement.ObstacleType`：`Hole / Narrow / TreeStumble / TreeJump / TreeSlide /
  FlameTower / LevelChange`；`PathElement` 的 `Obstacles` 字段只记录类型，具体动作由 prefab 的
  `Obstacle` 组件决定。
- `PathElement` 的计数器：`SpacesSinceLastObstacle`、`BackToBackObstacleCount`、
  `SpacesSinceLastTurn`、`SpacesSinceLastCoinRun`；生成器按 space 而不是米工作。
- 静态默认：障碍间距 6 space、连续障碍最大 2、双障碍 0、金币段 6 space、单段 5 枚、
  奖励道具 50 space。
- `GameController.HandleCollisionWithObstacles` 调用 `Obstacle` 的 2D region/line 方法；
  当前网页版没有这个层次。

参考视频 BV1GW411N794：

- 0–60 s 可确认：低树根、树根横梁/拱、石框坑、木桥、石拱、单车道窄桥；
- 20 min 内基本是单车道直跑 + 永久翼 + 63×，是 mod/加速局；
- 因此视频只用于**视觉和障碍外形**，不用于倍率、间距、动作概率。

## 3. 路障目录

### 3.1 行为定义

```ts
type Action = 'jump' | 'slide' | 'dodge' | 'run';
type LaneMask = 'all' | number[];

interface ObstacleDef {
  id: string;
  action: Action;
  lanes: LaneMask;
  hitbox: { x: [number, number]; y: [number, number]; z: [number, number] };
  kill: boolean;
  prefab: string;
  variants: string[];      // left/right/vert
  placement: 'straight' | 'narrow' | 'scenery';
  scale: number;
  yOffset: number;
}
```

`hitbox` 以 APK 单位/0.18 缩放后的 lane 坐标为准，直接取 `obstacle-manifest.json` 的
`lane_blocked_height_above_road`，不再按 kind 猜。

### 3.2 23 个 OBJ 的归属

| 定义 | OBJ | 动作 | lane | kill | 放置 |
| --- | --- | --- | --- | --- | --- |
| `treeJumpLeft` | `tree-jump-left` + left-vert | jump | all | false | straight |
| `treeJumpRight` | `tree-jump-right` + right-vert | jump | all | false | straight |
| `treeTripLeft` | `tree-trip-left` + left-vert | jump | all | false | straight |
| `treeTripRight` | `tree-trip-right` + right-vert | jump | all | false | straight |
| `treeSlide` | `tree-slide` + vert | slide | all | false | straight |
| `flameTower` | `flame-tower` + vert | dodge | [0,2] | false | straight |
| `pit` | `pit` + vert | jump | all | true | straight |
| `pitLongA` | `pit-long-a` | jump | all | true | straight |
| `pitLongB` | `pit-long-b` | jump | all | true | straight |
| `stonePedestal` | `stone-pedestal` | dodge | one lane | false | straight |
| `narrowWallLeft` | `narrow-wall-left` | dodge/narrow | side | false | narrow only |
| `narrowWallRight` | `narrow-wall-right` | dodge/narrow | side | false | narrow only |
| `narrowBeamLeft` | `narrow-beam-left` | dodge/narrow | side | false | short narrow |
| `narrowBeamRight` | `narrow-beam-right` | dodge/narrow | side | false | short narrow |
| `towerArch` | `tower-arch` + vert | run | none | false | scenery |

`*-vert` 是转弯 prefab；转弯区已经清空，因此只在“直线但轴不同”的布局里用，不放进
`nearTurn` 区域。

## 4. 当前代码问题

| 位置 | 现状 | 风险 |
| --- | --- | --- |
| `components.ts` `Obstacle` | 只有 kind/lane/full/passed | 无法表达 hitbox、行动类型、变体 |
| `game.ts` `spawnObstacle` | `full` 按 kind 硬编码 | 火塔、坑、石墩的行为散落 |
| `game.ts` `updateObstacles` | `abs(ahead)<0.6` 近似 | 高速穿透/空气碰撞；坑有 2 m 特判 |
| `render.ts` `buildObstacle` | kind → 固定 prefab、left only | right/vert 未用；坑口/火塔补丁是特判 |
| `spawnWaves` | uniform 随机 + 局部排除 | 无连续障碍计数、无“至少一条可走 lane”求解 |
| 转弯/窄路 | 转弯清空、窄路半幅 | 路障生成器不知道 narrow，可能生成不可解组合 |

## 5. 目标架构

```
web/src/game/obstacles/
  types.ts          Action, ObstacleDef, ObstacleInstance
  catalog.ts        23 个 OBJ 的权威定义（唯一数据源）
  prefabs.ts        OBJ 加载、缩放、yOffset、变体、材质
  hitbox.ts         2D AABB/OBB + swept segment 碰撞
  spawner.ts        space 预算、公平性校验、seed RNG
  resolver.ts       跳/滑/换道/护盾/加速结算
```

### 5.1 `Obstacle` 组件

```ts
{
  defId: string;
  action: Action;
  laneMask: number[];
  distance: number;
  hitbox: Hitbox;
  kill: boolean;
  passed: boolean;
  object: Object3D | null;
}
```

`kind` 保留为兼容字段，逐步废弃。

### 5.2 生成器

输入：`distance`、`lane`、`turn`、`narrow`、`speed`、`seed`、`level`。
输出：一个或多个 `ObstacleInstance`，保证：

1. **间距**：距上一组障碍 ≥ 6 space（72 m），距转弯前 42 m / 后 32 m；
2. **连续**：`BackToBackObstacleCount ≤ 2`，默认 `DoubleObstaclePercent = 0`；
3. **可解**：dodge 组至少留一条 lane；full-lane 组不能与 lane-block 同 z；
4. **窄路**：只允许 jump/slide；如果有 lane-block，只放在安全 lane 以外的“不可走”侧；
5. **种子**：seed 可固定，debug 输出整段生成计划，便于复现和回归。

### 5.3 碰撞

- 使用 runner 上帧/本帧位置 + 当前 lane x，构造 swept segment；
- 对 obstacle 的 `Region2D`/AABB 做线段相交；
- `jump`：检查 runner 脚底 y 与 hitbox 顶部；
- `slide`：检查 runner 身高与横梁底部；
- `dodge`：检查 runner 的 lane 区间与 blocked lane；
- 坑/火塔 `kill`；其他先 `stumble`，护盾消耗一次，boost 冲撞；
- 用固定子步长（≤0.25 m）防穿透。

### 5.4 视觉

- 每个 def 有 `scale`/`yOffset`/`variant`，从 manifest 的 bounds 推导；
- `tree-*` 以 .14 缩放，避免巨大树冠；`pit` 加黑幕；`flame` 加两个火苗；
- 左右变体按 lane/approach 选择，不再永远 left；
- `tower-arch` 只做 scenery，不放进 obstacle list；
- 每个 prefab 合并静态 mesh，保留对象池。

### 5.5 UI/Cue

- cue 由 `action` 生成，而不再由 kind 映射：
  - jump → `↑ 跳过`
  - slide → `↓ 滑铲`
  - dodge → `↔ 换道`
  - run → 无
- cue 距离按速度计算：`max(10, speed * 1.2)`，避免高速提示太晚；
- 坑洞用“前方坑洞”单独警告，避免和 jump 提示混淆。

## 6. 测试与验收

### 自动化

- `spawner` 单元测试：固定 seed 生成 10,000 段，断言：
  - 任意两个 obstacle 间距 ≥ 72 m（转弯前后除外）；
  - 无连续 >2；
  - dodge 组至少一条 lane；
  - 窄路只用 jump/slide；
  - 转弯 42/32 m 内 0 obstacle；
- `hitbox` 单元测试：20 m/s 下不穿透；jump/slide/dodge 边界；
- bot 5,000 m：0 console error；统计死亡原因（missed turn / fall / obstacle）合理；
- 性能：首屏 draw calls 不高于当前 +10%；对象池无增长。

### 人工

- 截图：treeJump、treeSlide、flame、pit、stone、tower 各一张；
- 对照视频：低树根、横梁、石框坑、塔门；
- 转弯截图前后对比：无树冠/树墩遮挡。

## 7. 里程碑

| 阶段 | 内容 | 产出 |
| --- | --- | --- |
| M1 | catalog + types + prefab 变体 | 23 个定义，全部可加载 |
| M2 | hitbox + resolver | 连续碰撞，替换 `abs(ahead)` |
| M3 | spawner + seed + 单测 | 公平性校验，10k seed 通过 |
| M4 | visual 校准 + cue | 截图/视频对照 |
| M5 | 转弯/窄路集成 + bot | 0 error，验收 |
| M6 | 文档/部署 | 上线 |

预计 4–6 个工作日；M1/M2 可并行，M3 依赖 M1。

## 8. 开放式问题（需要 Review 决定）

1. **间距**：严格用原版 6 space = 72 m，还是保留当前更密的节奏？我建议严格 72 m。
2. **主路 lane 数**：保留三车道（推荐）还是按视频做单车道？单车道会改变整个玩法。
3. **双障碍**：原版默认 0；是否允许后期难度模式开启 1–2 个组合？
4. **变体范围**：`tree-jump-right` / `trip-right` / `pit-long-b` 是否都接入，还是先保证左/右各一套？
5. **窄路墙**：`narrow-wall` / `narrow-beam` 是作为真实障碍，还是只做半边路视觉边缘？
6. **T/侧路径**：本轮只做路障，还是同时启动 TrackPath 图结构改造？我建议先路障，再图结构。

## 9. 不做假对齐

原版 `GetRandomPathElementForSide` 的**精确类型权重**没有从反汇编中完整恢复；本方案会使用
“满足约束的候选集 + 可配置权重”，并把配置写进 `catalog.ts`/`spawner.ts`，而不是声称
100% 复刻概率。图结构（T 侧分支）也明确单独列为 pending。
