declare module 'three/addons/loaders/OBJLoader.js' {
  import type { Group } from 'three';
  export class OBJLoader {
    load(url: string, onLoad: (object: Group) => void, onProgress?: (event: ProgressEvent) => void, onError?: (error: unknown) => void): void;
    parse(text: string): Group;
  }
}
