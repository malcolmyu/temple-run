
/tmp/temple-libil2cpp.so:	file format elf64-littleaarch64

Disassembly of section il2cpp:

00000000011a77c4 <__start_il2cpp>:
 126d4d0: fc160fee     	str	d14, [sp, #-0xa0]!
 126d4d4: 6d0133ed     	stp	d13, d12, [sp, #0x10]
 126d4d8: 6d022beb     	stp	d11, d10, [sp, #0x20]
 126d4dc: 6d0323e9     	stp	d9, d8, [sp, #0x30]
 126d4e0: a9047bfd     	stp	x29, x30, [sp, #0x40]
 126d4e4: a9056ffc     	stp	x28, x27, [sp, #0x50]
 126d4e8: a90667fa     	stp	x26, x25, [sp, #0x60]
 126d4ec: a9075ff8     	stp	x24, x23, [sp, #0x70]
 126d4f0: a90857f6     	stp	x22, x21, [sp, #0x80]
 126d4f4: a9094ff4     	stp	x20, x19, [sp, #0x90]
 126d4f8: 9000be55     	adrp	x21, 0x2a35000
 126d4fc: 395d16a8     	ldrb	w8, [x21, #0x745]
 126d500: 2a0103f4     	mov	w20, w1
 126d504: aa0003f3     	mov	x19, x0
 126d508: 37000308     	tbnz	w8, #0x0, 0x126d568 <__start_il2cpp+0xc5da4>
 126d50c: b000af80     	adrp	x0, 0x285e000
 126d510: f9414000     	ldr	x0, [x0, #0x280]
 126d514: 97f94a71     	bl	0x10bfed8 <CloseNLSocket+0x410>
 126d518: b000afa0     	adrp	x0, 0x2862000
 126d51c: f942a000     	ldr	x0, [x0, #0x540]
 126d520: 97f94a6e     	bl	0x10bfed8 <CloseNLSocket+0x410>
 126d524: f000af60     	adrp	x0, 0x285c000 <_ZTVN10__cxxabiv119__pointer_type_infoE+0x18>
 126d528: f9456000     	ldr	x0, [x0, #0xac0]
 126d52c: 97f94a6b     	bl	0x10bfed8 <CloseNLSocket+0x410>
 126d530: b000afa0     	adrp	x0, 0x2862000
 126d534: f9424800     	ldr	x0, [x0, #0x490]
 126d538: 97f94a68     	bl	0x10bfed8 <CloseNLSocket+0x410>
 126d53c: b000afa0     	adrp	x0, 0x2862000
 126d540: f9431c00     	ldr	x0, [x0, #0x638]
 126d544: 97f94a65     	bl	0x10bfed8 <CloseNLSocket+0x410>
 126d548: b000afa0     	adrp	x0, 0x2862000
 126d54c: f9432000     	ldr	x0, [x0, #0x640]
 126d550: 97f94a62     	bl	0x10bfed8 <CloseNLSocket+0x410>
 126d554: b000afa0     	adrp	x0, 0x2862000
 126d558: f9432400     	ldr	x0, [x0, #0x648]
 126d55c: 97f94a5f     	bl	0x10bfed8 <CloseNLSocket+0x410>
 126d560: 52800028     	mov	w8, #0x1                // =1
 126d564: 391d16a8     	strb	w8, [x21, #0x745]
 126d568: f9412e60     	ldr	x0, [x19, #0x258]
 126d56c: b4005300     	cbz	x0, 0x126dfcc <__start_il2cpp+0xc6808>
 126d570: f000af7b     	adrp	x27, 0x285c000 <_ZTVN10__cxxabiv119__pointer_type_infoE+0x18>
 126d574: f945637b     	ldr	x27, [x27, #0xac0]
 126d578: aa1f03e1     	mov	x1, xzr
 126d57c: 9400a090     	bl	0x12957bc <__start_il2cpp+0xedff8>
 126d580: f9400360     	ldr	x0, [x27]
 126d584: f9401675     	ldr	x21, [x19, #0x28]
 126d588: b940e008     	ldr	w8, [x0, #0xe0]
 126d58c: 35000048     	cbnz	w8, 0x126d594 <__start_il2cpp+0xc5dd0>
 126d590: 97f94a94     	bl	0x10bffe0 <CloseNLSocket+0x518>
 126d594: aa1503e0     	mov	x0, x21
 126d598: aa1f03e1     	mov	x1, xzr
 126d59c: aa1f03e2     	mov	x2, xzr
 126d5a0: 94492caa     	bl	0x24b8848 <__start_il2cpp+0x1311084>
 126d5a4: 36001ca0     	tbz	w0, #0x0, 0x126d938 <__start_il2cpp+0xc6174>
 126d5a8: f9401678     	ldr	x24, [x19, #0x28]
 126d5ac: b9403277     	ldr	w23, [x19, #0x30]
 126d5b0: d0ffa25d     	adrp	x29, 0x6b7000
 126d5b4: aa1f03f5     	mov	x21, xzr
 126d5b8: 2a1f03fc     	mov	w28, wzr
 126d5bc: 5280003a     	mov	w26, #0x1               // =1
 126d5c0: 91225bbd     	add	x29, x29, #0x896
 126d5c4: aa1503e8     	mov	x8, x21
 126d5c8: f9400360     	ldr	x0, [x27]
 126d5cc: aa0803f5     	mov	x21, x8
 126d5d0: b940e009     	ldr	w9, [x0, #0xe0]
 126d5d4: 35000049     	cbnz	w9, 0x126d5dc <__start_il2cpp+0xc5e18>
 126d5d8: 97f94a82     	bl	0x10bffe0 <CloseNLSocket+0x518>
 126d5dc: aa1503e0     	mov	x0, x21
 126d5e0: aa1f03e1     	mov	x1, xzr
 126d5e4: aa1f03e2     	mov	x2, xzr
 126d5e8: 94492fac     	bl	0x24b9498 <__start_il2cpp+0x1311cd4>
 126d5ec: 7100279f     	cmp	w28, #0x9
 126d5f0: 54001aa8     	b.hi	0x126d944 <__start_il2cpp+0xc6180>
 126d5f4: 36001a80     	tbz	w0, #0x0, 0x126d944 <__start_il2cpp+0xc6180>
 126d5f8: b4004eb8     	cbz	x24, 0x126dfcc <__start_il2cpp+0xc6808>
 126d5fc: 3940f308     	ldrb	w8, [x24, #0x3c]
 126d600: 350000c8     	cbnz	w8, 0x126d618 <__start_il2cpp+0xc5e54>
 126d604: aa1803e0     	mov	x0, x24
 126d608: aa1f03e1     	mov	x1, xzr
 126d60c: 9401d4a9     	bl	0x12e28b0 <__start_il2cpp+0x13b0ec>
 126d610: aa1803e8     	mov	x8, x24
 126d614: 3607fda0     	tbz	w0, #0x0, 0x126d5c8 <__start_il2cpp+0xc5e04>
 126d618: aa1803e0     	mov	x0, x24
 126d61c: aa1f03e1     	mov	x1, xzr
 126d620: 9401d4a4     	bl	0x12e28b0 <__start_il2cpp+0x13b0ec>
 126d624: 2a0003f6     	mov	w22, w0
 126d628: 34000577     	cbz	w23, 0x126d6d4 <__start_il2cpp+0xc5f10>
 126d62c: aa1803e0     	mov	x0, x24
 126d630: 2a1703e1     	mov	w1, w23
 126d634: aa1f03e2     	mov	x2, xzr
 126d638: 9401d7a3     	bl	0x12e34c4 <__start_il2cpp+0x13bd00>
 126d63c: f9400368     	ldr	x8, [x27]
 126d640: aa0003f9     	mov	x25, x0
 126d644: b940e109     	ldr	w9, [x8, #0xe0]
 126d648: 35000069     	cbnz	w9, 0x126d654 <__start_il2cpp+0xc5e90>
 126d64c: aa0803e0     	mov	x0, x8
 126d650: 97f94a64     	bl	0x10bffe0 <CloseNLSocket+0x518>
 126d654: aa1903e0     	mov	x0, x25
 126d658: aa1f03e1     	mov	x1, xzr
 126d65c: aa1f03e2     	mov	x2, xzr
 126d660: 94492f8e     	bl	0x24b9498 <__start_il2cpp+0x1311cd4>
 126d664: 36000c80     	tbz	w0, #0x0, 0x126d7f4 <__start_il2cpp+0xc6030>
 126d668: aa1803e0     	mov	x0, x24
 126d66c: 2a1703e1     	mov	w1, w23
 126d670: aa1f03e2     	mov	x2, xzr
 126d674: 9401d7bc     	bl	0x12e3564 <__start_il2cpp+0x13bda0>
 126d678: f9400368     	ldr	x8, [x27]
 126d67c: aa0003f9     	mov	x25, x0
 126d680: b940e109     	ldr	w9, [x8, #0xe0]
 126d684: 35000069     	cbnz	w9, 0x126d690 <__start_il2cpp+0xc5ecc>
 126d688: aa0803e0     	mov	x0, x8
 126d68c: 97f94a55     	bl	0x10bffe0 <CloseNLSocket+0x518>
 126d690: aa1903e0     	mov	x0, x25
 126d694: aa1f03e1     	mov	x1, xzr
 126d698: aa1f03e2     	mov	x2, xzr
 126d69c: 94492c6b     	bl	0x24b8848 <__start_il2cpp+0x1311084>
 126d6a0: 36000aa0     	tbz	w0, #0x0, 0x126d7f4 <__start_il2cpp+0xc6030>
 126d6a4: 510006e8     	sub	w8, w23, #0x1
 126d6a8: 71000d1f     	cmp	w8, #0x3
 126d6ac: 54000a48     	b.hi	0x126d7f4 <__start_il2cpp+0xc6030>
 126d6b0: d0ffa24b     	adrp	x11, 0x6b7000
 126d6b4: 9122396b     	add	x11, x11, #0x88e
 126d6b8: 100000a9     	adr	x9, 0x126d6cc <__start_il2cpp+0xc5f08>
 126d6bc: 3868696a     	ldrb	w10, [x11, x8]
 126d6c0: 8b0a0929     	add	x9, x9, x10, lsl #2
 126d6c4: 52800097     	mov	w23, #0x4               // =4
 126d6c8: d61f0120     	br	x9
 126d6cc: 52800037     	mov	w23, #0x1               // =1
 126d6d0: 14000049     	b	0x126d7f4 <__start_il2cpp+0xc6030>
 126d6d4: 52800021     	mov	w1, #0x1                // =1
 126d6d8: aa1803e0     	mov	x0, x24
 126d6dc: aa1f03e2     	mov	x2, xzr
 126d6e0: 9401d765     	bl	0x12e3474 <__start_il2cpp+0x13bcb0>
 126d6e4: f9400368     	ldr	x8, [x27]
 126d6e8: aa0003f9     	mov	x25, x0
 126d6ec: b940e109     	ldr	w9, [x8, #0xe0]
 126d6f0: 35000069     	cbnz	w9, 0x126d6fc <__start_il2cpp+0xc5f38>
 126d6f4: aa0803e0     	mov	x0, x8
 126d6f8: 97f94a3a     	bl	0x10bffe0 <CloseNLSocket+0x518>
 126d6fc: aa1903e0     	mov	x0, x25
 126d700: aa1f03e1     	mov	x1, xzr
 126d704: aa1f03e2     	mov	x2, xzr
 126d708: 94492c50     	bl	0x24b8848 <__start_il2cpp+0x1311084>
 126d70c: 36000060     	tbz	w0, #0x0, 0x126d718 <__start_il2cpp+0xc5f54>
 126d710: 52800077     	mov	w23, #0x3               // =3
 126d714: 14000084     	b	0x126d924 <__start_il2cpp+0xc6160>
 126d718: 52800061     	mov	w1, #0x3                // =3
 126d71c: aa1803e0     	mov	x0, x24
 126d720: aa1f03e2     	mov	x2, xzr
 126d724: 9401d754     	bl	0x12e3474 <__start_il2cpp+0x13bcb0>
 126d728: f9400368     	ldr	x8, [x27]
 126d72c: aa0003f9     	mov	x25, x0
 126d730: b940e109     	ldr	w9, [x8, #0xe0]
 126d734: 35000069     	cbnz	w9, 0x126d740 <__start_il2cpp+0xc5f7c>
 126d738: aa0803e0     	mov	x0, x8
 126d73c: 97f94a29     	bl	0x10bffe0 <CloseNLSocket+0x518>
 126d740: aa1903e0     	mov	x0, x25
 126d744: aa1f03e1     	mov	x1, xzr
 126d748: aa1f03e2     	mov	x2, xzr
 126d74c: 94492c3f     	bl	0x24b8848 <__start_il2cpp+0x1311084>
 126d750: 37000e40     	tbnz	w0, #0x0, 0x126d918 <__start_il2cpp+0xc6154>
 126d754: 52800041     	mov	w1, #0x2                // =2
 126d758: aa1803e0     	mov	x0, x24
 126d75c: aa1f03e2     	mov	x2, xzr
 126d760: 9401d745     	bl	0x12e3474 <__start_il2cpp+0x13bcb0>
 126d764: f9400368     	ldr	x8, [x27]
 126d768: aa0003f9     	mov	x25, x0
 126d76c: b940e109     	ldr	w9, [x8, #0xe0]
 126d770: 35000069     	cbnz	w9, 0x126d77c <__start_il2cpp+0xc5fb8>
 126d774: aa0803e0     	mov	x0, x8
 126d778: 97f94a1a     	bl	0x10bffe0 <CloseNLSocket+0x518>
 126d77c: aa1903e0     	mov	x0, x25
 126d780: aa1f03e1     	mov	x1, xzr
 126d784: aa1f03e2     	mov	x2, xzr
 126d788: 94492c30     	bl	0x24b8848 <__start_il2cpp+0x1311084>
 126d78c: 37000c20     	tbnz	w0, #0x0, 0x126d910 <__start_il2cpp+0xc614c>
 126d790: 52800081     	mov	w1, #0x4                // =4
 126d794: aa1803e0     	mov	x0, x24
 126d798: aa1f03e2     	mov	x2, xzr
 126d79c: 9401d736     	bl	0x12e3474 <__start_il2cpp+0x13bcb0>
 126d7a0: f9400368     	ldr	x8, [x27]
 126d7a4: aa0003f9     	mov	x25, x0
 126d7a8: b940e109     	ldr	w9, [x8, #0xe0]
 126d7ac: 35000069     	cbnz	w9, 0x126d7b8 <__start_il2cpp+0xc5ff4>
 126d7b0: aa0803e0     	mov	x0, x8
 126d7b4: 97f94a0b     	bl	0x10bffe0 <CloseNLSocket+0x518>
 126d7b8: aa1903e0     	mov	x0, x25
 126d7bc: aa1f03e1     	mov	x1, xzr
 126d7c0: aa1f03e2     	mov	x2, xzr
 126d7c4: 94492c21     	bl	0x24b8848 <__start_il2cpp+0x1311084>
 126d7c8: 37000ac0     	tbnz	w0, #0x0, 0x126d920 <__start_il2cpp+0xc615c>
 126d7cc: b000afa8     	adrp	x8, 0x2862000
 126d7d0: f9432108     	ldr	x8, [x8, #0x640]
 126d7d4: aa1f03e1     	mov	x1, xzr
 126d7d8: f9400100     	ldr	x0, [x8]
 126d7dc: 94022cb7     	bl	0x12f8ab8 <__start_il2cpp+0x1512f4>
 126d7e0: 2a1f03f7     	mov	w23, wzr
 126d7e4: 14000050     	b	0x126d924 <__start_il2cpp+0xc6160>
 126d7e8: 52800057     	mov	w23, #0x2               // =2
 126d7ec: 14000002     	b	0x126d7f4 <__start_il2cpp+0xc6030>
 126d7f0: 52800077     	mov	w23, #0x3               // =3
 126d7f4: f9400360     	ldr	x0, [x27]
 126d7f8: b940e008     	ldr	w8, [x0, #0xe0]
 126d7fc: 35000048     	cbnz	w8, 0x126d804 <__start_il2cpp+0xc6040>
 126d800: 97f949f8     	bl	0x10bffe0 <CloseNLSocket+0x518>
 126d804: aa1903e0     	mov	x0, x25
 126d808: aa1f03e1     	mov	x1, xzr
 126d80c: aa1f03e2     	mov	x2, xzr
 126d810: 94492f22     	bl	0x24b9498 <__start_il2cpp+0x1311cd4>
 126d814: 360003e0     	tbz	w0, #0x0, 0x126d890 <__start_il2cpp+0xc60cc>
 126d818: aa1803e0     	mov	x0, x24
 126d81c: 2a1703e1     	mov	w1, w23
 126d820: aa1f03e2     	mov	x2, xzr
 126d824: 9401d78f     	bl	0x12e3660 <__start_il2cpp+0x13be9c>
 126d828: f9400368     	ldr	x8, [x27]
 126d82c: aa0003f9     	mov	x25, x0
 126d830: b940e109     	ldr	w9, [x8, #0xe0]
 126d834: 35000069     	cbnz	w9, 0x126d840 <__start_il2cpp+0xc607c>
 126d838: aa0803e0     	mov	x0, x8
 126d83c: 97f949e9     	bl	0x10bffe0 <CloseNLSocket+0x518>
 126d840: aa1903e0     	mov	x0, x25
 126d844: aa1f03e1     	mov	x1, xzr
 126d848: aa1f03e2     	mov	x2, xzr
 126d84c: 94492bff     	bl	0x24b8848 <__start_il2cpp+0x1311084>
 126d850: 36000200     	tbz	w0, #0x0, 0x126d890 <__start_il2cpp+0xc60cc>
 126d854: 510006e8     	sub	w8, w23, #0x1
 126d858: 71000d1f     	cmp	w8, #0x3
 126d85c: 540001a8     	b.hi	0x126d890 <__start_il2cpp+0xc60cc>
 126d860: d0ffa24b     	adrp	x11, 0x6b7000
 126d864: 9122496b     	add	x11, x11, #0x892
 126d868: 100000a9     	adr	x9, 0x126d87c <__start_il2cpp+0xc60b8>
 126d86c: 3868696a     	ldrb	w10, [x11, x8]
 126d870: 8b0a0929     	add	x9, x9, x10, lsl #2
 126d874: 52800057     	mov	w23, #0x2               // =2
 126d878: d61f0120     	br	x9
 126d87c: 52800077     	mov	w23, #0x3               // =3
 126d880: 14000004     	b	0x126d890 <__start_il2cpp+0xc60cc>
 126d884: 52800097     	mov	w23, #0x4               // =4
 126d888: 14000002     	b	0x126d890 <__start_il2cpp+0xc60cc>
 126d88c: 52800037     	mov	w23, #0x1               // =1
 126d890: f9400360     	ldr	x0, [x27]
 126d894: b940e008     	ldr	w8, [x0, #0xe0]
 126d898: 35000048     	cbnz	w8, 0x126d8a0 <__start_il2cpp+0xc60dc>
 126d89c: 97f949d1     	bl	0x10bffe0 <CloseNLSocket+0x518>
 126d8a0: aa1903e0     	mov	x0, x25
 126d8a4: aa1f03e1     	mov	x1, xzr
 126d8a8: aa1f03e2     	mov	x2, xzr
 126d8ac: 94492efb     	bl	0x24b9498 <__start_il2cpp+0x1311cd4>
 126d8b0: 360003a0     	tbz	w0, #0x0, 0x126d924 <__start_il2cpp+0xc6160>
 126d8b4: aa1803e0     	mov	x0, x24
 126d8b8: 2a1703e1     	mov	w1, w23
 126d8bc: aa1f03e2     	mov	x2, xzr
 126d8c0: 9401d715     	bl	0x12e3514 <__start_il2cpp+0x13bd50>
 126d8c4: f9400368     	ldr	x8, [x27]
 126d8c8: aa0003f9     	mov	x25, x0
 126d8cc: b940e109     	ldr	w9, [x8, #0xe0]
 126d8d0: 35000069     	cbnz	w9, 0x126d8dc <__start_il2cpp+0xc6118>
 126d8d4: aa0803e0     	mov	x0, x8
 126d8d8: 97f949c2     	bl	0x10bffe0 <CloseNLSocket+0x518>
 126d8dc: aa1903e0     	mov	x0, x25
 126d8e0: aa1f03e1     	mov	x1, xzr
 126d8e4: aa1f03e2     	mov	x2, xzr
 126d8e8: 94492bd8     	bl	0x24b8848 <__start_il2cpp+0x1311084>
 126d8ec: 360001c0     	tbz	w0, #0x0, 0x126d924 <__start_il2cpp+0xc6160>
 126d8f0: 510006e8     	sub	w8, w23, #0x1
 126d8f4: 71000d1f     	cmp	w8, #0x3
 126d8f8: 54000168     	b.hi	0x126d924 <__start_il2cpp+0xc6160>
 126d8fc: 100000a9     	adr	x9, 0x126d910 <__start_il2cpp+0xc614c>
 126d900: 38686baa     	ldrb	w10, [x29, x8]
 126d904: 8b0a0929     	add	x9, x9, x10, lsl #2
 126d908: 52800077     	mov	w23, #0x3               // =3
 126d90c: d61f0120     	br	x9
 126d910: 52800097     	mov	w23, #0x4               // =4
 126d914: 14000004     	b	0x126d924 <__start_il2cpp+0xc6160>
 126d918: 52800037     	mov	w23, #0x1               // =1
 126d91c: 14000002     	b	0x126d924 <__start_il2cpp+0xc6160>
 126d920: 52800057     	mov	w23, #0x2               // =2
 126d924: 520002c8     	eor	w8, w22, #0x1
 126d928: 0a08035a     	and	w26, w26, w8
 126d92c: 1100079c     	add	w28, w28, #0x1
 126d930: aa1903f8     	mov	x24, x25
 126d934: 17ffff24     	b	0x126d5c4 <__start_il2cpp+0xc5e00>
 126d938: b000afa8     	adrp	x8, 0x2862000
 126d93c: f9431d08     	ldr	x8, [x8, #0x638]
 126d940: 1400000c     	b	0x126d970 <__start_il2cpp+0xc61ac>
 126d944: f9400360     	ldr	x0, [x27]
 126d948: b940e008     	ldr	w8, [x0, #0xe0]
 126d94c: 35000048     	cbnz	w8, 0x126d954 <__start_il2cpp+0xc6190>
 126d950: 97f949a4     	bl	0x10bffe0 <CloseNLSocket+0x518>
 126d954: aa1503e0     	mov	x0, x21
 126d958: aa1f03e1     	mov	x1, xzr
 126d95c: aa1f03e2     	mov	x2, xzr
 126d960: 94492ece     	bl	0x24b9498 <__start_il2cpp+0x1311cd4>
 126d964: 36000100     	tbz	w0, #0x0, 0x126d984 <__start_il2cpp+0xc61c0>
 126d968: b000afa8     	adrp	x8, 0x2862000
 126d96c: f9432508     	ldr	x8, [x8, #0x648]
 126d970: f9400100     	ldr	x0, [x8]
 126d974: aa1f03e1     	mov	x1, xzr
 126d978: 94022c50     	bl	0x12f8ab8 <__start_il2cpp+0x1512f4>
 126d97c: 2a1f03e0     	mov	w0, wzr
 126d980: 14000188     	b	0x126dfa0 <__start_il2cpp+0xc67dc>
 126d984: 52800028     	mov	w8, #0x1                // =1
 126d988: f9001675     	str	x21, [x19, #0x28]
 126d98c: b9003277     	str	w23, [x19, #0x30]
 126d990: 39038268     	strb	w8, [x19, #0xe0]
 126d994: b900e67f     	str	wzr, [x19, #0xe4]
 126d998: 37000094     	tbnz	w20, #0x0, 0x126d9a8 <__start_il2cpp+0xc61e4>
 126d99c: b940f268     	ldr	w8, [x19, #0xf0]
 126d9a0: 11000508     	add	w8, w8, #0x1
 126d9a4: b900f268     	str	w8, [x19, #0xf0]
 126d9a8: f9403e60     	ldr	x0, [x19, #0x78]
 126d9ac: b4003100     	cbz	x0, 0x126dfcc <__start_il2cpp+0xc6808>
 126d9b0: aa1f03e1     	mov	x1, xzr
 126d9b4: 9400f919     	bl	0x12abe18 <__start_il2cpp+0x104654>
 126d9b8: f9403a60     	ldr	x0, [x19, #0x70]
 126d9bc: b4003080     	cbz	x0, 0x126dfcc <__start_il2cpp+0xc6808>
 126d9c0: aa1f03e1     	mov	x1, xzr
 126d9c4: 944921d2     	bl	0x24b610c <__start_il2cpp+0x130e948>
 126d9c8: b4003035     	cbz	x21, 0x126dfcc <__start_il2cpp+0xc6808>
 126d9cc: aa0003f4     	mov	x20, x0
 126d9d0: aa1503e0     	mov	x0, x21
 126d9d4: aa1f03e1     	mov	x1, xzr
 126d9d8: 944921cd     	bl	0x24b610c <__start_il2cpp+0x130e948>
 126d9dc: b4002f80     	cbz	x0, 0x126dfcc <__start_il2cpp+0xc6808>
 126d9e0: aa1f03e1     	mov	x1, xzr
 126d9e4: 94495324     	bl	0x24c2674 <__start_il2cpp+0x131aeb0>
 126d9e8: b4002f34     	cbz	x20, 0x126dfcc <__start_il2cpp+0xc6808>
 126d9ec: aa1403e0     	mov	x0, x20
 126d9f0: aa1f03e1     	mov	x1, xzr
 126d9f4: 94495348     	bl	0x24c2714 <__start_il2cpp+0x131af50>
 126d9f8: f9403a74     	ldr	x20, [x19, #0x70]
 126d9fc: aa1503e0     	mov	x0, x21
 126da00: aa1f03e1     	mov	x1, xzr
 126da04: 9401d692     	bl	0x12e344c <__start_il2cpp+0x13bc88>
 126da08: b4002e34     	cbz	x20, 0x126dfcc <__start_il2cpp+0xc6808>
 126da0c: aa1403e0     	mov	x0, x20
 126da10: aa1f03e1     	mov	x1, xzr
 126da14: 9400aa2a     	bl	0x12982bc <__start_il2cpp+0xf0af8>
 126da18: f9403a60     	ldr	x0, [x19, #0x70]
 126da1c: b4002d80     	cbz	x0, 0x126dfcc <__start_il2cpp+0xc6808>
 126da20: aa1f03e1     	mov	x1, xzr
 126da24: 9400accf     	bl	0x1298d60 <__start_il2cpp+0xf159c>
 126da28: f9403a60     	ldr	x0, [x19, #0x70]
 126da2c: b4002d00     	cbz	x0, 0x126dfcc <__start_il2cpp+0xc6808>
 126da30: aa1f03e1     	mov	x1, xzr
 126da34: 944921b6     	bl	0x24b610c <__start_il2cpp+0x130e948>
 126da38: b4002ca0     	cbz	x0, 0x126dfcc <__start_il2cpp+0xc6808>
 126da3c: 1e2703e0     	fmov	s0, wzr
 126da40: 1e2703e1     	fmov	s1, wzr
 126da44: 1e2703e2     	fmov	s2, wzr
 126da48: aa1f03e1     	mov	x1, xzr
 126da4c: 9449539c     	bl	0x24c28bc <__start_il2cpp+0x131b0f8>
 126da50: b9403268     	ldr	w8, [x19, #0x30]
 126da54: 7100111f     	cmp	w8, #0x4
 126da58: 540001c0     	b.eq	0x126da90 <__start_il2cpp+0xc62cc>
 126da5c: 7100091f     	cmp	w8, #0x2
 126da60: 540000e0     	b.eq	0x126da7c <__start_il2cpp+0xc62b8>
 126da64: 7100051f     	cmp	w8, #0x1
 126da68: 540001c1     	b.ne	0x126daa0 <__start_il2cpp+0xc62dc>
 126da6c: f9403a60     	ldr	x0, [x19, #0x70]
 126da70: b4002ae0     	cbz	x0, 0x126dfcc <__start_il2cpp+0xc6808>
 126da74: aa1f03e1     	mov	x1, xzr
 126da78: 9400abc9     	bl	0x129899c <__start_il2cpp+0xf11d8>
 126da7c: f9403a60     	ldr	x0, [x19, #0x70]
 126da80: b4002a60     	cbz	x0, 0x126dfcc <__start_il2cpp+0xc6808>
 126da84: aa1f03e1     	mov	x1, xzr
 126da88: 9400abc5     	bl	0x129899c <__start_il2cpp+0xf11d8>
 126da8c: 14000005     	b	0x126daa0 <__start_il2cpp+0xc62dc>
 126da90: f9403a60     	ldr	x0, [x19, #0x70]
 126da94: b40029c0     	cbz	x0, 0x126dfcc <__start_il2cpp+0xc6808>
 126da98: aa1f03e1     	mov	x1, xzr
 126da9c: 9400abde     	bl	0x1298a14 <__start_il2cpp+0xf1250>
 126daa0: f9403a60     	ldr	x0, [x19, #0x70]
 126daa4: b4002940     	cbz	x0, 0x126dfcc <__start_il2cpp+0xc6808>
 126daa8: f9400008     	ldr	x8, [x0]
 126daac: 52800021     	mov	w1, #0x1                // =1
 126dab0: a9588909     	ldp	x9, x2, [x8, #0x188]
 126dab4: d63f0120     	blr	x9
 126dab8: b000af88     	adrp	x8, 0x285e000
 126dabc: f9414108     	ldr	x8, [x8, #0x280]
 126dac0: f9400100     	ldr	x0, [x8]
 126dac4: b940e008     	ldr	w8, [x0, #0xe0]
 126dac8: 35000048     	cbnz	w8, 0x126dad0 <__start_il2cpp+0xc630c>
 126dacc: 97f94945     	bl	0x10bffe0 <CloseNLSocket+0x518>
 126dad0: 940012b1     	bl	0x1272594 <__start_il2cpp+0xcadd0>
 126dad4: 2a0003f4     	mov	w20, w0
 126dad8: 940012c8     	bl	0x12725f8 <__start_il2cpp+0xcae34>
 126dadc: f9403a75     	ldr	x21, [x19, #0x70]
 126dae0: b4002775     	cbz	x21, 0x126dfcc <__start_il2cpp+0xc6808>
 126dae4: 2d5c86a2     	ldp	s2, s1, [x21, #0xe4]
 126dae8: aa1503e0     	mov	x0, x21
 126daec: aa1f03e1     	mov	x1, xzr
 126daf0: 1e210800     	fmul	s0, s0, s1
 126daf4: 1e222000     	fcmp	s0, s2
 126daf8: 1e204c48     	fcsel	s8, s2, s0, mi
 126dafc: 94492184     	bl	0x24b610c <__start_il2cpp+0x130e948>
 126db00: b4002660     	cbz	x0, 0x126dfcc <__start_il2cpp+0xc6808>
 126db04: aa1f03e1     	mov	x1, xzr
 126db08: 9449540f     	bl	0x24c2b44 <__start_il2cpp+0x131b380>
 126db0c: 1e200900     	fmul	s0, s8, s0
 126db10: 1e210901     	fmul	s1, s8, s1
 126db14: 1e220902     	fmul	s2, s8, s2
 126db18: 2d0686a0     	stp	s0, s1, [x21, #0x34]
 126db1c: bd003ea2     	str	s2, [x21, #0x3c]
 126db20: f9403a60     	ldr	x0, [x19, #0x70]
 126db24: b4002540     	cbz	x0, 0x126dfcc <__start_il2cpp+0xc6808>
 126db28: 1e220280     	scvtf	s0, w20
 126db2c: 2a1f03e1     	mov	w1, wzr
 126db30: aa1f03e2     	mov	x2, xzr
 126db34: 9400ac65     	bl	0x1298cc8 <__start_il2cpp+0xf1504>
 126db38: f9403a60     	ldr	x0, [x19, #0x70]
 126db3c: b4002480     	cbz	x0, 0x126dfcc <__start_il2cpp+0xc6808>
 126db40: 1e2703e0     	fmov	s0, wzr
 126db44: aa1f03e1     	mov	x1, xzr
 126db48: b900e81f     	str	wzr, [x0, #0xe8]
 126db4c: 9400a4e6     	bl	0x1296ee4 <__start_il2cpp+0xef720>
 126db50: b000afb4     	adrp	x20, 0x2862000
 126db54: f9424a94     	ldr	x20, [x20, #0x490]
 126db58: f9400280     	ldr	x0, [x20]
 126db5c: b940e008     	ldr	w8, [x0, #0xe0]
 126db60: 35000068     	cbnz	w8, 0x126db6c <__start_il2cpp+0xc63a8>
 126db64: 97f9491f     	bl	0x10bffe0 <CloseNLSocket+0x518>
 126db68: f9400280     	ldr	x0, [x20]
 126db6c: f9405c08     	ldr	x8, [x0, #0xb8]
 126db70: 4f03f600     	fmov	v0.4s, #1.00000000
 126db74: 52800029     	mov	w9, #0x1                // =1
 126db78: 3c84c100     	stur	q0, [x8, #0x4c]
 126db7c: f9405c08     	ldr	x8, [x0, #0xb8]
 126db80: 39001109     	strb	w9, [x8, #0x4]
 126db84: f9403a68     	ldr	x8, [x19, #0x70]
 126db88: b4002228     	cbz	x8, 0x126dfcc <__start_il2cpp+0xc6808>
 126db8c: f9402a69     	ldr	x9, [x19, #0x50]
 126db90: b40021e9     	cbz	x9, 0x126dfcc <__start_il2cpp+0xc6808>
 126db94: bd413500     	ldr	s0, [x8, #0x134]
 126db98: bd009920     	str	s0, [x9, #0x98]
 126db9c: f9402e60     	ldr	x0, [x19, #0x58]
 126dba0: b4002160     	cbz	x0, 0x126dfcc <__start_il2cpp+0xc6808>
 126dba4: aa1f03e1     	mov	x1, xzr
 126dba8: 9401cb35     	bl	0x12e087c <__start_il2cpp+0x1390b8>
 126dbac: f9403a60     	ldr	x0, [x19, #0x70]
 126dbb0: b40020e0     	cbz	x0, 0x126dfcc <__start_il2cpp+0xc6808>
 126dbb4: aa1f03e1     	mov	x1, xzr
 126dbb8: 94492155     	bl	0x24b610c <__start_il2cpp+0x130e948>
 126dbbc: b4002080     	cbz	x0, 0x126dfcc <__start_il2cpp+0xc6808>
 126dbc0: aa1f03e1     	mov	x1, xzr
 126dbc4: 944952ac     	bl	0x24c2674 <__start_il2cpp+0x131aeb0>
 126dbc8: f9402a68     	ldr	x8, [x19, #0x50]
 126dbcc: b4002008     	cbz	x8, 0x126dfcc <__start_il2cpp+0xc6808>
 126dbd0: f9403a60     	ldr	x0, [x19, #0x70]
 126dbd4: b4001fc0     	cbz	x0, 0x126dfcc <__start_il2cpp+0xc6808>
 126dbd8: bd40c10e     	ldr	s14, [x8, #0xc0]
 126dbdc: aa1f03e1     	mov	x1, xzr
 126dbe0: 4ea01c0b     	mov	v11.16b, v0.16b
 126dbe4: 4ea11c2d     	mov	v13.16b, v1.16b
 126dbe8: 4ea21c4c     	mov	v12.16b, v2.16b
 126dbec: 94492148     	bl	0x24b610c <__start_il2cpp+0x130e948>
 126dbf0: b4001ee0     	cbz	x0, 0x126dfcc <__start_il2cpp+0xc6808>
 126dbf4: aa1f03e1     	mov	x1, xzr
 126dbf8: 9449530f     	bl	0x24c2834 <__start_il2cpp+0x131b070>
 126dbfc: 52a86688     	mov	w8, #0x43340000         // =1127481344
 126dc00: 4ea01c09     	mov	v9.16b, v0.16b
 126dc04: 1e270100     	fmov	s0, w8
 126dc08: 4ea21c48     	mov	v8.16b, v2.16b
 126dc0c: 1e20282a     	fadd	s10, s1, s0
 126dc10: 360002da     	tbz	w26, #0x0, 0x126dc68 <__start_il2cpp+0xc64a4>
 126dc14: f9402e60     	ldr	x0, [x19, #0x58]
 126dc18: b4001da0     	cbz	x0, 0x126dfcc <__start_il2cpp+0xc6808>
 126dc1c: aa1f03e1     	mov	x1, xzr
 126dc20: 9449213b     	bl	0x24b610c <__start_il2cpp+0x130e948>
 126dc24: b4001d40     	cbz	x0, 0x126dfcc <__start_il2cpp+0xc6808>
 126dc28: 1e2e29a1     	fadd	s1, s13, s14
 126dc2c: 4eab1d60     	mov	v0.16b, v11.16b
 126dc30: 4eac1d82     	mov	v2.16b, v12.16b
 126dc34: aa1f03e1     	mov	x1, xzr
 126dc38: 944952b7     	bl	0x24c2714 <__start_il2cpp+0x131af50>
 126dc3c: f9402e60     	ldr	x0, [x19, #0x58]
 126dc40: b4001c60     	cbz	x0, 0x126dfcc <__start_il2cpp+0xc6808>
 126dc44: aa1f03e1     	mov	x1, xzr
 126dc48: 94492131     	bl	0x24b610c <__start_il2cpp+0x130e948>
 126dc4c: b4001c00     	cbz	x0, 0x126dfcc <__start_il2cpp+0xc6808>
 126dc50: 4ea91d20     	mov	v0.16b, v9.16b
 126dc54: 4eaa1d41     	mov	v1.16b, v10.16b
 126dc58: 4ea81d02     	mov	v2.16b, v8.16b
 126dc5c: aa1f03e1     	mov	x1, xzr
 126dc60: 94495317     	bl	0x24c28bc <__start_il2cpp+0x131b0f8>
 126dc64: 1400004c     	b	0x126dd94 <__start_il2cpp+0xc65d0>
 126dc68: b000afb5     	adrp	x21, 0x2862000
 126dc6c: f942a2b5     	ldr	x21, [x21, #0x540]
 126dc70: f94002a0     	ldr	x0, [x21]
 126dc74: 97f94920     	bl	0x10c00f4 <CloseNLSocket+0x62c>
 126dc78: aa1f03e1     	mov	x1, xzr
 126dc7c: aa0003f4     	mov	x20, x0
 126dc80: 9401caf7     	bl	0x12e085c <__start_il2cpp+0x139098>
 126dc84: b4001a54     	cbz	x20, 0x126dfcc <__start_il2cpp+0xc6808>
 126dc88: b900129f     	str	wzr, [x20, #0x10]
 126dc8c: f9402e60     	ldr	x0, [x19, #0x58]
 126dc90: b40019e0     	cbz	x0, 0x126dfcc <__start_il2cpp+0xc6808>
 126dc94: aa1f03e1     	mov	x1, xzr
 126dc98: 9449211d     	bl	0x24b610c <__start_il2cpp+0x130e948>
 126dc9c: b4001980     	cbz	x0, 0x126dfcc <__start_il2cpp+0xc6808>
 126dca0: aa1f03e1     	mov	x1, xzr
 126dca4: 94495274     	bl	0x24c2674 <__start_il2cpp+0x131aeb0>
 126dca8: 52800028     	mov	w8, #0x1                // =1
 126dcac: 2d028680     	stp	s0, s1, [x20, #0x14]
 126dcb0: bd001e82     	str	s2, [x20, #0x1c]
 126dcb4: 39008288     	strb	w8, [x20, #0x20]
 126dcb8: f9402e60     	ldr	x0, [x19, #0x58]
 126dcbc: b4001880     	cbz	x0, 0x126dfcc <__start_il2cpp+0xc6808>
 126dcc0: aa1403e1     	mov	x1, x20
 126dcc4: aa1f03e2     	mov	x2, xzr
 126dcc8: 9401ca82     	bl	0x12e06d0 <__start_il2cpp+0x138f0c>
 126dccc: f9403a60     	ldr	x0, [x19, #0x70]
 126dcd0: b40017e0     	cbz	x0, 0x126dfcc <__start_il2cpp+0xc6808>
 126dcd4: aa1f03e1     	mov	x1, xzr
 126dcd8: 9449210d     	bl	0x24b610c <__start_il2cpp+0x130e948>
 126dcdc: b4001780     	cbz	x0, 0x126dfcc <__start_il2cpp+0xc6808>
 126dce0: aa1f03e1     	mov	x1, xzr
 126dce4: 94495264     	bl	0x24c2674 <__start_il2cpp+0x131aeb0>
 126dce8: f9402a68     	ldr	x8, [x19, #0x50]
 126dcec: b4001708     	cbz	x8, 0x126dfcc <__start_il2cpp+0xc6808>
 126dcf0: f9402e60     	ldr	x0, [x19, #0x58]
 126dcf4: b40016c0     	cbz	x0, 0x126dfcc <__start_il2cpp+0xc6808>
 126dcf8: bd40990d     	ldr	s13, [x8, #0x98]
 126dcfc: bd40c10e     	ldr	s14, [x8, #0xc0]
 126dd00: aa1403e1     	mov	x1, x20
 126dd04: aa1f03e2     	mov	x2, xzr
 126dd08: 4ea01c0b     	mov	v11.16b, v0.16b
 126dd0c: 4ea21c4c     	mov	v12.16b, v2.16b
 126dd10: 9401ca70     	bl	0x12e06d0 <__start_il2cpp+0x138f0c>
 126dd14: f9402e60     	ldr	x0, [x19, #0x58]
 126dd18: b40015a0     	cbz	x0, 0x126dfcc <__start_il2cpp+0xc6808>
 126dd1c: aa1f03e1     	mov	x1, xzr
 126dd20: 944920fb     	bl	0x24b610c <__start_il2cpp+0x130e948>
 126dd24: b4001540     	cbz	x0, 0x126dfcc <__start_il2cpp+0xc6808>
 126dd28: 4ea91d20     	mov	v0.16b, v9.16b
 126dd2c: 4eaa1d41     	mov	v1.16b, v10.16b
 126dd30: 4ea81d02     	mov	v2.16b, v8.16b
 126dd34: aa1f03e1     	mov	x1, xzr
 126dd38: 944952e1     	bl	0x24c28bc <__start_il2cpp+0x131b0f8>
 126dd3c: f94002a0     	ldr	x0, [x21]
 126dd40: 97f948ed     	bl	0x10c00f4 <CloseNLSocket+0x62c>
 126dd44: aa1f03e1     	mov	x1, xzr
 126dd48: aa0003f4     	mov	x20, x0
 126dd4c: 9401cac4     	bl	0x12e085c <__start_il2cpp+0x139098>
 126dd50: b40013f4     	cbz	x20, 0x126dfcc <__start_il2cpp+0xc6808>
 126dd54: 1e2e29a0     	fadd	s0, s13, s14
 126dd58: 52a80008     	mov	w8, #0x40000000         // =1073741824
 126dd5c: 52800029     	mov	w9, #0x1                // =1
 126dd60: 2d033280     	stp	s0, s12, [x20, #0x18]
 126dd64: b9001288     	str	w8, [x20, #0x10]
 126dd68: bd00168b     	str	s11, [x20, #0x14]
 126dd6c: 39008289     	strb	w9, [x20, #0x20]
 126dd70: f9402e60     	ldr	x0, [x19, #0x58]
 126dd74: b40012c0     	cbz	x0, 0x126dfcc <__start_il2cpp+0xc6808>
 126dd78: aa1403e1     	mov	x1, x20
 126dd7c: aa1f03e2     	mov	x2, xzr
 126dd80: 9401ca54     	bl	0x12e06d0 <__start_il2cpp+0x138f0c>
 126dd84: f9402e60     	ldr	x0, [x19, #0x58]
 126dd88: b4001220     	cbz	x0, 0x126dfcc <__start_il2cpp+0xc6808>
 126dd8c: aa1f03e1     	mov	x1, xzr
 126dd90: 9401cab5     	bl	0x12e0864 <__start_il2cpp+0x1390a0>
 126dd94: f9402a60     	ldr	x0, [x19, #0x50]
 126dd98: b40011a0     	cbz	x0, 0x126dfcc <__start_il2cpp+0xc6808>
 126dd9c: aa1f03e1     	mov	x1, xzr
 126dda0: 9401cab7     	bl	0x12e087c <__start_il2cpp+0x1390b8>
 126dda4: f9403a60     	ldr	x0, [x19, #0x70]
 126dda8: b4001120     	cbz	x0, 0x126dfcc <__start_il2cpp+0xc6808>
 126ddac: f9402a74     	ldr	x20, [x19, #0x50]
 126ddb0: aa1f03e1     	mov	x1, xzr
 126ddb4: 944920d6     	bl	0x24b610c <__start_il2cpp+0x130e948>
 126ddb8: b40010a0     	cbz	x0, 0x126dfcc <__start_il2cpp+0xc6808>
 126ddbc: aa1f03e1     	mov	x1, xzr
 126ddc0: 9449522d     	bl	0x24c2674 <__start_il2cpp+0x131aeb0>
 126ddc4: f9402e60     	ldr	x0, [x19, #0x58]
 126ddc8: b4001020     	cbz	x0, 0x126dfcc <__start_il2cpp+0xc6808>
 126ddcc: aa1f03e1     	mov	x1, xzr
 126ddd0: 4ea01c08     	mov	v8.16b, v0.16b
 126ddd4: 4ea11c29     	mov	v9.16b, v1.16b
 126ddd8: 4ea21c4a     	mov	v10.16b, v2.16b
 126dddc: 944920cc     	bl	0x24b610c <__start_il2cpp+0x130e948>
 126dde0: b4000f60     	cbz	x0, 0x126dfcc <__start_il2cpp+0xc6808>
 126dde4: aa1f03e1     	mov	x1, xzr
 126dde8: 94495357     	bl	0x24c2b44 <__start_il2cpp+0x131b380>
 126ddec: f9402a68     	ldr	x8, [x19, #0x50]
 126ddf0: b4000ee8     	cbz	x8, 0x126dfcc <__start_il2cpp+0xc6808>
 126ddf4: f9402e60     	ldr	x0, [x19, #0x58]
 126ddf8: b4000ea0     	cbz	x0, 0x126dfcc <__start_il2cpp+0xc6808>
 126ddfc: bd40b50e     	ldr	s14, [x8, #0xb4]
 126de00: aa1f03e1     	mov	x1, xzr
 126de04: 4ea01c0b     	mov	v11.16b, v0.16b
 126de08: 4ea11c2c     	mov	v12.16b, v1.16b
 126de0c: 4ea21c4d     	mov	v13.16b, v2.16b
 126de10: 944920bf     	bl	0x24b610c <__start_il2cpp+0x130e948>
 126de14: b4000dc0     	cbz	x0, 0x126dfcc <__start_il2cpp+0xc6808>
 126de18: aa1f03e1     	mov	x1, xzr
 126de1c: 9449532b     	bl	0x24c2ac8 <__start_il2cpp+0x131b304>
 126de20: f9402a68     	ldr	x8, [x19, #0x50]
 126de24: b4000d48     	cbz	x8, 0x126dfcc <__start_il2cpp+0xc6808>
 126de28: b4000d34     	cbz	x20, 0x126dfcc <__start_il2cpp+0xc6808>
 126de2c: bd40a906     	ldr	s6, [x8, #0xa8]
 126de30: 1e2e0963     	fmul	s3, s11, s14
 126de34: 1e2e0984     	fmul	s4, s12, s14
 126de38: 1e2e09a5     	fmul	s5, s13, s14
 126de3c: 1e232903     	fadd	s3, s8, s3
 126de40: 1e242924     	fadd	s4, s9, s4
 126de44: 1e252945     	fadd	s5, s10, s5
 126de48: 1e260842     	fmul	s2, s2, s6
 126de4c: 1e260821     	fmul	s1, s1, s6
 126de50: 1e260800     	fmul	s0, s0, s6
 126de54: 1e2228a2     	fadd	s2, s5, s2
 126de58: 1e212881     	fadd	s1, s4, s1
 126de5c: 1e202860     	fadd	s0, s3, s0
 126de60: 2d1d8680     	stp	s0, s1, [x20, #0xec]
 126de64: bd00f682     	str	s2, [x20, #0xf4]
 126de68: b000afb5     	adrp	x21, 0x2862000
 126de6c: f942a2b5     	ldr	x21, [x21, #0x540]
 126de70: f94002a0     	ldr	x0, [x21]
 126de74: 97f948a0     	bl	0x10c00f4 <CloseNLSocket+0x62c>
 126de78: aa1f03e1     	mov	x1, xzr
 126de7c: aa0003f4     	mov	x20, x0
 126de80: 9401ca77     	bl	0x12e085c <__start_il2cpp+0x139098>
 126de84: b4000a54     	cbz	x20, 0x126dfcc <__start_il2cpp+0xc6808>
 126de88: b900129f     	str	wzr, [x20, #0x10]
 126de8c: f9402a60     	ldr	x0, [x19, #0x50]
 126de90: b40009e0     	cbz	x0, 0x126dfcc <__start_il2cpp+0xc6808>
 126de94: aa1f03e1     	mov	x1, xzr
 126de98: 9449209d     	bl	0x24b610c <__start_il2cpp+0x130e948>
 126de9c: b4000980     	cbz	x0, 0x126dfcc <__start_il2cpp+0xc6808>
 126dea0: aa1f03e1     	mov	x1, xzr
 126dea4: 944951f4     	bl	0x24c2674 <__start_il2cpp+0x131aeb0>
 126dea8: 52800028     	mov	w8, #0x1                // =1
 126deac: 2d028680     	stp	s0, s1, [x20, #0x14]
 126deb0: bd001e82     	str	s2, [x20, #0x1c]
 126deb4: 39008288     	strb	w8, [x20, #0x20]
 126deb8: f9402a60     	ldr	x0, [x19, #0x50]
 126debc: b4000880     	cbz	x0, 0x126dfcc <__start_il2cpp+0xc6808>
 126dec0: aa1403e1     	mov	x1, x20
 126dec4: aa1f03e2     	mov	x2, xzr
 126dec8: 9401ca02     	bl	0x12e06d0 <__start_il2cpp+0x138f0c>
 126decc: f94002a0     	ldr	x0, [x21]
 126ded0: 97f94889     	bl	0x10c00f4 <CloseNLSocket+0x62c>
 126ded4: aa1f03e1     	mov	x1, xzr
 126ded8: aa0003f4     	mov	x20, x0
 126dedc: 9401ca60     	bl	0x12e085c <__start_il2cpp+0x139098>
 126dee0: b4000774     	cbz	x20, 0x126dfcc <__start_il2cpp+0xc6808>
 126dee4: 52a7f008     	mov	w8, #0x3f800000         // =1065353216
 126dee8: b9001288     	str	w8, [x20, #0x10]
 126deec: f9402a60     	ldr	x0, [x19, #0x50]
 126def0: b40006e0     	cbz	x0, 0x126dfcc <__start_il2cpp+0xc6808>
 126def4: aa1f03e1     	mov	x1, xzr
 126def8: 94492085     	bl	0x24b610c <__start_il2cpp+0x130e948>
 126defc: b4000680     	cbz	x0, 0x126dfcc <__start_il2cpp+0xc6808>
 126df00: aa1f03e1     	mov	x1, xzr
 126df04: 944951dc     	bl	0x24c2674 <__start_il2cpp+0x131aeb0>
 126df08: 52800028     	mov	w8, #0x1                // =1
 126df0c: 2d028680     	stp	s0, s1, [x20, #0x14]
 126df10: bd001e82     	str	s2, [x20, #0x1c]
 126df14: 39008288     	strb	w8, [x20, #0x20]
 126df18: f9402a60     	ldr	x0, [x19, #0x50]
 126df1c: b4000580     	cbz	x0, 0x126dfcc <__start_il2cpp+0xc6808>
 126df20: aa1403e1     	mov	x1, x20
 126df24: aa1f03e2     	mov	x2, xzr
 126df28: 9401c9ea     	bl	0x12e06d0 <__start_il2cpp+0x138f0c>
 126df2c: f94002a0     	ldr	x0, [x21]
 126df30: 97f94871     	bl	0x10c00f4 <CloseNLSocket+0x62c>
 126df34: aa1f03e1     	mov	x1, xzr
 126df38: aa0003f4     	mov	x20, x0
 126df3c: 9401ca48     	bl	0x12e085c <__start_il2cpp+0x139098>
 126df40: b4000474     	cbz	x20, 0x126dfcc <__start_il2cpp+0xc6808>
 126df44: 7200035f     	tst	w26, #0x1
 126df48: 1e211000     	fmov	s0, #3.00000000
 126df4c: 1e201001     	fmov	s1, #2.00000000
 126df50: 1e201c20     	fcsel	s0, s1, s0, ne
 126df54: bd001280     	str	s0, [x20, #0x10]
 126df58: f9402a68     	ldr	x8, [x19, #0x50]
 126df5c: b4000388     	cbz	x8, 0x126dfcc <__start_il2cpp+0xc6808>
 126df60: b940f509     	ldr	w9, [x8, #0xf4]
 126df64: f84ec108     	ldur	x8, [x8, #0xec]
 126df68: 5280002a     	mov	w10, #0x1               // =1
 126df6c: 3900828a     	strb	w10, [x20, #0x20]
 126df70: b9001e89     	str	w9, [x20, #0x1c]
 126df74: f8014288     	stur	x8, [x20, #0x14]
 126df78: f9402a60     	ldr	x0, [x19, #0x50]
 126df7c: b4000280     	cbz	x0, 0x126dfcc <__start_il2cpp+0xc6808>
 126df80: aa1403e1     	mov	x1, x20
 126df84: aa1f03e2     	mov	x2, xzr
 126df88: 9401c9d2     	bl	0x12e06d0 <__start_il2cpp+0x138f0c>
 126df8c: f9402a60     	ldr	x0, [x19, #0x50]
 126df90: b40001e0     	cbz	x0, 0x126dfcc <__start_il2cpp+0xc6808>
 126df94: aa1f03e1     	mov	x1, xzr
 126df98: 9401ca33     	bl	0x12e0864 <__start_il2cpp+0x1390a0>
 126df9c: 52800020     	mov	w0, #0x1                // =1
 126dfa0: a9494ff4     	ldp	x20, x19, [sp, #0x90]
 126dfa4: a94857f6     	ldp	x22, x21, [sp, #0x80]
 126dfa8: a9475ff8     	ldp	x24, x23, [sp, #0x70]
 126dfac: a94667fa     	ldp	x26, x25, [sp, #0x60]
 126dfb0: a9456ffc     	ldp	x28, x27, [sp, #0x50]
 126dfb4: a9447bfd     	ldp	x29, x30, [sp, #0x40]
 126dfb8: 6d4323e9     	ldp	d9, d8, [sp, #0x30]
 126dfbc: 6d422beb     	ldp	d11, d10, [sp, #0x20]
 126dfc0: 6d4133ed     	ldp	d13, d12, [sp, #0x10]
 126dfc4: fc4a07ee     	ldr	d14, [sp], #0xa0
 126dfc8: d65f03c0     	ret
 126dfcc: 97f9484d     	bl	0x10c0100 <CloseNLSocket+0x638>
