
/tmp/temple-libil2cpp.so:	file format elf64-littleaarch64

Disassembly of section il2cpp:

00000000011a77c4 <__start_il2cpp>:
 1298cc8: fc1e0fe8     	str	d8, [sp, #-0x20]!
 1298ccc: a9014ffe     	stp	x30, x19, [sp, #0x10]
 1298cd0: 3945d008     	ldrb	w8, [x0, #0x174]
 1298cd4: 4ea01c08     	mov	v8.16b, v0.16b
 1298cd8: aa0003f3     	mov	x19, x0
 1298cdc: 12000029     	and	w9, w1, #0x1
 1298ce0: 5280002a     	mov	w10, #0x1               // =1
 1298ce4: 3905d00a     	strb	w10, [x0, #0x174]
 1298ce8: 3905d409     	strb	w9, [x0, #0x175]
 1298cec: 35000148     	cbnz	w8, 0x1298d14 <__start_il2cpp+0xf1550>
 1298cf0: 36000061     	tbz	w1, #0x0, 0x1298cfc <__start_il2cpp+0xf1538>
 1298cf4: bd40ee60     	ldr	s0, [x19, #0xec]
 1298cf8: 14000003     	b	0x1298d04 <__start_il2cpp+0xf1540>
 1298cfc: aa1303e0     	mov	x0, x19
 1298d00: 97fffd76     	bl	0x12982d8 <__start_il2cpp+0xf0b14>
 1298d04: bd017e60     	str	s0, [x19, #0x17c]
 1298d08: 1e221000     	fmov	s0, #4.00000000
 1298d0c: aa1303e0     	mov	x0, x19
 1298d10: 97ffffc5     	bl	0x1298c24 <__start_il2cpp+0xf1460>
 1298d14: 52a84908     	mov	w8, #0x42480000         // =1112014848
 1298d18: bd411e60     	ldr	s0, [x19, #0x11c]
 1298d1c: 1e270101     	fmov	s1, w8
 1298d20: 1e212901     	fadd	s1, s8, s1
 1298d24: bd017a61     	str	s1, [x19, #0x178]
 1298d28: 1e249001     	fmov	s1, #10.00000000
 1298d2c: 1e212800     	fadd	s0, s0, s1
 1298d30: b901867f     	str	wzr, [x19, #0x184]
 1298d34: bd011e60     	str	s0, [x19, #0x11c]
 1298d38: a9414ffe     	ldp	x30, x19, [sp, #0x10]
 1298d3c: fc4207e8     	ldr	d8, [sp], #0x20
 1298d40: d65f03c0     	ret
