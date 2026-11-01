
/tmp/temple-libil2cpp.so:	file format elf64-littleaarch64

Disassembly of section il2cpp:

00000000011a77c4 <__start_il2cpp>:
 12e3994: f81d0ffe     	str	x30, [sp, #-0x30]!
 12e3998: a90157f6     	stp	x22, x21, [sp, #0x10]
 12e399c: a9024ff4     	stp	x20, x19, [sp, #0x20]
 12e39a0: d000ba96     	adrp	x22, 0x2a35000
 12e39a4: 396c66c8     	ldrb	w8, [x22, #0xb19]
 12e39a8: 2a0203f5     	mov	w21, w2
 12e39ac: 2a0103f3     	mov	w19, w1
 12e39b0: aa0003f4     	mov	x20, x0
 12e39b4: 370002a8     	tbnz	w8, #0x0, 0x12e3a08 <__start_il2cpp+0x13c244>
 12e39b8: f000ac00     	adrp	x0, 0x2866000
 12e39bc: f9410c00     	ldr	x0, [x0, #0x218]
 12e39c0: 97f77146     	bl	0x10bfed8 <CloseNLSocket+0x410>
 12e39c4: f000ac00     	adrp	x0, 0x2866000
 12e39c8: f9410400     	ldr	x0, [x0, #0x208]
 12e39cc: 97f77143     	bl	0x10bfed8 <CloseNLSocket+0x410>
 12e39d0: f000ac00     	adrp	x0, 0x2866000
 12e39d4: f9411800     	ldr	x0, [x0, #0x230]
 12e39d8: 97f77140     	bl	0x10bfed8 <CloseNLSocket+0x410>
 12e39dc: f000ac00     	adrp	x0, 0x2866000
 12e39e0: f9411c00     	ldr	x0, [x0, #0x238]
 12e39e4: 97f7713d     	bl	0x10bfed8 <CloseNLSocket+0x410>
 12e39e8: f000ac00     	adrp	x0, 0x2866000
 12e39ec: f9412000     	ldr	x0, [x0, #0x240]
 12e39f0: 97f7713a     	bl	0x10bfed8 <CloseNLSocket+0x410>
 12e39f4: f000ac00     	adrp	x0, 0x2866000
 12e39f8: f9412400     	ldr	x0, [x0, #0x248]
 12e39fc: 97f77137     	bl	0x10bfed8 <CloseNLSocket+0x410>
 12e3a00: 52800028     	mov	w8, #0x1                // =1
 12e3a04: 392c66c8     	strb	w8, [x22, #0xb19]
 12e3a08: 510006a8     	sub	w8, w21, #0x1
 12e3a0c: 71000d1f     	cmp	w8, #0x3
 12e3a10: 54000748     	b.hi	0x12e3af8 <__start_il2cpp+0x13c334>
 12e3a14: 90ff9ea9     	adrp	x9, 0x6b7000
 12e3a18: 91303529     	add	x9, x9, #0xc0d
 12e3a1c: 1000008a     	adr	x10, 0x12e3a2c <__start_il2cpp+0x13c268>
 12e3a20: 3868692b     	ldrb	w11, [x9, x8]
 12e3a24: 8b0b094a     	add	x10, x10, x11, lsl #2
 12e3a28: d61f0140     	br	x10
 12e3a2c: b9403288     	ldr	w8, [x20, #0x30]
 12e3a30: 51003108     	sub	w8, w8, #0xc
 12e3a34: 7100311f     	cmp	w8, #0xc
 12e3a38: 54000928     	b.hi	0x12e3b5c <__start_il2cpp+0x13c398>
 12e3a3c: 90ff9ea9     	adrp	x9, 0x6b7000
 12e3a40: 9130f129     	add	x9, x9, #0xc3c
 12e3a44: 1000008a     	adr	x10, 0x12e3a54 <__start_il2cpp+0x13c290>
 12e3a48: 3868692b     	ldrb	w11, [x9, x8]
 12e3a4c: 8b0b094a     	add	x10, x10, x11, lsl #2
 12e3a50: d61f0140     	br	x10
 12e3a54: 71004e7f     	cmp	w19, #0x13
 12e3a58: 1a9f17e8     	cset	w8, eq
 12e3a5c: 7100567f     	cmp	w19, #0x15
 12e3a60: 14000062     	b	0x12e3be8 <__start_il2cpp+0x13c424>
 12e3a64: b9403288     	ldr	w8, [x20, #0x30]
 12e3a68: 51003d08     	sub	w8, w8, #0xf
 12e3a6c: 71003d1f     	cmp	w8, #0xf
 12e3a70: 540008e8     	b.hi	0x12e3b8c <__start_il2cpp+0x13c3c8>
 12e3a74: 90ff9ea9     	adrp	x9, 0x6b7000
 12e3a78: 9130b129     	add	x9, x9, #0xc2c
 12e3a7c: 1000008a     	adr	x10, 0x12e3a8c <__start_il2cpp+0x13c2c8>
 12e3a80: 3868692b     	ldrb	w11, [x9, x8]
 12e3a84: 8b0b094a     	add	x10, x10, x11, lsl #2
 12e3a88: d61f0140     	br	x10
 12e3a8c: 121e7a68     	and	w8, w19, #0xfffffffd
 12e3a90: 7100651f     	cmp	w8, #0x19
 12e3a94: 1400002c     	b	0x12e3b44 <__start_il2cpp+0x13c380>
 12e3a98: b9403288     	ldr	w8, [x20, #0x30]
 12e3a9c: 51003508     	sub	w8, w8, #0xd
 12e3aa0: 71002d1f     	cmp	w8, #0xb
 12e3aa4: 540008c8     	b.hi	0x12e3bbc <__start_il2cpp+0x13c3f8>
 12e3aa8: 90ff9ea9     	adrp	x9, 0x6b7000
 12e3aac: 91308129     	add	x9, x9, #0xc20
 12e3ab0: 1000008a     	adr	x10, 0x12e3ac0 <__start_il2cpp+0x13c2fc>
 12e3ab4: 3868692b     	ldrb	w11, [x9, x8]
 12e3ab8: 8b0b094a     	add	x10, x10, x11, lsl #2
 12e3abc: d61f0140     	br	x10
 12e3ac0: 7100067f     	cmp	w19, #0x1
 12e3ac4: 14000020     	b	0x12e3b44 <__start_il2cpp+0x13c380>
 12e3ac8: b9403288     	ldr	w8, [x20, #0x30]
 12e3acc: 51004108     	sub	w8, w8, #0x10
 12e3ad0: 7100391f     	cmp	w8, #0xe
 12e3ad4: 54000968     	b.hi	0x12e3c00 <__start_il2cpp+0x13c43c>
 12e3ad8: 90ff9ea9     	adrp	x9, 0x6b7000
 12e3adc: 91304529     	add	x9, x9, #0xc11
 12e3ae0: 1000008a     	adr	x10, 0x12e3af0 <__start_il2cpp+0x13c32c>
 12e3ae4: 3868692b     	ldrb	w11, [x9, x8]
 12e3ae8: 8b0b094a     	add	x10, x10, x11, lsl #2
 12e3aec: d61f0140     	br	x10
 12e3af0: 71000a7f     	cmp	w19, #0x2
 12e3af4: 14000014     	b	0x12e3b44 <__start_il2cpp+0x13c380>
 12e3af8: 2a1f03e0     	mov	w0, wzr
 12e3afc: 1400003d     	b	0x12e3bf0 <__start_il2cpp+0x13c42c>
 12e3b00: 71005a7f     	cmp	w19, #0x16
 12e3b04: 1a9f17e8     	cset	w8, eq
 12e3b08: 7100627f     	cmp	w19, #0x18
 12e3b0c: 14000037     	b	0x12e3be8 <__start_il2cpp+0x13c424>
 12e3b10: 121e7a68     	and	w8, w19, #0xfffffffd
 12e3b14: 1400000b     	b	0x12e3b40 <__start_il2cpp+0x13c37c>
 12e3b18: 51004e68     	sub	w8, w19, #0x13
 12e3b1c: 14000005     	b	0x12e3b30 <__start_il2cpp+0x13c36c>
 12e3b20: 121f7a68     	and	w8, w19, #0xfffffffe
 12e3b24: 7100591f     	cmp	w8, #0x16
 12e3b28: 14000007     	b	0x12e3b44 <__start_il2cpp+0x13c380>
 12e3b2c: 51006668     	sub	w8, w19, #0x19
 12e3b30: 7100091f     	cmp	w8, #0x2
 12e3b34: 1a9f27e0     	cset	w0, lo
 12e3b38: 1400002e     	b	0x12e3bf0 <__start_il2cpp+0x13c42c>
 12e3b3c: 121f7a68     	and	w8, w19, #0xfffffffe
 12e3b40: 7100711f     	cmp	w8, #0x1c
 12e3b44: 1a9f17e0     	cset	w0, eq
 12e3b48: 1400002a     	b	0x12e3bf0 <__start_il2cpp+0x13c42c>
 12e3b4c: 7100067f     	cmp	w19, #0x1
 12e3b50: 1a9f17e8     	cset	w8, eq
 12e3b54: 7100367f     	cmp	w19, #0xd
 12e3b58: 14000024     	b	0x12e3be8 <__start_il2cpp+0x13c424>
 12e3b5c: f000ac08     	adrp	x8, 0x2866000
 12e3b60: f9410508     	ldr	x8, [x8, #0x208]
 12e3b64: 528001e1     	mov	w1, #0xf                // =15
 12e3b68: f9400100     	ldr	x0, [x8]
 12e3b6c: 97f770f9     	bl	0x10bff50 <CloseNLSocket+0x488>
 12e3b70: f000ac08     	adrp	x8, 0x2866000
 12e3b74: f9412108     	ldr	x8, [x8, #0x240]
 12e3b78: 14000029     	b	0x12e3c1c <__start_il2cpp+0x13c458>
 12e3b7c: 71000a7f     	cmp	w19, #0x2
 12e3b80: 1a9f17e8     	cset	w8, eq
 12e3b84: 7100427f     	cmp	w19, #0x10
 12e3b88: 14000018     	b	0x12e3be8 <__start_il2cpp+0x13c424>
 12e3b8c: f000ac08     	adrp	x8, 0x2866000
 12e3b90: f9410508     	ldr	x8, [x8, #0x208]
 12e3b94: 528001c1     	mov	w1, #0xe                // =14
 12e3b98: f9400100     	ldr	x0, [x8]
 12e3b9c: 97f770ed     	bl	0x10bff50 <CloseNLSocket+0x488>
 12e3ba0: f000ac08     	adrp	x8, 0x2866000
 12e3ba4: f9411d08     	ldr	x8, [x8, #0x238]
 12e3ba8: 1400001d     	b	0x12e3c1c <__start_il2cpp+0x13c458>
 12e3bac: 7100067f     	cmp	w19, #0x1
 12e3bb0: 1a9f17e8     	cset	w8, eq
 12e3bb4: 7100327f     	cmp	w19, #0xc
 12e3bb8: 1400000c     	b	0x12e3be8 <__start_il2cpp+0x13c424>
 12e3bbc: f000ac08     	adrp	x8, 0x2866000
 12e3bc0: f9410508     	ldr	x8, [x8, #0x208]
 12e3bc4: 528001e1     	mov	w1, #0xf                // =15
 12e3bc8: f9400100     	ldr	x0, [x8]
 12e3bcc: 97f770e1     	bl	0x10bff50 <CloseNLSocket+0x488>
 12e3bd0: f000ac08     	adrp	x8, 0x2866000
 12e3bd4: f9412508     	ldr	x8, [x8, #0x248]
 12e3bd8: 14000011     	b	0x12e3c1c <__start_il2cpp+0x13c458>
 12e3bdc: 71000a7f     	cmp	w19, #0x2
 12e3be0: 1a9f17e8     	cset	w8, eq
 12e3be4: 71003e7f     	cmp	w19, #0xf
 12e3be8: 1a9f17e9     	cset	w9, eq
 12e3bec: 2a090100     	orr	w0, w8, w9
 12e3bf0: a9424ff4     	ldp	x20, x19, [sp, #0x20]
 12e3bf4: a94157f6     	ldp	x22, x21, [sp, #0x10]
 12e3bf8: f84307fe     	ldr	x30, [sp], #0x30
 12e3bfc: d65f03c0     	ret
 12e3c00: f000ac08     	adrp	x8, 0x2866000
 12e3c04: f9410508     	ldr	x8, [x8, #0x208]
 12e3c08: 528001c1     	mov	w1, #0xe                // =14
 12e3c0c: f9400100     	ldr	x0, [x8]
 12e3c10: 97f770d0     	bl	0x10bff50 <CloseNLSocket+0x488>
 12e3c14: f000ac08     	adrp	x8, 0x2866000
 12e3c18: f9411908     	ldr	x8, [x8, #0x230]
 12e3c1c: f9400101     	ldr	x1, [x8]
 12e3c20: aa1f03e2     	mov	x2, xzr
 12e3c24: aa0003f4     	mov	x20, x0
 12e3c28: 942c07eb     	bl	0x1de5bd4 <__start_il2cpp+0xc3e410>
 12e3c2c: f000ac08     	adrp	x8, 0x2866000
 12e3c30: f9410d08     	ldr	x8, [x8, #0x218]
 12e3c34: 2a1303e0     	mov	w0, w19
 12e3c38: aa1403e1     	mov	x1, x20
 12e3c3c: a9424ff4     	ldp	x20, x19, [sp, #0x20]
 12e3c40: f9400102     	ldr	x2, [x8]
 12e3c44: a94157f6     	ldp	x22, x21, [sp, #0x10]
 12e3c48: f84307fe     	ldr	x30, [sp], #0x30
 12e3c4c: 1403cf57     	b	0x13d79a8 <__start_il2cpp+0x2301e4>
