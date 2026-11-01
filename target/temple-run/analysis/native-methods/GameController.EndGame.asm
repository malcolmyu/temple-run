
/tmp/temple-libil2cpp.so:	file format elf64-littleaarch64

Disassembly of section il2cpp:

00000000011a77c4 <__start_il2cpp>:
 1272148: fc1d0fe8     	str	d8, [sp, #-0x30]!
 127214c: a90157fe     	stp	x30, x21, [sp, #0x10]
 1272150: a9024ff4     	stp	x20, x19, [sp, #0x20]
 1272154: f000be15     	adrp	x21, 0x2a35000
 1272158: 395d12a8     	ldrb	w8, [x21, #0x744]
 127215c: 2a0103f4     	mov	w20, w1
 1272160: 4ea01c08     	mov	v8.16b, v0.16b
 1272164: aa0003f3     	mov	x19, x0
 1272168: 370000c8     	tbnz	w8, #0x0, 0x1272180 <__start_il2cpp+0xca9bc>
 127216c: 9000af80     	adrp	x0, 0x2862000
 1272170: f9439800     	ldr	x0, [x0, #0x730]
 1272174: 97f93759     	bl	0x10bfed8 <CloseNLSocket+0x410>
 1272178: 52800028     	mov	w8, #0x1                // =1
 127217c: 391d12a8     	strb	w8, [x21, #0x744]
 1272180: 39437a68     	ldrb	w8, [x19, #0xde]
 1272184: 350003c8     	cbnz	w8, 0x12721fc <__start_il2cpp+0xcaa38>
 1272188: 3944126a     	ldrb	w10, [x19, #0x104]
 127218c: 12000288     	and	w8, w20, #0x1
 1272190: 52800029     	mov	w9, #0x1                // =1
 1272194: 39037a69     	strb	w9, [x19, #0xde]
 1272198: b900da7f     	str	wzr, [x19, #0xd8]
 127219c: bd011e68     	str	s8, [x19, #0x11c]
 12721a0: 39046268     	strb	w8, [x19, #0x118]
 12721a4: 350002ca     	cbnz	w10, 0x12721fc <__start_il2cpp+0xcaa38>
 12721a8: b941e668     	ldr	w8, [x19, #0x1e4]
 12721ac: 35000288     	cbnz	w8, 0x12721fc <__start_il2cpp+0xcaa38>
 12721b0: 9000af88     	adrp	x8, 0x2862000
 12721b4: f9439908     	ldr	x8, [x8, #0x730]
 12721b8: aa1f03e1     	mov	x1, xzr
 12721bc: f9400100     	ldr	x0, [x8]
 12721c0: 94021503     	bl	0x12f75cc <__start_il2cpp+0x14fe08>
 12721c4: f9403a68     	ldr	x8, [x19, #0x70]
 12721c8: b4000228     	cbz	x8, 0x127220c <__start_il2cpp+0xcaa48>
 12721cc: b9413909     	ldr	w9, [x8, #0x138]
 12721d0: bd412660     	ldr	s0, [x19, #0x124]
 12721d4: 52aff00a     	mov	w10, #0x7f800000        // =2139095040
 12721d8: 1e270141     	fmov	s1, w10
 12721dc: b901ea69     	str	w9, [x19, #0x1e8]
 12721e0: b9414908     	ldr	w8, [x8, #0x148]
 12721e4: 52b0000b     	mov	w11, #-0x80000000       // =-2147483648
 12721e8: 1e380009     	fcvtzs	w9, s0
 12721ec: 1e212000     	fcmp	s0, s1
 12721f0: 1a890169     	csel	w9, w11, w9, eq
 12721f4: b901ee68     	str	w8, [x19, #0x1ec]
 12721f8: b901f269     	str	w9, [x19, #0x1f0]
 12721fc: a9424ff4     	ldp	x20, x19, [sp, #0x20]
 1272200: a94157fe     	ldp	x30, x21, [sp, #0x10]
 1272204: fc4307e8     	ldr	d8, [sp], #0x30
 1272208: d65f03c0     	ret
 127220c: 97f937bd     	bl	0x10c0100 <CloseNLSocket+0x638>
