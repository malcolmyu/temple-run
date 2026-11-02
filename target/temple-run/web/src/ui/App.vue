<script setup lang="ts">
import { defineAsyncComponent, onBeforeUnmount, onMounted, ref, shallowRef, watch } from 'vue';
import { bootGame, getGame } from '../game/boot';
import { mutableUi as ui } from '../game/state';
import Hud from './Hud.vue';
import MenuOverlay from './MenuOverlay.vue';
import PauseOverlay from './PauseOverlay.vue';
import GameOverOverlay from './GameOverOverlay.vue';
const StoreOverlay=defineAsyncComponent(()=>import('./StoreOverlay.vue'));
import SettingsOverlay from './SettingsOverlay.vue';
const StatsOverlay=defineAsyncComponent(()=>import('./StatsOverlay.vue'));
const ObjectivesOverlay=defineAsyncComponent(()=>import('./ObjectivesOverlay.vue'));
const UpgradesOverlay=defineAsyncComponent(()=>import('./UpgradesOverlay.vue'));
const HelpOverlay=defineAsyncComponent(()=>import('./HelpOverlay.vue'));
import TutorialOverlay from './TutorialOverlay.vue';

const canvas = ref<HTMLCanvasElement | null>(null);
const loading = shallowRef(true);
const error = shallowRef<string | null>(null);
const showStore = shallowRef(false);
const showSettings = shallowRef(false);
const showStats = shallowRef(false);
const showObjectives = shallowRef(false);
const showUpgrades = shallowRef(false);
const showTutorial = shallowRef(false);
const showHelp = shallowRef(false);

watch([showStore,showSettings,showStats,showObjectives,showUpgrades,showTutorial,showHelp,loading,error],
  () => getGame()?.setModalInputBlocked(showStore.value||showSettings.value||showStats.value||showObjectives.value||showUpgrades.value||showTutorial.value||showHelp.value||loading.value||!!error.value),
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
    if(!error.value)performance.mark('temple-ready');
  }
});

onBeforeUnmount(() => {
  getGame()?.dispose();
});

/** First run shows the swipe/keyboard primer, like the original's "You're ready" screen. */
function startRun(): void {
  // A lazy panel may still be downloading; its modal input block applies immediately.
  if(showStore.value||showSettings.value||showStats.value||showObjectives.value||showUpgrades.value||showTutorial.value||showHelp.value||loading.value||error.value)return;
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
      <Hud v-if="ui.ready && ui.phase!=='menu'" @pause="getGame()?.togglePause()" />

      <MenuOverlay
        v-if="ui.phase === 'menu'"
        :ready="ui.ready"
        @start="startRun"
        @store="showStore = true"
        @stats="showStats = true"
        @objectives="showObjectives = true"
        @upgrades="showUpgrades = true"
        @settings="showSettings = true"
        @help="showHelp = true"
      />

      <PauseOverlay
        v-if="ui.phase === 'paused'"
        @resume="getGame()?.resume()"
        @restart="getGame()?.restart()"
        @menu="getGame()?.toMenu()"
        @settings="showSettings = true"
        @help="showHelp = true"
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
        :skin="ui.skin"
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
      <HelpOverlay v-if="showHelp" @close="showHelp = false" />

      <TutorialOverlay v-if="showTutorial" @start="dismissTutorial" @close="showTutorial = false" />

      <div v-if="loading" class="startup-progress" role="status">
        <div class="loading-card">
          <strong>正在准备可玩道路…</strong>
          <span>菜单已可浏览；先准备道路与操作，角色和装饰稍后加载。</span>
        </div>
      </div>
      <p v-if="ui.quickStart && ui.phase==='playing'" class="detail-progress" role="status">{{ ui.detailStatus==='ready'?'高清场景已准备，下局启用':ui.detailStatus==='error'?'高清资源暂不可用，快速模式可继续':'快速模式 · 高清场景将在后台加载' }}</p>
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

<style scoped>
.detail-progress{position:absolute;left:12px;bottom:6px;z-index:4;max-width:75%;font:10px system-ui;color:#f4dfa1;background:#173529bb;padding:3px 6px;pointer-events:none}
.startup-progress{position:absolute;bottom:10px;left:16px;right:16px;z-index:6;padding:10px;background:#173529ed;pointer-events:none}.startup-progress .loading-card{font-size:11px}
</style>
