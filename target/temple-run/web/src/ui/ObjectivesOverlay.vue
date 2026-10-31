<script setup lang="ts">
import { computed, ref } from 'vue';
import { OBJECTIVES, claim, objectiveClaimed, nextRunScoreMultiplier } from '../game/objectives';
import { progress, saveProgress } from '../game/progress';
import { syncBanks } from '../game/state';

const emit = defineEmits<{ close: [] }>();
const notice = ref('');
const scoreMultiplier = computed(nextRunScoreMultiplier);

function onClaim(id: string): void {
  if (claim(id)) {
    notice.value = '奖励已领取';
    syncBanks();
  } else {
    notice.value = '尚未完成';
  }
  void progress;
  saveProgress();
}
</script>

<template>
  <section class="overlay soft" @click.self="emit('close')">
    <div class="card">
      <p class="kicker">OBJECTIVES</p>
      <h2 class="title">目标</h2>
      <p>下局得分倍率 {{ scoreMultiplier }}× · 每完成一项目标 +1</p>
      <div class="objective-list">
        <div v-for="objective in OBJECTIVES" :key="objective.id" class="objective" :class="{ done: objective.done() }">
          <div class="objective-head">
            <strong>{{ objective.title }}</strong>
            <span v-if="objectiveClaimed(objective.id)">{{ objective.coins || objective.gems ? '已领取' : '已确认' }}</span>
            <button v-else-if="objective.done()" class="mini" @click="onClaim(objective.id)">{{ objective.coins || objective.gems ? '领取' : '确认' }}</button>
          </div>
          <small>{{ objective.detail }}</small>
          <div class="bar"><i :style="{ width: `${Math.min(100, (objective.current() / objective.target) * 100)}%` }" /></div>
          <p class="reward">
            {{ objective.current() }} / {{ objective.target }}
            <em>奖励 {{ objective.coins ? `● ${objective.coins}` : '' }} {{ objective.gems ? `◆ ${objective.gems}` : '' }}{{ !objective.coins && !objective.gems ? '下局得分倍率 +1' : '' }}</em>
          </p>
        </div>
      </div>
      <p v-if="notice" class="notice">{{ notice }}</p>
      <button class="primary" @click="emit('close')"><span>返回</span><em>↗</em></button>
    </div>
  </section>
</template>
