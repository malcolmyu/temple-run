
/tmp/temple-libil2cpp.so:	file format elf64-littleaarch64

Disassembly of section il2cpp:

00000000011a77c4 <__start_il2cpp>:
 12f7694: d10303ff     	sub	sp, sp, #0xc0
 12f7698: 6d042beb     	stp	d11, d10, [sp, #0x40]
 12f769c: 6d0523e9     	stp	d9, d8, [sp, #0x50]
 12f76a0: a9067bfd     	stp	x29, x30, [sp, #0x60]
 12f76a4: a9076ffc     	stp	x28, x27, [sp, #0x70]
 12f76a8: a90867fa     	stp	x26, x25, [sp, #0x80]
 12f76ac: a9095ff8     	stp	x24, x23, [sp, #0x90]
 12f76b0: a90a57f6     	stp	x22, x21, [sp, #0xa0]
 12f76b4: a90b4ff4     	stp	x20, x19, [sp, #0xb0]
 12f76b8: d000b9f4     	adrp	x20, 0x2a35000
 12f76bc: 396ef688     	ldrb	w8, [x20, #0xbbd]
 12f76c0: 4ea31c6b     	mov	v11.16b, v3.16b
 12f76c4: 4ea21c48     	mov	v8.16b, v2.16b
 12f76c8: 4ea11c29     	mov	v9.16b, v1.16b
 12f76cc: 4ea01c0a     	mov	v10.16b, v0.16b
 12f76d0: aa0003f3     	mov	x19, x0
 12f76d4: 37000368     	tbnz	w8, #0x0, 0x12f7740 <__start_il2cpp+0x14ff7c>
 12f76d8: b000ab20     	adrp	x0, 0x285c000 <_ZTVN10__cxxabiv119__pointer_type_infoE+0x18>
 12f76dc: f9471800     	ldr	x0, [x0, #0xe30]
 12f76e0: 97f721fe     	bl	0x10bfed8 <CloseNLSocket+0x410>
 12f76e4: f000ab60     	adrp	x0, 0x2866000
 12f76e8: f9447000     	ldr	x0, [x0, #0x8e0]
 12f76ec: 97f721fb     	bl	0x10bfed8 <CloseNLSocket+0x410>
 12f76f0: d000ab20     	adrp	x0, 0x285d000
 12f76f4: f9411800     	ldr	x0, [x0, #0x230]
 12f76f8: 97f721f8     	bl	0x10bfed8 <CloseNLSocket+0x410>
 12f76fc: f000ab60     	adrp	x0, 0x2866000
 12f7700: f9447400     	ldr	x0, [x0, #0x8e8]
 12f7704: 97f721f5     	bl	0x10bfed8 <CloseNLSocket+0x410>
 12f7708: f000ab60     	adrp	x0, 0x2866000
 12f770c: f9447800     	ldr	x0, [x0, #0x8f0]
 12f7710: 97f721f2     	bl	0x10bfed8 <CloseNLSocket+0x410>
 12f7714: f000ab60     	adrp	x0, 0x2866000
 12f7718: f9447c00     	ldr	x0, [x0, #0x8f8]
 12f771c: 97f721ef     	bl	0x10bfed8 <CloseNLSocket+0x410>
 12f7720: f000ab60     	adrp	x0, 0x2866000
 12f7724: f9448000     	ldr	x0, [x0, #0x900]
 12f7728: 97f721ec     	bl	0x10bfed8 <CloseNLSocket+0x410>
 12f772c: f000ab60     	adrp	x0, 0x2866000
 12f7730: f9448400     	ldr	x0, [x0, #0x908]
 12f7734: 97f721e9     	bl	0x10bfed8 <CloseNLSocket+0x410>
 12f7738: 52800028     	mov	w8, #0x1                // =1
 12f773c: 392ef688     	strb	w8, [x20, #0xbbd]
 12f7740: f000ab77     	adrp	x23, 0x2866000
 12f7744: f000ab78     	adrp	x24, 0x2866000
 12f7748: d000ab39     	adrp	x25, 0x285d000
 12f774c: f000ab7a     	adrp	x26, 0x2866000
 12f7750: f000ab7b     	adrp	x27, 0x2866000
 12f7754: b000ab3c     	adrp	x28, 0x285c000 <_ZTVN10__cxxabiv119__pointer_type_infoE+0x18>
 12f7758: f000ab7d     	adrp	x29, 0x2866000
 12f775c: f94472f7     	ldr	x23, [x23, #0x8e0]
 12f7760: f9447718     	ldr	x24, [x24, #0x8e8]
 12f7764: f9411b39     	ldr	x25, [x25, #0x230]
 12f7768: f944835a     	ldr	x26, [x26, #0x900]
 12f776c: f944877b     	ldr	x27, [x27, #0x908]
 12f7770: f9471b9c     	ldr	x28, [x28, #0xe30]
 12f7774: f9447fbd     	ldr	x29, [x29, #0x8f8]
 12f7778: aa1f03f6     	mov	x22, xzr
 12f777c: 1e2b096b     	fmul	s11, s11, s11
 12f7780: 3900f3ff     	strb	wzr, [sp, #0x3c]
 12f7784: a9027fff     	stp	xzr, xzr, [sp, #0x20]
 12f7788: f9001bff     	str	xzr, [sp, #0x30]
 12f778c: b9001fff     	str	wzr, [sp, #0x1c]
 12f7790: f9401e68     	ldr	x8, [x19, #0x38]
 12f7794: b4001008     	cbz	x8, 0x12f7994 <__start_il2cpp+0x1501d0>
 12f7798: b9401909     	ldr	w9, [x8, #0x18]
 12f779c: eb0902df     	cmp	x22, x9
 12f77a0: 54000f82     	b.hs	0x12f7990 <__start_il2cpp+0x1501cc>
 12f77a4: 8b160d08     	add	x8, x8, x22, lsl #3
 12f77a8: f9401114     	ldr	x20, [x8, #0x20]
 12f77ac: b4000f54     	cbz	x20, 0x12f7994 <__start_il2cpp+0x1501d0>
 12f77b0: 3940b688     	ldrb	w8, [x20, #0x2d]
 12f77b4: 34000668     	cbz	w8, 0x12f7880 <__start_il2cpp+0x1500bc>
 12f77b8: f9400320     	ldr	x0, [x25]
 12f77bc: 528000c1     	mov	w1, #0x6                // =6
 12f77c0: 97f721e4     	bl	0x10bff50 <CloseNLSocket+0x488>
 12f77c4: b4000e80     	cbz	x0, 0x12f7994 <__start_il2cpp+0x1501d0>
 12f77c8: b9401808     	ldr	w8, [x0, #0x18]
 12f77cc: aa0003f5     	mov	x21, x0
 12f77d0: 34000e08     	cbz	w8, 0x12f7990 <__start_il2cpp+0x1501cc>
 12f77d4: f9400348     	ldr	x8, [x26]
 12f77d8: aa1403e0     	mov	x0, x20
 12f77dc: aa1f03e1     	mov	x1, xzr
 12f77e0: f90012a8     	str	x8, [x21, #0x20]
 12f77e4: 94471249     	bl	0x24bc108 <__start_il2cpp+0x1314944>
 12f77e8: b9401aa8     	ldr	w8, [x21, #0x18]
 12f77ec: 7100051f     	cmp	w8, #0x1
 12f77f0: 54000d09     	b.ls	0x12f7990 <__start_il2cpp+0x1501cc>
 12f77f4: 7100091f     	cmp	w8, #0x2
 12f77f8: f90016a0     	str	x0, [x21, #0x28]
 12f77fc: 54000ca0     	b.eq	0x12f7990 <__start_il2cpp+0x1501cc>
 12f7800: f9400368     	ldr	x8, [x27]
 12f7804: f9001aa8     	str	x8, [x21, #0x30]
 12f7808: f9400380     	ldr	x0, [x28]
 12f780c: b940e008     	ldr	w8, [x0, #0xe0]
 12f7810: 35000048     	cbnz	w8, 0x12f7818 <__start_il2cpp+0x150054>
 12f7814: 97f721f3     	bl	0x10bffe0 <CloseNLSocket+0x518>
 12f7818: 9100b280     	add	x0, x20, #0x2c
 12f781c: aa1f03e1     	mov	x1, xzr
 12f7820: 942ccfe4     	bl	0x1e2b7b0 <__start_il2cpp+0xc83fec>
 12f7824: b9401aa8     	ldr	w8, [x21, #0x18]
 12f7828: 71000d1f     	cmp	w8, #0x3
 12f782c: 54000b29     	b.ls	0x12f7990 <__start_il2cpp+0x1501cc>
 12f7830: 7100111f     	cmp	w8, #0x4
 12f7834: f9001ea0     	str	x0, [x21, #0x38]
 12f7838: 54000ac0     	b.eq	0x12f7990 <__start_il2cpp+0x1501cc>
 12f783c: f94003a8     	ldr	x8, [x29]
 12f7840: aa1403e0     	mov	x0, x20
 12f7844: f90022a8     	str	x8, [x21, #0x40]
 12f7848: 97fffb4b     	bl	0x12f6574 <__start_il2cpp+0x14edb0>
 12f784c: 12000008     	and	w8, w0, #0x1
 12f7850: 9100f3e0     	add	x0, sp, #0x3c
 12f7854: aa1f03e1     	mov	x1, xzr
 12f7858: 3900f3e8     	strb	w8, [sp, #0x3c]
 12f785c: 942ccfd5     	bl	0x1e2b7b0 <__start_il2cpp+0xc83fec>
 12f7860: b9401aa8     	ldr	w8, [x21, #0x18]
 12f7864: 7100151f     	cmp	w8, #0x5
 12f7868: 54000949     	b.ls	0x12f7990 <__start_il2cpp+0x1501cc>
 12f786c: f90026a0     	str	x0, [x21, #0x48]
 12f7870: aa1503e0     	mov	x0, x21
 12f7874: aa1f03e1     	mov	x1, xzr
 12f7878: 942931f0     	bl	0x1d44038 <__start_il2cpp+0xb9c874>
 12f787c: 97ffff54     	bl	0x12f75cc <__start_il2cpp+0x14fe08>
 12f7880: 3940b288     	ldrb	w8, [x20, #0x2c]
 12f7884: 340004e8     	cbz	w8, 0x12f7920 <__start_il2cpp+0x15015c>
 12f7888: aa1403e0     	mov	x0, x20
 12f788c: 97fffb3a     	bl	0x12f6574 <__start_il2cpp+0x14edb0>
 12f7890: 36000480     	tbz	w0, #0x0, 0x12f7920 <__start_il2cpp+0x15015c>
 12f7894: aa1403e0     	mov	x0, x20
 12f7898: aa1f03e1     	mov	x1, xzr
 12f789c: 9446fa1c     	bl	0x24b610c <__start_il2cpp+0x130e948>
 12f78a0: b40007a0     	cbz	x0, 0x12f7994 <__start_il2cpp+0x1501d0>
 12f78a4: f94002e1     	ldr	x1, [x23]
 12f78a8: 9402ad16     	bl	0x13a2d00 <__start_il2cpp+0x1fb53c>
 12f78ac: b4000740     	cbz	x0, 0x12f7994 <__start_il2cpp+0x1501d0>
 12f78b0: 910003e8     	mov	x8, sp
 12f78b4: aa1f03e1     	mov	x1, xzr
 12f78b8: 94469bbb     	bl	0x249e7a4 <__start_il2cpp+0x12f6fe0>
 12f78bc: 3dc003e0     	ldr	q0, [sp]
 12f78c0: f9400be8     	ldr	x8, [sp, #0x10]
 12f78c4: 910083e0     	add	x0, sp, #0x20
 12f78c8: 4ea91d21     	mov	v1.16b, v9.16b
 12f78cc: 3d800be0     	str	q0, [sp, #0x20]
 12f78d0: 4eaa1d40     	mov	v0.16b, v10.16b
 12f78d4: 4ea81d02     	mov	v2.16b, v8.16b
 12f78d8: aa1f03e1     	mov	x1, xzr
 12f78dc: f9001be8     	str	x8, [sp, #0x30]
 12f78e0: 9446898b     	bl	0x2499f0c <__start_il2cpp+0x12f2748>
 12f78e4: bd001fe0     	str	s0, [sp, #0x1c]
 12f78e8: 3940b688     	ldrb	w8, [x20, #0x2d]
 12f78ec: 34000168     	cbz	w8, 0x12f7918 <__start_il2cpp+0x150154>
 12f78f0: 910073e0     	add	x0, sp, #0x1c
 12f78f4: aa1f03e1     	mov	x1, xzr
 12f78f8: 942efbd3     	bl	0x1eb6844 <__start_il2cpp+0xd0f080>
 12f78fc: f9400308     	ldr	x8, [x24]
 12f7900: aa0003e1     	mov	x1, x0
 12f7904: aa1f03e2     	mov	x2, xzr
 12f7908: aa0803e0     	mov	x0, x8
 12f790c: 94290d64     	bl	0x1d3ae9c <__start_il2cpp+0xb936d8>
 12f7910: 97ffff2f     	bl	0x12f75cc <__start_il2cpp+0x14fe08>
 12f7914: bd401fe0     	ldr	s0, [sp, #0x1c]
 12f7918: 1e2b2000     	fcmp	s0, s11
 12f791c: 540000c9     	b.ls	0x12f7934 <__start_il2cpp+0x150170>
 12f7920: 910006d6     	add	x22, x22, #0x1
 12f7924: f105a6df     	cmp	x22, #0x169
 12f7928: 54fff341     	b.ne	0x12f7790 <__start_il2cpp+0x14ffcc>
 12f792c: aa1f03f4     	mov	x20, xzr
 12f7930: 1400000d     	b	0x12f7964 <__start_il2cpp+0x1501a0>
 12f7934: aa1403e0     	mov	x0, x20
 12f7938: aa1f03e1     	mov	x1, xzr
 12f793c: 944711f3     	bl	0x24bc108 <__start_il2cpp+0x1314944>
 12f7940: f000ab68     	adrp	x8, 0x2866000
 12f7944: f9447908     	ldr	x8, [x8, #0x8f0]
 12f7948: aa0003e1     	mov	x1, x0
 12f794c: aa1f03e2     	mov	x2, xzr
 12f7950: f9400108     	ldr	x8, [x8]
 12f7954: aa0803e0     	mov	x0, x8
 12f7958: 94290d51     	bl	0x1d3ae9c <__start_il2cpp+0xb936d8>
 12f795c: aa1403e1     	mov	x1, x20
 12f7960: 97fffe41     	bl	0x12f7264 <__start_il2cpp+0x14faa0>
 12f7964: aa1403e0     	mov	x0, x20
 12f7968: a94b4ff4     	ldp	x20, x19, [sp, #0xb0]
 12f796c: a94a57f6     	ldp	x22, x21, [sp, #0xa0]
 12f7970: a9495ff8     	ldp	x24, x23, [sp, #0x90]
 12f7974: a94867fa     	ldp	x26, x25, [sp, #0x80]
 12f7978: a9476ffc     	ldp	x28, x27, [sp, #0x70]
 12f797c: a9467bfd     	ldp	x29, x30, [sp, #0x60]
 12f7980: 6d4523e9     	ldp	d9, d8, [sp, #0x50]
 12f7984: 6d442beb     	ldp	d11, d10, [sp, #0x40]
 12f7988: 910303ff     	add	sp, sp, #0xc0
 12f798c: d65f03c0     	ret
 12f7990: 97f721de     	bl	0x10c0108 <CloseNLSocket+0x640>
 12f7994: 97f721db     	bl	0x10c0100 <CloseNLSocket+0x638>
