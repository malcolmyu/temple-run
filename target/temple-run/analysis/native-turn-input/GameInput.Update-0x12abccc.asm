
/tmp/temple-libil2cpp.so:	file format elf64-littleaarch64

Disassembly of section il2cpp:

00000000011a77c4 <__start_il2cpp>:
 12abccc: fc1e0fe8     	str	d8, [sp, #-0x20]!
 12abcd0: a9014ffe     	stp	x30, x19, [sp, #0x10]
 12abcd4: aa0003f3     	mov	x19, x0
 12abcd8: 9400002a     	bl	0x12abd80 <__start_il2cpp+0x1045bc>
 12abcdc: 39408a68     	ldrb	w8, [x19, #0x22]
 12abce0: 35000068     	cbnz	w8, 0x12abcec <__start_il2cpp+0x104528>
 12abce4: 39408668     	ldrb	w8, [x19, #0x21]
 12abce8: 34000168     	cbz	w8, 0x12abd14 <__start_il2cpp+0x104550>
 12abcec: bd402668     	ldr	s8, [x19, #0x24]
 12abcf0: aa1f03e0     	mov	x0, xzr
 12abcf4: 94484dd7     	bl	0x24bf450 <__start_il2cpp+0x1317c8c>
 12abcf8: 1e202900     	fadd	s0, s8, s0
 12abcfc: 1e2e1001     	fmov	s1, #1.00000000
 12abd00: 1e212000     	fcmp	s0, s1
 12abd04: bd002660     	str	s0, [x19, #0x24]
 12abd08: 5400006d     	b.le	0x12abd14 <__start_il2cpp+0x104550>
 12abd0c: 7802127f     	sturh	wzr, [x19, #0x21]
 12abd10: b900267f     	str	wzr, [x19, #0x24]
 12abd14: 3940b268     	ldrb	w8, [x19, #0x2c]
 12abd18: 34000168     	cbz	w8, 0x12abd44 <__start_il2cpp+0x104580>
 12abd1c: bd403268     	ldr	s8, [x19, #0x30]
 12abd20: aa1f03e0     	mov	x0, xzr
 12abd24: 94484dcb     	bl	0x24bf450 <__start_il2cpp+0x1317c8c>
 12abd28: 1e202900     	fadd	s0, s8, s0
 12abd2c: 1e2c1001     	fmov	s1, #0.50000000
 12abd30: 1e212000     	fcmp	s0, s1
 12abd34: bd003260     	str	s0, [x19, #0x30]
 12abd38: 5400006d     	b.le	0x12abd44 <__start_il2cpp+0x104580>
 12abd3c: 3900b27f     	strb	wzr, [x19, #0x2c]
 12abd40: b900327f     	str	wzr, [x19, #0x30]
 12abd44: 3940d268     	ldrb	w8, [x19, #0x34]
 12abd48: 34000168     	cbz	w8, 0x12abd74 <__start_il2cpp+0x1045b0>
 12abd4c: bd403a68     	ldr	s8, [x19, #0x38]
 12abd50: aa1f03e0     	mov	x0, xzr
 12abd54: 94484dbf     	bl	0x24bf450 <__start_il2cpp+0x1317c8c>
 12abd58: 1e202900     	fadd	s0, s8, s0
 12abd5c: 1e2c1001     	fmov	s1, #0.50000000
 12abd60: 1e212000     	fcmp	s0, s1
 12abd64: bd003a60     	str	s0, [x19, #0x38]
 12abd68: 5400006d     	b.le	0x12abd74 <__start_il2cpp+0x1045b0>
 12abd6c: 3900d27f     	strb	wzr, [x19, #0x34]
 12abd70: b9003a7f     	str	wzr, [x19, #0x38]
 12abd74: a9414ffe     	ldp	x30, x19, [sp, #0x10]
 12abd78: fc4207e8     	ldr	d8, [sp], #0x20
 12abd7c: d65f03c0     	ret
