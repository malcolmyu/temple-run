<script setup lang="ts">
import { useModalDialog } from './useModalDialog';
import { progress } from '../game/progress';
import DiagnosticsExport from './DiagnosticsExport.vue';
const emit = defineEmits<{ close: [] }>();
const dialog=useModalDialog(()=>emit('close'));
</script>

<template>
  <section ref="dialog" tabindex="-1" class="overlay soft" role="dialog" aria-modal="true" aria-label="统计" @click.self="emit('close')">
    <div class="card">
      <p class="kicker">STATS</p>
      <h2 class="title">统计</h2>
      <div class="stat-list">
        <div><span>历史最远</span><strong>{{ progress.bestDistance }} m</strong></div>
        <div><span>最高分</span><strong>{{ progress.bestScore }}</strong></div>
        <div><span>单局最多金币</span><strong>{{ progress.bestRunCoins }}</strong></div>
        <div><span>累计收集金币</span><strong>{{ progress.lifetimeCoins }}</strong></div>
        <div><span>累计里程</span><strong>{{ progress.totalDistance }} m</strong></div>
        <div><span>跑步次数</span><strong>{{ progress.runs }}</strong></div>
        <div><span>金币余额</span><strong>● {{ progress.coins }}</strong></div>
        <div><span>宝石余额</span><strong>◆ {{ progress.gems }}</strong></div>
        <div><span>解锁角色</span><strong>{{ progress.owned.length }} / 9</strong></div>
      </div>
      <DiagnosticsExport />
      <button class="primary" @click="emit('close')"><span>完成</span><em>↗</em></button>
    </div>
  </section>
</template>
