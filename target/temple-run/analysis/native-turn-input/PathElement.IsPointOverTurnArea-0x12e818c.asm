
/tmp/temple-libil2cpp.so:	file format elf64-littleaarch64

Disassembly of section il2cpp:

00000000011a77c4 <__start_il2cpp>:
 12e818c: 6dbc2beb     	stp	d11, d10, [sp, #-0x40]!
 12e8190: 6d0123e9     	stp	d9, d8, [sp, #0x10]
 12e8194: f90013fe     	str	x30, [sp, #0x20]
 12e8198: a9034ff4     	stp	x20, x19, [sp, #0x30]
 12e819c: b000ba74     	adrp	x20, 0x2a35000
 12e81a0: 396c9e88     	ldrb	w8, [x20, #0xb27]
 12e81a4: 4ea21c4a     	mov	v10.16b, v2.16b
 12e81a8: 4ea11c28     	mov	v8.16b, v1.16b
 12e81ac: 4ea01c09     	mov	v9.16b, v0.16b
 12e81b0: aa0003f3     	mov	x19, x0
 12e81b4: 370000c8     	tbnz	w8, #0x0, 0x12e81cc <__start_il2cpp+0x140a08>
 12e81b8: d000abc0     	adrp	x0, 0x2862000
 12e81bc: f9424800     	ldr	x0, [x0, #0x490]
 12e81c0: 97f75f46     	bl	0x10bfed8 <CloseNLSocket+0x410>
 12e81c4: 52800028     	mov	w8, #0x1                // =1
 12e81c8: 392c9e88     	strb	w8, [x20, #0xb27]
 12e81cc: aa1303e0     	mov	x0, x19
 12e81d0: 97ffe9b8     	bl	0x12e28b0 <__start_il2cpp+0x13b0ec>
 12e81d4: 360004e0     	tbz	w0, #0x0, 0x12e8270 <__start_il2cpp+0x140aac>
 12e81d8: d000abd4     	adrp	x20, 0x2862000
 12e81dc: f9424a94     	ldr	x20, [x20, #0x490]
 12e81e0: f9400280     	ldr	x0, [x20]
 12e81e4: b940e008     	ldr	w8, [x0, #0xe0]
 12e81e8: 35000048     	cbnz	w8, 0x12e81f0 <__start_il2cpp+0x140a2c>
 12e81ec: 97f75f7d     	bl	0x10bffe0 <CloseNLSocket+0x518>
 12e81f0: aa1303e0     	mov	x0, x19
 12e81f4: aa1f03e1     	mov	x1, xzr
 12e81f8: 944737c5     	bl	0x24b610c <__start_il2cpp+0x130e948>
 12e81fc: b4000460     	cbz	x0, 0x12e8288 <__start_il2cpp+0x140ac4>
 12e8200: aa1f03e1     	mov	x1, xzr
 12e8204: 9447691c     	bl	0x24c2674 <__start_il2cpp+0x131aeb0>
 12e8208: aa1303e0     	mov	x0, x19
 12e820c: aa1f03e1     	mov	x1, xzr
 12e8210: 4ea01c0b     	mov	v11.16b, v0.16b
 12e8214: 944737be     	bl	0x24b610c <__start_il2cpp+0x130e948>
 12e8218: b4000380     	cbz	x0, 0x12e8288 <__start_il2cpp+0x140ac4>
 12e821c: aa1f03e1     	mov	x1, xzr
 12e8220: 94476915     	bl	0x24c2674 <__start_il2cpp+0x131aeb0>
 12e8224: f9400288     	ldr	x8, [x20]
 12e8228: 1e2a3963     	fsub	s3, s11, s10
 12e822c: 2a1f03e0     	mov	w0, wzr
 12e8230: 1e2a3840     	fsub	s0, s2, s10
 12e8234: f9405d08     	ldr	x8, [x8, #0xb8]
 12e8238: 1e2a2941     	fadd	s1, s10, s10
 12e823c: 1e232120     	fcmp	s9, s3
 12e8240: 2d0d0103     	stp	s3, s0, [x8, #0x68]
 12e8244: 2d0e0501     	stp	s1, s1, [x8, #0x70]
 12e8248: 5400016b     	b.lt	0x12e8274 <__start_il2cpp+0x140ab0>
 12e824c: 1e232822     	fadd	s2, s1, s3
 12e8250: 1e222120     	fcmp	s9, s2
 12e8254: 54000105     	b.pl	0x12e8274 <__start_il2cpp+0x140ab0>
 12e8258: 1e202100     	fcmp	s8, s0
 12e825c: 540000cb     	b.lt	0x12e8274 <__start_il2cpp+0x140ab0>
 12e8260: 1e202820     	fadd	s0, s1, s0
 12e8264: 1e202100     	fcmp	s8, s0
 12e8268: 1a9f57e0     	cset	w0, mi
 12e826c: 14000002     	b	0x12e8274 <__start_il2cpp+0x140ab0>
 12e8270: 2a1f03e0     	mov	w0, wzr
 12e8274: a9434ff4     	ldp	x20, x19, [sp, #0x30]
 12e8278: f94013fe     	ldr	x30, [sp, #0x20]
 12e827c: 6d4123e9     	ldp	d9, d8, [sp, #0x10]
 12e8280: 6cc42beb     	ldp	d11, d10, [sp], #0x40
 12e8284: d65f03c0     	ret
 12e8288: 97f75f9e     	bl	0x10c0100 <CloseNLSocket+0x638>
