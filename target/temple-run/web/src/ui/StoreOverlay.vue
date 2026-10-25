<script setup lang="ts">
import { computed } from 'vue';
import { mutableUi as ui } from '../game/state';

const props = defineProps<{ skin: string }>();
const emit = defineEmits<{ close: []; select: [id: string] }>();

const BASE = import.meta.env.BASE_URL;
const skins = [
  { id: 'jhony', name: 'Jhony', sub: '默认跑者', avatar: 'avatar-jhony.png' },
  { id: 'scarlett', name: 'Scarlett', sub: '女探险家', avatar: 'avatar-scarlett.png' },
  { id: 'selene', name: 'Selene', sub: '宇航员', avatar: 'avatar-selene.png' },
  { id: 'werewolf', name: '万圣狼人', sub: '万圣节限定', avatar: 'avatar-werewolf.png' },
  { id: 'ghost', name: '血鬼', sub: '暗影皮肤', avatar: 'avatar-ghost.png' },
  { id: 'skeleton', name: '稻草人', sub: '万圣节限定', avatar: 'avatar-skeleton.png' },
];

const current = computed(() => props.skin);
const avatarUrl = (name: string): string => `${BASE}assets/ui/${name}`;

function select(id: string): void {
  emit('select', id);
}
</script>

<template>
  <section class="overlay soft" @click.self="emit('close')">
    <div class="card store-card">
      <p class="kicker">STORE</p>
      <h2 class="title">角色</h2>
      <p class="lead">切换后立即换装，跑步动画由 ECS 驱动的骨骼重定向生成。</p>
      <div class="skin-grid">
        <button v-for="skin in skins" :key="skin.id" class="skin" :class="{ active: current === skin.id }" @click="select(skin.id)">
          <img :src="avatarUrl(skin.avatar)" :alt="skin.name" />
          <span class="skin-name">{{ skin.name }}</span>
          <small>{{ skin.sub }}</small>
          <em v-if="current === skin.id">已装备</em>
        </button>
      </div>
      <p class="menu-stats">金币 {{ ui.totalCoins }} · 宝石 {{ ui.gems }}</p>
      <button class="primary" @click="emit('close')"><span>返回</span><em>↗</em></button>
    </div>
  </section>
</template>
