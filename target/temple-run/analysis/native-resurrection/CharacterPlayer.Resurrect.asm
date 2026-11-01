
/tmp/temple-libil2cpp.so:	file format elf64-littleaarch64

Disassembly of section il2cpp:

00000000011a77c4 <__start_il2cpp>:
 1298d60: f81e0ffe     	str	x30, [sp, #-0x20]!
 1298d64: a9014ff4     	stp	x20, x19, [sp, #0x10]
 1298d68: b000bcf4     	adrp	x20, 0x2a35000
 1298d6c: 39626288     	ldrb	w8, [x20, #0x898]
 1298d70: aa0003f3     	mov	x19, x0
 1298d74: 370000c8     	tbnz	w8, #0x0, 0x1298d8c <__start_il2cpp+0xf15c8>
 1298d78: f000ae40     	adrp	x0, 0x2863000
 1298d7c: f946c400     	ldr	x0, [x0, #0xd88]
 1298d80: 97f89c56     	bl	0x10bfed8 <CloseNLSocket+0x410>
 1298d84: 52800028     	mov	w8, #0x1                // =1
 1298d88: 39226288     	strb	w8, [x20, #0x898]
 1298d8c: f9405260     	ldr	x0, [x19, #0xa0]
 1298d90: b4000500     	cbz	x0, 0x1298e30 <__start_il2cpp+0xf166c>
 1298d94: f000ae48     	adrp	x8, 0x2863000
 1298d98: f946c508     	ldr	x8, [x8, #0xd88]
 1298d9c: aa1f03e2     	mov	x2, xzr
 1298da0: f9400101     	ldr	x1, [x8]
 1298da4: 9447d06a     	bl	0x248cf4c <__start_il2cpp+0x12e5788>
 1298da8: bd413660     	ldr	s0, [x19, #0x134]
 1298dac: aa1303e0     	mov	x0, x19
 1298db0: aa1f03e1     	mov	x1, xzr
 1298db4: 94011f49     	bl	0x12e0ad8 <__start_il2cpp+0x139314>
 1298db8: 1e2e1000     	fmov	s0, #1.00000000
 1298dbc: aa1303e0     	mov	x0, x19
 1298dc0: 97fff849     	bl	0x1296ee4 <__start_il2cpp+0xef720>
 1298dc4: aa1303e0     	mov	x0, x19
 1298dc8: 97fffbac     	bl	0x1297c78 <__start_il2cpp+0xf04b4>
 1298dcc: 52800028     	mov	w8, #0x1                // =1
 1298dd0: 52a82409     	mov	w9, #0x41200000         // =1092616192
 1298dd4: 3903627f     	strb	wzr, [x19, #0xd8]
 1298dd8: f80dc27f     	stur	xzr, [x19, #0xdc]
 1298ddc: 3903c27f     	strb	wzr, [x19, #0xf0]
 1298de0: 7901f27f     	strh	wzr, [x19, #0xf8]
 1298de4: 3904027f     	strb	wzr, [x19, #0x100]
 1298de8: b901067f     	str	wzr, [x19, #0x104]
 1298dec: 79021a7f     	strh	wzr, [x19, #0x10c]
 1298df0: 79024a7f     	strh	wzr, [x19, #0x124]
 1298df4: 3904ca7f     	strb	wzr, [x19, #0x132]
 1298df8: 3905527f     	strb	wzr, [x19, #0x154]
 1298dfc: b9015a7f     	str	wzr, [x19, #0x158]
 1298e00: 7902c27f     	strh	wzr, [x19, #0x160]
 1298e04: 3905b27f     	strb	wzr, [x19, #0x16c]
 1298e08: b901727f     	str	wzr, [x19, #0x170]
 1298e0c: 3905d27f     	strb	wzr, [x19, #0x174]
 1298e10: f900be7f     	str	xzr, [x19, #0x178]
 1298e14: 3904c268     	strb	w8, [x19, #0x130]
 1298e18: b9011e69     	str	w9, [x19, #0x11c]
 1298e1c: b9014268     	str	w8, [x19, #0x140]
 1298e20: b9014e7f     	str	wzr, [x19, #0x14c]
 1298e24: a9414ff4     	ldp	x20, x19, [sp, #0x10]
 1298e28: f84207fe     	ldr	x30, [sp], #0x20
 1298e2c: d65f03c0     	ret
 1298e30: 97f89cb4     	bl	0x10c0100 <CloseNLSocket+0x638>
