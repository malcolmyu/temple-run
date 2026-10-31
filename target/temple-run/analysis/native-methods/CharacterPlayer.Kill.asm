
/tmp/temple-libil2cpp.so:	file format elf64-littleaarch64

Disassembly of section il2cpp:

00000000011a77c4 <__start_il2cpp>:
 1297eb0: f81e0ffe     	str	x30, [sp, #-0x20]!
 1297eb4: a9014ff4     	stp	x20, x19, [sp, #0x10]
 1297eb8: 52800028     	mov	w8, #0x1                // =1
 1297ebc: 2a0103f4     	mov	w20, w1
 1297ec0: aa0003f3     	mov	x19, x0
 1297ec4: 39036008     	strb	w8, [x0, #0xd8]
 1297ec8: b900e001     	str	w1, [x0, #0xe0]
 1297ecc: 94000103     	bl	0x12982d8 <__start_il2cpp+0xf0b14>
 1297ed0: f940de68     	ldr	x8, [x19, #0x1b8]
 1297ed4: bd00ea60     	str	s0, [x19, #0xe8]
 1297ed8: f9001e7f     	str	xzr, [x19, #0x38]
 1297edc: b900367f     	str	wzr, [x19, #0x34]
 1297ee0: b4000428     	cbz	x8, 0x1297f64 <__start_il2cpp+0xf07a0>
 1297ee4: f9401500     	ldr	x0, [x8, #0x28]
 1297ee8: b40003e0     	cbz	x0, 0x1297f64 <__start_il2cpp+0xf07a0>
 1297eec: aa1f03e1     	mov	x1, xzr
 1297ef0: 9447dfc2     	bl	0x248fdf8 <__start_il2cpp+0x12e8634>
 1297ef4: 7100069f     	cmp	w20, #0x1
 1297ef8: 54000140     	b.eq	0x1297f20 <__start_il2cpp+0xf075c>
 1297efc: 71001a9f     	cmp	w20, #0x6
 1297f00: 54000240     	b.eq	0x1297f48 <__start_il2cpp+0xf0784>
 1297f04: 7100169f     	cmp	w20, #0x5
 1297f08: 54000161     	b.ne	0x1297f34 <__start_il2cpp+0xf0770>
 1297f0c: f940de60     	ldr	x0, [x19, #0x1b8]
 1297f10: b40002a0     	cbz	x0, 0x1297f64 <__start_il2cpp+0xf07a0>
 1297f14: 1e2e1000     	fmov	s0, #1.00000000
 1297f18: 52800341     	mov	w1, #0x1a               // =26
 1297f1c: 1400000a     	b	0x1297f44 <__start_il2cpp+0xf0780>
 1297f20: f940de60     	ldr	x0, [x19, #0x1b8]
 1297f24: b4000200     	cbz	x0, 0x1297f64 <__start_il2cpp+0xf07a0>
 1297f28: 1e2e1000     	fmov	s0, #1.00000000
 1297f2c: 52800381     	mov	w1, #0x1c               // =28
 1297f30: 14000005     	b	0x1297f44 <__start_il2cpp+0xf0780>
 1297f34: f940de60     	ldr	x0, [x19, #0x1b8]
 1297f38: b4000160     	cbz	x0, 0x1297f64 <__start_il2cpp+0xf07a0>
 1297f3c: 1e2e1000     	fmov	s0, #1.00000000
 1297f40: 528003a1     	mov	w1, #0x1d               // =29
 1297f44: 97fff59e     	bl	0x12955bc <__start_il2cpp+0xeddf8>
 1297f48: f9400268     	ldr	x8, [x19]
 1297f4c: aa1303e0     	mov	x0, x19
 1297f50: a9414ff4     	ldp	x20, x19, [sp, #0x10]
 1297f54: 2a1f03e1     	mov	w1, wzr
 1297f58: a9588903     	ldp	x3, x2, [x8, #0x188]
 1297f5c: f84207fe     	ldr	x30, [sp], #0x20
 1297f60: d61f0060     	br	x3
 1297f64: 97f8a067     	bl	0x10c0100 <CloseNLSocket+0x638>
