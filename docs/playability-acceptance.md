# 玩法完备与可玩性验收表

更新：2026-11-01，正常生成规则beats-v5。验收目标是玩法与完整闭环，不是录像逐帧/分数/投影一致。设计和规则见[game-design](game-design.md)，逐轮过程见[implementation-log](implementation-log.md)。

“有”表示已有功能与相应证据，不代表原版每个参数已证实；“有，待复核”表示证据来自旧版本或未覆盖真机。“不准/假设”单列原版忠实度，避免把网页可玩实现误写成逆向结论。当前证据只对记录覆盖的范围有效。

## 核心操作与道路

| 要求 | 有/缺/不准 | 证据与边界 |
|---|---|---|
| 普通左右换道，不虚构撞墙 | 有；当前回归通过 | [最新15项输入](../target/temple-run/analysis/gameplay-modal-input-after.json)：左右、边缘限幅、空中/滑铲横移、指针滑动；实际树根仍碰撞、漏转仍失败 |
| 路口转弯、左右转角、T口两方向 | 有；当前回归通过 | 同上两转角/T两臂；[六万米正常路线](../target/temple-run/analysis/gameplay-path-compaction-long-run.json)验证当前路径压缩后通行。不是仅依赖诊断seek |
| 石桥、木桥、悬崖主题及高差连接 | 有；当前长跑覆盖，接缝专项为历史证据 | 六万米course.surfaces、features及正常通行；[历史连接段](../target/temple-run/analysis/gameplay-transition-pairs-natural.json)。主题长度/切换保留原代码约束与网页分组假设，非视频时间表 |
| 断桥、短坑 | 有 | [当前自然道路失败30项](../target/temple-run/analysis/gameplay-current-road-failures.json)含未跳短坑；当前15项输入有跳坑/真实失败 |
| 长坑与成对桥帽 | 有；当前自然生成/通行与错误动作专项 | 当前六万米course中的longGap与速度预算回退；当前道路失败30项记录自然达到pitLongB/A后不跳会失败。静态encounter-safety验证实际腾空跨度；不把低速替换的短坑算成长坑通过 |
| 半边窄路、长窄墙 | 有；当前短/长窄路错误侧专项 | 当前course.narrows；当前道路失败30项记录narrowSmall与narrowLong错误侧均失败；[当前诊断激活边界14项](../target/temple-run/analysis/gameplay-current-support-handover-diagnostic.json)含窄路到期安全交接；[自然拾取后3次解除](../target/temple-run/analysis/gameplay-current-support-handover-natural.json)全部接地、supported且playing |
| 左右分路与合流 | 有；风险规则是网页假设 | [实际左右风险/安全臂](../target/temple-run/analysis/gameplay-branch-risk-manual.json)：安全5币、风险9币或宝石；[当前压缩后分路死亡复活合流](../target/temple-run/analysis/gameplay-path-compaction-regression.json) |

## 障碍、收集与道具

| 要求 | 有/缺/不准 | 证据与边界 |
|---|---|---|
| 树根跳跃、低树根绊倒 | 有；跳跃与追逐专项当前回归 | 当前输入与长跑；[当前自然追逐专项](../target/temple-run/analysis/gameplay-current-chase.json)验证首次绊倒、自然成对低树根第二次失误被捕、安全驾驶恢复窗口及间距拉开；无生成临时根 |
| 拱门/树洞滑铲 | 有；当前正常长跑通行 | treeSlide动作与碰撞定义；历史角色全动作/输入脚本也覆盖滑铲。并非所有视觉变体都在本轮手工逐个按键 |
| 火塔 | 有 | 原资源/代码碰撞，保留滑铲与高金币跳跃选择；当前正常长跑通行。原版独立参数证据见既有native测试 |
| 低火墙 | 有；原版独立身份/规则未证实 | [真实Up通过/Down死亡](../target/temple-run/analysis/gameplay-fire-wall-manual.json)，当前风险分支也真实通过；使用原火焰贴图，尺寸/生成门槛是明确网页假设 |
| 石墩 | 有；部分解法为网页设计 | 当前course生成和长跑；独立横移/混合横移跳滑预算测试。不是把皮肤上的石头当碰撞实现 |
| 磁铁、加速、护盾、金币奖励 | 有；当前四类自然收集已重测 | [当前四种子24项验收](../target/temple-run/analysis/gameplay-current-power-coverage.json)，无spawn/seek/强制power，检查collected与powerPickups。存档预先解锁四类，不证明零升级开局可直接生成全部。金币奖励是即时奖励，不伪装成持续倍率 |
| 金币、高值币、宝石 | 有；价值/形态部分原规则，宝石经济是网页扩展 | 当前分路实际5币/9币/宝石增量；[历史特殊布币](../target/temple-run/analysis/gameplay-tree-coins-natural.json)、[升级效果](../target/temple-run/analysis/gameplay-upgrade-native-levels.json)。完整原版所有布币模式尚未确证 |
| 追逐者 | 有；当前自然追逐/被捕/复活，视觉逐主题仍待复核 | 上述追逐专项，不声称已对每种主题逐帧验证脚步/接触姿态 |

## 本局、成长和运行入口

| 要求 | 有/缺/不准 | 证据与边界 |
|---|---|---|
| 死亡→结算→重开 | 有；当前多次实际验证 | 输入15项、六万米、四道具24项均到ended再回playing |
| 宝石复活 | 有；网页经济扩展 | 当前分路死亡后实际点复活、同runId后合流；[保护反馈](../target/temple-run/analysis/gameplay-revive-feedback.json)验证倒计时/暂停/清理 |
| 天使翼/永久翼、起跑 | 有；购买使用当前验证，双翼/起跑专项为历史证据 | [结算收益购买翼并新局自动复活](../target/temple-run/analysis/gameplay-result-store-after.json)；[历史双复活/起跑](../target/temple-run/analysis/gameplay-utility-objectives.json) |
| 结算入账与商店 | 有；当前真实UI闭环 | 本局713币→结算商店713→买500币翼余额213→新局使用；重复打开无重复入账。结果页明确“结算并去商店”，结算前仍可复活 |
| 升级 | 有；六类升级当前UI购买与自然效果 | [当前24次实际购买](../target/temple-run/analysis/gameplay-current-upgrade-purchases.json)与[刷新后自然效果](../target/temple-run/analysis/gameplay-current-upgrade-effects.json)，覆盖四类道具0→6。[金币价值同路线收入对照](../target/temple-run/analysis/gameplay-current-coin-value.json)、[高值币各档首次观察](../target/temple-run/analysis/gameplay-current-high-coins.json)及[八档扣款](../target/temple-run/analysis/gameplay-current-coin-upgrade-ledger.json)覆盖另两类。高值币门槛原默认，金币价值为网页扩展；真机与所有组合效果仍未泛化验收 |
| 角色购买/装备/开跑 | 有；网页9角色，原版完整收藏未确证 | [9角色闭环](../target/temple-run/analysis/gameplay-store-closure.json)。网页价格明示，不声称完整原版14角色价格 |
| 分数/倍率/目标 | 有；原55项目标目录已接入 | [无道具高分](../target/temple-run/analysis/gameplay-power-free-score.json)、native目标/升级/生涯单测。没有以录像某秒分数为验收 |
| 暂停/后台/横屏 | 有；桌面浏览器验证，真机待验 | [焦点暂停](../target/temple-run/analysis/gameplay-focus-pause.json)、[小屏/横屏](../target/temple-run/analysis/gameplay-mobile-hud.json)；归位不自动恢复 |
| UI弹层不偷偷开跑/恢复 | 有；当前真实键盘验证 | 最新modal-input记录覆盖5菜单面板、暂停设置、首次说明；关弹层后输入恢复 |
| 启动失败恢复 | 有；当前实际资源阻断验证 | [失败→重试→恢复→开始→失败重开](../target/temple-run/analysis/gameplay-startup-retry.json)，不清存档；不承诺无法支持WebGL设备可以靠重试修复 |
| 资源与性能 | 部分完成 | 六万米渲染池趋稳、旧fork回收、当前path3..5段；[课程历史回收](../target/temple-run/analysis/gameplay-course-compaction-long-run.json)后正常课程片段6..7，保留前驱和绝对编号；仅证明采样范围内资源稳定。20/40/60Hz是模拟步长测试，不是设备渲染FPS或堆内存上限证明；另有[桌面开局15秒真实RAF](../target/temple-run/analysis/gameplay-live-frame-controlled.json)，DPR2/750×1624约59.8FPS，仅该环境与开局范围；[桌面三分钟自然三主题](../target/temple-run/analysis/gameplay-live-three-themes-summary.json)约59.9FPS，最大83.4ms，仍不是手机或所有设备性能证明 |
| 手机触摸/倾斜 | 有接入，缺真机验收 | [浏览器原生触摸15项](../target/temple-run/analysis/gameplay-native-touch.json)已通过，派发到canvas的22个事件均isTrusted=true、pointerType=touch，另有权限分支模拟；这是桌面Chrome触摸模拟，不能替代iOS/Android传感器、真实权限和触摸延迟 |
| 持久输入回放 | 缺 | 现有seed和诊断步进可重跑课程，尚不是可持久保存、完整还原真人操作的回放系统 |

## 后续推进顺序

1. 将历史专项中仍影响完整可玩的部分迁移到当前正常生成版本，优先错误动作失败、保护交接和成长效果；不把旧绿灯当新版本总验收。
2. 课程历史回收已完成当前长跑与完整历史对照；继续验证真实设备堆占用和渲染帧时，不以有界记录数替代性能实测。
3. 真机输入/传感器/渲染性能验收，明确实际设备与环境。
4. 持久操作回放及逐元素反馈；原版证据继续补充，拿不到的保留假设标签。

这份表是验收证据索引，不是整体完成声明，也不把“有实现”替换成“已在所有设备正确运行”。
