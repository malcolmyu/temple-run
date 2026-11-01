
/tmp/temple-libil2cpp.so:	file format elf64-littleaarch64

Disassembly of section il2cpp:

00000000011a77c4 <__start_il2cpp>:
 1272ee4: f81e0ffe     	str	x30, [sp, #-0x20]!
 1272ee8: a9014ff4     	stp	x20, x19, [sp, #0x10]
 1272eec: f000be14     	adrp	x20, 0x2a35000
 1272ef0: 395dd288     	ldrb	w8, [x20, #0x774]
 1272ef4: 2a0003f3     	mov	w19, w0
 1272ef8: 37000128     	tbnz	w8, #0x0, 0x1272f1c <__start_il2cpp+0xcb758>
 1272efc: 9000af60     	adrp	x0, 0x285e000
 1272f00: f9414000     	ldr	x0, [x0, #0x280]
 1272f04: 97f933f5     	bl	0x10bfed8 <CloseNLSocket+0x410>
 1272f08: b000af60     	adrp	x0, 0x285f000
 1272f0c: f943f800     	ldr	x0, [x0, #0x7f0]
 1272f10: 97f933f2     	bl	0x10bfed8 <CloseNLSocket+0x410>
 1272f14: 52800028     	mov	w8, #0x1                // =1
 1272f18: 391dd288     	strb	w8, [x20, #0x774]
 1272f1c: 71000e7f     	cmp	w19, #0x3
 1272f20: 1e2703e0     	fmov	s0, wzr
 1272f24: 540002c8     	b.hi	0x1272f7c <__start_il2cpp+0xcb7b8>
 1272f28: 9000af74     	adrp	x20, 0x285e000
 1272f2c: f9414294     	ldr	x20, [x20, #0x280]
 1272f30: f9400280     	ldr	x0, [x20]
 1272f34: b940e008     	ldr	w8, [x0, #0xe0]
 1272f38: 35000068     	cbnz	w8, 0x1272f44 <__start_il2cpp+0xcb780>
 1272f3c: 97f93429     	bl	0x10bffe0 <CloseNLSocket+0x518>
 1272f40: f9400280     	ldr	x0, [x20]
 1272f44: f9405c08     	ldr	x8, [x0, #0xb8]
 1272f48: f9401508     	ldr	x8, [x8, #0x28]
 1272f4c: b40001e8     	cbz	x8, 0x1272f88 <__start_il2cpp+0xcb7c4>
 1272f50: f9402500     	ldr	x0, [x8, #0x48]
 1272f54: b40001a0     	cbz	x0, 0x1272f88 <__start_il2cpp+0xcb7c4>
 1272f58: b000af68     	adrp	x8, 0x285f000
 1272f5c: f943f908     	ldr	x8, [x8, #0x7f0]
 1272f60: 2a1303e1     	mov	w1, w19
 1272f64: f9400102     	ldr	x2, [x8]
 1272f68: 9419b3d5     	bl	0x18dfebc <__start_il2cpp+0x7386f8>
 1272f6c: 52a85908     	mov	w8, #0x42c80000         // =1120403456
 1272f70: 1e220000     	scvtf	s0, w0
 1272f74: 1e270101     	fmov	s1, w8
 1272f78: 1e211800     	fdiv	s0, s0, s1
 1272f7c: a9414ff4     	ldp	x20, x19, [sp, #0x10]
 1272f80: f84207fe     	ldr	x30, [sp], #0x20
 1272f84: d65f03c0     	ret
 1272f88: 97f9345e     	bl	0x10c0100 <CloseNLSocket+0x638>
