
/tmp/temple-libil2cpp.so:	file format elf64-littleaarch64

Disassembly of section il2cpp:

00000000011a77c4 <__start_il2cpp>:
 128433c: d101c3ff     	sub	sp, sp, #0x70
 1284340: 6d0133ed     	stp	d13, d12, [sp, #0x10]
 1284344: 6d022beb     	stp	d11, d10, [sp, #0x20]
 1284348: 6d0323e9     	stp	d9, d8, [sp, #0x30]
 128434c: a9045ffe     	stp	x30, x23, [sp, #0x40]
 1284350: a90557f6     	stp	x22, x21, [sp, #0x50]
 1284354: a9064ff4     	stp	x20, x19, [sp, #0x60]
 1284358: b000bd94     	adrp	x20, 0x2a35000
 128435c: 395f7688     	ldrb	w8, [x20, #0x7dd]
 1284360: aa0003f3     	mov	x19, x0
 1284364: 370000c8     	tbnz	w8, #0x0, 0x128437c <__start_il2cpp+0xdcbb8>
 1284368: 9000aec0     	adrp	x0, 0x285c000 <_ZTVN10__cxxabiv119__pointer_type_infoE+0x18>
 128436c: f9456000     	ldr	x0, [x0, #0xac0]
 1284370: 97f8eeda     	bl	0x10bfed8 <CloseNLSocket+0x410>
 1284374: 52800028     	mov	w8, #0x1                // =1
 1284378: 391f7688     	strb	w8, [x20, #0x7dd]
 128437c: aa1303e0     	mov	x0, x19
 1284380: 97fff9a8     	bl	0x1282a20 <__start_il2cpp+0xdb25c>
 1284384: b4000aa0     	cbz	x0, 0x12844d8 <__start_il2cpp+0xdcd14>
 1284388: aa1303e0     	mov	x0, x19
 128438c: aa1f03e1     	mov	x1, xzr
 1284390: 97fd9f32     	bl	0x11ec058 <__start_il2cpp+0x44894>
 1284394: aa0003f4     	mov	x20, x0
 1284398: aa1303e0     	mov	x0, x19
 128439c: aa1f03e1     	mov	x1, xzr
 12843a0: 97fd880a     	bl	0x11e63c8 <__start_il2cpp+0x3ec04>
 12843a4: b40034e0     	cbz	x0, 0x1284a40 <__start_il2cpp+0xdd27c>
 12843a8: 9000aed5     	adrp	x21, 0x285c000 <_ZTVN10__cxxabiv119__pointer_type_infoE+0x18>
 12843ac: f94562b5     	ldr	x21, [x21, #0xac0]
 12843b0: aa1f03e1     	mov	x1, xzr
 12843b4: 9448fa47     	bl	0x24c2cd0 <__start_il2cpp+0x131b50c>
 12843b8: f94002a0     	ldr	x0, [x21]
 12843bc: 4ea01c09     	mov	v9.16b, v0.16b
 12843c0: 4ea11c28     	mov	v8.16b, v1.16b
 12843c4: b940e008     	ldr	w8, [x0, #0xe0]
 12843c8: 35000048     	cbnz	w8, 0x12843d0 <__start_il2cpp+0xdcc0c>
 12843cc: 97f8ef05     	bl	0x10bffe0 <CloseNLSocket+0x518>
 12843d0: aa1403e0     	mov	x0, x20
 12843d4: aa1f03e1     	mov	x1, xzr
 12843d8: aa1f03e2     	mov	x2, xzr
 12843dc: 9448d11b     	bl	0x24b8848 <__start_il2cpp+0x1311084>
 12843e0: d000aed6     	adrp	x22, 0x285e000
 12843e4: f9417ad6     	ldr	x22, [x22, #0x2f0]
 12843e8: b000bd97     	adrp	x23, 0x2a35000
 12843ec: 36001240     	tbz	w0, #0x0, 0x1284634 <__start_il2cpp+0xdce70>
 12843f0: f9400268     	ldr	x8, [x19]
 12843f4: aa1303e0     	mov	x0, x19
 12843f8: 2a1f03e1     	mov	w1, wzr
 12843fc: f9411509     	ldr	x9, [x8, #0x228]
 1284400: f9411902     	ldr	x2, [x8, #0x230]
 1284404: d63f0120     	blr	x9
 1284408: b40031d4     	cbz	x20, 0x1284a40 <__start_il2cpp+0xdd27c>
 128440c: f9400288     	ldr	x8, [x20]
 1284410: 2d582269     	ldp	s9, s8, [x19, #0xc0]
 1284414: 2d572a6b     	ldp	s11, s10, [x19, #0xb8]
 1284418: aa1403e0     	mov	x0, x20
 128441c: a9578509     	ldp	x9, x1, [x8, #0x178]
 1284420: d63f0120     	blr	x9
 1284424: f9400288     	ldr	x8, [x20]
 1284428: 2a0003f5     	mov	w21, w0
 128442c: aa1403e0     	mov	x0, x20
 1284430: a9598509     	ldp	x9, x1, [x8, #0x198]
 1284434: d63f0120     	blr	x9
 1284438: 2a0003e1     	mov	w1, w0
 128443c: 52800022     	mov	w2, #0x1                // =1
 1284440: 4eab1d60     	mov	v0.16b, v11.16b
 1284444: 4eaa1d41     	mov	v1.16b, v10.16b
 1284448: 4ea91d22     	mov	v2.16b, v9.16b
 128444c: 4ea81d03     	mov	v3.16b, v8.16b
 1284450: 2a1503e0     	mov	w0, w21
 1284454: aa1f03e3     	mov	x3, xzr
 1284458: 97fd82e6     	bl	0x11e4ff0 <__start_il2cpp+0x3d82c>
 128445c: f9404a60     	ldr	x0, [x19, #0x90]
 1284460: b4002f00     	cbz	x0, 0x1284a40 <__start_il2cpp+0xdd27c>
 1284464: aa1f03e1     	mov	x1, xzr
 1284468: 4ea21c49     	mov	v9.16b, v2.16b
 128446c: 4ea31c68     	mov	v8.16b, v3.16b
 1284470: 97fdb68e     	bl	0x11f1ea8 <__start_il2cpp+0x4a6e4>
 1284474: 394446e8     	ldrb	w8, [x23, #0x111]
 1284478: 4ea01c0a     	mov	v10.16b, v0.16b
 128447c: 350000c8     	cbnz	w8, 0x1284494 <__start_il2cpp+0xdccd0>
 1284480: d000aec0     	adrp	x0, 0x285e000
 1284484: f9417800     	ldr	x0, [x0, #0x2f0]
 1284488: 97f8ee94     	bl	0x10bfed8 <CloseNLSocket+0x410>
 128448c: 52800028     	mov	w8, #0x1                // =1
 1284490: 390446e8     	strb	w8, [x23, #0x111]
 1284494: f94002c0     	ldr	x0, [x22]
 1284498: 1e2a092b     	fmul	s11, s9, s10
 128449c: b940e008     	ldr	w8, [x0, #0xe0]
 12844a0: 35000048     	cbnz	w8, 0x12844a8 <__start_il2cpp+0xdcce4>
 12844a4: 97f8eecf     	bl	0x10bffe0 <CloseNLSocket+0x518>
 12844a8: 1e22c169     	fcvt	d9, s11
 12844ac: 910023e0     	add	x0, sp, #0x8
 12844b0: 4ea91d20     	mov	v0.16b, v9.16b
 12844b4: 94520e23     	bl	0x2707d40 <modf@plt>
 12844b8: 1e202168     	fcmp	s11, #0.0
 12844bc: 540001ea     	b.ge	0x12844f8 <__start_il2cpp+0xdcd34>
 12844c0: 1e7c1001     	fmov	d1, #-0.50000000
 12844c4: 1e612000     	fcmp	d0, d1
 12844c8: 540002c1     	b.ne	0x1284520 <__start_il2cpp+0xdcd5c>
 12844cc: fd4007e0     	ldr	d0, [sp, #0x8]
 12844d0: 1e7e1001     	fmov	d1, #-1.00000000
 12844d4: 1400000e     	b	0x128450c <__start_il2cpp+0xdcd48>
 12844d8: a9464ff4     	ldp	x20, x19, [sp, #0x60]
 12844dc: a94557f6     	ldp	x22, x21, [sp, #0x50]
 12844e0: a9445ffe     	ldp	x30, x23, [sp, #0x40]
 12844e4: 6d4323e9     	ldp	d9, d8, [sp, #0x30]
 12844e8: 6d422beb     	ldp	d11, d10, [sp, #0x20]
 12844ec: 6d4133ed     	ldp	d13, d12, [sp, #0x10]
 12844f0: 9101c3ff     	add	sp, sp, #0x70
 12844f4: d65f03c0     	ret
 12844f8: 1e6c1001     	fmov	d1, #0.50000000
 12844fc: 1e612000     	fcmp	d0, d1
 1284500: 54000161     	b.ne	0x128452c <__start_il2cpp+0xdcd68>
 1284504: fd4007e0     	ldr	d0, [sp, #0x8]
 1284508: 1e6e1001     	fmov	d1, #1.00000000
 128450c: 9e780008     	fcvtzs	x8, d0
 1284510: 1e612801     	fadd	d1, d0, d1
 1284514: f240011f     	tst	x8, #0x1
 1284518: 1e610c00     	fcsel	d0, d0, d1, eq
 128451c: 14000006     	b	0x1284534 <__start_il2cpp+0xdcd70>
 1284520: 1e612920     	fadd	d0, d9, d1
 1284524: 1e64c000     	frintp	d0, d0
 1284528: 14000003     	b	0x1284534 <__start_il2cpp+0xdcd70>
 128452c: 1e612920     	fadd	d0, d9, d1
 1284530: 1e654000     	frintm	d0, d0
 1284534: 1e780008     	fcvtzs	w8, d0
 1284538: d2effe09     	mov	x9, #0x7ff0000000000000 // =9218868437227405312
 128453c: 394446ea     	ldrb	w10, [x23, #0x111]
 1284540: 1e220101     	scvtf	s1, w8
 1284544: 9e670122     	fmov	d2, x9
 1284548: 52b9e008     	mov	w8, #-0x31000000        // =-822083584
 128454c: 1e622000     	fcmp	d0, d2
 1284550: 1e270100     	fmov	s0, w8
 1284554: 1e210c09     	fcsel	s9, s0, s1, eq
 1284558: 350000ca     	cbnz	w10, 0x1284570 <__start_il2cpp+0xdcdac>
 128455c: d000aec0     	adrp	x0, 0x285e000
 1284560: f9417800     	ldr	x0, [x0, #0x2f0]
 1284564: 97f8ee5d     	bl	0x10bfed8 <CloseNLSocket+0x410>
 1284568: 52800028     	mov	w8, #0x1                // =1
 128456c: 390446e8     	strb	w8, [x23, #0x111]
 1284570: f94002c0     	ldr	x0, [x22]
 1284574: 1e2a090a     	fmul	s10, s8, s10
 1284578: b940e008     	ldr	w8, [x0, #0xe0]
 128457c: 35000048     	cbnz	w8, 0x1284584 <__start_il2cpp+0xdcdc0>
 1284580: 97f8ee98     	bl	0x10bffe0 <CloseNLSocket+0x518>
 1284584: 1e22c148     	fcvt	d8, s10
 1284588: 910023e0     	add	x0, sp, #0x8
 128458c: 4ea81d00     	mov	v0.16b, v8.16b
 1284590: 94520dec     	bl	0x2707d40 <modf@plt>
 1284594: 1e202148     	fcmp	s10, #0.0
 1284598: 540000ea     	b.ge	0x12845b4 <__start_il2cpp+0xdcdf0>
 128459c: 1e7c1001     	fmov	d1, #-0.50000000
 12845a0: 1e612000     	fcmp	d0, d1
 12845a4: 540001c1     	b.ne	0x12845dc <__start_il2cpp+0xdce18>
 12845a8: fd4007e0     	ldr	d0, [sp, #0x8]
 12845ac: 1e7e1001     	fmov	d1, #-1.00000000
 12845b0: 14000006     	b	0x12845c8 <__start_il2cpp+0xdce04>
 12845b4: 1e6c1001     	fmov	d1, #0.50000000
 12845b8: 1e612000     	fcmp	d0, d1
 12845bc: 54000161     	b.ne	0x12845e8 <__start_il2cpp+0xdce24>
 12845c0: fd4007e0     	ldr	d0, [sp, #0x8]
 12845c4: 1e6e1001     	fmov	d1, #1.00000000
 12845c8: 9e780008     	fcvtzs	x8, d0
 12845cc: 1e612801     	fadd	d1, d0, d1
 12845d0: f240011f     	tst	x8, #0x1
 12845d4: 1e610c00     	fcsel	d0, d0, d1, eq
 12845d8: 14000006     	b	0x12845f0 <__start_il2cpp+0xdce2c>
 12845dc: 1e612900     	fadd	d0, d8, d1
 12845e0: 1e64c000     	frintp	d0, d0
 12845e4: 14000003     	b	0x12845f0 <__start_il2cpp+0xdce2c>
 12845e8: 1e612900     	fadd	d0, d8, d1
 12845ec: 1e654000     	frintm	d0, d0
 12845f0: d2effe09     	mov	x9, #0x7ff0000000000000 // =9218868437227405312
 12845f4: 1e780008     	fcvtzs	w8, d0
 12845f8: 52b9e00a     	mov	w10, #-0x31000000       // =-822083584
 12845fc: 9e670122     	fmov	d2, x9
 1284600: 1e220101     	scvtf	s1, w8
 1284604: 1e622000     	fcmp	d0, d2
 1284608: 1e270140     	fmov	s0, w10
 128460c: aa1303e0     	mov	x0, x19
 1284610: aa1f03e1     	mov	x1, xzr
 1284614: 1e210c08     	fcsel	s8, s0, s1, eq
 1284618: 97fd876c     	bl	0x11e63c8 <__start_il2cpp+0x3ec04>
 128461c: b4002120     	cbz	x0, 0x1284a40 <__start_il2cpp+0xdd27c>
 1284620: 1e2e1002     	fmov	s2, #1.00000000
 1284624: 4ea91d20     	mov	v0.16b, v9.16b
 1284628: 4ea81d01     	mov	v1.16b, v8.16b
 128462c: aa1f03e1     	mov	x1, xzr
 1284630: 9448f9d0     	bl	0x24c2d70 <__start_il2cpp+0x131b5ac>
 1284634: f9405268     	ldr	x8, [x19, #0xa0]
 1284638: b4002048     	cbz	x8, 0x1284a40 <__start_il2cpp+0xdd27c>
 128463c: 2d470500     	ldp	s0, s1, [x8, #0x38]
 1284640: 394446e8     	ldrb	w8, [x23, #0x111]
 1284644: 1e2e1002     	fmov	s2, #1.00000000
 1284648: 1e222800     	fadd	s0, s0, s2
 128464c: 1e21280a     	fadd	s10, s0, s1
 1284650: 350000c8     	cbnz	w8, 0x1284668 <__start_il2cpp+0xdcea4>
 1284654: d000aec0     	adrp	x0, 0x285e000
 1284658: f9417800     	ldr	x0, [x0, #0x2f0]
 128465c: 97f8ee1f     	bl	0x10bfed8 <CloseNLSocket+0x410>
 1284660: 52800028     	mov	w8, #0x1                // =1
 1284664: 390446e8     	strb	w8, [x23, #0x111]
 1284668: f94002c0     	ldr	x0, [x22]
 128466c: 1e2a092a     	fmul	s10, s9, s10
 1284670: b940e008     	ldr	w8, [x0, #0xe0]
 1284674: 35000048     	cbnz	w8, 0x128467c <__start_il2cpp+0xdceb8>
 1284678: 97f8ee5a     	bl	0x10bffe0 <CloseNLSocket+0x518>
 128467c: 1e22c149     	fcvt	d9, s10
 1284680: 910023e0     	add	x0, sp, #0x8
 1284684: 4ea91d20     	mov	v0.16b, v9.16b
 1284688: 94520dae     	bl	0x2707d40 <modf@plt>
 128468c: 1e202148     	fcmp	s10, #0.0
 1284690: 540000ea     	b.ge	0x12846ac <__start_il2cpp+0xdcee8>
 1284694: 1e7c1001     	fmov	d1, #-0.50000000
 1284698: 1e612000     	fcmp	d0, d1
 128469c: 540001c1     	b.ne	0x12846d4 <__start_il2cpp+0xdcf10>
 12846a0: fd4007e0     	ldr	d0, [sp, #0x8]
 12846a4: 1e7e1001     	fmov	d1, #-1.00000000
 12846a8: 14000006     	b	0x12846c0 <__start_il2cpp+0xdcefc>
 12846ac: 1e6c1001     	fmov	d1, #0.50000000
 12846b0: 1e612000     	fcmp	d0, d1
 12846b4: 54000161     	b.ne	0x12846e0 <__start_il2cpp+0xdcf1c>
 12846b8: fd4007e0     	ldr	d0, [sp, #0x8]
 12846bc: 1e6e1001     	fmov	d1, #1.00000000
 12846c0: 9e780008     	fcvtzs	x8, d0
 12846c4: 1e612801     	fadd	d1, d0, d1
 12846c8: f240011f     	tst	x8, #0x1
 12846cc: 1e610c0d     	fcsel	d13, d0, d1, eq
 12846d0: 14000006     	b	0x12846e8 <__start_il2cpp+0xdcf24>
 12846d4: 1e612920     	fadd	d0, d9, d1
 12846d8: 1e64c00d     	frintp	d13, d0
 12846dc: 14000003     	b	0x12846e8 <__start_il2cpp+0xdcf24>
 12846e0: 1e612920     	fadd	d0, d9, d1
 12846e4: 1e65400d     	frintm	d13, d0
 12846e8: f9405268     	ldr	x8, [x19, #0xa0]
 12846ec: b4001aa8     	cbz	x8, 0x1284a40 <__start_il2cpp+0xdd27c>
 12846f0: 2d480500     	ldp	s0, s1, [x8, #0x40]
 12846f4: 394446e8     	ldrb	w8, [x23, #0x111]
 12846f8: 1e2e1002     	fmov	s2, #1.00000000
 12846fc: 1e222800     	fadd	s0, s0, s2
 1284700: 1e212809     	fadd	s9, s0, s1
 1284704: 350000c8     	cbnz	w8, 0x128471c <__start_il2cpp+0xdcf58>
 1284708: d000aec0     	adrp	x0, 0x285e000
 128470c: f9417800     	ldr	x0, [x0, #0x2f0]
 1284710: 97f8edf2     	bl	0x10bfed8 <CloseNLSocket+0x410>
 1284714: 52800028     	mov	w8, #0x1                // =1
 1284718: 390446e8     	strb	w8, [x23, #0x111]
 128471c: f94002c0     	ldr	x0, [x22]
 1284720: 1e290909     	fmul	s9, s8, s9
 1284724: b940e008     	ldr	w8, [x0, #0xe0]
 1284728: 35000048     	cbnz	w8, 0x1284730 <__start_il2cpp+0xdcf6c>
 128472c: 97f8ee2d     	bl	0x10bffe0 <CloseNLSocket+0x518>
 1284730: 1e22c128     	fcvt	d8, s9
 1284734: 910023e0     	add	x0, sp, #0x8
 1284738: 4ea81d00     	mov	v0.16b, v8.16b
 128473c: 94520d81     	bl	0x2707d40 <modf@plt>
 1284740: 1e202128     	fcmp	s9, #0.0
 1284744: 540000ea     	b.ge	0x1284760 <__start_il2cpp+0xdcf9c>
 1284748: 1e7c1001     	fmov	d1, #-0.50000000
 128474c: 1e612000     	fcmp	d0, d1
 1284750: 540001c1     	b.ne	0x1284788 <__start_il2cpp+0xdcfc4>
 1284754: fd4007e0     	ldr	d0, [sp, #0x8]
 1284758: 1e7e1001     	fmov	d1, #-1.00000000
 128475c: 14000006     	b	0x1284774 <__start_il2cpp+0xdcfb0>
 1284760: 1e6c1001     	fmov	d1, #0.50000000
 1284764: 1e612000     	fcmp	d0, d1
 1284768: 54000161     	b.ne	0x1284794 <__start_il2cpp+0xdcfd0>
 128476c: fd4007e0     	ldr	d0, [sp, #0x8]
 1284770: 1e6e1001     	fmov	d1, #1.00000000
 1284774: 9e780008     	fcvtzs	x8, d0
 1284778: 1e612801     	fadd	d1, d0, d1
 128477c: f240011f     	tst	x8, #0x1
 1284780: 1e610c0c     	fcsel	d12, d0, d1, eq
 1284784: 14000006     	b	0x128479c <__start_il2cpp+0xdcfd8>
 1284788: 1e612900     	fadd	d0, d8, d1
 128478c: 1e64c00c     	frintp	d12, d0
 1284790: 14000003     	b	0x128479c <__start_il2cpp+0xdcfd8>
 1284794: 1e612900     	fadd	d0, d8, d1
 1284798: 1e65400c     	frintm	d12, d0
 128479c: aa1303e0     	mov	x0, x19
 12847a0: aa1f03e1     	mov	x1, xzr
 12847a4: 97fd8709     	bl	0x11e63c8 <__start_il2cpp+0x3ec04>
 12847a8: b40014c0     	cbz	x0, 0x1284a40 <__start_il2cpp+0xdd27c>
 12847ac: aa1f03e1     	mov	x1, xzr
 12847b0: 9448f57b     	bl	0x24c1d9c <__start_il2cpp+0x131a5d8>
 12847b4: 394446e8     	ldrb	w8, [x23, #0x111]
 12847b8: 4ea01c0a     	mov	v10.16b, v0.16b
 12847bc: 4ea11c28     	mov	v8.16b, v1.16b
 12847c0: 4ea21c49     	mov	v9.16b, v2.16b
 12847c4: 350000c8     	cbnz	w8, 0x12847dc <__start_il2cpp+0xdd018>
 12847c8: d000aec0     	adrp	x0, 0x285e000
 12847cc: f9417800     	ldr	x0, [x0, #0x2f0]
 12847d0: 97f8edc2     	bl	0x10bfed8 <CloseNLSocket+0x410>
 12847d4: 52800028     	mov	w8, #0x1                // =1
 12847d8: 390446e8     	strb	w8, [x23, #0x111]
 12847dc: f94002c0     	ldr	x0, [x22]
 12847e0: b940e008     	ldr	w8, [x0, #0xe0]
 12847e4: 35000048     	cbnz	w8, 0x12847ec <__start_il2cpp+0xdd028>
 12847e8: 97f8edfe     	bl	0x10bffe0 <CloseNLSocket+0x518>
 12847ec: 1e22c12b     	fcvt	d11, s9
 12847f0: 910023e0     	add	x0, sp, #0x8
 12847f4: 4eab1d60     	mov	v0.16b, v11.16b
 12847f8: 1e7801b5     	fcvtzs	w21, d13
 12847fc: 94520d51     	bl	0x2707d40 <modf@plt>
 1284800: 1e202128     	fcmp	s9, #0.0
 1284804: 540000ea     	b.ge	0x1284820 <__start_il2cpp+0xdd05c>
 1284808: 1e7c1001     	fmov	d1, #-0.50000000
 128480c: 1e612000     	fcmp	d0, d1
 1284810: 540001c1     	b.ne	0x1284848 <__start_il2cpp+0xdd084>
 1284814: fd4007e0     	ldr	d0, [sp, #0x8]
 1284818: 1e7e1001     	fmov	d1, #-1.00000000
 128481c: 14000006     	b	0x1284834 <__start_il2cpp+0xdd070>
 1284820: 1e6c1001     	fmov	d1, #0.50000000
 1284824: 1e612000     	fcmp	d0, d1
 1284828: 54000161     	b.ne	0x1284854 <__start_il2cpp+0xdd090>
 128482c: fd4007e0     	ldr	d0, [sp, #0x8]
 1284830: 1e6e1001     	fmov	d1, #1.00000000
 1284834: 9e780008     	fcvtzs	x8, d0
 1284838: 1e612801     	fadd	d1, d0, d1
 128483c: f240011f     	tst	x8, #0x1
 1284840: 1e610c00     	fcsel	d0, d0, d1, eq
 1284844: 14000006     	b	0x128485c <__start_il2cpp+0xdd098>
 1284848: 1e612960     	fadd	d0, d11, d1
 128484c: 1e64c000     	frintp	d0, d0
 1284850: 14000003     	b	0x128485c <__start_il2cpp+0xdd098>
 1284854: 1e612960     	fadd	d0, d11, d1
 1284858: 1e654000     	frintm	d0, d0
 128485c: d2effe09     	mov	x9, #0x7ff0000000000000 // =9218868437227405312
 1284860: 1e780008     	fcvtzs	w8, d0
 1284864: 52b9e00a     	mov	w10, #-0x31000000       // =-822083584
 1284868: 9e670122     	fmov	d2, x9
 128486c: 1e220101     	scvtf	s1, w8
 1284870: 1e622000     	fcmp	d0, d2
 1284874: 1e270140     	fmov	s0, w10
 1284878: 1e210c09     	fcsel	s9, s0, s1, eq
 128487c: 710002bf     	cmp	w21, #0x0
 1284880: 1a95a6a8     	cinc	w8, w21, lt
 1284884: 1e6221a0     	fcmp	d13, d2
 1284888: 1e780194     	fcvtzs	w20, d12
 128488c: 54000220     	b.eq	0x12848d0 <__start_il2cpp+0xdd10c>
 1284890: 121f7908     	and	w8, w8, #0xfffffffe
 1284894: 4b0802a8     	sub	w8, w21, w8
 1284898: 7100051f     	cmp	w8, #0x1
 128489c: 540001a1     	b.ne	0x12848d0 <__start_il2cpp+0xdd10c>
 12848a0: b9403a68     	ldr	w8, [x19, #0x38]
 12848a4: 71001d1f     	cmp	w8, #0x7
 12848a8: 54000148     	b.hi	0x12848d0 <__start_il2cpp+0xdd10c>
 12848ac: 52800029     	mov	w9, #0x1                // =1
 12848b0: 1ac82128     	lsl	w8, w9, w8
 12848b4: 52801249     	mov	w9, #0x92               // =146
 12848b8: 6a09011f     	tst	w8, w9
 12848bc: 540000a0     	b.eq	0x12848d0 <__start_il2cpp+0xdd10c>
 12848c0: 1e254140     	frintm	s0, s10
 12848c4: 1e2c1001     	fmov	s1, #0.50000000
 12848c8: 1e21280a     	fadd	s10, s0, s1
 12848cc: 1400001e     	b	0x1284944 <__start_il2cpp+0xdd180>
 12848d0: 1e22c140     	fcvt	d0, s10
 12848d4: 910023e0     	add	x0, sp, #0x8
 12848d8: 94520d1a     	bl	0x2707d40 <modf@plt>
 12848dc: 1e202148     	fcmp	s10, #0.0
 12848e0: 540000ea     	b.ge	0x12848fc <__start_il2cpp+0xdd138>
 12848e4: 1e7c1001     	fmov	d1, #-0.50000000
 12848e8: 1e612000     	fcmp	d0, d1
 12848ec: 540001e1     	b.ne	0x1284928 <__start_il2cpp+0xdd164>
 12848f0: fd4007e0     	ldr	d0, [sp, #0x8]
 12848f4: 1e3e1001     	fmov	s1, #-1.00000000
 12848f8: 14000006     	b	0x1284910 <__start_il2cpp+0xdd14c>
 12848fc: 1e6c1001     	fmov	d1, #0.50000000
 1284900: 1e612000     	fcmp	d0, d1
 1284904: 540001a1     	b.ne	0x1284938 <__start_il2cpp+0xdd174>
 1284908: fd4007e0     	ldr	d0, [sp, #0x8]
 128490c: 1e2e1001     	fmov	s1, #1.00000000
 1284910: 9e780008     	fcvtzs	x8, d0
 1284914: 1e624000     	fcvt	s0, d0
 1284918: 1e212801     	fadd	s1, s0, s1
 128491c: f240011f     	tst	x8, #0x1
 1284920: 1e210c0a     	fcsel	s10, s0, s1, eq
 1284924: 14000008     	b	0x1284944 <__start_il2cpp+0xdd180>
 1284928: 1e3c1000     	fmov	s0, #-0.50000000
 128492c: 1e202940     	fadd	s0, s10, s0
 1284930: 1e24c00a     	frintp	s10, s0
 1284934: 14000004     	b	0x1284944 <__start_il2cpp+0xdd180>
 1284938: 1e2c1000     	fmov	s0, #0.50000000
 128493c: 1e202940     	fadd	s0, s10, s0
 1284940: 1e25400a     	frintm	s10, s0
 1284944: d2effe09     	mov	x9, #0x7ff0000000000000 // =9218868437227405312
 1284948: 7100029f     	cmp	w20, #0x0
 128494c: 9e670120     	fmov	d0, x9
 1284950: 1a94a688     	cinc	w8, w20, lt
 1284954: 1e602180     	fcmp	d12, d0
 1284958: 540001a0     	b.eq	0x128498c <__start_il2cpp+0xdd1c8>
 128495c: 121f7908     	and	w8, w8, #0xfffffffe
 1284960: 4b080288     	sub	w8, w20, w8
 1284964: 7100051f     	cmp	w8, #0x1
 1284968: 54000121     	b.ne	0x128498c <__start_il2cpp+0xdd1c8>
 128496c: b9403a68     	ldr	w8, [x19, #0x38]
 1284970: 51000d08     	sub	w8, w8, #0x3
 1284974: 7100091f     	cmp	w8, #0x2
 1284978: 540000a8     	b.hi	0x128498c <__start_il2cpp+0xdd1c8>
 128497c: 1e24c100     	frintp	s0, s8
 1284980: 1e3c1001     	fmov	s1, #-0.50000000
 1284984: 1e212808     	fadd	s8, s0, s1
 1284988: 1400001e     	b	0x1284a00 <__start_il2cpp+0xdd23c>
 128498c: 1e22c100     	fcvt	d0, s8
 1284990: 910023e0     	add	x0, sp, #0x8
 1284994: 94520ceb     	bl	0x2707d40 <modf@plt>
 1284998: 1e202108     	fcmp	s8, #0.0
 128499c: 540000ea     	b.ge	0x12849b8 <__start_il2cpp+0xdd1f4>
 12849a0: 1e7c1001     	fmov	d1, #-0.50000000
 12849a4: 1e612000     	fcmp	d0, d1
 12849a8: 540001e1     	b.ne	0x12849e4 <__start_il2cpp+0xdd220>
 12849ac: fd4007e0     	ldr	d0, [sp, #0x8]
 12849b0: 1e3e1001     	fmov	s1, #-1.00000000
 12849b4: 14000006     	b	0x12849cc <__start_il2cpp+0xdd208>
 12849b8: 1e6c1001     	fmov	d1, #0.50000000
 12849bc: 1e612000     	fcmp	d0, d1
 12849c0: 540001a1     	b.ne	0x12849f4 <__start_il2cpp+0xdd230>
 12849c4: fd4007e0     	ldr	d0, [sp, #0x8]
 12849c8: 1e2e1001     	fmov	s1, #1.00000000
 12849cc: 9e780008     	fcvtzs	x8, d0
 12849d0: 1e624000     	fcvt	s0, d0
 12849d4: 1e212801     	fadd	s1, s0, s1
 12849d8: f240011f     	tst	x8, #0x1
 12849dc: 1e210c08     	fcsel	s8, s0, s1, eq
 12849e0: 14000008     	b	0x1284a00 <__start_il2cpp+0xdd23c>
 12849e4: 1e3c1000     	fmov	s0, #-0.50000000
 12849e8: 1e202900     	fadd	s0, s8, s0
 12849ec: 1e24c008     	frintp	s8, s0
 12849f0: 14000004     	b	0x1284a00 <__start_il2cpp+0xdd23c>
 12849f4: 1e2c1000     	fmov	s0, #0.50000000
 12849f8: 1e202900     	fadd	s0, s8, s0
 12849fc: 1e254008     	frintm	s8, s0
 1284a00: aa1303e0     	mov	x0, x19
 1284a04: aa1f03e1     	mov	x1, xzr
 1284a08: 97fd8670     	bl	0x11e63c8 <__start_il2cpp+0x3ec04>
 1284a0c: b40001a0     	cbz	x0, 0x1284a40 <__start_il2cpp+0xdd27c>
 1284a10: 4eaa1d40     	mov	v0.16b, v10.16b
 1284a14: 4ea81d01     	mov	v1.16b, v8.16b
 1284a18: 4ea91d22     	mov	v2.16b, v9.16b
 1284a1c: a9464ff4     	ldp	x20, x19, [sp, #0x60]
 1284a20: a94557f6     	ldp	x22, x21, [sp, #0x50]
 1284a24: a9445ffe     	ldp	x30, x23, [sp, #0x40]
 1284a28: 6d4323e9     	ldp	d9, d8, [sp, #0x30]
 1284a2c: 6d422beb     	ldp	d11, d10, [sp, #0x20]
 1284a30: 6d4133ed     	ldp	d13, d12, [sp, #0x10]
 1284a34: aa1f03e1     	mov	x1, xzr
 1284a38: 9101c3ff     	add	sp, sp, #0x70
 1284a3c: 1448f4fb     	b	0x24c1e28 <__start_il2cpp+0x131a664>
 1284a40: 97f8edb0     	bl	0x10c0100 <CloseNLSocket+0x638>
