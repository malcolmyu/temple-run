
/tmp/temple-libil2cpp.so:	file format elf64-littleaarch64

Disassembly of section il2cpp:

00000000011a77c4 <__start_il2cpp>:
 12f6160: 6db923e9     	stp	d9, d8, [sp, #-0x70]!
 12f6164: f9000bfe     	str	x30, [sp, #0x10]
 12f6168: a9026ffc     	stp	x28, x27, [sp, #0x20]
 12f616c: a90367fa     	stp	x26, x25, [sp, #0x30]
 12f6170: a9045ff8     	stp	x24, x23, [sp, #0x40]
 12f6174: a90557f6     	stp	x22, x21, [sp, #0x50]
 12f6178: a9064ff4     	stp	x20, x19, [sp, #0x60]
 12f617c: f000b9f6     	adrp	x22, 0x2a35000
 12f6180: 396ef2c8     	ldrb	w8, [x22, #0xbbc]
 12f6184: 2a0203f5     	mov	w21, w2
 12f6188: aa0103f4     	mov	x20, x1
 12f618c: aa0003f3     	mov	x19, x0
 12f6190: 37000128     	tbnz	w8, #0x0, 0x12f61b4 <__start_il2cpp+0x14e9f0>
 12f6194: d000ab20     	adrp	x0, 0x285c000 <_ZTVN10__cxxabiv119__pointer_type_infoE+0x18>
 12f6198: f9456000     	ldr	x0, [x0, #0xac0]
 12f619c: 97f7274f     	bl	0x10bfed8 <CloseNLSocket+0x410>
 12f61a0: 9000ab80     	adrp	x0, 0x2866000
 12f61a4: f9440800     	ldr	x0, [x0, #0x810]
 12f61a8: 97f7274c     	bl	0x10bfed8 <CloseNLSocket+0x410>
 12f61ac: 52800028     	mov	w8, #0x1                // =1
 12f61b0: 392ef2c8     	strb	w8, [x22, #0xbbc]
 12f61b4: aa1f03e0     	mov	x0, xzr
 12f61b8: 94467b45     	bl	0x2494ecc <__start_il2cpp+0x12ed708>
 12f61bc: b4001da0     	cbz	x0, 0x12f6570 <__start_il2cpp+0x14edac>
 12f61c0: aa1f03e1     	mov	x1, xzr
 12f61c4: 9446ffd2     	bl	0x24b610c <__start_il2cpp+0x130e948>
 12f61c8: b4001d40     	cbz	x0, 0x12f6570 <__start_il2cpp+0x14edac>
 12f61cc: aa1f03e1     	mov	x1, xzr
 12f61d0: 94473129     	bl	0x24c2674 <__start_il2cpp+0x131aeb0>
 12f61d4: 52a84e08     	mov	w8, #0x42700000         // =1114636288
 12f61d8: 1e270101     	fmov	s1, w8
 12f61dc: 52aff00a     	mov	w10, #0x7f800000        // =2139095040
 12f61e0: 1e211800     	fdiv	s0, s0, s1
 12f61e4: 52800789     	mov	w9, #0x3c               // =60
 12f61e8: 1e270141     	fmov	s1, w10
 12f61ec: 1e380008     	fcvtzs	w8, s0
 12f61f0: 1b097d08     	mul	w8, w8, w9
 12f61f4: 1e212000     	fcmp	s0, s1
 12f61f8: 1a8803e8     	csel	w8, wzr, w8, eq
 12f61fc: aa1f03e0     	mov	x0, xzr
 12f6200: b9004a68     	str	w8, [x19, #0x48]
 12f6204: 94467b32     	bl	0x2494ecc <__start_il2cpp+0x12ed708>
 12f6208: b4001b40     	cbz	x0, 0x12f6570 <__start_il2cpp+0x14edac>
 12f620c: aa1f03e1     	mov	x1, xzr
 12f6210: 9446ffbf     	bl	0x24b610c <__start_il2cpp+0x130e948>
 12f6214: b4001ae0     	cbz	x0, 0x12f6570 <__start_il2cpp+0x14edac>
 12f6218: aa1f03e1     	mov	x1, xzr
 12f621c: 94473116     	bl	0x24c2674 <__start_il2cpp+0x131aeb0>
 12f6220: 52a84e09     	mov	w9, #0x42700000         // =1114636288
 12f6224: b9404a68     	ldr	w8, [x19, #0x48]
 12f6228: b9402a6c     	ldr	w12, [x19, #0x28]
 12f622c: 1e270120     	fmov	s0, w9
 12f6230: 52aff00b     	mov	w11, #0x7f800000        // =2139095040
 12f6234: 1e201840     	fdiv	s0, s2, s0
 12f6238: 5280078a     	mov	w10, #0x3c              // =60
 12f623c: 1e270161     	fmov	s1, w11
 12f6240: 1e380009     	fcvtzs	w9, s0
 12f6244: 1e212000     	fcmp	s0, s1
 12f6248: 1b0a7d29     	mul	w9, w9, w10
 12f624c: 1a8903e9     	csel	w9, wzr, w9, eq
 12f6250: 6b0c011f     	cmp	w8, w12
 12f6254: b9004e69     	str	w9, [x19, #0x4c]
 12f6258: 540000a1     	b.ne	0x12f626c <__start_il2cpp+0x14eaa8>
 12f625c: b9402e6a     	ldr	w10, [x19, #0x2c]
 12f6260: 6b0a013f     	cmp	w9, w10
 12f6264: 1a9f07ea     	cset	w10, ne
 12f6268: 14000002     	b	0x12f6270 <__start_il2cpp+0x14eaac>
 12f626c: 5280002a     	mov	w10, #0x1               // =1
 12f6270: 120002ab     	and	w11, w21, #0x1
 12f6274: 2a0b014a     	orr	w10, w10, w11
 12f6278: 340016aa     	cbz	w10, 0x12f654c <__start_il2cpp+0x14ed88>
 12f627c: d000ab35     	adrp	x21, 0x285c000 <_ZTVN10__cxxabiv119__pointer_type_infoE+0x18>
 12f6280: 9000ab96     	adrp	x22, 0x2866000
 12f6284: f94562b5     	ldr	x21, [x21, #0xac0]
 12f6288: f9440ad6     	ldr	x22, [x22, #0x810]
 12f628c: 29052668     	stp	w8, w9, [x19, #0x28]
 12f6290: 5108710a     	sub	w10, w8, #0x21c
 12f6294: 5108712b     	sub	w11, w9, #0x21c
 12f6298: 11087108     	add	w8, w8, #0x21c
 12f629c: 11087129     	add	w9, w9, #0x21c
 12f62a0: aa1303e0     	mov	x0, x19
 12f62a4: 290a2e6a     	stp	w10, w11, [x19, #0x50]
 12f62a8: 290b2668     	stp	w8, w9, [x19, #0x58]
 12f62ac: 940002c0     	bl	0x12f6dac <__start_il2cpp+0x14f5e8>
 12f62b0: 52800023     	mov	w3, #0x1                // =1
 12f62b4: aa1303e0     	mov	x0, x19
 12f62b8: aa1403e1     	mov	x1, x20
 12f62bc: 2a1f03e2     	mov	w2, wzr
 12f62c0: 94000403     	bl	0x12f72cc <__start_il2cpp+0x14fb08>
 12f62c4: 2a1f03e8     	mov	w8, wzr
 12f62c8: b9001fff     	str	wzr, [sp, #0x1c]
 12f62cc: f9401e69     	ldr	x9, [x19, #0x38]
 12f62d0: b4001509     	cbz	x9, 0x12f6570 <__start_il2cpp+0x14edac>
 12f62d4: b940192a     	ldr	w10, [x9, #0x18]
 12f62d8: 6b0a011f     	cmp	w8, w10
 12f62dc: 54001482     	b.hs	0x12f656c <__start_il2cpp+0x14eda8>
 12f62e0: f94002a0     	ldr	x0, [x21]
 12f62e4: 8b28cd28     	add	x8, x9, w8, sxtw #3
 12f62e8: f9401114     	ldr	x20, [x8, #0x20]
 12f62ec: b940e009     	ldr	w9, [x0, #0xe0]
 12f62f0: 35000049     	cbnz	w9, 0x12f62f8 <__start_il2cpp+0x14eb34>
 12f62f4: 97f7273b     	bl	0x10bffe0 <CloseNLSocket+0x518>
 12f62f8: aa1403e0     	mov	x0, x20
 12f62fc: aa1f03e1     	mov	x1, xzr
 12f6300: aa1f03e2     	mov	x2, xzr
 12f6304: 94470c65     	bl	0x24b9498 <__start_il2cpp+0x1311cd4>
 12f6308: 36000160     	tbz	w0, #0x0, 0x12f6334 <__start_il2cpp+0x14eb70>
 12f630c: 910073e0     	add	x0, sp, #0x1c
 12f6310: aa1f03e1     	mov	x1, xzr
 12f6314: 942eb000     	bl	0x1ea2314 <__start_il2cpp+0xcfab50>
 12f6318: f94002c8     	ldr	x8, [x22]
 12f631c: aa0003e1     	mov	x1, x0
 12f6320: aa1f03e2     	mov	x2, xzr
 12f6324: aa0803e0     	mov	x0, x8
 12f6328: 942912dd     	bl	0x1d3ae9c <__start_il2cpp+0xb936d8>
 12f632c: aa1303e1     	mov	x1, x19
 12f6330: 94000285     	bl	0x12f6d44 <__start_il2cpp+0x14f580>
 12f6334: b40011f4     	cbz	x20, 0x12f6570 <__start_il2cpp+0x14edac>
 12f6338: 3940b288     	ldrb	w8, [x20, #0x2c]
 12f633c: 34000328     	cbz	w8, 0x12f63a0 <__start_il2cpp+0x14ebdc>
 12f6340: bd405261     	ldr	s1, [x19, #0x50]
 12f6344: bd402280     	ldr	s0, [x20, #0x20]
 12f6348: 5e21d821     	scvtf	s1, s1
 12f634c: 1e212000     	fcmp	s0, s1
 12f6350: 54000224     	b.mi	0x12f6394 <__start_il2cpp+0x14ebd0>
 12f6354: bd405a61     	ldr	s1, [x19, #0x58]
 12f6358: 5e21d821     	scvtf	s1, s1
 12f635c: 1e212000     	fcmp	s0, s1
 12f6360: 540001ac     	b.gt	0x12f6394 <__start_il2cpp+0x14ebd0>
 12f6364: bd405662     	ldr	s2, [x19, #0x54]
 12f6368: bd402681     	ldr	s1, [x20, #0x24]
 12f636c: 5e21d842     	scvtf	s2, s2
 12f6370: 1e222020     	fcmp	s1, s2
 12f6374: 54000104     	b.mi	0x12f6394 <__start_il2cpp+0x14ebd0>
 12f6378: bd405e62     	ldr	s2, [x19, #0x5c]
 12f637c: 5e21d842     	scvtf	s2, s2
 12f6380: 1e222020     	fcmp	s1, s2
 12f6384: 5400008c     	b.gt	0x12f6394 <__start_il2cpp+0x14ebd0>
 12f6388: aa1303e0     	mov	x0, x19
 12f638c: 940002d7     	bl	0x12f6ee8 <__start_il2cpp+0x14f724>
 12f6390: 36000080     	tbz	w0, #0x0, 0x12f63a0 <__start_il2cpp+0x14ebdc>
 12f6394: aa1403e0     	mov	x0, x20
 12f6398: 3900b29f     	strb	wzr, [x20, #0x2c]
 12f639c: 9400008a     	bl	0x12f65c4 <__start_il2cpp+0x14ee00>
 12f63a0: b9401fe8     	ldr	w8, [sp, #0x1c]
 12f63a4: 11000508     	add	w8, w8, #0x1
 12f63a8: 7105a51f     	cmp	w8, #0x169
 12f63ac: b9001fe8     	str	w8, [sp, #0x1c]
 12f63b0: 54fff8eb     	b.lt	0x12f62cc <__start_il2cpp+0x14eb08>
 12f63b4: 2a1f03f7     	mov	w23, wzr
 12f63b8: 52800798     	mov	w24, #0x3c              // =60
 12f63bc: 52800039     	mov	w25, #0x1               // =1
 12f63c0: 52a88f5a     	mov	w26, #0x447a0000        // =1148846080
 12f63c4: 2a1f03fb     	mov	w27, wzr
 12f63c8: 1b187efc     	mul	w28, w23, w24
 12f63cc: f9401e6a     	ldr	x10, [x19, #0x38]
 12f63d0: b4000d0a     	cbz	x10, 0x12f6570 <__start_il2cpp+0x14edac>
 12f63d4: 294a326b     	ldp	w11, w12, [x19, #0x50]
 12f63d8: b9401949     	ldr	w9, [x10, #0x18]
 12f63dc: aa1f03e8     	mov	x8, xzr
 12f63e0: 9100814a     	add	x10, x10, #0x20
 12f63e4: 0b1c0174     	add	w20, w11, w28
 12f63e8: 1b183375     	madd	w21, w27, w24, w12
 12f63ec: 1e220288     	scvtf	s8, w20
 12f63f0: 1e2202a9     	scvtf	s9, w21
 12f63f4: eb09011f     	cmp	x8, x9
 12f63f8: 54000ba2     	b.hs	0x12f656c <__start_il2cpp+0x14eda8>
 12f63fc: f868794b     	ldr	x11, [x10, x8, lsl #3]
 12f6400: b4000b8b     	cbz	x11, 0x12f6570 <__start_il2cpp+0x14edac>
 12f6404: 3940b16c     	ldrb	w12, [x11, #0x2c]
 12f6408: 340000ec     	cbz	w12, 0x12f6424 <__start_il2cpp+0x14ec60>
 12f640c: bd402160     	ldr	s0, [x11, #0x20]
 12f6410: 1e282000     	fcmp	s0, s8
 12f6414: 54000081     	b.ne	0x12f6424 <__start_il2cpp+0x14ec60>
 12f6418: bd402560     	ldr	s0, [x11, #0x24]
 12f641c: 1e292000     	fcmp	s0, s9
 12f6420: 540008a0     	b.eq	0x12f6534 <__start_il2cpp+0x14ed70>
 12f6424: 91000508     	add	x8, x8, #0x1
 12f6428: f105a51f     	cmp	x8, #0x169
 12f642c: 54fffe41     	b.ne	0x12f63f4 <__start_il2cpp+0x14ec30>
 12f6430: aa1303e0     	mov	x0, x19
 12f6434: 4ea81d00     	mov	v0.16b, v8.16b
 12f6438: 4ea91d21     	mov	v1.16b, v9.16b
 12f643c: 940002ab     	bl	0x12f6ee8 <__start_il2cpp+0x14f724>
 12f6440: 370007a0     	tbnz	w0, #0x0, 0x12f6534 <__start_il2cpp+0x14ed70>
 12f6444: 7103c2bf     	cmp	w21, #0xf0
 12f6448: 54000088     	b.hi	0x12f6458 <__start_il2cpp+0x14ec94>
 12f644c: 1100f288     	add	w8, w20, #0x3c
 12f6450: 7101e51f     	cmp	w8, #0x79
 12f6454: 54000703     	b.lo	0x12f6534 <__start_il2cpp+0x14ed70>
 12f6458: f9401e6a     	ldr	x10, [x19, #0x38]
 12f645c: b40008aa     	cbz	x10, 0x12f6570 <__start_il2cpp+0x14edac>
 12f6460: b9401949     	ldr	w9, [x10, #0x18]
 12f6464: aa1f03e8     	mov	x8, xzr
 12f6468: 9100814a     	add	x10, x10, #0x20
 12f646c: eb09011f     	cmp	x8, x9
 12f6470: 540007e2     	b.hs	0x12f656c <__start_il2cpp+0x14eda8>
 12f6474: f8687954     	ldr	x20, [x10, x8, lsl #3]
 12f6478: b40007d4     	cbz	x20, 0x12f6570 <__start_il2cpp+0x14edac>
 12f647c: 3940b28b     	ldrb	w11, [x20, #0x2c]
 12f6480: 340000ab     	cbz	w11, 0x12f6494 <__start_il2cpp+0x14ecd0>
 12f6484: 91000508     	add	x8, x8, #0x1
 12f6488: f105a51f     	cmp	x8, #0x169
 12f648c: 54ffff01     	b.ne	0x12f646c <__start_il2cpp+0x14eca8>
 12f6490: 14000029     	b	0x12f6534 <__start_il2cpp+0x14ed70>
 12f6494: aa1403e0     	mov	x0, x20
 12f6498: aa1f03e1     	mov	x1, xzr
 12f649c: 3900b299     	strb	w25, [x20, #0x2c]
 12f64a0: 2d042688     	stp	s8, s9, [x20, #0x20]
 12f64a4: 9446ff1a     	bl	0x24b610c <__start_il2cpp+0x130e948>
 12f64a8: aa0003f5     	mov	x21, x0
 12f64ac: 528002a1     	mov	w1, #0x15               // =21
 12f64b0: 2a1f03e0     	mov	w0, wzr
 12f64b4: aa1f03e2     	mov	x2, xzr
 12f64b8: 9446f68c     	bl	0x24b3ee8 <__start_il2cpp+0x130c724>
 12f64bc: 2a0003f6     	mov	w22, w0
 12f64c0: 528002a1     	mov	w1, #0x15               // =21
 12f64c4: 2a1f03e0     	mov	w0, wzr
 12f64c8: aa1f03e2     	mov	x2, xzr
 12f64cc: 9446f687     	bl	0x24b3ee8 <__start_il2cpp+0x130c724>
 12f64d0: b4000515     	cbz	x21, 0x12f6570 <__start_il2cpp+0x14edac>
 12f64d4: 51002808     	sub	w8, w0, #0xa
 12f64d8: 51002ac9     	sub	w9, w22, #0xa
 12f64dc: 1e220100     	scvtf	s0, w8
 12f64e0: 1e220121     	scvtf	s1, w9
 12f64e4: 1e202922     	fadd	s2, s9, s0
 12f64e8: 1e212900     	fadd	s0, s8, s1
 12f64ec: 1e2703e1     	fmov	s1, wzr
 12f64f0: aa1503e0     	mov	x0, x21
 12f64f4: aa1f03e1     	mov	x1, xzr
 12f64f8: 94473087     	bl	0x24c2714 <__start_il2cpp+0x131af50>
 12f64fc: 52807d01     	mov	w1, #0x3e8              // =1000
 12f6500: 2a1f03e0     	mov	w0, wzr
 12f6504: aa1f03e2     	mov	x2, xzr
 12f6508: 9446f678     	bl	0x24b3ee8 <__start_il2cpp+0x130c724>
 12f650c: bd403260     	ldr	s0, [x19, #0x30]
 12f6510: 1e220001     	scvtf	s1, w0
 12f6514: 1e270342     	fmov	s2, w26
 12f6518: 1e221821     	fdiv	s1, s1, s2
 12f651c: aa1403e0     	mov	x0, x20
 12f6520: 1e202020     	fcmp	s1, s0
 12f6524: 54000065     	b.pl	0x12f6530 <__start_il2cpp+0x14ed6c>
 12f6528: 9400001e     	bl	0x12f65a0 <__start_il2cpp+0x14eddc>
 12f652c: 14000002     	b	0x12f6534 <__start_il2cpp+0x14ed70>
 12f6530: 94000025     	bl	0x12f65c4 <__start_il2cpp+0x14ee00>
 12f6534: 1100077b     	add	w27, w27, #0x1
 12f6538: 71004f7f     	cmp	w27, #0x13
 12f653c: 54fff481     	b.ne	0x12f63cc <__start_il2cpp+0x14ec08>
 12f6540: 110006f7     	add	w23, w23, #0x1
 12f6544: 71004eff     	cmp	w23, #0x13
 12f6548: 54fff3e1     	b.ne	0x12f63c4 <__start_il2cpp+0x14ec00>
 12f654c: a9464ff4     	ldp	x20, x19, [sp, #0x60]
 12f6550: a94557f6     	ldp	x22, x21, [sp, #0x50]
 12f6554: a9445ff8     	ldp	x24, x23, [sp, #0x40]
 12f6558: a94367fa     	ldp	x26, x25, [sp, #0x30]
 12f655c: a9426ffc     	ldp	x28, x27, [sp, #0x20]
 12f6560: f9400bfe     	ldr	x30, [sp, #0x10]
 12f6564: 6cc723e9     	ldp	d9, d8, [sp], #0x70
 12f6568: d65f03c0     	ret
 12f656c: 97f726e7     	bl	0x10c0108 <CloseNLSocket+0x640>
 12f6570: 97f726e4     	bl	0x10c0100 <CloseNLSocket+0x638>
