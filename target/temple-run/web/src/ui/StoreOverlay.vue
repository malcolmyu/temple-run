<script setup lang="ts">
import { ref } from 'vue';
import { progress, buySkin, equipSkin, isOwned, canAfford } from '../game/progress';
import { SKINS } from '../game/skins';
import { getGame } from '../game/boot';
import { mutableUi as ui } from '../game/state';

const emit = defineEmits<{ close: [] }>();
const BASE = import.meta.env.BASE_URL;
const notice = ref('');

function priceLabel(id: string): string {
  const skin = SKINS.find((s) => s.id === id)!;
  return skin.currency === 'gems' ? `◆ ${skin.price}` : `● ${skin.price}`;
}

function select(id: string): void {
  if (isOwned(id)) {
    equipSkin(id);
    void getGame()?.setSkin(id);
    notice.value = '已装备';
    return;
  }
  if (!canAfford(id)) {
    notice.value = '货币不足';
    return;
  }
  if (buySkin(id)) {
    void getGame()?.setSkin(id);
    notice.value = '解锁成功';
    ui.totalCoins = progress.coins;
    ui.bankCoins = progress.coins;
    ui.bankGems = progress.gems;
  }
}
</script>

<template>
  <section class="overlay soft" @click.self="emit('close')">
    <div class="card store-card">
      <p class="kicker">STORE</p>
      <h2 class="title">角色</h2>
      <p class="bank">● {{ progress.coins }} &nbsp; ◆ {{ progress.gems }}</p>
      <div class="skin-grid">
        <button v-for="skin in SKINS" :key="skin.id" class="skin" :class="{ active: progress.equipped === skin.id, locked: !isOwned(skin.id) }" @click="select(skin.id)">
          <img :src="`${BASE}assets/ui/${skin.avatar}`" :alt="skin.name" />
          <span class="skin-name">{{ skin.name }}</span>
          <small>{{ skin.sub }}</small>
          <em v-if="progress.equipped === skin.id">已装备</em>
          <em v-else-if="isOwned(skin.id)">已拥有</em>
          <em v-else class="price">{{ priceLabel(skin.id) }}</em>
        </button>
      </div>
      <p v-if="notice" class="notice">{{ notice }}</p>
      <button class="primary" @click="emit('close')"><span>返回</span><em>↗</em></button>
    </div>
  </section>
</template>
