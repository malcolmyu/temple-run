
/tmp/temple-libil2cpp.so:	file format elf64-littleaarch64

Disassembly of section il2cpp:

00000000011a77c4 <__start_il2cpp>:
 12778e8: f81e0ffe     	str	x30, [sp, #-0x20]!
 12778ec: a9014ff4     	stp	x20, x19, [sp, #0x10]
 12778f0: d000bdf4     	adrp	x20, 0x2a35000
 12778f4: 395d6e88     	ldrb	w8, [x20, #0x75b]
 12778f8: aa0003f3     	mov	x19, x0
 12778fc: 37000128     	tbnz	w8, #0x0, 0x1277920 <__start_il2cpp+0xd015c>
 1277900: f000af40     	adrp	x0, 0x2862000
 1277904: f944bc00     	ldr	x0, [x0, #0x978]
 1277908: 97f92174     	bl	0x10bfed8 <CloseNLSocket+0x410>
 127790c: f000af40     	adrp	x0, 0x2862000
 1277910: f944c000     	ldr	x0, [x0, #0x980]
 1277914: 97f92171     	bl	0x10bfed8 <CloseNLSocket+0x410>
 1277918: 52800028     	mov	w8, #0x1                // =1
 127791c: 391d6e88     	strb	w8, [x20, #0x75b]
 1277920: 39437268     	ldrb	w8, [x19, #0xdc]
 1277924: 35000928     	cbnz	w8, 0x1277a48 <__start_il2cpp+0xd0284>
 1277928: 3947de68     	ldrb	w8, [x19, #0x1f7]
 127792c: 350008e8     	cbnz	w8, 0x1277a48 <__start_il2cpp+0xd0284>
 1277930: 39437a68     	ldrb	w8, [x19, #0xde]
 1277934: 350008a8     	cbnz	w8, 0x1277a48 <__start_il2cpp+0xd0284>
 1277938: 39441268     	ldrb	w8, [x19, #0x104]
 127793c: 35000868     	cbnz	w8, 0x1277a48 <__start_il2cpp+0xd0284>
 1277940: 39441a68     	ldrb	w8, [x19, #0x106]
 1277944: 35000828     	cbnz	w8, 0x1277a48 <__start_il2cpp+0xd0284>
 1277948: f9403a68     	ldr	x8, [x19, #0x70]
 127794c: b4000848     	cbz	x8, 0x1277a54 <__start_il2cpp+0xd0290>
 1277950: 39436109     	ldrb	w9, [x8, #0xd8]
 1277954: 350007a9     	cbnz	w9, 0x1277a48 <__start_il2cpp+0xd0284>
 1277958: 3943c108     	ldrb	w8, [x8, #0xf0]
 127795c: 35000768     	cbnz	w8, 0x1277a48 <__start_il2cpp+0xd0284>
 1277960: bd412660     	ldr	s0, [x19, #0x124]
 1277964: bd418e61     	ldr	s1, [x19, #0x18c]
 1277968: 1e212000     	fcmp	s0, s1
 127796c: 540006ed     	b.le	0x1277a48 <__start_il2cpp+0xd0284>
 1277970: bd419261     	ldr	s1, [x19, #0x190]
 1277974: 1e212000     	fcmp	s0, s1
 1277978: 54000685     	b.pl	0x1277a48 <__start_il2cpp+0xd0284>
 127797c: f9412e60     	ldr	x0, [x19, #0x258]
 1277980: b40006a0     	cbz	x0, 0x1277a54 <__start_il2cpp+0xd0290>
 1277984: 1e2e1000     	fmov	s0, #1.00000000
 1277988: 52800041     	mov	w1, #0x2                // =2
 127798c: aa1f03e2     	mov	x2, xzr
 1277990: 9400770b     	bl	0x12955bc <__start_il2cpp+0xeddf8>
 1277994: f9405e60     	ldr	x0, [x19, #0xb8]
 1277998: b40005e0     	cbz	x0, 0x1277a54 <__start_il2cpp+0xd0290>
 127799c: f9405a74     	ldr	x20, [x19, #0xb0]
 12779a0: aa1f03e1     	mov	x1, xzr
 12779a4: 9400bb1a     	bl	0x12a660c <__start_il2cpp+0xfee48>
 12779a8: b4000574     	cbz	x20, 0x1277a54 <__start_il2cpp+0xd0290>
 12779ac: 2a0003e1     	mov	w1, w0
 12779b0: aa1403e0     	mov	x0, x20
 12779b4: 52800022     	mov	w2, #0x1                // =1
 12779b8: 12800003     	mov	w3, #-0x1               // =-1
 12779bc: aa1f03e4     	mov	x4, xzr
 12779c0: 94005847     	bl	0x128dadc <__start_il2cpp+0xe6318>
 12779c4: f9405a60     	ldr	x0, [x19, #0xb0]
 12779c8: b4000460     	cbz	x0, 0x1277a54 <__start_il2cpp+0xd0290>
 12779cc: aa1f03e1     	mov	x1, xzr
 12779d0: 940057e9     	bl	0x128d974 <__start_il2cpp+0xe61b0>
 12779d4: f9405a60     	ldr	x0, [x19, #0xb0]
 12779d8: b40003e0     	cbz	x0, 0x1277a54 <__start_il2cpp+0xd0290>
 12779dc: f000af48     	adrp	x8, 0x2862000
 12779e0: f000af49     	adrp	x9, 0x2862000
 12779e4: f944bd08     	ldr	x8, [x8, #0x978]
 12779e8: f944c129     	ldr	x9, [x9, #0x980]
 12779ec: 52800021     	mov	w1, #0x1                // =1
 12779f0: aa1f03e4     	mov	x4, xzr
 12779f4: f9400102     	ldr	x2, [x8]
 12779f8: f9400123     	ldr	x3, [x9]
 12779fc: 52800034     	mov	w20, #0x1               // =1
 1277a00: 94004367     	bl	0x128879c <__start_il2cpp+0xe0fd8>
 1277a04: f9403a60     	ldr	x0, [x19, #0x70]
 1277a08: b4000260     	cbz	x0, 0x1277a54 <__start_il2cpp+0xd0290>
 1277a0c: bd419660     	ldr	s0, [x19, #0x194]
 1277a10: bd412661     	ldr	s1, [x19, #0x124]
 1277a14: 2a1f03e1     	mov	w1, wzr
 1277a18: aa1f03e2     	mov	x2, xzr
 1277a1c: 1e213800     	fsub	s0, s0, s1
 1277a20: 940084aa     	bl	0x1298cc8 <__start_il2cpp+0xf1504>
 1277a24: 3945b268     	ldrb	w8, [x19, #0x16c]
 1277a28: 3903d274     	strb	w20, [x19, #0xf4]
 1277a2c: 350000e8     	cbnz	w8, 0x1277a48 <__start_il2cpp+0xd0284>
 1277a30: f9403a68     	ldr	x8, [x19, #0x70]
 1277a34: 52800029     	mov	w9, #0x1                // =1
 1277a38: 3905b269     	strb	w9, [x19, #0x16c]
 1277a3c: b40000c8     	cbz	x8, 0x1277a54 <__start_il2cpp+0xd0290>
 1277a40: b9413908     	ldr	w8, [x8, #0x138]
 1277a44: b9017268     	str	w8, [x19, #0x170]
 1277a48: a9414ff4     	ldp	x20, x19, [sp, #0x10]
 1277a4c: f84207fe     	ldr	x30, [sp], #0x20
 1277a50: d65f03c0     	ret
 1277a54: 97f921ab     	bl	0x10c0100 <CloseNLSocket+0x638>
