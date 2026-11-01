
/tmp/temple-libil2cpp.so:	file format elf64-littleaarch64

Disassembly of section il2cpp:

00000000011a77c4 <__start_il2cpp>:
 1297b80: fc1e0fe8     	str	d8, [sp, #-0x20]!
 1297b84: f90007fe     	str	x30, [sp, #0x8]
 1297b88: a9014ff4     	stp	x20, x19, [sp, #0x10]
 1297b8c: d000bcf4     	adrp	x20, 0x2a35000
 1297b90: 39625288     	ldrb	w8, [x20, #0x894]
 1297b94: 4ea01c08     	mov	v8.16b, v0.16b
 1297b98: aa0003f3     	mov	x19, x0
 1297b9c: 370000c8     	tbnz	w8, #0x0, 0x1297bb4 <__start_il2cpp+0xf03f0>
 1297ba0: 9000ae60     	adrp	x0, 0x2863000
 1297ba4: f946cc00     	ldr	x0, [x0, #0xd98]
 1297ba8: 97f8a0cc     	bl	0x10bfed8 <CloseNLSocket+0x410>
 1297bac: 52800028     	mov	w8, #0x1                // =1
 1297bb0: 39225288     	strb	w8, [x20, #0x894]
 1297bb4: 3943e268     	ldrb	w8, [x19, #0xf8]
 1297bb8: 350000a8     	cbnz	w8, 0x1297bcc <__start_il2cpp+0xf0408>
 1297bbc: 39443268     	ldrb	w8, [x19, #0x10c]
 1297bc0: 35000068     	cbnz	w8, 0x1297bcc <__start_il2cpp+0xf0408>
 1297bc4: 3943c268     	ldrb	w8, [x19, #0xf0]
 1297bc8: 340000c8     	cbz	w8, 0x1297be0 <__start_il2cpp+0xf041c>
 1297bcc: 2a1f03e0     	mov	w0, wzr
 1297bd0: a9414ff4     	ldp	x20, x19, [sp, #0x10]
 1297bd4: f94007fe     	ldr	x30, [sp, #0x8]
 1297bd8: fc4207e8     	ldr	d8, [sp], #0x20
 1297bdc: d65f03c0     	ret
 1297be0: 1e202108     	fcmp	s8, #0.0
 1297be4: 540000ad     	b.le	0x1297bf8 <__start_il2cpp+0xf0434>
 1297be8: 52800020     	mov	w0, #0x1                // =1
 1297bec: 3903e660     	strb	w0, [x19, #0xf9]
 1297bf0: bd00fe68     	str	s8, [x19, #0xfc]
 1297bf4: 17fffff7     	b	0x1297bd0 <__start_il2cpp+0xf040c>
 1297bf8: aa1303e0     	mov	x0, x19
 1297bfc: 940001b7     	bl	0x12982d8 <__start_il2cpp+0xf0b14>
 1297c00: 52a85408     	mov	w8, #0x42a00000         // =1117782016
 1297c04: 1e270108     	fmov	s8, w8
 1297c08: 1e282000     	fcmp	s0, s8
 1297c0c: 54000104     	b.mi	0x1297c2c <__start_il2cpp+0xf0468>
 1297c10: 52a85908     	mov	w8, #0x42c80000         // =1120403456
 1297c14: 1e270101     	fmov	s1, w8
 1297c18: 1e212000     	fcmp	s0, s1
 1297c1c: 4ea01c08     	mov	v8.16b, v0.16b
 1297c20: 5400006d     	b.le	0x1297c2c <__start_il2cpp+0xf0468>
 1297c24: 52a85908     	mov	w8, #0x42c80000         // =1120403456
 1297c28: 1e270108     	fmov	s8, w8
 1297c2c: f940de60     	ldr	x0, [x19, #0x1b8]
 1297c30: b4000220     	cbz	x0, 0x1297c74 <__start_il2cpp+0xf04b0>
 1297c34: 1e2e1000     	fmov	s0, #1.00000000
 1297c38: 52800181     	mov	w1, #0xc                // =12
 1297c3c: 97fff660     	bl	0x12955bc <__start_il2cpp+0xeddf8>
 1297c40: f9405260     	ldr	x0, [x19, #0xa0]
 1297c44: 52800028     	mov	w8, #0x1                // =1
 1297c48: 7901f268     	strh	w8, [x19, #0xf8]
 1297c4c: 3904027f     	strb	wzr, [x19, #0x100]
 1297c50: bd003a68     	str	s8, [x19, #0x38]
 1297c54: b4000100     	cbz	x0, 0x1297c74 <__start_il2cpp+0xf04b0>
 1297c58: 9000ae68     	adrp	x8, 0x2863000
 1297c5c: f946cd08     	ldr	x8, [x8, #0xd98]
 1297c60: aa1f03e2     	mov	x2, xzr
 1297c64: f9400101     	ldr	x1, [x8]
 1297c68: 9447d4b9     	bl	0x248cf4c <__start_il2cpp+0x12e5788>
 1297c6c: 52800020     	mov	w0, #0x1                // =1
 1297c70: 17ffffd8     	b	0x1297bd0 <__start_il2cpp+0xf040c>
 1297c74: 97f8a123     	bl	0x10c0100 <CloseNLSocket+0x638>
