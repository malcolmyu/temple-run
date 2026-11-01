
/tmp/temple-libil2cpp.so:	file format elf64-littleaarch64

Disassembly of section il2cpp:

00000000011a77c4 <__start_il2cpp>:
 12cbc14: fc1d0fe8     	str	d8, [sp, #-0x30]!
 12cbc18: a90157fe     	stp	x30, x21, [sp, #0x10]
 12cbc1c: a9024ff4     	stp	x20, x19, [sp, #0x20]
 12cbc20: d000bb55     	adrp	x21, 0x2a35000
 12cbc24: b000ac94     	adrp	x20, 0x285c000 <_ZTVN10__cxxabiv119__pointer_type_infoE+0x18>
 12cbc28: 39695ea8     	ldrb	w8, [x21, #0xa57]
 12cbc2c: f9456294     	ldr	x20, [x20, #0xac0]
 12cbc30: aa0003f3     	mov	x19, x0
 12cbc34: 370000c8     	tbnz	w8, #0x0, 0x12cbc4c <__start_il2cpp+0x124488>
 12cbc38: b000ac80     	adrp	x0, 0x285c000 <_ZTVN10__cxxabiv119__pointer_type_infoE+0x18>
 12cbc3c: f9456000     	ldr	x0, [x0, #0xac0]
 12cbc40: 97f7d0a6     	bl	0x10bfed8 <CloseNLSocket+0x410>
 12cbc44: 52800028     	mov	w8, #0x1                // =1
 12cbc48: 39295ea8     	strb	w8, [x21, #0xa57]
 12cbc4c: f9400280     	ldr	x0, [x20]
 12cbc50: f9402674     	ldr	x20, [x19, #0x48]
 12cbc54: b940e008     	ldr	w8, [x0, #0xe0]
 12cbc58: 35000048     	cbnz	w8, 0x12cbc60 <__start_il2cpp+0x12449c>
 12cbc5c: 97f7d0e1     	bl	0x10bffe0 <CloseNLSocket+0x518>
 12cbc60: aa1403e0     	mov	x0, x20
 12cbc64: aa1f03e1     	mov	x1, xzr
 12cbc68: aa1f03e2     	mov	x2, xzr
 12cbc6c: 9447b60b     	bl	0x24b9498 <__start_il2cpp+0x1311cd4>
 12cbc70: 370008c0     	tbnz	w0, #0x0, 0x12cbd88 <__start_il2cpp+0x1245c4>
 12cbc74: bd403a60     	ldr	s0, [x19, #0x38]
 12cbc78: 1e202008     	fcmp	s0, #0.0
 12cbc7c: 54000869     	b.ls	0x12cbd88 <__start_il2cpp+0x1245c4>
 12cbc80: f9402660     	ldr	x0, [x19, #0x48]
 12cbc84: b40008a0     	cbz	x0, 0x12cbd98 <__start_il2cpp+0x1245d4>
 12cbc88: aa1f03e1     	mov	x1, xzr
 12cbc8c: 9447a672     	bl	0x24b5654 <__start_il2cpp+0x130de90>
 12cbc90: 360007c0     	tbz	w0, #0x0, 0x12cbd88 <__start_il2cpp+0x1245c4>
 12cbc94: bd405268     	ldr	s8, [x19, #0x50]
 12cbc98: aa1f03e0     	mov	x0, xzr
 12cbc9c: 9447cded     	bl	0x24bf450 <__start_il2cpp+0x1317c8c>
 12cbca0: 1e203900     	fsub	s0, s8, s0
 12cbca4: 1e202008     	fcmp	s0, #0.0
 12cbca8: bd005260     	str	s0, [x19, #0x50]
 12cbcac: 540006e8     	b.hi	0x12cbd88 <__start_il2cpp+0x1245c4>
 12cbcb0: bd403a61     	ldr	s1, [x19, #0x38]
 12cbcb4: 52a84e08     	mov	w8, #0x42700000         // =1114636288
 12cbcb8: 1e270102     	fmov	s2, w8
 12cbcbc: f9401274     	ldr	x20, [x19, #0x20]
 12cbcc0: 1e211841     	fdiv	s1, s2, s1
 12cbcc4: 1e221821     	fdiv	s1, s1, s2
 12cbcc8: 1e212800     	fadd	s0, s0, s1
 12cbccc: 91010260     	add	x0, x19, #0x40
 12cbcd0: aa1f03e1     	mov	x1, xzr
 12cbcd4: bd005260     	str	s0, [x19, #0x50]
 12cbcd8: 942f598f     	bl	0x1ea2314 <__start_il2cpp+0xcfab50>
 12cbcdc: f9401662     	ldr	x2, [x19, #0x28]
 12cbce0: aa0003e1     	mov	x1, x0
 12cbce4: aa1403e0     	mov	x0, x20
 12cbce8: aa1f03e3     	mov	x3, xzr
 12cbcec: 9429e059     	bl	0x1d43e50 <__start_il2cpp+0xb9c68c>
 12cbcf0: f9402668     	ldr	x8, [x19, #0x48]
 12cbcf4: b4000528     	cbz	x8, 0x12cbd98 <__start_il2cpp+0x1245d4>
 12cbcf8: aa0003e1     	mov	x1, x0
 12cbcfc: aa0803e0     	mov	x0, x8
 12cbd00: aa1f03e2     	mov	x2, xzr
 12cbd04: 97feca45     	bl	0x127e618 <__start_il2cpp+0xd6e54>
 12cbd08: f9402660     	ldr	x0, [x19, #0x48]
 12cbd0c: b4000460     	cbz	x0, 0x12cbd98 <__start_il2cpp+0x1245d4>
 12cbd10: f9400008     	ldr	x8, [x0]
 12cbd14: a95a8509     	ldp	x9, x1, [x8, #0x1a8]
 12cbd18: d63f0120     	blr	x9
 12cbd1c: b9404269     	ldr	w9, [x19, #0x40]
 12cbd20: b940566a     	ldr	w10, [x19, #0x54]
 12cbd24: 29462e68     	ldp	w8, w11, [x19, #0x30]
 12cbd28: 0b090149     	add	w9, w10, w9
 12cbd2c: 0b08016a     	add	w10, w11, w8
 12cbd30: 6b0a013f     	cmp	w9, w10
 12cbd34: b9004269     	str	w9, [x19, #0x40]
 12cbd38: 54000201     	b.ne	0x12cbd78 <__start_il2cpp+0x1245b4>
 12cbd3c: 3940f66a     	ldrb	w10, [x19, #0x3d]
 12cbd40: 3400008a     	cbz	w10, 0x12cbd50 <__start_il2cpp+0x12458c>
 12cbd44: 1280000a     	mov	w10, #-0x1              // =-1
 12cbd48: b900566a     	str	w10, [x19, #0x54]
 12cbd4c: 1400000b     	b	0x12cbd78 <__start_il2cpp+0x1245b4>
 12cbd50: 3940f269     	ldrb	w9, [x19, #0x3c]
 12cbd54: b9004268     	str	w8, [x19, #0x40]
 12cbd58: 34000149     	cbz	w9, 0x12cbd80 <__start_il2cpp+0x1245bc>
 12cbd5c: f9402660     	ldr	x0, [x19, #0x48]
 12cbd60: b40001c0     	cbz	x0, 0x12cbd98 <__start_il2cpp+0x1245d4>
 12cbd64: 2a1f03e1     	mov	w1, wzr
 12cbd68: aa1f03e2     	mov	x2, xzr
 12cbd6c: 9447a649     	bl	0x24b5690 <__start_il2cpp+0x130decc>
 12cbd70: b9404269     	ldr	w9, [x19, #0x40]
 12cbd74: b9403268     	ldr	w8, [x19, #0x30]
 12cbd78: 6b08013f     	cmp	w9, w8
 12cbd7c: 54000061     	b.ne	0x12cbd88 <__start_il2cpp+0x1245c4>
 12cbd80: 52800028     	mov	w8, #0x1                // =1
 12cbd84: b9005668     	str	w8, [x19, #0x54]
 12cbd88: a9424ff4     	ldp	x20, x19, [sp, #0x20]
 12cbd8c: a94157fe     	ldp	x30, x21, [sp, #0x10]
 12cbd90: fc4307e8     	ldr	d8, [sp], #0x30
 12cbd94: d65f03c0     	ret
 12cbd98: 97f7d0da     	bl	0x10c0100 <CloseNLSocket+0x638>
