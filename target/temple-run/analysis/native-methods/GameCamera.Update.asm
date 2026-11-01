
/tmp/temple-libil2cpp.so:	file format elf64-littleaarch64

Disassembly of section il2cpp:

00000000011a77c4 <__start_il2cpp>:
 12af8bc: d10203ff     	sub	sp, sp, #0x80
 12af8c0: 6d013bef     	stp	d15, d14, [sp, #0x10]
 12af8c4: 6d0233ed     	stp	d13, d12, [sp, #0x20]
 12af8c8: 6d032beb     	stp	d11, d10, [sp, #0x30]
 12af8cc: 6d0423e9     	stp	d9, d8, [sp, #0x40]
 12af8d0: a9055ffe     	stp	x30, x23, [sp, #0x50]
 12af8d4: a90657f6     	stp	x22, x21, [sp, #0x60]
 12af8d8: a9074ff4     	stp	x20, x19, [sp, #0x70]
 12af8dc: d000bc34     	adrp	x20, 0x2a35000
 12af8e0: 39662288     	ldrb	w8, [x20, #0x988]
 12af8e4: aa0003f3     	mov	x19, x0
 12af8e8: 37000188     	tbnz	w8, #0x0, 0x12af918 <__start_il2cpp+0x108154>
 12af8ec: b000ada0     	adrp	x0, 0x2864000
 12af8f0: f9441c00     	ldr	x0, [x0, #0x838]
 12af8f4: 97f84179     	bl	0x10bfed8 <CloseNLSocket+0x410>
 12af8f8: f000ad60     	adrp	x0, 0x285e000
 12af8fc: f9414000     	ldr	x0, [x0, #0x280]
 12af900: 97f84176     	bl	0x10bfed8 <CloseNLSocket+0x410>
 12af904: b000ad60     	adrp	x0, 0x285c000 <_ZTVN10__cxxabiv119__pointer_type_infoE+0x18>
 12af908: f9456000     	ldr	x0, [x0, #0xac0]
 12af90c: 97f84173     	bl	0x10bfed8 <CloseNLSocket+0x410>
 12af910: 52800028     	mov	w8, #0x1                // =1
 12af914: 39262288     	strb	w8, [x20, #0x988]
 12af918: aa1303e0     	mov	x0, x19
 12af91c: aa1f03e1     	mov	x1, xzr
 12af920: 9400c1cc     	bl	0x12e0050 <__start_il2cpp+0x13888c>
 12af924: 3944a268     	ldrb	w8, [x19, #0x128]
 12af928: 340002c8     	cbz	w8, 0x12af980 <__start_il2cpp+0x1081bc>
 12af92c: aa1303e0     	mov	x0, x19
 12af930: aa1f03e1     	mov	x1, xzr
 12af934: 9400c343     	bl	0x12e0640 <__start_il2cpp+0x138e7c>
 12af938: 360001a0     	tbz	w0, #0x0, 0x12af96c <__start_il2cpp+0x1081a8>
 12af93c: 2a1f03e0     	mov	w0, wzr
 12af940: aa1f03e1     	mov	x1, xzr
 12af944: 94490045     	bl	0x24efa58 <__start_il2cpp+0x1348294>
 12af948: 370000a0     	tbnz	w0, #0x0, 0x12af95c <__start_il2cpp+0x108198>
 12af94c: aa1f03e0     	mov	x0, xzr
 12af950: 944901ae     	bl	0x24f0008 <__start_il2cpp+0x1348844>
 12af954: 7100041f     	cmp	w0, #0x1
 12af958: 5400014b     	b.lt	0x12af980 <__start_il2cpp+0x1081bc>
 12af95c: 52800021     	mov	w1, #0x1                // =1
 12af960: aa1303e0     	mov	x0, x19
 12af964: 9400020c     	bl	0x12b0194 <__start_il2cpp+0x1089d0>
 12af968: 14000006     	b	0x12af980 <__start_il2cpp+0x1081bc>
 12af96c: f9409260     	ldr	x0, [x19, #0x120]
 12af970: 3904a27f     	strb	wzr, [x19, #0x128]
 12af974: b40040e0     	cbz	x0, 0x12b0190 <__start_il2cpp+0x1089cc>
 12af978: aa1f03e1     	mov	x1, xzr
 12af97c: 94002038     	bl	0x12b7a5c <__start_il2cpp+0x110298>
 12af980: b000ad76     	adrp	x22, 0x285c000 <_ZTVN10__cxxabiv119__pointer_type_infoE+0x18>
 12af984: f94562d6     	ldr	x22, [x22, #0xac0]
 12af988: f9404674     	ldr	x20, [x19, #0x88]
 12af98c: f94002c0     	ldr	x0, [x22]
 12af990: b940e008     	ldr	w8, [x0, #0xe0]
 12af994: 35000048     	cbnz	w8, 0x12af99c <__start_il2cpp+0x1081d8>
 12af998: 97f84192     	bl	0x10bffe0 <CloseNLSocket+0x518>
 12af99c: f000ad75     	adrp	x21, 0x285e000
 12af9a0: f94142b5     	ldr	x21, [x21, #0x280]
 12af9a4: aa1403e0     	mov	x0, x20
 12af9a8: aa1f03e1     	mov	x1, xzr
 12af9ac: aa1f03e2     	mov	x2, xzr
 12af9b0: 944823a6     	bl	0x24b8848 <__start_il2cpp+0x1311084>
 12af9b4: 36000180     	tbz	w0, #0x0, 0x12af9e4 <__start_il2cpp+0x108220>
 12af9b8: f940466a     	ldr	x10, [x19, #0x88]
 12af9bc: b4003eaa     	cbz	x10, 0x12b0190 <__start_il2cpp+0x1089cc>
 12af9c0: 3943e148     	ldrb	w8, [x10, #0xf8]
 12af9c4: 39436149     	ldrb	w9, [x10, #0xd8]
 12af9c8: 7100011f     	cmp	w8, #0x0
 12af9cc: 1a9f07f7     	cset	w23, ne
 12af9d0: 35002b89     	cbnz	w9, 0x12aff40 <__start_il2cpp+0x10877c>
 12af9d4: 9100d148     	add	x8, x10, #0x34
 12af9d8: 9100e149     	add	x9, x10, #0x38
 12af9dc: 9100f14a     	add	x10, x10, #0x3c
 12af9e0: 1400000c     	b	0x12afa10 <__start_il2cpp+0x10824c>
 12af9e4: f9404260     	ldr	x0, [x19, #0x80]
 12af9e8: b4003d40     	cbz	x0, 0x12b0190 <__start_il2cpp+0x1089cc>
 12af9ec: b000ada8     	adrp	x8, 0x2864000
 12af9f0: f9441d08     	ldr	x8, [x8, #0x838]
 12af9f4: f9400101     	ldr	x1, [x8]
 12af9f8: 9403cc29     	bl	0x13a2a9c <__start_il2cpp+0x1fb2d8>
 12af9fc: b4003ca0     	cbz	x0, 0x12b0190 <__start_il2cpp+0x1089cc>
 12afa00: 2a1f03f7     	mov	w23, wzr
 12afa04: 9102b008     	add	x8, x0, #0xac
 12afa08: 9102c009     	add	x9, x0, #0xb0
 12afa0c: 9102d00a     	add	x10, x0, #0xb4
 12afa10: f94002a0     	ldr	x0, [x21]
 12afa14: bd40010e     	ldr	s14, [x8]
 12afa18: bd40012b     	ldr	s11, [x9]
 12afa1c: bd40014f     	ldr	s15, [x10]
 12afa20: b940e008     	ldr	w8, [x0, #0xe0]
 12afa24: 35000068     	cbnz	w8, 0x12afa30 <__start_il2cpp+0x10826c>
 12afa28: 97f8416e     	bl	0x10bffe0 <CloseNLSocket+0x518>
 12afa2c: f94002a0     	ldr	x0, [x21]
 12afa30: f9405c08     	ldr	x8, [x0, #0xb8]
 12afa34: f9400108     	ldr	x8, [x8]
 12afa38: b4003ac8     	cbz	x8, 0x12b0190 <__start_il2cpp+0x1089cc>
 12afa3c: 39438108     	ldrb	w8, [x8, #0xe0]
 12afa40: 35002808     	cbnz	w8, 0x12aff40 <__start_il2cpp+0x10877c>
 12afa44: f9403e60     	ldr	x0, [x19, #0x78]
 12afa48: b4003a40     	cbz	x0, 0x12b0190 <__start_il2cpp+0x1089cc>
 12afa4c: aa1f03e1     	mov	x1, xzr
 12afa50: 944819af     	bl	0x24b610c <__start_il2cpp+0x130e948>
 12afa54: f9404268     	ldr	x8, [x19, #0x80]
 12afa58: b40039c8     	cbz	x8, 0x12b0190 <__start_il2cpp+0x1089cc>
 12afa5c: aa0003f4     	mov	x20, x0
 12afa60: aa0803e0     	mov	x0, x8
 12afa64: aa1f03e1     	mov	x1, xzr
 12afa68: 944819a9     	bl	0x24b610c <__start_il2cpp+0x130e948>
 12afa6c: b4003920     	cbz	x0, 0x12b0190 <__start_il2cpp+0x1089cc>
 12afa70: aa1f03e1     	mov	x1, xzr
 12afa74: 94484b00     	bl	0x24c2674 <__start_il2cpp+0x131aeb0>
 12afa78: b40038d4     	cbz	x20, 0x12b0190 <__start_il2cpp+0x1089cc>
 12afa7c: aa1403e0     	mov	x0, x20
 12afa80: aa1f03e1     	mov	x1, xzr
 12afa84: 94484b24     	bl	0x24c2714 <__start_il2cpp+0x131af50>
 12afa88: f9403e60     	ldr	x0, [x19, #0x78]
 12afa8c: b4003820     	cbz	x0, 0x12b0190 <__start_il2cpp+0x1089cc>
 12afa90: aa1f03e1     	mov	x1, xzr
 12afa94: 9448199e     	bl	0x24b610c <__start_il2cpp+0x130e948>
 12afa98: f9404268     	ldr	x8, [x19, #0x80]
 12afa9c: b40037a8     	cbz	x8, 0x12b0190 <__start_il2cpp+0x1089cc>
 12afaa0: aa0003f4     	mov	x20, x0
 12afaa4: aa0803e0     	mov	x0, x8
 12afaa8: aa1f03e1     	mov	x1, xzr
 12afaac: 94481998     	bl	0x24b610c <__start_il2cpp+0x130e948>
 12afab0: b4003700     	cbz	x0, 0x12b0190 <__start_il2cpp+0x1089cc>
 12afab4: aa1f03e1     	mov	x1, xzr
 12afab8: 94484b6b     	bl	0x24c2864 <__start_il2cpp+0x131b0a0>
 12afabc: b40036b4     	cbz	x20, 0x12b0190 <__start_il2cpp+0x1089cc>
 12afac0: aa1403e0     	mov	x0, x20
 12afac4: aa1f03e1     	mov	x1, xzr
 12afac8: 94484b89     	bl	0x24c28ec <__start_il2cpp+0x131b128>
 12afacc: 39433268     	ldrb	w8, [x19, #0xcc]
 12afad0: 340000a8     	cbz	w8, 0x12afae4 <__start_il2cpp+0x108320>
 12afad4: bd40b261     	ldr	s1, [x19, #0xb0]
 12afad8: bd40be62     	ldr	s2, [x19, #0xbc]
 12afadc: bd40ca60     	ldr	s0, [x19, #0xc8]
 12afae0: 1400002f     	b	0x12afb9c <__start_il2cpp+0x1083d8>
 12afae4: 34000577     	cbz	w23, 0x12afb90 <__start_il2cpp+0x1083cc>
 12afae8: f9404260     	ldr	x0, [x19, #0x80]
 12afaec: b4003520     	cbz	x0, 0x12b0190 <__start_il2cpp+0x1089cc>
 12afaf0: bd40ae68     	ldr	s8, [x19, #0xac]
 12afaf4: aa1f03e1     	mov	x1, xzr
 12afaf8: 94481985     	bl	0x24b610c <__start_il2cpp+0x130e948>
 12afafc: b40034a0     	cbz	x0, 0x12b0190 <__start_il2cpp+0x1089cc>
 12afb00: aa1f03e1     	mov	x1, xzr
 12afb04: 94484adc     	bl	0x24c2674 <__start_il2cpp+0x131aeb0>
 12afb08: bd409a60     	ldr	s0, [x19, #0x98]
 12afb0c: f9404260     	ldr	x0, [x19, #0x80]
 12afb10: 1e203820     	fsub	s0, s1, s0
 12afb14: 1e2c1001     	fmov	s1, #0.50000000
 12afb18: 1e210800     	fmul	s0, s0, s1
 12afb1c: 1e202900     	fadd	s0, s8, s0
 12afb20: bd009e60     	str	s0, [x19, #0x9c]
 12afb24: b4003360     	cbz	x0, 0x12b0190 <__start_il2cpp+0x1089cc>
 12afb28: bd40ba68     	ldr	s8, [x19, #0xb8]
 12afb2c: aa1f03e1     	mov	x1, xzr
 12afb30: 94481977     	bl	0x24b610c <__start_il2cpp+0x130e948>
 12afb34: b40032e0     	cbz	x0, 0x12b0190 <__start_il2cpp+0x1089cc>
 12afb38: aa1f03e1     	mov	x1, xzr
 12afb3c: 94484ace     	bl	0x24c2674 <__start_il2cpp+0x131aeb0>
 12afb40: bd409a60     	ldr	s0, [x19, #0x98]
 12afb44: f9404260     	ldr	x0, [x19, #0x80]
 12afb48: 1e203820     	fsub	s0, s1, s0
 12afb4c: 1e2c1001     	fmov	s1, #0.50000000
 12afb50: 1e210800     	fmul	s0, s0, s1
 12afb54: 1e202900     	fadd	s0, s8, s0
 12afb58: bd00a260     	str	s0, [x19, #0xa0]
 12afb5c: b40031a0     	cbz	x0, 0x12b0190 <__start_il2cpp+0x1089cc>
 12afb60: bd40c668     	ldr	s8, [x19, #0xc4]
 12afb64: aa1f03e1     	mov	x1, xzr
 12afb68: 94481969     	bl	0x24b610c <__start_il2cpp+0x130e948>
 12afb6c: b4003120     	cbz	x0, 0x12b0190 <__start_il2cpp+0x1089cc>
 12afb70: aa1f03e1     	mov	x1, xzr
 12afb74: 94484ac0     	bl	0x24c2674 <__start_il2cpp+0x131aeb0>
 12afb78: bd409a60     	ldr	s0, [x19, #0x98]
 12afb7c: 1e203820     	fsub	s0, s1, s0
 12afb80: 1e2a1001     	fmov	s1, #0.25000000
 12afb84: 1e210800     	fmul	s0, s0, s1
 12afb88: 1e202900     	fadd	s0, s8, s0
 12afb8c: 14000005     	b	0x12afba0 <__start_il2cpp+0x1083dc>
 12afb90: bd40aa61     	ldr	s1, [x19, #0xa8]
 12afb94: bd40b662     	ldr	s2, [x19, #0xb4]
 12afb98: bd40c260     	ldr	s0, [x19, #0xc0]
 12afb9c: 2d138a61     	stp	s1, s2, [x19, #0x9c]
 12afba0: bd00a660     	str	s0, [x19, #0xa4]
 12afba4: f94002c0     	ldr	x0, [x22]
 12afba8: f9404674     	ldr	x20, [x19, #0x88]
 12afbac: b940e008     	ldr	w8, [x0, #0xe0]
 12afbb0: 35000048     	cbnz	w8, 0x12afbb8 <__start_il2cpp+0x1083f4>
 12afbb4: 97f8410b     	bl	0x10bffe0 <CloseNLSocket+0x518>
 12afbb8: aa1403e0     	mov	x0, x20
 12afbbc: aa1f03e1     	mov	x1, xzr
 12afbc0: aa1f03e2     	mov	x2, xzr
 12afbc4: 94482321     	bl	0x24b8848 <__start_il2cpp+0x1311084>
 12afbc8: 360000a0     	tbz	w0, #0x0, 0x12afbdc <__start_il2cpp+0x108418>
 12afbcc: f9404668     	ldr	x8, [x19, #0x88]
 12afbd0: b4002e08     	cbz	x8, 0x12b0190 <__start_il2cpp+0x1089cc>
 12afbd4: bd413508     	ldr	s8, [x8, #0x134]
 12afbd8: 14000009     	b	0x12afbfc <__start_il2cpp+0x108438>
 12afbdc: f9404260     	ldr	x0, [x19, #0x80]
 12afbe0: b4002d80     	cbz	x0, 0x12b0190 <__start_il2cpp+0x1089cc>
 12afbe4: aa1f03e1     	mov	x1, xzr
 12afbe8: 94481949     	bl	0x24b610c <__start_il2cpp+0x130e948>
 12afbec: b4002d20     	cbz	x0, 0x12b0190 <__start_il2cpp+0x1089cc>
 12afbf0: aa1f03e1     	mov	x1, xzr
 12afbf4: 94484aa0     	bl	0x24c2674 <__start_il2cpp+0x131aeb0>
 12afbf8: 4ea11c28     	mov	v8.16b, v1.16b
 12afbfc: bd409a69     	ldr	s9, [x19, #0x98]
 12afc00: 1e293900     	fsub	s0, s8, s9
 12afc04: 1e202008     	fcmp	s0, #0.0
 12afc08: 54000165     	b.pl	0x12afc34 <__start_il2cpp+0x108470>
 12afc0c: aa1f03e0     	mov	x0, xzr
 12afc10: 94483e10     	bl	0x24bf450 <__start_il2cpp+0x1317c8c>
 12afc14: 52b84908     	mov	w8, #-0x3db80000        // =-1035468800
 12afc18: 1e270101     	fmov	s1, w8
 12afc1c: 1e210800     	fmul	s0, s0, s1
 12afc20: 1e202920     	fadd	s0, s9, s0
 12afc24: 1e282000     	fcmp	s0, s8
 12afc28: bd009a60     	str	s0, [x19, #0x98]
 12afc2c: 54000184     	b.mi	0x12afc5c <__start_il2cpp+0x108498>
 12afc30: 1400000c     	b	0x12afc60 <__start_il2cpp+0x10849c>
 12afc34: 5400016d     	b.le	0x12afc60 <__start_il2cpp+0x10849c>
 12afc38: aa1f03e0     	mov	x0, xzr
 12afc3c: 94483e05     	bl	0x24bf450 <__start_il2cpp+0x1317c8c>
 12afc40: 52a84908     	mov	w8, #0x42480000         // =1112014848
 12afc44: 1e270101     	fmov	s1, w8
 12afc48: 1e210800     	fmul	s0, s0, s1
 12afc4c: 1e202920     	fadd	s0, s9, s0
 12afc50: 1e282000     	fcmp	s0, s8
 12afc54: bd009a60     	str	s0, [x19, #0x98]
 12afc58: 5400004d     	b.le	0x12afc60 <__start_il2cpp+0x10849c>
 12afc5c: bd009a68     	str	s8, [x19, #0x98]
 12afc60: f9403e60     	ldr	x0, [x19, #0x78]
 12afc64: b4002960     	cbz	x0, 0x12b0190 <__start_il2cpp+0x1089cc>
 12afc68: aa1f03e1     	mov	x1, xzr
 12afc6c: 94481928     	bl	0x24b610c <__start_il2cpp+0x130e948>
 12afc70: f9403e68     	ldr	x8, [x19, #0x78]
 12afc74: b40028e8     	cbz	x8, 0x12b0190 <__start_il2cpp+0x1089cc>
 12afc78: aa0003f4     	mov	x20, x0
 12afc7c: aa0803e0     	mov	x0, x8
 12afc80: aa1f03e1     	mov	x1, xzr
 12afc84: 94481922     	bl	0x24b610c <__start_il2cpp+0x130e948>
 12afc88: b4002840     	cbz	x0, 0x12b0190 <__start_il2cpp+0x1089cc>
 12afc8c: aa1f03e1     	mov	x1, xzr
 12afc90: 94484a79     	bl	0x24c2674 <__start_il2cpp+0x131aeb0>
 12afc94: f9403e60     	ldr	x0, [x19, #0x78]
 12afc98: b40027c0     	cbz	x0, 0x12b0190 <__start_il2cpp+0x1089cc>
 12afc9c: bd409a69     	ldr	s9, [x19, #0x98]
 12afca0: bd40a66a     	ldr	s10, [x19, #0xa4]
 12afca4: aa1f03e1     	mov	x1, xzr
 12afca8: 4ea01c08     	mov	v8.16b, v0.16b
 12afcac: 94481918     	bl	0x24b610c <__start_il2cpp+0x130e948>
 12afcb0: b4002700     	cbz	x0, 0x12b0190 <__start_il2cpp+0x1089cc>
 12afcb4: aa1f03e1     	mov	x1, xzr
 12afcb8: 94484a6f     	bl	0x24c2674 <__start_il2cpp+0x131aeb0>
 12afcbc: b40026b4     	cbz	x20, 0x12b0190 <__start_il2cpp+0x1089cc>
 12afcc0: 1e2a2921     	fadd	s1, s9, s10
 12afcc4: aa1403e0     	mov	x0, x20
 12afcc8: 4ea81d00     	mov	v0.16b, v8.16b
 12afccc: aa1f03e1     	mov	x1, xzr
 12afcd0: 94484a91     	bl	0x24c2714 <__start_il2cpp+0x131af50>
 12afcd4: f94002a0     	ldr	x0, [x21]
 12afcd8: b940e008     	ldr	w8, [x0, #0xe0]
 12afcdc: 35000068     	cbnz	w8, 0x12afce8 <__start_il2cpp+0x108524>
 12afce0: 97f840c0     	bl	0x10bffe0 <CloseNLSocket+0x518>
 12afce4: f94002a0     	ldr	x0, [x21]
 12afce8: f9405c08     	ldr	x8, [x0, #0xb8]
 12afcec: f9400108     	ldr	x8, [x8]
 12afcf0: b4002508     	cbz	x8, 0x12b0190 <__start_il2cpp+0x1089cc>
 12afcf4: 39441908     	ldrb	w8, [x8, #0x106]
 12afcf8: 35001048     	cbnz	w8, 0x12aff00 <__start_il2cpp+0x10873c>
 12afcfc: f9403e60     	ldr	x0, [x19, #0x78]
 12afd00: b4002480     	cbz	x0, 0x12b0190 <__start_il2cpp+0x1089cc>
 12afd04: aa1f03e1     	mov	x1, xzr
 12afd08: 94481901     	bl	0x24b610c <__start_il2cpp+0x130e948>
 12afd0c: b4002420     	cbz	x0, 0x12b0190 <__start_il2cpp+0x1089cc>
 12afd10: aa1f03e1     	mov	x1, xzr
 12afd14: 94484a58     	bl	0x24c2674 <__start_il2cpp+0x131aeb0>
 12afd18: bd409a6d     	ldr	s13, [x19, #0x98]
 12afd1c: f9403e60     	ldr	x0, [x19, #0x78]
 12afd20: bd00ee60     	str	s0, [x19, #0xec]
 12afd24: 2d1e0a6d     	stp	s13, s2, [x19, #0xf0]
 12afd28: b4002340     	cbz	x0, 0x12b0190 <__start_il2cpp+0x1089cc>
 12afd2c: aa1f03e1     	mov	x1, xzr
 12afd30: 4ea01c08     	mov	v8.16b, v0.16b
 12afd34: 4ea21c49     	mov	v9.16b, v2.16b
 12afd38: bd000feb     	str	s11, [sp, #0xc]
 12afd3c: 944818f4     	bl	0x24b610c <__start_il2cpp+0x130e948>
 12afd40: b4002280     	cbz	x0, 0x12b0190 <__start_il2cpp+0x1089cc>
 12afd44: aa1f03e1     	mov	x1, xzr
 12afd48: bd000bee     	str	s14, [sp, #0x8]
 12afd4c: 94484b7e     	bl	0x24c2b44 <__start_il2cpp+0x131b380>
 12afd50: f9403e60     	ldr	x0, [x19, #0x78]
 12afd54: b40021e0     	cbz	x0, 0x12b0190 <__start_il2cpp+0x1089cc>
 12afd58: bd40a26e     	ldr	s14, [x19, #0xa0]
 12afd5c: aa1f03e1     	mov	x1, xzr
 12afd60: 4ea01c0c     	mov	v12.16b, v0.16b
 12afd64: 4ea11c2a     	mov	v10.16b, v1.16b
 12afd68: 4ea21c4b     	mov	v11.16b, v2.16b
 12afd6c: 944818e8     	bl	0x24b610c <__start_il2cpp+0x130e948>
 12afd70: b4002100     	cbz	x0, 0x12b0190 <__start_il2cpp+0x1089cc>
 12afd74: aa1f03e1     	mov	x1, xzr
 12afd78: 94484b54     	bl	0x24c2ac8 <__start_il2cpp+0x131b304>
 12afd7c: bd409e63     	ldr	s3, [x19, #0x9c]
 12afd80: 1e2e0984     	fmul	s4, s12, s14
 12afd84: 1e2e0945     	fmul	s5, s10, s14
 12afd88: 1e2e0966     	fmul	s6, s11, s14
 12afd8c: 1e230800     	fmul	s0, s0, s3
 12afd90: 1e230821     	fmul	s1, s1, s3
 12afd94: 1e230842     	fmul	s2, s2, s3
 12afd98: 1e243800     	fsub	s0, s0, s4
 12afd9c: 1e253821     	fsub	s1, s1, s5
 12afda0: 1e263842     	fsub	s2, s2, s6
 12afda4: 1e20290b     	fadd	s11, s8, s0
 12afda8: 1e2129ac     	fadd	s12, s13, s1
 12afdac: 1e22292d     	fadd	s13, s9, s2
 12afdb0: aa1303e0     	mov	x0, x19
 12afdb4: aa1f03e1     	mov	x1, xzr
 12afdb8: 2d1db26b     	stp	s11, s12, [x19, #0xec]
 12afdbc: bd00f66d     	str	s13, [x19, #0xf4]
 12afdc0: 944818d3     	bl	0x24b610c <__start_il2cpp+0x130e948>
 12afdc4: b4001e60     	cbz	x0, 0x12b0190 <__start_il2cpp+0x1089cc>
 12afdc8: aa1f03e1     	mov	x1, xzr
 12afdcc: 94484a2a     	bl	0x24c2674 <__start_il2cpp+0x131aeb0>
 12afdd0: d000bc36     	adrp	x22, 0x2a35000
 12afdd4: 394136c8     	ldrb	w8, [x22, #0x4d]
 12afdd8: 4ea01c08     	mov	v8.16b, v0.16b
 12afddc: 4ea11c29     	mov	v9.16b, v1.16b
 12afde0: 4ea21c4a     	mov	v10.16b, v2.16b
 12afde4: 350000c8     	cbnz	w8, 0x12afdfc <__start_il2cpp+0x108638>
 12afde8: f000ad60     	adrp	x0, 0x285e000
 12afdec: f9417800     	ldr	x0, [x0, #0x2f0]
 12afdf0: 97f8403a     	bl	0x10bfed8 <CloseNLSocket+0x410>
 12afdf4: 52800028     	mov	w8, #0x1                // =1
 12afdf8: 390136c8     	strb	w8, [x22, #0x4d]
 12afdfc: f000ad74     	adrp	x20, 0x285e000
 12afe00: f9417a94     	ldr	x20, [x20, #0x2f0]
 12afe04: 1e28396b     	fsub	s11, s11, s8
 12afe08: 1e293989     	fsub	s9, s12, s9
 12afe0c: 1e2a39a8     	fsub	s8, s13, s10
 12afe10: f9400280     	ldr	x0, [x20]
 12afe14: b940e008     	ldr	w8, [x0, #0xe0]
 12afe18: 35000048     	cbnz	w8, 0x12afe20 <__start_il2cpp+0x10865c>
 12afe1c: 97f84071     	bl	0x10bffe0 <CloseNLSocket+0x518>
 12afe20: 1e2b0960     	fmul	s0, s11, s11
 12afe24: 1e290921     	fmul	s1, s9, s9
 12afe28: 1e212800     	fadd	s0, s0, s1
 12afe2c: 1e280901     	fmul	s1, s8, s8
 12afe30: 1e202820     	fadd	s0, s1, s0
 12afe34: 1e21c00a     	fsqrt	s10, s0
 12afe38: 1e202148     	fcmp	s10, #0.0
 12afe3c: 5400062d     	b.le	0x12aff00 <__start_il2cpp+0x10873c>
 12afe40: 394136c8     	ldrb	w8, [x22, #0x4d]
 12afe44: 350000c8     	cbnz	w8, 0x12afe5c <__start_il2cpp+0x108698>
 12afe48: f000ad60     	adrp	x0, 0x285e000
 12afe4c: f9417800     	ldr	x0, [x0, #0x2f0]
 12afe50: 97f84022     	bl	0x10bfed8 <CloseNLSocket+0x410>
 12afe54: 52800028     	mov	w8, #0x1                // =1
 12afe58: 390136c8     	strb	w8, [x22, #0x4d]
 12afe5c: f9400280     	ldr	x0, [x20]
 12afe60: b940e008     	ldr	w8, [x0, #0xe0]
 12afe64: 35000128     	cbnz	w8, 0x12afe88 <__start_il2cpp+0x1086c4>
 12afe68: 97f8405e     	bl	0x10bffe0 <CloseNLSocket+0x518>
 12afe6c: 394136c8     	ldrb	w8, [x22, #0x4d]
 12afe70: 350000c8     	cbnz	w8, 0x12afe88 <__start_il2cpp+0x1086c4>
 12afe74: f000ad60     	adrp	x0, 0x285e000
 12afe78: f9417800     	ldr	x0, [x0, #0x2f0]
 12afe7c: 97f84017     	bl	0x10bfed8 <CloseNLSocket+0x410>
 12afe80: 52800028     	mov	w8, #0x1                // =1
 12afe84: 390136c8     	strb	w8, [x22, #0x4d]
 12afe88: f9400280     	ldr	x0, [x20]
 12afe8c: b940e008     	ldr	w8, [x0, #0xe0]
 12afe90: 35000048     	cbnz	w8, 0x12afe98 <__start_il2cpp+0x1086d4>
 12afe94: 97f84053     	bl	0x10bffe0 <CloseNLSocket+0x518>
 12afe98: 2d4107e0     	ldp	s0, s1, [sp, #0x8]
 12afe9c: aa1f03e0     	mov	x0, xzr
 12afea0: 1e200800     	fmul	s0, s0, s0
 12afea4: 1e210821     	fmul	s1, s1, s1
 12afea8: 1e212800     	fadd	s0, s0, s1
 12afeac: 1e2f09e1     	fmul	s1, s15, s15
 12afeb0: 1e212800     	fadd	s0, s0, s1
 12afeb4: 1e21c00c     	fsqrt	s12, s0
 12afeb8: 94483d66     	bl	0x24bf450 <__start_il2cpp+0x1317c8c>
 12afebc: 1e2e9001     	fmov	s1, #1.25000000
 12afec0: 1e210981     	fmul	s1, s12, s1
 12afec4: 1e20082c     	fmul	s12, s1, s0
 12afec8: 1e2a2180     	fcmp	s12, s10
 12afecc: 5400006a     	b.ge	0x12afed8 <__start_il2cpp+0x108714>
 12afed0: 3944a668     	ldrb	w8, [x19, #0x129]
 12afed4: 34000fe8     	cbz	w8, 0x12b00d0 <__start_il2cpp+0x10890c>
 12afed8: aa1303e0     	mov	x0, x19
 12afedc: aa1f03e1     	mov	x1, xzr
 12afee0: 9448188b     	bl	0x24b610c <__start_il2cpp+0x130e948>
 12afee4: b4001560     	cbz	x0, 0x12b0190 <__start_il2cpp+0x1089cc>
 12afee8: 2d5e0a61     	ldp	s1, s2, [x19, #0xf0]
 12afeec: bd40ee60     	ldr	s0, [x19, #0xec]
 12afef0: aa0003f4     	mov	x20, x0
 12afef4: aa1403e0     	mov	x0, x20
 12afef8: aa1f03e1     	mov	x1, xzr
 12afefc: 94484a06     	bl	0x24c2714 <__start_il2cpp+0x131af50>
 12aff00: aa1303e0     	mov	x0, x19
 12aff04: aa1f03e1     	mov	x1, xzr
 12aff08: 94481881     	bl	0x24b610c <__start_il2cpp+0x130e948>
 12aff0c: f9403e68     	ldr	x8, [x19, #0x78]
 12aff10: b4001408     	cbz	x8, 0x12b0190 <__start_il2cpp+0x1089cc>
 12aff14: aa0003f4     	mov	x20, x0
 12aff18: aa0803e0     	mov	x0, x8
 12aff1c: aa1f03e1     	mov	x1, xzr
 12aff20: 9448187b     	bl	0x24b610c <__start_il2cpp+0x130e948>
 12aff24: b4001360     	cbz	x0, 0x12b0190 <__start_il2cpp+0x1089cc>
 12aff28: aa1f03e1     	mov	x1, xzr
 12aff2c: 944849d2     	bl	0x24c2674 <__start_il2cpp+0x131aeb0>
 12aff30: b4001314     	cbz	x20, 0x12b0190 <__start_il2cpp+0x1089cc>
 12aff34: aa1403e0     	mov	x0, x20
 12aff38: aa1f03e1     	mov	x1, xzr
 12aff3c: 94484dd4     	bl	0x24c368c <__start_il2cpp+0x131bec8>
 12aff40: f94002a0     	ldr	x0, [x21]
 12aff44: b940e008     	ldr	w8, [x0, #0xe0]
 12aff48: 35000068     	cbnz	w8, 0x12aff54 <__start_il2cpp+0x108790>
 12aff4c: 97f84025     	bl	0x10bffe0 <CloseNLSocket+0x518>
 12aff50: f94002a0     	ldr	x0, [x21]
 12aff54: f9405c08     	ldr	x8, [x0, #0xb8]
 12aff58: f9400108     	ldr	x8, [x8]
 12aff5c: b40011a8     	cbz	x8, 0x12b0190 <__start_il2cpp+0x1089cc>
 12aff60: 39438108     	ldrb	w8, [x8, #0xe0]
 12aff64: 34000228     	cbz	w8, 0x12affa8 <__start_il2cpp+0x1087e4>
 12aff68: aa1303e0     	mov	x0, x19
 12aff6c: aa1f03e1     	mov	x1, xzr
 12aff70: 94481867     	bl	0x24b610c <__start_il2cpp+0x130e948>
 12aff74: f9403e68     	ldr	x8, [x19, #0x78]
 12aff78: b40010c8     	cbz	x8, 0x12b0190 <__start_il2cpp+0x1089cc>
 12aff7c: aa0003f4     	mov	x20, x0
 12aff80: aa0803e0     	mov	x0, x8
 12aff84: aa1f03e1     	mov	x1, xzr
 12aff88: 94481861     	bl	0x24b610c <__start_il2cpp+0x130e948>
 12aff8c: b4001020     	cbz	x0, 0x12b0190 <__start_il2cpp+0x1089cc>
 12aff90: aa1f03e1     	mov	x1, xzr
 12aff94: 944849b8     	bl	0x24c2674 <__start_il2cpp+0x131aeb0>
 12aff98: b4000fd4     	cbz	x20, 0x12b0190 <__start_il2cpp+0x1089cc>
 12aff9c: aa1403e0     	mov	x0, x20
 12affa0: aa1f03e1     	mov	x1, xzr
 12affa4: 94484dba     	bl	0x24c368c <__start_il2cpp+0x131bec8>
 12affa8: 3943e268     	ldrb	w8, [x19, #0xf8]
 12affac: 34000588     	cbz	w8, 0x12b005c <__start_il2cpp+0x108898>
 12affb0: bd410e68     	ldr	s8, [x19, #0x10c]
 12affb4: aa1f03e0     	mov	x0, xzr
 12affb8: 94483d26     	bl	0x24bf450 <__start_il2cpp+0x1317c8c>
 12affbc: bd411669     	ldr	s9, [x19, #0x114]
 12affc0: 1e203900     	fsub	s0, s8, s0
 12affc4: aa1f03e0     	mov	x0, xzr
 12affc8: bd010e60     	str	s0, [x19, #0x10c]
 12affcc: 94483d21     	bl	0x24bf450 <__start_il2cpp+0x1317c8c>
 12affd0: bd411261     	ldr	s1, [x19, #0x110]
 12affd4: 1e210800     	fmul	s0, s0, s1
 12affd8: 1e203929     	fsub	s9, s9, s0
 12affdc: 1e202128     	fcmp	s9, #0.0
 12affe0: bd011669     	str	s9, [x19, #0x114]
 12affe4: 540000a9     	b.ls	0x12afff8 <__start_il2cpp+0x108834>
 12affe8: bd410e6a     	ldr	s10, [x19, #0x10c]
 12affec: bd411a60     	ldr	s0, [x19, #0x118]
 12afff0: 1e202140     	fcmp	s10, s0
 12afff4: 5400006d     	b.le	0x12b0000 <__start_il2cpp+0x10883c>
 12afff8: 3903e27f     	strb	wzr, [x19, #0xf8]
 12afffc: 14000018     	b	0x12b005c <__start_il2cpp+0x108898>
 12b0000: bd411e6b     	ldr	s11, [x19, #0x11c]
 12b0004: aa1303e0     	mov	x0, x19
 12b0008: aa1f03e1     	mov	x1, xzr
 12b000c: 94481840     	bl	0x24b610c <__start_il2cpp+0x130e948>
 12b0010: b4000c00     	cbz	x0, 0x12b0190 <__start_il2cpp+0x1089cc>
 12b0014: 52a84908     	mov	w8, #0x42480000         // =1112014848
 12b0018: 1e270100     	fmov	s0, w8
 12b001c: 1e200940     	fmul	s0, s10, s0
 12b0020: 1e2b0800     	fmul	s0, s0, s11
 12b0024: aa0003f4     	mov	x20, x0
 12b0028: 94515f4a     	bl	0x2707d50 <sinf@plt>
 12b002c: 52a84188     	mov	w8, #0x420c0000         // =1108082688
 12b0030: 1e200928     	fmul	s8, s9, s0
 12b0034: 1e270100     	fmov	s0, w8
 12b0038: 1e200940     	fmul	s0, s10, s0
 12b003c: 1e2b0800     	fmul	s0, s0, s11
 12b0040: 94515f44     	bl	0x2707d50 <sinf@plt>
 12b0044: 1e200920     	fmul	s0, s9, s0
 12b0048: 1e2703e2     	fmov	s2, wzr
 12b004c: aa1403e0     	mov	x0, x20
 12b0050: 4ea81d01     	mov	v1.16b, v8.16b
 12b0054: aa1f03e1     	mov	x1, xzr
 12b0058: 94484c6f     	bl	0x24c3214 <__start_il2cpp+0x131ba50>
 12b005c: f94002a0     	ldr	x0, [x21]
 12b0060: b940e008     	ldr	w8, [x0, #0xe0]
 12b0064: 35000068     	cbnz	w8, 0x12b0070 <__start_il2cpp+0x1088ac>
 12b0068: 97f83fde     	bl	0x10bffe0 <CloseNLSocket+0x518>
 12b006c: f94002a0     	ldr	x0, [x21]
 12b0070: f9405c08     	ldr	x8, [x0, #0xb8]
 12b0074: f9400108     	ldr	x8, [x8]
 12b0078: b40008c8     	cbz	x8, 0x12b0190 <__start_il2cpp+0x1089cc>
 12b007c: 39437508     	ldrb	w8, [x8, #0xdd]
 12b0080: 34000168     	cbz	w8, 0x12b00ac <__start_il2cpp+0x1088e8>
 12b0084: aa1303e0     	mov	x0, x19
 12b0088: a9474ff4     	ldp	x20, x19, [sp, #0x70]
 12b008c: a94657f6     	ldp	x22, x21, [sp, #0x60]
 12b0090: a9455ffe     	ldp	x30, x23, [sp, #0x50]
 12b0094: 6d4423e9     	ldp	d9, d8, [sp, #0x40]
 12b0098: 6d432beb     	ldp	d11, d10, [sp, #0x30]
 12b009c: 6d4233ed     	ldp	d13, d12, [sp, #0x20]
 12b00a0: 6d413bef     	ldp	d15, d14, [sp, #0x10]
 12b00a4: 910203ff     	add	sp, sp, #0x80
 12b00a8: 1400008f     	b	0x12b02e4 <__start_il2cpp+0x108b20>
 12b00ac: a9474ff4     	ldp	x20, x19, [sp, #0x70]
 12b00b0: a94657f6     	ldp	x22, x21, [sp, #0x60]
 12b00b4: a9455ffe     	ldp	x30, x23, [sp, #0x50]
 12b00b8: 6d4423e9     	ldp	d9, d8, [sp, #0x40]
 12b00bc: 6d432beb     	ldp	d11, d10, [sp, #0x30]
 12b00c0: 6d4233ed     	ldp	d13, d12, [sp, #0x20]
 12b00c4: 6d413bef     	ldp	d15, d14, [sp, #0x10]
 12b00c8: 910203ff     	add	sp, sp, #0x80
 12b00cc: d65f03c0     	ret
 12b00d0: b000bc36     	adrp	x22, 0x2a35000
 12b00d4: 39414ec8     	ldrb	w8, [x22, #0x53]
 12b00d8: 350000c8     	cbnz	w8, 0x12b00f0 <__start_il2cpp+0x10892c>
 12b00dc: d000ad60     	adrp	x0, 0x285e000
 12b00e0: f9417800     	ldr	x0, [x0, #0x2f0]
 12b00e4: 97f83f7d     	bl	0x10bfed8 <CloseNLSocket+0x410>
 12b00e8: 52800028     	mov	w8, #0x1                // =1
 12b00ec: 39014ec8     	strb	w8, [x22, #0x53]
 12b00f0: f9400280     	ldr	x0, [x20]
 12b00f4: b940e008     	ldr	w8, [x0, #0xe0]
 12b00f8: 35000048     	cbnz	w8, 0x12b0100 <__start_il2cpp+0x10893c>
 12b00fc: 97f83fb9     	bl	0x10bffe0 <CloseNLSocket+0x518>
 12b0100: f0ff9f28     	adrp	x8, 0x697000
 12b0104: bd45cd00     	ldr	s0, [x8, #0x5cc]
 12b0108: 1e202140     	fcmp	s10, s0
 12b010c: 540000ad     	b.le	0x12b0120 <__start_il2cpp+0x10895c>
 12b0110: 1e2a196b     	fdiv	s11, s11, s10
 12b0114: 1e2a1929     	fdiv	s9, s9, s10
 12b0118: 1e2a1908     	fdiv	s8, s8, s10
 12b011c: 1400000f     	b	0x12b0158 <__start_il2cpp+0x108994>
 12b0120: 9000bc34     	adrp	x20, 0x2a34000
 12b0124: 397e8288     	ldrb	w8, [x20, #0xfa0]
 12b0128: 350000c8     	cbnz	w8, 0x12b0140 <__start_il2cpp+0x10897c>
 12b012c: b000ad60     	adrp	x0, 0x285d000
 12b0130: f9474800     	ldr	x0, [x0, #0xe90]
 12b0134: 97f83f69     	bl	0x10bfed8 <CloseNLSocket+0x410>
 12b0138: 52800028     	mov	w8, #0x1                // =1
 12b013c: 393e8288     	strb	w8, [x20, #0xfa0]
 12b0140: b000ad68     	adrp	x8, 0x285d000
 12b0144: f9474908     	ldr	x8, [x8, #0xe90]
 12b0148: f9400108     	ldr	x8, [x8]
 12b014c: f9405d08     	ldr	x8, [x8, #0xb8]
 12b0150: 2d40250b     	ldp	s11, s9, [x8]
 12b0154: bd400908     	ldr	s8, [x8, #0x8]
 12b0158: aa1303e0     	mov	x0, x19
 12b015c: aa1f03e1     	mov	x1, xzr
 12b0160: 944817eb     	bl	0x24b610c <__start_il2cpp+0x130e948>
 12b0164: b4000160     	cbz	x0, 0x12b0190 <__start_il2cpp+0x1089cc>
 12b0168: aa1f03e1     	mov	x1, xzr
 12b016c: aa0003f4     	mov	x20, x0
 12b0170: 94484941     	bl	0x24c2674 <__start_il2cpp+0x131aeb0>
 12b0174: 1e2b0983     	fmul	s3, s12, s11
 12b0178: 1e290984     	fmul	s4, s12, s9
 12b017c: 1e280985     	fmul	s5, s12, s8
 12b0180: 1e202860     	fadd	s0, s3, s0
 12b0184: 1e212881     	fadd	s1, s4, s1
 12b0188: 1e2228a2     	fadd	s2, s5, s2
 12b018c: 17ffff5a     	b	0x12afef4 <__start_il2cpp+0x108730>
 12b0190: 97f83fdc     	bl	0x10c0100 <CloseNLSocket+0x638>
