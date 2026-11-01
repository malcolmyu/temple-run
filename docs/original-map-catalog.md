# 原版地图资源结论（2026-11-01复核）

本页取代早期“没有路面/T网格”及“只有侧向装饰”的结论。证据分层和方法地址见[原版拓扑证据](original-topology-evidence.md)。

| 项目 | 已确认原版证据 | 当前网页实现 |
| --- | --- | --- |
| 三种路径主题 | PathLevel:Plank=1/Temple=2/Cliff=3 | 木桥/石桥/断崖，已接入 |
| 直道 | templeStraightHorz/Vert、plankStraight*、cliffStraight*；已导出真实OBJ+UV1 | 使用原网格/原生光照材质 |
| 90°转角 | templeTurnA-D、plankTurnA-D、cliffTurnA-D | 已接入 |
| T路口 | templeTLeft/TRight/TUp/TDown，plank和cliff同族；真实网格/Region2D存在 | 使用原T几何，左右出口可选 |
| 侧路径 | sAllowSidePaths、CanPathExtendOnSide、DoesSidePathHaveObstacles/Coins；四向Path引用 | 有原版结构依据；网页未完整复制原网格生成器 |
| 平行分路后定距合流 | **没有证据证明原版采用网页的同里程平行支路与固定合流距离** | 明确网页设计：原4m路宽内中央缺口、两侧可选、两端6m连接面；不是原生T拓扑 |
| 短/长半边路 | templeStraightNarrowSmall*、NarrowLong*含A/B，真实网格和支撑多边形 | 已接入，支撑与显示一致性专项验证 |
| 短/长坑 | templeStraightHole*、HoleLongA/B* | 已接入 |
| 树障碍/火塔 | TreeTrip/Jump/Slide、FlameTowerHigh* | 原网格，按原生碰撞/动作规则 |
| 单车道石墩/火墙 | 没有独立原生石墩prefab证据 | 网页机制，明确自制 |

“柱廊/周年神庙”是早期网页景物分类，不是恢复出的额外PathLevel。原生塔门是地标，不等于必须滑铲的低拱门。完整路径长度/候选权重仍未完整恢复，不称1:1。
