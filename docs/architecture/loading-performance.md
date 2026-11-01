# 加载性能治理 · Round139

原始线上基线：源码ee26be79，Chrome桌面、同一机器/网络、未施加带宽或CPU模拟。三次样本均核实子资源transferSize非零，按钮可用时间4134/4566/4656ms。这里的“可交互”是全部游戏初始化成功后“开始奔跑”按钮首次启用；不是标准Lighthouse TTI。FCP来自PerformancePaintTiming。原始逐资源记录在analysis/loading139-before-online*.json。

## 可复核的本地生产构建对照

同一机器、375×812视口、相同MIME压缩、独立端口、Cache-Control:no-store。旧版本是优化前保留的dist，新版本是生产构建，所有资源transferSize均非零。较早的混合缓存试探样本已排除，归档文件已替换为可信样本。

| 指标 | 优化前 | 优化后 |
| --- | ---: | ---: |
| 应用子资源传输量（含估算头部） | 8,650,776 B | 4,042,676 B |
| 应用子资源请求数 | 162 | 35 |
| 首屏图像请求数 | 22 | 21 |
| 实际首屏GPU纹理 | 13 | 13 |
| FCP | 104 ms | 168 ms |
| 开始按钮可用 | 558.5 ms | 712 ms |
| 首屏全部JS压缩正文 | 255,953 B | 258,626 B |
| 首屏CSS压缩正文 | 5,979 B | 5,759 B |

上表只统计按钮可用前启动的应用assets，排除浏览器自动favicon及之后的请求，不含约1KB HTML。FCP是否改善直接看同视口表格，不把早期桌面样本的较低FCP代替最终结果。JS总量略增，收益在于小UI入口先绘制、游戏动态加载，以及商店/统计/目标/升级/帮助面板按需加载，而非声称总JS减少。Vite自动输出modulepreload并预加载动态import依赖；所有资源同源，没有添加无收益的外域preconnect。

## 处理与出处

- 69份OBJ/UV文本合成一个内容哈希JSON包，gzip约1.26MB。verify-runtime-assets逐项确认OBJ文本及UV数组与源文件一致，不量化几何。解析后释放传输用OBJ/UV文本引用；仅保留场景几何。GitHub Pages实测OBJ为application/x-tgif且未压缩，JSON有gzip；这解决了服务端默认MIME策略导致的传输浪费。
- 原有加载分为水纹理→其他纹理→光照→模型→角色/追逐者多波等待。现必需纹理、模型包和骨骼JSON并行启动；默认角色的网格/纹理也在场景加载前开始准备，消除最后一波等待；骨骼JSON共享fetch与解析，默认角色不再取两遍，8个追逐者共享一份数据，失败可重试。
- 9份仅供取证预览的景物改为调用时加载，previewScenery现在返回Promise；实际游戏主题和障碍模型仍全部在可交互前准备好，不把未加载的玩法资源藏到按钮后面。
- 删除无消费者的spark纹理请求。音频原本在用户交互后才获取，仍保持这一策略，不把音频提前到首屏。截图只在独立审计页加载，不进入游戏首屏。
- 保留全部原始图片，166份WebP交付副本与20份骨骼JSON副本在assets/runtime，文件名带SHA256前缀。HUD、数字和角色纹理不降尺寸且无损。墙面/树木1024→512，WebP质量94；光照图1024保持尺寸、去除当前不参与着色的alpha、质量94；特效共享图集1024保持尺寸、质量94。既有特效atlas继续共用，未重新打包HUD字形UV。
- runtimeAssets.generated.json为交付映射；runtime-assets.generated.css为无损HUD覆盖。`npm run temple:assets`从源资产复现（Python+Pillow），`temple:assets:verify`校验来源SHA、交付SHA及几何/骨骼内容；生产构建和CI使用已提交衍生物校验，不要求构建机现场安装Pillow。
- Pages固定cache-control:max-age=600并有ETag；本项目不能配置其任意响应头或Brotli。JS/CSS、纹理、模型包、骨骼使用内容哈希URL，防止复用旧内容；不是添加一个Pages不识别的_headers文件。未引入Service Worker常驻缓存。部署在600秒窗口内保留先前JS/CSS和runtime哈希资源，避免600秒内缓存的旧页面/延迟打开面板出现404；按600秒过期清理，连续快速发布也不会提前删除；已做TTL、快速连续发布、不延长过期时间及.git保护测试。

## 画质与未做部分

375×812同场景前后截图：loading139-quality-before.png / loading139-quality-after.png。HUD与数字保持清晰，石面近处高频细纹变柔和，因此不宣称无损画质；光照/特效有损编码也可能改变细微颜色。纹理尺寸、字节和像素RMS逐项在loading139-runtime-assets.json；原图单张尺寸全清单见loading139-texture-inventory.json。

没有做KTX2/Basis GPU压缩或AVIF；当前WebP降低传输量但不等于GPU压缩。两张1024纹理降512减少约8MiB的RGBA含mipmap理论占用，未把这个理论值称为实测峰值。未做手机物理真机、低端GPU、弱网/CPU节流矩阵；时间数字不能代表所有设备。所有主题模型暂仍合成一个必需包，未来可进一步分主题加载，但必须避免高速玩法遇到未加载资源。

线上优化后数据和部署验证在交付时追加；原始浏览器记录与应用构建哈希用于核对，不能把本地数字当作公网数字。

## 产物体积

以下为全部入口（含legacy与延迟面板）的产物，gzip为本地gzip9估算；不等同于用户首屏下载。逐文件清单在loading139-build-size.json。

| 产物 | 优化前原始 / gzip估算 | 优化后原始 / gzip估算 |
| --- | ---: | ---: |
| 全部JS | 1,011,294 / 295,691 B（3份） | 1,035,019 / 306,953 B（16份） |
| 全部CSS | 62,819 / 15,768 B（2份） | 63,151 / 16,294 B（5份） |

Three.js仍有约535KB原始大chunk（gzip约135KB），构建提示保留；没有通过调大warning阈值掩盖。全部产物JS并未减少，分包的目的为拆开UI/3D和延迟面板。部署保留源图及原始资产，整体站点磁盘占用增加，不能把首屏传输减少说成全站包体减少。
