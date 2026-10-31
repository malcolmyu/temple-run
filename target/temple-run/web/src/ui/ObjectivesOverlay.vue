<script setup lang="ts">
import { computed, ref } from 'vue';
import { OBJECTIVES, claim, objectiveClaimed, nextRunScoreMultiplier } from '../game/objectives';
import { progress, saveProgress } from '../game/progress';
import { syncBanks } from '../game/state';

const emit = defineEmits<{ close: [] }>();
const notice = ref('');
const category=ref('全部');
const categories=['全部','距离','分数','金币','其他'];
const categoryOf=(id:string)=>id.startsWith('score')?'分数':id.startsWith('coins')||id==='coin-hoard'?'金币':id.startsWith('distance')||id.startsWith('notrip')||id==='first-500'||id==='marathon'?'距离':'其他';
const visibleObjectives=computed(()=>OBJECTIVES.filter(item=>category.value==='全部'||categoryOf(item.id)===category.value));
const scoreMultiplier = computed(nextRunScoreMultiplier);

function onClaim(id: string): void {
  if (claim(id)) {
    const objective=OBJECTIVES.find(item=>item.id===id);
    notice.value = objective?.coins || objective?.gems ? '奖励已领取' : '目标已确认';
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
      <div class="menu-row objective-filter" role="group" aria-label="目标分类">
        <button v-for="item in categories" :key="item" class="menu-btn" :aria-pressed="category===item" @click="category=item">{{ item }}</button>
      </div>
      <div class="objective-list">
        <div v-for="objective in visibleObjectives" :key="objective.id" class="objective" :class="{ done: objective.done() }">
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

<style scoped>
.objective-filter .menu-btn{min-width:0;min-height:44px;flex:1 1 0}
.objective-filter .menu-btn[aria-pressed="true"]{background:#645031;border-color:#e1be78;color:#fff0c2}
</style>
