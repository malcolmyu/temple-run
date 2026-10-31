
/tmp/temple-libil2cpp.so:	file format elf64-littleaarch64

Disassembly of section il2cpp:

00000000011a77c4 <__start_il2cpp>:
 1266dec: fc1c0fe8     	str	d8, [sp, #-0x40]!
 1266df0: f90007fe     	str	x30, [sp, #0x8]
 1266df4: a9015ff8     	stp	x24, x23, [sp, #0x10]
 1266df8: a90257f6     	stp	x22, x21, [sp, #0x20]
 1266dfc: a9034ff4     	stp	x20, x19, [sp, #0x30]
 1266e00: f000be74     	adrp	x20, 0x2a35000
 1266e04: 395c5288     	ldrb	w8, [x20, #0x714]
 1266e08: aa0003f3     	mov	x19, x0
 1266e0c: 370002a8     	tbnz	w8, #0x0, 0x1266e60 <__start_il2cpp+0xbf69c>
 1266e10: 9000afe0     	adrp	x0, 0x2862000
 1266e14: f940e800     	ldr	x0, [x0, #0x1d0]
 1266e18: 97f96430     	bl	0x10bfed8 <CloseNLSocket+0x410>
 1266e1c: 9000afe0     	adrp	x0, 0x2862000
 1266e20: f940ec00     	ldr	x0, [x0, #0x1d8]
 1266e24: 97f9642d     	bl	0x10bfed8 <CloseNLSocket+0x410>
 1266e28: 9000afe0     	adrp	x0, 0x2862000
 1266e2c: f940dc00     	ldr	x0, [x0, #0x1b8]
 1266e30: 97f9642a     	bl	0x10bfed8 <CloseNLSocket+0x410>
 1266e34: 9000afe0     	adrp	x0, 0x2862000
 1266e38: f9410800     	ldr	x0, [x0, #0x210]
 1266e3c: 97f96427     	bl	0x10bfed8 <CloseNLSocket+0x410>
 1266e40: 9000afe0     	adrp	x0, 0x2862000
 1266e44: f9412800     	ldr	x0, [x0, #0x250]
 1266e48: 97f96424     	bl	0x10bfed8 <CloseNLSocket+0x410>
 1266e4c: 9000afe0     	adrp	x0, 0x2862000
 1266e50: f9416c00     	ldr	x0, [x0, #0x2d8]
 1266e54: 97f96421     	bl	0x10bfed8 <CloseNLSocket+0x410>
 1266e58: 52800028     	mov	w8, #0x1                // =1
 1266e5c: 391c5288     	strb	w8, [x20, #0x714]
 1266e60: f000be74     	adrp	x20, 0x2a35000
 1266e64: 395dee88     	ldrb	w8, [x20, #0x77b]
 1266e68: 350000c8     	cbnz	w8, 0x1266e80 <__start_il2cpp+0xbf6bc>
 1266e6c: f000afc0     	adrp	x0, 0x2861000
 1266e70: f941bc00     	ldr	x0, [x0, #0x378]
 1266e74: 97f96419     	bl	0x10bfed8 <CloseNLSocket+0x410>
 1266e78: 52800028     	mov	w8, #0x1                // =1
 1266e7c: 391dee88     	strb	w8, [x20, #0x77b]
 1266e80: f000afd4     	adrp	x20, 0x2861000
 1266e84: f941be94     	ldr	x20, [x20, #0x378]
 1266e88: 9000aff5     	adrp	x21, 0x2862000
 1266e8c: 9000aff8     	adrp	x24, 0x2862000
 1266e90: 9000aff7     	adrp	x23, 0x2862000
 1266e94: f9400280     	ldr	x0, [x20]
 1266e98: b940e008     	ldr	w8, [x0, #0xe0]
 1266e9c: f940eab5     	ldr	x21, [x21, #0x1d0]
 1266ea0: f940ef18     	ldr	x24, [x24, #0x1d8]
 1266ea4: f9412af7     	ldr	x23, [x23, #0x250]
 1266ea8: 35000068     	cbnz	w8, 0x1266eb4 <__start_il2cpp+0xbf6f0>
 1266eac: 97f9644d     	bl	0x10bffe0 <CloseNLSocket+0x518>
 1266eb0: f9400280     	ldr	x0, [x20]
 1266eb4: f9405c08     	ldr	x8, [x0, #0xb8]
 1266eb8: f94002a0     	ldr	x0, [x21]
 1266ebc: 52800061     	mov	w1, #0x3                // =3
 1266ec0: f9407114     	ldr	x20, [x8, #0xe0]
 1266ec4: 97f96423     	bl	0x10bff50 <CloseNLSocket+0x488>
 1266ec8: f9400308     	ldr	x8, [x24]
 1266ecc: bd411668     	ldr	s8, [x19, #0x114]
 1266ed0: aa0003f5     	mov	x21, x0
 1266ed4: aa0803e0     	mov	x0, x8
 1266ed8: 97f96487     	bl	0x10c00f4 <CloseNLSocket+0x62c>
 1266edc: f94002e1     	ldr	x1, [x23]
 1266ee0: 52aff009     	mov	w9, #0x7f800000         // =2139095040
 1266ee4: 1e380108     	fcvtzs	w8, s8
 1266ee8: 1e270120     	fmov	s0, w9
 1266eec: 93407d08     	sxtw	x8, w8
 1266ef0: 1e202100     	fcmp	s8, s0
 1266ef4: b26183e9     	mov	x9, #-0x80000000        // =-2147483648
 1266ef8: 9a880122     	csel	x2, x9, x8, eq
 1266efc: aa1f03e3     	mov	x3, xzr
 1266f00: aa0003f6     	mov	x22, x0
 1266f04: 97ff94a5     	bl	0x124c198 <__start_il2cpp+0xa49d4>
 1266f08: b40008b5     	cbz	x21, 0x126701c <__start_il2cpp+0xbf858>
 1266f0c: b40000d6     	cbz	x22, 0x1266f24 <__start_il2cpp+0xbf760>
 1266f10: f94002a8     	ldr	x8, [x21]
 1266f14: aa1603e0     	mov	x0, x22
 1266f18: f9402101     	ldr	x1, [x8, #0x40]
 1266f1c: 97f96432     	bl	0x10bffe4 <CloseNLSocket+0x51c>
 1266f20: b4000780     	cbz	x0, 0x1267010 <__start_il2cpp+0xbf84c>
 1266f24: b9401aa8     	ldr	w8, [x21, #0x18]
 1266f28: 34000728     	cbz	w8, 0x126700c <__start_il2cpp+0xbf848>
 1266f2c: f90012b6     	str	x22, [x21, #0x20]
 1266f30: f9400300     	ldr	x0, [x24]
 1266f34: 9000aff6     	adrp	x22, 0x2862000
 1266f38: b9811277     	ldrsw	x23, [x19, #0x110]
 1266f3c: f9416ed6     	ldr	x22, [x22, #0x2d8]
 1266f40: 97f9646d     	bl	0x10c00f4 <CloseNLSocket+0x62c>
 1266f44: f94002c1     	ldr	x1, [x22]
 1266f48: aa1703e2     	mov	x2, x23
 1266f4c: aa1f03e3     	mov	x3, xzr
 1266f50: aa0003f6     	mov	x22, x0
 1266f54: 97ff9491     	bl	0x124c198 <__start_il2cpp+0xa49d4>
 1266f58: b40000d6     	cbz	x22, 0x1266f70 <__start_il2cpp+0xbf7ac>
 1266f5c: f94002a8     	ldr	x8, [x21]
 1266f60: aa1603e0     	mov	x0, x22
 1266f64: f9402101     	ldr	x1, [x8, #0x40]
 1266f68: 97f9641f     	bl	0x10bffe4 <CloseNLSocket+0x51c>
 1266f6c: b4000520     	cbz	x0, 0x1267010 <__start_il2cpp+0xbf84c>
 1266f70: b9401aa8     	ldr	w8, [x21, #0x18]
 1266f74: 7100051f     	cmp	w8, #0x1
 1266f78: 540004a9     	b.ls	0x126700c <__start_il2cpp+0xbf848>
 1266f7c: f90016b6     	str	x22, [x21, #0x28]
 1266f80: b9816a76     	ldrsw	x22, [x19, #0x168]
 1266f84: f9400300     	ldr	x0, [x24]
 1266f88: 9000aff3     	adrp	x19, 0x2862000
 1266f8c: f9410a73     	ldr	x19, [x19, #0x210]
 1266f90: 97f96459     	bl	0x10c00f4 <CloseNLSocket+0x62c>
 1266f94: f9400261     	ldr	x1, [x19]
 1266f98: aa1603e2     	mov	x2, x22
 1266f9c: aa1f03e3     	mov	x3, xzr
 1266fa0: aa0003f3     	mov	x19, x0
 1266fa4: 97ff947d     	bl	0x124c198 <__start_il2cpp+0xa49d4>
 1266fa8: b40000d3     	cbz	x19, 0x1266fc0 <__start_il2cpp+0xbf7fc>
 1266fac: f94002a8     	ldr	x8, [x21]
 1266fb0: aa1303e0     	mov	x0, x19
 1266fb4: f9402101     	ldr	x1, [x8, #0x40]
 1266fb8: 97f9640b     	bl	0x10bffe4 <CloseNLSocket+0x51c>
 1266fbc: b40002a0     	cbz	x0, 0x1267010 <__start_il2cpp+0xbf84c>
 1266fc0: b9401aa8     	ldr	w8, [x21, #0x18]
 1266fc4: 7100091f     	cmp	w8, #0x2
 1266fc8: 54000229     	b.ls	0x126700c <__start_il2cpp+0xbf848>
 1266fcc: 9000afe8     	adrp	x8, 0x2862000
 1266fd0: f940dd08     	ldr	x8, [x8, #0x1b8]
 1266fd4: f9001ab3     	str	x19, [x21, #0x30]
 1266fd8: f9400100     	ldr	x0, [x8]
 1266fdc: b940e008     	ldr	w8, [x0, #0xe0]
 1266fe0: 35000048     	cbnz	w8, 0x1266fe8 <__start_il2cpp+0xbf824>
 1266fe4: 97f963ff     	bl	0x10bffe0 <CloseNLSocket+0x518>
 1266fe8: aa1403e0     	mov	x0, x20
 1266fec: aa1503e1     	mov	x1, x21
 1266ff0: a9434ff4     	ldp	x20, x19, [sp, #0x30]
 1266ff4: a94257f6     	ldp	x22, x21, [sp, #0x20]
 1266ff8: a9415ff8     	ldp	x24, x23, [sp, #0x10]
 1266ffc: f94007fe     	ldr	x30, [sp, #0x8]
 1267000: aa1f03e2     	mov	x2, xzr
 1267004: fc4407e8     	ldr	d8, [sp], #0x40
 1267008: 1400a965     	b	0x129159c <__start_il2cpp+0xe9dd8>
 126700c: 97f9643f     	bl	0x10c0108 <CloseNLSocket+0x640>
 1267010: 97f96445     	bl	0x10c0124 <CloseNLSocket+0x65c>
 1267014: aa1f03e1     	mov	x1, xzr
 1267018: 97f963ee     	bl	0x10bffd0 <CloseNLSocket+0x508>
 126701c: 97f96439     	bl	0x10c0100 <CloseNLSocket+0x638>
