/** Native straight region:raw half-width6.5,ground15,world scale.2.
 * Mesh templates are relative to their support plane;world groups add native3m. */
export const NATIVE_CLIFF_HALF_WIDTH=1.3;
export const NATIVE_CLIFF_GROUND_HEIGHT=3;
export const CLIFF_MESH_Y=-NATIVE_CLIFF_GROUND_HEIGHT;
export const nativeCliffSupported=(side:number):boolean=>Math.abs(side)<=NATIVE_CLIFF_HALF_WIDTH+1e-5;
