<script setup lang="ts">
import { computed } from 'vue';
const props = defineProps<{ value: number; label: string; height?: number }>();
const digits = computed(() => String(Number.isFinite(props.value)
  ? Math.min(Number.MAX_SAFE_INTEGER, Math.max(0, Math.floor(props.value))) : 0));
const digitHeight = computed(() => Math.min(props.height ?? 22, 180 / digits.value.length));
const asset = (digit: string): string => `${import.meta.env.BASE_URL}assets/ui/score-${digit}.png`;
</script>

<template>
  <span class="sprite-number" role="img" :aria-label="`${label} ${digits}`" :style="{ '--digit-height': `${digitHeight}px` }">
    <img v-for="(digit, index) in digits" :key="index" :src="asset(digit)" alt="" draggable="false" />
  </span>
</template>

<style scoped>
.sprite-number { display: inline-flex; align-items: center; justify-content: flex-end; gap: 1px; white-space: nowrap; vertical-align: middle; }
.sprite-number img { display: block; height: var(--digit-height); width: auto; max-width: none; flex: 0 0 auto; }
</style>
