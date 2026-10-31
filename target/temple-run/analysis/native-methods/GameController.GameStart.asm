
/tmp/temple-libil2cpp.so:	file format elf64-littleaarch64

Disassembly of section il2cpp:

00000000011a77c4 <__start_il2cpp>:
 126b26c: a9be57fe     	stp	x30, x21, [sp, #-0x20]!
 126b270: a9014ff4     	stp	x20, x19, [sp, #0x10]
 126b274: d000be54     	adrp	x20, 0x2a35000
 126b278: 395cda88     	ldrb	w8, [x20, #0x736]
 126b27c: aa0003f3     	mov	x19, x0
 126b280: 37000188     	tbnz	w8, #0x0, 0x126b2b0 <__start_il2cpp+0xc3aec>
 126b284: d000afa0     	adrp	x0, 0x2861000
 126b288: f9461c00     	ldr	x0, [x0, #0xc38]
 126b28c: 97f95313     	bl	0x10bfed8 <CloseNLSocket+0x410>
 126b290: f000afa0     	adrp	x0, 0x2862000
 126b294: f9429c00     	ldr	x0, [x0, #0x538]
 126b298: 97f95310     	bl	0x10bfed8 <CloseNLSocket+0x410>
 126b29c: f000afa0     	adrp	x0, 0x2862000
 126b2a0: f942a000     	ldr	x0, [x0, #0x540]
 126b2a4: 97f9530d     	bl	0x10bfed8 <CloseNLSocket+0x410>
 126b2a8: 52800028     	mov	w8, #0x1                // =1
 126b2ac: 391cda88     	strb	w8, [x20, #0x736]
 126b2b0: 39437668     	ldrb	w8, [x19, #0xdd]
 126b2b4: 350010a8     	cbnz	w8, 0x126b4c8 <__start_il2cpp+0xc3d04>
 126b2b8: aa1303e0     	mov	x0, x19
 126b2bc: 97fffafc     	bl	0x1269eac <__start_il2cpp+0xc26e8>
 126b2c0: f9405260     	ldr	x0, [x19, #0xa0]
 126b2c4: 3906727f     	strb	wzr, [x19, #0x19c]
 126b2c8: b40010c0     	cbz	x0, 0x126b4e0 <__start_il2cpp+0xc3d1c>
 126b2cc: f9400008     	ldr	x8, [x0]
 126b2d0: 52800021     	mov	w1, #0x1                // =1
 126b2d4: 52800034     	mov	w20, #0x1               // =1
 126b2d8: a9588909     	ldp	x9, x2, [x8, #0x188]
 126b2dc: d63f0120     	blr	x9
 126b2e0: 39441268     	ldrb	w8, [x19, #0x104]
 126b2e4: 34000328     	cbz	w8, 0x126b348 <__start_il2cpp+0xc3b84>
 126b2e8: d000afa8     	adrp	x8, 0x2861000
 126b2ec: f9461d08     	ldr	x8, [x8, #0xc38]
 126b2f0: f9400100     	ldr	x0, [x8]
 126b2f4: b940e008     	ldr	w8, [x0, #0xe0]
 126b2f8: 35000048     	cbnz	w8, 0x126b300 <__start_il2cpp+0xc3b3c>
 126b2fc: 97f95339     	bl	0x10bffe0 <CloseNLSocket+0x518>
 126b300: aa1f03e0     	mov	x0, xzr
 126b304: 9400721f     	bl	0x1287b80 <__start_il2cpp+0xe03bc>
 126b308: 370000a0     	tbnz	w0, #0x0, 0x126b31c <__start_il2cpp+0xc3b58>
 126b30c: f9405260     	ldr	x0, [x19, #0xa0]
 126b310: b4000e80     	cbz	x0, 0x126b4e0 <__start_il2cpp+0xc3d1c>
 126b314: aa1f03e1     	mov	x1, xzr
 126b318: 940130ea     	bl	0x12b76c0 <__start_il2cpp+0x10fefc>
 126b31c: 39441268     	ldrb	w8, [x19, #0x104]
 126b320: 52800029     	mov	w9, #0x1                // =1
 126b324: 39037669     	strb	w9, [x19, #0xdd]
 126b328: b900d27f     	str	wzr, [x19, #0xd0]
 126b32c: 34000128     	cbz	w8, 0x126b350 <__start_il2cpp+0xc3b8c>
 126b330: b9411268     	ldr	w8, [x19, #0x110]
 126b334: 350000e8     	cbnz	w8, 0x126b350 <__start_il2cpp+0xc3b8c>
 126b338: 97ffee86     	bl	0x1266d50 <__start_il2cpp+0xbf58c>
 126b33c: b901167f     	str	wzr, [x19, #0x114]
 126b340: b9016a7f     	str	wzr, [x19, #0x168]
 126b344: 14000003     	b	0x126b350 <__start_il2cpp+0xc3b8c>
 126b348: 39037674     	strb	w20, [x19, #0xdd]
 126b34c: b900d27f     	str	wzr, [x19, #0xd0]
 126b350: 39441a68     	ldrb	w8, [x19, #0x106]
 126b354: 34000b28     	cbz	w8, 0x126b4b8 <__start_il2cpp+0xc3cf4>
 126b358: f000afa8     	adrp	x8, 0x2862000
 126b35c: f9429d08     	ldr	x8, [x8, #0x538]
 126b360: f9400108     	ldr	x8, [x8]
 126b364: f9405d08     	ldr	x8, [x8, #0xb8]
 126b368: f9400100     	ldr	x0, [x8]
 126b36c: b4000ba0     	cbz	x0, 0x126b4e0 <__start_il2cpp+0xc3d1c>
 126b370: aa1f03e1     	mov	x1, xzr
 126b374: 94015114     	bl	0x12bf7c4 <__start_il2cpp+0x118000>
 126b378: f9402a60     	ldr	x0, [x19, #0x50]
 126b37c: b4000b20     	cbz	x0, 0x126b4e0 <__start_il2cpp+0xc3d1c>
 126b380: aa1f03e1     	mov	x1, xzr
 126b384: 94011418     	bl	0x12b03e4 <__start_il2cpp+0x108c20>
 126b388: f000afb5     	adrp	x21, 0x2862000
 126b38c: f942a2b5     	ldr	x21, [x21, #0x540]
 126b390: f94002a0     	ldr	x0, [x21]
 126b394: 97f95358     	bl	0x10c00f4 <CloseNLSocket+0x62c>
 126b398: aa1f03e1     	mov	x1, xzr
 126b39c: aa0003f4     	mov	x20, x0
 126b3a0: 9401d52f     	bl	0x12e085c <__start_il2cpp+0x139098>
 126b3a4: b40009f4     	cbz	x20, 0x126b4e0 <__start_il2cpp+0xc3d1c>
 126b3a8: b900129f     	str	wzr, [x20, #0x10]
 126b3ac: f9402a60     	ldr	x0, [x19, #0x50]
 126b3b0: b4000980     	cbz	x0, 0x126b4e0 <__start_il2cpp+0xc3d1c>
 126b3b4: aa1f03e1     	mov	x1, xzr
 126b3b8: 94492b55     	bl	0x24b610c <__start_il2cpp+0x130e948>
 126b3bc: b4000920     	cbz	x0, 0x126b4e0 <__start_il2cpp+0xc3d1c>
 126b3c0: aa1f03e1     	mov	x1, xzr
 126b3c4: 94495cac     	bl	0x24c2674 <__start_il2cpp+0x131aeb0>
 126b3c8: 2d028680     	stp	s0, s1, [x20, #0x14]
 126b3cc: bd001e82     	str	s2, [x20, #0x1c]
 126b3d0: 3900829f     	strb	wzr, [x20, #0x20]
 126b3d4: f9402a60     	ldr	x0, [x19, #0x50]
 126b3d8: b4000840     	cbz	x0, 0x126b4e0 <__start_il2cpp+0xc3d1c>
 126b3dc: aa1403e1     	mov	x1, x20
 126b3e0: aa1f03e2     	mov	x2, xzr
 126b3e4: 9401d4bb     	bl	0x12e06d0 <__start_il2cpp+0x138f0c>
 126b3e8: f94002a0     	ldr	x0, [x21]
 126b3ec: 97f95342     	bl	0x10c00f4 <CloseNLSocket+0x62c>
 126b3f0: aa1f03e1     	mov	x1, xzr
 126b3f4: aa0003f4     	mov	x20, x0
 126b3f8: 9401d519     	bl	0x12e085c <__start_il2cpp+0x139098>
 126b3fc: b4000734     	cbz	x20, 0x126b4e0 <__start_il2cpp+0xc3d1c>
 126b400: 52a7d008     	mov	w8, #0x3e800000         // =1048576000
 126b404: b9001288     	str	w8, [x20, #0x10]
 126b408: f9402a68     	ldr	x8, [x19, #0x50]
 126b40c: b40006a8     	cbz	x8, 0x126b4e0 <__start_il2cpp+0xc3d1c>
 126b410: b940e909     	ldr	w9, [x8, #0xe8]
 126b414: f9407108     	ldr	x8, [x8, #0xe0]
 126b418: 5280002a     	mov	w10, #0x1               // =1
 126b41c: 3900828a     	strb	w10, [x20, #0x20]
 126b420: b9001e89     	str	w9, [x20, #0x1c]
 126b424: f8014288     	stur	x8, [x20, #0x14]
 126b428: f9402a60     	ldr	x0, [x19, #0x50]
 126b42c: b40005a0     	cbz	x0, 0x126b4e0 <__start_il2cpp+0xc3d1c>
 126b430: aa1403e1     	mov	x1, x20
 126b434: aa1f03e2     	mov	x2, xzr
 126b438: 9401d4a6     	bl	0x12e06d0 <__start_il2cpp+0x138f0c>
 126b43c: f94002a0     	ldr	x0, [x21]
 126b440: 97f9532d     	bl	0x10c00f4 <CloseNLSocket+0x62c>
 126b444: aa1f03e1     	mov	x1, xzr
 126b448: aa0003f4     	mov	x20, x0
 126b44c: 9401d504     	bl	0x12e085c <__start_il2cpp+0x139098>
 126b450: b4000494     	cbz	x20, 0x126b4e0 <__start_il2cpp+0xc3d1c>
 126b454: b0ffa168     	adrp	x8, 0x698000
 126b458: 3dc04500     	ldr	q0, [x8, #0x110]
 126b45c: 52800028     	mov	w8, #0x1                // =1
 126b460: 39008288     	strb	w8, [x20, #0x20]
 126b464: 3d800680     	str	q0, [x20, #0x10]
 126b468: f9402a60     	ldr	x0, [x19, #0x50]
 126b46c: b40003a0     	cbz	x0, 0x126b4e0 <__start_il2cpp+0xc3d1c>
 126b470: aa1403e1     	mov	x1, x20
 126b474: aa1f03e2     	mov	x2, xzr
 126b478: 9401d496     	bl	0x12e06d0 <__start_il2cpp+0x138f0c>
 126b47c: f9402a60     	ldr	x0, [x19, #0x50]
 126b480: b4000300     	cbz	x0, 0x126b4e0 <__start_il2cpp+0xc3d1c>
 126b484: aa1f03e1     	mov	x1, xzr
 126b488: 9401d4f7     	bl	0x12e0864 <__start_il2cpp+0x1390a0>
 126b48c: f9412e60     	ldr	x0, [x19, #0x258]
 126b490: b4000280     	cbz	x0, 0x126b4e0 <__start_il2cpp+0xc3d1c>
 126b494: aa1f03e1     	mov	x1, xzr
 126b498: 9400a831     	bl	0x129555c <__start_il2cpp+0xedd98>
 126b49c: f9412e60     	ldr	x0, [x19, #0x258]
 126b4a0: b4000200     	cbz	x0, 0x126b4e0 <__start_il2cpp+0xc3d1c>
 126b4a4: 90ffa168     	adrp	x8, 0x697000
 126b4a8: bd467100     	ldr	s0, [x8, #0x670]
 126b4ac: 52800281     	mov	w1, #0x14               // =20
 126b4b0: aa1f03e2     	mov	x2, xzr
 126b4b4: 9400a842     	bl	0x12955bc <__start_il2cpp+0xeddf8>
 126b4b8: aa1303e0     	mov	x0, x19
 126b4bc: 9400000a     	bl	0x126b4e4 <__start_il2cpp+0xc3d20>
 126b4c0: 39441268     	ldrb	w8, [x19, #0x104]
 126b4c4: 34000088     	cbz	w8, 0x126b4d4 <__start_il2cpp+0xc3d10>
 126b4c8: a9414ff4     	ldp	x20, x19, [sp, #0x10]
 126b4cc: a8c257fe     	ldp	x30, x21, [sp], #0x20
 126b4d0: d65f03c0     	ret
 126b4d4: a9414ff4     	ldp	x20, x19, [sp, #0x10]
 126b4d8: a8c257fe     	ldp	x30, x21, [sp], #0x20
 126b4dc: 17ffea80     	b	0x1265edc <__start_il2cpp+0xbe718>
 126b4e0: 97f95308     	bl	0x10c0100 <CloseNLSocket+0x638>
