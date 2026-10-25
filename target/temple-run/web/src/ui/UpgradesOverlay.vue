<script setup lang="ts">
import { ref } from 'vue';
import { UPGRADES, levelOf, nextCost, purchase } from '../game/upgrades';
import { progress } from '../game/progress';
import { syncBanks } from '../game/state';

const emit = defineEmits<{ close: [] }>();
const notice = ref('');

function buy(id: string): void {
  if (purchase(id)) {
    notice.value = '升级成功';
    syncBanks();
  } else {
    notice.value = '金币不足或已满级';
  }
  void progress;
}
</script>

<template>
  <section class="overlay soft" @click.self="emit('close')">
    <div class="card">
      <p class="kicker">UPGRADES</p>
      <h2 class="title">升级</h2>
      <p class="bank">● {{ progress.coins }}</p>
      <div class="objective-list">
        <div v-for="upgrade in UPGRADES" :key="upgrade.id" class="objective">
          <div class="objective-head">
            <strong>{{ upgrade.name }}</strong>
            <span>Lv.{{ levelOf(upgrade.id) }} / {{ upgrade.costs.length }}</span>
          </div>
          <small>{{ upgrade.sub }}</small>
          <button v-if="nextCost(upgrade.id) !== null" class="mini" @click="buy(upgrade.id)">升级 · ● {{ nextCost(upgrade.id) }}</button>
          <span v-else class="notice">已满级</span>
        </div>
      </div>
      <p v-if="notice" class="notice">{{ notice }}</p>
      <button class="primary" @click="emit('close')"><span>返回</span><em>↗</em></button>
    </div>
  </section>
</template>
