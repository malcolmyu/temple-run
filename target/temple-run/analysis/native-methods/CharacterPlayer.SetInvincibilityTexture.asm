
/tmp/temple-libil2cpp.so:	file format elf64-littleaarch64

Disassembly of section il2cpp:

00000000011a77c4 <__start_il2cpp>:
 1298b0c: f81d0ffe     	str	x30, [sp, #-0x30]!
 1298b10: a90157f6     	stp	x22, x21, [sp, #0x10]
 1298b14: a9024ff4     	stp	x20, x19, [sp, #0x20]
 1298b18: f9405815     	ldr	x21, [x0, #0xb0]
 1298b1c: b4000815     	cbz	x21, 0x1298c1c <__start_il2cpp+0xf1458>
 1298b20: b9401aa8     	ldr	w8, [x21, #0x18]
 1298b24: aa0003f3     	mov	x19, x0
 1298b28: 7100051f     	cmp	w8, #0x1
 1298b2c: 5400032b     	b.lt	0x1298b90 <__start_il2cpp+0xf13cc>
 1298b30: 2a1f03f6     	mov	w22, wzr
 1298b34: 6b0802df     	cmp	w22, w8
 1298b38: 54000742     	b.hs	0x1298c20 <__start_il2cpp+0xf145c>
 1298b3c: 8b36cea8     	add	x8, x21, w22, sxtw #3
 1298b40: f9401114     	ldr	x20, [x8, #0x20]
 1298b44: b40006d4     	cbz	x20, 0x1298c1c <__start_il2cpp+0xf1458>
 1298b48: aa1403e0     	mov	x0, x20
 1298b4c: aa1f03e1     	mov	x1, xzr
 1298b50: 9448184d     	bl	0x249ec84 <__start_il2cpp+0x12f74c0>
 1298b54: b4000640     	cbz	x0, 0x1298c1c <__start_il2cpp+0xf1458>
 1298b58: f9404a61     	ldr	x1, [x19, #0x90]
 1298b5c: aa1f03e2     	mov	x2, xzr
 1298b60: 94481a00     	bl	0x249f360 <__start_il2cpp+0x12f7b9c>
 1298b64: aa1403e0     	mov	x0, x20
 1298b68: aa1f03e1     	mov	x1, xzr
 1298b6c: 94481846     	bl	0x249ec84 <__start_il2cpp+0x12f74c0>
 1298b70: b4000560     	cbz	x0, 0x1298c1c <__start_il2cpp+0xf1458>
 1298b74: f9404e61     	ldr	x1, [x19, #0x98]
 1298b78: aa1f03e2     	mov	x2, xzr
 1298b7c: 94481b00     	bl	0x249f77c <__start_il2cpp+0x12f7fb8>
 1298b80: b9401aa8     	ldr	w8, [x21, #0x18]
 1298b84: 110006d6     	add	w22, w22, #0x1
 1298b88: 6b0802df     	cmp	w22, w8
 1298b8c: 54fffd4b     	b.lt	0x1298b34 <__start_il2cpp+0xf1370>
 1298b90: f9405e75     	ldr	x21, [x19, #0xb8]
 1298b94: b4000455     	cbz	x21, 0x1298c1c <__start_il2cpp+0xf1458>
 1298b98: b9401aa8     	ldr	w8, [x21, #0x18]
 1298b9c: 7100051f     	cmp	w8, #0x1
 1298ba0: 5400032b     	b.lt	0x1298c04 <__start_il2cpp+0xf1440>
 1298ba4: 2a1f03f6     	mov	w22, wzr
 1298ba8: 6b0802df     	cmp	w22, w8
 1298bac: 540003a2     	b.hs	0x1298c20 <__start_il2cpp+0xf145c>
 1298bb0: 8b36cea8     	add	x8, x21, w22, sxtw #3
 1298bb4: f9401114     	ldr	x20, [x8, #0x20]
 1298bb8: b4000334     	cbz	x20, 0x1298c1c <__start_il2cpp+0xf1458>
 1298bbc: aa1403e0     	mov	x0, x20
 1298bc0: aa1f03e1     	mov	x1, xzr
 1298bc4: 94481830     	bl	0x249ec84 <__start_il2cpp+0x12f74c0>
 1298bc8: b40002a0     	cbz	x0, 0x1298c1c <__start_il2cpp+0xf1458>
 1298bcc: f9404a61     	ldr	x1, [x19, #0x90]
 1298bd0: aa1f03e2     	mov	x2, xzr
 1298bd4: 944819e3     	bl	0x249f360 <__start_il2cpp+0x12f7b9c>
 1298bd8: aa1403e0     	mov	x0, x20
 1298bdc: aa1f03e1     	mov	x1, xzr
 1298be0: 94481829     	bl	0x249ec84 <__start_il2cpp+0x12f74c0>
 1298be4: b40001c0     	cbz	x0, 0x1298c1c <__start_il2cpp+0xf1458>
 1298be8: f9404e61     	ldr	x1, [x19, #0x98]
 1298bec: aa1f03e2     	mov	x2, xzr
 1298bf0: 94481ae3     	bl	0x249f77c <__start_il2cpp+0x12f7fb8>
 1298bf4: b9401aa8     	ldr	w8, [x21, #0x18]
 1298bf8: 110006d6     	add	w22, w22, #0x1
 1298bfc: 6b0802df     	cmp	w22, w8
 1298c00: 54fffd4b     	b.lt	0x1298ba8 <__start_il2cpp+0xf13e4>
 1298c04: aa1303e0     	mov	x0, x19
 1298c08: a9424ff4     	ldp	x20, x19, [sp, #0x20]
 1298c0c: a94157f6     	ldp	x22, x21, [sp, #0x10]
 1298c10: 1e2c1000     	fmov	s0, #0.50000000
 1298c14: f84307fe     	ldr	x30, [sp], #0x30
 1298c18: 17fff8b3     	b	0x1296ee4 <__start_il2cpp+0xef720>
 1298c1c: 97f89d39     	bl	0x10c0100 <CloseNLSocket+0x638>
 1298c20: 97f89d3a     	bl	0x10c0108 <CloseNLSocket+0x640>
