
/tmp/temple-libil2cpp.so:	file format elf64-littleaarch64

Disassembly of section il2cpp:

00000000011a77c4 <__start_il2cpp>:
 12955bc: fc1d0fe8     	str	d8, [sp, #-0x30]!
 12955c0: a90157fe     	stp	x30, x21, [sp, #0x10]
 12955c4: a9024ff4     	stp	x20, x19, [sp, #0x20]
 12955c8: 9000bd14     	adrp	x20, 0x2a35000
 12955cc: 39621288     	ldrb	w8, [x20, #0x884]
 12955d0: 4ea01c08     	mov	v8.16b, v0.16b
 12955d4: 2a0103f5     	mov	w21, w1
 12955d8: aa0003f3     	mov	x19, x0
 12955dc: 370001e8     	tbnz	w8, #0x0, 0x1295618 <__start_il2cpp+0xede54>
 12955e0: d000ae60     	adrp	x0, 0x2863000
 12955e4: f9463400     	ldr	x0, [x0, #0xc68]
 12955e8: 97f8aa3c     	bl	0x10bfed8 <CloseNLSocket+0x410>
 12955ec: d000ae60     	adrp	x0, 0x2863000
 12955f0: f9463800     	ldr	x0, [x0, #0xc70]
 12955f4: 97f8aa39     	bl	0x10bfed8 <CloseNLSocket+0x410>
 12955f8: d000ae60     	adrp	x0, 0x2863000
 12955fc: f9463c00     	ldr	x0, [x0, #0xc78]
 1295600: 97f8aa36     	bl	0x10bfed8 <CloseNLSocket+0x410>
 1295604: f000ae20     	adrp	x0, 0x285c000 <_ZTVN10__cxxabiv119__pointer_type_infoE+0x18>
 1295608: f9456000     	ldr	x0, [x0, #0xac0]
 129560c: 97f8aa33     	bl	0x10bfed8 <CloseNLSocket+0x410>
 1295610: 52800028     	mov	w8, #0x1                // =1
 1295614: 39221288     	strb	w8, [x20, #0x884]
 1295618: f9403a68     	ldr	x8, [x19, #0x70]
 129561c: b4000ce8     	cbz	x8, 0x12957b8 <__start_il2cpp+0xedff4>
 1295620: b9418908     	ldr	w8, [x8, #0x188]
 1295624: 7100351f     	cmp	w8, #0xd
 1295628: 54000308     	b.hi	0x1295688 <__start_il2cpp+0xedec4>
 129562c: 52800029     	mov	w9, #0x1                // =1
 1295630: 1ac82128     	lsl	w8, w9, w8
 1295634: 52849149     	mov	w9, #0x248a             // =9354
 1295638: 6a09011f     	tst	w8, w9
 129563c: 54000260     	b.eq	0x1295688 <__start_il2cpp+0xedec4>
 1295640: 710042bf     	cmp	w21, #0x10
 1295644: 52800228     	mov	w8, #0x11               // =17
 1295648: 1a950108     	csel	w8, w8, w21, eq
 129564c: 528001a9     	mov	w9, #0xd                // =13
 1295650: 7100311f     	cmp	w8, #0xc
 1295654: 1a880128     	csel	w8, w9, w8, eq
 1295658: 528001e9     	mov	w9, #0xf                // =15
 129565c: 7100391f     	cmp	w8, #0xe
 1295660: 1a880128     	csel	w8, w9, w8, eq
 1295664: 528003c9     	mov	w9, #0x1e               // =30
 1295668: 7100751f     	cmp	w8, #0x1d
 129566c: 1a880128     	csel	w8, w9, w8, eq
 1295670: 52800309     	mov	w9, #0x18               // =24
 1295674: 71005d1f     	cmp	w8, #0x17
 1295678: 1a880128     	csel	w8, w9, w8, eq
 129567c: 7100811f     	cmp	w8, #0x20
 1295680: 52800429     	mov	w9, #0x21               // =33
 1295684: 1a880135     	csel	w21, w9, w8, eq
 1295688: f9406260     	ldr	x0, [x19, #0xc0]
 129568c: b4000960     	cbz	x0, 0x12957b8 <__start_il2cpp+0xedff4>
 1295690: d000ae68     	adrp	x8, 0x2863000
 1295694: f9463508     	ldr	x8, [x8, #0xc68]
 1295698: f000ae34     	adrp	x20, 0x285c000 <_ZTVN10__cxxabiv119__pointer_type_infoE+0x18>
 129569c: 2a1503e1     	mov	w1, w21
 12956a0: f9400102     	ldr	x2, [x8]
 12956a4: f9456294     	ldr	x20, [x20, #0xac0]
 12956a8: 940e9107     	bl	0x1639ac4 <__start_il2cpp+0x492300>
 12956ac: f9400288     	ldr	x8, [x20]
 12956b0: aa0003f4     	mov	x20, x0
 12956b4: b940e109     	ldr	w9, [x8, #0xe0]
 12956b8: 35000069     	cbnz	w9, 0x12956c4 <__start_il2cpp+0xedf00>
 12956bc: aa0803e0     	mov	x0, x8
 12956c0: 97f8aa48     	bl	0x10bffe0 <CloseNLSocket+0x518>
 12956c4: aa1403e0     	mov	x0, x20
 12956c8: aa1f03e1     	mov	x1, xzr
 12956cc: 94489a33     	bl	0x24bbf98 <__start_il2cpp+0x13147d4>
 12956d0: 36000280     	tbz	w0, #0x0, 0x1295720 <__start_il2cpp+0xedf5c>
 12956d4: 51005ea8     	sub	w8, w21, #0x17
 12956d8: 7100051f     	cmp	w8, #0x1
 12956dc: 54000128     	b.hi	0x1295700 <__start_il2cpp+0xedf3c>
 12956e0: bd40a260     	ldr	s0, [x19, #0xa0]
 12956e4: 1e202008     	fcmp	s0, #0.0
 12956e8: 540001cc     	b.gt	0x1295720 <__start_il2cpp+0xedf5c>
 12956ec: b4000674     	cbz	x20, 0x12957b8 <__start_il2cpp+0xedff4>
 12956f0: aa1403e0     	mov	x0, x20
 12956f4: aa1f03e1     	mov	x1, xzr
 12956f8: 9447e85d     	bl	0x248f86c <__start_il2cpp+0x12e80a8>
 12956fc: bd00a260     	str	s0, [x19, #0xa0]
 1295700: f9405660     	ldr	x0, [x19, #0xa8]
 1295704: b40005a0     	cbz	x0, 0x12957b8 <__start_il2cpp+0xedff4>
 1295708: d000ae68     	adrp	x8, 0x2863000
 129570c: f9463d08     	ldr	x8, [x8, #0xc78]
 1295710: aa1403e1     	mov	x1, x20
 1295714: f9400102     	ldr	x2, [x8]
 1295718: 94199421     	bl	0x18fa79c <__start_il2cpp+0x752fd8>
 129571c: 360000a0     	tbz	w0, #0x0, 0x1295730 <__start_il2cpp+0xedf6c>
 1295720: a9424ff4     	ldp	x20, x19, [sp, #0x20]
 1295724: a94157fe     	ldp	x30, x21, [sp, #0x10]
 1295728: fc4307e8     	ldr	d8, [sp], #0x30
 129572c: d65f03c0     	ret
 1295730: f9405660     	ldr	x0, [x19, #0xa8]
 1295734: b4000420     	cbz	x0, 0x12957b8 <__start_il2cpp+0xedff4>
 1295738: d000ae69     	adrp	x9, 0x2863000
 129573c: f9463929     	ldr	x9, [x9, #0xc70]
 1295740: b9401c0a     	ldr	w10, [x0, #0x1c]
 1295744: f9400808     	ldr	x8, [x0, #0x10]
 1295748: f9400129     	ldr	x9, [x9]
 129574c: 1100054a     	add	w10, w10, #0x1
 1295750: b9001c0a     	str	w10, [x0, #0x1c]
 1295754: b4000328     	cbz	x8, 0x12957b8 <__start_il2cpp+0xedff4>
 1295758: b980180a     	ldrsw	x10, [x0, #0x18]
 129575c: b940190b     	ldr	w11, [x8, #0x18]
 1295760: 6b0b015f     	cmp	w10, w11
 1295764: 540000c2     	b.hs	0x129577c <__start_il2cpp+0xedfb8>
 1295768: 11000549     	add	w9, w10, #0x1
 129576c: 8b0a0d08     	add	x8, x8, x10, lsl #3
 1295770: b9001809     	str	w9, [x0, #0x18]
 1295774: f9001114     	str	x20, [x8, #0x20]
 1295778: 14000006     	b	0x1295790 <__start_il2cpp+0xedfcc>
 129577c: f9401128     	ldr	x8, [x9, #0x20]
 1295780: aa1403e1     	mov	x1, x20
 1295784: f9406108     	ldr	x8, [x8, #0xc0]
 1295788: f9403902     	ldr	x2, [x8, #0x70]
 129578c: 94199322     	bl	0x18fa414 <__start_il2cpp+0x752c50>
 1295790: f9401660     	ldr	x0, [x19, #0x28]
 1295794: b4000120     	cbz	x0, 0x12957b8 <__start_il2cpp+0xedff4>
 1295798: bd40b660     	ldr	s0, [x19, #0xb4]
 129579c: aa1403e1     	mov	x1, x20
 12957a0: a9424ff4     	ldp	x20, x19, [sp, #0x20]
 12957a4: a94157fe     	ldp	x30, x21, [sp, #0x10]
 12957a8: 1e280800     	fmul	s0, s0, s8
 12957ac: aa1f03e2     	mov	x2, xzr
 12957b0: fc4307e8     	ldr	d8, [sp], #0x30
 12957b4: 1447e952     	b	0x248fcfc <__start_il2cpp+0x12e8538>
 12957b8: 97f8aa52     	bl	0x10c0100 <CloseNLSocket+0x638>
