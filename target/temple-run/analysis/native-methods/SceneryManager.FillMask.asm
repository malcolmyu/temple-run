
/tmp/temple-libil2cpp.so:	file format elf64-littleaarch64

Disassembly of section il2cpp:

00000000011a77c4 <__start_il2cpp>:
 12f72cc: f81b0ffe     	str	x30, [sp, #-0x50]!
 12f72d0: a90167fa     	stp	x26, x25, [sp, #0x10]
 12f72d4: a9025ff8     	stp	x24, x23, [sp, #0x20]
 12f72d8: a90357f6     	stp	x22, x21, [sp, #0x30]
 12f72dc: a9044ff4     	stp	x20, x19, [sp, #0x40]
 12f72e0: b000ab35     	adrp	x21, 0x285c000 <_ZTVN10__cxxabiv119__pointer_type_infoE+0x18>
 12f72e4: f94562b5     	ldr	x21, [x21, #0xac0]
 12f72e8: 2a0303f6     	mov	w22, w3
 12f72ec: 2a0203f7     	mov	w23, w2
 12f72f0: aa0103f3     	mov	x19, x1
 12f72f4: aa0003f4     	mov	x20, x0
 12f72f8: d000b9f9     	adrp	x25, 0x2a35000
 12f72fc: 5280003a     	mov	w26, #0x1               // =1
 12f7300: 396ee728     	ldrb	w8, [x25, #0xbb9]
 12f7304: 37000088     	tbnz	w8, #0x0, 0x12f7314 <__start_il2cpp+0x14fb50>
 12f7308: aa1503e0     	mov	x0, x21
 12f730c: 97f722f3     	bl	0x10bfed8 <CloseNLSocket+0x410>
 12f7310: 392ee73a     	strb	w26, [x25, #0xbb9]
 12f7314: b4000bd3     	cbz	x19, 0x12f748c <__start_il2cpp+0x14fcc8>
 12f7318: aa1303e0     	mov	x0, x19
 12f731c: aa1f03e1     	mov	x1, xzr
 12f7320: 9446fb7b     	bl	0x24b610c <__start_il2cpp+0x130e948>
 12f7324: b4000b40     	cbz	x0, 0x12f748c <__start_il2cpp+0x14fcc8>
 12f7328: aa1f03e1     	mov	x1, xzr
 12f732c: 94472cd2     	bl	0x24c2674 <__start_il2cpp+0x131aeb0>
 12f7330: aa1403e0     	mov	x0, x20
 12f7334: 97fffeb7     	bl	0x12f6e10 <__start_il2cpp+0x14f64c>
 12f7338: 710006ff     	cmp	w23, #0x1
 12f733c: 1a9f17e8     	cset	w8, eq
 12f7340: 520002c9     	eor	w9, w22, #0x1
 12f7344: 0a090108     	and	w8, w8, w9
 12f7348: 370002a8     	tbnz	w8, #0x0, 0x12f739c <__start_il2cpp+0x14fbd8>
 12f734c: f94002a0     	ldr	x0, [x21]
 12f7350: f9402a78     	ldr	x24, [x19, #0x50]
 12f7354: b940e008     	ldr	w8, [x0, #0xe0]
 12f7358: 35000048     	cbnz	w8, 0x12f7360 <__start_il2cpp+0x14fb9c>
 12f735c: 97f72321     	bl	0x10bffe0 <CloseNLSocket+0x518>
 12f7360: aa1803e0     	mov	x0, x24
 12f7364: aa1f03e1     	mov	x1, xzr
 12f7368: aa1f03e2     	mov	x2, xzr
 12f736c: 94470537     	bl	0x24b8848 <__start_il2cpp+0x1311084>
 12f7370: 360000c0     	tbz	w0, #0x0, 0x12f7388 <__start_il2cpp+0x14fbc4>
 12f7374: f9402a61     	ldr	x1, [x19, #0x50]
 12f7378: 52800062     	mov	w2, #0x3                // =3
 12f737c: aa1403e0     	mov	x0, x20
 12f7380: 2a1f03e3     	mov	w3, wzr
 12f7384: 97ffffd2     	bl	0x12f72cc <__start_il2cpp+0x14fb08>
 12f7388: 71000aff     	cmp	w23, #0x2
 12f738c: 1a9f17e8     	cset	w8, eq
 12f7390: 520002c9     	eor	w9, w22, #0x1
 12f7394: 0a090108     	and	w8, w8, w9
 12f7398: 370002a8     	tbnz	w8, #0x0, 0x12f73ec <__start_il2cpp+0x14fc28>
 12f739c: f94002a0     	ldr	x0, [x21]
 12f73a0: f9402e78     	ldr	x24, [x19, #0x58]
 12f73a4: b940e008     	ldr	w8, [x0, #0xe0]
 12f73a8: 35000048     	cbnz	w8, 0x12f73b0 <__start_il2cpp+0x14fbec>
 12f73ac: 97f7230d     	bl	0x10bffe0 <CloseNLSocket+0x518>
 12f73b0: aa1803e0     	mov	x0, x24
 12f73b4: aa1f03e1     	mov	x1, xzr
 12f73b8: aa1f03e2     	mov	x2, xzr
 12f73bc: 94470523     	bl	0x24b8848 <__start_il2cpp+0x1311084>
 12f73c0: 360000c0     	tbz	w0, #0x0, 0x12f73d8 <__start_il2cpp+0x14fc14>
 12f73c4: f9402e61     	ldr	x1, [x19, #0x58]
 12f73c8: 52800082     	mov	w2, #0x4                // =4
 12f73cc: aa1403e0     	mov	x0, x20
 12f73d0: 2a1f03e3     	mov	w3, wzr
 12f73d4: 97ffffbe     	bl	0x12f72cc <__start_il2cpp+0x14fb08>
 12f73d8: 71000eff     	cmp	w23, #0x3
 12f73dc: 1a9f17e8     	cset	w8, eq
 12f73e0: 520002c9     	eor	w9, w22, #0x1
 12f73e4: 0a090108     	and	w8, w8, w9
 12f73e8: 370002a8     	tbnz	w8, #0x0, 0x12f743c <__start_il2cpp+0x14fc78>
 12f73ec: f94002a0     	ldr	x0, [x21]
 12f73f0: f9403678     	ldr	x24, [x19, #0x68]
 12f73f4: b940e008     	ldr	w8, [x0, #0xe0]
 12f73f8: 35000048     	cbnz	w8, 0x12f7400 <__start_il2cpp+0x14fc3c>
 12f73fc: 97f722f9     	bl	0x10bffe0 <CloseNLSocket+0x518>
 12f7400: aa1803e0     	mov	x0, x24
 12f7404: aa1f03e1     	mov	x1, xzr
 12f7408: aa1f03e2     	mov	x2, xzr
 12f740c: 9447050f     	bl	0x24b8848 <__start_il2cpp+0x1311084>
 12f7410: 360000c0     	tbz	w0, #0x0, 0x12f7428 <__start_il2cpp+0x14fc64>
 12f7414: f9403661     	ldr	x1, [x19, #0x68]
 12f7418: 52800022     	mov	w2, #0x1                // =1
 12f741c: aa1403e0     	mov	x0, x20
 12f7420: 2a1f03e3     	mov	w3, wzr
 12f7424: 97ffffaa     	bl	0x12f72cc <__start_il2cpp+0x14fb08>
 12f7428: 710012ff     	cmp	w23, #0x4
 12f742c: 1a9f17e8     	cset	w8, eq
 12f7430: 520002c9     	eor	w9, w22, #0x1
 12f7434: 0a090108     	and	w8, w8, w9
 12f7438: 370001e8     	tbnz	w8, #0x0, 0x12f7474 <__start_il2cpp+0x14fcb0>
 12f743c: f94002a0     	ldr	x0, [x21]
 12f7440: f9403276     	ldr	x22, [x19, #0x60]
 12f7444: b940e008     	ldr	w8, [x0, #0xe0]
 12f7448: 35000048     	cbnz	w8, 0x12f7450 <__start_il2cpp+0x14fc8c>
 12f744c: 97f722e5     	bl	0x10bffe0 <CloseNLSocket+0x518>
 12f7450: aa1603e0     	mov	x0, x22
 12f7454: aa1f03e1     	mov	x1, xzr
 12f7458: aa1f03e2     	mov	x2, xzr
 12f745c: 944704fb     	bl	0x24b8848 <__start_il2cpp+0x1311084>
 12f7460: 360000a0     	tbz	w0, #0x0, 0x12f7474 <__start_il2cpp+0x14fcb0>
 12f7464: f9403273     	ldr	x19, [x19, #0x60]
 12f7468: 2a1f03f6     	mov	w22, wzr
 12f746c: 52800057     	mov	w23, #0x2               // =2
 12f7470: 17ffffa4     	b	0x12f7300 <__start_il2cpp+0x14fb3c>
 12f7474: a9444ff4     	ldp	x20, x19, [sp, #0x40]
 12f7478: a94357f6     	ldp	x22, x21, [sp, #0x30]
 12f747c: a9425ff8     	ldp	x24, x23, [sp, #0x20]
 12f7480: a94167fa     	ldp	x26, x25, [sp, #0x10]
 12f7484: f84507fe     	ldr	x30, [sp], #0x50
 12f7488: d65f03c0     	ret
 12f748c: 97f7231d     	bl	0x10c0100 <CloseNLSocket+0x638>
