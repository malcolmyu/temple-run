<script setup lang="ts">
import { onBeforeUnmount, onMounted, ref, shallowRef } from 'vue';
import { bootGame } from '../game/boot';
import { mutableUi as ui } from '../game/state';
import { getGame } from '../game/boot';
import Hud from './Hud.vue';
import MenuOverlay from './MenuOverlay.vue';
import PauseOverlay from './PauseOverlay.vue';
import GameOverOverlay from './GameOverOverlay.vue';
import StoreOverlay from './StoreOverlay.vue';
import SettingsOverlay from './SettingsOverlay.vue';

const canvas = ref<HTMLCanvasElement | null>(null);
const loading = shallowRef(true);
const error = shallowRef<string | null>(null);
const showStore = shallowRef(false);
const showSettings = shallowRef(false);

onMounted(async () => {
  if (!canvas.value) return;
  try {
    await bootGame(canvas.value);
  } catch (err) {
    error.value = String(err);
    console.error(err);
  } finally {
    loading.value = false;
  }
});

onBeforeUnmount(() => {
  getGame()?.dispose();
});

function openStore(): void {
  showStore.value = true;
}
function closeStore(): void {
  showStore.value = false;
}
function openSettings(): void {
  showSettings.value = true;
}
function closeSettings(): void {
  showSettings.value = false;
}
</script>

<template>
  <div class="app">
    <div class="frame">
      <canvas ref="canvas" class="scene" aria-label="3D 神庙逃亡" />
      <div class="shade" />
      <Hud :disabled="ui.phase !== 'playing'" @pause="getGame()?.togglePause()" />

      <MenuOverlay
        v-if="ui.phase === 'menu'"
        :ready="ui.ready"
        :best="ui.best"
        :coins="ui.totalCoins"
        @start="getGame()?.start()"
        @store="openStore"
        @settings="openSettings"
      />

      <PauseOverlay
        v-if="ui.phase === 'paused'"
        @resume="getGame()?.resume()"
        @restart="getGame()?.restart()"
        @menu="getGame()?.toMenu()"
        @settings="openSettings"
      />

      <GameOverOverlay
        v-if="ui.phase === 'ended'"
        :distance="ui.distance"
        :coins="ui.coins"
        :gems="ui.gems"
        :best="ui.best"
        :reason="ui.deathReason"
        @restart="getGame()?.restart()"
        @menu="getGame()?.toMenu()"
        @store="openStore"
      />

      <StoreOverlay
        v-if="showStore"
        :skin="ui.skin"
        @close="closeStore"
        @select="(id: string) => getGame()?.setSkin(id)"
      />

      <SettingsOverlay v-if="showSettings" @close="closeSettings" />

      <div v-if="loading" class="loading">
        <div class="loading-card">
          <strong>正在点亮火把…</strong>
          <span>加载原版素材与角色骨骼</span>
        </div>
      </div>
      <div v-if="error" class="loading">
        <div class="loading-card error"><strong>启动失败</strong><span>{{ error }}</span></div>
      </div>
    </div>
    <aside class="side">
      <p class="eyebrow">A LOST RELIC AWAITS</p>
      <h1>一直向前，<br /><em>直到世界尽头。</em></h1>
      <p class="lead">三条石径，瞬息变化的障碍，和藏在密林深处的古老遗迹。新版使用 TypeScript + ECS 架构驱动，界面由 Vue 渲染。</p>
      <div class="stats-line">
        <div><span>最远</span><strong>{{ ui.best }} m</strong></div>
        <div><span>累计金币</span><strong>{{ ui.totalCoins }}</strong></div>
        <div><span>帧率</span><strong>{{ ui.fps }} fps</strong></div>
      </div>
      <p class="edition">TYPESCRIPT · ECS · VUE 3 · THREE.JS</p>
    </aside>
  </div>
</template>
