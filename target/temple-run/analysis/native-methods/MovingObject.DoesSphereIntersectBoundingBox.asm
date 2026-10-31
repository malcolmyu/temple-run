
/tmp/temple-libil2cpp.so:	file format elf64-littleaarch64

Disassembly of section il2cpp:

00000000011a77c4 <__start_il2cpp>:
 12e0d94: d101c3ff     	sub	sp, sp, #0x70
 12e0d98: 6d042beb     	stp	d11, d10, [sp, #0x40]
 12e0d9c: 6d0523e9     	stp	d9, d8, [sp, #0x50]
 12e0da0: f90033fe     	str	x30, [sp, #0x60]
 12e0da4: a9027fff     	stp	xzr, xzr, [sp, #0x20]
 12e0da8: f9001bff     	str	xzr, [sp, #0x30]
 12e0dac: f9400008     	ldr	x8, [x0]
 12e0db0: 4ea31c68     	mov	v8.16b, v3.16b
 12e0db4: 4ea21c49     	mov	v9.16b, v2.16b
 12e0db8: 4ea11c2a     	mov	v10.16b, v1.16b
 12e0dbc: a9598509     	ldp	x9, x1, [x8, #0x198]
 12e0dc0: 910023e8     	add	x8, sp, #0x8
 12e0dc4: 4ea01c0b     	mov	v11.16b, v0.16b
 12e0dc8: d63f0120     	blr	x9
 12e0dcc: 3cc083e0     	ldur	q0, [sp, #0x8]
 12e0dd0: f9400fe8     	ldr	x8, [sp, #0x18]
 12e0dd4: 910083e0     	add	x0, sp, #0x20
 12e0dd8: 4eaa1d41     	mov	v1.16b, v10.16b
 12e0ddc: 3d800be0     	str	q0, [sp, #0x20]
 12e0de0: 4eab1d60     	mov	v0.16b, v11.16b
 12e0de4: 4ea91d22     	mov	v2.16b, v9.16b
 12e0de8: aa1f03e1     	mov	x1, xzr
 12e0dec: f9001be8     	str	x8, [sp, #0x30]
 12e0df0: 9446e447     	bl	0x2499f0c <__start_il2cpp+0x12f2748>
 12e0df4: 1e280901     	fmul	s1, s8, s8
 12e0df8: f94033fe     	ldr	x30, [sp, #0x60]
 12e0dfc: 6d4523e9     	ldp	d9, d8, [sp, #0x50]
 12e0e00: 6d442beb     	ldp	d11, d10, [sp, #0x40]
 12e0e04: 1e212000     	fcmp	s0, s1
 12e0e08: 1a9f87e0     	cset	w0, ls
 12e0e0c: 9101c3ff     	add	sp, sp, #0x70
 12e0e10: d65f03c0     	ret
