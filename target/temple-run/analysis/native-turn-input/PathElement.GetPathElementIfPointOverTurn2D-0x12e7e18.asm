
/tmp/temple-libil2cpp.so:	file format elf64-littleaarch64

Disassembly of section il2cpp:

00000000011a77c4 <__start_il2cpp>:
 12e7e18: 6db933ed     	stp	d13, d12, [sp, #-0x70]!
 12e7e1c: 6d012beb     	stp	d11, d10, [sp, #0x10]
 12e7e20: 6d0223e9     	stp	d9, d8, [sp, #0x20]
 12e7e24: f9001bfe     	str	x30, [sp, #0x30]
 12e7e28: a9045ff8     	stp	x24, x23, [sp, #0x40]
 12e7e2c: a90557f6     	stp	x22, x21, [sp, #0x50]
 12e7e30: a9064ff4     	stp	x20, x19, [sp, #0x60]
 12e7e34: d000ba77     	adrp	x23, 0x2a35000
 12e7e38: 396c9ae8     	ldrb	w8, [x23, #0xb26]
 12e7e3c: 2a0303f6     	mov	w22, w3
 12e7e40: 2a0203f4     	mov	w20, w2
 12e7e44: 2a0103f5     	mov	w21, w1
 12e7e48: 4ea21c48     	mov	v8.16b, v2.16b
 12e7e4c: 4ea11c29     	mov	v9.16b, v1.16b
 12e7e50: 4ea01c0a     	mov	v10.16b, v0.16b
 12e7e54: aa0003f3     	mov	x19, x0
 12e7e58: 370000c8     	tbnz	w8, #0x0, 0x12e7e70 <__start_il2cpp+0x1406ac>
 12e7e5c: b000aba0     	adrp	x0, 0x285c000 <_ZTVN10__cxxabiv119__pointer_type_infoE+0x18>
 12e7e60: f9456000     	ldr	x0, [x0, #0xac0]
 12e7e64: 97f7601d     	bl	0x10bfed8 <CloseNLSocket+0x410>
 12e7e68: 52800028     	mov	w8, #0x1                // =1
 12e7e6c: 392c9ae8     	strb	w8, [x23, #0xb26]
 12e7e70: aa1303e0     	mov	x0, x19
 12e7e74: 97ffea8f     	bl	0x12e28b0 <__start_il2cpp+0x13b0ec>
 12e7e78: 360004a0     	tbz	w0, #0x0, 0x12e7f0c <__start_il2cpp+0x140748>
 12e7e7c: aa1303e0     	mov	x0, x19
 12e7e80: aa1f03e1     	mov	x1, xzr
 12e7e84: 944738a2     	bl	0x24b610c <__start_il2cpp+0x130e948>
 12e7e88: b40017a0     	cbz	x0, 0x12e817c <__start_il2cpp+0x1409b8>
 12e7e8c: aa1f03e1     	mov	x1, xzr
 12e7e90: 944769f9     	bl	0x24c2674 <__start_il2cpp+0x131aeb0>
 12e7e94: aa1303e0     	mov	x0, x19
 12e7e98: aa1f03e1     	mov	x1, xzr
 12e7e9c: 4ea01c0b     	mov	v11.16b, v0.16b
 12e7ea0: 9447389b     	bl	0x24b610c <__start_il2cpp+0x130e948>
 12e7ea4: b40016c0     	cbz	x0, 0x12e817c <__start_il2cpp+0x1409b8>
 12e7ea8: aa1f03e1     	mov	x1, xzr
 12e7eac: 944769f2     	bl	0x24c2674 <__start_il2cpp+0x131aeb0>
 12e7eb0: d000ba77     	adrp	x23, 0x2a35000
 12e7eb4: 395df6e8     	ldrb	w8, [x23, #0x77d]
 12e7eb8: 4ea21c4c     	mov	v12.16b, v2.16b
 12e7ebc: 350000c8     	cbnz	w8, 0x12e7ed4 <__start_il2cpp+0x140710>
 12e7ec0: f000aba0     	adrp	x0, 0x285e000
 12e7ec4: f9417800     	ldr	x0, [x0, #0x2f0]
 12e7ec8: 97f76004     	bl	0x10bfed8 <CloseNLSocket+0x410>
 12e7ecc: 52800028     	mov	w8, #0x1                // =1
 12e7ed0: 391df6e8     	strb	w8, [x23, #0x77d]
 12e7ed4: f000aba8     	adrp	x8, 0x285e000
 12e7ed8: f9417908     	ldr	x8, [x8, #0x2f0]
 12e7edc: 1e2b394d     	fsub	s13, s10, s11
 12e7ee0: 1e2c392b     	fsub	s11, s9, s12
 12e7ee4: f9400100     	ldr	x0, [x8]
 12e7ee8: b940e008     	ldr	w8, [x0, #0xe0]
 12e7eec: 35000048     	cbnz	w8, 0x12e7ef4 <__start_il2cpp+0x140730>
 12e7ef0: 97f7603c     	bl	0x10bffe0 <CloseNLSocket+0x518>
 12e7ef4: 1e2d09a0     	fmul	s0, s13, s13
 12e7ef8: 1e2b0961     	fmul	s1, s11, s11
 12e7efc: 1e212800     	fadd	s0, s0, s1
 12e7f00: 1e21c000     	fsqrt	s0, s0
 12e7f04: 1e282000     	fcmp	s0, s8
 12e7f08: 54000569     	b.ls	0x12e7fb4 <__start_il2cpp+0x1407f0>
 12e7f0c: 510006d6     	sub	w22, w22, #0x1
 12e7f10: 710006df     	cmp	w22, #0x1
 12e7f14: 5400120b     	b.lt	0x12e8154 <__start_il2cpp+0x140990>
 12e7f18: 710006bf     	cmp	w21, #0x1
 12e7f1c: 54000501     	b.ne	0x12e7fbc <__start_il2cpp+0x1407f8>
 12e7f20: 370004f4     	tbnz	w20, #0x0, 0x12e7fbc <__start_il2cpp+0x1407f8>
 12e7f24: b000abb8     	adrp	x24, 0x285c000 <_ZTVN10__cxxabiv119__pointer_type_infoE+0x18>
 12e7f28: f9456318     	ldr	x24, [x24, #0xac0]
 12e7f2c: f9402e77     	ldr	x23, [x19, #0x58]
 12e7f30: f9400300     	ldr	x0, [x24]
 12e7f34: b940e008     	ldr	w8, [x0, #0xe0]
 12e7f38: 35000048     	cbnz	w8, 0x12e7f40 <__start_il2cpp+0x14077c>
 12e7f3c: 97f76029     	bl	0x10bffe0 <CloseNLSocket+0x518>
 12e7f40: aa1703e0     	mov	x0, x23
 12e7f44: aa1f03e1     	mov	x1, xzr
 12e7f48: aa1f03e2     	mov	x2, xzr
 12e7f4c: 9447423f     	bl	0x24b8848 <__start_il2cpp+0x1311084>
 12e7f50: 360002a0     	tbz	w0, #0x0, 0x12e7fa4 <__start_il2cpp+0x1407e0>
 12e7f54: f9402e60     	ldr	x0, [x19, #0x58]
 12e7f58: b4001120     	cbz	x0, 0x12e817c <__start_il2cpp+0x1409b8>
 12e7f5c: 52800081     	mov	w1, #0x4                // =4
 12e7f60: 4eaa1d40     	mov	v0.16b, v10.16b
 12e7f64: 4ea91d21     	mov	v1.16b, v9.16b
 12e7f68: 4ea81d02     	mov	v2.16b, v8.16b
 12e7f6c: 2a1f03e2     	mov	w2, wzr
 12e7f70: 2a1603e3     	mov	w3, w22
 12e7f74: 97ffffa9     	bl	0x12e7e18 <__start_il2cpp+0x140654>
 12e7f78: f9400308     	ldr	x8, [x24]
 12e7f7c: aa0003f7     	mov	x23, x0
 12e7f80: b940e109     	ldr	w9, [x8, #0xe0]
 12e7f84: 35000069     	cbnz	w9, 0x12e7f90 <__start_il2cpp+0x1407cc>
 12e7f88: aa0803e0     	mov	x0, x8
 12e7f8c: 97f76015     	bl	0x10bffe0 <CloseNLSocket+0x518>
 12e7f90: aa1703e0     	mov	x0, x23
 12e7f94: aa1f03e1     	mov	x1, xzr
 12e7f98: aa1f03e2     	mov	x2, xzr
 12e7f9c: 9447422b     	bl	0x24b8848 <__start_il2cpp+0x1311084>
 12e7fa0: 37000dc0     	tbnz	w0, #0x0, 0x12e8158 <__start_il2cpp+0x140994>
 12e7fa4: 71000ebf     	cmp	w21, #0x3
 12e7fa8: 54000501     	b.ne	0x12e8048 <__start_il2cpp+0x140884>
 12e7fac: 36000954     	tbz	w20, #0x0, 0x12e80d4 <__start_il2cpp+0x140910>
 12e7fb0: 14000026     	b	0x12e8048 <__start_il2cpp+0x140884>
 12e7fb4: aa1303f7     	mov	x23, x19
 12e7fb8: 14000068     	b	0x12e8158 <__start_il2cpp+0x140994>
 12e7fbc: b000abb8     	adrp	x24, 0x285c000 <_ZTVN10__cxxabiv119__pointer_type_infoE+0x18>
 12e7fc0: f9456318     	ldr	x24, [x24, #0xac0]
 12e7fc4: f9402a77     	ldr	x23, [x19, #0x50]
 12e7fc8: f9400300     	ldr	x0, [x24]
 12e7fcc: b940e008     	ldr	w8, [x0, #0xe0]
 12e7fd0: 35000048     	cbnz	w8, 0x12e7fd8 <__start_il2cpp+0x140814>
 12e7fd4: 97f76003     	bl	0x10bffe0 <CloseNLSocket+0x518>
 12e7fd8: aa1703e0     	mov	x0, x23
 12e7fdc: aa1f03e1     	mov	x1, xzr
 12e7fe0: aa1f03e2     	mov	x2, xzr
 12e7fe4: 94474219     	bl	0x24b8848 <__start_il2cpp+0x1311084>
 12e7fe8: 360002a0     	tbz	w0, #0x0, 0x12e803c <__start_il2cpp+0x140878>
 12e7fec: f9402a60     	ldr	x0, [x19, #0x50]
 12e7ff0: b4000c60     	cbz	x0, 0x12e817c <__start_il2cpp+0x1409b8>
 12e7ff4: 52800061     	mov	w1, #0x3                // =3
 12e7ff8: 4eaa1d40     	mov	v0.16b, v10.16b
 12e7ffc: 4ea91d21     	mov	v1.16b, v9.16b
 12e8000: 4ea81d02     	mov	v2.16b, v8.16b
 12e8004: 2a1f03e2     	mov	w2, wzr
 12e8008: 2a1603e3     	mov	w3, w22
 12e800c: 97ffff83     	bl	0x12e7e18 <__start_il2cpp+0x140654>
 12e8010: f9400308     	ldr	x8, [x24]
 12e8014: aa0003f7     	mov	x23, x0
 12e8018: b940e109     	ldr	w9, [x8, #0xe0]
 12e801c: 35000069     	cbnz	w9, 0x12e8028 <__start_il2cpp+0x140864>
 12e8020: aa0803e0     	mov	x0, x8
 12e8024: 97f75fef     	bl	0x10bffe0 <CloseNLSocket+0x518>
 12e8028: aa1703e0     	mov	x0, x23
 12e802c: aa1f03e1     	mov	x1, xzr
 12e8030: aa1f03e2     	mov	x2, xzr
 12e8034: 94474205     	bl	0x24b8848 <__start_il2cpp+0x1311084>
 12e8038: 37000900     	tbnz	w0, #0x0, 0x12e8158 <__start_il2cpp+0x140994>
 12e803c: 71000abf     	cmp	w21, #0x2
 12e8040: 54fff721     	b.ne	0x12e7f24 <__start_il2cpp+0x140760>
 12e8044: 3707f714     	tbnz	w20, #0x0, 0x12e7f24 <__start_il2cpp+0x140760>
 12e8048: 9000abb8     	adrp	x24, 0x285c000 <_ZTVN10__cxxabiv119__pointer_type_infoE+0x18>
 12e804c: f9456318     	ldr	x24, [x24, #0xac0]
 12e8050: f9403677     	ldr	x23, [x19, #0x68]
 12e8054: f9400300     	ldr	x0, [x24]
 12e8058: b940e008     	ldr	w8, [x0, #0xe0]
 12e805c: 35000048     	cbnz	w8, 0x12e8064 <__start_il2cpp+0x1408a0>
 12e8060: 97f75fe0     	bl	0x10bffe0 <CloseNLSocket+0x518>
 12e8064: aa1703e0     	mov	x0, x23
 12e8068: aa1f03e1     	mov	x1, xzr
 12e806c: aa1f03e2     	mov	x2, xzr
 12e8070: 944741f6     	bl	0x24b8848 <__start_il2cpp+0x1311084>
 12e8074: 360002a0     	tbz	w0, #0x0, 0x12e80c8 <__start_il2cpp+0x140904>
 12e8078: f9403660     	ldr	x0, [x19, #0x68]
 12e807c: b4000800     	cbz	x0, 0x12e817c <__start_il2cpp+0x1409b8>
 12e8080: 52800021     	mov	w1, #0x1                // =1
 12e8084: 4eaa1d40     	mov	v0.16b, v10.16b
 12e8088: 4ea91d21     	mov	v1.16b, v9.16b
 12e808c: 4ea81d02     	mov	v2.16b, v8.16b
 12e8090: 2a1f03e2     	mov	w2, wzr
 12e8094: 2a1603e3     	mov	w3, w22
 12e8098: 97ffff60     	bl	0x12e7e18 <__start_il2cpp+0x140654>
 12e809c: f9400308     	ldr	x8, [x24]
 12e80a0: aa0003f7     	mov	x23, x0
 12e80a4: b940e109     	ldr	w9, [x8, #0xe0]
 12e80a8: 35000069     	cbnz	w9, 0x12e80b4 <__start_il2cpp+0x1408f0>
 12e80ac: aa0803e0     	mov	x0, x8
 12e80b0: 97f75fcc     	bl	0x10bffe0 <CloseNLSocket+0x518>
 12e80b4: aa1703e0     	mov	x0, x23
 12e80b8: aa1f03e1     	mov	x1, xzr
 12e80bc: aa1f03e2     	mov	x2, xzr
 12e80c0: 944741e2     	bl	0x24b8848 <__start_il2cpp+0x1311084>
 12e80c4: 370004a0     	tbnz	w0, #0x0, 0x12e8158 <__start_il2cpp+0x140994>
 12e80c8: 710012bf     	cmp	w21, #0x4
 12e80cc: 54000041     	b.ne	0x12e80d4 <__start_il2cpp+0x140910>
 12e80d0: 36000434     	tbz	w20, #0x0, 0x12e8154 <__start_il2cpp+0x140990>
 12e80d4: 9000abb5     	adrp	x21, 0x285c000 <_ZTVN10__cxxabiv119__pointer_type_infoE+0x18>
 12e80d8: f94562b5     	ldr	x21, [x21, #0xac0]
 12e80dc: f9403274     	ldr	x20, [x19, #0x60]
 12e80e0: f94002a0     	ldr	x0, [x21]
 12e80e4: b940e008     	ldr	w8, [x0, #0xe0]
 12e80e8: 35000048     	cbnz	w8, 0x12e80f0 <__start_il2cpp+0x14092c>
 12e80ec: 97f75fbd     	bl	0x10bffe0 <CloseNLSocket+0x518>
 12e80f0: aa1403e0     	mov	x0, x20
 12e80f4: aa1f03e1     	mov	x1, xzr
 12e80f8: aa1f03e2     	mov	x2, xzr
 12e80fc: 944741d3     	bl	0x24b8848 <__start_il2cpp+0x1311084>
 12e8100: 360002a0     	tbz	w0, #0x0, 0x12e8154 <__start_il2cpp+0x140990>
 12e8104: f9403260     	ldr	x0, [x19, #0x60]
 12e8108: b40003a0     	cbz	x0, 0x12e817c <__start_il2cpp+0x1409b8>
 12e810c: 52800041     	mov	w1, #0x2                // =2
 12e8110: 4eaa1d40     	mov	v0.16b, v10.16b
 12e8114: 4ea91d21     	mov	v1.16b, v9.16b
 12e8118: 4ea81d02     	mov	v2.16b, v8.16b
 12e811c: 2a1f03e2     	mov	w2, wzr
 12e8120: 2a1603e3     	mov	w3, w22
 12e8124: 97ffff3d     	bl	0x12e7e18 <__start_il2cpp+0x140654>
 12e8128: f94002a8     	ldr	x8, [x21]
 12e812c: aa0003f7     	mov	x23, x0
 12e8130: b940e109     	ldr	w9, [x8, #0xe0]
 12e8134: 35000069     	cbnz	w9, 0x12e8140 <__start_il2cpp+0x14097c>
 12e8138: aa0803e0     	mov	x0, x8
 12e813c: 97f75fa9     	bl	0x10bffe0 <CloseNLSocket+0x518>
 12e8140: aa1703e0     	mov	x0, x23
 12e8144: aa1f03e1     	mov	x1, xzr
 12e8148: aa1f03e2     	mov	x2, xzr
 12e814c: 944741bf     	bl	0x24b8848 <__start_il2cpp+0x1311084>
 12e8150: 37000040     	tbnz	w0, #0x0, 0x12e8158 <__start_il2cpp+0x140994>
 12e8154: aa1f03f7     	mov	x23, xzr
 12e8158: aa1703e0     	mov	x0, x23
 12e815c: a9464ff4     	ldp	x20, x19, [sp, #0x60]
 12e8160: a94557f6     	ldp	x22, x21, [sp, #0x50]
 12e8164: a9445ff8     	ldp	x24, x23, [sp, #0x40]
 12e8168: f9401bfe     	ldr	x30, [sp, #0x30]
 12e816c: 6d4223e9     	ldp	d9, d8, [sp, #0x20]
 12e8170: 6d412beb     	ldp	d11, d10, [sp, #0x10]
 12e8174: 6cc733ed     	ldp	d13, d12, [sp], #0x70
 12e8178: d65f03c0     	ret
 12e817c: 97f75fe1     	bl	0x10c0100 <CloseNLSocket+0x638>
