<script setup lang="ts">
import { onBeforeUnmount, onMounted, ref, shallowRef, watch } from 'vue';
import { bootGame, getGame } from '../game/boot';
import { mutableUi as ui } from '../game/state';
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
const showTutorial = shallowRef(false);

watch([showStore,showSettings,showStats,showObjectives,showUpgrades,showTutorial,loading,error],
  () => getGame()?.setModalInputBlocked(showStore.value||showSettings.value||showStats.value||showObjectives.value||showUpgrades.value||showTutorial.value||loading.value||!!error.value),
  {flush:'sync'});

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

/** First run shows the swipe/keyboard primer, like the original's "You're ready" screen. */
function startRun(): void {
  if (!localStorage.getItem('temple.v2.tutorial')) {
    showTutorial.value = true;
    return;
  }
  getGame()?.start();
}

function retryStartup(): void {
  window.location.reload();
}

function openResultStore(): void {
  const game=getGame();
  if(!game)return;
  game.toMenu(); // Finalize exactly once before exposing spendable rewards.
  showStore.value=true;
}

function dismissTutorial(): void {
  localStorage.setItem('temple.v2.tutorial', '1');
  showTutorial.value = false;
  getGame()?.start();
}
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
        @start="startRun"
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
        :multiplier="ui.scoreMultiplier"
        :reason="ui.deathReason"
        :kind="ui.deathKind"
        :cause="ui.deathCause"
        :revive-available="ui.reviveAvailable"
        :revive-cost="ui.reviveCost"
        @restart="getGame()?.restart()"
        @menu="getGame()?.toMenu()"
        @store="openResultStore"
        @revive="getGame()?.revive()"
      />

      <StoreOverlay v-if="showStore" @close="showStore = false" />
      <StatsOverlay v-if="showStats" @close="showStats = false" />
      <ObjectivesOverlay v-if="showObjectives" @close="showObjectives = false" />
      <UpgradesOverlay v-if="showUpgrades" @close="showUpgrades = false" />
      <SettingsOverlay v-if="showSettings" @close="showSettings = false" />

      <section v-if="showTutorial" class="overlay tutorial-overlay">
        <div class="card tutorial-card">
          <p class="kicker">YOU'RE READY</p>
          <h2 class="title">准备出发</h2>
          <div class="tutorial-grid">
            <div><span>← →</span><small>换道 / 路口转弯</small></div>
            <div><span>↑</span><small>跳跃</small></div>
            <div><span>↓</span><small>滑铲</small></div>
          </div>
          <p class="lead">手机可用滑动操作：左右滑动换道或在路口转弯，上滑跳跃，下滑滑铲。</p>
          <button class="primary" @click="dismissTutorial"><span>开始奔跑</span><em>↗</em></button>
        </div>
      </section>

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
        <div class="loading-card error" role="alert">
          <strong>启动失败</strong>
          <span>资源未能加载，请检查网络后重试。</span>
          <span>重试会重新加载游戏，已保存的进度会保留。</span>
          <button class="primary" @click="retryStartup"><span>重新加载</span><em>↻</em></button>
        </div>
      </div>
    </div>

  </div>
</template>
