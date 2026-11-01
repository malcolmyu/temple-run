<script setup lang="ts">
import { ref } from 'vue';
import { getGame } from '../game/boot';
import { RunDiagnostics } from '../game/runDiagnostics';
const notice=ref('');
defineProps<{compact?:boolean}>();
function download():void {
 const deaths=getGame()?.diagnostics()??new RunDiagnostics().read();
 if(!deaths.length){notice.value='还没有死亡日志；下一次失败会自动保存。';return;}
 const blob=new Blob([JSON.stringify({schema:1,exportedAt:new Date().toISOString(),deaths},null,2)],{type:'application/json'});
 const url=URL.createObjectURL(blob),a=document.createElement('a');a.href=url;a.download='temple-run-diagnostics.json';a.click();setTimeout(()=>URL.revokeObjectURL(url),1000);
 notice.value=`已导出最近 ${deaths.length} 次死亡日志`;
}
</script>
<template><div class="diagnostics-export" :class="{compact}"><button class="mini" title="默认本机记录最近3次死亡；回菜单或刷新后仍保留" @click="download">导出试玩日志</button><small>自动保存在本机，保留最近3次死亡；重开、回菜单和刷新后可导出。</small><p v-if="notice" role="status">{{ notice }}</p></div></template>
<style scoped>.diagnostics-export{margin:12px 0;text-align:center}.diagnostics-export small{display:block;margin-top:7px;font-size:11px;line-height:1.5;color:#c8bd9f}.diagnostics-export p{font-size:12px;color:#f3dc9a}.diagnostics-export.compact{margin:6px 0}.compact small{display:none}.compact p{margin:5px 0}</style>
