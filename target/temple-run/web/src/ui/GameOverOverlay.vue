<script setup lang="ts">
defineProps<{ distance: number; coins: number; gems: number; best: number; score: number; reason: string; reviveAvailable: boolean; reviveCost: number }>();
const emit = defineEmits<{ restart: []; menu: []; store: []; revive: [] }>();
</script>

<template>
  <section class="overlay">
    <div class="card">
      <p class="kicker">RUN ENDED</p>
      <h2 class="title">结束了</h2>
      <p class="reason">{{ reason }}</p>
      <div class="result">
        <div><small>里程</small><strong>{{ distance }} m</strong></div>
        <div><small>金币</small><strong>{{ coins }}</strong></div>
        <div><small>宝石</small><strong>{{ gems }}</strong></div>
      </div>
      <p class="best-line">本局得分 <strong>{{ score }}</strong> · 历史最远 <strong>{{ best }} m</strong></p>
      <button v-if="reviveAvailable" class="primary revive" @click="emit('revive')">
        <span>宝石复活 · ◆ {{ reviveCost }}</span><em>⟳</em>
      </button>
      <button class="primary" @click="emit('restart')"><span>再跑一次</span><em>↗</em></button>
      <div class="menu-row">
        <button class="menu-btn" @click="emit('store')">STORE</button>
        <button class="menu-btn" @click="emit('menu')">返回菜单</button>
      </div>
    </div>
  </section>
</template>
