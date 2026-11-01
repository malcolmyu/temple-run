
/tmp/temple-libil2cpp.so:	file format elf64-littleaarch64

Disassembly of section il2cpp:

00000000011a77c4 <__start_il2cpp>:
 1267300: fc1c0fe8     	str	d8, [sp, #-0x40]!
 1267304: f90007fe     	str	x30, [sp, #0x8]
 1267308: a9015ff8     	stp	x24, x23, [sp, #0x10]
 126730c: a90257f6     	stp	x22, x21, [sp, #0x20]
 1267310: a9034ff4     	stp	x20, x19, [sp, #0x30]
 1267314: d000be75     	adrp	x21, 0x2a35000
 1267318: f000afd4     	adrp	x20, 0x2862000
 126731c: f000afd7     	adrp	x23, 0x2862000
 1267320: f000afd8     	adrp	x24, 0x2862000
 1267324: 395c5aa8     	ldrb	w8, [x21, #0x716]
 1267328: f940ea94     	ldr	x20, [x20, #0x1d0]
 126732c: f940eef7     	ldr	x23, [x23, #0x1d8]
 1267330: f9412b18     	ldr	x24, [x24, #0x250]
 1267334: aa0003f3     	mov	x19, x0
 1267338: 37000368     	tbnz	w8, #0x0, 0x12673a4 <__start_il2cpp+0xbfbe0>
 126733c: f000afc0     	adrp	x0, 0x2862000
 1267340: f940e800     	ldr	x0, [x0, #0x1d0]
 1267344: 97f962e5     	bl	0x10bfed8 <CloseNLSocket+0x410>
 1267348: f000afc0     	adrp	x0, 0x2862000
 126734c: f940ec00     	ldr	x0, [x0, #0x1d8]
 1267350: 97f962e2     	bl	0x10bfed8 <CloseNLSocket+0x410>
 1267354: f000afc0     	adrp	x0, 0x2862000
 1267358: f940dc00     	ldr	x0, [x0, #0x1b8]
 126735c: 97f962df     	bl	0x10bfed8 <CloseNLSocket+0x410>
 1267360: f000afc0     	adrp	x0, 0x2862000
 1267364: f9410800     	ldr	x0, [x0, #0x210]
 1267368: 97f962dc     	bl	0x10bfed8 <CloseNLSocket+0x410>
 126736c: f000afc0     	adrp	x0, 0x2862000
 1267370: f9417000     	ldr	x0, [x0, #0x2e0]
 1267374: 97f962d9     	bl	0x10bfed8 <CloseNLSocket+0x410>
 1267378: f000afc0     	adrp	x0, 0x2862000
 126737c: f9417800     	ldr	x0, [x0, #0x2f0]
 1267380: 97f962d6     	bl	0x10bfed8 <CloseNLSocket+0x410>
 1267384: f000afc0     	adrp	x0, 0x2862000
 1267388: f9412800     	ldr	x0, [x0, #0x250]
 126738c: 97f962d3     	bl	0x10bfed8 <CloseNLSocket+0x410>
 1267390: f000afc0     	adrp	x0, 0x2862000
 1267394: f9416c00     	ldr	x0, [x0, #0x2d8]
 1267398: 97f962d0     	bl	0x10bfed8 <CloseNLSocket+0x410>
 126739c: 52800028     	mov	w8, #0x1                // =1
 12673a0: 391c5aa8     	strb	w8, [x21, #0x716]
 12673a4: b9404a60     	ldr	w0, [x19, #0x48]
 12673a8: aa1f03e1     	mov	x1, xzr
 12673ac: 9400afa9     	bl	0x1293250 <__start_il2cpp+0xeba8c>
 12673b0: f9400288     	ldr	x8, [x20]
 12673b4: aa0003f5     	mov	x21, x0
 12673b8: 52800081     	mov	w1, #0x4                // =4
 12673bc: aa0803e0     	mov	x0, x8
 12673c0: 97f962e4     	bl	0x10bff50 <CloseNLSocket+0x488>
 12673c4: f94002e8     	ldr	x8, [x23]
 12673c8: bd411668     	ldr	s8, [x19, #0x114]
 12673cc: aa0003f4     	mov	x20, x0
 12673d0: aa0803e0     	mov	x0, x8
 12673d4: 97f96348     	bl	0x10c00f4 <CloseNLSocket+0x62c>
 12673d8: f9400301     	ldr	x1, [x24]
 12673dc: 52aff009     	mov	w9, #0x7f800000         // =2139095040
 12673e0: 1e380108     	fcvtzs	w8, s8
 12673e4: 1e270120     	fmov	s0, w9
 12673e8: 93407d08     	sxtw	x8, w8
 12673ec: 1e202100     	fcmp	s8, s0
 12673f0: b26183e9     	mov	x9, #-0x80000000        // =-2147483648
 12673f4: 9a880122     	csel	x2, x9, x8, eq
 12673f8: aa1f03e3     	mov	x3, xzr
 12673fc: aa0003f6     	mov	x22, x0
 1267400: 97ff9366     	bl	0x124c198 <__start_il2cpp+0xa49d4>
 1267404: b4000b54     	cbz	x20, 0x126756c <__start_il2cpp+0xbfda8>
 1267408: b40000d6     	cbz	x22, 0x1267420 <__start_il2cpp+0xbfc5c>
 126740c: f9400288     	ldr	x8, [x20]
 1267410: aa1603e0     	mov	x0, x22
 1267414: f9402101     	ldr	x1, [x8, #0x40]
 1267418: 97f962f3     	bl	0x10bffe4 <CloseNLSocket+0x51c>
 126741c: b4000a20     	cbz	x0, 0x1267560 <__start_il2cpp+0xbfd9c>
 1267420: b9401a88     	ldr	w8, [x20, #0x18]
 1267424: 340009c8     	cbz	w8, 0x126755c <__start_il2cpp+0xbfd98>
 1267428: f9001296     	str	x22, [x20, #0x20]
 126742c: f94002e0     	ldr	x0, [x23]
 1267430: f000afd6     	adrp	x22, 0x2862000
 1267434: f94172d6     	ldr	x22, [x22, #0x2e0]
 1267438: 97f9632f     	bl	0x10c00f4 <CloseNLSocket+0x62c>
 126743c: f94002c1     	ldr	x1, [x22]
 1267440: aa1503e2     	mov	x2, x21
 1267444: aa1f03e3     	mov	x3, xzr
 1267448: aa0003f6     	mov	x22, x0
 126744c: 97ff9308     	bl	0x124c06c <__start_il2cpp+0xa48a8>
 1267450: b40000d6     	cbz	x22, 0x1267468 <__start_il2cpp+0xbfca4>
 1267454: f9400288     	ldr	x8, [x20]
 1267458: aa1603e0     	mov	x0, x22
 126745c: f9402101     	ldr	x1, [x8, #0x40]
 1267460: 97f962e1     	bl	0x10bffe4 <CloseNLSocket+0x51c>
 1267464: b40007e0     	cbz	x0, 0x1267560 <__start_il2cpp+0xbfd9c>
 1267468: b9401a88     	ldr	w8, [x20, #0x18]
 126746c: 7100051f     	cmp	w8, #0x1
 1267470: 54000769     	b.ls	0x126755c <__start_il2cpp+0xbfd98>
 1267474: f9001696     	str	x22, [x20, #0x28]
 1267478: f94002e0     	ldr	x0, [x23]
 126747c: f000afd5     	adrp	x21, 0x2862000
 1267480: b9811276     	ldrsw	x22, [x19, #0x110]
 1267484: f9416eb5     	ldr	x21, [x21, #0x2d8]
 1267488: 97f9631b     	bl	0x10c00f4 <CloseNLSocket+0x62c>
 126748c: f94002a1     	ldr	x1, [x21]
 1267490: aa1603e2     	mov	x2, x22
 1267494: aa1f03e3     	mov	x3, xzr
 1267498: aa0003f5     	mov	x21, x0
 126749c: 97ff933f     	bl	0x124c198 <__start_il2cpp+0xa49d4>
 12674a0: b40000d5     	cbz	x21, 0x12674b8 <__start_il2cpp+0xbfcf4>
 12674a4: f9400288     	ldr	x8, [x20]
 12674a8: aa1503e0     	mov	x0, x21
 12674ac: f9402101     	ldr	x1, [x8, #0x40]
 12674b0: 97f962cd     	bl	0x10bffe4 <CloseNLSocket+0x51c>
 12674b4: b4000560     	cbz	x0, 0x1267560 <__start_il2cpp+0xbfd9c>
 12674b8: b9401a88     	ldr	w8, [x20, #0x18]
 12674bc: 7100091f     	cmp	w8, #0x2
 12674c0: 540004e9     	b.ls	0x126755c <__start_il2cpp+0xbfd98>
 12674c4: f9001a95     	str	x21, [x20, #0x30]
 12674c8: b9816a75     	ldrsw	x21, [x19, #0x168]
 12674cc: f94002e0     	ldr	x0, [x23]
 12674d0: f000afd3     	adrp	x19, 0x2862000
 12674d4: f9410a73     	ldr	x19, [x19, #0x210]
 12674d8: 97f96307     	bl	0x10c00f4 <CloseNLSocket+0x62c>
 12674dc: f9400261     	ldr	x1, [x19]
 12674e0: aa1503e2     	mov	x2, x21
 12674e4: aa1f03e3     	mov	x3, xzr
 12674e8: aa0003f3     	mov	x19, x0
 12674ec: 97ff932b     	bl	0x124c198 <__start_il2cpp+0xa49d4>
 12674f0: b40000d3     	cbz	x19, 0x1267508 <__start_il2cpp+0xbfd44>
 12674f4: f9400288     	ldr	x8, [x20]
 12674f8: aa1303e0     	mov	x0, x19
 12674fc: f9402101     	ldr	x1, [x8, #0x40]
 1267500: 97f962b9     	bl	0x10bffe4 <CloseNLSocket+0x51c>
 1267504: b40002e0     	cbz	x0, 0x1267560 <__start_il2cpp+0xbfd9c>
 1267508: b9401a88     	ldr	w8, [x20, #0x18]
 126750c: 71000d1f     	cmp	w8, #0x3
 1267510: 54000269     	b.ls	0x126755c <__start_il2cpp+0xbfd98>
 1267514: f000afc8     	adrp	x8, 0x2862000
 1267518: f940dd08     	ldr	x8, [x8, #0x1b8]
 126751c: f9001e93     	str	x19, [x20, #0x38]
 1267520: f000afd3     	adrp	x19, 0x2862000
 1267524: f9400100     	ldr	x0, [x8]
 1267528: b940e008     	ldr	w8, [x0, #0xe0]
 126752c: f9417a73     	ldr	x19, [x19, #0x2f0]
 1267530: 35000048     	cbnz	w8, 0x1267538 <__start_il2cpp+0xbfd74>
 1267534: 97f962ab     	bl	0x10bffe0 <CloseNLSocket+0x518>
 1267538: f9400260     	ldr	x0, [x19]
 126753c: aa1403e1     	mov	x1, x20
 1267540: a9434ff4     	ldp	x20, x19, [sp, #0x30]
 1267544: a94257f6     	ldp	x22, x21, [sp, #0x20]
 1267548: a9415ff8     	ldp	x24, x23, [sp, #0x10]
 126754c: f94007fe     	ldr	x30, [sp, #0x8]
 1267550: aa1f03e2     	mov	x2, xzr
 1267554: fc4407e8     	ldr	d8, [sp], #0x40
 1267558: 1400a811     	b	0x129159c <__start_il2cpp+0xe9dd8>
 126755c: 97f962eb     	bl	0x10c0108 <CloseNLSocket+0x640>
 1267560: 97f962f1     	bl	0x10c0124 <CloseNLSocket+0x65c>
 1267564: aa1f03e1     	mov	x1, xzr
 1267568: 97f9629a     	bl	0x10bffd0 <CloseNLSocket+0x508>
 126756c: 97f962e5     	bl	0x10c0100 <CloseNLSocket+0x638>
