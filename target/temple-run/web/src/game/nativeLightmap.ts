import * as THREE from 'three';

const encodedTextures=new WeakMap<THREE.Texture,THREE.Texture>();
/** The original project renders Gamma RGB; preserve shared fallback sRGB textures. */
function nativeGammaTexture(source: THREE.Texture): THREE.Texture {
  if(source.colorSpace===THREE.NoColorSpace)return source;
  let encoded=encodedTextures.get(source);
  if(!encoded){
    encoded=source.clone();
    encoded.colorSpace=THREE.NoColorSpace;
    encoded.needsUpdate=true;
    encodedTextures.set(source,encoded);
  }
  return encoded;
}

/** Native Imangi/MachuLightmap/Opaque VertexFog: no dynamic lighting or tone map. */
export function nativeLightmapMaterial(main: THREE.Texture, lightmap: THREE.Texture, fog = true): THREE.ShaderMaterial {
  return new THREE.ShaderMaterial({
    side: THREE.DoubleSide,
    toneMapped: false,
    uniforms: { mainTexture: { value: nativeGammaTexture(main) }, bakedTexture: { value: nativeGammaTexture(lightmap) }, fogEnabled: { value: fog ? 1 : 0 }, fogColor: { value: new THREE.Color(50/255,82/255,86/255) } },
    vertexShader: `attribute vec2 uv1;
      varying vec2 baseUV; varying vec2 bakedUV; varying float fogAmount;
      uniform float fogEnabled;
      void main(){
        vec4 world=modelMatrix*vec4(position,1.);
        baseUV=uv; bakedUV=uv1;
        fogAmount=fogEnabled*clamp((distance(world.xyz,cameraPosition)-20.)/60.,0.,1.);
        gl_Position=projectionMatrix*viewMatrix*world;
      }`,
    fragmentShader: `uniform sampler2D mainTexture; uniform sampler2D bakedTexture;
      uniform vec3 fogColor;
      varying vec2 baseUV; varying vec2 bakedUV; varying float fogAmount;
      void main(){
        vec4 color=texture2D(mainTexture,baseUV)*texture2D(bakedTexture,bakedUV);
        // Unity RenderType=Opaque never composites baked-map alpha with the page.
        gl_FragColor=vec4(mix(color.rgb,fogColor,fogAmount),1.);
        // Native Gamma project: texture product and fog mix already encode display RGB.
      }`,
  });
}

export function attachNativeLightmapUV(group: THREE.Group, coordinates: number[]): void {
  let offset=0;
  group.traverse(object=>{
    const mesh=object as THREE.Mesh;
    if(!mesh.isMesh)return;
    const count=mesh.geometry.getAttribute('position').count;
    if(offset+count*2>coordinates.length)throw new Error('Native lightmap UV count does not match OBJ');
    mesh.geometry.setAttribute('uv1',new THREE.Float32BufferAttribute(coordinates.slice(offset,offset+count*2),2));
    offset+=count*2;
  });
  if(offset!==coordinates.length)throw new Error('Unused native lightmap UV coordinates');
}
