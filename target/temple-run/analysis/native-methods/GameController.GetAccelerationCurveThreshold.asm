
/tmp/temple-libil2cpp.so:	file format elf64-littleaarch64

Disassembly of section il2cpp:

00000000011a77c4 <__start_il2cpp>:
 1272e3c: f81e0ffe     	str	x30, [sp, #-0x20]!
 1272e40: a9014ff4     	stp	x20, x19, [sp, #0x10]
 1272e44: f000be14     	adrp	x20, 0x2a35000
 1272e48: 395dce88     	ldrb	w8, [x20, #0x773]
 1272e4c: 2a0003f3     	mov	w19, w0
 1272e50: 37000128     	tbnz	w8, #0x0, 0x1272e74 <__start_il2cpp+0xcb6b0>
 1272e54: 9000af60     	adrp	x0, 0x285e000
 1272e58: f9414000     	ldr	x0, [x0, #0x280]
 1272e5c: 97f9341f     	bl	0x10bfed8 <CloseNLSocket+0x410>
 1272e60: b000af60     	adrp	x0, 0x285f000
 1272e64: f943f800     	ldr	x0, [x0, #0x7f0]
 1272e68: 97f9341c     	bl	0x10bfed8 <CloseNLSocket+0x410>
 1272e6c: 52800028     	mov	w8, #0x1                // =1
 1272e70: 391dce88     	strb	w8, [x20, #0x773]
 1272e74: 71000a7f     	cmp	w19, #0x2
 1272e78: 1e2703e0     	fmov	s0, wzr
 1272e7c: 540002c8     	b.hi	0x1272ed4 <__start_il2cpp+0xcb710>
 1272e80: 9000af74     	adrp	x20, 0x285e000
 1272e84: f9414294     	ldr	x20, [x20, #0x280]
 1272e88: f9400280     	ldr	x0, [x20]
 1272e8c: b940e008     	ldr	w8, [x0, #0xe0]
 1272e90: 35000068     	cbnz	w8, 0x1272e9c <__start_il2cpp+0xcb6d8>
 1272e94: 97f93453     	bl	0x10bffe0 <CloseNLSocket+0x518>
 1272e98: f9400280     	ldr	x0, [x20]
 1272e9c: f9405c08     	ldr	x8, [x0, #0xb8]
 1272ea0: f9401508     	ldr	x8, [x8, #0x28]
 1272ea4: b40001e8     	cbz	x8, 0x1272ee0 <__start_il2cpp+0xcb71c>
 1272ea8: f9402100     	ldr	x0, [x8, #0x40]
 1272eac: b40001a0     	cbz	x0, 0x1272ee0 <__start_il2cpp+0xcb71c>
 1272eb0: b000af68     	adrp	x8, 0x285f000
 1272eb4: f943f908     	ldr	x8, [x8, #0x7f0]
 1272eb8: 2a1303e1     	mov	w1, w19
 1272ebc: f9400102     	ldr	x2, [x8]
 1272ec0: 9419b3ff     	bl	0x18dfebc <__start_il2cpp+0x7386f8>
 1272ec4: 52a85908     	mov	w8, #0x42c80000         // =1120403456
 1272ec8: 1e220000     	scvtf	s0, w0
 1272ecc: 1e270101     	fmov	s1, w8
 1272ed0: 1e211800     	fdiv	s0, s0, s1
 1272ed4: a9414ff4     	ldp	x20, x19, [sp, #0x10]
 1272ed8: f84207fe     	ldr	x30, [sp], #0x20
 1272edc: d65f03c0     	ret
 1272ee0: 97f93488     	bl	0x10c0100 <CloseNLSocket+0x638>
