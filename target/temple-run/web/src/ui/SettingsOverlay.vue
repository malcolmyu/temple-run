<script setup lang="ts">
import { ref } from 'vue';
import { mutableUi as ui, setAudioSettings } from '../game/state';
import { progress } from '../game/progress';
import * as sfx from '../sfx.js';

const emit = defineEmits<{ close: [] }>();
const music = ref(progress.music);
const sound = ref(progress.sound);

function toggleMusic(): void {
  music.value = !music.value;
  setAudioSettings(music.value, sound.value);
  if (music.value) sfx.startMusic('theme');
  else sfx.pauseMusic();
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
        <span>背景音乐<small>原版 61 s 循环</small></span>
        <em :class="{ on: music }">{{ music ? '开' : '关' }}</em>
      </button>
      <button class="switch-row" @click="toggleSound">
        <span>音效<small>金币 / 跳跃 / 转弯</small></span>
        <em :class="{ on: sound }">{{ sound ? '开' : '关' }}</em>
      </button>
      <p class="menu-stats">帧率 {{ ui.fps }} fps · 已解锁 {{ progress.owned.length }} 个角色</p>
      <button class="primary" @click="emit('close')"><span>完成</span><em>↗</em></button>
    </div>
  </section>
</template>
