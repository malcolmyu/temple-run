import * as T from 'three';
import {nativeCoinMaterial} from '../target/temple-run/web/src/game/nativeCoinMaterial';
const renderer=new T.WebGLRenderer({antialias:false,alpha:true});renderer.setSize(1,1);renderer.setPixelRatio(1);
const target=new T.WebGLRenderTarget(1,1),scene=new T.Scene();
const texture=new T.DataTexture(new Uint8Array([255,200,0,0]),1,1,T.RGBAFormat);texture.colorSpace=T.SRGBColorSpace;texture.needsUpdate=true;
const material=nativeCoinMaterial(texture),mesh=new T.Mesh(new T.PlaneGeometry(.02,.02),material);scene.add(mesh);
const camera=new T.OrthographicCamera(-.01,.01,.01,-.01,1,200);camera.position.set(0,0,0);
const rows=[];
for(const test of [{name:'near',x:0,z:-10},{name:'middle',x:0,z:-50},{name:'offAxisSameRadius',x:30,z:-40},{name:'far',x:0,z:-90}]){
 mesh.position.set(test.x,0,test.z);camera.left=test.x-.01;camera.right=test.x+.01;camera.updateProjectionMatrix();
 renderer.setRenderTarget(target);renderer.clear();renderer.render(scene,camera);
 const pixel=new Uint8Array(4);renderer.readRenderTargetPixels(target,0,0,1,1,pixel);
 const visibility=Math.max(0,Math.min(1,(80-Math.hypot(test.x,test.z))/60));
 const expected=[255,200,0].map((v,i)=>Math.round(v*visibility+[50,82,86][i]*(1-visibility))).concat(255);
 rows.push({...test,pixel:Array.from(pixel),expected,passed:expected.every((v,i)=>Math.abs(v-pixel[i])<=1)});
}
mesh.position.set(0,0,-10);mesh.rotation.y=Math.PI;camera.left=-.01;camera.right=.01;camera.updateProjectionMatrix();renderer.setClearColor(0,0);renderer.clear();renderer.render(scene,camera);const backPixel=new Uint8Array(4);renderer.readRenderTargetPixels(target,0,0,1,1,backPixel);
(window as any).__coinFogGpuResult={rows,backPixel:Array.from(backPixel),passed:rows.every(r=>r.passed)&&backPixel.every(v=>v===0),scope:'Radial Gamma fog, opaque alpha and culling only; native diffuse/lightmap binding remains unresolved'};
renderer.dispose();target.dispose();mesh.geometry.dispose();material.dispose();texture.dispose();
