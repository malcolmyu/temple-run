<script setup lang="ts">
const emit = defineEmits<{ resume: []; restart: []; menu: []; settings: [] }>();
</script>

<template>
  <section class="overlay soft">
    <div class="card">
      <p class="kicker">PAUSED</p>
      <h2 class="title">暂停</h2>
      <p class="lead">喘口气，火把还在烧。</p>
      <button class="primary" @click="emit('resume')"><span>继续奔跑</span><em>↗</em></button>
      <div class="menu-row">
        <button class="menu-btn" @click="emit('restart')">重新开始</button>
        <button class="menu-btn" @click="emit('settings')">OPTIONS</button>
      </div>
      <button class="ghost-btn" @click="emit('menu')">返回主菜单</button>
    </div>
  </section>
</template>
