Original prompt: 帮我参考第一个图，绘制一个小羊登山的 3d 游戏，使用 webgl，我要外层是 html，内部是 3d 引擎绘制。

- Created a Vite/Three.js project shell. The HTML layer holds the HUD, menus, and controls; Three.js draws the actual game scene.
- Implemented jump physics, platform landing, coin collection, camera tracking, finish/fail overlays, restart, keyboard and touch controls.
- Verified production build and Playwright screenshots for gameplay and fail state. Verified desktop layout and restart flow. A synthetic touch event lacked native pointer capture; the handler now tolerates it.
- Retested deterministic keyboard gameplay and mobile touch gameplay: first jump lands on platform 2 and collects 1 coin. Verified mobile viewport has no horizontal overflow or page errors. Desktop menu, fail screen, and restart were visually checked.
- No outstanding functional TODOs.
- Replaced the stylized sheep with a local textured CC0 GLB model, added local mossy rock glTF clones to platforms, and applied local grass PBR maps. Narrowed the snowcaps and refined mountain facets and pine forms for a more natural look.
- Playwright visual retest after asset integration: first jump and coin collection still work. Assets are bundled locally; source and license links are in ASSETS.md.
- User corrected the reference to the first image: 3D perspective stairs running diagonally up a mountain. Rebuilt the scene around a perspective camera, a continuous textured hillside, stone stairway, forest, coins and 3D bomb obstacles. Gameplay is tap-to-jump, second tap midair to skip a step, 30-second challenge.
- Verified via browser: six normal jumps reached step 6 with 3 coins; landing on bomb at step 7 ends run; a midair second jump skips to step 8; timer expiry ends run. No browser errors. Initial screenshot now shows the full route with an inline “开始” prompt.
- Verified complete run reaches step 36, 72 m, 14 coins, and the win overlay with 12.8 seconds left. Converted repeated pine meshes to five instanced draw groups; visual regression screenshot matches the prior composition.
