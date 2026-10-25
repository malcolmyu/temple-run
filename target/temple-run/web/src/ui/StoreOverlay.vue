<script setup lang="ts">
import { computed, ref } from 'vue';
import { progress, buySkin, equipSkin, isOwned, canAfford } from '../game/progress';
import { SKINS, skinById } from '../game/skins';
import { getGame } from '../game/boot';
import { syncBanks } from '../game/state';
import StorePreview from './StorePreview.vue';

const emit = defineEmits<{ close: [] }>();
const BASE = import.meta.env.BASE_URL;
const selected = ref(progress.equipped);
const notice = ref('');

const skin = computed(() => skinById(selected.value));
const equipped = computed(() => progress.equipped === selected.value);
const owned = computed(() => isOwned(selected.value));
const afford = computed(() => canAfford(selected.value));
const priceLabel = computed(() => (skin.value.currency === 'gems' ? `◆ ${skin.value.price}` : `● ${skin.value.price}`));

function select(id: string): void {
  selected.value = id;
  notice.value = '';
}

function equip(): void {
  if (!owned.value) return;
  equipSkin(selected.value);
  void getGame()?.setSkin(selected.value);
  notice.value = '已装备';
}

function buy(): void {
  if (owned.value || !afford.value) {
    notice.value = '货币不足';
    return;
  }
  if (buySkin(selected.value)) {
    void getGame()?.setSkin(selected.value);
    syncBanks();
    notice.value = '解锁成功，已装备';
  }
}
</script>

<template>
  <section class="overlay soft" @click.self="emit('close')">
    <div class="card store-card">
      <p class="kicker">STORE</p>
      <h2 class="title">角色</h2>
      <p class="bank">● {{ progress.coins }} &nbsp; ◆ {{ progress.gems }}</p>

      <StorePreview :skin-id="selected" />

      <div class="preview-meta">
        <div>
          <strong>{{ skin.name }}</strong>
          <small>{{ skin.sub }}</small>
        </div>
        <em>{{ owned ? (equipped ? '已装备' : '已拥有') : priceLabel }}</em>
      </div>
      <button class="primary store-action" :disabled="equipped || (!owned && !afford)" @click="owned ? equip() : buy()">
        <span>{{ equipped ? '使用中' : owned ? '装备' : afford ? `解锁 · ${priceLabel}` : '货币不足' }}</span>
        <em>{{ equipped ? '✓' : owned ? '↗' : '🔓' }}</em>
      </button>

      <div class="skin-grid">
        <button
          v-for="item in SKINS"
          :key="item.id"
          class="skin"
          :class="{ active: selected === item.id, locked: !isOwned(item.id) }"
          @click="select(item.id)"
        >
          <img :src="`${BASE}assets/ui/${item.avatar}`" :alt="item.name" />
          <span class="skin-name">{{ item.name }}</span>
          <em v-if="progress.equipped === item.id">装备中</em>
          <em v-else-if="!isOwned(item.id)" class="price">{{ item.currency === 'gems' ? '◆' : '●' }} {{ item.price }}</em>
        </button>
      </div>
      <p v-if="notice" class="notice">{{ notice }}</p>
      <button class="ghost-btn" @click="emit('close')">返回</button>
    </div>
  </section>
</template>
