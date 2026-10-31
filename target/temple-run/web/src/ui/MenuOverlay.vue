<script setup lang="ts">
import { progress } from '../game/progress';
defineProps<{ ready: boolean }>();
const emit = defineEmits<{ start: []; store: []; settings: []; stats: []; objectives: []; upgrades: [] }>();
</script>

<template>
  <section class="overlay">
    <div class="card">
      <p class="kicker">AN ENDLESS TEMPLE ADVENTURE</p>
      <h1 class="logo">TEMPLE<br />RUN</h1>
      <p class="tag">神庙逃亡</p>
      <p class="lead">穿过古老遗迹，收集金币。<br />越过断桥，躲开烈焰，跑得更远。</p>
      <button class="primary" :disabled="!ready" @click="emit('start')">
        <span>{{ ready ? '开始奔跑' : '加载中…' }}</span><em>↗</em>
      </button>
      <div class="menu-row">
        <button class="menu-btn" @click="emit('store')">STORE</button>
        <button class="menu-btn" @click="emit('objectives')">目标</button>
        <button class="menu-btn" @click="emit('upgrades')">升级</button>
        <button class="menu-btn" @click="emit('stats')">STATS</button>
        <button class="menu-btn" @click="emit('settings')">OPTIONS</button>
      </div>
      <div class="guide"><span>← → 换道 / 路口转弯 · A/D 横移</span><span>↑ 跳跃</span><span>↓ 滑铲</span></div>
      <p class="menu-stats">最远 {{ progress.bestDistance }} m · 金币 {{ progress.coins }} · 宝石 {{ progress.gems }}</p>
    </div>
  </section>
</template>
