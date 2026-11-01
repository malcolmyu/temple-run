
/tmp/temple-libil2cpp.so:	file format elf64-littleaarch64

Disassembly of section il2cpp:

00000000011a77c4 <__start_il2cpp>:
 1270b14: d10103ff     	sub	sp, sp, #0x40
 1270b18: fd000be8     	str	d8, [sp, #0x10]
 1270b1c: a90257fe     	stp	x30, x21, [sp, #0x20]
 1270b20: a9034ff4     	stp	x20, x19, [sp, #0x30]
 1270b24: b000be34     	adrp	x20, 0x2a35000
 1270b28: 395d2688     	ldrb	w8, [x20, #0x749]
 1270b2c: aa0003f3     	mov	x19, x0
 1270b30: 370000c8     	tbnz	w8, #0x0, 0x1270b48 <__start_il2cpp+0xc9384>
 1270b34: d000af80     	adrp	x0, 0x2862000
 1270b38: f9424800     	ldr	x0, [x0, #0x490]
 1270b3c: 97f93ce7     	bl	0x10bfed8 <CloseNLSocket+0x410>
 1270b40: 52800028     	mov	w8, #0x1                // =1
 1270b44: 391d2688     	strb	w8, [x20, #0x749]
 1270b48: f9403a68     	ldr	x8, [x19, #0x70]
 1270b4c: b4000728     	cbz	x8, 0x1270c30 <__start_il2cpp+0xc946c>
 1270b50: d000af94     	adrp	x20, 0x2862000
 1270b54: f9424a94     	ldr	x20, [x20, #0x490]
 1270b58: 39455115     	ldrb	w21, [x8, #0x154]
 1270b5c: f9400280     	ldr	x0, [x20]
 1270b60: b940e009     	ldr	w9, [x0, #0xe0]
 1270b64: 35000069     	cbnz	w9, 0x1270b70 <__start_il2cpp+0xc93ac>
 1270b68: 97f93d1e     	bl	0x10bffe0 <CloseNLSocket+0x518>
 1270b6c: f9400280     	ldr	x0, [x20]
 1270b70: f9405c08     	ldr	x8, [x0, #0xb8]
 1270b74: 34000235     	cbz	w21, 0x1270bb8 <__start_il2cpp+0xc93f4>
 1270b78: 52800029     	mov	w9, #0x1                // =1
 1270b7c: 39001109     	strb	w9, [x8, #0x4]
 1270b80: f9403a69     	ldr	x9, [x19, #0x70]
 1270b84: b4000569     	cbz	x9, 0x1270c30 <__start_il2cpp+0xc946c>
 1270b88: bd415920     	ldr	s0, [x9, #0x158]
 1270b8c: b940e009     	ldr	w9, [x0, #0xe0]
 1270b90: 1e209001     	fmov	s1, #2.50000000
 1270b94: 1e212000     	fcmp	s0, s1
 1270b98: 54000169     	b.ls	0x1270bc4 <__start_il2cpp+0xc9400>
 1270b9c: 1e2e1000     	fmov	s0, #1.00000000
 1270ba0: 350003a9     	cbnz	w9, 0x1270c14 <__start_il2cpp+0xc9450>
 1270ba4: 97f93d0f     	bl	0x10bffe0 <CloseNLSocket+0x518>
 1270ba8: f9400288     	ldr	x8, [x20]
 1270bac: 1e2e1000     	fmov	s0, #1.00000000
 1270bb0: f9405d08     	ldr	x8, [x8, #0xb8]
 1270bb4: 14000018     	b	0x1270c14 <__start_il2cpp+0xc9450>
 1270bb8: 1e2e1000     	fmov	s0, #1.00000000
 1270bbc: 3900111f     	strb	wzr, [x8, #0x4]
 1270bc0: 14000015     	b	0x1270c14 <__start_il2cpp+0xc9450>
 1270bc4: 35000089     	cbnz	w9, 0x1270bd4 <__start_il2cpp+0xc9410>
 1270bc8: 97f93d06     	bl	0x10bffe0 <CloseNLSocket+0x518>
 1270bcc: f9400288     	ldr	x8, [x20]
 1270bd0: f9405d08     	ldr	x8, [x8, #0xb8]
 1270bd4: bd405908     	ldr	s8, [x8, #0x58]
 1270bd8: aa1f03e0     	mov	x0, xzr
 1270bdc: 94493a1d     	bl	0x24bf450 <__start_il2cpp+0x1317c8c>
 1270be0: f9400280     	ldr	x0, [x20]
 1270be4: 1e202800     	fadd	s0, s0, s0
 1270be8: 1e203900     	fsub	s0, s8, s0
 1270bec: 1e202008     	fcmp	s0, #0.0
 1270bf0: b940e008     	ldr	w8, [x0, #0xe0]
 1270bf4: 1e2e1001     	fmov	s1, #1.00000000
 1270bf8: 1e218c00     	fcsel	s0, s0, s1, hi
 1270bfc: 350000a8     	cbnz	w8, 0x1270c10 <__start_il2cpp+0xc944c>
 1270c00: 3d8003e0     	str	q0, [sp]
 1270c04: 97f93cf7     	bl	0x10bffe0 <CloseNLSocket+0x518>
 1270c08: 3dc003e0     	ldr	q0, [sp]
 1270c0c: f9400280     	ldr	x0, [x20]
 1270c10: f9405c08     	ldr	x8, [x0, #0xb8]
 1270c14: a9434ff4     	ldp	x20, x19, [sp, #0x30]
 1270c18: a94257fe     	ldp	x30, x21, [sp, #0x20]
 1270c1c: fd400be8     	ldr	d8, [sp, #0x10]
 1270c20: 4e040400     	dup	v0.4s, v0.s[0]
 1270c24: 3c84c100     	stur	q0, [x8, #0x4c]
 1270c28: 910103ff     	add	sp, sp, #0x40
 1270c2c: d65f03c0     	ret
 1270c30: 97f93d34     	bl	0x10c0100 <CloseNLSocket+0x638>
