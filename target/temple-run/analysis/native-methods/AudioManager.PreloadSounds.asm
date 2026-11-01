
/tmp/temple-libil2cpp.so:	file format elf64-littleaarch64

Disassembly of section il2cpp:

00000000011a77c4 <__start_il2cpp>:
 12952d0: d10203ff     	sub	sp, sp, #0x80
 12952d4: a9027bfd     	stp	x29, x30, [sp, #0x20]
 12952d8: a9036ffc     	stp	x28, x27, [sp, #0x30]
 12952dc: a90467fa     	stp	x26, x25, [sp, #0x40]
 12952e0: a9055ff8     	stp	x24, x23, [sp, #0x50]
 12952e4: a90657f6     	stp	x22, x21, [sp, #0x60]
 12952e8: a9074ff4     	stp	x20, x19, [sp, #0x70]
 12952ec: 9000bd14     	adrp	x20, 0x2a35000
 12952f0: 39620e88     	ldrb	w8, [x20, #0x883]
 12952f4: aa0003f3     	mov	x19, x0
 12952f8: 370002a8     	tbnz	w8, #0x0, 0x129534c <__start_il2cpp+0xedb88>
 12952fc: d000ae60     	adrp	x0, 0x2863000
 1295300: f9462000     	ldr	x0, [x0, #0xc40]
 1295304: 97f8aaf5     	bl	0x10bfed8 <CloseNLSocket+0x410>
 1295308: d000ae60     	adrp	x0, 0x2863000
 129530c: f9462400     	ldr	x0, [x0, #0xc48]
 1295310: 97f8aaf2     	bl	0x10bfed8 <CloseNLSocket+0x410>
 1295314: d000ae60     	adrp	x0, 0x2863000
 1295318: f9462800     	ldr	x0, [x0, #0xc50]
 129531c: 97f8aaef     	bl	0x10bfed8 <CloseNLSocket+0x410>
 1295320: f000ae20     	adrp	x0, 0x285c000 <_ZTVN10__cxxabiv119__pointer_type_infoE+0x18>
 1295324: f9456000     	ldr	x0, [x0, #0xac0]
 1295328: 97f8aaec     	bl	0x10bfed8 <CloseNLSocket+0x410>
 129532c: d000ae60     	adrp	x0, 0x2863000
 1295330: f9462c00     	ldr	x0, [x0, #0xc58]
 1295334: 97f8aae9     	bl	0x10bfed8 <CloseNLSocket+0x410>
 1295338: d000ae60     	adrp	x0, 0x2863000
 129533c: f9463000     	ldr	x0, [x0, #0xc60]
 1295340: 97f8aae6     	bl	0x10bfed8 <CloseNLSocket+0x410>
 1295344: 52800028     	mov	w8, #0x1                // =1
 1295348: 39220e88     	strb	w8, [x20, #0x883]
 129534c: d000ae77     	adrp	x23, 0x2863000
 1295350: d000ae78     	adrp	x24, 0x2863000
 1295354: f000ae39     	adrp	x25, 0x285c000 <_ZTVN10__cxxabiv119__pointer_type_infoE+0x18>
 1295358: d000ae7a     	adrp	x26, 0x2863000
 129535c: d000ae7b     	adrp	x27, 0x2863000
 1295360: d000ae7c     	adrp	x28, 0x2863000
 1295364: f9462af7     	ldr	x23, [x23, #0xc50]
 1295368: f9463318     	ldr	x24, [x24, #0xc60]
 129536c: f9456339     	ldr	x25, [x25, #0xac0]
 1295370: f9462f5a     	ldr	x26, [x26, #0xc58]
 1295374: f946277b     	ldr	x27, [x27, #0xc48]
 1295378: f946239c     	ldr	x28, [x28, #0xc40]
 129537c: 2a1f03f4     	mov	w20, wzr
 1295380: 9280001d     	mov	x29, #-0x1              // =-1
 1295384: f94002e8     	ldr	x8, [x23]
 1295388: 910023e0     	add	x0, sp, #0x8
 129538c: aa1f03e1     	mov	x1, xzr
 1295390: b9001bf4     	str	w20, [sp, #0x18]
 1295394: a900f7e8     	stp	x8, x29, [sp, #0x8]
 1295398: 943112f8     	bl	0x1ed9f78 <__start_il2cpp+0xd327b4>
 129539c: f9400308     	ldr	x8, [x24]
 12953a0: aa0003e1     	mov	x1, x0
 12953a4: aa1f03e2     	mov	x2, xzr
 12953a8: aa0803e0     	mov	x0, x8
 12953ac: 942a96bc     	bl	0x1d3ae9c <__start_il2cpp+0xb936d8>
 12953b0: aa1f03e1     	mov	x1, xzr
 12953b4: aa0003f6     	mov	x22, x0
 12953b8: 94487c57     	bl	0x24b4514 <__start_il2cpp+0x130cd50>
 12953bc: b40000c0     	cbz	x0, 0x12953d4 <__start_il2cpp+0xedc10>
 12953c0: f9400388     	ldr	x8, [x28]
 12953c4: f9400009     	ldr	x9, [x0]
 12953c8: eb08013f     	cmp	x9, x8
 12953cc: 9a9f0015     	csel	x21, x0, xzr, eq
 12953d0: 14000002     	b	0x12953d8 <__start_il2cpp+0xedc14>
 12953d4: aa1f03f5     	mov	x21, xzr
 12953d8: f9400320     	ldr	x0, [x25]
 12953dc: b940e008     	ldr	w8, [x0, #0xe0]
 12953e0: 35000048     	cbnz	w8, 0x12953e8 <__start_il2cpp+0xedc24>
 12953e4: 97f8aaff     	bl	0x10bffe0 <CloseNLSocket+0x518>
 12953e8: aa1503e0     	mov	x0, x21
 12953ec: aa1f03e1     	mov	x1, xzr
 12953f0: aa1f03e2     	mov	x2, xzr
 12953f4: 94489029     	bl	0x24b9498 <__start_il2cpp+0x1311cd4>
 12953f8: 36000120     	tbz	w0, #0x0, 0x129541c <__start_il2cpp+0xedc58>
 12953fc: f9400340     	ldr	x0, [x26]
 1295400: aa1603e1     	mov	x1, x22
 1295404: aa1f03e2     	mov	x2, xzr
 1295408: 942a96a5     	bl	0x1d3ae9c <__start_il2cpp+0xb936d8>
 129540c: aa1f03e1     	mov	x1, xzr
 1295410: 9401886f     	bl	0x12f75cc <__start_il2cpp+0x14fe08>
 1295414: aa1f03e0     	mov	x0, xzr
 1295418: 94018dbe     	bl	0x12f8b10 <__start_il2cpp+0x15134c>
 129541c: f9406260     	ldr	x0, [x19, #0xc0]
 1295420: b4000200     	cbz	x0, 0x1295460 <__start_il2cpp+0xedc9c>
 1295424: f9400363     	ldr	x3, [x27]
 1295428: 2a1403e1     	mov	w1, w20
 129542c: aa1503e2     	mov	x2, x21
 1295430: 940e91cd     	bl	0x1639b64 <__start_il2cpp+0x4923a0>
 1295434: 11000694     	add	w20, w20, #0x1
 1295438: 71008e9f     	cmp	w20, #0x23
 129543c: 54fffa41     	b.ne	0x1295384 <__start_il2cpp+0xedbc0>
 1295440: a9474ff4     	ldp	x20, x19, [sp, #0x70]
 1295444: a94657f6     	ldp	x22, x21, [sp, #0x60]
 1295448: a9455ff8     	ldp	x24, x23, [sp, #0x50]
 129544c: a94467fa     	ldp	x26, x25, [sp, #0x40]
 1295450: a9436ffc     	ldp	x28, x27, [sp, #0x30]
 1295454: a9427bfd     	ldp	x29, x30, [sp, #0x20]
 1295458: 910203ff     	add	sp, sp, #0x80
 129545c: d65f03c0     	ret
 1295460: 97f8ab28     	bl	0x10c0100 <CloseNLSocket+0x638>
