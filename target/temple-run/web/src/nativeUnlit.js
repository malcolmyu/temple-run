import * as THREE from 'three';

/** Imangi/Unlit/Opaque (sharedassets0 shader 113) outputs MainTex only.
 * Its saved legacy _Color is unused by the native GLES fragment shader.
 * @param {THREE.Texture|null} texture
 * @param {THREE.Side} [side]
 */
export function nativeUnlitMaterial(texture, side = THREE.FrontSide) {
  return new THREE.MeshBasicMaterial({
    map: texture, color: 0xffffff, side, toneMapped: false, fog: false,
  });
}
