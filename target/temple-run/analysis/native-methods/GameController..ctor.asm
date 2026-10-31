
/tmp/temple-libil2cpp.so:	file format elf64-littleaarch64

Disassembly of section il2cpp:

00000000011a77c4 <__start_il2cpp>:
 1278324: f81c0ffe     	str	x30, [sp, #-0x40]!
 1278328: a9015ff8     	stp	x24, x23, [sp, #0x10]
 127832c: a90257f6     	stp	x22, x21, [sp, #0x20]
 1278330: a9034ff4     	stp	x20, x19, [sp, #0x30]
 1278334: b000bdf8     	adrp	x24, 0x2a35000
 1278338: d000af57     	adrp	x23, 0x2862000
 127833c: d000af54     	adrp	x20, 0x2862000
 1278340: d000af56     	adrp	x22, 0x2862000
 1278344: b000af35     	adrp	x21, 0x285d000
 1278348: 395dd708     	ldrb	w8, [x24, #0x775]
 127834c: f94502f7     	ldr	x23, [x23, #0xa00]
 1278350: f9450694     	ldr	x20, [x20, #0xa08]
 1278354: f9450ad6     	ldr	x22, [x22, #0xa10]
 1278358: f9411ab5     	ldr	x21, [x21, #0x230]
 127835c: aa0003f3     	mov	x19, x0
 1278360: 37000668     	tbnz	w8, #0x0, 0x127842c <__start_il2cpp+0xd0c68>
 1278364: d000af40     	adrp	x0, 0x2862000
 1278368: f9450c00     	ldr	x0, [x0, #0xa18]
 127836c: 97f91edb     	bl	0x10bfed8 <CloseNLSocket+0x410>
 1278370: d000af40     	adrp	x0, 0x2862000
 1278374: f9451000     	ldr	x0, [x0, #0xa20]
 1278378: 97f91ed8     	bl	0x10bfed8 <CloseNLSocket+0x410>
 127837c: d000af40     	adrp	x0, 0x2862000
 1278380: f9450400     	ldr	x0, [x0, #0xa08]
 1278384: 97f91ed5     	bl	0x10bfed8 <CloseNLSocket+0x410>
 1278388: 9000af20     	adrp	x0, 0x285c000 <_ZTVN10__cxxabiv119__pointer_type_infoE+0x18>
 127838c: f947a800     	ldr	x0, [x0, #0xf50]
 1278390: 97f91ed2     	bl	0x10bfed8 <CloseNLSocket+0x410>
 1278394: d000af40     	adrp	x0, 0x2862000
 1278398: f9451400     	ldr	x0, [x0, #0xa28]
 127839c: 97f91ecf     	bl	0x10bfed8 <CloseNLSocket+0x410>
 12783a0: d000af40     	adrp	x0, 0x2862000
 12783a4: f9450000     	ldr	x0, [x0, #0xa00]
 12783a8: 97f91ecc     	bl	0x10bfed8 <CloseNLSocket+0x410>
 12783ac: d000af40     	adrp	x0, 0x2862000
 12783b0: f9451800     	ldr	x0, [x0, #0xa30]
 12783b4: 97f91ec9     	bl	0x10bfed8 <CloseNLSocket+0x410>
 12783b8: 9000af20     	adrp	x0, 0x285c000 <_ZTVN10__cxxabiv119__pointer_type_infoE+0x18>
 12783bc: f947ac00     	ldr	x0, [x0, #0xf58]
 12783c0: 97f91ec6     	bl	0x10bfed8 <CloseNLSocket+0x410>
 12783c4: b000af20     	adrp	x0, 0x285d000
 12783c8: f9411800     	ldr	x0, [x0, #0x230]
 12783cc: 97f91ec3     	bl	0x10bfed8 <CloseNLSocket+0x410>
 12783d0: d000af40     	adrp	x0, 0x2862000
 12783d4: f9451c00     	ldr	x0, [x0, #0xa38]
 12783d8: 97f91ec0     	bl	0x10bfed8 <CloseNLSocket+0x410>
 12783dc: d000af40     	adrp	x0, 0x2862000
 12783e0: f9452000     	ldr	x0, [x0, #0xa40]
 12783e4: 97f91ebd     	bl	0x10bfed8 <CloseNLSocket+0x410>
 12783e8: d000af40     	adrp	x0, 0x2862000
 12783ec: f9452400     	ldr	x0, [x0, #0xa48]
 12783f0: 97f91eba     	bl	0x10bfed8 <CloseNLSocket+0x410>
 12783f4: d000af40     	adrp	x0, 0x2862000
 12783f8: f9452800     	ldr	x0, [x0, #0xa50]
 12783fc: 97f91eb7     	bl	0x10bfed8 <CloseNLSocket+0x410>
 1278400: d000af40     	adrp	x0, 0x2862000
 1278404: f9450800     	ldr	x0, [x0, #0xa10]
 1278408: 97f91eb4     	bl	0x10bfed8 <CloseNLSocket+0x410>
 127840c: d000af40     	adrp	x0, 0x2862000
 1278410: f9452c00     	ldr	x0, [x0, #0xa58]
 1278414: 97f91eb1     	bl	0x10bfed8 <CloseNLSocket+0x410>
 1278418: d000af40     	adrp	x0, 0x2862000
 127841c: f9453000     	ldr	x0, [x0, #0xa60]
 1278420: 97f91eae     	bl	0x10bfed8 <CloseNLSocket+0x410>
 1278424: 52800028     	mov	w8, #0x1                // =1
 1278428: 391dd708     	strb	w8, [x24, #0x775]
 127842c: f0ffa0e8     	adrp	x8, 0x697000
 1278430: 3dc2a500     	ldr	q0, [x8, #0xa90]
 1278434: 91063268     	add	x8, x19, #0x18c
 1278438: 52800029     	mov	w9, #0x1                // =1
 127843c: 3d800100     	str	q0, [x8]
 1278440: 3906a269     	strb	w9, [x19, #0x1a8]
 1278444: f94002e0     	ldr	x0, [x23]
 1278448: 97f91f2b     	bl	0x10c00f4 <CloseNLSocket+0x62c>
 127844c: f9400281     	ldr	x1, [x20]
 1278450: aa0003f4     	mov	x20, x0
 1278454: 941a05fd     	bl	0x18f9c48 <__start_il2cpp+0x752484>
 1278458: f900da74     	str	x20, [x19, #0x1b0]
 127845c: f94002c8     	ldr	x8, [x22]
 1278460: 528000c1     	mov	w1, #0x6                // =6
 1278464: f900e668     	str	x8, [x19, #0x1c8]
 1278468: f94002a0     	ldr	x0, [x21]
 127846c: 97f91eb9     	bl	0x10bff50 <CloseNLSocket+0x488>
 1278470: b4000aa0     	cbz	x0, 0x12785c4 <__start_il2cpp+0xd0e00>
 1278474: b9401808     	ldr	w8, [x0, #0x18]
 1278478: 34000a48     	cbz	w8, 0x12785c0 <__start_il2cpp+0xd0dfc>
 127847c: d000af49     	adrp	x9, 0x2862000
 1278480: f9451d29     	ldr	x9, [x9, #0xa38]
 1278484: 7100051f     	cmp	w8, #0x1
 1278488: f9400129     	ldr	x9, [x9]
 127848c: f9001009     	str	x9, [x0, #0x20]
 1278490: 54000980     	b.eq	0x12785c0 <__start_il2cpp+0xd0dfc>
 1278494: d000af49     	adrp	x9, 0x2862000
 1278498: f9453129     	ldr	x9, [x9, #0xa60]
 127849c: 7100091f     	cmp	w8, #0x2
 12784a0: f9400129     	ldr	x9, [x9]
 12784a4: f9001409     	str	x9, [x0, #0x28]
 12784a8: 540008c9     	b.ls	0x12785c0 <__start_il2cpp+0xd0dfc>
 12784ac: d000af49     	adrp	x9, 0x2862000
 12784b0: f9452929     	ldr	x9, [x9, #0xa50]
 12784b4: 71000d1f     	cmp	w8, #0x3
 12784b8: f9400129     	ldr	x9, [x9]
 12784bc: f9001809     	str	x9, [x0, #0x30]
 12784c0: 54000800     	b.eq	0x12785c0 <__start_il2cpp+0xd0dfc>
 12784c4: d000af49     	adrp	x9, 0x2862000
 12784c8: f9452529     	ldr	x9, [x9, #0xa48]
 12784cc: 7100111f     	cmp	w8, #0x4
 12784d0: f9400129     	ldr	x9, [x9]
 12784d4: f9001c09     	str	x9, [x0, #0x38]
 12784d8: 54000749     	b.ls	0x12785c0 <__start_il2cpp+0xd0dfc>
 12784dc: d000af49     	adrp	x9, 0x2862000
 12784e0: f9452d29     	ldr	x9, [x9, #0xa58]
 12784e4: 7100151f     	cmp	w8, #0x5
 12784e8: f9400129     	ldr	x9, [x9]
 12784ec: f9002009     	str	x9, [x0, #0x40]
 12784f0: 54000680     	b.eq	0x12785c0 <__start_il2cpp+0xd0dfc>
 12784f4: d000af48     	adrp	x8, 0x2862000
 12784f8: f9452108     	ldr	x8, [x8, #0xa40]
 12784fc: d000af49     	adrp	x9, 0x2862000
 1278500: d000af54     	adrp	x20, 0x2862000
 1278504: f9451929     	ldr	x9, [x9, #0xa30]
 1278508: f9450e94     	ldr	x20, [x20, #0xa18]
 127850c: f9400108     	ldr	x8, [x8]
 1278510: 9000af35     	adrp	x21, 0x285c000 <_ZTVN10__cxxabiv119__pointer_type_infoE+0x18>
 1278514: 5280002a     	mov	w10, #0x1               // =1
 1278518: 5280010b     	mov	w11, #0x8               // =8
 127851c: f947aeb5     	ldr	x21, [x21, #0xf58]
 1278520: f9002408     	str	x8, [x0, #0x48]
 1278524: f900ea60     	str	x0, [x19, #0x1d0]
 1278528: 3907da6a     	strb	w10, [x19, #0x1f6]
 127852c: b902026b     	str	w11, [x19, #0x200]
 1278530: f9400120     	ldr	x0, [x9]
 1278534: 9000af36     	adrp	x22, 0x285c000 <_ZTVN10__cxxabiv119__pointer_type_infoE+0x18>
 1278538: d000af57     	adrp	x23, 0x2862000
 127853c: d000af58     	adrp	x24, 0x2862000
 1278540: f947aad6     	ldr	x22, [x22, #0xf50]
 1278544: f94516f7     	ldr	x23, [x23, #0xa28]
 1278548: f9451318     	ldr	x24, [x24, #0xa20]
 127854c: 97f91eea     	bl	0x10c00f4 <CloseNLSocket+0x62c>
 1278550: f9400281     	ldr	x1, [x20]
 1278554: aa0003f4     	mov	x20, x0
 1278558: 941a05bc     	bl	0x18f9c48 <__start_il2cpp+0x752484>
 127855c: d0ffa0e8     	adrp	x8, 0x696000
 1278560: fd474500     	ldr	d0, [x8, #0xe88]
 1278564: 52a81e08     	mov	w8, #0x40f00000         // =1089470464
 1278568: f9010674     	str	x20, [x19, #0x208]
 127856c: b9021a68     	str	w8, [x19, #0x218]
 1278570: fd010a60     	str	d0, [x19, #0x210]
 1278574: f94002a0     	ldr	x0, [x21]
 1278578: 97f91edf     	bl	0x10c00f4 <CloseNLSocket+0x62c>
 127857c: f94002c1     	ldr	x1, [x22]
 1278580: aa0003f4     	mov	x20, x0
 1278584: 941a05b1     	bl	0x18f9c48 <__start_il2cpp+0x752484>
 1278588: f9013674     	str	x20, [x19, #0x268]
 127858c: f94002e0     	ldr	x0, [x23]
 1278590: 97f91ed9     	bl	0x10c00f4 <CloseNLSocket+0x62c>
 1278594: f9400301     	ldr	x1, [x24]
 1278598: aa0003f4     	mov	x20, x0
 127859c: 941a05ab     	bl	0x18f9c48 <__start_il2cpp+0x752484>
 12785a0: f9013a74     	str	x20, [x19, #0x270]
 12785a4: aa1303e0     	mov	x0, x19
 12785a8: a9434ff4     	ldp	x20, x19, [sp, #0x30]
 12785ac: a94257f6     	ldp	x22, x21, [sp, #0x20]
 12785b0: a9415ff8     	ldp	x24, x23, [sp, #0x10]
 12785b4: aa1f03e1     	mov	x1, xzr
 12785b8: f84407fe     	ldr	x30, [sp], #0x40
 12785bc: 144906b1     	b	0x24ba080 <__start_il2cpp+0x13128bc>
 12785c0: 97f91ed2     	bl	0x10c0108 <CloseNLSocket+0x640>
 12785c4: 97f91ecf     	bl	0x10c0100 <CloseNLSocket+0x638>
