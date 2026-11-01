# Temple Run · Web Edition

当前目标是**玩法完备、完整可玩**。正常入口运行带种子的随机课程，不以视频逐帧、分数或投影一致作为验收门槛。原APK资源和已核对的IL2CPP规则用于实现具体元素；无法确认的生成权重、部分玩法和经济规则明确标注为网页假设。

- [整体设计与架构](docs/game-design.md)
- [逐项功能状态、规则来源与验收证据](docs/playability-acceptance.md)
- [实施记录与剩余缺口](docs/implementation-log.md)
- 视频观察：[短视频](docs/reference/BV1ypuKzPErT-analysis.md)、[21分钟视频](docs/reference/BV1de411T7Gs-observations.md)

## 运行

```bash
npm install
npm run dev -- --port 5173
```

打开`http://localhost:5173/`，默认是Three.js + TypeScript/ECS + Vue版本。`npm run temple:dev`仍是同一入口；旧版保留在`/legacy.html`。显式`?route=reference`用于历史录像路线对照，不是正常默认课程。

```bash
npm run temple:typecheck
npm run temple:test:core
npm run build
```

默认构建产物位于`target/temple-run/dist`；`npm run temple:build`等价。核心检查包含输入仲裁、弹层输入、会话结算、道路/动作/横移安全、加速交接、购买、生成组合、历史回收、火墙、分支和金币门槛。浏览器实际试玩与帧时证据另见验收表，静态检查不替代真机验收。

## 操作与玩法

| 输入 | 动作 |
|---|---|
| ← / →、左右滑动 | 直路换道；靠近路口时转弯，T口可选左右 |
| ↑、上滑、点按游戏画面 | 跳跃 |
| ↓、下滑 | 滑铲 |
| 按住A/D、启用后倾斜手机 | 连续横移；路口仍需方向键或左右滑动 |
| Esc、P、暂停按钮 | 暂停/继续；设置等弹层打开时不触发游戏操作 |

设置内有操作说明与倾斜授权状态。普通换道最外侧会限幅，不应凭空撞墙；真实障碍、漏转与无支撑道路仍会失败。

石桥、木桥和悬崖有不同道路、支撑和障碍。支持短坑/长坑、半边窄路、长窄墙、转角、T口和分路合流；树根需跳，树洞需滑，石墩需绕，火塔与低火墙按各自结构选择动作。低火墙和风险奖励分支属于明确的网页变体，未冒称已确认的原版独立规则。

金币、宝石、四类道具、追逐者、翅膀/起跑、死亡复活、结算、角色与升级组成可玩闭环。结果页“结算并去商店”先结束本局并入账；复活需在结算前选择。经典模式各皮肤不会暗中改变跑速。

## 当前验证范围

当前证据包含普通左右与路口输入、自然生成/收集四道具、五类道路错误操作、自然绊倒/被捕、实际购买后的升级效果、失败/复活/结算/重开、六万米流式回收对照，以及桌面Chrome三分钟自然三主题实际帧时。详细条件和限制以验收表为准。

手机触摸链路已有浏览器原生触摸模拟验证，物理iOS/Android传感器、权限、延迟与性能仍待验收。持久操作回放和部分视觉/原版证据也尚未完成，不能将旧文档的全绿表理解为整体完成。

## 工程与历史版本

- `target/temple-run/web/src/game/`：课程生成、输入、会话、物理、碰撞与渲染。
- `target/temple-run/web/src/ui/`：菜单、HUD、结算、商店和设置。
- `target/temple-run/web/public/assets/`：导出资源。
- `target/temple-run/analysis/`：逆向与试玩证据。
- `tools/`：导出、源规则审计、单测和浏览器驾驶脚本。
- `apk/`：安装包分片，见[说明](apk/README.md)。

根目录`src/`另有旧的小羊游戏，使用`npm run summit:dev`或`npm run summit:build`运行/构建；它不再是本项目默认入口。旧神庙逃亡说明见[target README](target/temple-run/README.md)，其中历史状态不替代当前设计。

在线入口：[v2](https://malcolmyu.github.io/temple-run/)、[legacy](https://malcolmyu.github.io/temple-run/legacy.html)。发布工具为`tools/deploy-pages.sh`；线上实际源码提交以`deployment.json`核对。

## TypeScript 与加载治理

[迁移清单与唯一JS豁免](docs/architecture/typescript-migration.md) · [性能前后数据与限制](docs/architecture/loading-performance.md) · [375像素画质对照](docs/architecture/loading-quality.html)。

浏览器回归源码现在为TS，先生成临时可求值脚本再通过浏览器开发接口执行：

```bash
npm run temple:browser:compile -- tools/test-temple-input-router.browser.ts /tmp/temple-input.js
```

`temple:typecheck`包含源码JS白名单/哈希检查、现行游戏strict检查和工具全集检查。需要重新生成交付纹理/模型时运行`npm run temple:assets`（Python+Pillow）；原图不覆盖，常规构建只校验已提交的衍生资源。Pages部署保留上一代哈希资源，避免缓存旧HTML引用失效，600秒窗口过期后清理旧文件。

- [完整视频271帧参考](https://malcolmyu.github.io/temple-run/screenshots/BV1ypuKzPErT/) · [半边路纹理对照](https://malcolmyu.github.io/temple-run/screenshots/texture141/)
- [原版拓扑证据](docs/original-topology-evidence.md) · [地图/纹理/难度治理报告](docs/architecture/map-texture-pacing-141.md)
