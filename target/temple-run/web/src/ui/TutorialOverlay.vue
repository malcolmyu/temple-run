<script setup lang="ts">
import { useModalDialog } from './useModalDialog';
const emit=defineEmits<{ start: []; close: [] }>();
const dialog=useModalDialog(()=>emit('close'));
</script>

<template>
  <section ref="dialog" tabindex="-1" class="overlay tutorial-overlay" role="dialog" aria-modal="true" aria-labelledby="tutorial-title">
    <div class="card tutorial-card">
      <p class="kicker">YOU'RE READY</p>
      <h2 id="tutorial-title" class="title">准备出发</h2>
      <div class="tutorial-grid">
        <div><span>← →</span><small>换道 / 路口转弯</small></div>
        <div><span>↑</span><small>跳跃</small></div>
        <div><span>↓</span><small>滑铲</small></div>
      </div>
      <p class="lead">手机可用滑动操作：左右滑动换道或在路口转弯，上滑跳跃，下滑滑铲。</p>
      <button class="primary" @click="emit('start')"><span>开始奔跑</span><em>↗</em></button>
      <button class="ghost-btn" @click="emit('close')">返回主菜单</button>
    </div>
  </section>
</template>
