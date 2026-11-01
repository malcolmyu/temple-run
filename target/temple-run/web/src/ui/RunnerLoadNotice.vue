<script setup lang="ts">
import { mutableUi as ui } from '../game/state';
import { getGame } from '../game/boot';
import { progress } from '../game/progress';
</script>

<template>
  <div v-if="ui.ready && ui.runnerLoadStatus!=='ready'" class="runner-load-notice" role="status">
    <p>{{ ui.runnerLoadStatus==='loading' ? '角色加载中…' : '角色素材加载失败，暂用替身。已购角色仍会保留。' }}</p>
    <button v-if="ui.runnerLoadStatus==='error'" class="menu-btn" @click="getGame()?.setSkin(progress.equipped)">重新加载角色</button>
  </div>
</template>

<style scoped>
.runner-load-notice { margin:12px 0; color:#f5d99e; font-size:12px; line-height:1.6; }
.runner-load-notice p { margin:0 0 6px; }
.runner-load-notice button { min-height:44px; }
</style>
