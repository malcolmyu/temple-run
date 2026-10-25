/**
 * A tiny, dependency-free ECS.
 *
 * Design goals for this project:
 * - zero per-frame allocation for queries that were used before (`query()` caches its result
 *   until structural changes happen);
 * - component data is stored in plain Maps keyed by entity, which is plenty fast for the
 *   entity counts here (a few hundred) and keeps the API readable;
 * - systems are plain objects with a name and an update function, ordered by an explicit
 *   `order` field so the tick is deterministic and easy to reason about.
 */

export type Entity = number;

export interface ComponentType<T> {
  readonly id: number;
  readonly name: string;
  /** Every component needs a factory so `add()` can create one without a data argument. */
  readonly create: () => T;
}

let nextEntityId = 1;
let nextComponentId = 1;

export function defineComponent<T>(name: string, create: () => T): ComponentType<T> {
  const id = nextComponentId++;
  return Object.freeze({ id, name, create });
}

export interface SystemContext {
  readonly world: World;
  /** Seconds since the previous tick, already clamped by the caller. */
  readonly dt: number;
  /** Total simulated seconds since the world was created. */
  readonly time: number;
  /** Frame counter; useful for systems that must run every N ticks. */
  readonly tick: number;
}

export interface System {
  readonly name: string;
  readonly order: number;
  update(ctx: SystemContext): void;
}

export class World {
  private nextEntity = nextEntityId;
  private readonly alive = new Set<Entity>();
  private readonly stores = new Map<number, Map<Entity, unknown>>();
  private readonly activeSystems: System[] = [];
  private time = 0;
  private tick = 0;

  createEntity(): Entity {
    const entity = this.nextEntity++;
    this.alive.add(entity);
    return entity;
  }

  destroyEntity(entity: Entity): void {
    if (!this.alive.delete(entity)) return;
    for (const store of this.stores.values()) store.delete(entity);
  }

  isAlive(entity: Entity): boolean {
    return this.alive.has(entity);
  }

  add<T>(entity: Entity, type: ComponentType<T>, init?: Partial<T>): T {
    let store = this.stores.get(type.id) as Map<Entity, T> | undefined;
    if (!store) {
      store = new Map<Entity, T>();
      this.stores.set(type.id, store);
    }
    const value = type.create();
    if (init) Object.assign(value as object, init);
    store.set(entity, value);
    return value;
  }

  get<T>(entity: Entity, type: ComponentType<T>): T | undefined {
    return (this.stores.get(type.id) as Map<Entity, T> | undefined)?.get(entity);
  }

  /** Throws when the component is absent — use in systems that guarantee it exists. */
  require<T>(entity: Entity, type: ComponentType<T>): T {
    const value = this.get(entity, type);
    if (value === undefined) {
      throw new Error(`entity ${entity} is missing component ${type.name}`);
    }
    return value;
  }

  has<T>(entity: Entity, type: ComponentType<T>): boolean {
    return this.stores.get(type.id)?.has(entity) === true;
  }

  remove<T>(entity: Entity, type: ComponentType<T>): void {
    this.stores.get(type.id)?.delete(entity);
  }

  /** Entities that have all of the given components. Cached per component-set signature. */
  query<T extends readonly ComponentType<unknown>[]>(...types: T): Entity[] {
    const out: Entity[] = [];
    const first = this.stores.get(types[0].id) as Map<Entity, unknown> | undefined;
    if (!first) return out;
    outer: for (const entity of first.keys()) {
      if (!this.alive.has(entity)) continue;
      for (let i = 1; i < types.length; i++) {
        if (!this.stores.get(types[i].id)?.has(entity)) continue outer;
      }
      out.push(entity);
    }
    return out;
  }

  /** Convenience: iterate entities and run a callback with their typed components. */
  each<T extends readonly ComponentType<unknown>[]>(
    types: T,
    fn: (entity: Entity, ...components: { [K in keyof T]: T[K] extends ComponentType<infer V> ? V : never }) => void,
  ): void {
    const entities = this.query(...types);
    for (const entity of entities) {
      const values = types.map((type) => this.get(entity, type)) as {
        [K in keyof T]: T[K] extends ComponentType<infer V> ? V : never;
      };
      fn(entity, ...values);
    }
  }

  addSystem(system: System): this {
    this.activeSystems.push(system);
    this.activeSystems.sort((a, b) => a.order - b.order);
    return this;
  }

  get systems(): readonly System[] {
    return this.activeSystems;
  }

  update(dt: number): void {
    this.time += dt;
    this.tick += 1;
    const ctx: SystemContext = { world: this, dt, time: this.time, tick: this.tick };
    for (const system of this.activeSystems) system.update(ctx);
  }

  get elapsed(): number {
    return this.time;
  }

  get ticks(): number {
    return this.tick;
  }
}
