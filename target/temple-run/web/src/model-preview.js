import * as THREE from 'three';
import { OBJLoader } from 'three/addons/loaders/OBJLoader.js';
const scene=new THREE.Scene();scene.background=new THREE.Color(0x647869);scene.fog=new THREE.FogExp2(0x647869,.012);
const camera=new THREE.PerspectiveCamera(60,innerWidth/innerHeight,.1,180);camera.position.set(0,8,18);camera.lookAt(0,1,-15);
const renderer=new THREE.WebGLRenderer({antialias:true});renderer.setSize(innerWidth,innerHeight);document.body.append(renderer.domElement);
scene.add(new THREE.HemisphereLight(0xffffff,0x6d604c,3));const sun=new THREE.DirectionalLight(0xffe2a7,3);sun.position.set(-12,20,8);scene.add(sun);
const texture=window.texture=new THREE.TextureLoader().load('/assets/apk/wallTexture.png');texture.colorSpace=THREE.SRGBColorSpace;
new OBJLoader().load('/assets/apk/temple-straight-vert.obj',mesh=>{
 mesh.traverse(p=>{if(p.isMesh)p.material=new THREE.MeshBasicMaterial({map:texture,side:THREE.DoubleSide})});
 mesh.position.set(-559.952209,-1335.349731,30);
 const trans=new THREE.Group();trans.position.y=-15.000059;trans.quaternion.set(-5.5536e-8,-.7071068287,-.7071068287,5.5536e-8);trans.add(mesh);
 const root=new THREE.Group();root.scale.setScalar(.2);root.add(trans);scene.add(root);
 root.updateMatrixWorld(true);const bounds=new THREE.Box3().setFromObject(root);const c=bounds.getCenter(new THREE.Vector3());root.position.x-=c.x;root.position.y-=bounds.max.y;root.position.z-=c.z;
 window.bounds={size:bounds.getSize(new THREE.Vector3()).toArray(),min:bounds.min.toArray(),max:bounds.max.toArray()};
});
renderer.setAnimationLoop(()=>renderer.render(scene,camera));
