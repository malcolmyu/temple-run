import * as THREE from 'three';
/** Coin shader109 uses encoded Gamma texture values, radial vertex fog and opaque
 * output. Native Lambert/lightmap runtime bindings are still unresolved; this
 * restores the evidenced fog/color path without inventing a directional light.
 */
export function nativeCoinMaterial(source:THREE.Texture):THREE.ShaderMaterial {
 const main=source.colorSpace===THREE.NoColorSpace?source:source.clone();
 if(main!==source){main.colorSpace=THREE.NoColorSpace;main.needsUpdate=true;}
 return new THREE.ShaderMaterial({
  side:THREE.FrontSide,toneMapped:false,
  uniforms:{mainTexture:{value:main},fogColor:{value:new THREE.Color(50/255,82/255,86/255)},fogStart:{value:20},fogEnd:{value:80}},
  vertexShader:`varying vec2 baseUV;varying float visibility;
    uniform float fogStart;uniform float fogEnd;
    void main(){
      vec4 world=modelMatrix*vec4(position,1.);
      baseUV=uv;
      visibility=clamp((fogEnd-distance(world.xyz,cameraPosition))/(fogEnd-fogStart),0.,1.);
      gl_Position=projectionMatrix*viewMatrix*world;
    }`,
  fragmentShader:`uniform sampler2D mainTexture;uniform vec3 fogColor;
    varying vec2 baseUV;varying float visibility;
    void main(){
      gl_FragColor=vec4(mix(fogColor,texture2D(mainTexture,baseUV).rgb,visibility),1.);
    }`,
 });
}
