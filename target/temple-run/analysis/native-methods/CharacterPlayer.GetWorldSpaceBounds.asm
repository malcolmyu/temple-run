
/tmp/temple-libil2cpp.so:	file format elf64-littleaarch64

Disassembly of section il2cpp:

00000000011a77c4 <__start_il2cpp>:
 1298e34: a9bf4ffe     	stp	x30, x19, [sp, #-0x10]!
 1298e38: aa1f03e1     	mov	x1, xzr
 1298e3c: aa0803f3     	mov	x19, x8
 1298e40: 944874b3     	bl	0x24b610c <__start_il2cpp+0x130e948>
 1298e44: b40003c0     	cbz	x0, 0x1298ebc <__start_il2cpp+0xf16f8>
 1298e48: aa1f03e1     	mov	x1, xzr
 1298e4c: 9448a60a     	bl	0x24c2674 <__start_il2cpp+0x131aeb0>
 1298e50: d0ff9fe8     	adrp	x8, 0x696000
 1298e54: fd478503     	ldr	d3, [x8, #0xf08]
 1298e58: f0ff9fe8     	adrp	x8, 0x697000
 1298e5c: bd465904     	ldr	s4, [x8, #0x658]
 1298e60: f0ff9fe8     	adrp	x8, 0x697000
 1298e64: fd41c505     	ldr	d5, [x8, #0x388]
 1298e68: f0ff9fe8     	adrp	x8, 0x697000
 1298e6c: 6e0c0420     	mov	v0.s[1], v1.s[0]
 1298e70: bd45e901     	ldr	s1, [x8, #0x5e8]
 1298e74: 0e23d403     	fadd	v3.2s, v0.2s, v3.2s
 1298e78: 0e25d400     	fadd	v0.2s, v0.2s, v5.2s
 1298e7c: 1e242844     	fadd	s4, s2, s4
 1298e80: 1e212841     	fadd	s1, s2, s1
 1298e84: 0f0167e2     	movi	v2.2s, #0x3f, lsl #24
 1298e88: 0ea3d400     	fsub	v0.2s, v0.2s, v3.2s
 1298e8c: 2e22dc00     	fmul	v0.2s, v0.2s, v2.2s
 1298e90: 1e2c1002     	fmov	s2, #0.50000000
 1298e94: 1e243821     	fsub	s1, s1, s4
 1298e98: 1e220821     	fmul	s1, s1, s2
 1298e9c: 0e20d462     	fadd	v2.2s, v3.2s, v0.2s
 1298ea0: 1e212883     	fadd	s3, s4, s1
 1298ea4: fc00c260     	stur	d0, [x19, #0xc]
 1298ea8: fd000262     	str	d2, [x19]
 1298eac: bd000a63     	str	s3, [x19, #0x8]
 1298eb0: bd001661     	str	s1, [x19, #0x14]
 1298eb4: a8c14ffe     	ldp	x30, x19, [sp], #0x10
 1298eb8: d65f03c0     	ret
 1298ebc: 97f89c91     	bl	0x10c0100 <CloseNLSocket+0x638>
