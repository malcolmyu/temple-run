import { nativeUnlitMaterial } from './nativeUnlit.js';
import * as THREE from 'three';
import { sampleCurveComponent } from './nativeAnimationCurve.js';

// CPU-skinned runner built from the original Unity SkinnedMeshRenderer data.
// The JSON stores Unity-space data (bone local TRS raw, mesh positions with x negated
// by the exporter). We skin in Unity space, then convert to Three.js space at the end
// with the same x-negation the static OBJ export used, so placement matches.

function trackFor(clip, boneName) {
  return clip.tracks[boneName] || null;
}

function sampleRotation(curve, time, out) {
  const { times, values } = curve;
  const n = times.length;
  if (n === 0) return out.set(0, 0, 0, 1);
  if (n === 1 || time <= times[0]) return out.fromArray(values[0]);
  if (time >= times[n - 1]) return out.fromArray(values[n - 1]);
  let i = 1;
  while (i < n && times[i] < time) i++;
  const t0 = times[i - 1], t1 = times[i];
  const alpha = (time - t0) / (t1 - t0 || 1);
  const q0 = new THREE.Quaternion().fromArray(values[i - 1]);
  const q1 = new THREE.Quaternion().fromArray(values[i]);
  return out.copy(q0).slerp(q1, alpha);
}

function samplePosition(curve, time, out) {
  const { times, values } = curve;
  const n = times.length;
  if (n === 0) return out.set(0, 0, 0);
  if (n === 1 || time <= times[0]) return out.fromArray(values[0]);
  if (time >= times[n - 1]) return out.fromArray(values[n - 1]);
  let i = 1;
  while (i < n && times[i] < time) i++;
  const t0 = times[i - 1], t1 = times[i];
  const alpha = (time - t0) / (t1 - t0 || 1);
  out.set(...[0, 1, 2].map((axis) => sampleCurveComponent(curve, i - 1, i, alpha, axis)));
  return out;
}

const normBoneName = (n) => String(n || '').toLowerCase().replace(/bip01|bone|skin|_|\.|\s/g, '');


// Rest pose of a rig = its mesh bind pose (scene transforms are snapshot, not bind pose).
function computeBindRest(data){
  const bindMatrices=(data.bindposes||[]).map((rows)=>{const m=new THREE.Matrix4();
    m.set(rows[0][0],rows[0][1],rows[0][2],rows[0][3],rows[1][0],rows[1][1],rows[1][2],rows[1][3],
          rows[2][0],rows[2][1],rows[2][2],rows[2][3],rows[3][0],rows[3][1],rows[3][2],rows[3][3]);return m;});
  return data.bones.map((bone,i)=>{
    const inv=new THREE.Matrix4().copy(bindMatrices[i]).invert();
    const local=(bone.parent<0||!bindMatrices[bone.parent])?inv:new THREE.Matrix4().copy(bindMatrices[bone.parent]).multiply(inv);
    const p=new THREE.Vector3(),q=new THREE.Quaternion(),sc=new THREE.Vector3();local.decompose(p,q,sc);return {position:p,quaternion:q,scale:sc};
  });
}

// Rest-pose world rotations for a bone hierarchy (bind pose, expressed as quaternions).
function restWorldQuats(rest, bones) {
  const out = new Array(bones.length);
  const solve = (i) => {
    if (out[i]) return out[i];
    const parent = bones[i].parent;
    out[i] = parent >= 0 ? solve(parent).clone().multiply(rest[i].quaternion) : rest[i].quaternion.clone();
    return out[i];
  };
  for (let i = 0; i < bones.length; i++) solve(i);
  return out;
}

function restWorldMatrices(data, rest) {
  const world = new Array(data.bones.length);
  const solve = (i) => {
    if (world[i]) return world[i];
    const m = new THREE.Matrix4().compose(rest[i].position, rest[i].quaternion, rest[i].scale);
    const parent = data.bones[i].parent;
    world[i] = parent >= 0 ? solve(parent).clone().multiply(m) : m.clone();
    return world[i];
  };
  for (let i = 0; i < data.bones.length; i++) solve(i);
  return world;
}

// Which child should a bone aim at? Limbs aim at the next segment, spines aim up the spine,
// hips aim at the spine (never at a thigh, even though thighs are longer).
function pickAimChild(bones, name, children) {
  if (!children.length) return -1;
  const n = name.toLowerCase();
  const childNames = children.map((ci) => String(bones[ci].name || '').toLowerCase());
  const prefer = [];
  if (/pelvis|hips|root/.test(n)) prefer.push('spine', 'spine1', 'chest');
  if (/spine|chest|neck/.test(n)) prefer.push('spine1', 'spine2', 'chest', 'neck', 'head');
  if (/head/.test(n)) prefer.push('neck');
  if (/clavicle/.test(n)) prefer.push('upperarm');
  if (/upperarm/.test(n)) prefer.push('forearm');
  if (/forearm/.test(n)) prefer.push('hand');
  if (/thigh/.test(n)) prefer.push('calf');
  if (/calf/.test(n)) prefer.push('foot');
  for (const want of prefer) {
    const idx = childNames.findIndex((c) => c.replace(/[^a-z0-9]/g, '').includes(want));
    if (idx >= 0) return children[idx];
  }
  return children[0];
}

// Bone -> aim child, plus that aim direction and length in the rig's rest pose.
function buildAimTable(data, rest) {
  const world = restWorldMatrices(data, rest);
  const children = data.bones.map(() => []);
  data.bones.forEach((b, i) => { if (b.parent >= 0) children[b.parent].push(i); });
  const pos = world.map((m) => new THREE.Vector3().setFromMatrixPosition(m));
  return data.bones.map((b, i) => {
    const child = pickAimChild(data.bones, b.name, children[i]);
    const dir = child >= 0 ? pos[child].clone().sub(pos[i]) : null;
    return { child, pos: pos[i], dir: dir && dir.lengthSq() > 1e-10 ? dir.clone().normalize() : null, dirRaw: dir };
  });
}

// Rebuild one source clip on the target skeleton by aiming each target bone at the source
// bone's animated direction. This is the only retarget that survives skeletons whose bind
// pose, bone lengths or local axes differ from the authoring rig (the APK's shop skins are
// exactly that): matching world rotations twists those limbs, matching joint directions does not.
function retargetClipWorld(srcRig, tgtBones, tgtRest, clipName) {
  const clip = (srcRig.clips || {})[clipName];
  if (!clip || !clip.tracks) return null;
  const srcBones = srcRig.bones || [];
  const srcRest = computeBindRest(srcRig);
  const srcAim = buildAimTable(srcRig, srcRest);
  const tgtAim = buildAimTable({ bones: tgtBones }, tgtRest);
  const tgtRestWorldQ = restWorldQuats(tgtRest, tgtBones);
  const srcIndex = new Map(srcBones.map((b, i) => [normBoneName(b.name), i]));
  const srcCurves = new Map();
  for (const [boneName, kinds] of Object.entries(clip.tracks)) {
    if (kinds && kinds.rotation && kinds.rotation.times && kinds.rotation.values) {
      srcCurves.set(normBoneName(boneName), kinds.rotation);
    }
  }
  if (!srcCurves.size) return null;

  const timeSet = new Set();
  for (const curve of srcCurves.values()) for (const t of curve.times) timeSet.add(Math.round(t * 1000));
  const times = [...timeSet].sort((a, b) => a - b).map((t) => t / 1000);
  if (times.length < 2) return null;

  const mapping = tgtBones.map((b) => {
    const si = srcIndex.get(normBoneName(b.name));
    return si !== undefined ? si : -1;
  });
  if (!mapping.some((si) => si >= 0)) return null;

  const srcLocal = new Array(srcBones.length);
  const srcWorldQ = new Array(srcBones.length);
  const srcWorldP = srcAim.map((a) => a.pos.clone());
  const solveSrc = (i) => {
    if (srcWorldQ[i]) return;
    const parent = srcBones[i].parent;
    if (parent >= 0) solveSrc(parent);
    srcWorldQ[i] = parent >= 0 ? srcWorldQ[parent].clone().multiply(srcLocal[i]) : srcLocal[i].clone();
    const off = srcRest[i].position;
    srcWorldP[i] = parent >= 0 ? srcWorldP[parent].clone().add(off.clone().applyQuaternion(srcWorldQ[parent])) : off.clone();
  };

  const samples = tgtBones.map(() => []);
  const tmp = new THREE.Quaternion();
  for (const t of times) {
    for (let i = 0; i < srcBones.length; i++) {
      const curve = srcCurves.get(normBoneName(srcBones[i].name));
      srcLocal[i] = curve ? sampleRotation(curve, t, new THREE.Quaternion()) : srcRest[i].quaternion;
      srcWorldQ[i] = null;
    }
    for (let i = 0; i < srcBones.length; i++) solveSrc(i);

    const tgtWorldQ = new Array(tgtBones.length);
    const tgtWorldP = tgtBones.map((_, i) => tgtAim[i].pos.clone());
    const solveTgt = (i) => {
      if (tgtWorldQ[i]) return;
      const parent = tgtBones[i].parent;
      if (parent >= 0) solveTgt(parent);
      const si = mapping[i];
      let local = tgtRest[i].quaternion;
      if (si >= 0 && tgtAim[i].dir && srcAim[si].child >= 0) {
        // Direction of the source bone's aimed segment at this frame.
        const childPos = srcWorldP[srcAim[si].child];
        const dir = childPos.clone().sub(srcWorldP[si]);
        if (dir.lengthSq() > 1e-12) {
          dir.normalize();
          // Rotate the target's rest aim onto the source's animated direction, then rebuild.
          const delta = tmp.setFromUnitVectors(tgtAim[i].dir, dir);
          const wantWorld = delta.clone().multiply(tgtRestWorldQ[i]);
          local = parent >= 0 ? tgtWorldQ[parent].clone().invert().multiply(wantWorld) : wantWorld;
          samples[i].push(local.toArray());
        }
      }
      tgtWorldQ[i] = parent >= 0 ? tgtWorldQ[parent].clone().multiply(local) : local.clone();
      const off = tgtRest[i].position;
      tgtWorldP[i] = parent >= 0 ? tgtWorldP[parent].clone().add(off.clone().applyQuaternion(tgtWorldQ[parent])) : off.clone();
    };
    for (let i = 0; i < tgtBones.length; i++) solveTgt(i);
  }

  const tracks = new Map();
  for (let i = 0; i < tgtBones.length; i++) {
    if (!samples[i].length) continue;
    tracks.set(i, { rotation: { times, values: samples[i] } });
  }
  return tracks.size ? { duration: Math.max(clip.duration || 0, 0.001), tracks } : null;
}

export function buildRunnerRig(data, options = {}) {
  const scale = options.scale ?? 0.27;
  const yOffset = options.yOffset ?? 1.46;
  const flipWinding = options.flipWinding !== false;
  // The clips animate the root bone's position in an authoring space (root sits ~3.8u
  // higher than the bind skeleton), which would lift the character off the ground.
  // Rotation tracks are absolute-local and safe; root translation is not usable as-is.
  const lockRootPosition = options.lockRootPosition === true;

  const boneCount = data.bones.length;
  const nodes = data.bones.map((bone) => {
    const o = new THREE.Object3D();
    o.name = bone.name;
    o.position.fromArray(bone.position);
    o.quaternion.fromArray(bone.rotation);
    o.scale.fromArray(bone.scale ?? [1, 1, 1]);
    return o;
  });
  const root = new THREE.Group();
  data.bones.forEach((bone, i) => {
    if (bone.parent >= 0 && bone.parent < boneCount) nodes[bone.parent].add(nodes[i]);
    else root.add(nodes[i]);
  });

  const boneIndexByName = new Map(data.bones.map((b, i) => [b.name, i]));
  const clipData = {};
  for (const [name, clip] of Object.entries(data.clips || {})) {
    const tracks = new Map();
    for (const [boneName, kinds] of Object.entries(clip.tracks || {})) {
      const idx = boneIndexByName.get(boneName);
      if (idx === undefined) continue;
      tracks.set(idx, kinds);
    }
    clipData[name] = { duration: Math.max(clip.duration || 0, 0.001), tracks };
  }
  // Debug switch: ignore the rig's baked clips so the fallback retarget supplies them.
  if (options.forceFallbackClips) for (const c of Object.values(clipData)) c.tracks.clear();


  // The mesh's own bind poses (row-major) map mesh space -> bone space.
  // The scene transform values are NOT the bind pose, so they must not be inverted here.
  root.updateMatrixWorld(true);
  const bindMatrices = (data.bindposes || []).map((rows) => {
    const m = new THREE.Matrix4();
    m.set(rows[0][0], rows[0][1], rows[0][2], rows[0][3],
          rows[1][0], rows[1][1], rows[1][2], rows[1][3],
          rows[2][0], rows[2][1], rows[2][2], rows[2][3],
          rows[3][0], rows[3][1], rows[3][2], rows[3][3]);
    return m;
  });
  // The default actor has its original skeleton and complete absolute-local clips.
  // Its native SetupCharacter supplies the model offset; do not rebase root motion.
  const authoredSkeleton = options.authoredSkeleton === true;
  const rest = authoredSkeleton ? data.bones.map((bone) => ({
    position: new THREE.Vector3().fromArray(bone.position),
    quaternion: new THREE.Quaternion().fromArray(bone.rotation),
    scale: new THREE.Vector3().fromArray(bone.scale ?? [1, 1, 1]),
  })) : computeBindRest(data);

  // Unity's per-frame hip/spine local rotations are authored for one specific skeleton. The
  // shop-skin prefabs ("Bone X" rigs) reuse that clip verbatim, so applying its local values
  // twists every limb whose rest axes differ (T-rex arms on the astronaut, a 90° body lean on
  // the vampire, crossed legs on the scarecrow). Rebuild those clips on the target skeleton
  // from world-space deltas instead: deltaWorld(t) = srcWorld(t) * srcRestWorld⁻¹, then
  // tgtWorld(t) = deltaWorld(t) * tgtRestWorld, and finally tgtLocal(t) = tgtParentWorld(t)⁻¹
  // * tgtWorld(t). World deltas survive differing bone axis conventions; parent-relative
  // deltas only work when both skeletons were authored in the same DCC orientation.
  if (options.fallbackClips && options.fallbackRig) {
    for (const name of Object.keys(options.fallbackClips)) {
      const cur = clipData[name];
      if (cur && cur.tracks.size) continue;
      const retargeted = retargetClipWorld(options.fallbackRig, data.bones, rest, name);
      if (retargeted) clipData[name] = retargeted;
    }
  }

  // Last resort for rigs whose clips stay empty even after retarget: synthesise a simple
  // run/jump/slide cycle from the bind rest pose, rotating standard bones around world-space
  // axes converted into each bone's local frame (axis conventions stay correct).
  {
    const byNorm = new Map();
    data.bones.forEach((b, i) => { const k = normBoneName(b.name); if (!byNorm.has(k)) byNorm.set(k, i); });
    const has = (k) => byNorm.has(k);
    const restQ = (i) => rest[i].quaternion;
    const localAxis = (i, ax, ay, az) => new THREE.Vector3(ax, ay, az).applyQuaternion(restQ(i).clone().invert()).normalize();
    const swing = (i, ax, ay, az, ang) => restQ(i).clone().multiply(new THREE.Quaternion().setFromAxisAngle(localAxis(i, ax, ay, az), ang));
    const synthCycle = (kind) => {
      const dur = kind === 'jump' ? .55 : kind === 'slide' ? .45 : .5;
      const steps = kind === 'run' ? 10 : 5;
      const tracks = new Map();
      const setBone = (names, fn) => {
        for (const n of names) {
          const i = byNorm.get(n);
          if (i === undefined) continue;
          const vals = [];
          for (let k = 0; k <= steps; k++) {
            const t = (k / steps) * dur;
            vals.push(fn(t / dur, i).toArray());
          }
          tracks.set(i, { rotation: { times: Array.from({ length: steps + 1 }, (_, k) => (k / steps) * dur), values: vals } });
        }
      };
      if (kind === 'run') {
        setBone(['lthigh'], (u, i) => swing(i, 1, 0, 0, Math.sin(u * Math.PI * 2) * .62));
        setBone(['rthigh'], (u, i) => swing(i, 1, 0, 0, Math.sin(u * Math.PI * 2 + Math.PI) * .62));
        setBone(['lcalf'], (u, i) => swing(i, 1, 0, 0, Math.max(0, -Math.sin(u * Math.PI * 2)) * .85 + .12));
        setBone(['rcalf'], (u, i) => swing(i, 1, 0, 0, Math.max(0, -Math.sin(u * Math.PI * 2 + Math.PI)) * .85 + .12));
        setBone(['lupperarm'], (u, i) => swing(i, 1, 0, 0, Math.sin(u * Math.PI * 2 + Math.PI) * .5));
        setBone(['rupperarm'], (u, i) => swing(i, 1, 0, 0, Math.sin(u * Math.PI * 2) * .5));
        setBone(['lforearm', 'rforearm'], (u, i) => swing(i, 1, 0, 0, .35 + Math.sin(u * Math.PI * 2) * .18));
        setBone(['spine', 'spine1'], (u, i) => swing(i, 0, 0, 1, Math.sin(u * Math.PI * 2) * .07));
      } else if (kind === 'jump') {
        setBone(['lthigh', 'rthigh'], (u, i) => swing(i, 1, 0, 0, -.5 - u * .25));
        setBone(['lcalf', 'rcalf'], (u, i) => swing(i, 1, 0, 0, .9));
        setBone(['lupperarm', 'rupperarm'], (u, i) => swing(i, 1, 0, 0, -.9));
        setBone(['lforearm', 'rforearm'], (u, i) => swing(i, 1, 0, 0, .6));
      } else {
        setBone(['lthigh', 'rthigh'], (u, i) => swing(i, 1, 0, 0, -1.0));
        setBone(['lcalf', 'rcalf'], (u, i) => swing(i, 1, 0, 0, .35));
        setBone(['lupperarm', 'rupperarm'], (u, i) => swing(i, 1, 0, 0, -.5));
        setBone(['spine', 'spine1'], (u, i) => swing(i, 1, 0, 0, -.35));
      }
      return tracks;
    };
    if (has('pelvis')) {
      for (const name of ['run', 'jump', 'slide']) {
        const cur = clipData[name];
        if (cur && cur.tracks.size) continue;
        const tracks = synthCycle(name);
        if (tracks.size) clipData[name] = { duration: name === 'run' ? .5 : name === 'jump' ? .55 : .45, tracks };
      }
    }
  }
  // Clip root translation is authored in a scene where the root sits ~3.8u above the
  // bind pose. Keep only the relative motion (bob) by subtracting the first key offset.
  const rootPositionOffset = new Map();
  if (!lockRootPosition && !authoredSkeleton) {
    const baseClip = clipData.run || Object.values(clipData)[0];
    data.bones.forEach((bone, i) => {
      if (bone.parent >= 0) return;
      const track = baseClip && baseClip.tracks.get(i);
      if (!track || !track.position || !track.position.values.length) return;
      const first = new THREE.Vector3().fromArray(track.position.values[0]);
      rootPositionOffset.set(i, first.sub(rest[i].position));
    });
  }

  const vertexCount = data.positions.length;
  const raw = new Float32Array(vertexCount * 3);
  for (let i = 0; i < vertexCount; i++) {
    const p = data.positions[i];
    // undo the exporter x-negation; skinning happens in Unity space
    raw[i * 3] = -p[0];
    raw[i * 3 + 1] = p[1];
    raw[i * 3 + 2] = p[2];
  }
  const boneIndices = data.boneIndices;
  const boneWeights = data.boneWeights;
  const indexArray = flipWinding
    ? data.indices
    : data.indices.map((v, i, arr) => (i % 3 === 1 ? arr[i + 1] : i % 3 === 2 ? arr[i - 1] : v));

  const geometry = new THREE.BufferGeometry();
  const positions = new Float32Array(vertexCount * 3);
  geometry.setAttribute('position', new THREE.BufferAttribute(positions, 3));
  if (data.uv) {
    const uv = new Float32Array(vertexCount * 2);
    for (let i = 0; i < vertexCount; i++) {
      uv[i * 2] = data.uv[i][0];
      uv[i * 2 + 1] = data.uv[i][1];
    }
    geometry.setAttribute('uv', new THREE.BufferAttribute(uv, 2));
  }
  geometry.setIndex(indexArray);

  const material = nativeUnlitMaterial(options.texture || null);
  const mesh = new THREE.Mesh(geometry, material);
  mesh.castShadow = true;
  mesh.frustumCulled = false;

  const holder = new THREE.Group();
  holder.add(mesh);
  holder.scale.setScalar(scale);
  holder.position.y = yOffset;
  holder.rotation.y = Math.PI;

  const bindIdentity = new THREE.Matrix4();
  const boneMatrices = new Array(boneCount);
  for (let i = 0; i < boneCount; i++) boneMatrices[i] = new THREE.Matrix4();
  const blended = new THREE.Matrix4();
  const scratch = new THREE.Matrix4();
  const acc = new Float32Array(16);
  const vertex = new THREE.Vector3();
  const out = new THREE.Vector3();

  let glowMaterial = null;
  let clipName = 'run';
  let clipTime = 0;
  let clipLoops = true;

  function setClip(name, restart = false) {
    if (!clipData[name]) return;
    if (name === clipName && !restart) return;
    clipName = name;
    clipTime = 0;
    clipLoops = name === 'run' || name === 'slideLoop';
  }

  function applyPose(time) {
    const clip = clipData[clipName];
    for (let i = 0; i < boneCount; i++) {
      const node = nodes[i];
      const restPose = rest[i];
      const track = clip ? clip.tracks.get(i) : null;
      if (track && track.rotation) sampleRotation(track.rotation, time, node.quaternion);
      else node.quaternion.copy(restPose.quaternion);
      if (track && track.position && !(lockRootPosition && data.bones[i].parent < 0)) {
        samplePosition(track.position, time, node.position);
        const offset = rootPositionOffset.get(i);
        if (offset) node.position.sub(offset);
      } else node.position.copy(restPose.position);
      node.scale.copy(restPose.scale);
    }
    root.updateMatrixWorld(true);
    for (let i = 0; i < boneCount; i++) {
      boneMatrices[i].multiplyMatrices(nodes[i].matrixWorld, bindMatrices[i] || bindIdentity);
    }
  }

  function skin() {
    for (let i = 0; i < vertexCount; i++) {
      const w = boneWeights[i];
      const bi = boneIndices[i];
      const total = (w[0] || 0) + (w[1] || 0) + (w[2] || 0) + (w[3] || 0) || 1;
      acc.fill(0);
      for (let k = 0; k < 4; k++) {
        const weight = (w[k] || 0) / total;
        if (weight <= 0) continue;
        const bone = bi[k];
        const m = (boneMatrices[bone] || boneMatrices[0]).elements;
        for (let e = 0; e < 16; e++) acc[e] += m[e] * weight;
      }
      blended.fromArray(acc);
      vertex.set(raw[i * 3], raw[i * 3 + 1], raw[i * 3 + 2]).applyMatrix4(blended);
      out.copy(vertex);
      positions[i * 3] = -out.x;
      positions[i * 3 + 1] = out.y;
      positions[i * 3 + 2] = out.z;
    }
    geometry.attributes.position.needsUpdate = true;
    geometry.computeVertexNormals();
  }

  function update(dt, timeScale = 1, scaleAllClips = false) {
    const clip = clipData[clipName];
    if (!clip) return;
    clipTime += dt * (scaleAllClips || clipName === 'run' ? timeScale : 1);
    if (clipLoops) clipTime %= clip.duration;
    else clipTime = Math.min(clipTime, clip.duration);
    applyPose(clipTime);
    skin();
  }

  // Initial pose so the mesh exists before the first update (bind pose looks wrong:
  // sample the run clip start instead).
  clipName = clipData.run ? 'run' : Object.keys(clipData)[0] || '';
  applyPose(0);
  skin();

  return {
    object: holder,
    mesh,
    material,
    /** @param {boolean} active @param {THREE.Texture|null} [texture]
     * @param {number} [dt] @param {number} [remaining] */
    setInvincibility(active, texture = null, dt = 0, remaining = Infinity) {
      if (active) {
        if (!glowMaterial) {
          const map = texture?.clone() || null;
          if (map) {
            map.wrapS = map.wrapT = THREE.RepeatWrapping;
            map.needsUpdate = true;
          }
          glowMaterial = new THREE.MeshBasicMaterial({
            // Native shader111: texture * white RGB, SetAlpha(.5).
            map, color: 0xffffff, transparent: true, opacity: .5,
            depthWrite: false, side: THREE.FrontSide, fog: false, toneMapped: false,
          });
        }
        if (mesh.material !== glowMaterial) {
          glowMaterial.opacity = .5;
          glowMaterial.map?.offset.set(0, 0);
        }
        // CharacterPlayer.Update: independent .5 -> 0 warning cycle.
        // Native writes texture offsets, but shader111 does not read _MainTex_ST.
        const delta = Math.fround(Math.fround(dt) * 2);
        const next = Math.fround(glowMaterial.opacity - delta);
        glowMaterial.opacity = remaining > 2.5 || next <= 0 ? .5 : next;
        mesh.material = glowMaterial;
      } else {
        glowMaterial?.map?.offset.set(0, 0);
        mesh.material = material;
      }
    },
    setClip,
    update,
    getClip: () => clipName,
    clipDuration: (name) => clipData[name]?.duration || 0,
    setTime(t, loop = false) {
      clipLoops = loop;
      clipTime = t;
      applyPose(t);
      skin();
    },
    getTime() {
      return { clipName, clipTime };
    },
    // Debug helper: posed joint origins in the same space the skinned mesh is rendered in
    // (holder transform applied, x mirrored like the skinned vertices).
    joints() {
      const out = {};
      for (let i = 0; i < boneCount; i++) {
        const v = new THREE.Vector3().setFromMatrixPosition(nodes[i].matrixWorld);
        v.x = -v.x;
        v.applyMatrix4(holder.matrixWorld);
        out[data.bones[i].name] = v.toArray().map((n) => +n.toFixed(3));
      }
      return out;
    },
    clips: Object.keys(clipData),
    vertexCount,
    boneCount,
  };
}

export async function loadRunnerRig(url, textureUrl, options = {}) {
  const [data, texture] = await Promise.all([
    fetch(url).then((r) => {
      if (!r.ok) throw new Error(`runner rig ${url}: ${r.status}`);
      return r.json();
    }),
    textureUrl
      ? new Promise((resolve, reject) => {
          new THREE.TextureLoader().load(textureUrl, (tex) => {
            tex.colorSpace = THREE.SRGBColorSpace;
            tex.flipY = true; // Unity bakes these UVs for a non-flipped V (verified against the atlas regions)
            resolve(tex);
          }, undefined, reject);
        })
      : Promise.resolve(null),
  ]);
  let fallbackClips = options.fallbackClips || null, fallbackRig = options.fallbackRig || null;
  if ((!fallbackClips || !fallbackRig) && options.clipFallbackUrl) {
    try {
      const fb = await fetch(options.clipFallbackUrl).then((r) => r.json());
      fallbackRig = fb; fallbackClips = fb.clips || null;
    } catch {}
  }
  // The APK's shop-skin clip tracks are the default runner's animation copied verbatim onto
  // differently-built skeletons, so they cannot be played as-is. Whenever we retarget anyway
  // and the rig does not even share the Bip01 naming family, drop its baked tracks.
  let forceFallbackClips = options.forceFallbackClips === true;
  if (!forceFallbackClips && fallbackClips && Array.isArray(data.bones)) {
    const bip01 = data.bones.some((b) => /^bip0?1/i.test(String(b.name || '')));
    if (!bip01) forceFallbackClips = true;
  }
  return buildRunnerRig(data, { ...options, texture, fallbackClips, fallbackRig, forceFallbackClips });
}


// Different APK prefabs were authored at very different unit scales (raw rest heights range
// 1.2-10.8). Normalise a freshly built rig to the same on-screen height and drop its feet
// onto y = 0 so swapping skins never changes the apparent size. Shared by both entries.
export function normalizeRigHeight(rig, targetH = 2.55, options = {}) {
  try {
    if (rig.update) rig.update(0, 0);
    const o = rig.object;
    o.updateWorldMatrix(true, true);
    let box = new THREE.Box3().setFromObject(o);
    let size = box.getSize(new THREE.Vector3());
    // Some prefabs are authored lying flat (huge XZ, thin Y): stand them upright first.
    if (options.autoOrient !== false && size.y > 1e-3 && Math.max(size.x, size.z) > size.y * 1.6) {
      o.rotation.x -= Math.PI / 2;
      o.updateWorldMatrix(true, true);
      box = new THREE.Box3().setFromObject(o);
      size = box.getSize(new THREE.Vector3());
    }
    const height = box.max.y - box.min.y;
    if (height > 1e-3 && Math.abs(height - targetH) > 0.02) o.scale.multiplyScalar(targetH / height);
    o.updateWorldMatrix(true, true);
    box = new THREE.Box3().setFromObject(o);
    o.position.y -= box.min.y;
  } catch (error) {
    console.warn('rig normalize failed', error);
  }
  return rig;
}
