
/tmp/temple-libil2cpp.so:	file format elf64-littleaarch64

Disassembly of section il2cpp:

00000000011a77c4 <__start_il2cpp>:
 1277a58: f81e0ffe     	str	x30, [sp, #-0x20]!
 1277a5c: a9014ff4     	stp	x20, x19, [sp, #0x10]
 1277a60: d000bdf4     	adrp	x20, 0x2a35000
 1277a64: 395d7288     	ldrb	w8, [x20, #0x75c]
 1277a68: aa0003f3     	mov	x19, x0
 1277a6c: 37000128     	tbnz	w8, #0x0, 0x1277a90 <__start_il2cpp+0xd02cc>
 1277a70: f000af40     	adrp	x0, 0x2862000
 1277a74: f944c400     	ldr	x0, [x0, #0x988]
 1277a78: 97f92118     	bl	0x10bfed8 <CloseNLSocket+0x410>
 1277a7c: f000af40     	adrp	x0, 0x2862000
 1277a80: f944c800     	ldr	x0, [x0, #0x990]
 1277a84: 97f92115     	bl	0x10bfed8 <CloseNLSocket+0x410>
 1277a88: 52800028     	mov	w8, #0x1                // =1
 1277a8c: 391d7288     	strb	w8, [x20, #0x75c]
 1277a90: 39437268     	ldrb	w8, [x19, #0xdc]
 1277a94: 35000928     	cbnz	w8, 0x1277bb8 <__start_il2cpp+0xd03f4>
 1277a98: 3947de68     	ldrb	w8, [x19, #0x1f7]
 1277a9c: 350008e8     	cbnz	w8, 0x1277bb8 <__start_il2cpp+0xd03f4>
 1277aa0: 39437a68     	ldrb	w8, [x19, #0xde]
 1277aa4: 350008a8     	cbnz	w8, 0x1277bb8 <__start_il2cpp+0xd03f4>
 1277aa8: 39441268     	ldrb	w8, [x19, #0x104]
 1277aac: 35000868     	cbnz	w8, 0x1277bb8 <__start_il2cpp+0xd03f4>
 1277ab0: 39441a68     	ldrb	w8, [x19, #0x106]
 1277ab4: 35000828     	cbnz	w8, 0x1277bb8 <__start_il2cpp+0xd03f4>
 1277ab8: f9403a68     	ldr	x8, [x19, #0x70]
 1277abc: b4000848     	cbz	x8, 0x1277bc4 <__start_il2cpp+0xd0400>
 1277ac0: 39436109     	ldrb	w9, [x8, #0xd8]
 1277ac4: 350007a9     	cbnz	w9, 0x1277bb8 <__start_il2cpp+0xd03f4>
 1277ac8: 3943c108     	ldrb	w8, [x8, #0xf0]
 1277acc: 35000768     	cbnz	w8, 0x1277bb8 <__start_il2cpp+0xd03f4>
 1277ad0: bd412660     	ldr	s0, [x19, #0x124]
 1277ad4: bd418e61     	ldr	s1, [x19, #0x18c]
 1277ad8: 1e212000     	fcmp	s0, s1
 1277adc: 540006ed     	b.le	0x1277bb8 <__start_il2cpp+0xd03f4>
 1277ae0: bd419261     	ldr	s1, [x19, #0x190]
 1277ae4: 1e212000     	fcmp	s0, s1
 1277ae8: 54000685     	b.pl	0x1277bb8 <__start_il2cpp+0xd03f4>
 1277aec: f9412e60     	ldr	x0, [x19, #0x258]
 1277af0: b40006a0     	cbz	x0, 0x1277bc4 <__start_il2cpp+0xd0400>
 1277af4: 1e2e1000     	fmov	s0, #1.00000000
 1277af8: 52800041     	mov	w1, #0x2                // =2
 1277afc: aa1f03e2     	mov	x2, xzr
 1277b00: 940076af     	bl	0x12955bc <__start_il2cpp+0xeddf8>
 1277b04: f9405e60     	ldr	x0, [x19, #0xb8]
 1277b08: b40005e0     	cbz	x0, 0x1277bc4 <__start_il2cpp+0xd0400>
 1277b0c: f9405a74     	ldr	x20, [x19, #0xb0]
 1277b10: aa1f03e1     	mov	x1, xzr
 1277b14: 9400babe     	bl	0x12a660c <__start_il2cpp+0xfee48>
 1277b18: b4000574     	cbz	x20, 0x1277bc4 <__start_il2cpp+0xd0400>
 1277b1c: 2a0003e1     	mov	w1, w0
 1277b20: aa1403e0     	mov	x0, x20
 1277b24: 52800042     	mov	w2, #0x2                // =2
 1277b28: 12800003     	mov	w3, #-0x1               // =-1
 1277b2c: aa1f03e4     	mov	x4, xzr
 1277b30: 940057eb     	bl	0x128dadc <__start_il2cpp+0xe6318>
 1277b34: f9405a60     	ldr	x0, [x19, #0xb0]
 1277b38: b4000460     	cbz	x0, 0x1277bc4 <__start_il2cpp+0xd0400>
 1277b3c: aa1f03e1     	mov	x1, xzr
 1277b40: 9400578d     	bl	0x128d974 <__start_il2cpp+0xe61b0>
 1277b44: f9405a60     	ldr	x0, [x19, #0xb0]
 1277b48: b40003e0     	cbz	x0, 0x1277bc4 <__start_il2cpp+0xd0400>
 1277b4c: f000af48     	adrp	x8, 0x2862000
 1277b50: f000af49     	adrp	x9, 0x2862000
 1277b54: f944c908     	ldr	x8, [x8, #0x990]
 1277b58: f944c529     	ldr	x9, [x9, #0x988]
 1277b5c: 52800021     	mov	w1, #0x1                // =1
 1277b60: aa1f03e4     	mov	x4, xzr
 1277b64: f9400102     	ldr	x2, [x8]
 1277b68: f9400123     	ldr	x3, [x9]
 1277b6c: 52800034     	mov	w20, #0x1               // =1
 1277b70: 9400430b     	bl	0x128879c <__start_il2cpp+0xe0fd8>
 1277b74: f9403a60     	ldr	x0, [x19, #0x70]
 1277b78: b4000260     	cbz	x0, 0x1277bc4 <__start_il2cpp+0xd0400>
 1277b7c: bd419a60     	ldr	s0, [x19, #0x198]
 1277b80: bd412661     	ldr	s1, [x19, #0x124]
 1277b84: 2a1f03e1     	mov	w1, wzr
 1277b88: aa1f03e2     	mov	x2, xzr
 1277b8c: 1e213800     	fsub	s0, s0, s1
 1277b90: 9400844e     	bl	0x1298cc8 <__start_il2cpp+0xf1504>
 1277b94: 3945b268     	ldrb	w8, [x19, #0x16c]
 1277b98: 3903d674     	strb	w20, [x19, #0xf5]
 1277b9c: 350000e8     	cbnz	w8, 0x1277bb8 <__start_il2cpp+0xd03f4>
 1277ba0: f9403a68     	ldr	x8, [x19, #0x70]
 1277ba4: 52800029     	mov	w9, #0x1                // =1
 1277ba8: 3905b269     	strb	w9, [x19, #0x16c]
 1277bac: b40000c8     	cbz	x8, 0x1277bc4 <__start_il2cpp+0xd0400>
 1277bb0: b9413908     	ldr	w8, [x8, #0x138]
 1277bb4: b9017268     	str	w8, [x19, #0x170]
 1277bb8: a9414ff4     	ldp	x20, x19, [sp, #0x10]
 1277bbc: f84207fe     	ldr	x30, [sp], #0x20
 1277bc0: d65f03c0     	ret
 1277bc4: 97f9214f     	bl	0x10c0100 <CloseNLSocket+0x638>
