# 路障清单与对齐状态

来源：APK 导出的 23 个 obstacle OBJ（`analysis/obstacle-manifest.json`）与 prefab 名。
参考视频 BV1GW411N794 是 mod/加速局，只用于外观参考；判定与数值仍按 APK 原版。

## 1. 全部 OBJ

| # | OBJ | 原版 prefab / 角色 | 正确判定 | 当前接入 |
| --- | --- | --- | --- | --- |
| 1 | `tree-jump-left.obj` | TreeJumpLeft，倒木根（左） | 全路 3 lane，跳过 | `hurdle`，已用 |
| 2 | `tree-jump-right.obj` | TreeJumpRight，倒木根（右） | 全路，跳过 | 未单独接入（视觉变体） |
| 3 | `tree-jump-left-vert.obj` | 转弯版 | 转弯区不使用 | 未接入 |
| 4 | `tree-jump-right-vert.obj` | 转弯版 | 转弯区不使用 | 未接入 |
| 5 | `tree-trip-left.obj` | TreeTripLeft，低树根（左） | 全路，跳过/绊 | `trip`，已用 |
| 6 | `tree-trip-right.obj` | TreeTripRight（右） | 全路，跳过/绊 | 未单独接入（视觉变体） |
| 7 | `tree-trip-left-vert.obj` | 转弯版 | 转弯区不使用 | 未接入 |
| 8 | `tree-trip-right-vert.obj` | 转弯版 | 转弯区不使用 | 未接入 |
| 9 | `tree-slide.obj` | TreeSlide，倒木横梁 | 全路，滑铲 | `arch`，已用 |
| 10 | `tree-slide-vert.obj` | 转弯版 | 转弯区不使用 | 未接入 |
| 11 | `flame-tower.obj` | FlameTower，双侧火盆 | 全路，中间 lane 安全，换道 | `fire`，已用 |
| 12 | `flame-tower-vert.obj` | 转弯版 | 转弯区不使用 | 未接入 |
| 13 | `pit.obj` | Hole，短坑 | 全路，跳过 | `gap`，已用 |
| 14 | `pit-vert.obj` | 转弯版 | 转弯区不使用 | 未接入 |
| 15 | `pit-long-a.obj` | HoleLongA，长坑窄沿 | 全路，跳过 | `gapLong`，已用 |
| 16 | `pit-long-b.obj` | HoleLongB，长坑宽沿 | 全路，跳过 | 未单独接入 |
| 17 | `tower-arch.obj` | Tower，塔门横梁 | 跑过，无碰撞 | 场景地标，已用 |
| 18 | `tower-arch-vert.obj` | 转弯版 | 转弯区不使用 | 未接入 |
| 19 | `narrow-wall-left.obj` | NarrowLong 左边缘墙 | 只允许右侧通过 | 未接入，半边路用程序化断口 |
| 20 | `narrow-wall-right.obj` | NarrowLong 右边缘墙 | 只允许左侧通过 | 未接入 |
| 21 | `narrow-beam-left.obj` | NarrowSmall 左矮墙 | 跨/绕，短窄路 | 未接入，短窄路用程序化断口 |
| 22 | `narrow-beam-right.obj` | NarrowSmall 右矮墙 | 跨/绕，短窄路 | 未接入 |
| 23 | `stone-pedestal.obj` | 石墩 | 单 lane，换道 | `block`，已用 |

## 2. 当前可玩路障（6 类）

| 类型 | 外观 | lane | 正确动作 | 失败结果 |
| --- | --- | --- | --- | --- |
| `hurdle` | 倒木根 | 全路 | 跳 | 绊倒，追逐者逼近 |
| `trip` | 低树根 | 全路 | 跳 | 绊倒 |
| `arch` | 倒木横梁 | 全路 | 滑铲 | 绊倒 |
| `gap` | 石框短坑 | 全路 | 跳 | 坠坑死亡 |
| `gapLong` | 长坑 A | 全路 | 跳 | 坠坑死亡 |
| `fire` | 火塔双盆 | 全路 | lane 1 直跑，0/2 换道 | 火焰撞击 |
| `block` | 石墩 | 单 lane | 换道 | 撞击/绊倒 |

## 3. 生成规则（这轮为难度调整）

- 转弯前 **42 m**、转弯后 **32 m** 不生成任何路障；转弯区 26 m 内清除树冠/灌木/藤蔓等装饰。
- 普通路障间距从 20–32 m 放宽到 **26–40 m**；窄路内 26–34 m。
- 双石墩概率从 50% 降到 **25%**，且第二个石墩后移 8 m。
- 速度上限 22 → **20**，成长 0.02 → **0.012**；转弯提示距离 42 → **48 m**，错过判定 +2.5 → +4.0 m。
- 树障碍缩放 0.18 → **0.14**，减少巨大树冠遮住弯道视线。
- 转弯前必须能看到完整路口：路口 26 m 内不生成树冠/灌木/藤蔓/塔门/旗帜。

## 4. 与参考视频的路障对照

| 视频画面 | 对应路障 | 本版 |
| --- | --- | --- |
| 低树根横跨石桥 | TreeTrip / TreeJump | 已用，跳 |
| 树干横梁从头顶过 | TreeSlide | 已用，滑铲 |
| 石框坑洞 | Hole | 已用，跳 |
| 两侧火盆/火墙 | FlameTower | 已用，中间安全 |
| 石墩/矮墙挡单侧 | StonePedestal / NarrowWall | 石墩已用；矮墙待接入 |
| 石拱门 | Tower | 作为地标，无碰撞 |

视频 20 min 内基本是单车道直跑 + 永久翼，没出现正常的三车道路障组合；因此“所有路障”的判定仍以 APK 原版为准，视频只校准视觉。

## 5. 还差

- `tree-jump-right`、`tree-trip-right`、`pit-long-b` 的视觉变体没接入（判定已有）。
- `narrow-wall-*`、`narrow-beam-*` 还没作为真实网格接到半边路/短窄路，当前用程序化断口。
- 所有 `*-vert` 是转弯区 prefab，当前转弯区完全清空，不生成路障。
- T 路口完整侧分支仍 pending。
