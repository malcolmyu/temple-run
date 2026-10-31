
/tmp/temple-libil2cpp.so:	file format elf64-littleaarch64

Disassembly of section il2cpp:

00000000011a77c4 <__start_il2cpp>:
 12ae390: d10183ff     	sub	sp, sp, #0x60
 12ae394: fd0013ea     	str	d10, [sp, #0x20]
 12ae398: 6d0323e9     	stp	d9, d8, [sp, #0x30]
 12ae39c: a90457fe     	stp	x30, x21, [sp, #0x40]
 12ae3a0: a9054ff4     	stp	x20, x19, [sp, #0x50]
 12ae3a4: f000bc34     	adrp	x20, 0x2a35000
 12ae3a8: 3965ce88     	ldrb	w8, [x20, #0x973]
 12ae3ac: aa0003f3     	mov	x19, x0
 12ae3b0: 37000128     	tbnz	w8, #0x0, 0x12ae3d4 <__start_il2cpp+0x106c10>
 12ae3b4: 9000ad80     	adrp	x0, 0x285e000
 12ae3b8: f9461400     	ldr	x0, [x0, #0xc28]
 12ae3bc: 97f846c7     	bl	0x10bfed8 <CloseNLSocket+0x410>
 12ae3c0: d000ad60     	adrp	x0, 0x285c000 <_ZTVN10__cxxabiv119__pointer_type_infoE+0x18>
 12ae3c4: f9456000     	ldr	x0, [x0, #0xac0]
 12ae3c8: 97f846c4     	bl	0x10bfed8 <CloseNLSocket+0x410>
 12ae3cc: 52800028     	mov	w8, #0x1                // =1
 12ae3d0: 3925ce88     	strb	w8, [x20, #0x973]
 12ae3d4: b0ff9f48     	adrp	x8, 0x697000
 12ae3d8: b0ff9f49     	adrp	x9, 0x697000
 12ae3dc: bd451101     	ldr	s1, [x8, #0x510]
 12ae3e0: bd455122     	ldr	s2, [x9, #0x550]
 12ae3e4: 1e2e1000     	fmov	s0, #1.00000000
 12ae3e8: 1e2e1003     	fmov	s3, #1.00000000
 12ae3ec: aa1f03e0     	mov	x0, xzr
 12ae3f0: 9447b855     	bl	0x249c544 <__start_il2cpp+0x12f4d80>
 12ae3f4: aa1303e0     	mov	x0, x19
 12ae3f8: aa1f03e1     	mov	x1, xzr
 12ae3fc: 94481f44     	bl	0x24b610c <__start_il2cpp+0x130e948>
 12ae400: b40007e0     	cbz	x0, 0x12ae4fc <__start_il2cpp+0x106d38>
 12ae404: aa1f03e1     	mov	x1, xzr
 12ae408: 9448509b     	bl	0x24c2674 <__start_il2cpp+0x131aeb0>
 12ae40c: b0ff9f48     	adrp	x8, 0x697000
 12ae410: bd457903     	ldr	s3, [x8, #0x578]
 12ae414: aa1f03e0     	mov	x0, xzr
 12ae418: 9447b7fe     	bl	0x249c410 <__start_il2cpp+0x12f4c4c>
 12ae41c: aa1303e0     	mov	x0, x19
 12ae420: aa1f03e1     	mov	x1, xzr
 12ae424: 94481f3a     	bl	0x24b610c <__start_il2cpp+0x130e948>
 12ae428: b40006a0     	cbz	x0, 0x12ae4fc <__start_il2cpp+0x106d38>
 12ae42c: 9000ad95     	adrp	x21, 0x285e000
 12ae430: f94616b5     	ldr	x21, [x21, #0xc28]
 12ae434: d000ad74     	adrp	x20, 0x285c000 <_ZTVN10__cxxabiv119__pointer_type_infoE+0x18>
 12ae438: f94002a1     	ldr	x1, [x21]
 12ae43c: f9456294     	ldr	x20, [x20, #0xac0]
 12ae440: 9403d197     	bl	0x13a2a9c <__start_il2cpp+0x1fb2d8>
 12ae444: f9400288     	ldr	x8, [x20]
 12ae448: aa0003f4     	mov	x20, x0
 12ae44c: b940e109     	ldr	w9, [x8, #0xe0]
 12ae450: 35000069     	cbnz	w9, 0x12ae45c <__start_il2cpp+0x106c98>
 12ae454: aa0803e0     	mov	x0, x8
 12ae458: 97f846e2     	bl	0x10bffe0 <CloseNLSocket+0x518>
 12ae45c: aa1403e0     	mov	x0, x20
 12ae460: aa1f03e1     	mov	x1, xzr
 12ae464: aa1f03e2     	mov	x2, xzr
 12ae468: 944828f8     	bl	0x24b8848 <__start_il2cpp+0x1311084>
 12ae46c: 360003c0     	tbz	w0, #0x0, 0x12ae4e4 <__start_il2cpp+0x106d20>
 12ae470: aa1303e0     	mov	x0, x19
 12ae474: aa1f03e1     	mov	x1, xzr
 12ae478: 94481f25     	bl	0x24b610c <__start_il2cpp+0x130e948>
 12ae47c: b4000400     	cbz	x0, 0x12ae4fc <__start_il2cpp+0x106d38>
 12ae480: aa1f03e1     	mov	x1, xzr
 12ae484: 9448507c     	bl	0x24c2674 <__start_il2cpp+0x131aeb0>
 12ae488: aa1303e0     	mov	x0, x19
 12ae48c: aa1f03e1     	mov	x1, xzr
 12ae490: 4ea01c08     	mov	v8.16b, v0.16b
 12ae494: 4ea11c29     	mov	v9.16b, v1.16b
 12ae498: 4ea21c4a     	mov	v10.16b, v2.16b
 12ae49c: 94481f1c     	bl	0x24b610c <__start_il2cpp+0x130e948>
 12ae4a0: b40002e0     	cbz	x0, 0x12ae4fc <__start_il2cpp+0x106d38>
 12ae4a4: f94002a1     	ldr	x1, [x21]
 12ae4a8: 9403d17d     	bl	0x13a2a9c <__start_il2cpp+0x1fb2d8>
 12ae4ac: b4000280     	cbz	x0, 0x12ae4fc <__start_il2cpp+0x106d38>
 12ae4b0: 910023e8     	add	x8, sp, #0x8
 12ae4b4: aa1f03e1     	mov	x1, xzr
 12ae4b8: 9447c0bb     	bl	0x249e7a4 <__start_il2cpp+0x12f6fe0>
 12ae4bc: 2d4287e0     	ldp	s0, s1, [sp, #0x14]
 12ae4c0: bd401fe2     	ldr	s2, [sp, #0x1c]
 12ae4c4: aa1f03e0     	mov	x0, xzr
 12ae4c8: 1e202803     	fadd	s3, s0, s0
 12ae4cc: 1e212824     	fadd	s4, s1, s1
 12ae4d0: 1e222845     	fadd	s5, s2, s2
 12ae4d4: 4ea81d00     	mov	v0.16b, v8.16b
 12ae4d8: 4ea91d21     	mov	v1.16b, v9.16b
 12ae4dc: 4eaa1d42     	mov	v2.16b, v10.16b
 12ae4e0: 9447b7f4     	bl	0x249c4b0 <__start_il2cpp+0x12f4cec>
 12ae4e4: a9454ff4     	ldp	x20, x19, [sp, #0x50]
 12ae4e8: a94457fe     	ldp	x30, x21, [sp, #0x40]
 12ae4ec: 6d4323e9     	ldp	d9, d8, [sp, #0x30]
 12ae4f0: fd4013ea     	ldr	d10, [sp, #0x20]
 12ae4f4: 910183ff     	add	sp, sp, #0x60
 12ae4f8: d65f03c0     	ret
 12ae4fc: 97f84701     	bl	0x10c0100 <CloseNLSocket+0x638>
