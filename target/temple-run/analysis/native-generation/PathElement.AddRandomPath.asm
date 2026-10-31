
/tmp/temple-libil2cpp.so:	file format elf64-littleaarch64

Disassembly of section il2cpp:

00000000011a77c4 <__start_il2cpp>:
 12e7584: a9bc67fe     	stp	x30, x25, [sp, #-0x40]!
 12e7588: a9015ff8     	stp	x24, x23, [sp, #0x10]
 12e758c: a90257f6     	stp	x22, x21, [sp, #0x20]
 12e7590: a9034ff4     	stp	x20, x19, [sp, #0x30]
 12e7594: b000abb4     	adrp	x20, 0x285c000 <_ZTVN10__cxxabiv119__pointer_type_infoE+0x18>
 12e7598: f9456294     	ldr	x20, [x20, #0xac0]
 12e759c: 2a0203f6     	mov	w22, w2
 12e75a0: aa0003f5     	mov	x21, x0
 12e75a4: 51000433     	sub	w19, w1, #0x1
 12e75a8: d000ba78     	adrp	x24, 0x2a35000
 12e75ac: 52800039     	mov	w25, #0x1               // =1
 12e75b0: 396c7f08     	ldrb	w8, [x24, #0xb1f]
 12e75b4: 37000088     	tbnz	w8, #0x0, 0x12e75c4 <__start_il2cpp+0x13fe00>
 12e75b8: aa1403e0     	mov	x0, x20
 12e75bc: 97f76247     	bl	0x10bfed8 <CloseNLSocket+0x410>
 12e75c0: 392c7f19     	strb	w25, [x24, #0xb1f]
 12e75c4: 3100067f     	cmn	w19, #0x1
 12e75c8: 54001580     	b.eq	0x12e7878 <__start_il2cpp+0x1400b4>
 12e75cc: 710006df     	cmp	w22, #0x1
 12e75d0: 54000580     	b.eq	0x12e7680 <__start_il2cpp+0x13febc>
 12e75d4: 52800021     	mov	w1, #0x1                // =1
 12e75d8: aa1503e0     	mov	x0, x21
 12e75dc: 97fff0a8     	bl	0x12e387c <__start_il2cpp+0x13c0b8>
 12e75e0: 360004c0     	tbz	w0, #0x0, 0x12e7678 <__start_il2cpp+0x13feb4>
 12e75e4: f9400280     	ldr	x0, [x20]
 12e75e8: f9402ab7     	ldr	x23, [x21, #0x50]
 12e75ec: b940e008     	ldr	w8, [x0, #0xe0]
 12e75f0: 35000048     	cbnz	w8, 0x12e75f8 <__start_il2cpp+0x13fe34>
 12e75f4: 97f7627b     	bl	0x10bffe0 <CloseNLSocket+0x518>
 12e75f8: aa1703e0     	mov	x0, x23
 12e75fc: aa1f03e1     	mov	x1, xzr
 12e7600: aa1f03e2     	mov	x2, xzr
 12e7604: 94474491     	bl	0x24b8848 <__start_il2cpp+0x1311084>
 12e7608: 360000a0     	tbz	w0, #0x0, 0x12e761c <__start_il2cpp+0x13fe58>
 12e760c: f9402aa0     	ldr	x0, [x21, #0x50]
 12e7610: b40013e0     	cbz	x0, 0x12e788c <__start_il2cpp+0x1400c8>
 12e7614: 52800062     	mov	w2, #0x3                // =3
 12e7618: 14000016     	b	0x12e7670 <__start_il2cpp+0x13feac>
 12e761c: 52800021     	mov	w1, #0x1                // =1
 12e7620: aa1503e0     	mov	x0, x21
 12e7624: 97fff209     	bl	0x12e3e48 <__start_il2cpp+0x13c684>
 12e7628: f9400288     	ldr	x8, [x20]
 12e762c: aa0003f7     	mov	x23, x0
 12e7630: b940e109     	ldr	w9, [x8, #0xe0]
 12e7634: 35000069     	cbnz	w9, 0x12e7640 <__start_il2cpp+0x13fe7c>
 12e7638: aa0803e0     	mov	x0, x8
 12e763c: 97f76269     	bl	0x10bffe0 <CloseNLSocket+0x518>
 12e7640: aa1703e0     	mov	x0, x23
 12e7644: aa1f03e1     	mov	x1, xzr
 12e7648: aa1f03e2     	mov	x2, xzr
 12e764c: 9447447f     	bl	0x24b8848 <__start_il2cpp+0x1311084>
 12e7650: 36000140     	tbz	w0, #0x0, 0x12e7678 <__start_il2cpp+0x13feb4>
 12e7654: 52800022     	mov	w2, #0x1                // =1
 12e7658: aa1503e0     	mov	x0, x21
 12e765c: aa1703e1     	mov	x1, x23
 12e7660: 97ffff49     	bl	0x12e7384 <__start_il2cpp+0x13fbc0>
 12e7664: b4001157     	cbz	x23, 0x12e788c <__start_il2cpp+0x1400c8>
 12e7668: 52800062     	mov	w2, #0x3                // =3
 12e766c: aa1703e0     	mov	x0, x23
 12e7670: 2a1303e1     	mov	w1, w19
 12e7674: 97ffffc4     	bl	0x12e7584 <__start_il2cpp+0x13fdc0>
 12e7678: 71000adf     	cmp	w22, #0x2
 12e767c: 54000580     	b.eq	0x12e772c <__start_il2cpp+0x13ff68>
 12e7680: 52800041     	mov	w1, #0x2                // =2
 12e7684: aa1503e0     	mov	x0, x21
 12e7688: 97fff07d     	bl	0x12e387c <__start_il2cpp+0x13c0b8>
 12e768c: 360004c0     	tbz	w0, #0x0, 0x12e7724 <__start_il2cpp+0x13ff60>
 12e7690: f9400280     	ldr	x0, [x20]
 12e7694: f9402eb7     	ldr	x23, [x21, #0x58]
 12e7698: b940e008     	ldr	w8, [x0, #0xe0]
 12e769c: 35000048     	cbnz	w8, 0x12e76a4 <__start_il2cpp+0x13fee0>
 12e76a0: 97f76250     	bl	0x10bffe0 <CloseNLSocket+0x518>
 12e76a4: aa1703e0     	mov	x0, x23
 12e76a8: aa1f03e1     	mov	x1, xzr
 12e76ac: aa1f03e2     	mov	x2, xzr
 12e76b0: 94474466     	bl	0x24b8848 <__start_il2cpp+0x1311084>
 12e76b4: 360000a0     	tbz	w0, #0x0, 0x12e76c8 <__start_il2cpp+0x13ff04>
 12e76b8: f9402ea0     	ldr	x0, [x21, #0x58]
 12e76bc: b4000e80     	cbz	x0, 0x12e788c <__start_il2cpp+0x1400c8>
 12e76c0: 52800082     	mov	w2, #0x4                // =4
 12e76c4: 14000016     	b	0x12e771c <__start_il2cpp+0x13ff58>
 12e76c8: 52800041     	mov	w1, #0x2                // =2
 12e76cc: aa1503e0     	mov	x0, x21
 12e76d0: 97fff1de     	bl	0x12e3e48 <__start_il2cpp+0x13c684>
 12e76d4: f9400288     	ldr	x8, [x20]
 12e76d8: aa0003f7     	mov	x23, x0
 12e76dc: b940e109     	ldr	w9, [x8, #0xe0]
 12e76e0: 35000069     	cbnz	w9, 0x12e76ec <__start_il2cpp+0x13ff28>
 12e76e4: aa0803e0     	mov	x0, x8
 12e76e8: 97f7623e     	bl	0x10bffe0 <CloseNLSocket+0x518>
 12e76ec: aa1703e0     	mov	x0, x23
 12e76f0: aa1f03e1     	mov	x1, xzr
 12e76f4: aa1f03e2     	mov	x2, xzr
 12e76f8: 94474454     	bl	0x24b8848 <__start_il2cpp+0x1311084>
 12e76fc: 36000140     	tbz	w0, #0x0, 0x12e7724 <__start_il2cpp+0x13ff60>
 12e7700: 52800042     	mov	w2, #0x2                // =2
 12e7704: aa1503e0     	mov	x0, x21
 12e7708: aa1703e1     	mov	x1, x23
 12e770c: 97ffff1e     	bl	0x12e7384 <__start_il2cpp+0x13fbc0>
 12e7710: b4000bf7     	cbz	x23, 0x12e788c <__start_il2cpp+0x1400c8>
 12e7714: 52800082     	mov	w2, #0x4                // =4
 12e7718: aa1703e0     	mov	x0, x23
 12e771c: 2a1303e1     	mov	w1, w19
 12e7720: 97ffff99     	bl	0x12e7584 <__start_il2cpp+0x13fdc0>
 12e7724: 71000edf     	cmp	w22, #0x3
 12e7728: 54000580     	b.eq	0x12e77d8 <__start_il2cpp+0x140014>
 12e772c: 52800061     	mov	w1, #0x3                // =3
 12e7730: aa1503e0     	mov	x0, x21
 12e7734: 97fff052     	bl	0x12e387c <__start_il2cpp+0x13c0b8>
 12e7738: 360004c0     	tbz	w0, #0x0, 0x12e77d0 <__start_il2cpp+0x14000c>
 12e773c: f9400280     	ldr	x0, [x20]
 12e7740: f94036b7     	ldr	x23, [x21, #0x68]
 12e7744: b940e008     	ldr	w8, [x0, #0xe0]
 12e7748: 35000048     	cbnz	w8, 0x12e7750 <__start_il2cpp+0x13ff8c>
 12e774c: 97f76225     	bl	0x10bffe0 <CloseNLSocket+0x518>
 12e7750: aa1703e0     	mov	x0, x23
 12e7754: aa1f03e1     	mov	x1, xzr
 12e7758: aa1f03e2     	mov	x2, xzr
 12e775c: 9447443b     	bl	0x24b8848 <__start_il2cpp+0x1311084>
 12e7760: 360000a0     	tbz	w0, #0x0, 0x12e7774 <__start_il2cpp+0x13ffb0>
 12e7764: f94036a0     	ldr	x0, [x21, #0x68]
 12e7768: b4000920     	cbz	x0, 0x12e788c <__start_il2cpp+0x1400c8>
 12e776c: 52800022     	mov	w2, #0x1                // =1
 12e7770: 14000016     	b	0x12e77c8 <__start_il2cpp+0x140004>
 12e7774: 52800061     	mov	w1, #0x3                // =3
 12e7778: aa1503e0     	mov	x0, x21
 12e777c: 97fff1b3     	bl	0x12e3e48 <__start_il2cpp+0x13c684>
 12e7780: f9400288     	ldr	x8, [x20]
 12e7784: aa0003f7     	mov	x23, x0
 12e7788: b940e109     	ldr	w9, [x8, #0xe0]
 12e778c: 35000069     	cbnz	w9, 0x12e7798 <__start_il2cpp+0x13ffd4>
 12e7790: aa0803e0     	mov	x0, x8
 12e7794: 97f76213     	bl	0x10bffe0 <CloseNLSocket+0x518>
 12e7798: aa1703e0     	mov	x0, x23
 12e779c: aa1f03e1     	mov	x1, xzr
 12e77a0: aa1f03e2     	mov	x2, xzr
 12e77a4: 94474429     	bl	0x24b8848 <__start_il2cpp+0x1311084>
 12e77a8: 36000140     	tbz	w0, #0x0, 0x12e77d0 <__start_il2cpp+0x14000c>
 12e77ac: 52800062     	mov	w2, #0x3                // =3
 12e77b0: aa1503e0     	mov	x0, x21
 12e77b4: aa1703e1     	mov	x1, x23
 12e77b8: 97fffef3     	bl	0x12e7384 <__start_il2cpp+0x13fbc0>
 12e77bc: b4000697     	cbz	x23, 0x12e788c <__start_il2cpp+0x1400c8>
 12e77c0: 52800022     	mov	w2, #0x1                // =1
 12e77c4: aa1703e0     	mov	x0, x23
 12e77c8: 2a1303e1     	mov	w1, w19
 12e77cc: 97ffff6e     	bl	0x12e7584 <__start_il2cpp+0x13fdc0>
 12e77d0: 710012df     	cmp	w22, #0x4
 12e77d4: 54000520     	b.eq	0x12e7878 <__start_il2cpp+0x1400b4>
 12e77d8: 52800081     	mov	w1, #0x4                // =4
 12e77dc: aa1503e0     	mov	x0, x21
 12e77e0: 97fff027     	bl	0x12e387c <__start_il2cpp+0x13c0b8>
 12e77e4: 360004a0     	tbz	w0, #0x0, 0x12e7878 <__start_il2cpp+0x1400b4>
 12e77e8: f9400280     	ldr	x0, [x20]
 12e77ec: f94032b6     	ldr	x22, [x21, #0x60]
 12e77f0: b940e008     	ldr	w8, [x0, #0xe0]
 12e77f4: 35000048     	cbnz	w8, 0x12e77fc <__start_il2cpp+0x140038>
 12e77f8: 97f761fa     	bl	0x10bffe0 <CloseNLSocket+0x518>
 12e77fc: aa1603e0     	mov	x0, x22
 12e7800: aa1f03e1     	mov	x1, xzr
 12e7804: aa1f03e2     	mov	x2, xzr
 12e7808: 94474410     	bl	0x24b8848 <__start_il2cpp+0x1311084>
 12e780c: 36000080     	tbz	w0, #0x0, 0x12e781c <__start_il2cpp+0x140058>
 12e7810: f94032b7     	ldr	x23, [x21, #0x60]
 12e7814: b50002b7     	cbnz	x23, 0x12e7868 <__start_il2cpp+0x1400a4>
 12e7818: 1400001d     	b	0x12e788c <__start_il2cpp+0x1400c8>
 12e781c: 52800081     	mov	w1, #0x4                // =4
 12e7820: aa1503e0     	mov	x0, x21
 12e7824: 97fff189     	bl	0x12e3e48 <__start_il2cpp+0x13c684>
 12e7828: f9400288     	ldr	x8, [x20]
 12e782c: aa0003f7     	mov	x23, x0
 12e7830: b940e109     	ldr	w9, [x8, #0xe0]
 12e7834: 35000069     	cbnz	w9, 0x12e7840 <__start_il2cpp+0x14007c>
 12e7838: aa0803e0     	mov	x0, x8
 12e783c: 97f761e9     	bl	0x10bffe0 <CloseNLSocket+0x518>
 12e7840: aa1703e0     	mov	x0, x23
 12e7844: aa1f03e1     	mov	x1, xzr
 12e7848: aa1f03e2     	mov	x2, xzr
 12e784c: 944743ff     	bl	0x24b8848 <__start_il2cpp+0x1311084>
 12e7850: 36000140     	tbz	w0, #0x0, 0x12e7878 <__start_il2cpp+0x1400b4>
 12e7854: 52800082     	mov	w2, #0x4                // =4
 12e7858: aa1503e0     	mov	x0, x21
 12e785c: aa1703e1     	mov	x1, x23
 12e7860: 97fffec9     	bl	0x12e7384 <__start_il2cpp+0x13fbc0>
 12e7864: b4000157     	cbz	x23, 0x12e788c <__start_il2cpp+0x1400c8>
 12e7868: 51000673     	sub	w19, w19, #0x1
 12e786c: 52800056     	mov	w22, #0x2               // =2
 12e7870: aa1703f5     	mov	x21, x23
 12e7874: 17ffff4f     	b	0x12e75b0 <__start_il2cpp+0x13fdec>
 12e7878: a9434ff4     	ldp	x20, x19, [sp, #0x30]
 12e787c: a94257f6     	ldp	x22, x21, [sp, #0x20]
 12e7880: a9415ff8     	ldp	x24, x23, [sp, #0x10]
 12e7884: a8c467fe     	ldp	x30, x25, [sp], #0x40
 12e7888: d65f03c0     	ret
 12e788c: 97f7621d     	bl	0x10c0100 <CloseNLSocket+0x638>
