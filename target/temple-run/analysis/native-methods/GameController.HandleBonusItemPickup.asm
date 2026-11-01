
/tmp/temple-libil2cpp.so:	file format elf64-littleaarch64

Disassembly of section il2cpp:

00000000011a77c4 <__start_il2cpp>:
 1270d78: d102c3ff     	sub	sp, sp, #0xb0
 1270d7c: 6d013bef     	stp	d15, d14, [sp, #0x10]
 1270d80: 6d0233ed     	stp	d13, d12, [sp, #0x20]
 1270d84: 6d032beb     	stp	d11, d10, [sp, #0x30]
 1270d88: 6d0423e9     	stp	d9, d8, [sp, #0x40]
 1270d8c: a9057bfd     	stp	x29, x30, [sp, #0x50]
 1270d90: a9066ffc     	stp	x28, x27, [sp, #0x60]
 1270d94: a90767fa     	stp	x26, x25, [sp, #0x70]
 1270d98: a9085ff8     	stp	x24, x23, [sp, #0x80]
 1270d9c: a90957f6     	stp	x22, x21, [sp, #0x90]
 1270da0: a90a4ff4     	stp	x20, x19, [sp, #0xa0]
 1270da4: f0ffa128     	adrp	x8, 0x697000
 1270da8: bd469100     	ldr	s0, [x8, #0x690]
 1270dac: f0ffa129     	adrp	x9, 0x697000
 1270db0: f0ffa12a     	adrp	x10, 0x697000
 1270db4: bd45694e     	ldr	s14, [x10, #0x568]
 1270db8: bd000fe0     	str	s0, [sp, #0xc]
 1270dbc: bd45cd20     	ldr	s0, [x9, #0x5cc]
 1270dc0: f0ffa23a     	adrp	x26, 0x6b7000
 1270dc4: 2a0403f3     	mov	w19, w4
 1270dc8: 2a0303f6     	mov	w22, w3
 1270dcc: 2a0203f9     	mov	w25, w2
 1270dd0: aa0103f4     	mov	x20, x1
 1270dd4: aa0003f5     	mov	x21, x0
 1270dd8: 52800038     	mov	w24, #0x1               // =1
 1270ddc: 9122935a     	add	x26, x26, #0x8a4
 1270de0: bd000be0     	str	s0, [sp, #0x8]
 1270de4: b000be28     	adrp	x8, 0x2a35000
 1270de8: 395d3108     	ldrb	w8, [x8, #0x74c]
 1270dec: 37000128     	tbnz	w8, #0x0, 0x1270e10 <__start_il2cpp+0xc964c>
 1270df0: d000af80     	adrp	x0, 0x2862000
 1270df4: f9438000     	ldr	x0, [x0, #0x700]
 1270df8: 97f93c38     	bl	0x10bfed8 <CloseNLSocket+0x410>
 1270dfc: 9000af60     	adrp	x0, 0x285c000 <_ZTVN10__cxxabiv119__pointer_type_infoE+0x18>
 1270e00: f9456000     	ldr	x0, [x0, #0xac0]
 1270e04: 97f93c35     	bl	0x10bfed8 <CloseNLSocket+0x410>
 1270e08: b000be28     	adrp	x8, 0x2a35000
 1270e0c: 391d3118     	strb	w24, [x8, #0x74c]
 1270e10: 9000af68     	adrp	x8, 0x285c000 <_ZTVN10__cxxabiv119__pointer_type_infoE+0x18>
 1270e14: f9456108     	ldr	x8, [x8, #0xac0]
 1270e18: f9400100     	ldr	x0, [x8]
 1270e1c: b940e008     	ldr	w8, [x0, #0xe0]
 1270e20: 35000048     	cbnz	w8, 0x1270e28 <__start_il2cpp+0xc9664>
 1270e24: 97f93c6f     	bl	0x10bffe0 <CloseNLSocket+0x518>
 1270e28: aa1403e0     	mov	x0, x20
 1270e2c: aa1f03e1     	mov	x1, xzr
 1270e30: aa1f03e2     	mov	x2, xzr
 1270e34: 94492199     	bl	0x24b9498 <__start_il2cpp+0x1311cd4>
 1270e38: 37002ba0     	tbnz	w0, #0x0, 0x12713ac <__start_il2cpp+0xc9be8>
 1270e3c: b4002d14     	cbz	x20, 0x12713dc <__start_il2cpp+0xc9c18>
 1270e40: 3940fa88     	ldrb	w8, [x20, #0x3e]
 1270e44: 35000068     	cbnz	w8, 0x1270e50 <__start_il2cpp+0xc968c>
 1270e48: 3940f688     	ldrb	w8, [x20, #0x3d]
 1270e4c: 340025a8     	cbz	w8, 0x1271300 <__start_il2cpp+0xc9b3c>
 1270e50: d000af88     	adrp	x8, 0x2862000
 1270e54: f9438108     	ldr	x8, [x8, #0x700]
 1270e58: aa1403e0     	mov	x0, x20
 1270e5c: f9400101     	ldr	x1, [x8]
 1270e60: 9404c9ab     	bl	0x13a350c <__start_il2cpp+0x1fbd48>
 1270e64: b4002bc0     	cbz	x0, 0x12713dc <__start_il2cpp+0xc9c18>
 1270e68: b9401808     	ldr	w8, [x0, #0x18]
 1270e6c: aa0003fc     	mov	x28, x0
 1270e70: 7100051f     	cmp	w8, #0x1
 1270e74: 5400246b     	b.lt	0x1271300 <__start_il2cpp+0xc9b3c>
 1270e78: 2a1f03f7     	mov	w23, wzr
 1270e7c: 6b0802ff     	cmp	w23, w8
 1270e80: 54002b02     	b.hs	0x12713e0 <__start_il2cpp+0xc9c1c>
 1270e84: 8b37cf88     	add	x8, x28, w23, sxtw #3
 1270e88: f940111d     	ldr	x29, [x8, #0x20]
 1270e8c: b4002a9d     	cbz	x29, 0x12713dc <__start_il2cpp+0xc9c18>
 1270e90: aa1d03e0     	mov	x0, x29
 1270e94: aa1f03e1     	mov	x1, xzr
 1270e98: 944911ef     	bl	0x24b5654 <__start_il2cpp+0x130de90>
 1270e9c: 36001620     	tbz	w0, #0x0, 0x1271160 <__start_il2cpp+0xc999c>
 1270ea0: b9407ba8     	ldr	w8, [x29, #0x78]
 1270ea4: 1e205008     	fmov	s8, #2.25000000
 1270ea8: 51000508     	sub	w8, w8, #0x1
 1270eac: 7100151f     	cmp	w8, #0x5
 1270eb0: 54000048     	b.hi	0x1270eb8 <__start_il2cpp+0xc96f4>
 1270eb4: bc68db48     	ldr	s8, [x26, w8, sxtw #2]
 1270eb8: f9403aa8     	ldr	x8, [x21, #0x70]
 1270ebc: b4002908     	cbz	x8, 0x12713dc <__start_il2cpp+0xc9c18>
 1270ec0: 39436108     	ldrb	w8, [x8, #0xd8]
 1270ec4: 35000ec8     	cbnz	w8, 0x127109c <__start_il2cpp+0xc98d8>
 1270ec8: aa1d03e0     	mov	x0, x29
 1270ecc: aa1f03e1     	mov	x1, xzr
 1270ed0: 94009468     	bl	0x1296070 <__start_il2cpp+0xee8ac>
 1270ed4: 36000e40     	tbz	w0, #0x0, 0x127109c <__start_il2cpp+0xc98d8>
 1270ed8: f9403aa8     	ldr	x8, [x21, #0x70]
 1270edc: b4002808     	cbz	x8, 0x12713dc <__start_il2cpp+0xc9c18>
 1270ee0: 3945b108     	ldrb	w8, [x8, #0x16c]
 1270ee4: 350000a8     	cbnz	w8, 0x1270ef8 <__start_il2cpp+0xc9734>
 1270ee8: 394a46a8     	ldrb	w8, [x21, #0x291]
 1270eec: 35000068     	cbnz	w8, 0x1270ef8 <__start_il2cpp+0xc9734>
 1270ef0: 394203a8     	ldrb	w8, [x29, #0x80]
 1270ef4: 34000d48     	cbz	w8, 0x127109c <__start_il2cpp+0xc98d8>
 1270ef8: aa1d03e0     	mov	x0, x29
 1270efc: aa1f03e1     	mov	x1, xzr
 1270f00: 94491483     	bl	0x24b610c <__start_il2cpp+0x130e948>
 1270f04: b40026c0     	cbz	x0, 0x12713dc <__start_il2cpp+0xc9c18>
 1270f08: aa1f03e1     	mov	x1, xzr
 1270f0c: 944945da     	bl	0x24c2674 <__start_il2cpp+0x131aeb0>
 1270f10: f9403aa0     	ldr	x0, [x21, #0x70]
 1270f14: b4002640     	cbz	x0, 0x12713dc <__start_il2cpp+0xc9c18>
 1270f18: aa1f03e1     	mov	x1, xzr
 1270f1c: 4ea01c09     	mov	v9.16b, v0.16b
 1270f20: 4ea11c2a     	mov	v10.16b, v1.16b
 1270f24: 4ea21c4b     	mov	v11.16b, v2.16b
 1270f28: 94491479     	bl	0x24b610c <__start_il2cpp+0x130e948>
 1270f2c: b4002580     	cbz	x0, 0x12713dc <__start_il2cpp+0xc9c18>
 1270f30: aa1f03e1     	mov	x1, xzr
 1270f34: 944945d0     	bl	0x24c2674 <__start_il2cpp+0x131aeb0>
 1270f38: 1e203920     	fsub	s0, s9, s0
 1270f3c: 1e213941     	fsub	s1, s10, s1
 1270f40: 1e223962     	fsub	s2, s11, s2
 1270f44: 1e200800     	fmul	s0, s0, s0
 1270f48: 1e210821     	fmul	s1, s1, s1
 1270f4c: 1e212800     	fadd	s0, s0, s1
 1270f50: 1e220841     	fmul	s1, s2, s2
 1270f54: 1e20282f     	fadd	s15, s1, s0
 1270f58: 1e2021e8     	fcmp	s15, #0.0
 1270f5c: 54000a0d     	b.le	0x127109c <__start_il2cpp+0xc98d8>
 1270f60: bd400fe0     	ldr	s0, [sp, #0xc]
 1270f64: 1e2021e0     	fcmp	s15, s0
 1270f68: 540009a8     	b.hi	0x127109c <__start_il2cpp+0xc98d8>
 1270f6c: f9403aa0     	ldr	x0, [x21, #0x70]
 1270f70: b4002360     	cbz	x0, 0x12713dc <__start_il2cpp+0xc9c18>
 1270f74: aa1f03e1     	mov	x1, xzr
 1270f78: 94491465     	bl	0x24b610c <__start_il2cpp+0x130e948>
 1270f7c: b4002300     	cbz	x0, 0x12713dc <__start_il2cpp+0xc9c18>
 1270f80: aa1f03e1     	mov	x1, xzr
 1270f84: 944945bc     	bl	0x24c2674 <__start_il2cpp+0x131aeb0>
 1270f88: aa1d03e0     	mov	x0, x29
 1270f8c: aa1f03e1     	mov	x1, xzr
 1270f90: 4ea01c08     	mov	v8.16b, v0.16b
 1270f94: 4ea11c29     	mov	v9.16b, v1.16b
 1270f98: 4ea21c4a     	mov	v10.16b, v2.16b
 1270f9c: 9449145c     	bl	0x24b610c <__start_il2cpp+0x130e948>
 1270fa0: b40021e0     	cbz	x0, 0x12713dc <__start_il2cpp+0xc9c18>
 1270fa4: aa1f03e1     	mov	x1, xzr
 1270fa8: 944945b3     	bl	0x24c2674 <__start_il2cpp+0x131aeb0>
 1270fac: b000be28     	adrp	x8, 0x2a35000
 1270fb0: 39414d08     	ldrb	w8, [x8, #0x53]
 1270fb4: 4ea01c0b     	mov	v11.16b, v0.16b
 1270fb8: 4ea11c2c     	mov	v12.16b, v1.16b
 1270fbc: 4ea21c4d     	mov	v13.16b, v2.16b
 1270fc0: 350000c8     	cbnz	w8, 0x1270fd8 <__start_il2cpp+0xc9814>
 1270fc4: d000af60     	adrp	x0, 0x285e000
 1270fc8: f9417800     	ldr	x0, [x0, #0x2f0]
 1270fcc: 97f93bc3     	bl	0x10bfed8 <CloseNLSocket+0x410>
 1270fd0: b000be28     	adrp	x8, 0x2a35000
 1270fd4: 39014d18     	strb	w24, [x8, #0x53]
 1270fd8: d000af68     	adrp	x8, 0x285e000
 1270fdc: f9417908     	ldr	x8, [x8, #0x2f0]
 1270fe0: f9400100     	ldr	x0, [x8]
 1270fe4: b940e008     	ldr	w8, [x0, #0xe0]
 1270fe8: 35000048     	cbnz	w8, 0x1270ff0 <__start_il2cpp+0xc982c>
 1270fec: 97f93bfd     	bl	0x10bffe0 <CloseNLSocket+0x518>
 1270ff0: 1e2b3900     	fsub	s0, s8, s11
 1270ff4: 1e2c3921     	fsub	s1, s9, s12
 1270ff8: 1e2d3942     	fsub	s2, s10, s13
 1270ffc: 1e200803     	fmul	s3, s0, s0
 1271000: 1e210824     	fmul	s4, s1, s1
 1271004: 1e242863     	fadd	s3, s3, s4
 1271008: 1e220844     	fmul	s4, s2, s2
 127100c: 1e232883     	fadd	s3, s4, s3
 1271010: bd400be4     	ldr	s4, [sp, #0x8]
 1271014: 1e21c063     	fsqrt	s3, s3
 1271018: 1e242060     	fcmp	s3, s4
 127101c: 540000ad     	b.le	0x1271030 <__start_il2cpp+0xc986c>
 1271020: 1e231800     	fdiv	s0, s0, s3
 1271024: 1e231821     	fdiv	s1, s1, s3
 1271028: 1e231842     	fdiv	s2, s2, s3
 127102c: 1400000f     	b	0x1271068 <__start_il2cpp+0xc98a4>
 1271030: f000be08     	adrp	x8, 0x2a34000
 1271034: 397e8108     	ldrb	w8, [x8, #0xfa0]
 1271038: 350000c8     	cbnz	w8, 0x1271050 <__start_il2cpp+0xc988c>
 127103c: 9000af60     	adrp	x0, 0x285d000
 1271040: f9474800     	ldr	x0, [x0, #0xe90]
 1271044: 97f93ba5     	bl	0x10bfed8 <CloseNLSocket+0x410>
 1271048: f000be08     	adrp	x8, 0x2a34000
 127104c: 393e8118     	strb	w24, [x8, #0xfa0]
 1271050: 9000af68     	adrp	x8, 0x285d000
 1271054: f9474908     	ldr	x8, [x8, #0xe90]
 1271058: f9400108     	ldr	x8, [x8]
 127105c: f9405d08     	ldr	x8, [x8, #0xb8]
 1271060: 2d400500     	ldp	s0, s1, [x8]
 1271064: bd400902     	ldr	s2, [x8, #0x8]
 1271068: 1e2e1003     	fmov	s3, #1.00000000
 127106c: 1e2f1863     	fdiv	s3, s3, s15
 1271070: 1e200860     	fmul	s0, s3, s0
 1271074: 1e210861     	fmul	s1, s3, s1
 1271078: 1e220862     	fmul	s2, s3, s2
 127107c: 1e2e0800     	fmul	s0, s0, s14
 1271080: 1e2e0821     	fmul	s1, s1, s14
 1271084: 1e2e0842     	fmul	s2, s2, s14
 1271088: aa1d03e0     	mov	x0, x29
 127108c: aa1f03e1     	mov	x1, xzr
 1271090: 9401be17     	bl	0x12e08ec <__start_il2cpp+0x139128>
 1271094: 1e251008     	fmov	s8, #12.00000000
 1271098: 390203b8     	strb	w24, [x29, #0x80]
 127109c: f9403abb     	ldr	x27, [x21, #0x70]
 12710a0: aa1d03e0     	mov	x0, x29
 12710a4: aa1f03e1     	mov	x1, xzr
 12710a8: 94491419     	bl	0x24b610c <__start_il2cpp+0x130e948>
 12710ac: b4001980     	cbz	x0, 0x12713dc <__start_il2cpp+0xc9c18>
 12710b0: aa1f03e1     	mov	x1, xzr
 12710b4: 94494570     	bl	0x24c2674 <__start_il2cpp+0x131aeb0>
 12710b8: b400193b     	cbz	x27, 0x12713dc <__start_il2cpp+0xc9c18>
 12710bc: aa1b03e0     	mov	x0, x27
 12710c0: 4ea81d03     	mov	v3.16b, v8.16b
 12710c4: aa1f03e1     	mov	x1, xzr
 12710c8: 9401bf33     	bl	0x12e0d94 <__start_il2cpp+0x1395d0>
 12710cc: 360004a0     	tbz	w0, #0x0, 0x1271160 <__start_il2cpp+0xc999c>
 12710d0: aa1d03e0     	mov	x0, x29
 12710d4: aa1f03e1     	mov	x1, xzr
 12710d8: 94009569     	bl	0x129667c <__start_il2cpp+0xeeeb8>
 12710dc: f9403aa0     	ldr	x0, [x21, #0x70]
 12710e0: b40017e0     	cbz	x0, 0x12713dc <__start_il2cpp+0xc9c18>
 12710e4: b9407fa1     	ldr	w1, [x29, #0x7c]
 12710e8: aa1f03e2     	mov	x2, xzr
 12710ec: 94009e68     	bl	0x1298a8c <__start_il2cpp+0xf12c8>
 12710f0: aa1d03e0     	mov	x0, x29
 12710f4: aa1f03e1     	mov	x1, xzr
 12710f8: 940093de     	bl	0x1296070 <__start_il2cpp+0xee8ac>
 12710fc: 360003c0     	tbz	w0, #0x0, 0x1271174 <__start_il2cpp+0xc99b0>
 1271100: f9403aa0     	ldr	x0, [x21, #0x70]
 1271104: b40016c0     	cbz	x0, 0x12713dc <__start_il2cpp+0xc9c18>
 1271108: 3945b008     	ldrb	w8, [x0, #0x16c]
 127110c: 35000068     	cbnz	w8, 0x1271118 <__start_il2cpp+0xc9954>
 1271110: 394a46a8     	ldrb	w8, [x21, #0x291]
 1271114: 34000f28     	cbz	w8, 0x12712f8 <__start_il2cpp+0xc9b34>
 1271118: b94152a8     	ldr	w8, [x21, #0x150]
 127111c: b9407ba9     	ldr	w9, [x29, #0x78]
 1271120: aa1f03e2     	mov	x2, xzr
 1271124: 7100093f     	cmp	w9, #0x2
 1271128: 1a98170a     	cinc	w10, w24, eq
 127112c: 71000d3f     	cmp	w9, #0x3
 1271130: 1a8a013b     	csel	w27, w9, w10, eq
 1271134: 1b087f61     	mul	w1, w27, w8
 1271138: 94009e5c     	bl	0x1298aa8 <__start_il2cpp+0xf12e4>
 127113c: f94052a0     	ldr	x0, [x21, #0xa0]
 1271140: b40014e0     	cbz	x0, 0x12713dc <__start_il2cpp+0xc9c18>
 1271144: 2a1b03e1     	mov	w1, w27
 1271148: aa1f03e2     	mov	x2, xzr
 127114c: 94013c18     	bl	0x12c01ac <__start_il2cpp+0x1189e8>
 1271150: f9412ea0     	ldr	x0, [x21, #0x258]
 1271154: b4001440     	cbz	x0, 0x12713dc <__start_il2cpp+0xc9c18>
 1271158: aa1f03e1     	mov	x1, xzr
 127115c: 9400919f     	bl	0x12957d8 <__start_il2cpp+0xee014>
 1271160: b9401b88     	ldr	w8, [x28, #0x18]
 1271164: 110006f7     	add	w23, w23, #0x1
 1271168: 6b0802ff     	cmp	w23, w8
 127116c: 54ffe88b     	b.lt	0x1270e7c <__start_il2cpp+0xc96b8>
 1271170: 14000064     	b	0x1271300 <__start_il2cpp+0xc9b3c>
 1271174: b9407ba8     	ldr	w8, [x29, #0x78]
 1271178: 51001108     	sub	w8, w8, #0x4
 127117c: 71000d1f     	cmp	w8, #0x3
 1271180: 54ffff08     	b.hi	0x1271160 <__start_il2cpp+0xc999c>
 1271184: d0ffa22b     	adrp	x11, 0x6b7000
 1271188: 9122816b     	add	x11, x11, #0x8a0
 127118c: 10000089     	adr	x9, 0x127119c <__start_il2cpp+0xc99d8>
 1271190: 3868696a     	ldrb	w10, [x11, x8]
 1271194: 8b0a0929     	add	x9, x9, x10, lsl #2
 1271198: d61f0120     	br	x9
 127119c: f9412ea0     	ldr	x0, [x21, #0x258]
 12711a0: b40011e0     	cbz	x0, 0x12713dc <__start_il2cpp+0xc9c18>
 12711a4: 1e2e1000     	fmov	s0, #1.00000000
 12711a8: 528000e1     	mov	w1, #0x7                // =7
 12711ac: aa1f03e2     	mov	x2, xzr
 12711b0: 94009103     	bl	0x12955bc <__start_il2cpp+0xeddf8>
 12711b4: f9403aa8     	ldr	x8, [x21, #0x70]
 12711b8: b4001128     	cbz	x8, 0x12713dc <__start_il2cpp+0xc9c18>
 12711bc: f940d500     	ldr	x0, [x8, #0x1a8]
 12711c0: b40010e0     	cbz	x0, 0x12713dc <__start_il2cpp+0xc9c18>
 12711c4: 52800021     	mov	w1, #0x1                // =1
 12711c8: aa1f03e2     	mov	x2, xzr
 12711cc: 94491131     	bl	0x24b5690 <__start_il2cpp+0x130decc>
 12711d0: f9403aa0     	ldr	x0, [x21, #0x70]
 12711d4: b4001040     	cbz	x0, 0x12713dc <__start_il2cpp+0xc9c18>
 12711d8: b94156a1     	ldr	w1, [x21, #0x154]
 12711dc: aa1f03e2     	mov	x2, xzr
 12711e0: 94009eb4     	bl	0x1298cb0 <__start_il2cpp+0xf14ec>
 12711e4: f94052a0     	ldr	x0, [x21, #0xa0]
 12711e8: b4000fa0     	cbz	x0, 0x12713dc <__start_il2cpp+0xc9c18>
 12711ec: 52800321     	mov	w1, #0x19               // =25
 12711f0: aa1f03e2     	mov	x2, xzr
 12711f4: 94013c6e     	bl	0x12c03ac <__start_il2cpp+0x118be8>
 12711f8: b94182a8     	ldr	w8, [x21, #0x180]
 12711fc: 11000508     	add	w8, w8, #0x1
 1271200: b90182a8     	str	w8, [x21, #0x180]
 1271204: 17ffffd7     	b	0x1271160 <__start_il2cpp+0xc999c>
 1271208: f9412ea0     	ldr	x0, [x21, #0x258]
 127120c: 3905b2b8     	strb	w24, [x21, #0x16c]
 1271210: b4000e60     	cbz	x0, 0x12713dc <__start_il2cpp+0xc9c18>
 1271214: 1e2e1000     	fmov	s0, #1.00000000
 1271218: 52800041     	mov	w1, #0x2                // =2
 127121c: aa1f03e2     	mov	x2, xzr
 1271220: 940090e7     	bl	0x12955bc <__start_il2cpp+0xeddf8>
 1271224: f9403aa8     	ldr	x8, [x21, #0x70]
 1271228: b4000da8     	cbz	x8, 0x12713dc <__start_il2cpp+0xc9c18>
 127122c: f940d500     	ldr	x0, [x8, #0x1a8]
 1271230: b4000d60     	cbz	x0, 0x12713dc <__start_il2cpp+0xc9c18>
 1271234: 52800021     	mov	w1, #0x1                // =1
 1271238: aa1f03e2     	mov	x2, xzr
 127123c: 94491115     	bl	0x24b5690 <__start_il2cpp+0x130decc>
 1271240: f9403aa0     	ldr	x0, [x21, #0x70]
 1271244: b4000cc0     	cbz	x0, 0x12713dc <__start_il2cpp+0xc9c18>
 1271248: bd415ea0     	ldr	s0, [x21, #0x15c]
 127124c: aa1f03e1     	mov	x1, xzr
 1271250: 94009e75     	bl	0x1298c24 <__start_il2cpp+0xf1460>
 1271254: b9417ea8     	ldr	w8, [x21, #0x17c]
 1271258: 11000508     	add	w8, w8, #0x1
 127125c: b9017ea8     	str	w8, [x21, #0x17c]
 1271260: 17ffffc0     	b	0x1271160 <__start_il2cpp+0xc999c>
 1271264: f9412ea0     	ldr	x0, [x21, #0x258]
 1271268: 3905b2b8     	strb	w24, [x21, #0x16c]
 127126c: b4000b80     	cbz	x0, 0x12713dc <__start_il2cpp+0xc9c18>
 1271270: 1e2e1000     	fmov	s0, #1.00000000
 1271274: 52800041     	mov	w1, #0x2                // =2
 1271278: aa1f03e2     	mov	x2, xzr
 127127c: 940090d0     	bl	0x12955bc <__start_il2cpp+0xeddf8>
 1271280: f9403aa8     	ldr	x8, [x21, #0x70]
 1271284: b4000ac8     	cbz	x8, 0x12713dc <__start_il2cpp+0xc9c18>
 1271288: f940d500     	ldr	x0, [x8, #0x1a8]
 127128c: b4000a80     	cbz	x0, 0x12713dc <__start_il2cpp+0xc9c18>
 1271290: 52800021     	mov	w1, #0x1                // =1
 1271294: aa1f03e2     	mov	x2, xzr
 1271298: 944910fe     	bl	0x24b5690 <__start_il2cpp+0x130decc>
 127129c: f9403aa0     	ldr	x0, [x21, #0x70]
 12712a0: b40009e0     	cbz	x0, 0x12713dc <__start_il2cpp+0xc9c18>
 12712a4: bd415aa0     	ldr	s0, [x21, #0x158]
 12712a8: aa1f03e1     	mov	x1, xzr
 12712ac: 94009e7c     	bl	0x1298c9c <__start_il2cpp+0xf14d8>
 12712b0: b94176a8     	ldr	w8, [x21, #0x174]
 12712b4: 11000508     	add	w8, w8, #0x1
 12712b8: b90176a8     	str	w8, [x21, #0x174]
 12712bc: 17ffffa9     	b	0x1271160 <__start_il2cpp+0xc999c>
 12712c0: f9412ea0     	ldr	x0, [x21, #0x258]
 12712c4: b40008c0     	cbz	x0, 0x12713dc <__start_il2cpp+0xc9c18>
 12712c8: 1e2e1000     	fmov	s0, #1.00000000
 12712cc: 52800041     	mov	w1, #0x2                // =2
 12712d0: aa1f03e2     	mov	x2, xzr
 12712d4: 940090ba     	bl	0x12955bc <__start_il2cpp+0xeddf8>
 12712d8: bd4162a0     	ldr	s0, [x21, #0x160]
 12712dc: aa1503e0     	mov	x0, x21
 12712e0: 2a1f03e1     	mov	w1, wzr
 12712e4: 94000522     	bl	0x127276c <__start_il2cpp+0xcafa8>
 12712e8: b9417aa8     	ldr	w8, [x21, #0x178]
 12712ec: 11000508     	add	w8, w8, #0x1
 12712f0: b9017aa8     	str	w8, [x21, #0x178]
 12712f4: 17ffff9b     	b	0x1271160 <__start_il2cpp+0xc999c>
 12712f8: 52800028     	mov	w8, #0x1                // =1
 12712fc: 17ffff88     	b	0x127111c <__start_il2cpp+0xc9958>
 1271300: 51000673     	sub	w19, w19, #0x1
 1271304: 7100067f     	cmp	w19, #0x1
 1271308: 5400052b     	b.lt	0x12713ac <__start_il2cpp+0xc9be8>
 127130c: 7100073f     	cmp	w25, #0x1
 1271310: 1a9f17e8     	cset	w8, eq
 1271314: 520002d7     	eor	w23, w22, #0x1
 1271318: 0a170108     	and	w8, w8, w23
 127131c: 37000168     	tbnz	w8, #0x0, 0x1271348 <__start_il2cpp+0xc9b84>
 1271320: f9402a81     	ldr	x1, [x20, #0x50]
 1271324: 52800062     	mov	w2, #0x3                // =3
 1271328: aa1503e0     	mov	x0, x21
 127132c: 2a1f03e3     	mov	w3, wzr
 1271330: 2a1303e4     	mov	w4, w19
 1271334: 97fffe91     	bl	0x1270d78 <__start_il2cpp+0xc95b4>
 1271338: 71000b3f     	cmp	w25, #0x2
 127133c: 1a9f17e8     	cset	w8, eq
 1271340: 0a170108     	and	w8, w8, w23
 1271344: 37000168     	tbnz	w8, #0x0, 0x1271370 <__start_il2cpp+0xc9bac>
 1271348: f9402e81     	ldr	x1, [x20, #0x58]
 127134c: 52800082     	mov	w2, #0x4                // =4
 1271350: aa1503e0     	mov	x0, x21
 1271354: 2a1f03e3     	mov	w3, wzr
 1271358: 2a1303e4     	mov	w4, w19
 127135c: 97fffe87     	bl	0x1270d78 <__start_il2cpp+0xc95b4>
 1271360: 71000f3f     	cmp	w25, #0x3
 1271364: 1a9f17e8     	cset	w8, eq
 1271368: 0a170108     	and	w8, w8, w23
 127136c: 37000188     	tbnz	w8, #0x0, 0x127139c <__start_il2cpp+0xc9bd8>
 1271370: f9403681     	ldr	x1, [x20, #0x68]
 1271374: 52800022     	mov	w2, #0x1                // =1
 1271378: aa1503e0     	mov	x0, x21
 127137c: 2a1f03e3     	mov	w3, wzr
 1271380: 2a1303e4     	mov	w4, w19
 1271384: 97fffe7d     	bl	0x1270d78 <__start_il2cpp+0xc95b4>
 1271388: 7100133f     	cmp	w25, #0x4
 127138c: 1a9f17e8     	cset	w8, eq
 1271390: 520002c9     	eor	w9, w22, #0x1
 1271394: 0a090108     	and	w8, w8, w9
 1271398: 370000a8     	tbnz	w8, #0x0, 0x12713ac <__start_il2cpp+0xc9be8>
 127139c: f9403294     	ldr	x20, [x20, #0x60]
 12713a0: 2a1f03f6     	mov	w22, wzr
 12713a4: 52800059     	mov	w25, #0x2               // =2
 12713a8: 17fffe8f     	b	0x1270de4 <__start_il2cpp+0xc9620>
 12713ac: a94a4ff4     	ldp	x20, x19, [sp, #0xa0]
 12713b0: a94957f6     	ldp	x22, x21, [sp, #0x90]
 12713b4: a9485ff8     	ldp	x24, x23, [sp, #0x80]
 12713b8: a94767fa     	ldp	x26, x25, [sp, #0x70]
 12713bc: a9466ffc     	ldp	x28, x27, [sp, #0x60]
 12713c0: a9457bfd     	ldp	x29, x30, [sp, #0x50]
 12713c4: 6d4423e9     	ldp	d9, d8, [sp, #0x40]
 12713c8: 6d432beb     	ldp	d11, d10, [sp, #0x30]
 12713cc: 6d4233ed     	ldp	d13, d12, [sp, #0x20]
 12713d0: 6d413bef     	ldp	d15, d14, [sp, #0x10]
 12713d4: 9102c3ff     	add	sp, sp, #0xb0
 12713d8: d65f03c0     	ret
 12713dc: 97f93b49     	bl	0x10c0100 <CloseNLSocket+0x638>
 12713e0: 97f93b4a     	bl	0x10c0108 <CloseNLSocket+0x640>
