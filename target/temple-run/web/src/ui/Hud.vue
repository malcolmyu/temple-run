<script setup lang="ts">
import { computed } from 'vue';
import { mutableUi as ui } from '../game/state';
import { getGame } from '../game/boot';

const emit = defineEmits<{ pause: [] }>();
defineProps<{ disabled?: boolean }>();
const uiAsset = (file: string): string => `${import.meta.env.BASE_URL}assets/ui/${file}`;

const turnLabel = computed(() => (ui.turnDirection < 0 ? '前方左转' : ui.turnDirection > 0 ? '前方右转' : ''));
const powerLabel = computed(() => {
  if (!ui.power) return '';
  const names: Record<string, string> = { magnet: '磁铁', shield: '护盾', boost: '加速', bonus: '金币加成', coin: '金币', gem: '宝石' };
  return `${names[ui.power] ?? ui.power} ${Math.ceil(ui.powerRemaining)}s`;
});
const cueLabel = computed(() => {
  const map: Record<string, string> = { hurdle: '↑ 跳过', trip: '↑ 跳过', arch: '↓ 滑铲', gap: '↑ 跳过', gapLong: '↑ 长坑', fire: '↔ 换道' };
  return ui.nextCue ? map[ui.nextCue] ?? '' : '';
});

function press(action: 'left' | 'right' | 'jump' | 'slide'): void {
  getGame()?.input.push(action);
}
</script>

<template>
  <div class="hud">
    <header class="hud-top">
      <div class="brand">
        <span class="brand-mark">◆</span>
        <span>神庙逃亡<small>THE LOST RELIC · WEB RUNNER</small></span>
      </div>
      <div class="hud-actions">
        <button class="icon-btn" aria-label="暂停" @click="emit('pause')">Ⅱ</button>
      </div>
    </header>

    <div class="score-card">
      <span class="score-word">SCORE</span>
      <strong class="score-value">{{ ui.score }}</strong>
      <div class="score-meta">
        <span>{{ ui.distance }} m</span>
        <span>● {{ ui.coins }}</span>
        <span>◆ {{ ui.gems }}</span>
      </div>
      <div class="energy" :title="`能量 ${Math.round(ui.charge)}%`">
        <i :style="{ width: `${Math.min(100, ui.charge)}%` }" />
      </div>
    </div>

    <div v-if="ui.multiplier > 1" class="multi-badge">×{{ ui.multiplier }}</div>
    <div v-if="ui.power" class="power-badge">{{ powerLabel }}</div>
    <div v-if="cueLabel && !turnLabel" class="action-cue">{{ cueLabel }}</div>

    <div v-if="turnLabel" class="turn-cue" :class="{ ready: ui.turnQueued }">
      <span class="turn-arrow" :class="ui.turnDirection < 0 ? 'left' : 'right'">{{ ui.turnDirection < 0 ? '←' : '→' }}</span>
      <strong>{{ ui.turnQueued ? '转弯已确认' : turnLabel }}</strong>
      <small v-if="!ui.turnQueued">{{ ui.turnRemaining }} m</small>
    </div>

    <div v-if="turnLabel && ui.turnRemaining <= 18" class="turn-edge" :class="ui.turnDirection < 0 ? 'left' : 'right'">
      <span>{{ ui.turnQueued ? '已确认' : ui.turnDirection < 0 ? '← 左转' : '右转 →' }}</span>
      <small v-if="!ui.turnQueued">{{ ui.turnRemaining }} m</small>
    </div>

    <div v-if="ui.milestone" :key="ui.milestone.id" class="milestone">
      <img class="nj-art" :src="uiAsset(`${ui.milestone.art}.png`)" alt="NICE JOB" />
      <span class="ms-text">{{ ui.milestone.value }}<em>{{ ui.milestone.unit }}</em></span>
    </div>

    <div v-if="ui.hint" class="hint">{{ ui.hint }}</div>

    <div class="touch-pad">
      <div class="pad-group">
        <button class="pad-btn" @click="press('left')">←</button>
        <button class="pad-btn" @click="press('right')">→</button>
      </div>
      <div class="pad-group">
        <button class="pad-btn" @click="press('slide')">↓</button>
        <button class="pad-btn" @click="press('jump')">↑</button>
      </div>
    </div>
  </div>
</template>
