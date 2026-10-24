# Temple Run · Web Edition

用 Three.js 复刻的原版 Temple Run 1.39（Unity）网页版，并保留工程内的原版资源（骨骼角色、路面/转角/障碍 mesh、UI 图集、音效等）。

- 玩法：三条石径奔跑，左右换道 / 上下跳跃滑铲 / 路口转弯，收集金币与宝石，磁铁 / 加速 / 护盾 / 金币加成、金币倍率、断桥窄路坠崖、猴子偷金币、追逐者等原版机制。
- 资源：角色为原版 skinned mesh + 骨骼动画重定向；路面/墙体/门楣/障碍取自 APK；UI/音效/死亡插画为原版素材。
- 兼容：桌面键盘、触屏滑动/点按、倾斜换道（移动端）；局域网手机可扫码直连游玩。

![蓝色天空与转角](docs/screenshots/blue-sky.png)
![干净的转角视野](docs/screenshots/corner-clean.png)
![断桥单车道](docs/screenshots/cliff-single-lane.png)

## 运行网页版

```bash
npm install
npm run temple:dev -- --port 5173
# 浏览器打开 http://localhost:5173
```

构建：

```bash
npm run temple:build   # 产物在 target/temple-run/dist
```

## 操作

| 输入 | 动作 |
| --- | --- |
| ← / → | 换道、路口转弯 |
| ↑ / 点击屏幕 | 跳跃 |
| ↓ / 下滑 | 滑铲 |
| 倾斜手机 | 换道 / 路口倾斜转弯 |
| Esc / 暂停按钮 | 暂停 |

## 仓库结构

```
target/temple-run/      # 游戏本体（web 前端 + 分析脚本/素材清单）
target/temple-run/web/  # 页面与源码：src/main.js、runnerRig.js、sfx.js、style.css
target/temple-run/analysis/  # APK 逆向产物（rig json、贴图、清单、报告）
apk/                    # 原版 temple-run.xapk（分片，见 apk/README.md）
src/                    # 另一款小游戏「咩咩登峰」（Three.js 小羊登山）
docs/screenshots/       # 截图
```

## 原版安装包

GitHub 单文件上限 100 MB，`temple-run.xapk` 以 75 MB 分片存放在 `apk/`，重组方式见 [apk/README.md](apk/README.md)。

## 原版机制对照（IL2CPP 逆向）

| 原版字段/资源 | 网页版实现 |
| --- | --- |
| 蓝色天空、干净转角 | 蓝色渐变天空 + 浅蓝雾；转角仅保留低墙/火盆/箭头 |
| `kObstacleTreeJump` | 树墩排（跳跃） |
| `kObstacleTreeSlide` | 倒木横杆（滑铲） |
| `AllowTiltToTurn` | 倾斜换道 / 路口倾斜转弯 |
| `AllowFallOnCliffs` `CanPathExtendOnSide` `kPathLevelCliff` | 断桥单车道 + 坠崖死亡 |
| `CoinMagnetMultiplier` | 磁铁能力 |
| `FootStepsCliff` | 悬崖脚步音 |

更多开发记录见 [target/temple-run/progress.md](target/temple-run/progress.md) 与 [target/temple-run/README.md](target/temple-run/README.md)。
