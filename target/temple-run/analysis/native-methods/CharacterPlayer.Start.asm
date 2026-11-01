
/tmp/temple-libil2cpp.so:	file format elf64-littleaarch64

Disassembly of section il2cpp:

00000000011a77c4 <__start_il2cpp>:
 1296e08: a9be57fe     	stp	x30, x21, [sp, #-0x20]!
 1296e0c: a9014ff4     	stp	x20, x19, [sp, #0x10]
 1296e10: f000bcf5     	adrp	x21, 0x2a35000
 1296e14: 9000ae54     	adrp	x20, 0x285e000
 1296e18: 39623ea8     	ldrb	w8, [x21, #0x88f]
 1296e1c: f9414294     	ldr	x20, [x20, #0x280]
 1296e20: aa0003f3     	mov	x19, x0
 1296e24: 37000128     	tbnz	w8, #0x0, 0x1296e48 <__start_il2cpp+0xef684>
 1296e28: 9000ae60     	adrp	x0, 0x2862000
 1296e2c: f9423000     	ldr	x0, [x0, #0x460]
 1296e30: 97f8a42a     	bl	0x10bfed8 <CloseNLSocket+0x410>
 1296e34: 9000ae40     	adrp	x0, 0x285e000
 1296e38: f9414000     	ldr	x0, [x0, #0x280]
 1296e3c: 97f8a427     	bl	0x10bfed8 <CloseNLSocket+0x410>
 1296e40: 52800028     	mov	w8, #0x1                // =1
 1296e44: 39223ea8     	strb	w8, [x21, #0x88f]
 1296e48: 52a83808     	mov	w8, #0x41c00000         // =1103101952
 1296e4c: b9018e68     	str	w8, [x19, #0x18c]
 1296e50: f9400280     	ldr	x0, [x20]
 1296e54: 9000ae74     	adrp	x20, 0x2862000
 1296e58: b940e008     	ldr	w8, [x0, #0xe0]
 1296e5c: f9423294     	ldr	x20, [x20, #0x460]
 1296e60: 35000048     	cbnz	w8, 0x1296e68 <__start_il2cpp+0xef6a4>
 1296e64: 97f8a45f     	bl	0x10bffe0 <CloseNLSocket+0x518>
 1296e68: aa1f03e0     	mov	x0, xzr
 1296e6c: 97ff84e3     	bl	0x12781f8 <__start_il2cpp+0xd0a34>
 1296e70: aa1f03e0     	mov	x0, xzr
 1296e74: bd00e660     	str	s0, [x19, #0xe4]
 1296e78: b900ea7f     	str	wzr, [x19, #0xe8]
 1296e7c: 97ff84f8     	bl	0x127825c <__start_il2cpp+0xd0a98>
 1296e80: b0ffa008     	adrp	x8, 0x697000
 1296e84: fd41c101     	ldr	d1, [x8, #0x380]
 1296e88: 91047268     	add	x8, x19, #0x11c
 1296e8c: bd00ee60     	str	s0, [x19, #0xec]
 1296e90: 52800029     	mov	w9, #0x1                // =1
 1296e94: fd000101     	str	d1, [x8]
 1296e98: 52800c88     	mov	w8, #0x64               // =100
 1296e9c: b9014269     	str	w9, [x19, #0x140]
 1296ea0: f900a67f     	str	xzr, [x19, #0x148]
 1296ea4: b9015268     	str	w8, [x19, #0x150]
 1296ea8: 3905b27f     	strb	wzr, [x19, #0x16c]
 1296eac: 3904ca7f     	strb	wzr, [x19, #0x132]
 1296eb0: 7902c27f     	strh	wzr, [x19, #0x160]
 1296eb4: 3905d27f     	strb	wzr, [x19, #0x174]
 1296eb8: b901867f     	str	wzr, [x19, #0x184]
 1296ebc: 3905527f     	strb	wzr, [x19, #0x154]
 1296ec0: f9400288     	ldr	x8, [x20]
 1296ec4: aa1303e0     	mov	x0, x19
 1296ec8: f9405d08     	ldr	x8, [x8, #0xb8]
 1296ecc: f9000113     	str	x19, [x8]
 1296ed0: f9400268     	ldr	x8, [x19]
 1296ed4: a9414ff4     	ldp	x20, x19, [sp, #0x10]
 1296ed8: a95a8502     	ldp	x2, x1, [x8, #0x1a8]
 1296edc: a8c257fe     	ldp	x30, x21, [sp], #0x20
 1296ee0: d61f0040     	br	x2
