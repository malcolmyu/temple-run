
/tmp/temple-libil2cpp.so:	file format elf64-littleaarch64

Disassembly of section il2cpp:

00000000011a77c4 <__start_il2cpp>:
 1297c78: f81c0ffe     	str	x30, [sp, #-0x40]!
 1297c7c: a9015ff8     	stp	x24, x23, [sp, #0x10]
 1297c80: a90257f6     	stp	x22, x21, [sp, #0x20]
 1297c84: a9034ff4     	stp	x20, x19, [sp, #0x30]
 1297c88: d000bcf4     	adrp	x20, 0x2a35000
 1297c8c: 39626688     	ldrb	w8, [x20, #0x899]
 1297c90: aa0003f3     	mov	x19, x0
 1297c94: 370000c8     	tbnz	w8, #0x0, 0x1297cac <__start_il2cpp+0xf04e8>
 1297c98: 9000ae60     	adrp	x0, 0x2863000
 1297c9c: f946d000     	ldr	x0, [x0, #0xda0]
 1297ca0: 97f8a08e     	bl	0x10bfed8 <CloseNLSocket+0x410>
 1297ca4: 52800028     	mov	w8, #0x1                // =1
 1297ca8: 39226688     	strb	w8, [x20, #0x899]
 1297cac: f9405a77     	ldr	x23, [x19, #0xb0]
 1297cb0: b4000c57     	cbz	x23, 0x1297e38 <__start_il2cpp+0xf0674>
 1297cb4: b9401ae8     	ldr	w8, [x23, #0x18]
 1297cb8: 9000ae76     	adrp	x22, 0x2863000
 1297cbc: f946d2d6     	ldr	x22, [x22, #0xda0]
 1297cc0: 7100051f     	cmp	w8, #0x1
 1297cc4: 5400052b     	b.lt	0x1297d68 <__start_il2cpp+0xf05a4>
 1297cc8: 2a1f03f8     	mov	w24, wzr
 1297ccc: 6b08031f     	cmp	w24, w8
 1297cd0: 54000b62     	b.hs	0x1297e3c <__start_il2cpp+0xf0678>
 1297cd4: 8b38cee8     	add	x8, x23, w24, sxtw #3
 1297cd8: f9401114     	ldr	x20, [x8, #0x20]
 1297cdc: b4000af4     	cbz	x20, 0x1297e38 <__start_il2cpp+0xf0674>
 1297ce0: aa1403e0     	mov	x0, x20
 1297ce4: aa1f03e1     	mov	x1, xzr
 1297ce8: 94481be7     	bl	0x249ec84 <__start_il2cpp+0x12f74c0>
 1297cec: b4000a60     	cbz	x0, 0x1297e38 <__start_il2cpp+0xf0674>
 1297cf0: f9404661     	ldr	x1, [x19, #0x88]
 1297cf4: aa1f03e2     	mov	x2, xzr
 1297cf8: 94481d9a     	bl	0x249f360 <__start_il2cpp+0x12f7b9c>
 1297cfc: aa1403e0     	mov	x0, x20
 1297d00: aa1f03e1     	mov	x1, xzr
 1297d04: 94481be0     	bl	0x249ec84 <__start_il2cpp+0x12f74c0>
 1297d08: f940e668     	ldr	x8, [x19, #0x1c8]
 1297d0c: b4000968     	cbz	x8, 0x1297e38 <__start_il2cpp+0xf0674>
 1297d10: b9418a61     	ldr	w1, [x19, #0x188]
 1297d14: f94002c2     	ldr	x2, [x22]
 1297d18: aa0003f5     	mov	x21, x0
 1297d1c: aa0803e0     	mov	x0, x8
 1297d20: 9419890c     	bl	0x18fa150 <__start_il2cpp+0x75298c>
 1297d24: b40008b5     	cbz	x21, 0x1297e38 <__start_il2cpp+0xf0674>
 1297d28: aa0003e1     	mov	x1, x0
 1297d2c: aa1503e0     	mov	x0, x21
 1297d30: aa1f03e2     	mov	x2, xzr
 1297d34: 94481e92     	bl	0x249f77c <__start_il2cpp+0x12f7fb8>
 1297d38: aa1403e0     	mov	x0, x20
 1297d3c: aa1f03e1     	mov	x1, xzr
 1297d40: 94481bd1     	bl	0x249ec84 <__start_il2cpp+0x12f74c0>
 1297d44: b40007a0     	cbz	x0, 0x1297e38 <__start_il2cpp+0xf0674>
 1297d48: 1e2703e0     	fmov	s0, wzr
 1297d4c: 1e2703e1     	fmov	s1, wzr
 1297d50: aa1f03e1     	mov	x1, xzr
 1297d54: 94481f33     	bl	0x249fa20 <__start_il2cpp+0x12f825c>
 1297d58: b9401ae8     	ldr	w8, [x23, #0x18]
 1297d5c: 11000718     	add	w24, w24, #0x1
 1297d60: 6b08031f     	cmp	w24, w8
 1297d64: 54fffb4b     	b.lt	0x1297ccc <__start_il2cpp+0xf0508>
 1297d68: f9405e77     	ldr	x23, [x19, #0xb8]
 1297d6c: b4000677     	cbz	x23, 0x1297e38 <__start_il2cpp+0xf0674>
 1297d70: b9401ae8     	ldr	w8, [x23, #0x18]
 1297d74: 7100051f     	cmp	w8, #0x1
 1297d78: 5400052b     	b.lt	0x1297e1c <__start_il2cpp+0xf0658>
 1297d7c: 2a1f03f8     	mov	w24, wzr
 1297d80: 6b08031f     	cmp	w24, w8
 1297d84: 540005c2     	b.hs	0x1297e3c <__start_il2cpp+0xf0678>
 1297d88: 8b38cee8     	add	x8, x23, w24, sxtw #3
 1297d8c: f9401114     	ldr	x20, [x8, #0x20]
 1297d90: b4000554     	cbz	x20, 0x1297e38 <__start_il2cpp+0xf0674>
 1297d94: aa1403e0     	mov	x0, x20
 1297d98: aa1f03e1     	mov	x1, xzr
 1297d9c: 94481bba     	bl	0x249ec84 <__start_il2cpp+0x12f74c0>
 1297da0: b40004c0     	cbz	x0, 0x1297e38 <__start_il2cpp+0xf0674>
 1297da4: f9404661     	ldr	x1, [x19, #0x88]
 1297da8: aa1f03e2     	mov	x2, xzr
 1297dac: 94481d6d     	bl	0x249f360 <__start_il2cpp+0x12f7b9c>
 1297db0: aa1403e0     	mov	x0, x20
 1297db4: aa1f03e1     	mov	x1, xzr
 1297db8: 94481bb3     	bl	0x249ec84 <__start_il2cpp+0x12f74c0>
 1297dbc: f940e668     	ldr	x8, [x19, #0x1c8]
 1297dc0: b40003c8     	cbz	x8, 0x1297e38 <__start_il2cpp+0xf0674>
 1297dc4: b9418a61     	ldr	w1, [x19, #0x188]
 1297dc8: f94002c2     	ldr	x2, [x22]
 1297dcc: aa0003f5     	mov	x21, x0
 1297dd0: aa0803e0     	mov	x0, x8
 1297dd4: 941988df     	bl	0x18fa150 <__start_il2cpp+0x75298c>
 1297dd8: b4000315     	cbz	x21, 0x1297e38 <__start_il2cpp+0xf0674>
 1297ddc: aa0003e1     	mov	x1, x0
 1297de0: aa1503e0     	mov	x0, x21
 1297de4: aa1f03e2     	mov	x2, xzr
 1297de8: 94481e65     	bl	0x249f77c <__start_il2cpp+0x12f7fb8>
 1297dec: aa1403e0     	mov	x0, x20
 1297df0: aa1f03e1     	mov	x1, xzr
 1297df4: 94481ba4     	bl	0x249ec84 <__start_il2cpp+0x12f74c0>
 1297df8: b4000200     	cbz	x0, 0x1297e38 <__start_il2cpp+0xf0674>
 1297dfc: 1e2703e0     	fmov	s0, wzr
 1297e00: 1e2703e1     	fmov	s1, wzr
 1297e04: aa1f03e1     	mov	x1, xzr
 1297e08: 94481f06     	bl	0x249fa20 <__start_il2cpp+0x12f825c>
 1297e0c: b9401ae8     	ldr	w8, [x23, #0x18]
 1297e10: 11000718     	add	w24, w24, #0x1
 1297e14: 6b08031f     	cmp	w24, w8
 1297e18: 54fffb4b     	b.lt	0x1297d80 <__start_il2cpp+0xf05bc>
 1297e1c: aa1303e0     	mov	x0, x19
 1297e20: a9434ff4     	ldp	x20, x19, [sp, #0x30]
 1297e24: a94257f6     	ldp	x22, x21, [sp, #0x20]
 1297e28: a9415ff8     	ldp	x24, x23, [sp, #0x10]
 1297e2c: 1e2e1000     	fmov	s0, #1.00000000
 1297e30: f84407fe     	ldr	x30, [sp], #0x40
 1297e34: 17fffc2c     	b	0x1296ee4 <__start_il2cpp+0xef720>
 1297e38: 97f8a0b2     	bl	0x10c0100 <CloseNLSocket+0x638>
 1297e3c: 97f8a0b3     	bl	0x10c0108 <CloseNLSocket+0x640>
