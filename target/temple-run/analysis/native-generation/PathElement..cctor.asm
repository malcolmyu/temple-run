
/tmp/temple-libil2cpp.so:	file format elf64-littleaarch64

Disassembly of section il2cpp:

00000000011a77c4 <__start_il2cpp>:
 12e8d18: f81e0ffe     	str	x30, [sp, #-0x20]!
 12e8d1c: a9014ff4     	stp	x20, x19, [sp, #0x10]
 12e8d20: b000ba73     	adrp	x19, 0x2a35000
 12e8d24: d000abd4     	adrp	x20, 0x2862000
 12e8d28: 396cc268     	ldrb	w8, [x19, #0xb30]
 12e8d2c: f9424a94     	ldr	x20, [x20, #0x490]
 12e8d30: 370000c8     	tbnz	w8, #0x0, 0x12e8d48 <__start_il2cpp+0x141584>
 12e8d34: d000abc0     	adrp	x0, 0x2862000
 12e8d38: f9424800     	ldr	x0, [x0, #0x490]
 12e8d3c: 97f75c67     	bl	0x10bfed8 <CloseNLSocket+0x410>
 12e8d40: 52800028     	mov	w8, #0x1                // =1
 12e8d44: 392cc268     	strb	w8, [x19, #0xb30]
 12e8d48: f9400288     	ldr	x8, [x20]
 12e8d4c: f0ff9d69     	adrp	x9, 0x697000
 12e8d50: fd41e120     	ldr	d0, [x9, #0x3c0]
 12e8d54: d0ff9d6a     	adrp	x10, 0x696000
 12e8d58: f9405d09     	ldr	x9, [x8, #0xb8]
 12e8d5c: a9414ff4     	ldp	x20, x19, [sp, #0x10]
 12e8d60: fc02c120     	stur	d0, [x9, #0x2c]
 12e8d64: fd469940     	ldr	d0, [x10, #0xd30]
 12e8d68: 5280002a     	mov	w10, #0x1               // =1
 12e8d6c: 3900192a     	strb	w10, [x9, #0x6]
 12e8d70: 5280064a     	mov	w10, #0x32              // =50
 12e8d74: b900192a     	str	w10, [x9, #0x18]
 12e8d78: 528000ca     	mov	w10, #0x6               // =6
 12e8d7c: f803412a     	stur	x10, [x9, #0x34]
 12e8d80: 5280004a     	mov	w10, #0x2               // =2
 12e8d84: fc03c120     	stur	d0, [x9, #0x3c]
 12e8d88: 4f03f600     	fmov	v0.4s, #1.00000000
 12e8d8c: b900013f     	str	wzr, [x9]
 12e8d90: 7900093f     	strh	wzr, [x9, #0x4]
 12e8d94: f800f13f     	stur	xzr, [x9, #0xf]
 12e8d98: f800713f     	stur	xzr, [x9, #0x7]
 12e8d9c: b900452a     	str	w10, [x9, #0x44]
 12e8da0: 3901213f     	strb	wzr, [x9, #0x48]
 12e8da4: 3c84c120     	stur	q0, [x9, #0x4c]
 12e8da8: f9405d09     	ldr	x9, [x8, #0xb8]
 12e8dac: a906fd3f     	stp	xzr, xzr, [x9, #0x68]
 12e8db0: f9405d08     	ldr	x8, [x8, #0xb8]
 12e8db4: a907fd1f     	stp	xzr, xzr, [x8, #0x78]
 12e8db8: f84207fe     	ldr	x30, [sp], #0x20
 12e8dbc: d65f03c0     	ret
 12e8dc0: a9bd5ffe     	stp	x30, x23, [sp, #-0x30]!
 12e8dc4: a90157f6     	stp	x22, x21, [sp, #0x10]
 12e8dc8: a9024ff4     	stp	x20, x19, [sp, #0x20]
 12e8dcc: b000ba76     	adrp	x22, 0x2a35000
 12e8dd0: 396ccac8     	ldrb	w8, [x22, #0xb32]
 12e8dd4: aa0203f4     	mov	x20, x2
 12e8dd8: aa0103f5     	mov	x21, x1
 12e8ddc: aa0003f3     	mov	x19, x0
 12e8de0: 350001e8     	cbnz	w8, 0x12e8e1c <__start_il2cpp+0x141658>
 12e8de4: b000aba0     	adrp	x0, 0x285d000
 12e8de8: f940d800     	ldr	x0, [x0, #0x1b0]
 12e8dec: 97f75c3b     	bl	0x10bfed8 <CloseNLSocket+0x410>
 12e8df0: 9000aba0     	adrp	x0, 0x285c000 <_ZTVN10__cxxabiv119__pointer_type_infoE+0x18>
 12e8df4: f945d000     	ldr	x0, [x0, #0xba0]
 12e8df8: 97f75c38     	bl	0x10bfed8 <CloseNLSocket+0x410>
 12e8dfc: d000abc0     	adrp	x0, 0x2862000
 12e8e00: f9453400     	ldr	x0, [x0, #0xa68]
 12e8e04: 97f75c35     	bl	0x10bfed8 <CloseNLSocket+0x410>
 12e8e08: d000abe0     	adrp	x0, 0x2866000
 12e8e0c: f9416000     	ldr	x0, [x0, #0x2c0]
 12e8e10: 97f75c32     	bl	0x10bfed8 <CloseNLSocket+0x410>
 12e8e14: 52800028     	mov	w8, #0x1                // =1
 12e8e18: 392ccac8     	strb	w8, [x22, #0xb32]
 12e8e1c: aa1503e0     	mov	x0, x21
 12e8e20: aa1f03e1     	mov	x1, xzr
 12e8e24: 94296c3b     	bl	0x1d43f10 <__start_il2cpp+0xb9c74c>
 12e8e28: d000abc8     	adrp	x8, 0x2862000
 12e8e2c: f9453508     	ldr	x8, [x8, #0xa68]
 12e8e30: 7200001f     	tst	w0, #0x1
 12e8e34: f9400108     	ldr	x8, [x8]
 12e8e38: 9a951115     	csel	x21, x8, x21, ne
 12e8e3c: b50001f4     	cbnz	x20, 0x12e8e78 <__start_il2cpp+0x1416b4>
 12e8e40: b000aba8     	adrp	x8, 0x285d000
 12e8e44: f940d908     	ldr	x8, [x8, #0x1b0]
 12e8e48: f9400100     	ldr	x0, [x8]
 12e8e4c: b940e008     	ldr	w8, [x0, #0xe0]
 12e8e50: 35000048     	cbnz	w8, 0x12e8e58 <__start_il2cpp+0x141694>
 12e8e54: 97f75c63     	bl	0x10bffe0 <CloseNLSocket+0x518>
 12e8e58: aa1f03e0     	mov	x0, xzr
 12e8e5c: 942e00ff     	bl	0x1e69258 <__start_il2cpp+0xcc1a94>
 12e8e60: b4000920     	cbz	x0, 0x12e8f84 <__start_il2cpp+0x1417c0>
 12e8e64: f9400008     	ldr	x8, [x0]
 12e8e68: f9411509     	ldr	x9, [x8, #0x228]
 12e8e6c: f9411901     	ldr	x1, [x8, #0x230]
 12e8e70: d63f0120     	blr	x9
 12e8e74: aa0003f4     	mov	x20, x0
 12e8e78: 9000aba8     	adrp	x8, 0x285c000 <_ZTVN10__cxxabiv119__pointer_type_infoE+0x18>
 12e8e7c: f945d108     	ldr	x8, [x8, #0xba0]
 12e8e80: 52800061     	mov	w1, #0x3                // =3
 12e8e84: f9400100     	ldr	x0, [x8]
 12e8e88: 97f75c32     	bl	0x10bff50 <CloseNLSocket+0x488>
 12e8e8c: aa0003f6     	mov	x22, x0
 12e8e90: aa1303e0     	mov	x0, x19
 12e8e94: aa1503e1     	mov	x1, x21
 12e8e98: aa1403e2     	mov	x2, x20
 12e8e9c: aa1f03e3     	mov	x3, xzr
 12e8ea0: 942f36cd     	bl	0x1eb69d4 <__start_il2cpp+0xd0f210>
 12e8ea4: b4000716     	cbz	x22, 0x12e8f84 <__start_il2cpp+0x1417c0>
 12e8ea8: aa0003f7     	mov	x23, x0
 12e8eac: b40000c0     	cbz	x0, 0x12e8ec4 <__start_il2cpp+0x141700>
 12e8eb0: f94002c8     	ldr	x8, [x22]
 12e8eb4: aa1703e0     	mov	x0, x23
 12e8eb8: f9402101     	ldr	x1, [x8, #0x40]
 12e8ebc: 97f75c4a     	bl	0x10bffe4 <CloseNLSocket+0x51c>
 12e8ec0: b40005c0     	cbz	x0, 0x12e8f78 <__start_il2cpp+0x1417b4>
 12e8ec4: b9401ac8     	ldr	w8, [x22, #0x18]
 12e8ec8: 34000568     	cbz	w8, 0x12e8f74 <__start_il2cpp+0x1417b0>
 12e8ecc: 91001260     	add	x0, x19, #0x4
 12e8ed0: aa1503e1     	mov	x1, x21
 12e8ed4: aa1403e2     	mov	x2, x20
 12e8ed8: aa1f03e3     	mov	x3, xzr
 12e8edc: f90012d7     	str	x23, [x22, #0x20]
 12e8ee0: 942f36bd     	bl	0x1eb69d4 <__start_il2cpp+0xd0f210>
 12e8ee4: aa0003f7     	mov	x23, x0
 12e8ee8: b40000c0     	cbz	x0, 0x12e8f00 <__start_il2cpp+0x14173c>
 12e8eec: f94002c8     	ldr	x8, [x22]
 12e8ef0: aa1703e0     	mov	x0, x23
 12e8ef4: f9402101     	ldr	x1, [x8, #0x40]
 12e8ef8: 97f75c3b     	bl	0x10bffe4 <CloseNLSocket+0x51c>
 12e8efc: b40003e0     	cbz	x0, 0x12e8f78 <__start_il2cpp+0x1417b4>
 12e8f00: b9401ac8     	ldr	w8, [x22, #0x18]
 12e8f04: 7100051f     	cmp	w8, #0x1
 12e8f08: 54000369     	b.ls	0x12e8f74 <__start_il2cpp+0x1417b0>
 12e8f0c: 91002260     	add	x0, x19, #0x8
 12e8f10: aa1503e1     	mov	x1, x21
 12e8f14: aa1403e2     	mov	x2, x20
 12e8f18: aa1f03e3     	mov	x3, xzr
 12e8f1c: f90016d7     	str	x23, [x22, #0x28]
 12e8f20: 942f36ad     	bl	0x1eb69d4 <__start_il2cpp+0xd0f210>
 12e8f24: aa0003f3     	mov	x19, x0
 12e8f28: b40000c0     	cbz	x0, 0x12e8f40 <__start_il2cpp+0x14177c>
 12e8f2c: f94002c8     	ldr	x8, [x22]
 12e8f30: aa1303e0     	mov	x0, x19
 12e8f34: f9402101     	ldr	x1, [x8, #0x40]
 12e8f38: 97f75c2b     	bl	0x10bffe4 <CloseNLSocket+0x51c>
 12e8f3c: b40001e0     	cbz	x0, 0x12e8f78 <__start_il2cpp+0x1417b4>
 12e8f40: b9401ac8     	ldr	w8, [x22, #0x18]
 12e8f44: 7100091f     	cmp	w8, #0x2
 12e8f48: 54000169     	b.ls	0x12e8f74 <__start_il2cpp+0x1417b0>
 12e8f4c: f9001ad3     	str	x19, [x22, #0x30]
 12e8f50: d000abe8     	adrp	x8, 0x2866000
 12e8f54: f9416108     	ldr	x8, [x8, #0x2c0]
 12e8f58: aa1603e1     	mov	x1, x22
 12e8f5c: a9424ff4     	ldp	x20, x19, [sp, #0x20]
 12e8f60: a94157f6     	ldp	x22, x21, [sp, #0x10]
 12e8f64: f9400100     	ldr	x0, [x8]
 12e8f68: aa1f03e2     	mov	x2, xzr
 12e8f6c: a8c35ffe     	ldp	x30, x23, [sp], #0x30
 12e8f70: 14495094     	b	0x253d1c0 <__start_il2cpp+0x13959fc>
 12e8f74: 97f75c65     	bl	0x10c0108 <CloseNLSocket+0x640>
 12e8f78: 97f75c6b     	bl	0x10c0124 <CloseNLSocket+0x65c>
 12e8f7c: aa1f03e1     	mov	x1, xzr
 12e8f80: 97f75c14     	bl	0x10bffd0 <CloseNLSocket+0x508>
 12e8f84: 97f75c5f     	bl	0x10c0100 <CloseNLSocket+0x638>
