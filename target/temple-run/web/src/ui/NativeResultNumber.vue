<script setup lang="ts">
import { computed } from 'vue';
import font from '../game/nativeResultFont.json';
const BASE=import.meta.env.BASE_URL;
const props=defineProps<{value:number}>();
const text=computed(()=>Math.max(0,Math.min(Number.MAX_SAFE_INTEGER,Math.floor(Number.isFinite(props.value)?props.value:0))).toLocaleString('en-US'));
const layout=computed(()=>{
 let advance=0;
 const glyphs=[...text.value].map(char=>{const glyph=font.glyphs[char as keyof typeof font.glyphs];const left=advance+glyph.xOffset;advance+=glyph.advance;return{...glyph,left};});
 const scale=Math.min(36/43,220/advance);
 return{glyphs,scale,width:advance*scale,height:50*scale};
});
</script>
<template>
 <span class="result-number" role="img" :aria-label="`得分 ${text}`" :style="{width:`${layout.width}px`,height:`${layout.height}px`}">
  <img v-for="(glyph,index) in layout.glyphs" :key="index" :src="`${BASE}assets/ui/${glyph.asset}`" alt="" draggable="false"
   :style="{left:`${glyph.left*layout.scale}px`,top:`${(glyph.yOffset-20)*layout.scale}px`,width:`${glyph.width*layout.scale}px`,height:`${glyph.height*layout.scale}px`}" />
 </span>
</template>
<style scoped>
.result-number{position:relative;display:inline-block;vertical-align:middle;flex-shrink:0}
.result-number img{position:absolute;display:block;max-width:none}
</style>
