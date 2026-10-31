
/tmp/temple-libil2cpp.so:	file format elf64-littleaarch64

Disassembly of section il2cpp:

00000000011a77c4 <__start_il2cpp>:
 12722e0: f81e0ffe     	str	x30, [sp, #-0x20]!
 12722e4: a9014ff4     	stp	x20, x19, [sp, #0x10]
 12722e8: f000be14     	adrp	x20, 0x2a35000
 12722ec: 395d0288     	ldrb	w8, [x20, #0x740]
 12722f0: aa0003f3     	mov	x19, x0
 12722f4: 370000c8     	tbnz	w8, #0x0, 0x127230c <__start_il2cpp+0xcab48>
 12722f8: d000af40     	adrp	x0, 0x285c000 <_ZTVN10__cxxabiv119__pointer_type_infoE+0x18>
 12722fc: f9456000     	ldr	x0, [x0, #0xac0]
 1272300: 97f936f6     	bl	0x10bfed8 <CloseNLSocket+0x410>
 1272304: 52800028     	mov	w8, #0x1                // =1
 1272308: 391d0288     	strb	w8, [x20, #0x740]
 127230c: 39441a68     	ldrb	w8, [x19, #0x106]
 1272310: 350004a8     	cbnz	w8, 0x12723a4 <__start_il2cpp+0xcabe0>
 1272314: d000af48     	adrp	x8, 0x285c000 <_ZTVN10__cxxabiv119__pointer_type_infoE+0x18>
 1272318: f9456108     	ldr	x8, [x8, #0xac0]
 127231c: f9403274     	ldr	x20, [x19, #0x60]
 1272320: f9400100     	ldr	x0, [x8]
 1272324: b940e008     	ldr	w8, [x0, #0xe0]
 1272328: 35000048     	cbnz	w8, 0x1272330 <__start_il2cpp+0xcab6c>
 127232c: 97f9372d     	bl	0x10bffe0 <CloseNLSocket+0x518>
 1272330: aa1403e0     	mov	x0, x20
 1272334: aa1f03e1     	mov	x1, xzr
 1272338: aa1f03e2     	mov	x2, xzr
 127233c: 94491943     	bl	0x24b8848 <__start_il2cpp+0x1311084>
 1272340: 36000320     	tbz	w0, #0x0, 0x12723a4 <__start_il2cpp+0xcabe0>
 1272344: f9403274     	ldr	x20, [x19, #0x60]
 1272348: aa1f03e0     	mov	x0, xzr
 127234c: 94493441     	bl	0x24bf450 <__start_il2cpp+0x1317c8c>
 1272350: b0ffa128     	adrp	x8, 0x697000
 1272354: bd460901     	ldr	s1, [x8, #0x608]
 1272358: 1e212000     	fcmp	s0, s1
 127235c: 1e2a1000     	fmov	s0, #0.25000000
 1272360: 540000ed     	b.le	0x127237c <__start_il2cpp+0xcabb8>
 1272364: 39441a68     	ldrb	w8, [x19, #0x106]
 1272368: b0ffa129     	adrp	x9, 0x697000
 127236c: bd457920     	ldr	s0, [x9, #0x578]
 1272370: 1e2a1001     	fmov	s1, #0.25000000
 1272374: 7100011f     	cmp	w8, #0x0
 1272378: 1e210c00     	fcsel	s0, s0, s1, eq
 127237c: b40001b4     	cbz	x20, 0x12723b0 <__start_il2cpp+0xcabec>
 1272380: bd003280     	str	s0, [x20, #0x30]
 1272384: f9403260     	ldr	x0, [x19, #0x60]
 1272388: b4000140     	cbz	x0, 0x12723b0 <__start_il2cpp+0xcabec>
 127238c: 39441a62     	ldrb	w2, [x19, #0x106]
 1272390: f9401661     	ldr	x1, [x19, #0x28]
 1272394: a9414ff4     	ldp	x20, x19, [sp, #0x10]
 1272398: aa1f03e3     	mov	x3, xzr
 127239c: f84207fe     	ldr	x30, [sp], #0x20
 12723a0: 14020f70     	b	0x12f6160 <__start_il2cpp+0x14e99c>
 12723a4: a9414ff4     	ldp	x20, x19, [sp, #0x10]
 12723a8: f84207fe     	ldr	x30, [sp], #0x20
 12723ac: d65f03c0     	ret
 12723b0: 97f93754     	bl	0x10c0100 <CloseNLSocket+0x638>
