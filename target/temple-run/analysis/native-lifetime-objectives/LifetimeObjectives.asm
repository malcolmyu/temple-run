
/tmp/temple-libil2cpp.so:	file format elf64-littleaarch64

Disassembly of section il2cpp:

00000000011a77c4 <__start_il2cpp>:
 1276320: f94002e0     	ldr	x0, [x23]
 1276324: b4009580     	cbz	x0, 0x12775d4 <__start_il2cpp+0xcfe10>
 1276328: 2a1403e1     	mov	w1, w20
 127632c: aa1f03e2     	mov	x2, xzr
 1276330: 9400551b     	bl	0x128b79c <__start_il2cpp+0xe3fd8>
 1276334: f94002e8     	ldr	x8, [x23]
 1276338: b40094e8     	cbz	x8, 0x12775d4 <__start_il2cpp+0xcfe10>
 127633c: 9000af73     	adrp	x19, 0x2862000
 1276340: f943fa73     	ldr	x19, [x19, #0x7f0]
 1276344: 1e220008     	scvtf	s8, w0
 1276348: aa0803e0     	mov	x0, x8
 127634c: 2a1403e1     	mov	w1, w20
 1276350: f9400262     	ldr	x2, [x19]
 1276354: aa1f03e3     	mov	x3, xzr
 1276358: 94005af7     	bl	0x128cf34 <__start_il2cpp+0xe5770>
 127635c: 52a85908     	mov	w8, #0x42c80000         // =1120403456
 1276360: 1e270101     	fmov	s1, w8
 1276364: 1e212000     	fcmp	s0, s1
 1276368: 54000565     	b.pl	0x1276414 <__start_il2cpp+0xcec50>
 127636c: 52a88f48     	mov	w8, #0x447a0000         // =1148846080
 1276370: 52a85909     	mov	w9, #0x42c80000         // =1120403456
 1276374: 1e270100     	fmov	s0, w8
 1276378: 1e201900     	fdiv	s0, s8, s0
 127637c: 1e270121     	fmov	s1, w9
 1276380: 1e210800     	fmul	s0, s0, s1
 1276384: 1e212000     	fcmp	s0, s1
 1276388: 540003ab     	b.lt	0x12763fc <__start_il2cpp+0xcec38>
 127638c: f9400300     	ldr	x0, [x24]
 1276390: b4009220     	cbz	x0, 0x12775d4 <__start_il2cpp+0xcfe10>
 1276394: d000af29     	adrp	x9, 0x285c000 <_ZTVN10__cxxabiv119__pointer_type_infoE+0x18>
 1276398: f9400261     	ldr	x1, [x19]
 127639c: f947a529     	ldr	x9, [x9, #0xf48]
 12763a0: b9401c0a     	ldr	w10, [x0, #0x1c]
 12763a4: f9400808     	ldr	x8, [x0, #0x10]
 12763a8: f9400129     	ldr	x9, [x9]
 12763ac: 1100054a     	add	w10, w10, #0x1
 12763b0: b9001c0a     	str	w10, [x0, #0x1c]
 12763b4: b4009108     	cbz	x8, 0x12775d4 <__start_il2cpp+0xcfe10>
 12763b8: b980180a     	ldrsw	x10, [x0, #0x18]
 12763bc: b940190b     	ldr	w11, [x8, #0x18]
 12763c0: 6b0b015f     	cmp	w10, w11
 12763c4: 54000102     	b.hs	0x12763e4 <__start_il2cpp+0xcec20>
 12763c8: 11000549     	add	w9, w10, #0x1
 12763cc: 8b0a0d08     	add	x8, x8, x10, lsl #3
 12763d0: 52a8590a     	mov	w10, #0x42c80000        // =1120403456
 12763d4: b9001809     	str	w9, [x0, #0x18]
 12763d8: f9001101     	str	x1, [x8, #0x20]
 12763dc: 1e270140     	fmov	s0, w10
 12763e0: 14000007     	b	0x12763fc <__start_il2cpp+0xcec38>
 12763e4: f9401128     	ldr	x8, [x9, #0x20]
 12763e8: f9406108     	ldr	x8, [x8, #0xc0]
 12763ec: f9403902     	ldr	x2, [x8, #0x70]
 12763f0: 941a1009     	bl	0x18fa414 <__start_il2cpp+0x752c50>
 12763f4: 52a85908     	mov	w8, #0x42c80000         // =1120403456
 12763f8: 1e270100     	fmov	s0, w8
 12763fc: f94002e0     	ldr	x0, [x23]
 1276400: b4008ea0     	cbz	x0, 0x12775d4 <__start_il2cpp+0xcfe10>
 1276404: f9400262     	ldr	x2, [x19]
 1276408: 2a1403e1     	mov	w1, w20
 127640c: aa1f03e3     	mov	x3, xzr
 1276410: 94005ad1     	bl	0x128cf54 <__start_il2cpp+0xe5790>
 1276414: f94002e0     	ldr	x0, [x23]
 1276418: b4008de0     	cbz	x0, 0x12775d4 <__start_il2cpp+0xcfe10>
 127641c: 9000af73     	adrp	x19, 0x2862000
 1276420: f9446e73     	ldr	x19, [x19, #0x8d8]
 1276424: 2a1403e1     	mov	w1, w20
 1276428: aa1f03e3     	mov	x3, xzr
 127642c: f9400262     	ldr	x2, [x19]
 1276430: 94005ac1     	bl	0x128cf34 <__start_il2cpp+0xe5770>
 1276434: 52a85908     	mov	w8, #0x42c80000         // =1120403456
 1276438: 1e270101     	fmov	s1, w8
 127643c: 1e212000     	fcmp	s0, s1
 1276440: 54000565     	b.pl	0x12764ec <__start_il2cpp+0xced28>
 1276444: b0ffa108     	adrp	x8, 0x697000
 1276448: bd463d00     	ldr	s0, [x8, #0x63c]
 127644c: 52a85908     	mov	w8, #0x42c80000         // =1120403456
 1276450: 1e270101     	fmov	s1, w8
 1276454: 1e201900     	fdiv	s0, s8, s0
 1276458: 1e210800     	fmul	s0, s0, s1
 127645c: 1e212000     	fcmp	s0, s1
 1276460: 540003ab     	b.lt	0x12764d4 <__start_il2cpp+0xced10>
 1276464: f9400300     	ldr	x0, [x24]
 1276468: b4008b60     	cbz	x0, 0x12775d4 <__start_il2cpp+0xcfe10>
 127646c: d000af29     	adrp	x9, 0x285c000 <_ZTVN10__cxxabiv119__pointer_type_infoE+0x18>
 1276470: f9400261     	ldr	x1, [x19]
 1276474: f947a529     	ldr	x9, [x9, #0xf48]
 1276478: b9401c0a     	ldr	w10, [x0, #0x1c]
 127647c: f9400808     	ldr	x8, [x0, #0x10]
 1276480: f9400129     	ldr	x9, [x9]
 1276484: 1100054a     	add	w10, w10, #0x1
 1276488: b9001c0a     	str	w10, [x0, #0x1c]
 127648c: b4008a48     	cbz	x8, 0x12775d4 <__start_il2cpp+0xcfe10>
 1276490: b980180a     	ldrsw	x10, [x0, #0x18]
 1276494: b940190b     	ldr	w11, [x8, #0x18]
 1276498: 6b0b015f     	cmp	w10, w11
 127649c: 54000102     	b.hs	0x12764bc <__start_il2cpp+0xcecf8>
 12764a0: 11000549     	add	w9, w10, #0x1
 12764a4: 8b0a0d08     	add	x8, x8, x10, lsl #3
 12764a8: 52a8590a     	mov	w10, #0x42c80000        // =1120403456
 12764ac: b9001809     	str	w9, [x0, #0x18]
 12764b0: f9001101     	str	x1, [x8, #0x20]
 12764b4: 1e270140     	fmov	s0, w10
 12764b8: 14000007     	b	0x12764d4 <__start_il2cpp+0xced10>
 12764bc: f9401128     	ldr	x8, [x9, #0x20]
 12764c0: f9406108     	ldr	x8, [x8, #0xc0]
 12764c4: f9403902     	ldr	x2, [x8, #0x70]
 12764c8: 941a0fd3     	bl	0x18fa414 <__start_il2cpp+0x752c50>
 12764cc: 52a85908     	mov	w8, #0x42c80000         // =1120403456
 12764d0: 1e270100     	fmov	s0, w8
 12764d4: f94002e0     	ldr	x0, [x23]
 12764d8: b40087e0     	cbz	x0, 0x12775d4 <__start_il2cpp+0xcfe10>
 12764dc: f9400262     	ldr	x2, [x19]
 12764e0: 2a1403e1     	mov	w1, w20
 12764e4: aa1f03e3     	mov	x3, xzr
 12764e8: 94005a9b     	bl	0x128cf54 <__start_il2cpp+0xe5790>
 12764ec: f94002e0     	ldr	x0, [x23]
 12764f0: b4008720     	cbz	x0, 0x12775d4 <__start_il2cpp+0xcfe10>
 12764f4: 9000af73     	adrp	x19, 0x2862000
 12764f8: f9442273     	ldr	x19, [x19, #0x840]
 12764fc: 2a1403e1     	mov	w1, w20
 1276500: aa1f03e3     	mov	x3, xzr
 1276504: f9400262     	ldr	x2, [x19]
 1276508: 94005a8b     	bl	0x128cf34 <__start_il2cpp+0xe5770>
 127650c: 52a85908     	mov	w8, #0x42c80000         // =1120403456
 1276510: 1e270101     	fmov	s1, w8
 1276514: 1e212000     	fcmp	s0, s1
 1276518: 54000565     	b.pl	0x12765c4 <__start_il2cpp+0xcee00>
 127651c: b0ffa108     	adrp	x8, 0x697000
 1276520: bd45d500     	ldr	s0, [x8, #0x5d4]
 1276524: 52a85908     	mov	w8, #0x42c80000         // =1120403456
 1276528: 1e270101     	fmov	s1, w8
 127652c: 1e201900     	fdiv	s0, s8, s0
 1276530: 1e210800     	fmul	s0, s0, s1
 1276534: 1e212000     	fcmp	s0, s1
 1276538: 540003ab     	b.lt	0x12765ac <__start_il2cpp+0xcede8>
 127653c: f9400300     	ldr	x0, [x24]
 1276540: b40084a0     	cbz	x0, 0x12775d4 <__start_il2cpp+0xcfe10>
 1276544: d000af29     	adrp	x9, 0x285c000 <_ZTVN10__cxxabiv119__pointer_type_infoE+0x18>
 1276548: f9400261     	ldr	x1, [x19]
 127654c: f947a529     	ldr	x9, [x9, #0xf48]
 1276550: b9401c0a     	ldr	w10, [x0, #0x1c]
 1276554: f9400808     	ldr	x8, [x0, #0x10]
 1276558: f9400129     	ldr	x9, [x9]
 127655c: 1100054a     	add	w10, w10, #0x1
 1276560: b9001c0a     	str	w10, [x0, #0x1c]
 1276564: b4008388     	cbz	x8, 0x12775d4 <__start_il2cpp+0xcfe10>
 1276568: b980180a     	ldrsw	x10, [x0, #0x18]
 127656c: b940190b     	ldr	w11, [x8, #0x18]
 1276570: 6b0b015f     	cmp	w10, w11
 1276574: 54000102     	b.hs	0x1276594 <__start_il2cpp+0xcedd0>
 1276578: 11000549     	add	w9, w10, #0x1
 127657c: 8b0a0d08     	add	x8, x8, x10, lsl #3
 1276580: 52a8590a     	mov	w10, #0x42c80000        // =1120403456
 1276584: b9001809     	str	w9, [x0, #0x18]
 1276588: f9001101     	str	x1, [x8, #0x20]
 127658c: 1e270140     	fmov	s0, w10
 1276590: 14000007     	b	0x12765ac <__start_il2cpp+0xcede8>
 1276594: f9401128     	ldr	x8, [x9, #0x20]
 1276598: f9406108     	ldr	x8, [x8, #0xc0]
 127659c: f9403902     	ldr	x2, [x8, #0x70]
 12765a0: 941a0f9d     	bl	0x18fa414 <__start_il2cpp+0x752c50>
 12765a4: 52a85908     	mov	w8, #0x42c80000         // =1120403456
 12765a8: 1e270100     	fmov	s0, w8
 12765ac: f94002e0     	ldr	x0, [x23]
 12765b0: b4008120     	cbz	x0, 0x12775d4 <__start_il2cpp+0xcfe10>
 12765b4: f9400262     	ldr	x2, [x19]
 12765b8: 2a1403e1     	mov	w1, w20
 12765bc: aa1f03e3     	mov	x3, xzr
 12765c0: 94005a65     	bl	0x128cf54 <__start_il2cpp+0xe5790>
 12765c4: f94002e0     	ldr	x0, [x23]
 12765c8: b4008060     	cbz	x0, 0x12775d4 <__start_il2cpp+0xcfe10>
 12765cc: 2a1403e1     	mov	w1, w20
 12765d0: aa1f03e2     	mov	x2, xzr
 12765d4: 9400619b     	bl	0x128ec40 <__start_il2cpp+0xe747c>
 12765d8: f94002e8     	ldr	x8, [x23]
 12765dc: b4007fc8     	cbz	x8, 0x12775d4 <__start_il2cpp+0xcfe10>
 12765e0: 9000af73     	adrp	x19, 0x2862000
 12765e4: f9444e73     	ldr	x19, [x19, #0x898]
 12765e8: 1e220008     	scvtf	s8, w0
 12765ec: aa0803e0     	mov	x0, x8
 12765f0: 2a1403e1     	mov	w1, w20
 12765f4: f9400262     	ldr	x2, [x19]
 12765f8: aa1f03e3     	mov	x3, xzr
 12765fc: 94005a4e     	bl	0x128cf34 <__start_il2cpp+0xe5770>
 1276600: 52a85908     	mov	w8, #0x42c80000         // =1120403456
 1276604: 1e270101     	fmov	s1, w8
 1276608: 1e212000     	fcmp	s0, s1
 127660c: 54000565     	b.pl	0x12766b8 <__start_il2cpp+0xceef4>
 1276610: b0ffa108     	adrp	x8, 0x697000
 1276614: bd44dd00     	ldr	s0, [x8, #0x4dc]
 1276618: 52a85908     	mov	w8, #0x42c80000         // =1120403456
 127661c: 1e270101     	fmov	s1, w8
 1276620: 1e201900     	fdiv	s0, s8, s0
 1276624: 1e210800     	fmul	s0, s0, s1
 1276628: 1e212000     	fcmp	s0, s1
 127662c: 540003ab     	b.lt	0x12766a0 <__start_il2cpp+0xceedc>
 1276630: f9400300     	ldr	x0, [x24]
 1276634: b4007d00     	cbz	x0, 0x12775d4 <__start_il2cpp+0xcfe10>
 1276638: d000af29     	adrp	x9, 0x285c000 <_ZTVN10__cxxabiv119__pointer_type_infoE+0x18>
 127663c: f9400261     	ldr	x1, [x19]
 1276640: f947a529     	ldr	x9, [x9, #0xf48]
 1276644: b9401c0a     	ldr	w10, [x0, #0x1c]
 1276648: f9400808     	ldr	x8, [x0, #0x10]
 127664c: f9400129     	ldr	x9, [x9]
 1276650: 1100054a     	add	w10, w10, #0x1
 1276654: b9001c0a     	str	w10, [x0, #0x1c]
 1276658: b4007be8     	cbz	x8, 0x12775d4 <__start_il2cpp+0xcfe10>
 127665c: b980180a     	ldrsw	x10, [x0, #0x18]
 1276660: b940190b     	ldr	w11, [x8, #0x18]
 1276664: 6b0b015f     	cmp	w10, w11
 1276668: 54000102     	b.hs	0x1276688 <__start_il2cpp+0xceec4>
 127666c: 11000549     	add	w9, w10, #0x1
 1276670: 8b0a0d08     	add	x8, x8, x10, lsl #3
 1276674: 52a8590a     	mov	w10, #0x42c80000        // =1120403456
 1276678: b9001809     	str	w9, [x0, #0x18]
 127667c: f9001101     	str	x1, [x8, #0x20]
 1276680: 1e270140     	fmov	s0, w10
 1276684: 14000007     	b	0x12766a0 <__start_il2cpp+0xceedc>
 1276688: f9401128     	ldr	x8, [x9, #0x20]
 127668c: f9406108     	ldr	x8, [x8, #0xc0]
 1276690: f9403902     	ldr	x2, [x8, #0x70]
 1276694: 941a0f60     	bl	0x18fa414 <__start_il2cpp+0x752c50>
 1276698: 52a85908     	mov	w8, #0x42c80000         // =1120403456
 127669c: 1e270100     	fmov	s0, w8
 12766a0: f94002e0     	ldr	x0, [x23]
 12766a4: b4007980     	cbz	x0, 0x12775d4 <__start_il2cpp+0xcfe10>
 12766a8: f9400262     	ldr	x2, [x19]
 12766ac: 2a1403e1     	mov	w1, w20
 12766b0: aa1f03e3     	mov	x3, xzr
 12766b4: 94005a28     	bl	0x128cf54 <__start_il2cpp+0xe5790>
 12766b8: f94002e0     	ldr	x0, [x23]
 12766bc: b40078c0     	cbz	x0, 0x12775d4 <__start_il2cpp+0xcfe10>
 12766c0: 9000af73     	adrp	x19, 0x2862000
 12766c4: f9443a73     	ldr	x19, [x19, #0x870]
 12766c8: 2a1403e1     	mov	w1, w20
 12766cc: aa1f03e3     	mov	x3, xzr
 12766d0: f9400262     	ldr	x2, [x19]
 12766d4: 94005a18     	bl	0x128cf34 <__start_il2cpp+0xe5770>
 12766d8: 52a85908     	mov	w8, #0x42c80000         // =1120403456
 12766dc: 1e270101     	fmov	s1, w8
 12766e0: 1e212000     	fcmp	s0, s1
 12766e4: 54000565     	b.pl	0x1276790 <__start_il2cpp+0xcefcc>
 12766e8: b0ffa108     	adrp	x8, 0x697000
 12766ec: bd45e500     	ldr	s0, [x8, #0x5e4]
 12766f0: 52a85908     	mov	w8, #0x42c80000         // =1120403456
 12766f4: 1e270101     	fmov	s1, w8
 12766f8: 1e201900     	fdiv	s0, s8, s0
 12766fc: 1e210800     	fmul	s0, s0, s1
 1276700: 1e212000     	fcmp	s0, s1
 1276704: 540003ab     	b.lt	0x1276778 <__start_il2cpp+0xcefb4>
 1276708: f9400300     	ldr	x0, [x24]
 127670c: b4007640     	cbz	x0, 0x12775d4 <__start_il2cpp+0xcfe10>
 1276710: d000af29     	adrp	x9, 0x285c000 <_ZTVN10__cxxabiv119__pointer_type_infoE+0x18>
 1276714: f9400261     	ldr	x1, [x19]
 1276718: f947a529     	ldr	x9, [x9, #0xf48]
 127671c: b9401c0a     	ldr	w10, [x0, #0x1c]
 1276720: f9400808     	ldr	x8, [x0, #0x10]
 1276724: f9400129     	ldr	x9, [x9]
 1276728: 1100054a     	add	w10, w10, #0x1
 127672c: b9001c0a     	str	w10, [x0, #0x1c]
 1276730: b4007528     	cbz	x8, 0x12775d4 <__start_il2cpp+0xcfe10>
 1276734: b980180a     	ldrsw	x10, [x0, #0x18]
 1276738: b940190b     	ldr	w11, [x8, #0x18]
 127673c: 6b0b015f     	cmp	w10, w11
 1276740: 54000102     	b.hs	0x1276760 <__start_il2cpp+0xcef9c>
 1276744: 11000549     	add	w9, w10, #0x1
 1276748: 8b0a0d08     	add	x8, x8, x10, lsl #3
 127674c: 52a8590a     	mov	w10, #0x42c80000        // =1120403456
 1276750: b9001809     	str	w9, [x0, #0x18]
 1276754: f9001101     	str	x1, [x8, #0x20]
 1276758: 1e270140     	fmov	s0, w10
 127675c: 14000007     	b	0x1276778 <__start_il2cpp+0xcefb4>
 1276760: f9401128     	ldr	x8, [x9, #0x20]
 1276764: f9406108     	ldr	x8, [x8, #0xc0]
 1276768: f9403902     	ldr	x2, [x8, #0x70]
 127676c: 941a0f2a     	bl	0x18fa414 <__start_il2cpp+0x752c50>
 1276770: 52a85908     	mov	w8, #0x42c80000         // =1120403456
 1276774: 1e270100     	fmov	s0, w8
 1276778: f94002e0     	ldr	x0, [x23]
 127677c: b40072c0     	cbz	x0, 0x12775d4 <__start_il2cpp+0xcfe10>
 1276780: f9400262     	ldr	x2, [x19]
 1276784: 2a1403e1     	mov	w1, w20
 1276788: aa1f03e3     	mov	x3, xzr
 127678c: 940059f2     	bl	0x128cf54 <__start_il2cpp+0xe5790>
 1276790: f94002e0     	ldr	x0, [x23]
 1276794: b4007200     	cbz	x0, 0x12775d4 <__start_il2cpp+0xcfe10>
 1276798: 9000af75     	adrp	x21, 0x2862000
 127679c: f9444ab5     	ldr	x21, [x21, #0x890]
 12767a0: 2a1403e1     	mov	w1, w20
 12767a4: aa1f03e3     	mov	x3, xzr
 12767a8: f94002a2     	ldr	x2, [x21]
 12767ac: 940059e2     	bl	0x128cf34 <__start_il2cpp+0xe5770>
 12767b0: 52a85908     	mov	w8, #0x42c80000         // =1120403456
 12767b4: 1e270101     	fmov	s1, w8
 12767b8: 1e212000     	fcmp	s0, s1
 12767bc: 54000625     	b.pl	0x1276880 <__start_il2cpp+0xcf0bc>
 12767c0: b0ffa108     	adrp	x8, 0x697000
 12767c4: bd46c100     	ldr	s0, [x8, #0x6c0]
 12767c8: 52a85908     	mov	w8, #0x42c80000         // =1120403456
 12767cc: 1e270101     	fmov	s1, w8
 12767d0: 1e201900     	fdiv	s0, s8, s0
 12767d4: 1e210808     	fmul	s8, s0, s1
 12767d8: 1e212100     	fcmp	s8, s1
 12767dc: 540003ab     	b.lt	0x1276850 <__start_il2cpp+0xcf08c>
 12767e0: f9400300     	ldr	x0, [x24]
 12767e4: b4006f80     	cbz	x0, 0x12775d4 <__start_il2cpp+0xcfe10>
 12767e8: d000af29     	adrp	x9, 0x285c000 <_ZTVN10__cxxabiv119__pointer_type_infoE+0x18>
 12767ec: f94002a1     	ldr	x1, [x21]
 12767f0: f947a529     	ldr	x9, [x9, #0xf48]
 12767f4: b9401c0a     	ldr	w10, [x0, #0x1c]
 12767f8: f9400808     	ldr	x8, [x0, #0x10]
 12767fc: f9400129     	ldr	x9, [x9]
 1276800: 1100054a     	add	w10, w10, #0x1
 1276804: b9001c0a     	str	w10, [x0, #0x1c]
 1276808: b4006e68     	cbz	x8, 0x12775d4 <__start_il2cpp+0xcfe10>
 127680c: b980180a     	ldrsw	x10, [x0, #0x18]
 1276810: b940190b     	ldr	w11, [x8, #0x18]
 1276814: 6b0b015f     	cmp	w10, w11
 1276818: 54000102     	b.hs	0x1276838 <__start_il2cpp+0xcf074>
 127681c: 11000549     	add	w9, w10, #0x1
 1276820: 8b0a0d08     	add	x8, x8, x10, lsl #3
 1276824: 52a8590a     	mov	w10, #0x42c80000        // =1120403456
 1276828: b9001809     	str	w9, [x0, #0x18]
 127682c: f9001101     	str	x1, [x8, #0x20]
 1276830: 1e270148     	fmov	s8, w10
 1276834: 14000007     	b	0x1276850 <__start_il2cpp+0xcf08c>
 1276838: f9401128     	ldr	x8, [x9, #0x20]
 127683c: f9406108     	ldr	x8, [x8, #0xc0]
 1276840: f9403902     	ldr	x2, [x8, #0x70]
 1276844: 941a0ef4     	bl	0x18fa414 <__start_il2cpp+0x752c50>
 1276848: 52a85908     	mov	w8, #0x42c80000         // =1120403456
 127684c: 1e270108     	fmov	s8, w8
 1276850: f9405f80     	ldr	x0, [x28, #0xb8]
 1276854: b4006c00     	cbz	x0, 0x12775d4 <__start_il2cpp+0xcfe10>
 1276858: f9405b93     	ldr	x19, [x28, #0xb0]
 127685c: aa1f03e1     	mov	x1, xzr
 1276860: 9400bf6b     	bl	0x12a660c <__start_il2cpp+0xfee48>
 1276864: b4006b93     	cbz	x19, 0x12775d4 <__start_il2cpp+0xcfe10>
 1276868: f94002a2     	ldr	x2, [x21]
 127686c: 2a0003e1     	mov	w1, w0
 1276870: aa1303e0     	mov	x0, x19
 1276874: 4ea81d00     	mov	v0.16b, v8.16b
 1276878: aa1f03e3     	mov	x3, xzr
 127687c: 940059b6     	bl	0x128cf54 <__start_il2cpp+0xe5790>
 1276880: f94002e0     	ldr	x0, [x23]
 1276884: b4006a80     	cbz	x0, 0x12775d4 <__start_il2cpp+0xcfe10>
 1276888: 2a1403e1     	mov	w1, w20
 127688c: aa1f03e2     	mov	x2, xzr
 1276890: 940060f2     	bl	0x128ec58 <__start_il2cpp+0xe7494>
 1276894: f94002e8     	ldr	x8, [x23]
 1276898: b40069e8     	cbz	x8, 0x12775d4 <__start_il2cpp+0xcfe10>
 127689c: 9000af73     	adrp	x19, 0x2862000
 12768a0: f9441e73     	ldr	x19, [x19, #0x838]
 12768a4: 1e220008     	scvtf	s8, w0
 12768a8: aa0803e0     	mov	x0, x8
 12768ac: 2a1403e1     	mov	w1, w20
 12768b0: f9400262     	ldr	x2, [x19]
 12768b4: aa1f03e3     	mov	x3, xzr
 12768b8: 9400599f     	bl	0x128cf34 <__start_il2cpp+0xe5770>
 12768bc: 52a85908     	mov	w8, #0x42c80000         // =1120403456
 12768c0: 1e270101     	fmov	s1, w8
 12768c4: 1e212000     	fcmp	s0, s1
 12768c8: 54000565     	b.pl	0x1276974 <__start_il2cpp+0xcf1b0>
 12768cc: b0ffa108     	adrp	x8, 0x697000
 12768d0: bd44dd00     	ldr	s0, [x8, #0x4dc]
 12768d4: 52a85908     	mov	w8, #0x42c80000         // =1120403456
 12768d8: 1e270101     	fmov	s1, w8
 12768dc: 1e201900     	fdiv	s0, s8, s0
 12768e0: 1e210800     	fmul	s0, s0, s1
 12768e4: 1e212000     	fcmp	s0, s1
 12768e8: 540003ab     	b.lt	0x127695c <__start_il2cpp+0xcf198>
 12768ec: f9400300     	ldr	x0, [x24]
 12768f0: b4006720     	cbz	x0, 0x12775d4 <__start_il2cpp+0xcfe10>
 12768f4: d000af29     	adrp	x9, 0x285c000 <_ZTVN10__cxxabiv119__pointer_type_infoE+0x18>
 12768f8: f9400261     	ldr	x1, [x19]
 12768fc: f947a529     	ldr	x9, [x9, #0xf48]
 1276900: b9401c0a     	ldr	w10, [x0, #0x1c]
 1276904: f9400808     	ldr	x8, [x0, #0x10]
 1276908: f9400129     	ldr	x9, [x9]
 127690c: 1100054a     	add	w10, w10, #0x1
 1276910: b9001c0a     	str	w10, [x0, #0x1c]
 1276914: b4006608     	cbz	x8, 0x12775d4 <__start_il2cpp+0xcfe10>
 1276918: b980180a     	ldrsw	x10, [x0, #0x18]
 127691c: b940190b     	ldr	w11, [x8, #0x18]
 1276920: 6b0b015f     	cmp	w10, w11
 1276924: 54000102     	b.hs	0x1276944 <__start_il2cpp+0xcf180>
 1276928: 11000549     	add	w9, w10, #0x1
 127692c: 8b0a0d08     	add	x8, x8, x10, lsl #3
 1276930: 52a8590a     	mov	w10, #0x42c80000        // =1120403456
 1276934: b9001809     	str	w9, [x0, #0x18]
 1276938: f9001101     	str	x1, [x8, #0x20]
 127693c: 1e270140     	fmov	s0, w10
 1276940: 14000007     	b	0x127695c <__start_il2cpp+0xcf198>
 1276944: f9401128     	ldr	x8, [x9, #0x20]
 1276948: f9406108     	ldr	x8, [x8, #0xc0]
 127694c: f9403902     	ldr	x2, [x8, #0x70]
 1276950: 941a0eb1     	bl	0x18fa414 <__start_il2cpp+0x752c50>
 1276954: 52a85908     	mov	w8, #0x42c80000         // =1120403456
 1276958: 1e270100     	fmov	s0, w8
 127695c: f94002e0     	ldr	x0, [x23]
 1276960: b40063a0     	cbz	x0, 0x12775d4 <__start_il2cpp+0xcfe10>
 1276964: f9400262     	ldr	x2, [x19]
 1276968: 2a1403e1     	mov	w1, w20
 127696c: aa1f03e3     	mov	x3, xzr
 1276970: 94005979     	bl	0x128cf54 <__start_il2cpp+0xe5790>
 1276974: f94002e0     	ldr	x0, [x23]
 1276978: b40062e0     	cbz	x0, 0x12775d4 <__start_il2cpp+0xcfe10>
 127697c: 9000af73     	adrp	x19, 0x2862000
 1276980: f9443673     	ldr	x19, [x19, #0x868]
 1276984: 2a1403e1     	mov	w1, w20
 1276988: aa1f03e3     	mov	x3, xzr
 127698c: f9400262     	ldr	x2, [x19]
 1276990: 94005969     	bl	0x128cf34 <__start_il2cpp+0xe5770>
 1276994: 52a85908     	mov	w8, #0x42c80000         // =1120403456
 1276998: 1e270101     	fmov	s1, w8
 127699c: 1e212000     	fcmp	s0, s1
 12769a0: 54000565     	b.pl	0x1276a4c <__start_il2cpp+0xcf288>
 12769a4: b0ffa108     	adrp	x8, 0x697000
 12769a8: bd46c100     	ldr	s0, [x8, #0x6c0]
 12769ac: 52a85908     	mov	w8, #0x42c80000         // =1120403456
 12769b0: 1e270101     	fmov	s1, w8
 12769b4: 1e201900     	fdiv	s0, s8, s0
 12769b8: 1e210800     	fmul	s0, s0, s1
 12769bc: 1e212000     	fcmp	s0, s1
 12769c0: 540003ab     	b.lt	0x1276a34 <__start_il2cpp+0xcf270>
 12769c4: f9400300     	ldr	x0, [x24]
 12769c8: b4006060     	cbz	x0, 0x12775d4 <__start_il2cpp+0xcfe10>
 12769cc: d000af29     	adrp	x9, 0x285c000 <_ZTVN10__cxxabiv119__pointer_type_infoE+0x18>
 12769d0: f9400261     	ldr	x1, [x19]
 12769d4: f947a529     	ldr	x9, [x9, #0xf48]
 12769d8: b9401c0a     	ldr	w10, [x0, #0x1c]
 12769dc: f9400808     	ldr	x8, [x0, #0x10]
 12769e0: f9400129     	ldr	x9, [x9]
 12769e4: 1100054a     	add	w10, w10, #0x1
 12769e8: b9001c0a     	str	w10, [x0, #0x1c]
 12769ec: b4005f48     	cbz	x8, 0x12775d4 <__start_il2cpp+0xcfe10>
 12769f0: b980180a     	ldrsw	x10, [x0, #0x18]
 12769f4: b940190b     	ldr	w11, [x8, #0x18]
 12769f8: 6b0b015f     	cmp	w10, w11
 12769fc: 54000102     	b.hs	0x1276a1c <__start_il2cpp+0xcf258>
 1276a00: 11000549     	add	w9, w10, #0x1
 1276a04: 8b0a0d08     	add	x8, x8, x10, lsl #3
 1276a08: 52a8590a     	mov	w10, #0x42c80000        // =1120403456
 1276a0c: b9001809     	str	w9, [x0, #0x18]
 1276a10: f9001101     	str	x1, [x8, #0x20]
 1276a14: 1e270140     	fmov	s0, w10
 1276a18: 14000007     	b	0x1276a34 <__start_il2cpp+0xcf270>
 1276a1c: f9401128     	ldr	x8, [x9, #0x20]
 1276a20: f9406108     	ldr	x8, [x8, #0xc0]
 1276a24: f9403902     	ldr	x2, [x8, #0x70]
 1276a28: 941a0e7b     	bl	0x18fa414 <__start_il2cpp+0x752c50>
 1276a2c: 52a85908     	mov	w8, #0x42c80000         // =1120403456
 1276a30: 1e270100     	fmov	s0, w8
 1276a34: f94002e0     	ldr	x0, [x23]
 1276a38: b4005ce0     	cbz	x0, 0x12775d4 <__start_il2cpp+0xcfe10>
 1276a3c: f9400262     	ldr	x2, [x19]
 1276a40: 2a1403e1     	mov	w1, w20
 1276a44: aa1f03e3     	mov	x3, xzr
 1276a48: 94005943     	bl	0x128cf54 <__start_il2cpp+0xe5790>
 1276a4c: f94002e0     	ldr	x0, [x23]
 1276a50: b4005c20     	cbz	x0, 0x12775d4 <__start_il2cpp+0xcfe10>
 1276a54: 9000af73     	adrp	x19, 0x2862000
 1276a58: f9444673     	ldr	x19, [x19, #0x888]
 1276a5c: 2a1403e1     	mov	w1, w20
 1276a60: aa1f03e3     	mov	x3, xzr
 1276a64: f9400262     	ldr	x2, [x19]
 1276a68: 94005933     	bl	0x128cf34 <__start_il2cpp+0xe5770>
 1276a6c: 52a85908     	mov	w8, #0x42c80000         // =1120403456
 1276a70: 1e270101     	fmov	s1, w8
 1276a74: 1e212000     	fcmp	s0, s1
 1276a78: 54000565     	b.pl	0x1276b24 <__start_il2cpp+0xcf360>
 1276a7c: b0ffa108     	adrp	x8, 0x697000
 1276a80: bd456900     	ldr	s0, [x8, #0x568]
 1276a84: 52a85908     	mov	w8, #0x42c80000         // =1120403456
 1276a88: 1e270101     	fmov	s1, w8
 1276a8c: 1e201900     	fdiv	s0, s8, s0
 1276a90: 1e210800     	fmul	s0, s0, s1
 1276a94: 1e212000     	fcmp	s0, s1
 1276a98: 540003ab     	b.lt	0x1276b0c <__start_il2cpp+0xcf348>
 1276a9c: f9400300     	ldr	x0, [x24]
 1276aa0: b40059a0     	cbz	x0, 0x12775d4 <__start_il2cpp+0xcfe10>
 1276aa4: d000af29     	adrp	x9, 0x285c000 <_ZTVN10__cxxabiv119__pointer_type_infoE+0x18>
 1276aa8: f9400261     	ldr	x1, [x19]
 1276aac: f947a529     	ldr	x9, [x9, #0xf48]
 1276ab0: b9401c0a     	ldr	w10, [x0, #0x1c]
 1276ab4: f9400808     	ldr	x8, [x0, #0x10]
 1276ab8: f9400129     	ldr	x9, [x9]
 1276abc: 1100054a     	add	w10, w10, #0x1
 1276ac0: b9001c0a     	str	w10, [x0, #0x1c]
 1276ac4: b4005888     	cbz	x8, 0x12775d4 <__start_il2cpp+0xcfe10>
 1276ac8: b980180a     	ldrsw	x10, [x0, #0x18]
 1276acc: b940190b     	ldr	w11, [x8, #0x18]
 1276ad0: 6b0b015f     	cmp	w10, w11
 1276ad4: 54000102     	b.hs	0x1276af4 <__start_il2cpp+0xcf330>
 1276ad8: 11000549     	add	w9, w10, #0x1
 1276adc: 8b0a0d08     	add	x8, x8, x10, lsl #3
 1276ae0: 52a8590a     	mov	w10, #0x42c80000        // =1120403456
 1276ae4: b9001809     	str	w9, [x0, #0x18]
 1276ae8: f9001101     	str	x1, [x8, #0x20]
 1276aec: 1e270140     	fmov	s0, w10
 1276af0: 14000007     	b	0x1276b0c <__start_il2cpp+0xcf348>
 1276af4: f9401128     	ldr	x8, [x9, #0x20]
 1276af8: f9406108     	ldr	x8, [x8, #0xc0]
 1276afc: f9403902     	ldr	x2, [x8, #0x70]
 1276b00: 941a0e45     	bl	0x18fa414 <__start_il2cpp+0x752c50>
 1276b04: 52a85908     	mov	w8, #0x42c80000         // =1120403456
 1276b08: 1e270100     	fmov	s0, w8
 1276b0c: f94002e0     	ldr	x0, [x23]
 1276b10: b4005620     	cbz	x0, 0x12775d4 <__start_il2cpp+0xcfe10>
 1276b14: f9400262     	ldr	x2, [x19]
 1276b18: 2a1403e1     	mov	w1, w20
 1276b1c: aa1f03e3     	mov	x3, xzr
 1276b20: 9400590d     	bl	0x128cf54 <__start_il2cpp+0xe5790>
