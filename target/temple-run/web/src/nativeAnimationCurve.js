// Unweighted Unity scalar keyframes store derivatives per second.
// Tangent-free legacy/exported rigs retain their existing linear interpolation.
export function sampleCurveComponent(curve, left, right, alpha, component) {
  const a = curve.values[left][component], b = curve.values[right][component];
  if (alpha <= 0) return a;
  if (alpha >= 1) return b;
  const outgoing = curve.outSlopes?.[left]?.[component];
  const incoming = curve.inSlopes?.[right]?.[component];
  if (outgoing === undefined || incoming === undefined) return a + (b - a) * alpha;
  if (!Number.isFinite(outgoing) || !Number.isFinite(incoming)) return alpha < 1 ? a : b;
  const dt = curve.times[right] - curve.times[left];
  const t2 = alpha * alpha, t3 = t2 * alpha;
  return (2*t3-3*t2+1)*a + (t3-2*t2+alpha)*dt*outgoing
    + (-2*t3+3*t2)*b + (t3-t2)*dt*incoming;
}
