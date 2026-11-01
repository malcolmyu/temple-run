# TypeScript 源码治理

基线 ee26be79：git ls-files 共107个 .js，全部是源码，没有受跟踪dist JS。逐项原路径、目标路径与分类见 javascript-inventory.json。dist/node_modules为忽略产物，不纳入源码检查；外部three/addons导入路径的.js是依赖包接口，不是仓库JS源码。

迁移分批：

1. 浏览器回归与诊断脚本、Vite配置、曲线/材质/法线纯模块。保留原脚本求值结果，通过 `npm run temple:browser:compile -- tools/test-temple-input-router.browser.ts /tmp/input.js` 生成临时浏览器可执行表达式。编译输出不提交。应用strict检查与全部tools的独立typecheck都必须通过。已验证25组核心、生产构建、15项实际浏览器输入回归。
2. 音频、骨骼、预览工具与剩余活动入口，再按相同门槛验证。

浏览器历史夹具的原始动态状态通过声明的调试窗口属性读取，独立tools配置暂不启用strict；并非关闭类型检查，也不使用ts-nocheck。生产游戏保留strict。对已有TS工具纳入检查时暴露的几何子类型、DOM焦点元素和历史字典类型已补充标注。

唯一计划豁免：target/temple-run/web/src/main.js，是legacy.html使用的历史2942行旧游戏对照入口；不由现行Vue/ECS应用导入。为保留可运行对照，不在本次重写旧引擎。迁移依赖后仅更新其模块后缀引用，最终豁免校验锁定文件哈希；若需改变行为，必须迁移或明确更新审计理由。

第二批已迁移：音频与骨骼实现、全部预览/取证页脚本、根目录src/main.ts，并将entrance-search.html中的内联模块提取为TS。音频WebAudio节点、播放句柄、选项和骨骼加载选项有显式接口；导入的历史rig JSON/诊断快照内部仍有显式any，尚未完成所有原始资产schema的严格建模。预览与旧夹具由tools配置进行非strict检查，现行游戏与运行时模块为strict；不使用ts-nocheck或忽略整个文件。

当前唯一JS豁免及SHA256见javascript-exemptions.json，`npm run temple:check:source`纳入总typecheck和CI；新增受跟踪JS会失败。构建产物不提交。Three.js第三方包模块后缀.js不改写。`npm run temple:browser:compile -- 输入.ts /tmp/输出.js`通过esbuild生成临时脚本，兼容CI的Node20；直接Node运行TS仅适用于支持类型擦除的较新Node。

第二批验证：应用strict、工具全集typecheck、25组核心、骨骼滑铲动画测试、生产构建与8项实际音频/死亡/重开检查通过。

第三批性能实现同样为TS；总检查已加源码白名单与衍生资源验证，核心套件扩至27组。根目录旧小羊入口也已通过生产构建。唯一legacy生产入口在真实浏览器加载无error。保留的JS文件完整路径与原因、SHA256由javascript-exemptions.json管理；原始证据JSON/Markdown中的历史代码文字与生成审计HTML不改写。

审计页原本写在Python模板里的交互JS也抽为tools/game-audit-client.ts，生成HTML仅内嵌其esbuild产物；与entrance-search的内联模块一起纳入清单和typecheck。
