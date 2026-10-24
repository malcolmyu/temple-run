import * as THREE from 'three';
import { GLTFLoader } from 'three/addons/loaders/GLTFLoader.js';
import { RoundedBoxGeometry } from 'three/addons/geometries/RoundedBoxGeometry.js';
import './style.css';

const game=document.querySelector('#game');
const canvas=document.querySelector('#scene');
const heightValue=document.querySelector('#height-value');
const coinValue=document.querySelector('#coin-value');
const timeValue=document.querySelector('#time-value');
const message=document.querySelector('#message');
const startOverlay=document.querySelector('#start-overlay');
const endOverlay=document.querySelector('#end-overlay');

const scene=new THREE.Scene();
const camera=new THREE.PerspectiveCamera(43,1,.1,130);
const renderer=new THREE.WebGLRenderer({canvas,antialias:true,powerPreference:'high-performance'});
renderer.setPixelRatio(Math.min(devicePixelRatio,2));
renderer.outputColorSpace=THREE.SRGBColorSpace;
renderer.shadowMap.enabled=true;
renderer.shadowMap.type=THREE.PCFSoftShadowMap;
renderer.toneMapping=THREE.ACESFilmicToneMapping;
renderer.toneMappingExposure=1.55;
scene.add(new THREE.HemisphereLight(0xf4f9f5,0x89907b,2.15));
const sunlight=new THREE.DirectionalLight(0xfff6df,3.2);
sunlight.position.set(-5,10,11);
sunlight.castShadow=true;
sunlight.shadow.mapSize.set(2048,2048);
sunlight.shadow.camera.left=-14;sunlight.shadow.camera.right=14;
sunlight.shadow.camera.top=18;sunlight.shadow.camera.bottom=-18;
sunlight.shadow.normalBias=.035;
scene.add(sunlight);scene.add(sunlight.target);

const mat=(color,opts={})=>new THREE.MeshStandardMaterial({color,roughness:.86,...opts});
const stone=mat(0xdadbd4,{roughness:.76});
const stoneTop=mat(0xf9f7ec,{roughness:.57});
const stoneRiser=mat(0xbfc3bd,{roughness:.84});
const rockMat=mat(0x899388,{roughness:.95});
const grassMat=mat(0xc2cdb7,{roughness:1,side:THREE.DoubleSide});
const pineDark=mat(0x415a4d),pineMid=mat(0x56755d),pineLight=mat(0x71866a);
const bark=mat(0x655c4a),gold=mat(0xe8b343,{metalness:.7,roughness:.23});
const goldInset=mat(0xffe699,{metalness:.4,roughness:.3,emissive:0x6b4305,emissiveIntensity:.27});
const bombBlack=mat(0x2c3030,{roughness:.42}),bombFace=mat(0xfaf4df,{emissive:0x555044,emissiveIntensity:.2});
const geo={sphere:new THREE.SphereGeometry(1,18,14),sphereLow:new THREE.SphereGeometry(1,10,8),cone:new THREE.ConeGeometry(1,1,7),cyl:new THREE.CylinderGeometry(1,1,1,16),box:new THREE.BoxGeometry(1,1,1),coin:new THREE.CylinderGeometry(.23,.23,.055,28),ring:new THREE.TorusGeometry(.17,.035,7,22)};
function add(g,m,parent,x=0,y=0,z=0,sx=1,sy=1,sz=1){const o=new THREE.Mesh(g,m);o.position.set(x,y,z);o.scale.set(sx,sy,sz);parent.add(o);return o}
function rand(n){const v=Math.sin(n*78.233+42.17)*43758.5453;return v-Math.floor(v)}
const loader=new GLTFLoader();
const textureLoader=new THREE.TextureLoader();
function surface(path,srgb=false){const t=textureLoader.load(path,render);t.wrapS=t.wrapT=THREE.RepeatWrapping;t.repeat.set(1.2,1.2);t.anisotropy=Math.min(renderer.capabilities.getMaxAnisotropy(),8);if(srgb)t.colorSpace=THREE.SRGBColorSpace;return t}
const grassColor=surface('/assets/grass/diffuse.webp',true);
const grassNormal=surface('/assets/grass/nor_gl.webp');
const grassRough=surface('/assets/grass/rough.webp');
grassMat.map=grassColor;grassMat.normalMap=grassNormal;grassMat.roughnessMap=grassRough;grassMat.normalScale.set(.3,.3);grassMat.needsUpdate=true;

// The complete environment is rendered inside the WebGL canvas.
const sky=new THREE.Mesh(new THREE.PlaneGeometry(170,170),new THREE.ShaderMaterial({depthWrite:false,vertexShader:'varying vec2 vUv;void main(){vUv=uv;gl_Position=projectionMatrix*modelViewMatrix*vec4(position,1.);}',fragmentShader:`varying vec2 vUv;void main(){vec3 a=vec3(.82,.89,.87),b=vec3(.61,.76,.78);vec3 c=mix(a,b,smoothstep(.18,.88,vUv.y));float glow=exp(-dot(vUv-vec2(.68,.70),vUv-vec2(.68,.70))*65.);c+=vec3(.25,.19,.10)*glow;gl_FragColor=vec4(c,1.);}`}));
sky.position.z=-70;scene.add(sky);
const mountainLayers=new THREE.Group();mountainLayers.position.z=-39;scene.add(mountainLayers);
const distantMountain=mat(0x9eb3af,{flatShading:true,side:THREE.DoubleSide});
const mountainShadow=mat(0x879f9c,{flatShading:true,side:THREE.DoubleSide});
function mountain(x,y,w,h,seed){
  const shape=new THREE.Shape();shape.moveTo(-w/2,0);shape.lineTo(-w*.34,h*.41);shape.lineTo(-w*.13,h*.72);shape.lineTo(w*.03,h);shape.lineTo(w*.20,h*.69);shape.lineTo(w*.34,h*.34);shape.lineTo(w/2,0);shape.closePath();
  add(new THREE.ShapeGeometry(shape),distantMountain,mountainLayers,x,y,0);
  const facet=new THREE.Shape();facet.moveTo(w*.03,h);facet.lineTo(w*.34,h*.34);facet.lineTo(w*.1,0);facet.closePath();add(new THREE.ShapeGeometry(facet),mountainShadow,mountainLayers,x,y,.02);
}
for(let i=0;i<14;i++)mountain(-24+i*4,-8+(i%3)*.4,7,6+rand(i+9)*5,i);

const cloudGroup=new THREE.Group();cloudGroup.position.z=-14;scene.add(cloudGroup);
const cloudMat=mat(0xe9efea,{transparent:true,opacity:.74,depthWrite:false});
for(let i=0;i<34;i++){
  const x=-16+rand(i+44)*40,y=-8+rand(i+65)*34,s=.6+rand(i+81)*.75;
  for(let j=0;j<4;j++)add(geo.sphereLow,cloudMat,cloudGroup,x+(j-1.5)*s*.52,y+rand(i+j+99)*.12,0,s*(j===1?1:.7),s*.31,s*.17);
}

const world=new THREE.Group();scene.add(world);
const STAIR_COUNT=37;
const STEP_DX=.39,STEP_RISE=.66,STEP_DEPTH=.22;
const stepAt=i=>({x:-2.7+i*STEP_DX,y:-3.6+i*STEP_RISE,z:1.2-i*STEP_DEPTH});
const steps=[];
const coinItems=[];
const bombs=[];
const bombIndexes=new Set([7,15,23,31]);
const coinIndexes=new Set([2,4,6,9,11,13,17,19,21,25,27,29,33,35]);

// A gently curved, textured mountain flank follows the same diagonal as the staircase.
const terrainPositions=[],terrainUV=[],terrainColors=[],terrainIndices=[];
const rows=72,cols=18;
for(let r=0;r<=rows;r++){
  const y=-9+r*.55;
  const centerX=-2.7+(y+3.6)*(STEP_DX/STEP_RISE);
  const edge=centerX-1.65;
  for(let c=0;c<=cols;c++){
    const across=c/cols,x=edge+across*16;
    const pathZ=1.2-(y+3.6)*(STEP_DEPTH/STEP_RISE);
    const z=pathZ-1.45-across*2.2+Math.sin(x*1.13+y*.42)*.18+Math.cos(y*.83)*.16;
    terrainPositions.push(x,y,z);terrainUV.push(x*.19,y*.19);
    const shade=.83+rand(r*51+c*17)*.12-across*.08;terrainColors.push(shade,shade,shade);
  }
}
for(let r=0;r<rows;r++)for(let c=0;c<cols;c++){
  const a=r*(cols+1)+c,b=a+cols+1;terrainIndices.push(a,b,a+1,b,b+1,a+1);
}
const terrainGeometry=new THREE.BufferGeometry();terrainGeometry.setAttribute('position',new THREE.Float32BufferAttribute(terrainPositions,3));terrainGeometry.setAttribute('uv',new THREE.Float32BufferAttribute(terrainUV,2));terrainGeometry.setAttribute('color',new THREE.Float32BufferAttribute(terrainColors,3));terrainGeometry.setIndex(terrainIndices);terrainGeometry.computeVertexNormals();
grassMat.vertexColors=true;
const hillside=add(terrainGeometry,grassMat,world);hillside.receiveShadow=true;

const pineInstances={trunk:[],branch:[],dark:[],mid:[],light:[]};
const pineTrunkGeometry=new THREE.CylinderGeometry(.05,.13,1.8,7);
function pineMatrix(x,y,z,sx,sy,sz,rz=0){
  return new THREE.Matrix4().compose(new THREE.Vector3(x,y,z),new THREE.Quaternion().setFromAxisAngle(new THREE.Vector3(0,0,1),rz),new THREE.Vector3(sx,sy,sz));
}
function pineTree(parent,x,y,z,s=1){
  pineInstances.trunk.push(pineMatrix(x,y+.87*s,z,s,s,s));
  for(let i=0;i<5;i++){
    const level=y+(.65+i*.26)*s,spread=(.63-i*.085)*s;
    for(const side of [-1,1]){
      pineInstances.branch.push(pineMatrix(x+side*spread*.3,level,z,.024*s,spread*.9,.024*s,side*.92));
      for(let j=0;j<3;j++){
        const kind=(i+j)%3===0?'light':(i%2?'dark':'mid');
        pineInstances[kind].push(pineMatrix(x+side*(.12+j*.17)*s,level+.03*s,z+.05*j*s,spread*.36,.085*s,.17*s,side*.15));
      }
    }
  }
}
function flushPines(){
  const materials={trunk:bark,branch:bark,dark:pineDark,mid:pineMid,light:pineLight};
  const geometries={trunk:pineTrunkGeometry,branch:geo.cyl,dark:geo.sphereLow,mid:geo.sphereLow,light:geo.sphereLow};
  for(const key of Object.keys(pineInstances)){
    const matrices=pineInstances[key],instanced=new THREE.InstancedMesh(geometries[key],materials[key],matrices.length);
    matrices.forEach((matrix,index)=>instanced.setMatrixAt(index,matrix));
    instanced.instanceMatrix.needsUpdate=true;instanced.castShadow=true;world.add(instanced);
  }
}
function roundTree(parent,x,y,z,s=1){
  const trunk=add(new THREE.CylinderGeometry(.11,.18,2.1,8),bark,parent,x,y+1.02*s,z,s,s,s);trunk.castShadow=true;
  for(let i=0;i<11;i++){
    const a=i*2.4,r=.6+rand(i+103)*.32;
    const crown=add(geo.sphereLow,i%3?pineMid:pineLight,parent,x+Math.cos(a)*r*s,y+(2.1+Math.sin(a)*.34)*s,z+rand(i+124)*.45*s,.48*s,.39*s,.42*s);crown.castShadow=true;
  }
}
for(let i=0;i<STAIR_COUNT;i++){
  const p=stepAt(i);
  const group=new THREE.Group();group.position.set(p.x,p.y,p.z);world.add(group);
  const body=add(new RoundedBoxGeometry(1.68,.46,1.08,3,.12),stone,group,0,0,0);body.castShadow=true;body.receiveShadow=true;
  const top=add(new RoundedBoxGeometry(1.59,.085,.99,2,.04),stoneTop,group,0,.207,0);top.receiveShadow=true;
  const riser=add(new RoundedBoxGeometry(1.49,.27,.065,2,.025),stoneRiser,group,0,-.058,.548);riser.castShadow=true;
  add(geo.sphereLow,stoneTop,group,.69,-.13,.55,.05,.04,.025);
  steps.push({index:i,...p,group});
  if(coinIndexes.has(i)){
    const coin=new THREE.Group();coin.position.set(p.x+.28,p.y+.82,p.z+.72);world.add(coin);
    add(geo.coin,gold,coin).rotation.x=Math.PI/2;
    add(geo.ring,goldInset,coin,0,0,.055);
    add(geo.sphere,goldInset,coin,0,0,.075,.055,.055,.025);
    coinItems.push({index:i,group:coin,taken:false});
  }
  if(bombIndexes.has(i)){
    const bomb=new THREE.Group();bomb.position.set(p.x+.32,p.y+.62,p.z+.67);world.add(bomb);
    add(geo.sphere,bombBlack,bomb,0,0,0,.31,.31,.31).castShadow=true;
    add(geo.cyl,mat(0x514c3b),bomb,0,.32,0,.075,.13,.075);
    const fuse=add(geo.sphere,mat(0xf2cb7a,{emissive:0x6d3815,emissiveIntensity:.4}),bomb,.035,.42,.02,.055,.055,.055);
    for(const side of [-1,1]){const eye=add(geo.sphere,bombFace,bomb,side*.12,.05,.285,.055,.055,.025);eye.rotation.z=side*.38;}
    add(geo.sphere,mat(0xe36a4c),bomb,0,-.12,.3,.11,.035,.025);
    bombs.push({index:i,group:bomb});
  }
  if(i%4===1){const x=p.x-2.5-rand(i+7)*1.3;pineTree(world,x,p.y-.95,p.z-5.5-rand(i+12)*2,.9+rand(i+2)*.7)}
  if(i%9===0)roundTree(world,p.x-3.4,p.y-1.2,p.z-5,1.1);
}
for(let i=0;i<75;i++){
  const step=stepAt(Math.floor(i/2));
  const x=step.x-2.1-rand(i+333)*6;
  const y=step.y-2+rand(i+119)*2;
  pineTree(world,x,y,step.z-8-rand(i+207)*7,.65+rand(i+278)*.7);
}
flushPines();
const summit=stepAt(STAIR_COUNT-1);
const flag=new THREE.Group();flag.position.set(summit.x+.62,summit.y+.1,summit.z-.1);world.add(flag);
add(geo.cyl,bark,flag,0,.78,0,.04,1.6,.04);
const flagShape=new THREE.Shape();flagShape.moveTo(0,1.55);flagShape.lineTo(.8,1.35);flagShape.lineTo(0,1.15);flagShape.closePath();add(new THREE.ShapeGeometry(flagShape),mat(0xe3aa55,{side:THREE.DoubleSide}),flag,0,0,.05);

// Local CC0 glTF assets make the foreground distinct from the distant painted mountain layers.
loader.load('/assets/rocks/rock_moss_set_01_1k.gltf',gltf=>{
  const templates=gltf.scene.children.filter(o=>o.isMesh);
  if(!templates.length)return;
  rockMat.map=templates[0].material.map;rockMat.normalMap=templates[0].material.normalMap;rockMat.normalScale.set(.4,.4);rockMat.needsUpdate=true;
  for(let i=2;i<STAIR_COUNT;i+=3){
    const p=stepAt(i),stoneMesh=templates[i%templates.length].clone();
    stoneMesh.position.set(p.x+2.2,p.y-.55,p.z-1.5);stoneMesh.scale.set(.65,.7,.75);
    stoneMesh.rotation.y=rand(i+50)*Math.PI*2;stoneMesh.castShadow=true;stoneMesh.receiveShadow=true;world.add(stoneMesh);
  }
  render();
},undefined,e=>console.warn('Rock model failed:',e));

// A round, expressive game character built as real lit geometry. Feet are at local y=0.
const sheep=new THREE.Group();world.add(sheep);
const character=new THREE.Group();sheep.add(character);
const fleece=mat(0xf7f5e9,{roughness:1}),fleeceShade=mat(0xe8e9dc,{roughness:1});
const face=mat(0xf4dec5,{roughness:.86}),innerEar=mat(0xdca7a2,{roughness:1});
const eyeWhite=mat(0xfffcf2,{roughness:.36}),eyeDark=mat(0x282d2a,{roughness:.21});
const cheek=mat(0xe8a9a2,{roughness:1}),coat=mat(0x8fae9e,{roughness:.82});
const coatDark=mat(0x617e70),shorts=mat(0xc8ac84),shoe=mat(0x766452);
const torso=add(new RoundedBoxGeometry(.78,.76,.54,4,.18),coat,character,-.04,.70,0);torso.castShadow=true;
add(new RoundedBoxGeometry(.11,.58,.035,3,.02),coatDark,character,.05,.72,.285);
add(new RoundedBoxGeometry(.66,.17,.57,3,.07),fleece,character,-.04,1.08,0);
add(new RoundedBoxGeometry(.69,.26,.48,3,.09),shorts,character,-.04,.34,0);
for(const side of [-1,1]){
  add(geo.sphere,coatDark,character,side*.27,.69,.30,.11,.10,.025);
}
const headGroup=new THREE.Group();headGroup.position.set(.08,1.33,.03);character.add(headGroup);
add(geo.sphere,fleeceShade,headGroup,0,.04,0,.50,.49,.42).castShadow=true;
add(geo.sphere,face,headGroup,.11,-.02,.31,.36,.34,.23).castShadow=true;
for(let i=0;i<11;i++){
  const a=(i/10)*Math.PI*1.13+.02;
  const xx=-.39+Math.cos(a)*.28+i*.052;
  const yy=.35+Math.sin(a)*.16;
  add(geo.sphere,i%4===0?fleeceShade:fleece,headGroup,xx,yy,.12+(i%2)*.09,.18,.17,.18).castShadow=true;
}
for(let i=0;i<5;i++){
  const yy=-.24+i*.12;
  add(geo.sphere,i%2?fleeceShade:fleece,headGroup,-.36,yy,.27,.17,.15,.16).castShadow=true;
}
for(const side of [-1,1]){
  const ear=add(geo.sphere,face,headGroup,side*.44,.14,.02,.22,.12,.16);ear.rotation.z=side*.28;
  const inside=add(geo.sphere,innerEar,headGroup,side*.47,.15,.15,.13,.065,.03);inside.rotation.z=side*.28;
}
for(const xx of [-.02,.25]){
  add(geo.sphere,eyeWhite,headGroup,xx,.06,.515,.093,.112,.041);
  add(geo.sphere,eyeDark,headGroup,xx+.025,.05,.552,.059,.081,.024);
  add(geo.sphere,eyeWhite,headGroup,xx+.009,.087,.572,.022,.027,.011);
}
add(geo.sphere,cheek,headGroup,-.095,-.105,.523,.085,.048,.018);
add(geo.sphere,cheek,headGroup,.325,-.105,.502,.082,.047,.018);
add(geo.sphere,eyeDark,headGroup,.12,-.12,.555,.055,.039,.03);
const smileCurve=new THREE.CatmullRomCurve3([new THREE.Vector3(.045,-.19,.55),new THREE.Vector3(.12,-.235,.56),new THREE.Vector3(.20,-.19,.55)]);
add(new THREE.TubeGeometry(smileCurve,8,.012,5,false),eyeDark,headGroup);
const arms=[],legs=[];
for(const side of [-1,1]){
  const arm=new THREE.Group();arm.position.set(side*.40,.97,.02);character.add(arm);arms.push(arm);
  const sleeve=add(new RoundedBoxGeometry(.22,.42,.24,3,.08),coat,arm,side*.08,-.22,0);sleeve.rotation.z=side*.27;sleeve.castShadow=true;
  add(geo.sphere,face,arm,side*.17,-.44,.06,.12,.11,.12);
  const leg=new THREE.Group();leg.position.set(side*.20,.29,0);character.add(leg);legs.push(leg);
  add(new RoundedBoxGeometry(.17,.40,.19,3,.055),face,leg,0,-.18,0);
  add(new RoundedBoxGeometry(.30,.14,.34,3,.055),shoe,leg,.075,-.42,.09);
}
add(geo.sphere,fleece,character,-.45,.73,-.14,.17,.17,.17);

const state={mode:'menu',index:0,jump:null,seconds:30,coins:0,elapsed:0,highest:0,cameraTarget:new THREE.Vector3(),playerPosition:new THREE.Vector3(),messageTimer:0};
let soundOn=false,audioCtx=null,externalClock=false;
function beep(freq=600,duration=.08,type='sine'){
  if(!soundOn)return;
  try{audioCtx??=new (window.AudioContext||window.webkitAudioContext)();const osc=audioCtx.createOscillator(),gain=audioCtx.createGain();osc.type=type;osc.frequency.setValueAtTime(freq,audioCtx.currentTime);gain.gain.setValueAtTime(.05,audioCtx.currentTime);gain.gain.exponentialRampToValueAtTime(.001,audioCtx.currentTime+duration);osc.connect(gain).connect(audioCtx.destination);osc.start();osc.stop(audioCtx.currentTime+duration)}catch{}
}
function showMessage(value){message.textContent=value;message.classList.remove('hidden');state.messageTimer=1.1}
function setPlayerAt(p,arc=0){state.playerPosition.set(p.x-.43,p.y+.45+arc,p.z+.74);sheep.position.copy(state.playerPosition)}
function setCamera(instant=false,dt=1/60){
  const p=state.playerPosition;
  const target=new THREE.Vector3(p.x+1.3,p.y+2.12,p.z-1.7);
  if(instant)state.cameraTarget.copy(target);else state.cameraTarget.lerp(target,1-Math.exp(-3.1*dt));
  const c=state.cameraTarget;
  camera.position.set(c.x+1.15,c.y+2.0,c.z+15.8);
  camera.lookAt(c.x,c.y,c.z);
  sky.position.set(c.x,c.y,-70);
  mountainLayers.position.x=c.x*.48;mountainLayers.position.y=c.y*.45;
  cloudGroup.position.x=c.x*.25;cloudGroup.position.y=c.y*.33;
  sunlight.position.set(c.x-5,c.y+10,c.z+11);sunlight.target.position.set(c.x,c.y,c.z-4);sunlight.target.updateMatrixWorld();
}
function reset(){
  state.mode='playing';state.index=0;state.jump=null;state.seconds=30;state.coins=0;state.elapsed=0;state.highest=0;
  coinItems.forEach(o=>{o.taken=false;o.group.visible=true});
  heightValue.textContent='0';coinValue.textContent='0';timeValue.textContent='30';
  message.classList.add('hidden');startOverlay.classList.add('hidden');endOverlay.classList.add('hidden');
  setPlayerAt(stepAt(0));setCamera(true);render();
}
function finish(won=false){
  if(state.mode!=='playing')return;
  state.mode=won?'won':'gameover';
  document.querySelector('#end-height').textContent=`${state.highest} m`;
  document.querySelector('#end-coins').textContent=`${state.coins} 枚`;
  endOverlay.querySelector('h2').innerHTML=won?'登顶啦，<br><em>小羊！</em>':'再试一次，<br><em>登得更高！</em>';
  endOverlay.classList.remove('hidden');beep(won?950:230,.23);
}
function jump(){
  if(state.mode==='menu'){reset();return}
  if(state.mode!=='playing')return;
  if(state.jump){
    if(!state.jump.boosted&&state.jump.t<.68){state.jump.to=Math.min(STAIR_COUNT-1,state.jump.from+2);state.jump.boosted=true;state.jump.duration=.64;showMessage('✦ 跨越！');beep(760,.07,'triangle')}
    return;
  }
  if(state.index>=STAIR_COUNT-1)return;
  state.jump={from:state.index,to:state.index+1,t:0,duration:.44,boosted:false};beep(520,.07);
}
function update(dt){
  state.elapsed+=dt;
  if(state.messageTimer>0){state.messageTimer-=dt;if(state.messageTimer<=0)message.classList.add('hidden')}
  if(state.mode==='playing'){
    state.seconds=Math.max(0,state.seconds-dt);timeValue.textContent=String(Math.ceil(state.seconds));
    if(state.seconds<=0)finish(false);
    if(state.jump){
      const j=state.jump;
      j.t=Math.min(1,j.t+dt/j.duration);
      const a=stepAt(j.from),b=stepAt(j.to),ease=j.t*j.t*(3-2*j.t);
      const p={x:THREE.MathUtils.lerp(a.x,b.x,ease),y:THREE.MathUtils.lerp(a.y,b.y,ease),z:THREE.MathUtils.lerp(a.z,b.z,ease)};
      setPlayerAt(p,Math.sin(Math.PI*j.t)*(j.boosted?1.28:1.02));
      sheep.rotation.z=-.11*Math.sin(Math.PI*j.t);
      legs[0].rotation.z=-.43*Math.sin(Math.PI*j.t);
      legs[1].rotation.z=.52*Math.sin(Math.PI*j.t);
      arms[0].rotation.z=-.28*Math.sin(Math.PI*j.t);
      arms[1].rotation.z=.48*Math.sin(Math.PI*j.t);
      if(j.t>=1){
        state.index=j.to;state.jump=null;sheep.rotation.z=0;setPlayerAt(b);
        state.highest=state.index*2;heightValue.textContent=String(state.highest);
        const c=coinItems.find(o=>o.index===state.index&&!o.taken);
        if(c){c.taken=true;c.group.visible=false;state.coins++;coinValue.textContent=String(state.coins);showMessage('✦ 金铃铛 +1');beep(880,.1,'triangle')}
        if(bombIndexes.has(state.index)){showMessage('碰到炸弹！');finish(false)}
        else if(state.index===STAIR_COUNT-1)finish(true);
      }
    }else{
      sheep.position.y=stepAt(state.index).y+.45+Math.sin(state.elapsed*3)*.025;
      legs[0].rotation.z=legs[1].rotation.z=0;
      arms[0].rotation.z=Math.sin(state.elapsed*3)*.035;
      arms[1].rotation.z=-Math.sin(state.elapsed*3)*.035;
    }
  }else if(state.mode==='menu')sheep.position.y=stepAt(0).y+.45+Math.sin(state.elapsed*2)*.025;
  coinItems.forEach(c=>{if(!c.taken){c.group.rotation.y=state.elapsed*1.8+c.index;c.group.position.y=stepAt(c.index).y+.82+Math.sin(state.elapsed*2.8+c.index)*.06}});
  bombs.forEach(b=>{b.group.rotation.y=Math.sin(state.elapsed*2+b.index)*.12});
  setCamera(false,dt);
}
function render(){renderer.render(scene,camera)}
function resize(){const w=game.clientWidth,h=game.clientHeight;renderer.setSize(w,h,false);camera.aspect=w/h;camera.updateProjectionMatrix();render()}
new ResizeObserver(resize).observe(game);
let previous=0;
function frame(t){if(!previous)previous=t;let dt=Math.min((t-previous)/1000,.05);previous=t;if(!externalClock)while(dt>0){const step=Math.min(dt,1/60);update(step);dt-=step}render();requestAnimationFrame(frame)}
requestAnimationFrame(frame);
window.advanceTime=ms=>{externalClock=true;for(let i=0,n=Math.max(1,Math.round(ms/(1000/60)));i<n;i++)update(1/60);render()};
window.render_game_to_text=()=>JSON.stringify({coordinateSystem:'3D world: x right, y up, z toward camera; stairs ascend toward upper right and recede in z',mode:state.mode,step:state.index,stepsTotal:STAIR_COUNT,heightMeters:state.highest,secondsRemaining:+state.seconds.toFixed(1),coins:state.coins,jump:state.jump&&{from:state.jump.from,to:state.jump.to,progress:+state.jump.t.toFixed(2),boosted:state.jump.boosted},nextBomb:[...bombIndexes].find(n=>n>state.index)??null,player:{x:+sheep.position.x.toFixed(2),y:+sheep.position.y.toFixed(2),z:+sheep.position.z.toFixed(2)},visibleSteps:steps.filter(s=>Math.abs(s.index-state.index)<14).map(s=>({index:s.index,x:s.x,y:s.y,z:s.z,bomb:bombIndexes.has(s.index),coin:coinIndexes.has(s.index)}))});
document.querySelector('#start-btn').addEventListener('click',reset);
document.querySelector('#restart-btn').addEventListener('click',reset);
document.querySelector('#jump-btn').addEventListener('pointerdown',e=>{e.preventDefault();jump()});
canvas.addEventListener('pointerdown',()=>{if(state.mode==='playing')jump()});
document.querySelector('#sound-btn').addEventListener('click',e=>{soundOn=!soundOn;e.currentTarget.classList.toggle('active',soundOn);e.currentTarget.setAttribute('aria-label',soundOn?'关闭声音':'开启声音');beep()});
window.addEventListener('keydown',e=>{if(['Space','ArrowUp','KeyW'].includes(e.code)){e.preventDefault();if(!e.repeat)jump()}if(e.code==='Enter'&&state.mode!=='playing')reset();if(e.code==='KeyF'){if(!document.fullscreenElement)game.requestFullscreen?.();else document.exitFullscreen?.()}});
setPlayerAt(stepAt(0));setCamera(true);resize();render();
