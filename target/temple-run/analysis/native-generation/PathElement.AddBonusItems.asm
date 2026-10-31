
/tmp/temple-libil2cpp.so:	file format elf64-littleaarch64

Disassembly of section il2cpp:

00000000011a77c4 <__start_il2cpp>:
 12e5f14: d10103ff     	sub	sp, sp, #0x40
 12e5f18: fd000be8     	str	d8, [sp, #0x10]
 12e5f1c: f9000ffe     	str	x30, [sp, #0x18]
 12e5f20: a90257f6     	stp	x22, x21, [sp, #0x20]
 12e5f24: a9034ff4     	stp	x20, x19, [sp, #0x30]
 12e5f28: 9000ba95     	adrp	x21, 0x2a35000
 12e5f2c: f000abb6     	adrp	x22, 0x285c000 <_ZTVN10__cxxabiv119__pointer_type_infoE+0x18>
 12e5f30: 396cbaa8     	ldrb	w8, [x21, #0xb2e]
 12e5f34: f94562d6     	ldr	x22, [x22, #0xac0]
 12e5f38: aa0203f4     	mov	x20, x2
 12e5f3c: aa0003f3     	mov	x19, x0
 12e5f40: 370002a8     	tbnz	w8, #0x0, 0x12e5f94 <__start_il2cpp+0x13e7d0>
 12e5f44: b000ac00     	adrp	x0, 0x2866000
 12e5f48: f9415000     	ldr	x0, [x0, #0x2a0]
 12e5f4c: 97f767e3     	bl	0x10bfed8 <CloseNLSocket+0x410>
 12e5f50: d000abe0     	adrp	x0, 0x2863000
 12e5f54: f9467400     	ldr	x0, [x0, #0xce8]
 12e5f58: 97f767e0     	bl	0x10bfed8 <CloseNLSocket+0x410>
 12e5f5c: f000aba0     	adrp	x0, 0x285c000 <_ZTVN10__cxxabiv119__pointer_type_infoE+0x18>
 12e5f60: f9456000     	ldr	x0, [x0, #0xac0]
 12e5f64: 97f767dd     	bl	0x10bfed8 <CloseNLSocket+0x410>
 12e5f68: b000abe0     	adrp	x0, 0x2862000
 12e5f6c: f9424800     	ldr	x0, [x0, #0x490]
 12e5f70: 97f767da     	bl	0x10bfed8 <CloseNLSocket+0x410>
 12e5f74: b000ac00     	adrp	x0, 0x2866000
 12e5f78: f9415400     	ldr	x0, [x0, #0x2a8]
 12e5f7c: 97f767d7     	bl	0x10bfed8 <CloseNLSocket+0x410>
 12e5f80: d000abc0     	adrp	x0, 0x285f000
 12e5f84: f943d000     	ldr	x0, [x0, #0x7a0]
 12e5f88: 97f767d4     	bl	0x10bfed8 <CloseNLSocket+0x410>
 12e5f8c: 52800028     	mov	w8, #0x1                // =1
 12e5f90: 392cbaa8     	strb	w8, [x21, #0xb2e]
 12e5f94: f94002c0     	ldr	x0, [x22]
 12e5f98: b940e008     	ldr	w8, [x0, #0xe0]
 12e5f9c: 35000048     	cbnz	w8, 0x12e5fa4 <__start_il2cpp+0x13e7e0>
 12e5fa0: 97f76810     	bl	0x10bffe0 <CloseNLSocket+0x518>
 12e5fa4: aa1403e0     	mov	x0, x20
 12e5fa8: aa1f03e1     	mov	x1, xzr
 12e5fac: aa1f03e2     	mov	x2, xzr
 12e5fb0: 94474d3a     	bl	0x24b9498 <__start_il2cpp+0x1311cd4>
 12e5fb4: 37001620     	tbnz	w0, #0x0, 0x12e6278 <__start_il2cpp+0x13eab4>
 12e5fb8: b000abf6     	adrp	x22, 0x2862000
 12e5fbc: f9424ad6     	ldr	x22, [x22, #0x490]
 12e5fc0: f94002c0     	ldr	x0, [x22]
 12e5fc4: b940e008     	ldr	w8, [x0, #0xe0]
 12e5fc8: 35000068     	cbnz	w8, 0x12e5fd4 <__start_il2cpp+0x13e810>
 12e5fcc: 97f76805     	bl	0x10bffe0 <CloseNLSocket+0x518>
 12e5fd0: f94002c0     	ldr	x0, [x22]
 12e5fd4: f9405c08     	ldr	x8, [x0, #0xb8]
 12e5fd8: 39401509     	ldrb	w9, [x8, #0x5]
 12e5fdc: 340014e9     	cbz	w9, 0x12e6278 <__start_il2cpp+0x13eab4>
 12e5fe0: b4001b14     	cbz	x20, 0x12e6340 <__start_il2cpp+0x13eb7c>
 12e5fe4: b940e009     	ldr	w9, [x0, #0xe0]
 12e5fe8: b9407695     	ldr	w21, [x20, #0x74]
 12e5fec: 35000089     	cbnz	w9, 0x12e5ffc <__start_il2cpp+0x13e838>
 12e5ff0: 97f767fc     	bl	0x10bffe0 <CloseNLSocket+0x518>
 12e5ff4: f94002c8     	ldr	x8, [x22]
 12e5ff8: f9405d08     	ldr	x8, [x8, #0xb8]
 12e5ffc: b9401908     	ldr	w8, [x8, #0x18]
 12e6000: 6b0802bf     	cmp	w21, w8
 12e6004: 540013ad     	b.le	0x12e6278 <__start_il2cpp+0x13eab4>
 12e6008: b9403a88     	ldr	w8, [x20, #0x38]
 12e600c: 7100151f     	cmp	w8, #0x5
 12e6010: 54001340     	b.eq	0x12e6278 <__start_il2cpp+0x13eab4>
 12e6014: 3940f668     	ldrb	w8, [x19, #0x3d]
 12e6018: 35001308     	cbnz	w8, 0x12e6278 <__start_il2cpp+0x13eab4>
 12e601c: 3940fa68     	ldrb	w8, [x19, #0x3e]
 12e6020: 350012c8     	cbnz	w8, 0x12e6278 <__start_il2cpp+0x13eab4>
 12e6024: b9407a88     	ldr	w8, [x20, #0x78]
 12e6028: 71000d1f     	cmp	w8, #0x3
 12e602c: 5400126b     	b.lt	0x12e6278 <__start_il2cpp+0x13eab4>
 12e6030: aa1303e0     	mov	x0, x19
 12e6034: 97fff21f     	bl	0x12e28b0 <__start_il2cpp+0x13b0ec>
 12e6038: 37001200     	tbnz	w0, #0x0, 0x12e6278 <__start_il2cpp+0x13eab4>
 12e603c: b9403688     	ldr	w8, [x20, #0x34]
 12e6040: b9403669     	ldr	w9, [x19, #0x34]
 12e6044: 1e2703e1     	fmov	s1, wzr
 12e6048: 1e25d002     	fmov	s2, #15.00000000
 12e604c: 71000d1f     	cmp	w8, #0x3
 12e6050: 1e35d003     	fmov	s3, #-15.00000000
 12e6054: 1e210c40     	fcsel	s0, s2, s1, eq
 12e6058: 7100051f     	cmp	w8, #0x1
 12e605c: 1e200c60     	fcsel	s0, s3, s0, eq
 12e6060: 71000d3f     	cmp	w9, #0x3
 12e6064: 1e210c41     	fcsel	s1, s2, s1, eq
 12e6068: 7100053f     	cmp	w9, #0x1
 12e606c: 1e210c61     	fcsel	s1, s3, s1, eq
 12e6070: 1e212000     	fcmp	s0, s1
 12e6074: 54001024     	b.mi	0x12e6278 <__start_il2cpp+0x13eab4>
 12e6078: b9403a6a     	ldr	w10, [x19, #0x38]
 12e607c: 7100155f     	cmp	w10, #0x5
 12e6080: 54000fc0     	b.eq	0x12e6278 <__start_il2cpp+0x13eab4>
 12e6084: 52a8418b     	mov	w11, #0x420c0000        // =1108082688
 12e6088: 1e270164     	fmov	s4, w11
 12e608c: 9000ac0b     	adrp	x11, 0x2866000
 12e6090: f941516b     	ldr	x11, [x11, #0x2a0]
 12e6094: 71000d3f     	cmp	w9, #0x3
 12e6098: 1e269002     	fmov	s2, #20.00000000
 12e609c: 1e229003     	fmov	s3, #5.00000000
 12e60a0: 1e220c85     	fcsel	s5, s4, s2, eq
 12e60a4: 7100053f     	cmp	w9, #0x1
 12e60a8: 1e250c65     	fcsel	s5, s3, s5, eq
 12e60ac: 71000d1f     	cmp	w8, #0x3
 12e60b0: f9400160     	ldr	x0, [x11]
 12e60b4: 1e220c82     	fcsel	s2, s4, s2, eq
 12e60b8: 7100051f     	cmp	w8, #0x1
 12e60bc: 1e220c62     	fcsel	s2, s3, s2, eq
 12e60c0: 1e212000     	fcmp	s0, s1
 12e60c4: 1e25cc40     	fcsel	s0, s2, s5, gt
 12e60c8: 7100195f     	cmp	w10, #0x6
 12e60cc: 1e232801     	fadd	s1, s0, s3
 12e60d0: 528000c1     	mov	w1, #0x6                // =6
 12e60d4: 1e200c28     	fcsel	s8, s1, s0, eq
 12e60d8: b9000fff     	str	wzr, [sp, #0xc]
 12e60dc: 97f7679d     	bl	0x10bff50 <CloseNLSocket+0x488>
 12e60e0: f94002c8     	ldr	x8, [x22]
 12e60e4: aa0003f4     	mov	x20, x0
 12e60e8: b940e109     	ldr	w9, [x8, #0xe0]
 12e60ec: 35000089     	cbnz	w9, 0x12e60fc <__start_il2cpp+0x13e938>
 12e60f0: aa0803e0     	mov	x0, x8
 12e60f4: 97f767bb     	bl	0x10bffe0 <CloseNLSocket+0x518>
 12e60f8: f94002c8     	ldr	x8, [x22]
 12e60fc: f9405d09     	ldr	x9, [x8, #0xb8]
 12e6100: bd401d20     	ldr	s0, [x9, #0x1c]
 12e6104: 1e202008     	fcmp	s0, #0.0
 12e6108: 5400014d     	b.le	0x12e6130 <__start_il2cpp+0x13e96c>
 12e610c: b40011b4     	cbz	x20, 0x12e6340 <__start_il2cpp+0x13eb7c>
 12e6110: b9401a8a     	ldr	w10, [x20, #0x18]
 12e6114: 3400118a     	cbz	w10, 0x12e6344 <__start_il2cpp+0x13eb80>
 12e6118: 5280008a     	mov	w10, #0x4               // =4
 12e611c: b900228a     	str	w10, [x20, #0x20]
 12e6120: b9400fea     	ldr	w10, [sp, #0xc]
 12e6124: 11000555     	add	w21, w10, #0x1
 12e6128: b9000ff5     	str	w21, [sp, #0xc]
 12e612c: 14000002     	b	0x12e6134 <__start_il2cpp+0x13e970>
 12e6130: 2a1f03f5     	mov	w21, wzr
 12e6134: b940e10a     	ldr	w10, [x8, #0xe0]
 12e6138: 350000aa     	cbnz	w10, 0x12e614c <__start_il2cpp+0x13e988>
 12e613c: aa0803e0     	mov	x0, x8
 12e6140: 97f767a8     	bl	0x10bffe0 <CloseNLSocket+0x518>
 12e6144: f94002c8     	ldr	x8, [x22]
 12e6148: f9405d09     	ldr	x9, [x8, #0xb8]
 12e614c: bd402120     	ldr	s0, [x9, #0x20]
 12e6150: 1e202008     	fcmp	s0, #0.0
 12e6154: 5400016d     	b.le	0x12e6180 <__start_il2cpp+0x13e9bc>
 12e6158: b4000f54     	cbz	x20, 0x12e6340 <__start_il2cpp+0x13eb7c>
 12e615c: b9401a8a     	ldr	w10, [x20, #0x18]
 12e6160: 6b0a02bf     	cmp	w21, w10
 12e6164: 54000f02     	b.hs	0x12e6344 <__start_il2cpp+0x13eb80>
 12e6168: 8b35ca8a     	add	x10, x20, w21, sxtw #2
 12e616c: 528000ab     	mov	w11, #0x5               // =5
 12e6170: b900214b     	str	w11, [x10, #0x20]
 12e6174: b9400fea     	ldr	w10, [sp, #0xc]
 12e6178: 11000555     	add	w21, w10, #0x1
 12e617c: b9000ff5     	str	w21, [sp, #0xc]
 12e6180: b940e10a     	ldr	w10, [x8, #0xe0]
 12e6184: 350000aa     	cbnz	w10, 0x12e6198 <__start_il2cpp+0x13e9d4>
 12e6188: aa0803e0     	mov	x0, x8
 12e618c: 97f76795     	bl	0x10bffe0 <CloseNLSocket+0x518>
 12e6190: f94002c8     	ldr	x8, [x22]
 12e6194: f9405d09     	ldr	x9, [x8, #0xb8]
 12e6198: bd402520     	ldr	s0, [x9, #0x24]
 12e619c: 1e202008     	fcmp	s0, #0.0
 12e61a0: 5400016d     	b.le	0x12e61cc <__start_il2cpp+0x13ea08>
 12e61a4: b4000cf4     	cbz	x20, 0x12e6340 <__start_il2cpp+0x13eb7c>
 12e61a8: b9401a8a     	ldr	w10, [x20, #0x18]
 12e61ac: 6b0a02bf     	cmp	w21, w10
 12e61b0: 54000ca2     	b.hs	0x12e6344 <__start_il2cpp+0x13eb80>
 12e61b4: 8b35ca8a     	add	x10, x20, w21, sxtw #2
 12e61b8: 528000cb     	mov	w11, #0x6               // =6
 12e61bc: b900214b     	str	w11, [x10, #0x20]
 12e61c0: b9400fea     	ldr	w10, [sp, #0xc]
 12e61c4: 11000555     	add	w21, w10, #0x1
 12e61c8: b9000ff5     	str	w21, [sp, #0xc]
 12e61cc: b940e10a     	ldr	w10, [x8, #0xe0]
 12e61d0: 350000aa     	cbnz	w10, 0x12e61e4 <__start_il2cpp+0x13ea20>
 12e61d4: aa0803e0     	mov	x0, x8
 12e61d8: 97f76782     	bl	0x10bffe0 <CloseNLSocket+0x518>
 12e61dc: f94002c8     	ldr	x8, [x22]
 12e61e0: f9405d09     	ldr	x9, [x8, #0xb8]
 12e61e4: bd402920     	ldr	s0, [x9, #0x28]
 12e61e8: 1e202008     	fcmp	s0, #0.0
 12e61ec: 5400016d     	b.le	0x12e6218 <__start_il2cpp+0x13ea54>
 12e61f0: b4000a94     	cbz	x20, 0x12e6340 <__start_il2cpp+0x13eb7c>
 12e61f4: b9401a88     	ldr	w8, [x20, #0x18]
 12e61f8: 6b0802bf     	cmp	w21, w8
 12e61fc: 54000a42     	b.hs	0x12e6344 <__start_il2cpp+0x13eb80>
 12e6200: 8b35ca88     	add	x8, x20, w21, sxtw #2
 12e6204: 528000e9     	mov	w9, #0x7                // =7
 12e6208: b9002109     	str	w9, [x8, #0x20]
 12e620c: b9400fe8     	ldr	w8, [sp, #0xc]
 12e6210: 11000515     	add	w21, w8, #0x1
 12e6214: b9000ff5     	str	w21, [sp, #0xc]
 12e6218: 710006bf     	cmp	w21, #0x1
 12e621c: 540000cb     	b.lt	0x12e6234 <__start_il2cpp+0x13ea70>
 12e6220: 52800041     	mov	w1, #0x2                // =2
 12e6224: 2a1f03e0     	mov	w0, wzr
 12e6228: aa1f03e2     	mov	x2, xzr
 12e622c: 9447372f     	bl	0x24b3ee8 <__start_il2cpp+0x130c724>
 12e6230: 34000300     	cbz	w0, 0x12e6290 <__start_il2cpp+0x13eacc>
 12e6234: 910033e0     	add	x0, sp, #0xc
 12e6238: aa1f03e1     	mov	x1, xzr
 12e623c: 942ef036     	bl	0x1ea2314 <__start_il2cpp+0xcfab50>
 12e6240: 9000ac08     	adrp	x8, 0x2866000
 12e6244: f9415508     	ldr	x8, [x8, #0x2a8]
 12e6248: b000abc9     	adrp	x9, 0x285f000
 12e624c: f943d129     	ldr	x9, [x9, #0x7a0]
 12e6250: aa0003e1     	mov	x1, x0
 12e6254: f9400108     	ldr	x8, [x8]
 12e6258: aa1f03e3     	mov	x3, xzr
 12e625c: f9400122     	ldr	x2, [x9]
 12e6260: aa0803e0     	mov	x0, x8
 12e6264: 942976fb     	bl	0x1d43e50 <__start_il2cpp+0xb9c68c>
 12e6268: aa1f03e1     	mov	x1, xzr
 12e626c: 940044d8     	bl	0x12f75cc <__start_il2cpp+0x14fe08>
 12e6270: 52800028     	mov	w8, #0x1                // =1
 12e6274: 3900fe68     	strb	w8, [x19, #0x3f]
 12e6278: a9434ff4     	ldp	x20, x19, [sp, #0x30]
 12e627c: a94257f6     	ldp	x22, x21, [sp, #0x20]
 12e6280: f9400ffe     	ldr	x30, [sp, #0x18]
 12e6284: fd400be8     	ldr	d8, [sp, #0x10]
 12e6288: 910103ff     	add	sp, sp, #0x40
 12e628c: d65f03c0     	ret
 12e6290: 2a1503e1     	mov	w1, w21
 12e6294: aa1f03e2     	mov	x2, xzr
 12e6298: 94473714     	bl	0x24b3ee8 <__start_il2cpp+0x130c724>
 12e629c: b4000534     	cbz	x20, 0x12e6340 <__start_il2cpp+0x13eb7c>
 12e62a0: b9401a88     	ldr	w8, [x20, #0x18]
 12e62a4: 6b08001f     	cmp	w0, w8
 12e62a8: 540004e2     	b.hs	0x12e6344 <__start_il2cpp+0x13eb80>
 12e62ac: 8b20ca88     	add	x8, x20, w0, sxtw #2
 12e62b0: b9402114     	ldr	w20, [x8, #0x20]
 12e62b4: 34fffc14     	cbz	w20, 0x12e6234 <__start_il2cpp+0x13ea70>
 12e62b8: b000abe8     	adrp	x8, 0x2863000
 12e62bc: f9467508     	ldr	x8, [x8, #0xce8]
 12e62c0: f9400100     	ldr	x0, [x8]
 12e62c4: b940e008     	ldr	w8, [x0, #0xe0]
 12e62c8: 35000048     	cbnz	w8, 0x12e62d0 <__start_il2cpp+0x13eb0c>
 12e62cc: 97f76745     	bl	0x10bffe0 <CloseNLSocket+0x518>
 12e62d0: 2a1403e0     	mov	w0, w20
 12e62d4: aa1f03e1     	mov	x1, xzr
 12e62d8: 97febf6b     	bl	0x1296084 <__start_il2cpp+0xee8c0>
 12e62dc: b4000320     	cbz	x0, 0x12e6340 <__start_il2cpp+0x13eb7c>
 12e62e0: aa1f03e1     	mov	x1, xzr
 12e62e4: aa0003f4     	mov	x20, x0
 12e62e8: 94473f89     	bl	0x24b610c <__start_il2cpp+0x130e948>
 12e62ec: aa0003f5     	mov	x21, x0
 12e62f0: aa1303e0     	mov	x0, x19
 12e62f4: aa1f03e1     	mov	x1, xzr
 12e62f8: 94473f85     	bl	0x24b610c <__start_il2cpp+0x130e948>
 12e62fc: b4000235     	cbz	x21, 0x12e6340 <__start_il2cpp+0x13eb7c>
 12e6300: aa0003e1     	mov	x1, x0
 12e6304: aa1503e0     	mov	x0, x21
 12e6308: aa1f03e2     	mov	x2, xzr
 12e630c: 944772ce     	bl	0x24c2e44 <__start_il2cpp+0x131b680>
 12e6310: aa1403e0     	mov	x0, x20
 12e6314: aa1f03e1     	mov	x1, xzr
 12e6318: 94473f7d     	bl	0x24b610c <__start_il2cpp+0x130e948>
 12e631c: b4000120     	cbz	x0, 0x12e6340 <__start_il2cpp+0x13eb7c>
 12e6320: 1e2703e0     	fmov	s0, wzr
 12e6324: 1e2703e2     	fmov	s2, wzr
 12e6328: 4ea81d01     	mov	v1.16b, v8.16b
 12e632c: aa1f03e1     	mov	x1, xzr
 12e6330: 94476ebe     	bl	0x24c1e28 <__start_il2cpp+0x131a664>
 12e6334: 52800028     	mov	w8, #0x1                // =1
 12e6338: 3900fa68     	strb	w8, [x19, #0x3e]
 12e633c: 17ffffcf     	b	0x12e6278 <__start_il2cpp+0x13eab4>
 12e6340: 97f76770     	bl	0x10c0100 <CloseNLSocket+0x638>
 12e6344: 97f76771     	bl	0x10c0108 <CloseNLSocket+0x640>
