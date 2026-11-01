/** Native totemFull divides maximum meter level by5 (four fills from level1).
 * Resurrection objectives count actual wing revivals; headstart accepts either type. */
export interface RunUtilitySummary {coinMeterFills:number;wingResurrections:number;headStartUsed:number;}
export const NATIVE_UTILITY_OBJECTIVES = [
 {id:'totemFull',title:'超级奖励',detail:'填充奖励进度条 4x',metric:'bestCoinMeterFills',target:4},
 {id:'resurrection',title:'复活',detail:'在一局游戏中使用一次性道具复活翅膀。',metric:'bestWingResurrections',target:1},
 {id:'resurrection2',title:'两次复活',detail:'在一局游戏中使用复活翅膀。',metric:'bestWingResurrections',target:2},
 {id:'headstart',title:'冲刺',detail:'使用一次冲刺',metric:'headStartUsed',target:1},
] as const;
