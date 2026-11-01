/** Character catalogue shared by the game and the Vue store. */
export interface SkinDef {
  id: string;
  name: string;
  sub: string;
  rig: string;
  texture: string;
  avatar: string;
  price: number;
  currency: 'coins' | 'gems';
  speed: number;
}

// Rigs/textures are exported game assets. Prices/currencies and challenge-mode
// speed modifiers are web economy assumptions, not recovered native shop rules.
export const SKINS: SkinDef[] = [
  { id: 'jhony', name: 'Jhony', sub: '默认跑者', rig: 'orig_02___Default', texture: 'tex-orig_02___Default.png', avatar: 'avatar-jhony.png', price: 0, currency: 'coins', speed: 1 },
  { id: 'selene', name: 'Selene', sub: '宇航员', rig: 'selene_astronaut', texture: 'tex-selene_astronaut.png', avatar: 'avatar-selene.png', price: 300, currency: 'coins', speed: 1.04 },
  { id: 'scarlett', name: 'Scarlett', sub: '女探险家', rig: 'girl_Export1-01_-_Default', texture: 'tex-girl_Export1-01_-_Default.png', avatar: 'avatar-scarlett.png', price: 400, currency: 'coins', speed: 1.09 },
  { id: 'werewolf', name: '万圣狼人', sub: '万圣节限定', rig: 'werewolf', texture: 'tex-Halloween_Werewolf.png', avatar: 'avatar-werewolf.png', price: 500, currency: 'coins', speed: 0.8 },
  { id: 'barry', name: 'Barry Bones', sub: '老练跑者', rig: 'indi_Export1-01_-_Default', texture: 'tex-indi_Export1-01_-_Default.png', avatar: 'avatar-barry.png', price: 600, currency: 'coins', speed: 0.9 },
  { id: 'karma', name: 'Karma Lee', sub: '敏捷盗贼', rig: 'china_Export1-01_-_Default', texture: 'tex-china_Export1-01_-_Default.png', avatar: 'avatar-karma.png', price: 700, currency: 'coins', speed: 1.02 },
  { id: 'conquistador', name: '征服者', sub: '西班牙探险家', rig: 'conquis_Export1-09_-_Default', texture: 'tex-conquis_Export1-09_-_Default.png', avatar: 'avatar-conquistador.png', price: 1000, currency: 'coins', speed: 0.95 },
  { id: 'ghost', name: '血鬼', sub: '暗影皮肤 · 宝石限定', rig: 'xixuegui', texture: 'tex-xixuegui.png', avatar: 'avatar-ghost.png', price: 2, currency: 'gems', speed: 0.93 },
  { id: 'skeleton', name: '稻草人', sub: '万圣节限定 · 宝石限定', rig: 'Scarecrow_mesh', texture: 'tex-Scarecrow_Export01_-_Default.png', avatar: 'avatar-skeleton.png', price: 3, currency: 'gems', speed: 0.87 },
];

export const skinById = (id: string): SkinDef => SKINS.find((skin) => skin.id === id) ?? SKINS[0];
export const DEFAULT_SKIN = SKINS[0];
export const DEFAULT_RIG_URL = `${import.meta.env.BASE_URL}assets/characters/rig-orig_02___Default.json`;
