// Sample-based sound effects from the original Temple Run AudioClips.
// Files live in public/assets/audio/ (16-bit PCM WAVs extracted from the APK).
// Some clips are authored very quiet (slide/footsteps ≈ -38 dBFS) so they carry
// an explicit per-sound gain here instead of being boosted in the assets.

const BASE = `${import.meta.env.BASE_URL}assets/audio/`;

const CLIPS = {
  coin: { file: 'coin.mp3', gain: 1.15 },
  coinCascade: { file: 'cashRegister.wav', gain: 0.7 },
  // Original voice lines exist in male and female variants ("…Female" suffix). The runner picks
  // the matching set per equipped character (see vkey() in main.js).
  jump: { file: 'gruntJump.wav', gain: 0.95 },
  jumpF: { file: 'gruntJumpFemale.wav', gain: 0.95 },
  land: { file: 'gruntJumpLand.wav', gain: 0.9 },
  landF: { file: 'gruntJumpLandFemale.wav', gain: 0.9 },
  slide: { file: 'slide.wav', gain: 7.5 },
  footstep: { file: 'footstepsTurn.wav', gain: 13 },
  // Original per-surface running loops (temple stone / wooden planks).
  stepTemple: { file: 'footstepsTemple.mp3', gain: 1.35 },
  stepPlank: { file: 'footstepsPlank.mp3', gain: 1.35 },
  stepCliff: { file: 'footstepsCliff.mp3', gain: 1.35 },
  whoosh: { file: 'wooosh.wav', gain: 0.75 },
  swish: { file: 'swish.wav', gain: 0.9 },
  stumble: { file: 'gruntTrip.wav', gain: 0.95 },
  stumbleF: { file: 'gruntTripFemale.wav', gain: 0.95 },
  splat: { file: 'splat.wav', gain: 1 },
  splatF: { file: 'splatFemale.wav', gain: 1 },
  scream: { file: 'scream.wav', gain: 1 },
  screamF: { file: 'screamFemale.wav', gain: 1 },
  gameOver: { file: 'cymbalCrash.wav', gain: 0.8 },
  click: { file: 'buttonClick.wav', gain: 0.55 },
  best: { file: 'woohoo.wav', gain: 0.85 },
  bestF: { file: 'woohooFemale.wav', gain: 0.85 },
  jingle: { file: 'scoreBlast.wav', gain: 0.6 },
  splash: { file: 'splash.wav', gain: 0.8 },
  sizzle: { file: 'sizzle.wav', gain: 0.7 },
  monkey: { file: 'monkeyRoar.wav', gain: 0.8 },
  monkeys: { file: 'monkeys.wav', gain: 1 },
  buy: { file: 'cashRegister.wav', gain: 0.8 },
  magnet: { file: 'magnet.mp3', gain: 1 },
  shimmer: { file: 'shimmer.mp3', gain: 0.85 },
  boostLoop: { file: 'boostLoop.mp3', gain: 1.1, loop: true },
  meterFull: { file: 'bonusMeterFull.wav', gain: .85 },
  branchChime: { file: 'branchChime.wav', gain: 0.9 },
};

/* ---- original background music (looping, streamed via <audio>) ---- */
const MUSIC = { theme: 'BackgroundMusic.mp3', night: 'nightMusic.mp3' };
const music = { el: null, current: null, timer: null };
let musicVolume = 0.32;

function fadeMusic(el, to, seconds, done) {
  clearInterval(music.timer);
  const steps = Math.max(1, Math.round(seconds * 20));
  const from = el.volume;
  let i = 0;
  music.timer = setInterval(() => {
    i += 1;
    el.volume = Math.max(0, Math.min(1, from + (to - from) * (i / steps)));
    if (i >= steps) {
      clearInterval(music.timer);
      if (done) done();
    }
  }, 50);
}

export function startMusic(name = 'theme', volume = musicVolume) {
  if (music.current === name && music.el && !music.el.paused) return;
  stopMusic(0.6);
  const el = new Audio(BASE + (MUSIC[name] || MUSIC.theme));
  el.loop = true;
  el.preload = 'auto';
  el.volume = 0;
  music.el = el;
  music.current = name;
  el.play().then(() => fadeMusic(el, volume, 2.5)).catch(() => {});
}

export function pauseMusic() {
  if (music.el && !music.el.paused) music.el.pause();
}

export function resumeMusic() {
  if (music.el && music.el.paused) music.el.play().catch(() => {});
}

export function musicInfo() {
  return music.el ? { current: music.current, paused: music.el.paused, volume: +music.el.volume.toFixed(2), time: +music.el.currentTime.toFixed(1), duration: +(music.el.duration || 0).toFixed(1) } : { current: null };
}

export function stopMusic(fade = 1.2) {
  const el = music.el;
  music.el = null;
  music.current = null;
  clearInterval(music.timer);
  if (!el) return;
  fadeMusic(el, 0, fade, () => { try { el.pause(); } catch {} });
}

let ctx = null;
let master = null;
let muted = false;
const buffers = new Map();
let preloadPromise = null;
const loops = new Map();

function ensureContext() {
  if (ctx) return ctx;
  try {
    ctx = new (window.AudioContext || window.webkitAudioContext)();
    master = ctx.createGain();
    master.gain.value = muted ? 0 : 0.85;
    master.connect(ctx.destination);
  } catch {
    ctx = null;
  }
  return ctx;
}

export function isMuted() {
  return muted;
}

export function setMuted(value) {
  muted = !!value;
  if (master) master.gain.value = muted ? 0 : 0.85;
  // Music has its own toggle (settings.music); the SFX mute must not silence it.
}

export function unlockAudio() {
  const context = ensureContext();
  if (!context) return Promise.resolve(false);
  if (context.state === 'suspended') context.resume();
  return preload();
}

export function preload() {
  if (!ctx) return Promise.resolve(false);
  if (preloadPromise) return preloadPromise;
  const unique = [...new Set(Object.values(CLIPS).map((c) => c.file))];
  preloadPromise = Promise.all(
    unique.map(async (file) => {
      try {
        const res = await fetch(BASE + file);
        if (!res.ok) throw new Error(`${res.status} ${file}`);
        const data = await res.arrayBuffer();
        const buffer = await ctx.decodeAudioData(data);
        buffers.set(file, buffer);
      } catch (err) {
        console.warn('sfx load failed', file, err);
      }
    }),
  ).then(() => true);
  return preloadPromise;
}

const nodeStats={created:0,ended:0,loops:0,amb:0,friction:0,fall:0,wind:0,music:0};
export function stats(){return {...nodeStats,active:nodeStats.created-nodeStats.ended,played:{...playedCounts},loopsOpen:loops.size,ambOn:!!amb,frictionOn:!!friction,fallOn:!!fallNode,windOn:!!windNode}}
function playBuffer(file, { gain = 1, rate = 1, when = 0, loop = false, detune = 0 } = {}) {
  if (!ctx || muted) return null;
  const buffer = buffers.get(file);
  if (!buffer) return null;
  const source = ctx.createBufferSource();
  nodeStats.created++;source.addEventListener('ended',()=>{nodeStats.ended++;try{source.disconnect();gainNode.disconnect()}catch{}});
  source.buffer = buffer;
  source.loop = loop;
  source.playbackRate.value = rate;
  source.detune.value = detune;
  const gainNode = ctx.createGain();
  gainNode.gain.value = gain;
  source.connect(gainNode).connect(master);
  source.start(ctx.currentTime + when);
  return { source, gainNode };
}

export const playedCounts = {};
export function play(name, opts = {}) {
  const clip = CLIPS[name];
  if (!clip || !ctx) return null;
  playedCounts[name] = (playedCounts[name] || 0) + 1;
  const out = playBuffer(clip.file, { gain: (opts.gain ?? 1) * clip.gain, rate: opts.rate ?? 1, detune: opts.detune ?? 0 });
  if (out && opts.onended) out.source.onended = opts.onended;
  return out;
}

export function startLoop(name, opts = {}) {
  const clip = CLIPS[name];
  if (!clip || !ctx) return null;
  if (loops.has(name)) return loops.get(name);
  const handle = playBuffer(clip.file, { gain: (opts.gain ?? 1) * clip.gain, loop: true, rate: opts.rate ?? 1 });
  if (!handle) return null;
  loops.set(name, handle);nodeStats.loops++;
  // A loop started while already inside the hall must go through the reverb too.
  if (hall.on && name.startsWith('step') && hall.convolver) {
    try { handle.gainNode.connect(hall.convolver); handle.__verb = true; hall.connected.add(name); } catch {}
  }
  return handle;
}

export function setLoopRate(name, rate) {
  const h = loops.get(name);
  if (h && ctx) h.source.playbackRate.setValueAtTime(Math.max(0.55, Math.min(1.7, rate)), ctx.currentTime);
}


/* ---- synthesized biome ambience (river water / clifftop wind) ---- */
let amb = null;
let noiseBuffer = null;
function getNoise() {
  if (noiseBuffer || !ctx) return noiseBuffer;
  const len = Math.floor(ctx.sampleRate * 2.4);
  noiseBuffer = ctx.createBuffer(1, len, ctx.sampleRate);
  const data = noiseBuffer.getChannelData(0);
  let last = 0;
  for (let i = 0; i < len; i++) {
    // Brown-ish noise: smoother and more natural than raw white noise.
    last = (last + Math.random() * 2 - 1) * 0.5;
    data[i] = last;
  }
  return noiseBuffer;
}
export function setAmbience(kind, level = 0.5) {
  if (!ctx) return;
  if (amb && amb.kind === kind) {
    amb.gain.gain.linearRampToValueAtTime(level, ctx.currentTime + 0.4);
    return;
  }
  stopAmbience(0.5);
  if (!kind) return;
  const src = ctx.createBufferSource();
  src.buffer = getNoise();
  src.loop = true;
  const filter = ctx.createBiquadFilter();
  if (kind === 'water') {
    filter.type = 'bandpass';
    filter.frequency.value = 760;
    filter.Q.value = 0.55;
  } else {
    filter.type = 'lowpass';
    filter.frequency.value = 430;
    filter.Q.value = 0.5;
  }
  const gain = ctx.createGain();
  gain.gain.value = 0;
  gain.gain.linearRampToValueAtTime(level, ctx.currentTime + 0.8);
  // Slow swell so the ambience breathes instead of hissing.
  const lfo = ctx.createOscillator();
  const lfoGain = ctx.createGain();
  lfo.frequency.value = kind === 'water' ? 0.23 : 0.11;
  lfoGain.gain.value = level * 0.35;
  lfo.connect(lfoGain).connect(gain.gain);
  lfo.start();
  src.connect(filter).connect(gain).connect(master);
  src.start();
  amb = { kind, src, gain, lfo };nodeStats.amb++;
}
export function stopAmbience(fade = 0.4) {
  if (!amb || !ctx) return;
  const a = amb;
  amb = null;
  try {
    const t = ctx.currentTime;
    a.gain.gain.cancelScheduledValues(t);
    a.gain.gain.setValueAtTime(a.gain.gain.value, t);
    a.gain.gain.linearRampToValueAtTime(0, t + fade);
    a.src.stop(t + fade + 0.05);
    a.lfo.stop(t + fade + 0.05);
  } catch {}
}
export function ambienceInfo() {
  return amb ? amb.kind : null;
}


/* ---- hall reverb: a short synthesised impulse response for the colonnade ---- */
const hall = { convolver: null, wet: null, on: false, connected: new Set() };
function makeHallIR() {
  const dur = 1.7;
  const len = Math.floor(ctx.sampleRate * dur);
  const ir = ctx.createBuffer(2, len, ctx.sampleRate);
  for (let ch = 0; ch < 2; ch++) {
    const d = ir.getChannelData(ch);
    for (let i = 0; i < len; i++) {
      const t = i / len;
      d[i] = (Math.random() * 2 - 1) * Math.pow(1 - t, 3.2) * (ch ? 0.85 : 1);
    }
  }
  return ir;
}
export function setHallReverb(on) {
  hall.on = !!on;
  if (!ctx) return;
  if (!hall.convolver) {
    hall.convolver = ctx.createConvolver();
    hall.convolver.buffer = makeHallIR();
    hall.wet = ctx.createGain();
    hall.wet.gain.value = 0;
    hall.convolver.connect(hall.wet).connect(master);
  }
  // Route every active footstep loop into the reverb (once per loop).
  for (const [name, h] of loops) {
    if (!name.startsWith('step') || h.__verb) continue;
    try { h.gainNode.connect(hall.convolver); h.__verb = true; hall.connected.add(name); } catch {}
  }
  const target = hall.on ? 0.5 : 0;
  const t = ctx.currentTime;
  hall.wet.gain.cancelScheduledValues(t);
  hall.wet.gain.setValueAtTime(hall.wet.gain.value, t);
  hall.wet.gain.linearRampToValueAtTime(target, t + 0.45);
}
export function reverbInfo() {
  return { on: hall.on, wet: hall.wet ? +hall.wet.gain.value.toFixed(3) : 0, loops: [...hall.connected] };
}

export function activeLoops() {
  return [...loops.keys()];
}

export function stopLoop(name, fade = 0.12) {
  const handle = loops.get(name);
  if (!handle || !ctx) return;
  loops.delete(name);
  try {
    const t = ctx.currentTime;
    handle.gainNode.gain.cancelScheduledValues(t);
    handle.gainNode.gain.setValueAtTime(handle.gainNode.gain.value, t);
    handle.gainNode.gain.linearRampToValueAtTime(0, t + fade);
    handle.source.stop(t + fade + 0.02);
    setTimeout(()=>{try{handle.source.disconnect();handle.gainNode.disconnect()}catch{}},(fade+0.2)*1000);
  } catch {}
}

export function stopAllLoops() {
  for (const name of [...loops.keys()]) stopLoop(name, 0.05);
}

// Synthesised landing "thud": a short low sine drop, layered under the vocal land grunt.
// Cheap, consistent across devices and avoids shipping another sample.
export function thud(gain = 0.5) {
  if (!ctx || muted || !master) return;
  const t = ctx.currentTime;
  const osc = ctx.createOscillator();
  const g = ctx.createGain();
  osc.type = 'sine';
  osc.frequency.setValueAtTime(115, t);
  osc.frequency.exponentialRampToValueAtTime(46, t + 0.16);
  g.gain.setValueAtTime(0.0001, t);
  g.gain.exponentialRampToValueAtTime(Math.max(0.0002, gain), t + 0.012);
  g.gain.exponentialRampToValueAtTime(0.0001, t + 0.22);
  osc.connect(g).connect(master);
  osc.start(t);
  osc.stop(t + 0.24);
  playedCounts.thud = (playedCounts.thud || 0) + 1;
}

// Continuous slide friction: filtered noise loop that fades in/out with the slide.
let friction = null;
export function startFriction(gain = 0.22) {
  if (!ctx || !master || muted) return;
  if (friction) { friction.gain.gain.setTargetAtTime(gain, ctx.currentTime, 0.06); return; }
  const len = ctx.sampleRate * 1.2;
  const buf = ctx.createBuffer(1, len, ctx.sampleRate);
  const data = buf.getChannelData(0);
  for (let i = 0; i < len; i++) data[i] = (Math.random() * 2 - 1) * (0.6 + 0.4 * Math.sin(i / 900));
  const src = ctx.createBufferSource();
  src.buffer = buf; src.loop = true;
  const filter = ctx.createBiquadFilter();
  filter.type = 'bandpass'; filter.frequency.value = 950; filter.Q.value = 0.7;
  const g = ctx.createGain(); g.gain.value = 0.0001;
  src.connect(filter).connect(g).connect(master);
  src.start();
  g.gain.setTargetAtTime(gain, ctx.currentTime, 0.08);
  friction = { src, gain: g };nodeStats.friction++;
}
export function stopFriction() {
  if (!friction || !ctx) return;
  const f = friction; friction = null;
  f.gain.gain.setTargetAtTime(0.0001, ctx.currentTime, 0.09);
  setTimeout(() => { try { f.src.stop(); } catch {} f.src.disconnect(); }, 420);
}

// --- Synthesised waterfall ambience (no dedicated asset in the APK) -----------
let fallNode = null, fallGain = null;
export function startWaterfall(level = 0.35) {
  if (!ctx || isMuted()) return;
  if (!fallNode) {
    const len = ctx.sampleRate * 2;
    const buf = ctx.createBuffer(1, len, ctx.sampleRate);
    const d = buf.getChannelData(0);
    let last = 0;
    for (let i = 0; i < len; i++) { const w = Math.random() * 2 - 1; last = last * 0.72 + w * 0.28; d[i] = last * 1.6; }
    const src = ctx.createBufferSource(); src.buffer = buf; src.loop = true;
    const lp = ctx.createBiquadFilter(); lp.type = 'lowpass'; lp.frequency.value = 950; lp.Q.value = .4;
    const hp = ctx.createBiquadFilter(); hp.type = 'highpass'; hp.frequency.value = 140;
    fallGain = ctx.createGain(); fallGain.gain.value = 0;
    src.connect(hp); hp.connect(lp); lp.connect(fallGain); fallGain.connect(master);
    src.start();
    fallNode = src;nodeStats.fall++;
    fallLfo = ctx.createOscillator(); fallLfo.frequency.value = .2;
    const lfoGain = ctx.createGain(); lfoGain.gain.value = .06;
    fallLfo.connect(lfoGain); lfoGain.connect(fallGain.gain); fallLfo.start();
  }
  const t = ctx.currentTime;
  fallGain.gain.cancelScheduledValues(t);
  fallGain.gain.setTargetAtTime(Math.max(0, Math.min(.5, level)), t, .5);
}
// --- Synthesised canyon wind (band-passed noise with slow gusts) ------------
let windNode = null, windGain = null;
export function startWind(level = 0.2) {
  if (!ctx || isMuted()) return;
  if (!windNode) {
    const len = ctx.sampleRate * 3;
    const buf = ctx.createBuffer(1, len, ctx.sampleRate);
    const d = buf.getChannelData(0);
    let last = 0;
    for (let i = 0; i < len; i++) { const w = Math.random() * 2 - 1; last = last * 0.9 + w * 0.1; d[i] = last * 3.2; }
    const src = ctx.createBufferSource(); src.buffer = buf; src.loop = true;
    const bp = ctx.createBiquadFilter(); bp.type = 'bandpass'; bp.frequency.value = 620; bp.Q.value = 1.6;
    const lp = ctx.createBiquadFilter(); lp.type = 'lowpass'; lp.frequency.value = 1400;
    windGain = ctx.createGain(); windGain.gain.value = 0;
    src.connect(bp); bp.connect(lp); lp.connect(windGain); windGain.connect(master);
    src.start();
    windNode = src; nodeStats.wind++;
    const gust = ctx.createOscillator(); gust.frequency.value = .14;
    const gGain = ctx.createGain(); gGain.gain.value = 260;
    gust.connect(gGain); gGain.connect(bp.frequency); gust.start(); windNode._gust = gust;
    const swell = ctx.createOscillator(); swell.frequency.value = .09;
    const sGain = ctx.createGain(); sGain.gain.value = .05;
    swell.connect(sGain); sGain.connect(windGain.gain); swell.start(); windNode._swell = swell;
  }
  const t = ctx.currentTime;
  windGain.gain.cancelScheduledValues(t);
  windGain.gain.setTargetAtTime(Math.max(0, Math.min(.4, level)), t, .8);
}
export function windInfo() { return { gain: windGain ? +windGain.gain.value.toFixed(3) : 0 }; }
export function stopWind() {
  if (!ctx || !windGain) return;
  const t = ctx.currentTime;
  windGain.gain.cancelScheduledValues(t);
  windGain.gain.setTargetAtTime(0.0001, t, .7);
}
export function waterfallInfo() { return { gain: fallGain ? +fallGain.gain.value.toFixed(3) : 0 }; }
export function stopWaterfall() {
  if (!ctx || !fallGain) return;
  const t = ctx.currentTime;
  fallGain.gain.cancelScheduledValues(t);
  fallGain.gain.setTargetAtTime(0, t, .45);
}
let fallLfo = null;
