
/tmp/temple-libil2cpp.so:	file format elf64-littleaarch64

Disassembly of section il2cpp:

00000000011a77c4 <__start_il2cpp>:
 1298c24: a9bf4ffe     	stp	x30, x19, [sp, #-0x10]!
 1298c28: 52800028     	mov	w8, #0x1                // =1
 1298c2c: aa0003f3     	mov	x19, x0
 1298c30: bd015800     	str	s0, [x0, #0x158]
 1298c34: 39055008     	strb	w8, [x0, #0x154]
 1298c38: b901841f     	str	wzr, [x0, #0x184]
 1298c3c: 97ffffb4     	bl	0x1298b0c <__start_il2cpp+0xf1348>
 1298c40: 3945d268     	ldrb	w8, [x19, #0x174]
 1298c44: 34000068     	cbz	w8, 0x1298c50 <__start_il2cpp+0xf148c>
 1298c48: a8c14ffe     	ldp	x30, x19, [sp], #0x10
 1298c4c: d65f03c0     	ret
 1298c50: f940de60     	ldr	x0, [x19, #0x1b8]
 1298c54: b40000a0     	cbz	x0, 0x1298c68 <__start_il2cpp+0xf14a4>
 1298c58: 1e2e1000     	fmov	s0, #1.00000000
 1298c5c: 52800321     	mov	w1, #0x19               // =25
 1298c60: a8c14ffe     	ldp	x30, x19, [sp], #0x10
 1298c64: 17fff256     	b	0x12955bc <__start_il2cpp+0xeddf8>
 1298c68: 97f89d26     	bl	0x10c0100 <CloseNLSocket+0x638>
