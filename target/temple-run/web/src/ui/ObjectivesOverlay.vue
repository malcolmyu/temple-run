<script setup lang="ts">
import { ref } from 'vue';
import { OBJECTIVES, claim, objectiveClaimed } from '../game/objectives';
import { progress, saveProgress } from '../game/progress';
import { syncBanks } from '../game/state';

const emit = defineEmits<{ close: [] }>();
const notice = ref('');

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
      <div class="objective-list">
        <div v-for="objective in OBJECTIVES" :key="objective.id" class="objective" :class="{ done: objective.done() }">
          <div class="objective-head">
            <strong>{{ objective.title }}</strong>
            <span v-if="objectiveClaimed(objective.id)">已领取</span>
            <button v-else-if="objective.done()" class="mini" @click="onClaim(objective.id)">领取</button>
          </div>
          <small>{{ objective.detail }}</small>
          <div class="bar"><i :style="{ width: `${Math.min(100, (objective.current() / objective.target) * 100)}%` }" /></div>
          <p class="reward">
            {{ objective.current() }} / {{ objective.target }}
            <em>奖励 {{ objective.coins ? `● ${objective.coins}` : '' }} {{ objective.gems ? `◆ ${objective.gems}` : '' }}</em>
          </p>
        </div>
      </div>
      <p v-if="notice" class="notice">{{ notice }}</p>
      <button class="primary" @click="emit('close')"><span>返回</span><em>↗</em></button>
    </div>
  </section>
</template>
