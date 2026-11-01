
/tmp/temple-libil2cpp.so:	file format elf64-littleaarch64

Disassembly of section il2cpp:

00000000011a77c4 <__start_il2cpp>:
 126e280: 6dbc2beb     	stp	d11, d10, [sp, #-0x40]!
 126e284: 6d0123e9     	stp	d9, d8, [sp, #0x10]
 126e288: a90257fe     	stp	x30, x21, [sp, #0x20]
 126e28c: a9034ff4     	stp	x20, x19, [sp, #0x30]
 126e290: f000be35     	adrp	x21, 0x2a35000
 126e294: d000af74     	adrp	x20, 0x285c000 <_ZTVN10__cxxabiv119__pointer_type_infoE+0x18>
 126e298: 395d3aa8     	ldrb	w8, [x21, #0x74e]
 126e29c: f9456294     	ldr	x20, [x20, #0xac0]
 126e2a0: aa0003f3     	mov	x19, x0
 126e2a4: 37000248     	tbnz	w8, #0x0, 0x126e2ec <__start_il2cpp+0xc6b28>
 126e2a8: 9000afa0     	adrp	x0, 0x2862000
 126e2ac: f942b000     	ldr	x0, [x0, #0x560]
 126e2b0: 97f9470a     	bl	0x10bfed8 <CloseNLSocket+0x410>
 126e2b4: 9000afa0     	adrp	x0, 0x2862000
 126e2b8: f942b400     	ldr	x0, [x0, #0x568]
 126e2bc: 97f94707     	bl	0x10bfed8 <CloseNLSocket+0x410>
 126e2c0: d000af60     	adrp	x0, 0x285c000 <_ZTVN10__cxxabiv119__pointer_type_infoE+0x18>
 126e2c4: f9456000     	ldr	x0, [x0, #0xac0]
 126e2c8: 97f94704     	bl	0x10bfed8 <CloseNLSocket+0x410>
 126e2cc: 9000afa0     	adrp	x0, 0x2862000
 126e2d0: f9432800     	ldr	x0, [x0, #0x650]
 126e2d4: 97f94701     	bl	0x10bfed8 <CloseNLSocket+0x410>
 126e2d8: 9000afa0     	adrp	x0, 0x2862000
 126e2dc: f9425800     	ldr	x0, [x0, #0x4b0]
 126e2e0: 97f946fe     	bl	0x10bfed8 <CloseNLSocket+0x410>
 126e2e4: 52800028     	mov	w8, #0x1                // =1
 126e2e8: 391d3aa8     	strb	w8, [x21, #0x74e]
 126e2ec: f9400280     	ldr	x0, [x20]
 126e2f0: f9403a74     	ldr	x20, [x19, #0x70]
 126e2f4: b940e008     	ldr	w8, [x0, #0xe0]
 126e2f8: 35000048     	cbnz	w8, 0x126e300 <__start_il2cpp+0xc6b3c>
 126e2fc: 97f94739     	bl	0x10bffe0 <CloseNLSocket+0x518>
 126e300: aa1403e0     	mov	x0, x20
 126e304: aa1f03e1     	mov	x1, xzr
 126e308: aa1f03e2     	mov	x2, xzr
 126e30c: 94492c63     	bl	0x24b9498 <__start_il2cpp+0x1311cd4>
 126e310: 370000a0     	tbnz	w0, #0x0, 0x126e324 <__start_il2cpp+0xc6b60>
 126e314: f9403a68     	ldr	x8, [x19, #0x70]
 126e318: b4002248     	cbz	x8, 0x126e760 <__start_il2cpp+0xc6f9c>
 126e31c: 3943c108     	ldrb	w8, [x8, #0xf0]
 126e320: 35000ca8     	cbnz	w8, 0x126e4b4 <__start_il2cpp+0xc6cf0>
 126e324: f9403660     	ldr	x0, [x19, #0x68]
 126e328: b40021c0     	cbz	x0, 0x126e760 <__start_il2cpp+0xc6f9c>
 126e32c: aa1f03e1     	mov	x1, xzr
 126e330: 94491f77     	bl	0x24b610c <__start_il2cpp+0x130e948>
 126e334: b4002160     	cbz	x0, 0x126e760 <__start_il2cpp+0xc6f9c>
 126e338: aa1f03e1     	mov	x1, xzr
 126e33c: 944950ce     	bl	0x24c2674 <__start_il2cpp+0x131aeb0>
 126e340: f9403660     	ldr	x0, [x19, #0x68]
 126e344: b40020e0     	cbz	x0, 0x126e760 <__start_il2cpp+0xc6f9c>
 126e348: aa1f03e1     	mov	x1, xzr
 126e34c: 4ea01c08     	mov	v8.16b, v0.16b
 126e350: 94491f6f     	bl	0x24b610c <__start_il2cpp+0x130e948>
 126e354: b4002060     	cbz	x0, 0x126e760 <__start_il2cpp+0xc6f9c>
 126e358: aa1f03e1     	mov	x1, xzr
 126e35c: 944950c6     	bl	0x24c2674 <__start_il2cpp+0x131aeb0>
 126e360: f9403668     	ldr	x8, [x19, #0x68]
 126e364: b4001fe8     	cbz	x8, 0x126e760 <__start_il2cpp+0xc6f9c>
 126e368: f000be34     	adrp	x20, 0x2a35000
 126e36c: bd407d0a     	ldr	s10, [x8, #0x7c]
 126e370: 395df689     	ldrb	w9, [x20, #0x77d]
 126e374: bd40850b     	ldr	s11, [x8, #0x84]
 126e378: 4ea21c49     	mov	v9.16b, v2.16b
 126e37c: 350000c9     	cbnz	w9, 0x126e394 <__start_il2cpp+0xc6bd0>
 126e380: 9000af80     	adrp	x0, 0x285e000
 126e384: f9417800     	ldr	x0, [x0, #0x2f0]
 126e388: 97f946d4     	bl	0x10bfed8 <CloseNLSocket+0x410>
 126e38c: 52800028     	mov	w8, #0x1                // =1
 126e390: 391df688     	strb	w8, [x20, #0x77d]
 126e394: 9000af88     	adrp	x8, 0x285e000
 126e398: f9417908     	ldr	x8, [x8, #0x2f0]
 126e39c: 1e2a390a     	fsub	s10, s8, s10
 126e3a0: 1e2b3928     	fsub	s8, s9, s11
 126e3a4: f9400100     	ldr	x0, [x8]
 126e3a8: b940e008     	ldr	w8, [x0, #0xe0]
 126e3ac: 35000048     	cbnz	w8, 0x126e3b4 <__start_il2cpp+0xc6bf0>
 126e3b0: 97f9470c     	bl	0x10bffe0 <CloseNLSocket+0x518>
 126e3b4: 1e2a0940     	fmul	s0, s10, s10
 126e3b8: 1e280901     	fmul	s1, s8, s8
 126e3bc: 1e212800     	fadd	s0, s0, s1
 126e3c0: aa1f03e0     	mov	x0, xzr
 126e3c4: 1e21c008     	fsqrt	s8, s0
 126e3c8: 94494422     	bl	0x24bf450 <__start_il2cpp+0x1317c8c>
 126e3cc: b0ffa148     	adrp	x8, 0x697000
 126e3d0: bd46b109     	ldr	s9, [x8, #0x6b0]
 126e3d4: 1e201900     	fdiv	s0, s8, s0
 126e3d8: aa1f03e0     	mov	x0, xzr
 126e3dc: 1e290808     	fmul	s8, s0, s9
 126e3e0: 9449441c     	bl	0x24bf450 <__start_il2cpp+0x1317c8c>
 126e3e4: bd412662     	ldr	s2, [x19, #0x124]
 126e3e8: 1e280901     	fmul	s1, s8, s8
 126e3ec: 1e291800     	fdiv	s0, s0, s9
 126e3f0: 1e210800     	fmul	s0, s0, s1
 126e3f4: 1e269001     	fmov	s1, #20.00000000
 126e3f8: 1e211808     	fdiv	s8, s0, s1
 126e3fc: bd413260     	ldr	s0, [x19, #0x130]
 126e400: 1e282841     	fadd	s1, s2, s8
 126e404: bd012661     	str	s1, [x19, #0x124]
 126e408: bd412261     	ldr	s1, [x19, #0x120]
 126e40c: 52aff008     	mov	w8, #0x7f800000         // =2139095040
 126e410: 1e282800     	fadd	s0, s0, s8
 126e414: bd013260     	str	s0, [x19, #0x130]
 126e418: 1e270100     	fmov	s0, w8
 126e41c: 1e212901     	fadd	s1, s8, s1
 126e420: 1e202020     	fcmp	s1, s0
 126e424: bd413e60     	ldr	s0, [x19, #0x13c]
 126e428: 52b00008     	mov	w8, #-0x80000000        // =-2147483648
 126e42c: 1e380029     	fcvtzs	w9, s1
 126e430: f9403a60     	ldr	x0, [x19, #0x70]
 126e434: 1a890101     	csel	w1, w8, w9, eq
 126e438: 1e202900     	fadd	s0, s8, s0
 126e43c: bd013e60     	str	s0, [x19, #0x13c]
 126e440: 1e220020     	scvtf	s0, w1
 126e444: 1e203820     	fsub	s0, s1, s0
 126e448: bd012260     	str	s0, [x19, #0x120]
 126e44c: b40018a0     	cbz	x0, 0x126e760 <__start_il2cpp+0xc6f9c>
 126e450: aa1f03e2     	mov	x2, xzr
 126e454: 9400a98e     	bl	0x1298a8c <__start_il2cpp+0xf12c8>
 126e458: f9403a68     	ldr	x8, [x19, #0x70]
 126e45c: b4001828     	cbz	x8, 0x126e760 <__start_il2cpp+0xc6f9c>
 126e460: 3945d109     	ldrb	w9, [x8, #0x174]
 126e464: 34000089     	cbz	w9, 0x126e474 <__start_il2cpp+0xc6cb0>
 126e468: bd417900     	ldr	s0, [x8, #0x178]
 126e46c: 1e283800     	fsub	s0, s0, s8
 126e470: bd017900     	str	s0, [x8, #0x178]
 126e474: bd40fa60     	ldr	s0, [x19, #0xf8]
 126e478: 1e202008     	fcmp	s0, #0.0
 126e47c: 540000c1     	b.ne	0x126e494 <__start_il2cpp+0xc6cd0>
 126e480: b9414908     	ldr	w8, [x8, #0x148]
 126e484: 7100051f     	cmp	w8, #0x1
 126e488: 5400006b     	b.lt	0x126e494 <__start_il2cpp+0xc6cd0>
 126e48c: bd412660     	ldr	s0, [x19, #0x124]
 126e490: bd00fa60     	str	s0, [x19, #0xf8]
 126e494: 39441668     	ldrb	w8, [x19, #0x105]
 126e498: 35000068     	cbnz	w8, 0x126e4a4 <__start_il2cpp+0xc6ce0>
 126e49c: 39441268     	ldrb	w8, [x19, #0x104]
 126e4a0: 34000068     	cbz	w8, 0x126e4ac <__start_il2cpp+0xc6ce8>
 126e4a4: aa1303e0     	mov	x0, x19
 126e4a8: 940010d4     	bl	0x12727f8 <__start_il2cpp+0xcb034>
 126e4ac: 39441a68     	ldrb	w8, [x19, #0x106]
 126e4b0: 340000c8     	cbz	w8, 0x126e4c8 <__start_il2cpp+0xc6d04>
 126e4b4: a9434ff4     	ldp	x20, x19, [sp, #0x30]
 126e4b8: a94257fe     	ldp	x30, x21, [sp, #0x20]
 126e4bc: 6d4123e9     	ldp	d9, d8, [sp, #0x10]
 126e4c0: 6cc42beb     	ldp	d11, d10, [sp], #0x40
 126e4c4: d65f03c0     	ret
 126e4c8: 39441268     	ldrb	w8, [x19, #0x104]
 126e4cc: 34ffff48     	cbz	w8, 0x126e4b4 <__start_il2cpp+0xc6cf0>
 126e4d0: bd410e68     	ldr	s8, [x19, #0x10c]
 126e4d4: aa1f03e0     	mov	x0, xzr
 126e4d8: 944943de     	bl	0x24bf450 <__start_il2cpp+0x1317c8c>
 126e4dc: 1e202900     	fadd	s0, s8, s0
 126e4e0: 1e2e1001     	fmov	s1, #1.00000000
 126e4e4: 1e212000     	fcmp	s0, s1
 126e4e8: bd010e60     	str	s0, [x19, #0x10c]
 126e4ec: 540007cd     	b.le	0x126e5e4 <__start_il2cpp+0xc6e20>
 126e4f0: 1e211001     	fmov	s1, #3.00000000
 126e4f4: 1e212000     	fcmp	s0, s1
 126e4f8: 54000765     	b.pl	0x126e5e4 <__start_il2cpp+0xc6e20>
 126e4fc: f9406660     	ldr	x0, [x19, #0xc8]
 126e500: b4001300     	cbz	x0, 0x126e760 <__start_il2cpp+0xc6f9c>
 126e504: 9000afb4     	adrp	x20, 0x2862000
 126e508: f942b294     	ldr	x20, [x20, #0x560]
 126e50c: f9400281     	ldr	x1, [x20]
 126e510: 9405aaad     	bl	0x13d8fc4 <__start_il2cpp+0x231800>
 126e514: b4001260     	cbz	x0, 0x126e760 <__start_il2cpp+0xc6f9c>
 126e518: bd403409     	ldr	s9, [x0, #0x34]
 126e51c: aa1f03e0     	mov	x0, xzr
 126e520: 944943cc     	bl	0x24bf450 <__start_il2cpp+0x1317c8c>
 126e524: f9406660     	ldr	x0, [x19, #0xc8]
 126e528: b40011c0     	cbz	x0, 0x126e760 <__start_il2cpp+0xc6f9c>
 126e52c: f9400281     	ldr	x1, [x20]
 126e530: 4ea01c08     	mov	v8.16b, v0.16b
 126e534: 9405aaa4     	bl	0x13d8fc4 <__start_il2cpp+0x231800>
 126e538: b4001140     	cbz	x0, 0x126e760 <__start_il2cpp+0xc6f9c>
 126e53c: 1e221000     	fmov	s0, #4.00000000
 126e540: 1e200900     	fmul	s0, s8, s0
 126e544: 1e202920     	fadd	s0, s9, s0
 126e548: 1e2e1001     	fmov	s1, #1.00000000
 126e54c: b0ffa148     	adrp	x8, 0x697000
 126e550: b0ffa149     	adrp	x9, 0x697000
 126e554: b0ffa14a     	adrp	x10, 0x697000
 126e558: 1e215808     	fmin	s8, s0, s1
 126e55c: bd45f500     	ldr	s0, [x8, #0x5f4]
 126e560: bd461921     	ldr	s1, [x9, #0x618]
 126e564: bd454542     	ldr	s2, [x10, #0x544]
 126e568: 4ea81d03     	mov	v3.16b, v8.16b
 126e56c: aa1f03e1     	mov	x1, xzr
 126e570: 97fdf5c2     	bl	0x11ebc78 <__start_il2cpp+0x444b4>
 126e574: f9406660     	ldr	x0, [x19, #0xc8]
 126e578: b4000f40     	cbz	x0, 0x126e760 <__start_il2cpp+0xc6f9c>
 126e57c: 9000afa8     	adrp	x8, 0x2862000
 126e580: f942b508     	ldr	x8, [x8, #0x568]
 126e584: f9400101     	ldr	x1, [x8]
 126e588: 9405acff     	bl	0x13d9984 <__start_il2cpp+0x2321c0>
 126e58c: b4000ea0     	cbz	x0, 0x126e760 <__start_il2cpp+0xc6f9c>
 126e590: b9401808     	ldr	w8, [x0, #0x18]
 126e594: aa0003f3     	mov	x19, x0
 126e598: 7100051f     	cmp	w8, #0x1
 126e59c: 54fff8cb     	b.lt	0x126e4b4 <__start_il2cpp+0xc6cf0>
 126e5a0: 2a1f03f4     	mov	w20, wzr
 126e5a4: 6b08029f     	cmp	w20, w8
 126e5a8: 54000de2     	b.hs	0x126e764 <__start_il2cpp+0xc6fa0>
 126e5ac: 8b34ce68     	add	x8, x19, w20, sxtw #3
 126e5b0: f9401100     	ldr	x0, [x8, #0x20]
 126e5b4: b4000d60     	cbz	x0, 0x126e760 <__start_il2cpp+0xc6f9c>
 126e5b8: 4ea81d00     	mov	v0.16b, v8.16b
 126e5bc: 4ea81d01     	mov	v1.16b, v8.16b
 126e5c0: 4ea81d02     	mov	v2.16b, v8.16b
 126e5c4: 4ea81d03     	mov	v3.16b, v8.16b
 126e5c8: aa1f03e1     	mov	x1, xzr
 126e5cc: 97fdf5ab     	bl	0x11ebc78 <__start_il2cpp+0x444b4>
 126e5d0: b9401a68     	ldr	w8, [x19, #0x18]
 126e5d4: 11000694     	add	w20, w20, #0x1
 126e5d8: 6b08029f     	cmp	w20, w8
 126e5dc: 54fffe4b     	b.lt	0x126e5a4 <__start_il2cpp+0xc6de0>
 126e5e0: 17ffffb5     	b	0x126e4b4 <__start_il2cpp+0xc6cf0>
 126e5e4: bd410a61     	ldr	s1, [x19, #0x108]
 126e5e8: 1e211002     	fmov	s2, #3.00000000
 126e5ec: 1e222821     	fadd	s1, s1, s2
 126e5f0: 1e212000     	fcmp	s0, s1
 126e5f4: 54fff60b     	b.lt	0x126e4b4 <__start_il2cpp+0xc6cf0>
 126e5f8: f9406660     	ldr	x0, [x19, #0xc8]
 126e5fc: b4000b20     	cbz	x0, 0x126e760 <__start_il2cpp+0xc6f9c>
 126e600: 9000afb4     	adrp	x20, 0x2862000
 126e604: f942b294     	ldr	x20, [x20, #0x560]
 126e608: f9400281     	ldr	x1, [x20]
 126e60c: 9405aa6e     	bl	0x13d8fc4 <__start_il2cpp+0x231800>
 126e610: b4000a80     	cbz	x0, 0x126e760 <__start_il2cpp+0xc6f9c>
 126e614: bd403408     	ldr	s8, [x0, #0x34]
 126e618: aa1f03e0     	mov	x0, xzr
 126e61c: 9449438d     	bl	0x24bf450 <__start_il2cpp+0x1317c8c>
 126e620: 1e202800     	fadd	s0, s0, s0
 126e624: 1e203908     	fsub	s8, s8, s0
 126e628: 1e202108     	fcmp	s8, #0.0
 126e62c: 54000465     	b.pl	0x126e6b8 <__start_il2cpp+0xc6ef4>
 126e630: b9404a68     	ldr	w8, [x19, #0x48]
 126e634: 1e2703e8     	fmov	s8, wzr
 126e638: 7100151f     	cmp	w8, #0x5
 126e63c: 540003eb     	b.lt	0x126e6b8 <__start_il2cpp+0xc6ef4>
 126e640: aa1303e0     	mov	x0, x19
 126e644: 97ffe1ea     	bl	0x1266dec <__start_il2cpp+0xbf628>
 126e648: f9405260     	ldr	x0, [x19, #0xa0]
 126e64c: b40008a0     	cbz	x0, 0x126e760 <__start_il2cpp+0xc6f9c>
 126e650: f9400008     	ldr	x8, [x0]
 126e654: 52800021     	mov	w1, #0x1                // =1
 126e658: a9588909     	ldp	x9, x2, [x8, #0x188]
 126e65c: d63f0120     	blr	x9
 126e660: f9406260     	ldr	x0, [x19, #0xc0]
 126e664: b40007e0     	cbz	x0, 0x126e760 <__start_il2cpp+0xc6f9c>
 126e668: 2a1f03e1     	mov	w1, wzr
 126e66c: aa1f03e2     	mov	x2, xzr
 126e670: 94492952     	bl	0x24b8bb8 <__start_il2cpp+0x13113f4>
 126e674: b9004a7f     	str	wzr, [x19, #0x48]
 126e678: 3904127f     	strb	wzr, [x19, #0x104]
 126e67c: b901127f     	str	wzr, [x19, #0x110]
 126e680: 9000afa8     	adrp	x8, 0x2862000
 126e684: 9000afa9     	adrp	x9, 0x2862000
 126e688: f9425908     	ldr	x8, [x8, #0x4b0]
 126e68c: f9432929     	ldr	x9, [x9, #0x650]
 126e690: aa1f03e2     	mov	x2, xzr
 126e694: f9400100     	ldr	x0, [x8]
 126e698: f9400121     	ldr	x1, [x9]
 126e69c: 94491491     	bl	0x24b38e0 <__start_il2cpp+0x130c11c>
 126e6a0: b901267f     	str	wzr, [x19, #0x124]
 126e6a4: b901327f     	str	wzr, [x19, #0x130]
 126e6a8: b9013e7f     	str	wzr, [x19, #0x13c]
 126e6ac: b900fa7f     	str	wzr, [x19, #0xf8]
 126e6b0: b9016a7f     	str	wzr, [x19, #0x168]
 126e6b4: 97ffde0a     	bl	0x1265edc <__start_il2cpp+0xbe718>
 126e6b8: f9406660     	ldr	x0, [x19, #0xc8]
 126e6bc: b4000520     	cbz	x0, 0x126e760 <__start_il2cpp+0xc6f9c>
 126e6c0: f9400281     	ldr	x1, [x20]
 126e6c4: 9405aa40     	bl	0x13d8fc4 <__start_il2cpp+0x231800>
 126e6c8: b40004c0     	cbz	x0, 0x126e760 <__start_il2cpp+0xc6f9c>
 126e6cc: b0ffa148     	adrp	x8, 0x697000
 126e6d0: b0ffa149     	adrp	x9, 0x697000
 126e6d4: b0ffa14a     	adrp	x10, 0x697000
 126e6d8: bd45f500     	ldr	s0, [x8, #0x5f4]
 126e6dc: bd461921     	ldr	s1, [x9, #0x618]
 126e6e0: bd454542     	ldr	s2, [x10, #0x544]
 126e6e4: 4ea81d03     	mov	v3.16b, v8.16b
 126e6e8: aa1f03e1     	mov	x1, xzr
 126e6ec: 97fdf563     	bl	0x11ebc78 <__start_il2cpp+0x444b4>
 126e6f0: f9406660     	ldr	x0, [x19, #0xc8]
 126e6f4: b4000360     	cbz	x0, 0x126e760 <__start_il2cpp+0xc6f9c>
 126e6f8: 9000afa8     	adrp	x8, 0x2862000
 126e6fc: f942b508     	ldr	x8, [x8, #0x568]
 126e700: f9400101     	ldr	x1, [x8]
 126e704: 9405aca0     	bl	0x13d9984 <__start_il2cpp+0x2321c0>
 126e708: b40002c0     	cbz	x0, 0x126e760 <__start_il2cpp+0xc6f9c>
 126e70c: b9401808     	ldr	w8, [x0, #0x18]
 126e710: aa0003f3     	mov	x19, x0
 126e714: 7100051f     	cmp	w8, #0x1
 126e718: 54ffeceb     	b.lt	0x126e4b4 <__start_il2cpp+0xc6cf0>
 126e71c: 2a1f03f4     	mov	w20, wzr
 126e720: 6b08029f     	cmp	w20, w8
 126e724: 54000202     	b.hs	0x126e764 <__start_il2cpp+0xc6fa0>
 126e728: 8b34ce68     	add	x8, x19, w20, sxtw #3
 126e72c: f9401100     	ldr	x0, [x8, #0x20]
 126e730: b4000180     	cbz	x0, 0x126e760 <__start_il2cpp+0xc6f9c>
 126e734: 4ea81d00     	mov	v0.16b, v8.16b
 126e738: 4ea81d01     	mov	v1.16b, v8.16b
 126e73c: 4ea81d02     	mov	v2.16b, v8.16b
 126e740: 4ea81d03     	mov	v3.16b, v8.16b
 126e744: aa1f03e1     	mov	x1, xzr
 126e748: 97fdf54c     	bl	0x11ebc78 <__start_il2cpp+0x444b4>
 126e74c: b9401a68     	ldr	w8, [x19, #0x18]
 126e750: 11000694     	add	w20, w20, #0x1
 126e754: 6b08029f     	cmp	w20, w8
 126e758: 54fffe4b     	b.lt	0x126e720 <__start_il2cpp+0xc6f5c>
 126e75c: 17ffff56     	b	0x126e4b4 <__start_il2cpp+0xc6cf0>
 126e760: 97f94668     	bl	0x10c0100 <CloseNLSocket+0x638>
 126e764: 97f94669     	bl	0x10c0108 <CloseNLSocket+0x640>
