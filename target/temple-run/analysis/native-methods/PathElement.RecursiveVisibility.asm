
/tmp/temple-libil2cpp.so:	file format elf64-littleaarch64

Disassembly of section il2cpp:

00000000011a77c4 <__start_il2cpp>:
 12e87cc: f81a0ffe     	str	x30, [sp, #-0x60]!
 12e87d0: a9016ffc     	stp	x28, x27, [sp, #0x10]
 12e87d4: a90267fa     	stp	x26, x25, [sp, #0x20]
 12e87d8: a9035ff8     	stp	x24, x23, [sp, #0x30]
 12e87dc: a90457f6     	stp	x22, x21, [sp, #0x40]
 12e87e0: a9054ff4     	stp	x20, x19, [sp, #0x50]
 12e87e4: 9000abb5     	adrp	x21, 0x285c000 <_ZTVN10__cxxabiv119__pointer_type_infoE+0x18>
 12e87e8: d000abd6     	adrp	x22, 0x2862000
 12e87ec: f94562b5     	ldr	x21, [x21, #0xac0]
 12e87f0: f9424ad6     	ldr	x22, [x22, #0x490]
 12e87f4: 2a0403f3     	mov	w19, w4
 12e87f8: 2a0303f7     	mov	w23, w3
 12e87fc: 2a0203f8     	mov	w24, w2
 12e8800: 2a0103f9     	mov	w25, w1
 12e8804: aa0003f4     	mov	x20, x0
 12e8808: b000ba7b     	adrp	x27, 0x2a35000
 12e880c: 5280003c     	mov	w28, #0x1               // =1
 12e8810: 396cab68     	ldrb	w8, [x27, #0xb2a]
 12e8814: 370000c8     	tbnz	w8, #0x0, 0x12e882c <__start_il2cpp+0x141068>
 12e8818: aa1503e0     	mov	x0, x21
 12e881c: 97f75daf     	bl	0x10bfed8 <CloseNLSocket+0x410>
 12e8820: aa1603e0     	mov	x0, x22
 12e8824: 97f75dad     	bl	0x10bfed8 <CloseNLSocket+0x410>
 12e8828: 392cab7c     	strb	w28, [x27, #0xb2a]
 12e882c: 2a3902e8     	orn	w8, w23, w25
 12e8830: 360000a8     	tbz	w8, #0x0, 0x12e8844 <__start_il2cpp+0x141080>
 12e8834: 2a170339     	orr	w25, w25, w23
 12e8838: 12000321     	and	w1, w25, #0x1
 12e883c: aa1403e0     	mov	x0, x20
 12e8840: 1400000a     	b	0x12e8868 <__start_il2cpp+0x1410a4>
 12e8844: aa1403e0     	mov	x0, x20
 12e8848: 97ffe81a     	bl	0x12e28b0 <__start_il2cpp+0x13b0ec>
 12e884c: 12000008     	and	w8, w0, #0x1
 12e8850: 0b080273     	add	w19, w19, w8
 12e8854: 71000e7f     	cmp	w19, #0x3
 12e8858: 1a9fa7e8     	cset	w8, lt
 12e885c: 0a080339     	and	w25, w25, w8
 12e8860: aa1403e0     	mov	x0, x20
 12e8864: 2a1903e1     	mov	w1, w25
 12e8868: 97ffff60     	bl	0x12e85e8 <__start_il2cpp+0x140e24>
 12e886c: 360004d9     	tbz	w25, #0x0, 0x12e8904 <__start_il2cpp+0x141140>
 12e8870: f94002a0     	ldr	x0, [x21]
 12e8874: f9406299     	ldr	x25, [x20, #0xc0]
 12e8878: b940e008     	ldr	w8, [x0, #0xe0]
 12e887c: 35000048     	cbnz	w8, 0x12e8884 <__start_il2cpp+0x1410c0>
 12e8880: 97f75dd8     	bl	0x10bffe0 <CloseNLSocket+0x518>
 12e8884: aa1903e0     	mov	x0, x25
 12e8888: aa1f03e1     	mov	x1, xzr
 12e888c: aa1f03e2     	mov	x2, xzr
 12e8890: 94473fee     	bl	0x24b8848 <__start_il2cpp+0x1311084>
 12e8894: 36000420     	tbz	w0, #0x0, 0x12e8918 <__start_il2cpp+0x141154>
 12e8898: f94002c0     	ldr	x0, [x22]
 12e889c: b940e008     	ldr	w8, [x0, #0xe0]
 12e88a0: 35000048     	cbnz	w8, 0x12e88a8 <__start_il2cpp+0x1410e4>
 12e88a4: 97f75dcf     	bl	0x10bffe0 <CloseNLSocket+0x518>
 12e88a8: f9406280     	ldr	x0, [x20, #0xc0]
 12e88ac: b4000e20     	cbz	x0, 0x12e8a70 <__start_il2cpp+0x1412ac>
 12e88b0: f94002c8     	ldr	x8, [x22]
 12e88b4: f9405d08     	ldr	x8, [x8, #0xb8]
 12e88b8: 39401108     	ldrb	w8, [x8, #0x4]
 12e88bc: 34000288     	cbz	w8, 0x12e890c <__start_il2cpp+0x141148>
 12e88c0: 52800021     	mov	w1, #0x1                // =1
 12e88c4: aa1f03e2     	mov	x2, xzr
 12e88c8: 94473372     	bl	0x24b5690 <__start_il2cpp+0x130decc>
 12e88cc: f94002c0     	ldr	x0, [x22]
 12e88d0: f9406299     	ldr	x25, [x20, #0xc0]
 12e88d4: b940e008     	ldr	w8, [x0, #0xe0]
 12e88d8: 35000068     	cbnz	w8, 0x12e88e4 <__start_il2cpp+0x141120>
 12e88dc: 97f75dc1     	bl	0x10bffe0 <CloseNLSocket+0x518>
 12e88e0: f94002c0     	ldr	x0, [x22]
 12e88e4: b4000c79     	cbz	x25, 0x12e8a70 <__start_il2cpp+0x1412ac>
 12e88e8: f9405c08     	ldr	x8, [x0, #0xb8]
 12e88ec: aa1903e0     	mov	x0, x25
 12e88f0: aa1f03e1     	mov	x1, xzr
 12e88f4: 2d4a8d02     	ldp	s2, s3, [x8, #0x54]
 12e88f8: 2d498500     	ldp	s0, s1, [x8, #0x4c]
 12e88fc: 97fc0cdf     	bl	0x11ebc78 <__start_il2cpp+0x444b4>
 12e8900: 14000006     	b	0x12e8918 <__start_il2cpp+0x141154>
 12e8904: 2a1f03f9     	mov	w25, wzr
 12e8908: 14000005     	b	0x12e891c <__start_il2cpp+0x141158>
 12e890c: 2a1f03e1     	mov	w1, wzr
 12e8910: aa1f03e2     	mov	x2, xzr
 12e8914: 9447335f     	bl	0x24b5690 <__start_il2cpp+0x130decc>
 12e8918: 52800039     	mov	w25, #0x1               // =1
 12e891c: 7100071f     	cmp	w24, #0x1
 12e8920: 1a9f17e8     	cset	w8, eq
 12e8924: 520002e9     	eor	w9, w23, #0x1
 12e8928: 0a090108     	and	w8, w8, w9
 12e892c: 370002e8     	tbnz	w8, #0x0, 0x12e8988 <__start_il2cpp+0x1411c4>
 12e8930: f94002a0     	ldr	x0, [x21]
 12e8934: f9402a9a     	ldr	x26, [x20, #0x50]
 12e8938: b940e008     	ldr	w8, [x0, #0xe0]
 12e893c: 35000048     	cbnz	w8, 0x12e8944 <__start_il2cpp+0x141180>
 12e8940: 97f75da8     	bl	0x10bffe0 <CloseNLSocket+0x518>
 12e8944: aa1a03e0     	mov	x0, x26
 12e8948: aa1f03e1     	mov	x1, xzr
 12e894c: aa1f03e2     	mov	x2, xzr
 12e8950: 94473fbe     	bl	0x24b8848 <__start_il2cpp+0x1311084>
 12e8954: 36000100     	tbz	w0, #0x0, 0x12e8974 <__start_il2cpp+0x1411b0>
 12e8958: f9402a80     	ldr	x0, [x20, #0x50]
 12e895c: b40008a0     	cbz	x0, 0x12e8a70 <__start_il2cpp+0x1412ac>
 12e8960: 52800062     	mov	w2, #0x3                // =3
 12e8964: 2a1903e1     	mov	w1, w25
 12e8968: 2a1f03e3     	mov	w3, wzr
 12e896c: 2a1303e4     	mov	w4, w19
 12e8970: 97ffff97     	bl	0x12e87cc <__start_il2cpp+0x141008>
 12e8974: 71000b1f     	cmp	w24, #0x2
 12e8978: 1a9f17e8     	cset	w8, eq
 12e897c: 520002e9     	eor	w9, w23, #0x1
 12e8980: 0a090108     	and	w8, w8, w9
 12e8984: 370002e8     	tbnz	w8, #0x0, 0x12e89e0 <__start_il2cpp+0x14121c>
 12e8988: f94002a0     	ldr	x0, [x21]
 12e898c: f9402e9a     	ldr	x26, [x20, #0x58]
 12e8990: b940e008     	ldr	w8, [x0, #0xe0]
 12e8994: 35000048     	cbnz	w8, 0x12e899c <__start_il2cpp+0x1411d8>
 12e8998: 97f75d92     	bl	0x10bffe0 <CloseNLSocket+0x518>
 12e899c: aa1a03e0     	mov	x0, x26
 12e89a0: aa1f03e1     	mov	x1, xzr
 12e89a4: aa1f03e2     	mov	x2, xzr
 12e89a8: 94473fa8     	bl	0x24b8848 <__start_il2cpp+0x1311084>
 12e89ac: 36000100     	tbz	w0, #0x0, 0x12e89cc <__start_il2cpp+0x141208>
 12e89b0: f9402e80     	ldr	x0, [x20, #0x58]
 12e89b4: b40005e0     	cbz	x0, 0x12e8a70 <__start_il2cpp+0x1412ac>
 12e89b8: 52800082     	mov	w2, #0x4                // =4
 12e89bc: 2a1903e1     	mov	w1, w25
 12e89c0: 2a1f03e3     	mov	w3, wzr
 12e89c4: 2a1303e4     	mov	w4, w19
 12e89c8: 97ffff81     	bl	0x12e87cc <__start_il2cpp+0x141008>
 12e89cc: 71000f1f     	cmp	w24, #0x3
 12e89d0: 1a9f17e8     	cset	w8, eq
 12e89d4: 520002e9     	eor	w9, w23, #0x1
 12e89d8: 0a090108     	and	w8, w8, w9
 12e89dc: 370002e8     	tbnz	w8, #0x0, 0x12e8a38 <__start_il2cpp+0x141274>
 12e89e0: f94002a0     	ldr	x0, [x21]
 12e89e4: f940369a     	ldr	x26, [x20, #0x68]
 12e89e8: b940e008     	ldr	w8, [x0, #0xe0]
 12e89ec: 35000048     	cbnz	w8, 0x12e89f4 <__start_il2cpp+0x141230>
 12e89f0: 97f75d7c     	bl	0x10bffe0 <CloseNLSocket+0x518>
 12e89f4: aa1a03e0     	mov	x0, x26
 12e89f8: aa1f03e1     	mov	x1, xzr
 12e89fc: aa1f03e2     	mov	x2, xzr
 12e8a00: 94473f92     	bl	0x24b8848 <__start_il2cpp+0x1311084>
 12e8a04: 36000100     	tbz	w0, #0x0, 0x12e8a24 <__start_il2cpp+0x141260>
 12e8a08: f9403680     	ldr	x0, [x20, #0x68]
 12e8a0c: b4000320     	cbz	x0, 0x12e8a70 <__start_il2cpp+0x1412ac>
 12e8a10: 52800022     	mov	w2, #0x1                // =1
 12e8a14: 2a1903e1     	mov	w1, w25
 12e8a18: 2a1f03e3     	mov	w3, wzr
 12e8a1c: 2a1303e4     	mov	w4, w19
 12e8a20: 97ffff6b     	bl	0x12e87cc <__start_il2cpp+0x141008>
 12e8a24: 7100131f     	cmp	w24, #0x4
 12e8a28: 1a9f17e8     	cset	w8, eq
 12e8a2c: 520002e9     	eor	w9, w23, #0x1
 12e8a30: 0a090108     	and	w8, w8, w9
 12e8a34: 37000208     	tbnz	w8, #0x0, 0x12e8a74 <__start_il2cpp+0x1412b0>
 12e8a38: f94002a0     	ldr	x0, [x21]
 12e8a3c: f9403297     	ldr	x23, [x20, #0x60]
 12e8a40: b940e008     	ldr	w8, [x0, #0xe0]
 12e8a44: 35000048     	cbnz	w8, 0x12e8a4c <__start_il2cpp+0x141288>
 12e8a48: 97f75d66     	bl	0x10bffe0 <CloseNLSocket+0x518>
 12e8a4c: aa1703e0     	mov	x0, x23
 12e8a50: aa1f03e1     	mov	x1, xzr
 12e8a54: aa1f03e2     	mov	x2, xzr
 12e8a58: 94473f7c     	bl	0x24b8848 <__start_il2cpp+0x1311084>
 12e8a5c: 360000c0     	tbz	w0, #0x0, 0x12e8a74 <__start_il2cpp+0x1412b0>
 12e8a60: f9403294     	ldr	x20, [x20, #0x60]
 12e8a64: 2a1f03f7     	mov	w23, wzr
 12e8a68: 52800058     	mov	w24, #0x2               // =2
 12e8a6c: b5ffed34     	cbnz	x20, 0x12e8810 <__start_il2cpp+0x14104c>
 12e8a70: 97f75da4     	bl	0x10c0100 <CloseNLSocket+0x638>
 12e8a74: a9454ff4     	ldp	x20, x19, [sp, #0x50]
 12e8a78: a94457f6     	ldp	x22, x21, [sp, #0x40]
 12e8a7c: a9435ff8     	ldp	x24, x23, [sp, #0x30]
 12e8a80: a94267fa     	ldp	x26, x25, [sp, #0x20]
 12e8a84: a9416ffc     	ldp	x28, x27, [sp, #0x10]
 12e8a88: f84607fe     	ldr	x30, [sp], #0x60
 12e8a8c: d65f03c0     	ret
