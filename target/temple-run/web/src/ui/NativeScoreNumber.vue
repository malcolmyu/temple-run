<script setup lang="ts">
import { computed } from 'vue';
import font from '../game/nativeScoreFont.json';

const props = defineProps<{ value: number }>();
const digits = computed(() => String(Number.isFinite(props.value)
  ? Math.min(Number.MAX_SAFE_INTEGER, Math.max(0, Math.floor(props.value))) : 0));
const scale = computed(() => Math.min(0.5, 180 / (digits.value.length * 36)));
const glyph = (digit: string) => font.glyphs[digit as keyof typeof font.glyphs];
const asset = (digit: string) => `${import.meta.env.BASE_URL}assets/ui/score-arty-${digit}.png`;
</script>

<template>
  <span class="native-score-number" role="img" :aria-label="`分数 ${digits}`"
    :style="{ width: `${digits.length * 36 * scale}px`, height: `${font.lineHeight * scale}px` }">
    <img v-for="(digit, index) in digits" :key="index" :src="asset(digit)" alt="" draggable="false"
      :style="{ left: `${(index * 36 + glyph(digit).xOffset) * scale}px`, top: `${glyph(digit).yOffset * scale}px`, width: `${glyph(digit).width * scale}px`, height: `${glyph(digit).height * scale}px` }" />
  </span>
</template>

<style scoped>
.native-score-number { position: relative; display: inline-block; flex: 0 0 auto; vertical-align: middle; }
.native-score-number img { position: absolute; display: block; max-width: none; }
</style>
