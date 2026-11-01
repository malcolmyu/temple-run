
/tmp/temple-libil2cpp.so:	file format elf64-littleaarch64

Disassembly of section il2cpp:

00000000011a77c4 <__start_il2cpp>:
 126f378: 6dba33ed     	stp	d13, d12, [sp, #-0x60]!
 126f37c: 6d012beb     	stp	d11, d10, [sp, #0x10]
 126f380: 6d0223e9     	stp	d9, d8, [sp, #0x20]
 126f384: a9035ffe     	stp	x30, x23, [sp, #0x30]
 126f388: a90457f6     	stp	x22, x21, [sp, #0x40]
 126f38c: a9054ff4     	stp	x20, x19, [sp, #0x50]
 126f390: d000be34     	adrp	x20, 0x2a35000
 126f394: 395d4a88     	ldrb	w8, [x20, #0x752]
 126f398: aa0003f3     	mov	x19, x0
 126f39c: 370001e8     	tbnz	w8, #0x0, 0x126f3d8 <__start_il2cpp+0xc7c14>
 126f3a0: f000af60     	adrp	x0, 0x285e000
 126f3a4: f9414000     	ldr	x0, [x0, #0x280]
 126f3a8: 97f942cc     	bl	0x10bfed8 <CloseNLSocket+0x410>
 126f3ac: b000af60     	adrp	x0, 0x285c000 <_ZTVN10__cxxabiv119__pointer_type_infoE+0x18>
 126f3b0: f9456000     	ldr	x0, [x0, #0xac0]
 126f3b4: 97f942c9     	bl	0x10bfed8 <CloseNLSocket+0x410>
 126f3b8: f000af80     	adrp	x0, 0x2862000
 126f3bc: f9435000     	ldr	x0, [x0, #0x6a0]
 126f3c0: 97f942c6     	bl	0x10bfed8 <CloseNLSocket+0x410>
 126f3c4: f000af80     	adrp	x0, 0x2862000
 126f3c8: f9435400     	ldr	x0, [x0, #0x6a8]
 126f3cc: 97f942c3     	bl	0x10bfed8 <CloseNLSocket+0x410>
 126f3d0: 52800028     	mov	w8, #0x1                // =1
 126f3d4: 391d4a88     	strb	w8, [x20, #0x752]
 126f3d8: aa1303f5     	mov	x21, x19
 126f3dc: f8470ea8     	ldr	x8, [x21, #0x70]!
 126f3e0: b4004888     	cbz	x8, 0x126fcf0 <__start_il2cpp+0xc852c>
 126f3e4: 39436108     	ldrb	w8, [x8, #0xd8]
 126f3e8: 35004608     	cbnz	w8, 0x126fca8 <__start_il2cpp+0xc84e4>
 126f3ec: b000af76     	adrp	x22, 0x285c000 <_ZTVN10__cxxabiv119__pointer_type_infoE+0x18>
 126f3f0: f94562d6     	ldr	x22, [x22, #0xac0]
 126f3f4: f9404674     	ldr	x20, [x19, #0x88]
 126f3f8: f94002c0     	ldr	x0, [x22]
 126f3fc: b940e008     	ldr	w8, [x0, #0xe0]
 126f400: 35000048     	cbnz	w8, 0x126f408 <__start_il2cpp+0xc7c44>
 126f404: 97f942f7     	bl	0x10bffe0 <CloseNLSocket+0x518>
 126f408: aa1403e0     	mov	x0, x20
 126f40c: aa1f03e1     	mov	x1, xzr
 126f410: aa1f03e2     	mov	x2, xzr
 126f414: 94492821     	bl	0x24b9498 <__start_il2cpp+0x1311cd4>
 126f418: 37004480     	tbnz	w0, #0x0, 0x126fca8 <__start_il2cpp+0xc84e4>
 126f41c: f000af97     	adrp	x23, 0x2862000
 126f420: f94352f7     	ldr	x23, [x23, #0x6a0]
 126f424: f94002c0     	ldr	x0, [x22]
 126f428: f94002e8     	ldr	x8, [x23]
 126f42c: b940e009     	ldr	w9, [x0, #0xe0]
 126f430: f9405d08     	ldr	x8, [x8, #0xb8]
 126f434: f9400114     	ldr	x20, [x8]
 126f438: 35000049     	cbnz	w9, 0x126f440 <__start_il2cpp+0xc7c7c>
 126f43c: 97f942e9     	bl	0x10bffe0 <CloseNLSocket+0x518>
 126f440: aa1403e0     	mov	x0, x20
 126f444: aa1f03e1     	mov	x1, xzr
 126f448: aa1f03e2     	mov	x2, xzr
 126f44c: 944924ff     	bl	0x24b8848 <__start_il2cpp+0x1311084>
 126f450: 360002a0     	tbz	w0, #0x0, 0x126f4a4 <__start_il2cpp+0xc7ce0>
 126f454: f94002e8     	ldr	x8, [x23]
 126f458: f9405d08     	ldr	x8, [x8, #0xb8]
 126f45c: f9400108     	ldr	x8, [x8]
 126f460: b4004488     	cbz	x8, 0x126fcf0 <__start_il2cpp+0xc852c>
 126f464: 39419109     	ldrb	w9, [x8, #0x64]
 126f468: 340001e9     	cbz	w9, 0x126f4a4 <__start_il2cpp+0xc7ce0>
 126f46c: b9406909     	ldr	w9, [x8, #0x68]
 126f470: f94002a8     	ldr	x8, [x21]
 126f474: 7100053f     	cmp	w9, #0x1
 126f478: 54000081     	b.ne	0x126f488 <__start_il2cpp+0xc7cc4>
 126f47c: b40043a8     	cbz	x8, 0x126fcf0 <__start_il2cpp+0xc852c>
 126f480: 52b81809     	mov	w9, #-0x3f400000        // =-1061158912
 126f484: 14000007     	b	0x126f4a0 <__start_il2cpp+0xc7cdc>
 126f488: b4004348     	cbz	x8, 0x126fcf0 <__start_il2cpp+0xc852c>
 126f48c: 3100053f     	cmn	w9, #0x1
 126f490: 54000060     	b.eq	0x126f49c <__start_il2cpp+0xc7cd8>
 126f494: b901911f     	str	wzr, [x8, #0x190]
 126f498: 14000003     	b	0x126f4a4 <__start_il2cpp+0xc7ce0>
 126f49c: 52a81809     	mov	w9, #0x40c00000         // =1086324736
 126f4a0: b9019109     	str	w9, [x8, #0x190]
 126f4a4: f94002a0     	ldr	x0, [x21]
 126f4a8: b4004240     	cbz	x0, 0x126fcf0 <__start_il2cpp+0xc852c>
 126f4ac: bd40340a     	ldr	s10, [x0, #0x34]
 126f4b0: bd403c0b     	ldr	s11, [x0, #0x3c]
 126f4b4: aa1f03e1     	mov	x1, xzr
 126f4b8: 94491b15     	bl	0x24b610c <__start_il2cpp+0x130e948>
 126f4bc: b40041a0     	cbz	x0, 0x126fcf0 <__start_il2cpp+0xc852c>
 126f4c0: aa1f03e1     	mov	x1, xzr
 126f4c4: 94494d62     	bl	0x24c2a4c <__start_il2cpp+0x131b288>
 126f4c8: f94002a0     	ldr	x0, [x21]
 126f4cc: b4004120     	cbz	x0, 0x126fcf0 <__start_il2cpp+0xc852c>
 126f4d0: aa1f03e1     	mov	x1, xzr
 126f4d4: 4ea01c08     	mov	v8.16b, v0.16b
 126f4d8: 94491b0d     	bl	0x24b610c <__start_il2cpp+0x130e948>
 126f4dc: b40040a0     	cbz	x0, 0x126fcf0 <__start_il2cpp+0xc852c>
 126f4e0: aa1f03e1     	mov	x1, xzr
 126f4e4: 94494d5a     	bl	0x24c2a4c <__start_il2cpp+0x131b288>
 126f4e8: d000be34     	adrp	x20, 0x2a35000
 126f4ec: 39413e88     	ldrb	w8, [x20, #0x4f]
 126f4f0: 4ea21c49     	mov	v9.16b, v2.16b
 126f4f4: 350000c8     	cbnz	w8, 0x126f50c <__start_il2cpp+0xc7d48>
 126f4f8: f000af60     	adrp	x0, 0x285e000
 126f4fc: f9417800     	ldr	x0, [x0, #0x2f0]
 126f500: 97f94276     	bl	0x10bfed8 <CloseNLSocket+0x410>
 126f504: 52800028     	mov	w8, #0x1                // =1
 126f508: 39013e88     	strb	w8, [x20, #0x4f]
 126f50c: f000af76     	adrp	x22, 0x285e000
 126f510: f9417ad6     	ldr	x22, [x22, #0x2f0]
 126f514: f94002c0     	ldr	x0, [x22]
 126f518: b940e008     	ldr	w8, [x0, #0xe0]
 126f51c: 35000048     	cbnz	w8, 0x126f524 <__start_il2cpp+0xc7d60>
 126f520: 97f942b0     	bl	0x10bffe0 <CloseNLSocket+0x518>
 126f524: 90ffa148     	adrp	x8, 0x697000
 126f528: bd45cd0d     	ldr	s13, [x8, #0x5cc]
 126f52c: 1e280900     	fmul	s0, s8, s8
 126f530: 1e290921     	fmul	s1, s9, s9
 126f534: 1e212800     	fadd	s0, s0, s1
 126f538: 1e21c000     	fsqrt	s0, s0
 126f53c: 1e2d2000     	fcmp	s0, s13
 126f540: 5400008d     	b.le	0x126f550 <__start_il2cpp+0xc7d8c>
 126f544: 1e201908     	fdiv	s8, s8, s0
 126f548: 1e201929     	fdiv	s9, s9, s0
 126f54c: 1400000e     	b	0x126f584 <__start_il2cpp+0xc7dc0>
 126f550: d000be34     	adrp	x20, 0x2a35000
 126f554: 39413a88     	ldrb	w8, [x20, #0x4e]
 126f558: 350000c8     	cbnz	w8, 0x126f570 <__start_il2cpp+0xc7dac>
 126f55c: f000af60     	adrp	x0, 0x285e000
 126f560: f942b400     	ldr	x0, [x0, #0x568]
 126f564: 97f9425d     	bl	0x10bfed8 <CloseNLSocket+0x410>
 126f568: 52800028     	mov	w8, #0x1                // =1
 126f56c: 39013a88     	strb	w8, [x20, #0x4e]
 126f570: f000af68     	adrp	x8, 0x285e000
 126f574: f942b508     	ldr	x8, [x8, #0x568]
 126f578: f9400108     	ldr	x8, [x8]
 126f57c: f9405d08     	ldr	x8, [x8, #0xb8]
 126f580: 2d402508     	ldp	s8, s9, [x8]
 126f584: f94002a0     	ldr	x0, [x21]
 126f588: b4003b40     	cbz	x0, 0x126fcf0 <__start_il2cpp+0xc852c>
 126f58c: aa1f03e1     	mov	x1, xzr
 126f590: 94491adf     	bl	0x24b610c <__start_il2cpp+0x130e948>
 126f594: b4003ae0     	cbz	x0, 0x126fcf0 <__start_il2cpp+0xc852c>
 126f598: aa1f03e1     	mov	x1, xzr
 126f59c: 94494d2c     	bl	0x24c2a4c <__start_il2cpp+0x131b288>
 126f5a0: f94002a0     	ldr	x0, [x21]
 126f5a4: b4003a60     	cbz	x0, 0x126fcf0 <__start_il2cpp+0xc852c>
 126f5a8: 1e280943     	fmul	s3, s10, s8
 126f5ac: 1e290964     	fmul	s4, s11, s9
 126f5b0: 1e242863     	fadd	s3, s3, s4
 126f5b4: 1e214063     	fneg	s3, s3
 126f5b8: 1e249005     	fmov	s5, #10.00000000
 126f5bc: 1e230842     	fmul	s2, s2, s3
 126f5c0: 1e230821     	fmul	s1, s1, s3
 126f5c4: 1e230800     	fmul	s0, s0, s3
 126f5c8: 1e250842     	fmul	s2, s2, s5
 126f5cc: 1e250821     	fmul	s1, s1, s5
 126f5d0: 1e250800     	fmul	s0, s0, s5
 126f5d4: aa1f03e1     	mov	x1, xzr
 126f5d8: 9401c4c5     	bl	0x12e08ec <__start_il2cpp+0x139128>
 126f5dc: f94002a8     	ldr	x8, [x21]
 126f5e0: b4003888     	cbz	x8, 0x126fcf0 <__start_il2cpp+0xc852c>
 126f5e4: 3945d108     	ldrb	w8, [x8, #0x174]
 126f5e8: 35000168     	cbnz	w8, 0x126f614 <__start_il2cpp+0xc7e50>
 126f5ec: 394a4668     	ldrb	w8, [x19, #0x291]
 126f5f0: 35000128     	cbnz	w8, 0x126f614 <__start_il2cpp+0xc7e50>
 126f5f4: f000af68     	adrp	x8, 0x285e000
 126f5f8: f9414108     	ldr	x8, [x8, #0x280]
 126f5fc: f9400100     	ldr	x0, [x8]
 126f600: b940e008     	ldr	w8, [x0, #0xe0]
 126f604: 35000048     	cbnz	w8, 0x126f60c <__start_il2cpp+0xc7e48>
 126f608: 97f94276     	bl	0x10bffe0 <CloseNLSocket+0x518>
 126f60c: 94000dda     	bl	0x1272d74 <__start_il2cpp+0xcb5b0>
 126f610: 37000260     	tbnz	w0, #0x0, 0x126f65c <__start_il2cpp+0xc7e98>
 126f614: f9404668     	ldr	x8, [x19, #0x88]
 126f618: b40036c8     	cbz	x8, 0x126fcf0 <__start_il2cpp+0xc852c>
 126f61c: b9403508     	ldr	w8, [x8, #0x34]
 126f620: 71000d1f     	cmp	w8, #0x3
 126f624: 540001c1     	b.ne	0x126f65c <__start_il2cpp+0xc7e98>
 126f628: f94002a8     	ldr	x8, [x21]
 126f62c: b4003628     	cbz	x8, 0x126fcf0 <__start_il2cpp+0xc852c>
 126f630: bd419100     	ldr	s0, [x8, #0x190]
 126f634: 1e231001     	fmov	s1, #6.00000000
 126f638: 1e212000     	fcmp	s0, s1
 126f63c: 540000ca     	b.ge	0x126f654 <__start_il2cpp+0xc7e90>
 126f640: 1e331001     	fmov	s1, #-6.00000000
 126f644: 1e212000     	fcmp	s0, s1
 126f648: 540000a8     	b.hi	0x126f65c <__start_il2cpp+0xc7e98>
 126f64c: 52b81809     	mov	w9, #-0x3f400000        // =-1061158912
 126f650: 14000002     	b	0x126f658 <__start_il2cpp+0xc7e94>
 126f654: 52a81809     	mov	w9, #0x40c00000         // =1086324736
 126f658: b9019109     	str	w9, [x8, #0x190]
 126f65c: aa1f03e0     	mov	x0, xzr
 126f660: 94493f7c     	bl	0x24bf450 <__start_il2cpp+0x1317c8c>
 126f664: f000af88     	adrp	x8, 0x2862000
 126f668: f9435508     	ldr	x8, [x8, #0x6a8]
 126f66c: f9400108     	ldr	x8, [x8]
 126f670: f9405d08     	ldr	x8, [x8, #0xb8]
 126f674: f9400108     	ldr	x8, [x8]
 126f678: b40033c8     	cbz	x8, 0x126fcf0 <__start_il2cpp+0xc852c>
 126f67c: f94002a0     	ldr	x0, [x21]
 126f680: b4003380     	cbz	x0, 0x126fcf0 <__start_il2cpp+0xc852c>
 126f684: 3943c009     	ldrb	w9, [x0, #0xf0]
 126f688: 35001c09     	cbnz	w9, 0x126fa08 <__start_il2cpp+0xc8244>
 126f68c: bd40610b     	ldr	s11, [x8, #0x60]
 126f690: aa1f03e1     	mov	x1, xzr
 126f694: 4ea01c08     	mov	v8.16b, v0.16b
 126f698: 94491a9d     	bl	0x24b610c <__start_il2cpp+0x130e948>
 126f69c: b40032a0     	cbz	x0, 0x126fcf0 <__start_il2cpp+0xc852c>
 126f6a0: aa1f03e1     	mov	x1, xzr
 126f6a4: 94494cea     	bl	0x24c2a4c <__start_il2cpp+0x131b288>
 126f6a8: f94002a0     	ldr	x0, [x21]
 126f6ac: b4003220     	cbz	x0, 0x126fcf0 <__start_il2cpp+0xc852c>
 126f6b0: aa1f03e1     	mov	x1, xzr
 126f6b4: 4ea01c09     	mov	v9.16b, v0.16b
 126f6b8: 94491a95     	bl	0x24b610c <__start_il2cpp+0x130e948>
 126f6bc: b40031a0     	cbz	x0, 0x126fcf0 <__start_il2cpp+0xc852c>
 126f6c0: aa1f03e1     	mov	x1, xzr
 126f6c4: 94494ce2     	bl	0x24c2a4c <__start_il2cpp+0x131b288>
 126f6c8: f9404660     	ldr	x0, [x19, #0x88]
 126f6cc: b4003120     	cbz	x0, 0x126fcf0 <__start_il2cpp+0xc852c>
 126f6d0: aa1f03e1     	mov	x1, xzr
 126f6d4: 4ea21c4a     	mov	v10.16b, v2.16b
 126f6d8: 94491a8d     	bl	0x24b610c <__start_il2cpp+0x130e948>
 126f6dc: b40030a0     	cbz	x0, 0x126fcf0 <__start_il2cpp+0xc852c>
 126f6e0: 90ffa148     	adrp	x8, 0x697000
 126f6e4: bd461d02     	ldr	s2, [x8, #0x61c]
 126f6e8: 1e2f9000     	fmov	s0, #1.75000000
 126f6ec: 52a84909     	mov	w9, #0x42480000         // =1112014848
 126f6f0: 1e2a1001     	fmov	s1, #0.25000000
 126f6f4: 1e200960     	fmul	s0, s11, s0
 126f6f8: 1e270123     	fmov	s3, w9
 126f6fc: 1e212800     	fadd	s0, s0, s1
 126f700: 1e225901     	fmin	s1, s8, s2
 126f704: 1e230821     	fmul	s1, s1, s3
 126f708: aa1f03e1     	mov	x1, xzr
 126f70c: 1e20c129     	fabs	s9, s9
 126f710: 1e20082b     	fmul	s11, s1, s0
 126f714: 1e20c14a     	fabs	s10, s10
 126f718: 94494bd7     	bl	0x24c2674 <__start_il2cpp+0x131aeb0>
 126f71c: 1e2a2120     	fcmp	s9, s10
 126f720: 54000bcd     	b.le	0x126f898 <__start_il2cpp+0xc80d4>
 126f724: f94002a0     	ldr	x0, [x21]
 126f728: b4002e40     	cbz	x0, 0x126fcf0 <__start_il2cpp+0xc852c>
 126f72c: bd41900a     	ldr	s10, [x0, #0x190]
 126f730: aa1f03e1     	mov	x1, xzr
 126f734: 4ea01c08     	mov	v8.16b, v0.16b
 126f738: 94491a75     	bl	0x24b610c <__start_il2cpp+0x130e948>
 126f73c: b4002da0     	cbz	x0, 0x126fcf0 <__start_il2cpp+0xc852c>
 126f740: aa1f03e1     	mov	x1, xzr
 126f744: 94494d00     	bl	0x24c2b44 <__start_il2cpp+0x131b380>
 126f748: f94002a0     	ldr	x0, [x21]
 126f74c: b4002d20     	cbz	x0, 0x126fcf0 <__start_il2cpp+0xc852c>
 126f750: aa1f03e1     	mov	x1, xzr
 126f754: 4ea21c49     	mov	v9.16b, v2.16b
 126f758: 94491a6d     	bl	0x24b610c <__start_il2cpp+0x130e948>
 126f75c: b4002ca0     	cbz	x0, 0x126fcf0 <__start_il2cpp+0xc852c>
 126f760: aa1f03e1     	mov	x1, xzr
 126f764: 94494bc4     	bl	0x24c2674 <__start_il2cpp+0x131aeb0>
 126f768: f94002a8     	ldr	x8, [x21]
 126f76c: b4002c28     	cbz	x8, 0x126fcf0 <__start_il2cpp+0xc852c>
 126f770: 3945d108     	ldrb	w8, [x8, #0x174]
 126f774: 1e290941     	fmul	s1, s10, s9
 126f778: 1e213901     	fsub	s1, s8, s1
 126f77c: 1e203829     	fsub	s9, s1, s0
 126f780: 35000168     	cbnz	w8, 0x126f7ac <__start_il2cpp+0xc7fe8>
 126f784: 394a4668     	ldrb	w8, [x19, #0x291]
 126f788: 35000128     	cbnz	w8, 0x126f7ac <__start_il2cpp+0xc7fe8>
 126f78c: f000af68     	adrp	x8, 0x285e000
 126f790: f9414108     	ldr	x8, [x8, #0x280]
 126f794: f9400100     	ldr	x0, [x8]
 126f798: b940e008     	ldr	w8, [x0, #0xe0]
 126f79c: 35000048     	cbnz	w8, 0x126f7a4 <__start_il2cpp+0xc7fe0>
 126f7a0: 97f94210     	bl	0x10bffe0 <CloseNLSocket+0x518>
 126f7a4: 94000d74     	bl	0x1272d74 <__start_il2cpp+0xcb5b0>
 126f7a8: 37000220     	tbnz	w0, #0x0, 0x126f7ec <__start_il2cpp+0xc8028>
 126f7ac: f9404668     	ldr	x8, [x19, #0x88]
 126f7b0: b4002a08     	cbz	x8, 0x126fcf0 <__start_il2cpp+0xc852c>
 126f7b4: b9403508     	ldr	w8, [x8, #0x34]
 126f7b8: 71000d1f     	cmp	w8, #0x3
 126f7bc: 54000181     	b.ne	0x126f7ec <__start_il2cpp+0xc8028>
 126f7c0: f94002a0     	ldr	x0, [x21]
 126f7c4: b4002960     	cbz	x0, 0x126fcf0 <__start_il2cpp+0xc852c>
 126f7c8: aa1f03e1     	mov	x1, xzr
 126f7cc: 94491a50     	bl	0x24b610c <__start_il2cpp+0x130e948>
 126f7d0: b4002900     	cbz	x0, 0x126fcf0 <__start_il2cpp+0xc852c>
 126f7d4: aa1f03e1     	mov	x1, xzr
 126f7d8: 94494ba7     	bl	0x24c2674 <__start_il2cpp+0x131aeb0>
 126f7dc: 7ea0d500     	fabd	s0, s8, s0
 126f7e0: 1e231001     	fmov	s1, #6.00000000
 126f7e4: 1e212000     	fcmp	s0, s1
 126f7e8: 540003ec     	b.gt	0x126f864 <__start_il2cpp+0xc80a0>
 126f7ec: f000af68     	adrp	x8, 0x285e000
 126f7f0: f9414108     	ldr	x8, [x8, #0x280]
 126f7f4: f9400100     	ldr	x0, [x8]
 126f7f8: 90ffa148     	adrp	x8, 0x697000
 126f7fc: bd457900     	ldr	s0, [x8, #0x578]
 126f800: b940e008     	ldr	w8, [x0, #0xe0]
 126f804: 1e200929     	fmul	s9, s9, s0
 126f808: 35000048     	cbnz	w8, 0x126f810 <__start_il2cpp+0xc804c>
 126f80c: 97f941f5     	bl	0x10bffe0 <CloseNLSocket+0x518>
 126f810: 1e290969     	fmul	s9, s11, s9
 126f814: 94000d71     	bl	0x1272dd8 <__start_il2cpp+0xcb614>
 126f818: 37000260     	tbnz	w0, #0x0, 0x126f864 <__start_il2cpp+0xc80a0>
 126f81c: f9404660     	ldr	x0, [x19, #0x88]
 126f820: b4002680     	cbz	x0, 0x126fcf0 <__start_il2cpp+0xc852c>
 126f824: aa1f03e1     	mov	x1, xzr
 126f828: 9401cd80     	bl	0x12e2e28 <__start_il2cpp+0x13b664>
 126f82c: 360001c0     	tbz	w0, #0x0, 0x126f864 <__start_il2cpp+0xc80a0>
 126f830: f94002a0     	ldr	x0, [x21]
 126f834: b40025e0     	cbz	x0, 0x126fcf0 <__start_il2cpp+0xc852c>
 126f838: 3944c008     	ldrb	w8, [x0, #0x130]
 126f83c: 34000148     	cbz	w8, 0x126f864 <__start_il2cpp+0xc80a0>
 126f840: aa1f03e1     	mov	x1, xzr
 126f844: 94491a32     	bl	0x24b610c <__start_il2cpp+0x130e948>
 126f848: b4002540     	cbz	x0, 0x126fcf0 <__start_il2cpp+0xc852c>
 126f84c: aa1f03e1     	mov	x1, xzr
 126f850: 94494b89     	bl	0x24c2674 <__start_il2cpp+0x131aeb0>
 126f854: 7ea0d500     	fabd	s0, s8, s0
 126f858: 1e229001     	fmov	s1, #5.00000000
 126f85c: 1e212000     	fcmp	s0, s1
 126f860: 54000d4c     	b.gt	0x126fa08 <__start_il2cpp+0xc8244>
 126f864: f94002b4     	ldr	x20, [x21]
 126f868: b4002454     	cbz	x20, 0x126fcf0 <__start_il2cpp+0xc852c>
 126f86c: aa1403e0     	mov	x0, x20
 126f870: aa1f03e1     	mov	x1, xzr
 126f874: 94491a26     	bl	0x24b610c <__start_il2cpp+0x130e948>
 126f878: b40023c0     	cbz	x0, 0x126fcf0 <__start_il2cpp+0xc852c>
 126f87c: aa1f03e1     	mov	x1, xzr
 126f880: 94494b7d     	bl	0x24c2674 <__start_il2cpp+0x131aeb0>
 126f884: 1e202920     	fadd	s0, s9, s0
 126f888: aa1403e0     	mov	x0, x20
 126f88c: aa1f03e1     	mov	x1, xzr
 126f890: 9401c473     	bl	0x12e0a5c <__start_il2cpp+0x139298>
 126f894: 1400005d     	b	0x126fa08 <__start_il2cpp+0xc8244>
 126f898: f94002a0     	ldr	x0, [x21]
 126f89c: b40022a0     	cbz	x0, 0x126fcf0 <__start_il2cpp+0xc852c>
 126f8a0: bd41900a     	ldr	s10, [x0, #0x190]
 126f8a4: aa1f03e1     	mov	x1, xzr
 126f8a8: 4ea21c49     	mov	v9.16b, v2.16b
 126f8ac: 94491a18     	bl	0x24b610c <__start_il2cpp+0x130e948>
 126f8b0: b4002200     	cbz	x0, 0x126fcf0 <__start_il2cpp+0xc852c>
 126f8b4: aa1f03e1     	mov	x1, xzr
 126f8b8: 94494ca3     	bl	0x24c2b44 <__start_il2cpp+0x131b380>
 126f8bc: f94002a0     	ldr	x0, [x21]
 126f8c0: b4002180     	cbz	x0, 0x126fcf0 <__start_il2cpp+0xc852c>
 126f8c4: aa1f03e1     	mov	x1, xzr
 126f8c8: 4ea01c08     	mov	v8.16b, v0.16b
 126f8cc: 94491a10     	bl	0x24b610c <__start_il2cpp+0x130e948>
 126f8d0: b4002100     	cbz	x0, 0x126fcf0 <__start_il2cpp+0xc852c>
 126f8d4: aa1f03e1     	mov	x1, xzr
 126f8d8: 94494b67     	bl	0x24c2674 <__start_il2cpp+0x131aeb0>
 126f8dc: f94002a8     	ldr	x8, [x21]
 126f8e0: b4002088     	cbz	x8, 0x126fcf0 <__start_il2cpp+0xc852c>
 126f8e4: 3945d108     	ldrb	w8, [x8, #0x174]
 126f8e8: 1e280940     	fmul	s0, s10, s8
 126f8ec: 1e202920     	fadd	s0, s9, s0
 126f8f0: 1e223808     	fsub	s8, s0, s2
 126f8f4: 35000168     	cbnz	w8, 0x126f920 <__start_il2cpp+0xc815c>
 126f8f8: 394a4668     	ldrb	w8, [x19, #0x291]
 126f8fc: 35000128     	cbnz	w8, 0x126f920 <__start_il2cpp+0xc815c>
 126f900: f000af68     	adrp	x8, 0x285e000
 126f904: f9414108     	ldr	x8, [x8, #0x280]
 126f908: f9400100     	ldr	x0, [x8]
 126f90c: b940e008     	ldr	w8, [x0, #0xe0]
 126f910: 35000048     	cbnz	w8, 0x126f918 <__start_il2cpp+0xc8154>
 126f914: 97f941b3     	bl	0x10bffe0 <CloseNLSocket+0x518>
 126f918: 94000d17     	bl	0x1272d74 <__start_il2cpp+0xcb5b0>
 126f91c: 37000220     	tbnz	w0, #0x0, 0x126f960 <__start_il2cpp+0xc819c>
 126f920: f9404668     	ldr	x8, [x19, #0x88]
 126f924: b4001e68     	cbz	x8, 0x126fcf0 <__start_il2cpp+0xc852c>
 126f928: b9403508     	ldr	w8, [x8, #0x34]
 126f92c: 71000d1f     	cmp	w8, #0x3
 126f930: 54000181     	b.ne	0x126f960 <__start_il2cpp+0xc819c>
 126f934: f94002a0     	ldr	x0, [x21]
 126f938: b4001dc0     	cbz	x0, 0x126fcf0 <__start_il2cpp+0xc852c>
 126f93c: aa1f03e1     	mov	x1, xzr
 126f940: 944919f3     	bl	0x24b610c <__start_il2cpp+0x130e948>
 126f944: b4001d60     	cbz	x0, 0x126fcf0 <__start_il2cpp+0xc852c>
 126f948: aa1f03e1     	mov	x1, xzr
 126f94c: 94494b4a     	bl	0x24c2674 <__start_il2cpp+0x131aeb0>
 126f950: 7ea2d520     	fabd	s0, s9, s2
 126f954: 1e231001     	fmov	s1, #6.00000000
 126f958: 1e212000     	fcmp	s0, s1
 126f95c: 540003ec     	b.gt	0x126f9d8 <__start_il2cpp+0xc8214>
 126f960: f000af68     	adrp	x8, 0x285e000
 126f964: f9414108     	ldr	x8, [x8, #0x280]
 126f968: f9400100     	ldr	x0, [x8]
 126f96c: 90ffa148     	adrp	x8, 0x697000
 126f970: bd457900     	ldr	s0, [x8, #0x578]
 126f974: b940e008     	ldr	w8, [x0, #0xe0]
 126f978: 1e200908     	fmul	s8, s8, s0
 126f97c: 35000048     	cbnz	w8, 0x126f984 <__start_il2cpp+0xc81c0>
 126f980: 97f94198     	bl	0x10bffe0 <CloseNLSocket+0x518>
 126f984: 1e280968     	fmul	s8, s11, s8
 126f988: 94000d14     	bl	0x1272dd8 <__start_il2cpp+0xcb614>
 126f98c: 37000260     	tbnz	w0, #0x0, 0x126f9d8 <__start_il2cpp+0xc8214>
 126f990: f9404660     	ldr	x0, [x19, #0x88]
 126f994: b4001ae0     	cbz	x0, 0x126fcf0 <__start_il2cpp+0xc852c>
 126f998: aa1f03e1     	mov	x1, xzr
 126f99c: 9401cd23     	bl	0x12e2e28 <__start_il2cpp+0x13b664>
 126f9a0: 360001c0     	tbz	w0, #0x0, 0x126f9d8 <__start_il2cpp+0xc8214>
 126f9a4: f94002a0     	ldr	x0, [x21]
 126f9a8: b4001a40     	cbz	x0, 0x126fcf0 <__start_il2cpp+0xc852c>
 126f9ac: 3944c008     	ldrb	w8, [x0, #0x130]
 126f9b0: 34000148     	cbz	w8, 0x126f9d8 <__start_il2cpp+0xc8214>
 126f9b4: aa1f03e1     	mov	x1, xzr
 126f9b8: 944919d5     	bl	0x24b610c <__start_il2cpp+0x130e948>
 126f9bc: b40019a0     	cbz	x0, 0x126fcf0 <__start_il2cpp+0xc852c>
 126f9c0: aa1f03e1     	mov	x1, xzr
 126f9c4: 94494b2c     	bl	0x24c2674 <__start_il2cpp+0x131aeb0>
 126f9c8: 7ea2d520     	fabd	s0, s9, s2
 126f9cc: 1e229001     	fmov	s1, #5.00000000
 126f9d0: 1e212000     	fcmp	s0, s1
 126f9d4: 540001ac     	b.gt	0x126fa08 <__start_il2cpp+0xc8244>
 126f9d8: f94002b4     	ldr	x20, [x21]
 126f9dc: b40018b4     	cbz	x20, 0x126fcf0 <__start_il2cpp+0xc852c>
 126f9e0: aa1403e0     	mov	x0, x20
 126f9e4: aa1f03e1     	mov	x1, xzr
 126f9e8: 944919c9     	bl	0x24b610c <__start_il2cpp+0x130e948>
 126f9ec: b4001820     	cbz	x0, 0x126fcf0 <__start_il2cpp+0xc852c>
 126f9f0: aa1f03e1     	mov	x1, xzr
 126f9f4: 94494b20     	bl	0x24c2674 <__start_il2cpp+0x131aeb0>
 126f9f8: 1e222900     	fadd	s0, s8, s2
 126f9fc: aa1403e0     	mov	x0, x20
 126fa00: aa1f03e1     	mov	x1, xzr
 126fa04: 9401c454     	bl	0x12e0b54 <__start_il2cpp+0x139390>
 126fa08: f94002a0     	ldr	x0, [x21]
 126fa0c: b4001720     	cbz	x0, 0x126fcf0 <__start_il2cpp+0xc852c>
 126fa10: aa1f03e1     	mov	x1, xzr
 126fa14: 9400a231     	bl	0x12982d8 <__start_il2cpp+0xf0b14>
 126fa18: f94002a0     	ldr	x0, [x21]
 126fa1c: b40016a0     	cbz	x0, 0x126fcf0 <__start_il2cpp+0xc852c>
 126fa20: aa1f03e1     	mov	x1, xzr
 126fa24: 4ea01c08     	mov	v8.16b, v0.16b
 126fa28: 9400a245     	bl	0x129833c <__start_il2cpp+0xf0b78>
 126fa2c: f94002a0     	ldr	x0, [x21]
 126fa30: b4001600     	cbz	x0, 0x126fcf0 <__start_il2cpp+0xc852c>
 126fa34: aa1f03e1     	mov	x1, xzr
 126fa38: 4ea01c09     	mov	v9.16b, v0.16b
 126fa3c: 9400a240     	bl	0x129833c <__start_il2cpp+0xf0b78>
 126fa40: f94002a0     	ldr	x0, [x21]
 126fa44: 1e202100     	fcmp	s8, s0
 126fa48: 54000065     	b.pl	0x126fa54 <__start_il2cpp+0xc8290>
 126fa4c: b5000120     	cbnz	x0, 0x126fa70 <__start_il2cpp+0xc82ac>
 126fa50: 140000a8     	b	0x126fcf0 <__start_il2cpp+0xc852c>
 126fa54: b40014e0     	cbz	x0, 0x126fcf0 <__start_il2cpp+0xc852c>
 126fa58: 3945d008     	ldrb	w8, [x0, #0x174]
 126fa5c: 34001268     	cbz	w8, 0x126fca8 <__start_il2cpp+0xc84e4>
 126fa60: bd417800     	ldr	s0, [x0, #0x178]
 126fa64: bd418001     	ldr	s1, [x0, #0x180]
 126fa68: 1e212000     	fcmp	s0, s1
 126fa6c: 540011e8     	b.hi	0x126fca8 <__start_il2cpp+0xc84e4>
 126fa70: 3943e008     	ldrb	w8, [x0, #0xf8]
 126fa74: 350011a8     	cbnz	w8, 0x126fca8 <__start_il2cpp+0xc84e4>
 126fa78: 39440008     	ldrb	w8, [x0, #0x100]
 126fa7c: 35001168     	cbnz	w8, 0x126fca8 <__start_il2cpp+0xc84e4>
 126fa80: f9404668     	ldr	x8, [x19, #0x88]
 126fa84: b4001368     	cbz	x8, 0x126fcf0 <__start_il2cpp+0xc852c>
 126fa88: b9403508     	ldr	w8, [x8, #0x34]
 126fa8c: aa1f03e1     	mov	x1, xzr
 126fa90: b9009a68     	str	w8, [x19, #0x98]
 126fa94: 9449199e     	bl	0x24b610c <__start_il2cpp+0x130e948>
 126fa98: b40012c0     	cbz	x0, 0x126fcf0 <__start_il2cpp+0xc852c>
 126fa9c: aa1f03e1     	mov	x1, xzr
 126faa0: 94494c29     	bl	0x24c2b44 <__start_il2cpp+0x131b380>
 126faa4: d000be34     	adrp	x20, 0x2a35000
 126faa8: 39414e88     	ldrb	w8, [x20, #0x53]
 126faac: 4ea01c0a     	mov	v10.16b, v0.16b
 126fab0: 4ea11c2b     	mov	v11.16b, v1.16b
 126fab4: 4ea21c4c     	mov	v12.16b, v2.16b
 126fab8: 350000c8     	cbnz	w8, 0x126fad0 <__start_il2cpp+0xc830c>
 126fabc: f000af60     	adrp	x0, 0x285e000
 126fac0: f9417800     	ldr	x0, [x0, #0x2f0]
 126fac4: 97f94105     	bl	0x10bfed8 <CloseNLSocket+0x410>
 126fac8: 52800028     	mov	w8, #0x1                // =1
 126facc: 39014e88     	strb	w8, [x20, #0x53]
 126fad0: f94002c0     	ldr	x0, [x22]
 126fad4: b940e008     	ldr	w8, [x0, #0xe0]
 126fad8: 35000048     	cbnz	w8, 0x126fae0 <__start_il2cpp+0xc831c>
 126fadc: 97f94141     	bl	0x10bffe0 <CloseNLSocket+0x518>
 126fae0: 1e2a0940     	fmul	s0, s10, s10
 126fae4: 1e2b0961     	fmul	s1, s11, s11
 126fae8: 1e212800     	fadd	s0, s0, s1
 126faec: 1e2c0981     	fmul	s1, s12, s12
 126faf0: 1e202820     	fadd	s0, s1, s0
 126faf4: 1e21c000     	fsqrt	s0, s0
 126faf8: 1e2d2000     	fcmp	s0, s13
 126fafc: 540000ad     	b.le	0x126fb10 <__start_il2cpp+0xc834c>
 126fb00: 1e20194a     	fdiv	s10, s10, s0
 126fb04: 1e20196b     	fdiv	s11, s11, s0
 126fb08: 1e20198c     	fdiv	s12, s12, s0
 126fb0c: 1400000f     	b	0x126fb48 <__start_il2cpp+0xc8384>
 126fb10: b000be34     	adrp	x20, 0x2a34000
 126fb14: 397e8288     	ldrb	w8, [x20, #0xfa0]
 126fb18: 350000c8     	cbnz	w8, 0x126fb30 <__start_il2cpp+0xc836c>
 126fb1c: d000af60     	adrp	x0, 0x285d000
 126fb20: f9474800     	ldr	x0, [x0, #0xe90]
 126fb24: 97f940ed     	bl	0x10bfed8 <CloseNLSocket+0x410>
 126fb28: 52800028     	mov	w8, #0x1                // =1
 126fb2c: 393e8288     	strb	w8, [x20, #0xfa0]
 126fb30: d000af68     	adrp	x8, 0x285d000
 126fb34: f9474908     	ldr	x8, [x8, #0xe90]
 126fb38: f9400108     	ldr	x8, [x8]
 126fb3c: f9405d08     	ldr	x8, [x8, #0xb8]
 126fb40: 2d402d0a     	ldp	s10, s11, [x8]
 126fb44: bd40090c     	ldr	s12, [x8, #0x8]
 126fb48: f000af74     	adrp	x20, 0x285e000
 126fb4c: f9414294     	ldr	x20, [x20, #0x280]
 126fb50: f9400280     	ldr	x0, [x20]
 126fb54: b940e008     	ldr	w8, [x0, #0xe0]
 126fb58: 35000048     	cbnz	w8, 0x126fb60 <__start_il2cpp+0xc839c>
 126fb5c: 97f94121     	bl	0x10bffe0 <CloseNLSocket+0x518>
 126fb60: 2a1f03e0     	mov	w0, wzr
 126fb64: 1e291909     	fdiv	s9, s8, s9
 126fb68: 94000cb5     	bl	0x1272e3c <__start_il2cpp+0xcb678>
 126fb6c: f9400280     	ldr	x0, [x20]
 126fb70: 4ea01c08     	mov	v8.16b, v0.16b
 126fb74: b940e008     	ldr	w8, [x0, #0xe0]
 126fb78: 35000048     	cbnz	w8, 0x126fb80 <__start_il2cpp+0xc83bc>
 126fb7c: 97f94119     	bl	0x10bffe0 <CloseNLSocket+0x518>
 126fb80: 2a1f03e0     	mov	w0, wzr
 126fb84: 1e282120     	fcmp	s9, s8
 126fb88: 540005a4     	b.mi	0x126fc3c <__start_il2cpp+0xc8478>
 126fb8c: 94000cac     	bl	0x1272e3c <__start_il2cpp+0xcb678>
 126fb90: 1e202120     	fcmp	s9, s0
 126fb94: 5400012b     	b.lt	0x126fbb8 <__start_il2cpp+0xc83f4>
 126fb98: f9400280     	ldr	x0, [x20]
 126fb9c: b940e008     	ldr	w8, [x0, #0xe0]
 126fba0: 35000048     	cbnz	w8, 0x126fba8 <__start_il2cpp+0xc83e4>
 126fba4: 97f9410f     	bl	0x10bffe0 <CloseNLSocket+0x518>
 126fba8: 52800020     	mov	w0, #0x1                // =1
 126fbac: 94000ca4     	bl	0x1272e3c <__start_il2cpp+0xcb678>
 126fbb0: 1e202120     	fcmp	s9, s0
 126fbb4: 540002e9     	b.ls	0x126fc10 <__start_il2cpp+0xc844c>
 126fbb8: f9400280     	ldr	x0, [x20]
 126fbbc: b940e008     	ldr	w8, [x0, #0xe0]
 126fbc0: 35000048     	cbnz	w8, 0x126fbc8 <__start_il2cpp+0xc8404>
 126fbc4: 97f94107     	bl	0x10bffe0 <CloseNLSocket+0x518>
 126fbc8: 52800020     	mov	w0, #0x1                // =1
 126fbcc: 94000c9c     	bl	0x1272e3c <__start_il2cpp+0xcb678>
 126fbd0: 1e202120     	fcmp	s9, s0
 126fbd4: 5400012b     	b.lt	0x126fbf8 <__start_il2cpp+0xc8434>
 126fbd8: f9400280     	ldr	x0, [x20]
 126fbdc: b940e008     	ldr	w8, [x0, #0xe0]
 126fbe0: 35000048     	cbnz	w8, 0x126fbe8 <__start_il2cpp+0xc8424>
 126fbe4: 97f940ff     	bl	0x10bffe0 <CloseNLSocket+0x518>
 126fbe8: 52800040     	mov	w0, #0x2                // =2
 126fbec: 94000c94     	bl	0x1272e3c <__start_il2cpp+0xcb678>
 126fbf0: 1e202120     	fcmp	s9, s0
 126fbf4: 540001a9     	b.ls	0x126fc28 <__start_il2cpp+0xc8464>
 126fbf8: f9400280     	ldr	x0, [x20]
 126fbfc: b940e008     	ldr	w8, [x0, #0xe0]
 126fc00: 35000048     	cbnz	w8, 0x126fc08 <__start_il2cpp+0xc8444>
 126fc04: 97f940f7     	bl	0x10bffe0 <CloseNLSocket+0x518>
 126fc08: 52800060     	mov	w0, #0x3                // =3
 126fc0c: 1400000c     	b	0x126fc3c <__start_il2cpp+0xc8478>
 126fc10: f9400280     	ldr	x0, [x20]
 126fc14: b940e008     	ldr	w8, [x0, #0xe0]
 126fc18: 35000048     	cbnz	w8, 0x126fc20 <__start_il2cpp+0xc845c>
 126fc1c: 97f940f1     	bl	0x10bffe0 <CloseNLSocket+0x518>
 126fc20: 52800020     	mov	w0, #0x1                // =1
 126fc24: 14000006     	b	0x126fc3c <__start_il2cpp+0xc8478>
 126fc28: f9400280     	ldr	x0, [x20]
 126fc2c: b940e008     	ldr	w8, [x0, #0xe0]
 126fc30: 35000048     	cbnz	w8, 0x126fc38 <__start_il2cpp+0xc8474>
 126fc34: 97f940eb     	bl	0x10bffe0 <CloseNLSocket+0x518>
 126fc38: 52800040     	mov	w0, #0x2                // =2
 126fc3c: 94000caa     	bl	0x1272ee4 <__start_il2cpp+0xcb720>
 126fc40: f94002a0     	ldr	x0, [x21]
 126fc44: b4000560     	cbz	x0, 0x126fcf0 <__start_il2cpp+0xc852c>
 126fc48: 3945d008     	ldrb	w8, [x0, #0x174]
 126fc4c: 4ea01c08     	mov	v8.16b, v0.16b
 126fc50: 34000208     	cbz	w8, 0x126fc90 <__start_il2cpp+0xc84cc>
 126fc54: bd417800     	ldr	s0, [x0, #0x178]
 126fc58: bd418001     	ldr	s1, [x0, #0x180]
 126fc5c: 1e212000     	fcmp	s0, s1
 126fc60: 5400006d     	b.le	0x126fc6c <__start_il2cpp+0xc84a8>
 126fc64: 52a862c8     	mov	w8, #0x43160000         // =1125515264
 126fc68: 14000009     	b	0x126fc8c <__start_il2cpp+0xc84c8>
 126fc6c: aa1f03e1     	mov	x1, xzr
 126fc70: 9400a19a     	bl	0x12982d8 <__start_il2cpp+0xf0b14>
 126fc74: f94002a0     	ldr	x0, [x21]
 126fc78: b40003c0     	cbz	x0, 0x126fcf0 <__start_il2cpp+0xc852c>
 126fc7c: bd417c01     	ldr	s1, [x0, #0x17c]
 126fc80: 1e212000     	fcmp	s0, s1
 126fc84: 5400006d     	b.le	0x126fc90 <__start_il2cpp+0xc84cc>
 126fc88: 52b862c8     	mov	w8, #-0x3cea0000        // =-1021968384
 126fc8c: 1e270108     	fmov	s8, w8
 126fc90: 90ffa148     	adrp	x8, 0x697000
 126fc94: bd45f100     	ldr	s0, [x8, #0x5f0]
 126fc98: 1e202120     	fcmp	s9, s0
 126fc9c: 54000144     	b.mi	0x126fcc4 <__start_il2cpp+0xc8500>
 126fca0: 39441268     	ldrb	w8, [x19, #0x104]
 126fca4: 34000108     	cbz	w8, 0x126fcc4 <__start_il2cpp+0xc8500>
 126fca8: a9454ff4     	ldp	x20, x19, [sp, #0x50]
 126fcac: a94457f6     	ldp	x22, x21, [sp, #0x40]
 126fcb0: a9435ffe     	ldp	x30, x23, [sp, #0x30]
 126fcb4: 6d4223e9     	ldp	d9, d8, [sp, #0x20]
 126fcb8: 6d412beb     	ldp	d11, d10, [sp, #0x10]
 126fcbc: 6cc633ed     	ldp	d13, d12, [sp], #0x60
 126fcc0: d65f03c0     	ret
 126fcc4: 1e280982     	fmul	s2, s12, s8
 126fcc8: 1e280961     	fmul	s1, s11, s8
 126fccc: 1e280940     	fmul	s0, s10, s8
 126fcd0: a9454ff4     	ldp	x20, x19, [sp, #0x50]
 126fcd4: a94457f6     	ldp	x22, x21, [sp, #0x40]
 126fcd8: a9435ffe     	ldp	x30, x23, [sp, #0x30]
 126fcdc: 6d4223e9     	ldp	d9, d8, [sp, #0x20]
 126fce0: 6d412beb     	ldp	d11, d10, [sp, #0x10]
 126fce4: aa1f03e1     	mov	x1, xzr
 126fce8: 6cc633ed     	ldp	d13, d12, [sp], #0x60
 126fcec: 1401c300     	b	0x12e08ec <__start_il2cpp+0x139128>
 126fcf0: 97f94104     	bl	0x10c0100 <CloseNLSocket+0x638>
