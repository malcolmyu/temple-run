# 视觉恢复、KTX2与持久缓存

## 本轮取舍

旧quick包把直路只保留承重顶面，墙、立柱、树、拱门、多种障碍不在包中就返回null；未打包贴图使用1×1米色。这不是完整的可玩视觉。现移除1×1回退，开局包含仓库69份道路/障碍模型的完整顶点、面与UV1（并非宣称69份均为未经改造的原版几何）；仅省略运输法线，载入时重算法线，位置量化误差≤0.00005。壁面/树512px，烘焙光256px，其他必要纹理128px，默认角色完整网格/动作与真实贴图。主要UI以文字HUD、金币/特效图集提供，纸卷和商店按入口加载。保留全部源PNG/WebP及OBJ。

石/木/悬崖直路、左右角、T、过渡帽、长短窄路、坑、树根/拱门/火塔/石墩等均在开局包；远景装饰、高清贴图、商店与非默认角色不阻塞菜单。木桥角不再因quick标志误用石角；删除旧quickCliffSupport灰色覆面，悬崖直接使用完整现有几何与真实纹理。当前局只热更新材质引用，不切换道路几何；所有模板和当前场景共享材质一起更新，保留Gamma、UV变换、当前道路支撑，回收退休GPU纹理。实测14处替换，无须重开。非必要远景资源仍按需，未做全地图装饰扩建。

完整视觉并没有达到三秒冷启动。无缓存的开局包约1.04MB gzip，恢复素材使其明显大于旧98KB稀疏包；不以删除必需素材冒充性能达标。HTML内联提前查缓存/下载开局包，与模块下载重叠。运行诊断window.__startupTiming、__assetCache、__visualTextures、__visualUpgrade均保留。

## KTX2

Three KTX2Loader + 本地Basis transcoder，worker数1；在开跑、追逐者到位后顺序加载，未进入首帧关键路径。壁面/树/水使用ETC1S，透明叶片与烘焙光使用UASTC，均含mipmap；编码Y翻转匹配原TextureLoader；颜色纹理编码sRGB，原Gamma shader采样仍用NoColorSpace。当前素材集没有法线纹理，未将法线误当sRGB。纹理/转码器异常回退原优化WebP，支持`?texture=webp`作对照。转码器随构建发出，不新增跟踪的第三方源码JS。

近景比原高分辨率素材有细节损失，ETC1S有损；光照图KTX512px、WebP回退1024px，比较不能全部归因为格式。显存为逐贴图mipmap字节估算，不是驱动总显存。CPU/WASM转码与GPU上传分开记录；压缩纹理GPU计时查询返回0时记null，不冒称零耗时。KTX文件可能大于WebP，GPU压缩不等于网络压缩。可参考[Three官方KTX2Loader](https://threejs.org/docs/pages/KTX2Loader.html)。

本机6×CPU、未限网的一次加载实验：五张KTX转码时间87.1/31.8/33.8/2.5/12.3ms（首次含worker初始化），上传提交0–1.4ms；GPU查询不可用。WebP GPU上传查询约0.23–0.34ms、CPU提交4.7–133.7ms。KTX估算1,485,616B，WebP回退估算10,136,233B，后者包括1024px烘焙光；相同像素尺寸RGBA+mipmap与本机压缩目标约4倍差距。原始实验JSON在本目录。

## 持久缓存

选择Cache Storage而非IndexedDB：存储原始Response，按内容哈希URL查找。开局包/模型包/rig包/纹理/本地Basis均接入。缓存命名`temple-payload-v2-<构建提交前12位>`，新版本清除旧命名空间；只处理本项目命名空间，不清除用户其他站点数据。

32MiB上限，写入前按保存顺序淘汰旧项（FIFO，不冒称LRU）；超过单项上限不写入。存储打开/读取超过200ms走网络；隐身限制、QuotaExceeded与Cache API错误都回退网络；写入失败先清一项再试一次。Cache API可能被浏览器自主清理，持久命中不保证永久。配额/拒绝访问/版本清理/容量淘汰由真实cachedResponse调用点测试。可用`?cache=off`禁用持久缓存对照。

## 三态与验收

本地生产gzip6、375×812、Slow4G(180000B/s、562.5ms)、6×CPU，每态三轮。冷：清项目Cache Storage且HTTP禁缓存；温：保留Cache Storage但HTTP禁缓存；热：保留二者，资源HTTP max-age600，先明确预热一轮。未清OS/DNS/TLS缓存、未做真机。可玩TTI为ready后实际start且两个模拟步，不含教程/开场观看，也不是Lighthouse静默TTI。

初步本地中位数：冷9776.2ms、温4407.0ms、热1213.0ms。与旧稀疏视觉包的数字不能当同画质对照。首屏字节与线上结果以随后补充的报告为准。

同机位截图在docs/screenshots/visual-loading：before与after为距离20、相同相机；after-ktx为当前局热更新；30s为受控加速保护测试（模拟31.8秒，非声称自然无道具存活）；half-road为右侧安全车道。左右换道实际playing且lane0→1；半边路右侧可过，缺失侧water；被阻断Basis WASM时五贴图全部WebP-fallback且playing/rig ready。追逐者未改回球；结算/商店继续回归。

木桥与悬崖截图使用planTheme、seek与测试加速保护使镜头收敛，不冒称自然随机跑出的主题时序。

## Pages 最终三态

运行代号a202a76fd9a7c292b482f6b33ec0005ef637db3e。完整每轮数据在本目录，汇总见measurements.md。线上冷可玩9611.7/9800.9/9798.4ms，中位数9798.4ms；温4312.1/4282.4/4265.2ms，中位数4282.4ms；热1360.4/1270.1/1257.0ms，中位数1270.1ms。每次先调用flushAssetCache；冷清本项目命名空间+HTTP禁缓存，温仅禁HTTP缓存，热显式预热一次再测。仍是Chrome仿真，不是真机。

KTX开启与texture=webp各三次热态首帧对照：中位数1220.9ms / 1208.3ms，约13ms差异不作显著性能结论；二者格式加载都在首帧之后。WASM转码、GPU字节估算另见visual-ktx-bench.json；GPU查询返回0时已记为null。

线上审计页：/visual-audit/，含7幅压缩截图约282KB。完整视觉恢复后的冷启动比稀疏版本慢，未实现3秒冷启动，这是明确剩余限制。
