<script setup lang="ts">
import { ref } from 'vue';
import { mutableUi as ui, setAudioSettings } from '../game/state';
import { progress } from '../game/progress';
import * as sfx from '../sfx.js';
import { getGame } from '../game/boot';
import { getDifficulty, setDifficulty, type DifficultyName } from '../game/difficulty';

const emit = defineEmits<{ close: [] }>();
const music = ref(progress.music);
const sound = ref(progress.sound);
const tiltBusy = ref(false);
const tiltMessage = ref('');
const tilt = ref(getGame()?.input.isTiltEnabled ?? false);
const difficulty = ref<DifficultyName>(getDifficulty().name);

function toggleMusic(): void {
  music.value = !music.value;
  setAudioSettings(music.value, sound.value);
  if (music.value) sfx.startMusic('theme');
  else sfx.pauseMusic();
}

async function toggleTilt(): Promise<void> {
  if (tilt.value) {
    getGame()?.input.disableTilt();
    tilt.value = false;
    tiltMessage.value = '已关闭倾斜，仍可滑动或按方向键操作。';
    return;
  }
  if(tiltBusy.value)return;
  tiltBusy.value=true;
  try {
    const ok = await getGame()?.input.enableTilt();
    tilt.value = !!ok;
    tiltMessage.value = ok ? '已启用：保持自然握姿，再轻轻向左右倾斜。' : '无法启用倾斜：请检查设备支持和浏览器动作权限。可继续使用滑动操作。';
  } finally {tiltBusy.value=false;}
}

function toggleDifficulty(): void {
  difficulty.value = difficulty.value === 'challenge' ? 'classic' : 'challenge';
  setDifficulty(difficulty.value);
  sfx.play('click', { gain: 0.6 });
}

function toggleSound(): void {
  sound.value = !sound.value;
  setAudioSettings(music.value, sound.value);
  sfx.setMuted(!sound.value);
  if (sound.value) sfx.play('click', { gain: 0.6 });
}
</script>

<template>
  <section class="overlay soft" @click.self="emit('close')">
    <div class="card">
      <p class="kicker">OPTIONS</p>
      <h2 class="title">选项</h2>
      <button class="switch-row" @click="toggleMusic">
        <span>背景音乐<small>跑动时播放背景音乐</small></span>
        <em :class="{ on: music }">{{ music ? '开' : '关' }}</em>
      </button>
      <button class="switch-row" @click="toggleSound">
        <span>音效<small>金币 / 跳跃 / 转弯</small></span>
        <em :class="{ on: sound }">{{ sound ? '开' : '关' }}</em>
      </button>
      <button class="switch-row" @click="toggleDifficulty">
        <span>难度<small>{{ difficulty === 'challenge' ? '挑战：路障更密、时机更紧、速度更快' : '经典：循序增加速度与障碍，适合熟悉操作' }}</small></span>
        <em :class="{ on: difficulty === 'challenge' }">{{ difficulty === 'challenge' ? '挑战' : '经典' }}</em>
      </button>
      <button class="switch-row" :disabled="tiltBusy" @click="toggleTilt">
        <span>倾斜移动<small>开启时保持手机自然握姿；倾斜横移；左右滑动换道或路口转弯</small></span>
        <em :class="{ on: tilt }">{{ tiltBusy ? '等待授权' : tilt ? '开' : '关' }}</em>
      </button>
      <p v-if="tiltMessage" class="control-message" role="status">{{ tiltMessage }}</p>
      <details class="control-guide">
        <summary>操作说明</summary>
        <dl>
          <dt>左右滑动 / ← →</dt><dd>直路换道；靠近路口时选择转弯方向。</dd>
          <dt>向上滑动 / ↑</dt><dd>跳过树根、断桥和低火墙。</dd>
          <dt>向下滑动 / ↓</dt><dd>滑过树洞、拱门和高火塔下方。</dd>
          <dt>倾斜手机 / 按住 A、D</dt><dd>细调横向位置，收集侧边金币；路口仍需滑动或按方向键转弯。</dd>
        </dl>
        <p>分路提前选边；半边窄路靠向有路面的一侧。暂停后需手动继续。</p>
      </details>
      <p class="menu-stats">帧率 {{ ui.fps }} fps · 已解锁 {{ progress.owned.length }} 个角色</p>
      <button class="primary" @click="emit('close')"><span>完成</span><em>↗</em></button>
    </div>
  </section>
</template>

<style scoped>
.control-guide{margin:14px 0;text-align:left;color:#ead9ad;font-size:13px;line-height:1.5}
.control-guide summary{cursor:pointer;min-height:44px;display:list-item;align-content:center;color:#ffdf91}
.control-guide dl{margin:4px 0}.control-guide dt{font-weight:700}.control-guide dd{margin:0 0 10px;color:#d2c5a4}
.control-message{font-size:12px;line-height:1.5;color:#f5d99e;text-align:left}
</style>
