<script setup lang="ts">
import { useModalDialog } from './useModalDialog';
import { ref } from 'vue';
import { UPGRADES, levelOf, nextCost, purchase,isPowerUpgrade,upgradeEffect } from '../game/upgrades';
import { progress } from '../game/progress';
import { syncBanks } from '../game/state';

const emit = defineEmits<{ close: [] }>();
const dialog=useModalDialog(()=>emit('close'));
const notice = ref('');

function buy(id: string): void {
  const unlocking=isPowerUpgrade(id)&&levelOf(id)===0;
  if (purchase(id)) {
    notice.value = unlocking?'解锁成功':'升级成功';
    syncBanks();
  } else {
    notice.value = '金币不足或已满级';
  }
  void progress;
}
</script>

<template>
  <section ref="dialog" tabindex="-1" class="overlay soft" role="dialog" aria-modal="true" aria-label="升级" @click.self="emit('close')">
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
          <small v-if="isPowerUpgrade(upgrade.id)">{{ upgradeEffect(upgrade.id) }}<template v-if="nextCost(upgrade.id)!==null"> → {{ upgradeEffect(upgrade.id,levelOf(upgrade.id)+1) }}</template></small>
          <button v-if="nextCost(upgrade.id) !== null" class="mini" @click="buy(upgrade.id)">{{ isPowerUpgrade(upgrade.id)&&levelOf(upgrade.id)===0?'解锁':'升级' }} · ● {{ nextCost(upgrade.id) }}</button>
          <span v-else class="notice">已满级</span>
        </div>
      </div>
      <p v-if="notice" class="notice">{{ notice }}</p>
      <button class="primary" @click="emit('close')"><span>返回</span><em>↗</em></button>
    </div>
  </section>
</template>
