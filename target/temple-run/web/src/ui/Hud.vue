<script setup lang="ts">
import { computed } from 'vue';
import SpriteNumber from './SpriteNumber.vue';
import NativeScoreNumber from './NativeScoreNumber.vue';
import { mutableUi as ui } from '../game/state';
import { getGame } from '../game/boot';

const assist = new URLSearchParams(window.location.search).get('assist') === '1';
const emit = defineEmits<{ pause: [] }>();
defineProps<{ disabled?: boolean }>();
const uiAsset = (file: string): string => `${import.meta.env.BASE_URL}assets/ui/${file}`;

const turnLabel = computed(() => (ui.turnDirection < 0 ? '前方左转' : ui.turnDirection > 0 ? '前方右转' : ''));
const powerNames: Record<string,string> = {magnet:'磁铁',shield:'无敌',boost:'加速'};
const cueLabel = computed(() => {
  const map: Record<string, string> = { jump: '↑ 跳过', slide: '↓ 滑铲', dodge: '↔ 换道', run: '' };
  return ui.nextCue ? map[ui.nextCue] ?? '' : '';
});

function press(action: 'left' | 'right' | 'jump' | 'slide'): void {
  getGame()?.input.push(action);
}
</script>

<template>
  <div class="hud">
    <div class="relic-vines" aria-hidden="true" />
    <div class="relic-left" aria-hidden="true" />
    <div class="relic-right" aria-hidden="true" />
    <div class="relic-score">
      <strong><NativeScoreNumber :value="ui.score" /></strong>
      <span><img :src="uiAsset('hud-coin.png')" alt="" /><SpriteNumber :value="ui.coins" label="金币" :height="16" /></span>
    </div>
    <button class="relic-pause" aria-label="暂停" @click="emit('pause')">
      <img :src="uiAsset('bag.png')" alt="" /><img class="pause-glyph" :src="uiAsset('hud-pause.png')" alt="" />
    </button>
    <div v-if="ui.phase === 'playing'" class="coin-meter" aria-label="金币充能">
      <small>金币充能 {{ Math.floor(ui.charge) }}/100 · 等级 {{ ui.coinBonusLevel }}</small>
      <div><i :style="{width: `${ui.charge}%`}" /></div>
    </div>
    <div v-if="assist" class="run-distance">{{ ui.distance }} m</div>

    <div v-if="assist && ui.multiplier > 1" class="multi-badge">×{{ ui.multiplier }}</div>
    <div v-if="ui.powers.length" class="power-badge" role="status"><div v-for="effect in ui.powers" :key="effect.kind">{{ effect.slowing ? '减速' : powerNames[effect.kind] }} {{ Math.ceil(Math.max(0,effect.remaining-1e-6)) }}{{ effect.unit }}</div></div>
    <div v-if="assist && cueLabel && !turnLabel" class="action-cue">{{ cueLabel }}</div>

    <div v-if="assist && turnLabel" class="turn-cue" :class="{ ready: ui.turnQueued }">
      <span class="turn-arrow" :class="ui.turnDirection < 0 ? 'left' : 'right'">{{ ui.turnDirection < 0 ? '←' : '→' }}</span>
      <strong>{{ ui.turnQueued ? '转弯已确认' : turnLabel }}</strong>
      <small v-if="!ui.turnQueued">{{ ui.turnRemaining }} m</small>
    </div>

    <div v-if="assist && turnLabel && ui.turnRemaining <= 18" class="turn-edge" :class="ui.turnDirection < 0 ? 'left' : 'right'">
      <span>{{ ui.turnQueued ? '已确认' : ui.turnDirection < 0 ? '← 左转' : '右转 →' }}</span>
      <small v-if="!ui.turnQueued">{{ ui.turnRemaining }} m</small>
    </div>

    <div v-if="ui.milestone" :key="ui.milestone.id" class="milestone" :class="ui.milestone.art">
      <img class="milestone-board" :src="uiAsset('hud-milestone.png')" alt="" />
      <span class="ms-text"><SpriteNumber :value="ui.milestone.value" label="里程" :height="28" /><em>{{ ui.milestone.unit }}</em></span>
    </div>

    <div v-if="ui.hint && (assist || ui.hint.includes('半边路') || ui.hint.includes('分路') || ui.hint.includes('复活') || ui.hint.includes('金币充能'))" class="hint">{{ ui.hint }}</div>

    <div v-if="assist" class="touch-pad">
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

<style scoped>
.coin-meter{position:absolute;left:18px;bottom:24px;width:158px;color:#eed89b;text-shadow:0 1px 3px #000;pointer-events:none}
.coin-meter small{font-size:11px}.coin-meter>div{height:5px;background:#17251ccc;border:1px solid #ba9a54;border-radius:4px;overflow:hidden;margin-top:4px}
.coin-meter i{display:block;height:100%;background:#edc65d}
</style>
