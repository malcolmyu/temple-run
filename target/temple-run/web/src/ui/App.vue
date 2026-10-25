<script setup lang="ts">
import { onBeforeUnmount, onMounted, ref, shallowRef } from 'vue';
import { bootGame, getGame } from '../game/boot';
import { mutableUi as ui } from '../game/state';
import { progress } from '../game/progress';
import Hud from './Hud.vue';
import MenuOverlay from './MenuOverlay.vue';
import PauseOverlay from './PauseOverlay.vue';
import GameOverOverlay from './GameOverOverlay.vue';
import StoreOverlay from './StoreOverlay.vue';
import SettingsOverlay from './SettingsOverlay.vue';
import StatsOverlay from './StatsOverlay.vue';
import ObjectivesOverlay from './ObjectivesOverlay.vue';
import UpgradesOverlay from './UpgradesOverlay.vue';

const canvas = ref<HTMLCanvasElement | null>(null);
const loading = shallowRef(true);
const error = shallowRef<string | null>(null);
const showStore = shallowRef(false);
const showSettings = shallowRef(false);
const showStats = shallowRef(false);
const showObjectives = shallowRef(false);
const showUpgrades = shallowRef(false);

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
</script>

<template>
  <div class="app">
    <div class="frame">
      <canvas ref="canvas" class="scene" aria-label="3D 神庙逃亡" />
      <div class="shade" />
      <Hud @pause="getGame()?.togglePause()" />

      <MenuOverlay
        v-if="ui.phase === 'menu'"
        :ready="ui.ready"
        @start="getGame()?.start()"
        @store="showStore = true"
        @stats="showStats = true"
        @objectives="showObjectives = true"
        @upgrades="showUpgrades = true"
        @settings="showSettings = true"
      />

      <PauseOverlay
        v-if="ui.phase === 'paused'"
        @resume="getGame()?.resume()"
        @restart="getGame()?.restart()"
        @menu="getGame()?.toMenu()"
        @settings="showSettings = true"
      />

      <GameOverOverlay
        v-if="ui.phase === 'ended'"
        :distance="ui.distance"
        :score="ui.score"
        :coins="ui.coins"
        :gems="ui.gems"
        :best="ui.best"
        :reason="ui.deathReason"
        :kind="ui.deathKind"
        :revive-available="ui.reviveAvailable"
        :revive-cost="ui.reviveCost"
        @restart="getGame()?.restart()"
        @menu="getGame()?.toMenu()"
        @store="showStore = true"
        @revive="getGame()?.revive()"
      />

      <StoreOverlay v-if="showStore" @close="showStore = false" />
      <StatsOverlay v-if="showStats" @close="showStats = false" />
      <ObjectivesOverlay v-if="showObjectives" @close="showObjectives = false" />
      <UpgradesOverlay v-if="showUpgrades" @close="showUpgrades = false" />
      <SettingsOverlay v-if="showSettings" @close="showSettings = false" />

      <div v-if="loading" class="loading">
        <div class="loading-card">
          <strong>正在点亮火把…</strong>
          <span>加载原版素材与角色骨骼</span>
        </div>
      </div>
      <div class="rotate-hint" aria-hidden="true">
        <div class="rotate-card"><span>⟳</span><strong>请竖屏游玩</strong><small>ROTATE YOUR DEVICE</small></div>
      </div>
      <div v-if="error" class="loading">
        <div class="loading-card error"><strong>启动失败</strong><span>{{ error }}</span></div>
      </div>
    </div>
    <aside class="side">
      <p class="eyebrow">A LOST RELIC AWAITS</p>
      <h1>一直向前，<br /><em>直到世界尽头。</em></h1>
      <p class="lead">三条石径，瞬息变化的障碍，和藏在密林深处的古老遗迹。新版由 TypeScript + ECS 驱动玩法、Vue 3 渲染界面。</p>
      <div class="stats-line">
        <div><span>最远</span><strong>{{ progress.bestDistance }} m</strong></div>
        <div><span>金币 / 宝石</span><strong>{{ progress.coins }} / {{ progress.gems }}</strong></div>
        <div><span>帧率</span><strong>{{ ui.fps }} fps</strong></div>
      </div>
      <p class="edition">TYPESCRIPT · ECS · VUE 3 · THREE.JS</p>
    </aside>
  </div>
</template>
