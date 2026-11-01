
/tmp/temple-libil2cpp.so:	file format elf64-littleaarch64

Disassembly of section il2cpp:

00000000011a77c4 <__start_il2cpp>:
 127327c: f81b0ffe     	str	x30, [sp, #-0x50]!
 1273280: a90167fa     	stp	x26, x25, [sp, #0x10]
 1273284: a9025ff8     	stp	x24, x23, [sp, #0x20]
 1273288: a90357f6     	stp	x22, x21, [sp, #0x30]
 127328c: a9044ff4     	stp	x20, x19, [sp, #0x40]
 1273290: d000be14     	adrp	x20, 0x2a35000
 1273294: 395d5a88     	ldrb	w8, [x20, #0x756]
 1273298: aa0003f3     	mov	x19, x0
 127329c: 37000308     	tbnz	w8, #0x0, 0x12732fc <__start_il2cpp+0xcbb38>
 12732a0: f000af60     	adrp	x0, 0x2862000
 12732a4: f943bc00     	ldr	x0, [x0, #0x778]
 12732a8: 97f9330c     	bl	0x10bfed8 <CloseNLSocket+0x410>
 12732ac: f000af60     	adrp	x0, 0x2862000
 12732b0: f943c000     	ldr	x0, [x0, #0x780]
 12732b4: 97f93309     	bl	0x10bfed8 <CloseNLSocket+0x410>
 12732b8: f000af60     	adrp	x0, 0x2862000
 12732bc: f943c400     	ldr	x0, [x0, #0x788]
 12732c0: 97f93306     	bl	0x10bfed8 <CloseNLSocket+0x410>
 12732c4: f000af60     	adrp	x0, 0x2862000
 12732c8: f9439000     	ldr	x0, [x0, #0x720]
 12732cc: 97f93303     	bl	0x10bfed8 <CloseNLSocket+0x410>
 12732d0: f000af60     	adrp	x0, 0x2862000
 12732d4: f9439400     	ldr	x0, [x0, #0x728]
 12732d8: 97f93300     	bl	0x10bfed8 <CloseNLSocket+0x410>
 12732dc: f000af40     	adrp	x0, 0x285e000
 12732e0: f944f800     	ldr	x0, [x0, #0x9f0]
 12732e4: 97f932fd     	bl	0x10bfed8 <CloseNLSocket+0x410>
 12732e8: b000af40     	adrp	x0, 0x285c000 <_ZTVN10__cxxabiv119__pointer_type_infoE+0x18>
 12732ec: f9456000     	ldr	x0, [x0, #0xac0]
 12732f0: 97f932fa     	bl	0x10bfed8 <CloseNLSocket+0x410>
 12732f4: 52800028     	mov	w8, #0x1                // =1
 12732f8: 391d5a88     	strb	w8, [x20, #0x756]
 12732fc: f9410660     	ldr	x0, [x19, #0x208]
 1273300: b4000420     	cbz	x0, 0x1273384 <__start_il2cpp+0xcbbc0>
 1273304: f000af7a     	adrp	x26, 0x2862000
 1273308: b000af56     	adrp	x22, 0x285c000 <_ZTVN10__cxxabiv119__pointer_type_infoE+0x18>
 127330c: f000af57     	adrp	x23, 0x285e000
 1273310: f000af78     	adrp	x24, 0x2862000
 1273314: f000af79     	adrp	x25, 0x2862000
 1273318: f943975a     	ldr	x26, [x26, #0x728]
 127331c: f94562d6     	ldr	x22, [x22, #0xac0]
 1273320: f944faf7     	ldr	x23, [x23, #0x9f0]
 1273324: f943bf18     	ldr	x24, [x24, #0x778]
 1273328: f943c339     	ldr	x25, [x25, #0x780]
 127332c: 2a1f03f4     	mov	w20, wzr
 1273330: b9401802     	ldr	w2, [x0, #0x18]
 1273334: 6b02029f     	cmp	w20, w2
 1273338: 5400028a     	b.ge	0x1273388 <__start_il2cpp+0xcbbc4>
 127333c: f9400342     	ldr	x2, [x26]
 1273340: 2a1403e1     	mov	w1, w20
 1273344: 941a1b83     	bl	0x18fa150 <__start_il2cpp+0x75298c>
 1273348: b40001e0     	cbz	x0, 0x1273384 <__start_il2cpp+0xcbbc0>
 127334c: aa1f03e1     	mov	x1, xzr
 1273350: 94490b7e     	bl	0x24b6148 <__start_il2cpp+0x130e984>
 1273354: f94002c8     	ldr	x8, [x22]
 1273358: aa0003f5     	mov	x21, x0
 127335c: b940e109     	ldr	w9, [x8, #0xe0]
 1273360: 35000069     	cbnz	w9, 0x127336c <__start_il2cpp+0xcbba8>
 1273364: aa0803e0     	mov	x0, x8
 1273368: 97f9331e     	bl	0x10bffe0 <CloseNLSocket+0x518>
 127336c: aa1503e0     	mov	x0, x21
 1273370: aa1f03e1     	mov	x1, xzr
 1273374: 94492634     	bl	0x24bcc44 <__start_il2cpp+0x1315480>
 1273378: f9410660     	ldr	x0, [x19, #0x208]
 127337c: 11000694     	add	w20, w20, #0x1
 1273380: b5fffd80     	cbnz	x0, 0x1273330 <__start_il2cpp+0xcbb6c>
 1273384: 97f9335f     	bl	0x10c0100 <CloseNLSocket+0x638>
 1273388: b9401c08     	ldr	w8, [x0, #0x1c]
 127338c: 7100045f     	cmp	w2, #0x1
 1273390: 11000508     	add	w8, w8, #0x1
 1273394: 2903201f     	stp	wzr, w8, [x0, #0x18]
 1273398: 540000ab     	b.lt	0x12733ac <__start_il2cpp+0xcbbe8>
 127339c: f9400800     	ldr	x0, [x0, #0x10]
 12733a0: 2a1f03e1     	mov	w1, wzr
 12733a4: aa1f03e3     	mov	x3, xzr
 12733a8: 94314da2     	bl	0x1ec6a30 <__start_il2cpp+0xd1f26c>
 12733ac: b9420268     	ldr	w8, [x19, #0x200]
 12733b0: 7100051f     	cmp	w8, #0x1
 12733b4: 5400050b     	b.lt	0x1273454 <__start_il2cpp+0xcbc90>
 12733b8: 2a1f03f5     	mov	w21, wzr
 12733bc: f94002c0     	ldr	x0, [x22]
 12733c0: f9411274     	ldr	x20, [x19, #0x220]
 12733c4: b940e008     	ldr	w8, [x0, #0xe0]
 12733c8: 35000048     	cbnz	w8, 0x12733d0 <__start_il2cpp+0xcbc0c>
 12733cc: 97f93305     	bl	0x10bffe0 <CloseNLSocket+0x518>
 12733d0: f94002e1     	ldr	x1, [x23]
 12733d4: aa1403e0     	mov	x0, x20
 12733d8: 94063336     	bl	0x14000b0 <__start_il2cpp+0x2588ec>
 12733dc: b4fffd40     	cbz	x0, 0x1273384 <__start_il2cpp+0xcbbc0>
 12733e0: f9400301     	ldr	x1, [x24]
 12733e4: 9405965f     	bl	0x13d8d60 <__start_il2cpp+0x23159c>
 12733e8: f9410668     	ldr	x8, [x19, #0x208]
 12733ec: b4fffcc8     	cbz	x8, 0x1273384 <__start_il2cpp+0xcbbc0>
 12733f0: b9401d0b     	ldr	w11, [x8, #0x1c]
 12733f4: f9400909     	ldr	x9, [x8, #0x10]
 12733f8: f940032a     	ldr	x10, [x25]
 12733fc: 1100056b     	add	w11, w11, #0x1
 1273400: b9001d0b     	str	w11, [x8, #0x1c]
 1273404: b4fffc09     	cbz	x9, 0x1273384 <__start_il2cpp+0xcbbc0>
 1273408: b980190b     	ldrsw	x11, [x8, #0x18]
 127340c: b940192c     	ldr	w12, [x9, #0x18]
 1273410: aa0003e1     	mov	x1, x0
 1273414: 6b0c017f     	cmp	w11, w12
 1273418: 540000c2     	b.hs	0x1273430 <__start_il2cpp+0xcbc6c>
 127341c: 1100056a     	add	w10, w11, #0x1
 1273420: 8b0b0d29     	add	x9, x9, x11, lsl #3
 1273424: b900190a     	str	w10, [x8, #0x18]
 1273428: f9001121     	str	x1, [x9, #0x20]
 127342c: 14000006     	b	0x1273444 <__start_il2cpp+0xcbc80>
 1273430: f9401149     	ldr	x9, [x10, #0x20]
 1273434: aa0803e0     	mov	x0, x8
 1273438: f9406129     	ldr	x9, [x9, #0xc0]
 127343c: f9403922     	ldr	x2, [x9, #0x70]
 1273440: 941a1bf5     	bl	0x18fa414 <__start_il2cpp+0x752c50>
 1273444: b9420268     	ldr	w8, [x19, #0x200]
 1273448: 110006b5     	add	w21, w21, #0x1
 127344c: 6b0802bf     	cmp	w21, w8
 1273450: 54fffb6b     	b.lt	0x12733bc <__start_il2cpp+0xcbbf8>
 1273454: a9444ff4     	ldp	x20, x19, [sp, #0x40]
 1273458: a94357f6     	ldp	x22, x21, [sp, #0x30]
 127345c: a9425ff8     	ldp	x24, x23, [sp, #0x20]
 1273460: a94167fa     	ldp	x26, x25, [sp, #0x10]
 1273464: f84507fe     	ldr	x30, [sp], #0x50
 1273468: d65f03c0     	ret
