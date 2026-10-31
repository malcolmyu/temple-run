<script setup lang="ts">
import { computed, ref } from 'vue';
import { ANGEL_WINGS_PRICE } from '../game/nativeAngelWings';
import { MEGA_START_PRICE } from '../game/megaStart';
import { progress, buyAngelWings, buySkin, equipSkin, isOwned, canAfford } from '../game/progress';
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

function buyWings():void {
 notice.value=buyAngelWings()?'天使之翼已加入库存':'金币不足或库存已满';syncBanks();
}

function megaStart(): void {
  if(getGame()?.startMegaBoost()) {syncBanks();emit('close');}
  else notice.value='金币不足或游戏尚未准备好';
}

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
      <h2 class="title">角色与道具</h2>
      <p class="bank">● {{ progress.coins }} &nbsp; ◆ {{ progress.gems }}</p>

      <button class="primary store-action" :disabled="progress.coins < MEGA_START_PRICE" @click="megaStart"><span>超级起跑 · ● {{ MEGA_START_PRICE }}</span><em>↗</em></button>
      <p class="notice">本次开跑自动转弯并加速。重新开始需再次购买。</p>
      <button class="primary store-action" :disabled="progress.coins < ANGEL_WINGS_PRICE || progress.wings >= 99" @click="buyWings"><span>天使之翼 · ● {{ ANGEL_WINGS_PRICE }}</span><em>×{{ progress.wings }}</em></button>
      <p class="notice">跑动时点击激活，30 秒内保留一次复活机会；冷却 45 秒。</p>
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
