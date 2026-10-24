# XAPK resource inspection

Input: `/Users/yuminghao/Downloads/temple-run.xapk`, package `com.imangi.templerun`, version 1.39.0. It contains a Unity 2022.3.62f2 Android build. The base APK's `sharedassets0.assets` was stored as 127 numbered parts; these were reassembled in a temporary directory for analysis.

UnityPy identified 2,365 objects in `sharedassets0.assets`, including 24 meshes, 39 textures, 45 animation clips and 17 skinned mesh renderers. Additional hashed Unity asset files contain scene meshes plus `wallTexture` and `treeTexture` atlases.

The Web version now uses the default `Jhony_Export3` runner: mesh path ID 90 and `playerTexture` path ID 63, linked by SkinnedMeshRenderer 1936. It also uses the original pursuing enemy mesh path ID 96 and `enemyTexture` path ID 53, linked by SkinnedMeshRenderer 1940 and material path ID 26. Stone and bark surfaces use the extracted `wallTexture` and `treeTexture` atlases. Extracted environment meshes and the alternate `indi_Export1` skin are retained under `analysis/extracted/` but are not in the browser build because their material mapping did not render correctly.

The runner and enemy meshes are exported as static OBJ geometry. The runner pose, pursuit movement, curved path, 90-degree junctions, hazard logic, camera, and physics are Web implementations; Unity animation clips and native game code have not been ported. The extracted runner rig and animation samples are retained under `analysis/extracted/runner-rig.json` for future work. This is a playable reconstruction with authentic selected assets, not a frame-accurate copy of the Android game.

Tools: UnityPy for Unity asset parsing and Wavefront OBJ / PNG export; Three.js for browser rendering. The original XAPK was read only and was not modified.
