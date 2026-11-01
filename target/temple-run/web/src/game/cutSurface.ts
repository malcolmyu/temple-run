import * as THREE from 'three';

/** Cut an open longitudinal interval out of a static surface, retaining interpolated UVs. */
export function cutSurfaceGeometry(geometry: THREE.BufferGeometry, from: number, to: number, axis: 'x' | 'z' = 'z', span?: readonly [number, number]): THREE.BufferGeometry {
  const source = geometry.index ? geometry.toNonIndexed() : geometry;
  const names = Object.keys(source.attributes);
  const sizes = names.map(name => source.getAttribute(name).itemSize);
  const position = names.indexOf('position');
  const offsets = sizes.map((_, i) => sizes.slice(0, i).reduce((a, b) => a + b, 0));
  const z = offsets[position] + (axis === 'x' ? 0 : 2);
  const output = names.map(() => [] as number[]);
  type Vertex = number[];
  const clip = (vertices: Vertex[], edge: number, below: boolean, coordinate = z): Vertex[] => {
    const result: Vertex[] = [];
    for (let i = 0; i < vertices.length; i++) {
      const a = vertices[i], b = vertices[(i + 1) % vertices.length];
      const insideA = below ? a[coordinate] <= edge : a[coordinate] >= edge;
      const insideB = below ? b[coordinate] <= edge : b[coordinate] >= edge;
      if (insideA) result.push(a);
      if (insideA !== insideB) {
        const t = (edge - a[coordinate]) / (b[coordinate] - a[coordinate]);
        result.push(a.map((value, j) => value + (b[j] - value) * t));
      }
    }
    return result;
  };
  for (let i = 0; i < source.getAttribute('position').count; i += 3) {
    const triangle = [0, 1, 2].map(j => names.flatMap((name, k) => {
      const attribute = source.getAttribute(name);
      return Array.from({length: sizes[k]}, (_, c) => attribute.array[(i + j) * sizes[k] + c]);
    }));
    const longitudinal = offsets[position] + 2;
    const middle = span ? clip(clip(triangle, span[0], false, longitudinal), span[1], true, longitudinal) : triangle;
    const polygons = [clip(middle, from, true), clip(middle, to, false)];
    if (span) polygons.push(clip(triangle, span[0], true, longitudinal), clip(triangle, span[1], false, longitudinal));
    for (const polygon of polygons) {
      for (let j = 1; j < polygon.length - 1; j++) {
        for (const vertex of [polygon[0], polygon[j], polygon[j + 1]]) {
          names.forEach((_, k) => output[k].push(...vertex.slice(offsets[k], offsets[k] + sizes[k])));
        }
      }
    }
  }
  const result = new THREE.BufferGeometry();
  names.forEach((name, i) => result.setAttribute(name, new THREE.Float32BufferAttribute(output[i], sizes[i])));
  result.computeBoundingBox();
  result.computeBoundingSphere();
  if (source !== geometry) source.dispose();
  return result;
}
