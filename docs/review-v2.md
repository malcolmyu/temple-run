# Temple Run v2 独立 Code Review

- 日期：2026-10-26
- 范围：`target/temple-run/web/src`（TypeScript + ECS + Vue 重构版 `index.html`），以 `legacy.html`（`src/main.js`）为行为基线
- 方法：静态对照旧版逻辑、`vue-tsc` 严格模式、无头 Chrome 实跑、`window.__templeGame` 驱动的确定性 bot（150 ms/步，自动转弯/跳跃/滑铲/窄路换道）
- 结论：功能覆盖已经接近旧版，但“状态机、ECS 时钟、资源生命周期”三类基础问题会直接破坏一局游戏。本轮修复了 9 个 P0/P1 和 2 个 P2；剩余的存档迁移、数值/手感差异与死亡表现归入 P2/P3。

## 已修复

| # | 严重度 | 问题 | 根因 | 修复 |
| --- | --- | --- | --- | --- |
| 1 | P0 | 死亡后永远停在 `dying`，结算与复活都不出现 | `frame()` 只在 `playing` 时调 `tick()`，`deathTimer` 无人递减 | 新增 `updateDeath()`，`frame()`/`advance()` 在 `dying` 时推进死亡计时 |
| 2 | P0 | 复活后永久无敌；道具不过期；跳/滑判定窗口失效 | `world.update(dt)` 从未调用，`world.elapsed` 恒为 0 | `tick()` 开头推进 ECS 时钟 |
| 3 | P0 | 每经过一次窄路，`reviveUsed` / `invincibleUntil` / `lastMilestone` 被重置 | `else if (narrowWarned)` 分支里混入了三行 run 状态重置 | 删除误置的重置，只清 `narrowWarned` |
| 4 | P1 | 因“错过路口”死亡后复活，3 秒无敌一结束立刻再次死亡 | 复活只清障碍，不复位已经过去的 `turn` | 复活时若已越过路口，清空该转弯并在前方重排；窄路内复活自动回到存活车道 |
| 5 | P1 | 复活后再死亡会把同一局金币/宝石/里程重复入账 | `finishDeath()` 立即 `recordRun()`，复活不撤销 | 改为 `commitRun()` 幂等提交，只在“再跑一次/返回菜单”时入账；结算页 best 同步显示本局 |
| 6 | P1 | 每次重开都往场景里叠加一套旧瓦片/障碍/金币 | `resetWorld()` 只销毁实体，没有 `scene.remove()` 对应 Object3D | 新增 `removeEntityObject()`，并在重开时销毁旧 runner/chaser 实体 |
| 7 | P1 | Esc/P 暂停、Enter 开始/重开全部无效 | 事件只进队列，而队列只在 `tick()` 里 drain；菜单/结算阶段没有 tick | `frame()` 每帧 drain 输入，菜单与结算也能响应 |
| 8 | P1 | 金币价值 +25% 升级几乎无效：1 级仍按 1 枚、2 级直接翻倍 | 每枚金币 `Math.round(coinMultiplier())`，小数被反复吞掉 | 增加 `coinValueAcc` 小数累加器，按整枚结算 |
| 9 | P2 | 关闭背景音乐后，开始/继续/复活仍会播放 | 这三处无条件 `sfx.startMusic('theme')` | 统一判断 `progress.music` |
| 10 | P2 | 局域网二维码可能编码 VPN/容器地址 | `/__lan-url` 取第一个非内网 IPv4 | 按 192.168 / 10 / 172.16-31 评分，跳过 198.18、169.254、100.64/10 |
| 11 | P1 | GPU 资源随里程线性增长 | 每次新建 geometry/material，移除只 `scene.remove()` | 瓦片/路口共享原型 clone；障碍/金币/宝石/道具按 kind 池化 |

验证：

- `npm run temple:typecheck`：0 error
- `npm run temple:build`：通过（双入口）
- bot：1215–1747 m、16–21 个转弯，自动跳跃/滑铲/窄路换道，console 0 error
- 键盘：Enter 开始、Esc 暂停/继续、结算页 Enter 重开
- 复活：宝石扣减、3 秒无敌、同局只可复活一次、旧转弯不再秒杀
- 结算：死亡 1.25 s 后进入结算，金币/最佳成绩正确，且同一局只入账一次
- GPU：2.3 km 内 `geometries` 109→484（修前 1.2 km 451→4202），`textures` 10→12，draw calls 210→252；池化/原型生效

## 未修复 / 需要决策

### P2：v2 存档没有迁移旧版

`progress.ts` 使用新 key `temple.v2.progress`，旧版分散在多个 key（best/charState/stats/settings）。老玩家升级到 v2 会丢失最远距离、金币、宝石、解锁角色。建议首启做一次只读迁移，并保留旧 key 一段时间。

### P2：与旧版的数值/手感差异（需产品确认）

| 项 | 旧版 | v2 |
| --- | --- | --- |
| 连击倍率 | 4 枚升一级，1.3 s 内连吃，2.4 s 断连 | 8 枚升一级，3 s 断连 |
| 磁铁 / 加速时长 | 9 s / 4.5 s | 8 s / 5 s |
| 金币/宝石里程碑 | 每 100 金币 / 25 宝石弹金牌 | 只有距离里程碑 |
| 复活 | 金币优先（50→20），否则 1 宝石，8 s 限时 | 固定 2 宝石，无倒计时 |
| 跳跃/滑铲缓冲 | 0.16 s / 0.24 s | 无缓冲 |

这些不是“错误”，但会让老玩家觉得节奏变了；建议逐项确认是保留 v2 设计还是回到旧版手感。

### P3：死亡表现与 ECS 形态

- 死亡只有 1.25 s 的静止阶段，没有旧版的倒地/慢镜/暗角，观感偏硬。
- `World` 的 `addSystem()` 没有被使用，`query()` 注释声称有缓存但实现每次分配；目前更像“组件存储 + 手写 tick”，不是严格意义上的 ECS 调度器。若 ECS 是交付要求，建议补系统调度与查询缓存；否则可以把文档改成“轻量组件存储”，避免误导。

## 建议的下一步

1. 做一次旧存档迁移（P2），再决定数值差异。
2. 把 bot 脚本固化到 `tools/` 并接入 CI，防止“结算/复活/时钟”这类回归再次出现。
3. 需要时再给死亡表现补倒地/慢镜；对象池目前只覆盖高频实体，瓦片原型已共享，但尚未做 10 km 长跑审计。
