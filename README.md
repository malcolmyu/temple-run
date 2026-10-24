# 咩咩登峰

一个使用 Three.js / WebGL 绘制的小羊登山游戏。页面框架、菜单、分数和触屏按钮由 HTML/CSS 实现；透视山坡、连续石阶、小羊、金币和炸弹由 3D 场景绘制。

游戏使用本地打包的 CC0 3D 羊、苔藓岩石模型与草地 PBR 贴图。素材来源见 [ASSETS.md](ASSETS.md)。

## 运行

```bash
npm install
npm run dev
```

打开终端显示的本地地址。生产构建使用 `npm run build`。

## 操作

- 点击“跳一下”，或按 `空格`、`↑`、`W`：跳上下一阶
- 在空中再点一次或再按一次：跨过一阶，避开炸弹
- `F`：全屏
- 手机端使用屏幕底部的跳跃键

沿石阶登顶，收集金铃铛，并在 30 秒内避开炸弹。

## 神庙逃亡 Web Runner

独立游戏位于 [`target/temple-run/`](target/temple-run/)。运行 `npm run temple:dev` 启动，`npm run temple:build` 构建。
