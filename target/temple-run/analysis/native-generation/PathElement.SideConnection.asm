
/tmp/temple-libil2cpp.so:	file format elf64-littleaarch64

Disassembly of section il2cpp:

00000000011a77c4 <__start_il2cpp>:
 12e3780: a9bd5ffe     	stp	x30, x23, [sp, #-0x30]!
 12e3784: a90157f6     	stp	x22, x21, [sp, #0x10]
 12e3788: a9024ff4     	stp	x20, x19, [sp, #0x20]
 12e378c: d000ba97     	adrp	x23, 0x2a35000
 12e3790: 396c5ee8     	ldrb	w8, [x23, #0xb17]
 12e3794: 2a0303f5     	mov	w21, w3
 12e3798: 2a0203f3     	mov	w19, w2
 12e379c: 2a0103f4     	mov	w20, w1
 12e37a0: aa0003f6     	mov	x22, x0
 12e37a4: 370000c8     	tbnz	w8, #0x0, 0x12e37bc <__start_il2cpp+0x13bff8>
 12e37a8: b000abc0     	adrp	x0, 0x285c000 <_ZTVN10__cxxabiv119__pointer_type_infoE+0x18>
 12e37ac: f9456000     	ldr	x0, [x0, #0xac0]
 12e37b0: 97f771ca     	bl	0x10bfed8 <CloseNLSocket+0x410>
 12e37b4: 52800028     	mov	w8, #0x1                // =1
 12e37b8: 392c5ee8     	strb	w8, [x23, #0xb17]
 12e37bc: b000abc8     	adrp	x8, 0x285c000 <_ZTVN10__cxxabiv119__pointer_type_infoE+0x18>
 12e37c0: f9456108     	ldr	x8, [x8, #0xac0]
 12e37c4: 51000669     	sub	w9, w19, #0x1
 12e37c8: 71000d3f     	cmp	w9, #0x3
 12e37cc: 54000128     	b.hi	0x12e37f0 <__start_il2cpp+0x13c02c>
 12e37d0: 90ff9eaa     	adrp	x10, 0x6b7000
 12e37d4: 912ff94a     	add	x10, x10, #0xbfe
 12e37d8: 1000008b     	adr	x11, 0x12e37e8 <__start_il2cpp+0x13c024>
 12e37dc: 3869694c     	ldrb	w12, [x10, x9]
 12e37e0: 8b0c096b     	add	x11, x11, x12, lsl #2
 12e37e4: d61f0160     	br	x11
 12e37e8: 910142c9     	add	x9, x22, #0x50
 12e37ec: 14000008     	b	0x12e380c <__start_il2cpp+0x13c048>
 12e37f0: aa1f03f7     	mov	x23, xzr
 12e37f4: 14000007     	b	0x12e3810 <__start_il2cpp+0x13c04c>
 12e37f8: 910162c9     	add	x9, x22, #0x58
 12e37fc: 14000004     	b	0x12e380c <__start_il2cpp+0x13c048>
 12e3800: 9101a2c9     	add	x9, x22, #0x68
 12e3804: 14000002     	b	0x12e380c <__start_il2cpp+0x13c048>
 12e3808: 910182c9     	add	x9, x22, #0x60
 12e380c: f9400137     	ldr	x23, [x9]
 12e3810: f9400100     	ldr	x0, [x8]
 12e3814: b940e008     	ldr	w8, [x0, #0xe0]
 12e3818: 35000048     	cbnz	w8, 0x12e3820 <__start_il2cpp+0x13c05c>
 12e381c: 97f771f1     	bl	0x10bffe0 <CloseNLSocket+0x518>
 12e3820: aa1703e0     	mov	x0, x23
 12e3824: aa1f03e1     	mov	x1, xzr
 12e3828: aa1f03e2     	mov	x2, xzr
 12e382c: 94475407     	bl	0x24b8848 <__start_il2cpp+0x1311084>
 12e3830: 360000e0     	tbz	w0, #0x0, 0x12e384c <__start_il2cpp+0x13c088>
 12e3834: 2a1f03e0     	mov	w0, wzr
 12e3838: a9424ff4     	ldp	x20, x19, [sp, #0x20]
 12e383c: a94157f6     	ldp	x22, x21, [sp, #0x10]
 12e3840: 12000000     	and	w0, w0, #0x1
 12e3844: a8c35ffe     	ldp	x30, x23, [sp], #0x30
 12e3848: d65f03c0     	ret
 12e384c: aa1603e0     	mov	x0, x22
 12e3850: 2a1303e1     	mov	w1, w19
 12e3854: 9400000a     	bl	0x12e387c <__start_il2cpp+0x13c0b8>
 12e3858: 3607ff00     	tbz	w0, #0x0, 0x12e3838 <__start_il2cpp+0x13c074>
 12e385c: 3607fef5     	tbz	w21, #0x0, 0x12e3838 <__start_il2cpp+0x13c074>
 12e3860: aa1603e0     	mov	x0, x22
 12e3864: 2a1403e1     	mov	w1, w20
 12e3868: 2a1303e2     	mov	w2, w19
 12e386c: a9424ff4     	ldp	x20, x19, [sp, #0x20]
 12e3870: a94157f6     	ldp	x22, x21, [sp, #0x10]
 12e3874: a8c35ffe     	ldp	x30, x23, [sp], #0x30
 12e3878: 14000047     	b	0x12e3994 <__start_il2cpp+0x13c1d0>
 12e387c: f81e0ffe     	str	x30, [sp, #-0x20]!
 12e3880: a9014ff4     	stp	x20, x19, [sp, #0x10]
 12e3884: 2a0103f3     	mov	w19, w1
 12e3888: aa0003f4     	mov	x20, x0
 12e388c: 97fffd13     	bl	0x12e2cd8 <__start_il2cpp+0x13b514>
 12e3890: 360000c0     	tbz	w0, #0x0, 0x12e38a8 <__start_il2cpp+0x13c0e4>
 12e3894: 321f0268     	orr	w8, w19, #0x2
 12e3898: 71000d1f     	cmp	w8, #0x3
 12e389c: 54000741     	b.ne	0x12e3984 <__start_il2cpp+0x13c1c0>
 12e38a0: 52800020     	mov	w0, #0x1                // =1
 12e38a4: 14000039     	b	0x12e3988 <__start_il2cpp+0x13c1c4>
 12e38a8: aa1403e0     	mov	x0, x20
 12e38ac: 97fffd2a     	bl	0x12e2d54 <__start_il2cpp+0x13b590>
 12e38b0: 360000e0     	tbz	w0, #0x0, 0x12e38cc <__start_il2cpp+0x13c108>
 12e38b4: 71000a7f     	cmp	w19, #0x2
 12e38b8: 52800020     	mov	w0, #0x1                // =1
 12e38bc: 54000660     	b.eq	0x12e3988 <__start_il2cpp+0x13c1c4>
 12e38c0: 7100127f     	cmp	w19, #0x4
 12e38c4: 54000601     	b.ne	0x12e3984 <__start_il2cpp+0x13c1c0>
 12e38c8: 14000030     	b	0x12e3988 <__start_il2cpp+0x13c1c4>
 12e38cc: b9403288     	ldr	w8, [x20, #0x30]
 12e38d0: 51000d09     	sub	w9, w8, #0x3
 12e38d4: 7100193f     	cmp	w9, #0x6
 12e38d8: 54000128     	b.hi	0x12e38fc <__start_il2cpp+0x13c138>
 12e38dc: 90ff9ea8     	adrp	x8, 0x6b7000
 12e38e0: 91301908     	add	x8, x8, #0xc06
 12e38e4: 1000008a     	adr	x10, 0x12e38f4 <__start_il2cpp+0x13c130>
 12e38e8: 3869690b     	ldrb	w11, [x8, x9]
 12e38ec: 8b0b094a     	add	x10, x10, x11, lsl #2
 12e38f0: d61f0140     	br	x10
 12e38f4: 51000e68     	sub	w8, w19, #0x3
 12e38f8: 1400000e     	b	0x12e3930 <__start_il2cpp+0x13c16c>
 12e38fc: 51000a69     	sub	w9, w19, #0x2
 12e3900: 7100093f     	cmp	w9, #0x2
 12e3904: 54000408     	b.hi	0x12e3984 <__start_il2cpp+0x13c1c0>
 12e3908: 7100291f     	cmp	w8, #0xa
 12e390c: 54fffca0     	b.eq	0x12e38a0 <__start_il2cpp+0x13c0dc>
 12e3910: 1400001d     	b	0x12e3984 <__start_il2cpp+0x13c1c0>
 12e3914: 121f7a68     	and	w8, w19, #0xfffffffe
 12e3918: 7100091f     	cmp	w8, #0x2
 12e391c: 54fffc20     	b.eq	0x12e38a0 <__start_il2cpp+0x13c0dc>
 12e3920: 14000019     	b	0x12e3984 <__start_il2cpp+0x13c1c0>
 12e3924: 7100067f     	cmp	w19, #0x1
 12e3928: 17ffffe4     	b	0x12e38b8 <__start_il2cpp+0x13c0f4>
 12e392c: 51000668     	sub	w8, w19, #0x1
 12e3930: 7100091f     	cmp	w8, #0x2
 12e3934: 54fffb63     	b.lo	0x12e38a0 <__start_il2cpp+0x13c0dc>
 12e3938: 14000013     	b	0x12e3984 <__start_il2cpp+0x13c1c0>
 12e393c: 51000668     	sub	w8, w19, #0x1
 12e3940: 7100111f     	cmp	w8, #0x4
 12e3944: 54000202     	b.hs	0x12e3984 <__start_il2cpp+0x13c1c0>
 12e3948: 92400d08     	and	x8, x8, #0xf
 12e394c: 528001a9     	mov	w9, #0xd                // =13
 12e3950: 1400000a     	b	0x12e3978 <__start_il2cpp+0x13c1b4>
 12e3954: 51000668     	sub	w8, w19, #0x1
 12e3958: 71000d1f     	cmp	w8, #0x3
 12e395c: 54fffa23     	b.lo	0x12e38a0 <__start_il2cpp+0x13c0dc>
 12e3960: 14000009     	b	0x12e3984 <__start_il2cpp+0x13c1c0>
 12e3964: 51000668     	sub	w8, w19, #0x1
 12e3968: 7100111f     	cmp	w8, #0x4
 12e396c: 540000c2     	b.hs	0x12e3984 <__start_il2cpp+0x13c1c0>
 12e3970: 92400d08     	and	x8, x8, #0xf
 12e3974: 52800169     	mov	w9, #0xb                // =11
 12e3978: 1ac82528     	lsr	w8, w9, w8
 12e397c: 12000100     	and	w0, w8, #0x1
 12e3980: 14000002     	b	0x12e3988 <__start_il2cpp+0x13c1c4>
 12e3984: 2a1f03e0     	mov	w0, wzr
 12e3988: a9414ff4     	ldp	x20, x19, [sp, #0x10]
 12e398c: f84207fe     	ldr	x30, [sp], #0x20
 12e3990: d65f03c0     	ret
