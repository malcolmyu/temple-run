<script setup lang="ts">
import { ref } from 'vue';
import { useModalDialog } from './useModalDialog';
const emit = defineEmits<{ close: [] }>();
const page = ref(0);
const chapters = ['操作与道路', '障碍与失误', '道具与成长'];
const dialog = useModalDialog(()=>emit('close'));
const powerIcon=(kind:string)=>`${import.meta.env.BASE_URL}assets/ui/native-pickup-${kind}.png`;
</script>

<template>
  <section ref="dialog" tabindex="-1" class="overlay soft" role="dialog" aria-modal="true" aria-labelledby="help-title">
    <div class="card help-card">
      <h2 id="help-title" class="title">玩法说明</h2>
      <nav class="help-nav" aria-label="说明分类">
        <button v-for="(chapter,index) in chapters" :key="chapter" :aria-pressed="page===index" @click="page=index">{{ chapter }}</button>
      </nav>
      <div class="help-content" aria-live="polite">
        <template v-if="page===0">
          <h3>先看路，再选动作</h3>
          <dl>
            <dt>左右换道</dt><dd>← → 或左右滑动，每次移动一条道；最外侧继续按不会撞墙。A / D 可持续横移，跳跃和滑铲时也能换道。</dd>
            <dt>路口转弯</dt><dd>接近拐角时，按出口方向，可短暂预备转弯；太早预备会失效。T 路口左右都可选。远离路口时，左右键仍是换道。漏转会失败。</dd>
            <dt>跳跃与滑铲</dt><dd>↑ / 上滑跳跃；↓ / 下滑滑铲。空中不能再次起跳。</dd>
            <dt>断桥与半边路</dt><dd>断桥、长坑要跳过；半边窄路要持续留在有地面的一侧。金币可以放弃，先保住落脚点。</dd>
            <dt>分支与合流</dt><dd>提前选左路或右路，沿支路跑到合流处。奖励较多的路线可能带有额外障碍。</dd>
          </dl>
        </template>
        <template v-else-if="page===1">
          <h3>认清危险，失误后留出恢复时间</h3>
          <dl>
            <dt>高树根、横杆</dt><dd>跳过；有侧边空位时也可绕开。正面撞上会结束本局。</dd>
            <dt>树洞、拱门、木桥横梁</dt><dd>滑铲通过，别用站立姿态撞上低顶。</dd>
            <dt>火塔与低火墙</dt><dd>火塔可跳跃或滑铲；低矮火墙需要跳过，滑铲不能避开火墙。</dd>
            <dt>石墩、低树根</dt><dd>换道绕开或跳过。撞到会绊倒、减速，追逐者会靠近；短时间内再次失误可能被抓。</dd>
            <dt>窄墙与缺路</dt><dd>沿可通行的一侧通过。不要把长窄路当成一次跳跃就能越过的短坑。</dd>
          </dl>
        </template>
        <template v-else>
          <h3>道具各有用途，收益在结算时入账</h3>
          <dl>
            <dt class="power-name"><img :src="powerIcon('magnet')" alt="" />磁铁</dt><dd>红蓝 U 形图标，吸取附近金币，不吸宝石或其他道具。磁铁本身不提供无敌保护。</dd>
            <dt class="power-name"><img :src="powerIcon('bonus')" alt="" />金币奖励</dt><dd>圆形金币图标，立即增加本局金币。道路上的红、蓝金币也有更高价值。</dd>
            <dt class="power-name"><img :src="powerIcon('shield')" alt="" />护盾 / 无敌</dt><dd>条带人形图标。可穿过障碍、跨过缺路，但仍需手动在路口转弯。到期前回到有地面的安全侧，留意倒计时和闪烁。</dd>
            <dt class="power-name"><img :src="powerIcon('boost')" alt="" />加速</dt><dd>橙色跑者图标，自动转弯并保护角色。“减速”倒计时结束后，恢复手动避障和转弯。</dd>
            <dt>天使之翼与宝石</dt><dd>天使之翼需在跑动中激活，有效时保留一次自动复活机会；永久翼在本局首次死亡后用尽。结算页也可花宝石复活，每局限一次。</dd>
            <dt>商店与升级</dt><dd>最终结算后金币、宝石入账。商店买到的是库存，起跑道具需开跑后点击使用；道具升级在下一局生效。未解锁的道具不会自然出现。</dd>
          </dl>
        </template>
      </div>
      <button class="primary" @click="emit('close')">返回</button>
    </div>
  </section>
</template>

<style scoped>
.help-card { text-align:left; }
.help-card .title { font-size:28px; margin-top:0; }
.help-nav { display:flex; gap:6px; margin-bottom:16px; }
.help-nav button { flex:1; min-height:44px; padding:6px 4px; border:1px solid #c9b98766; border-radius:8px; background:#1b2a21; color:#e9d6a3; font:inherit; font-size:12px; cursor:pointer; }
.help-nav button[aria-pressed="true"] { background:#e3b85d; color:#322515; border-color:#e3b85d; font-weight:700; }
.help-nav button:focus-visible { outline:2px solid #ffe9b0; outline-offset:2px; }
.help-content { color:#e5dbc2; font-size:13px; line-height:1.65; }
.help-content h3 { font-size:15px; color:#ffe9b0; margin:0 0 14px; }
.help-content dl { margin:0 0 18px; }
.help-content dt { color:#f5ce71; font-weight:700; margin-top:12px; }
.help-content dd { margin:3px 0 0; }
.power-name { display:flex; align-items:center; gap:6px; }
.power-name img { width:28px; height:28px; object-fit:contain; }
</style>
