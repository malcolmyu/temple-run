<script setup lang="ts">
import { computed } from 'vue';
import NativeResultNumber from './NativeResultNumber.vue';

const props = defineProps<{ distance: number; coins: number; gems: number; best: number; score: number; multiplier: number; reason: string; kind: string; reviveAvailable: boolean; reviveCost: number }>();
const BASE = import.meta.env.BASE_URL;
const art = computed(() => {
  const map: Record<string, string> = {
    fall: 'deathIllustrationFallA@2x.png',
    water: 'deathIllustrationWater@2x.png',
    caught: 'deathIllustrationEaten@2x.png',
    impact: 'deathIllustrationTree@2x.png',
    missed: 'deathIllustrationWater@2x.png',
  };
  return `${BASE}assets/ui/${map[props.kind] ?? 'deathIllustrationSlide@2x.png'}`;
});
const emit = defineEmits<{ restart: []; menu: []; store: []; revive: [] }>();
</script>

<template>
  <section class="result-overlay" aria-label="本局结算">
    <article class="result-scroll" :style="{ '--scroll-atlas': `url(${BASE}assets/ui/result-paper-tile.png)` }">
      <div class="scroll-paper" aria-hidden="true"></div>
      <img class="result-illustration" :src="art" alt="" />
      <p class="result-message">{{ kind === 'missed' || kind === 'water' ? '你做的点心很好吃。' : reason }}</p>
      <div class="result-summary">
        <h2><img :src="`${BASE}assets/ui/result-header-left.png`" alt="" />得分<img :src="`${BASE}assets/ui/result-header-right.png`" alt="" /></h2>
        <NativeResultNumber :value="score" />
        <dl class="result-metrics">
          <div><dt>距离：</dt><dd>{{ distance.toLocaleString('en-US') }}米</dd></div>
          <div><dt>金币：</dt><dd>{{ coins.toLocaleString('en-US') }}</dd></div>
          <div><dt>加成：</dt><dd>{{ multiplier }}x</dd></div>
          <div v-if="gems > 0"><dt>宝石：</dt><dd>{{ gems }}</dd></div>
        </dl>
      </div>
      <nav class="result-actions" aria-label="结算操作">
        <button v-if="reviveAvailable" class="result-revive" @click="emit('revive')">宝石复活 · ◆ {{ reviveCost }}</button>
        <button class="result-restart" :style="{backgroundImage:`url(${BASE}assets/ui/result-ribbon-wide.png)`}" @click="emit('restart')">再跑一次</button>
        <div class="result-links">
          <button @click="emit('store')">商店</button>
          <button @click="emit('menu')">主菜单</button>
        </div>
      </nav>
    </article>
  </section>
</template>

<style scoped>
.result-overlay { position:absolute; inset:0; z-index:5; overflow:auto; container-type:size; background:#10221b45; }
.result-scroll { position:relative; width:76.5%; min-height:100cqh; margin:0 auto; color:#302617; font-family:Georgia,'Songti SC',serif; text-align:center; }
.scroll-paper { position:absolute; inset:0; background-image:var(--scroll-atlas); background-size:100% auto; background-position:left top; background-repeat:repeat-y; pointer-events:none; }
.result-illustration { position:absolute; width:82%; height:auto; left:9%; top:11.6cqh; }
.result-message { position:absolute; top:27.8cqh; left:9%; width:82%; margin:0; font-size:clamp(12px,2vh,18px); }
.result-summary { position:absolute; top:44.65cqh; left:12%; width:76%; }
.result-summary h2 { display:flex; justify-content:center; align-items:center; gap:5px; margin:0 0 4px; font-size:28px; font-weight:500; color:#f4d683; text-shadow:0 2px #70501f; }
.result-summary h2 img { width:27px; height:30px; }
.result-metrics { margin:22px 43px 0 30px; color:#e5d6ae; font-size:14px; }
.result-metrics > div { display:flex; justify-content:space-between; align-items:baseline; margin:0 0 16px; }
.result-metrics dt { font-weight:400; }
.result-metrics dd { margin:0; color:#ffe95b; letter-spacing:1px; }
.result-actions { position:absolute; bottom:5cqh; left:13%; width:74%; display:grid; gap:9px; }
.result-actions button { border:0; font-family:inherit; cursor:pointer; }
.result-restart { animation:result-button-in .25s .75s both; min-height:42px; aspect-ratio:535/118; background-color:transparent; background-size:100% 100%; color:#f5d68a; font-size:20px; text-shadow:0 2px #3c2514; }
.result-revive { animation:result-button-in .25s .75s both; padding:6px; background:#574525; color:#f4dfa1; }
.result-links { animation:result-button-in .25s 1s both; display:flex; justify-content:space-between; }
.result-links button { background:transparent; color:#eee0b0; font-size:14px; padding:7px 2px; }
@keyframes result-button-in { from { visibility:hidden; transform:translateY(100cqh); } to { visibility:visible; transform:translateY(0); } }
.result-actions button:focus-visible { outline:2px solid #fff1bb; outline-offset:3px; }
</style>
