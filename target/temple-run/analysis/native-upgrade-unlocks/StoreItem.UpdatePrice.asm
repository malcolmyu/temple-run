
/tmp/temple-libil2cpp.so:	file format elf64-littleaarch64

Disassembly of section il2cpp:

00000000011a77c4 <__start_il2cpp>:
 12d39bc: a9be57fe     	stp	x30, x21, [sp, #-0x20]!
 12d39c0: a9014ff4     	stp	x20, x19, [sp, #0x10]
 12d39c4: d000bb14     	adrp	x20, 0x2a35000
 12d39c8: 396a7288     	ldrb	w8, [x20, #0xa9c]
 12d39cc: aa0003f3     	mov	x19, x0
 12d39d0: 37000488     	tbnz	w8, #0x0, 0x12d3a60 <__start_il2cpp+0x12c29c>
 12d39d4: d000ac80     	adrp	x0, 0x2865000
 12d39d8: f9429000     	ldr	x0, [x0, #0x520]
 12d39dc: 97f7b13f     	bl	0x10bfed8 <CloseNLSocket+0x410>
 12d39e0: d000ac80     	adrp	x0, 0x2865000
 12d39e4: f9429400     	ldr	x0, [x0, #0x528]
 12d39e8: 97f7b13c     	bl	0x10bfed8 <CloseNLSocket+0x410>
 12d39ec: d000ac80     	adrp	x0, 0x2865000
 12d39f0: f9429800     	ldr	x0, [x0, #0x530]
 12d39f4: 97f7b139     	bl	0x10bfed8 <CloseNLSocket+0x410>
 12d39f8: d000ac80     	adrp	x0, 0x2865000
 12d39fc: f9429c00     	ldr	x0, [x0, #0x538]
 12d3a00: 97f7b136     	bl	0x10bfed8 <CloseNLSocket+0x410>
 12d3a04: d000ac80     	adrp	x0, 0x2865000
 12d3a08: f942a000     	ldr	x0, [x0, #0x540]
 12d3a0c: 97f7b133     	bl	0x10bfed8 <CloseNLSocket+0x410>
 12d3a10: d000ac80     	adrp	x0, 0x2865000
 12d3a14: f942a400     	ldr	x0, [x0, #0x548]
 12d3a18: 97f7b130     	bl	0x10bfed8 <CloseNLSocket+0x410>
 12d3a1c: d000ac80     	adrp	x0, 0x2865000
 12d3a20: f942a800     	ldr	x0, [x0, #0x550]
 12d3a24: 97f7b12d     	bl	0x10bfed8 <CloseNLSocket+0x410>
 12d3a28: d000ac80     	adrp	x0, 0x2865000
 12d3a2c: f942ac00     	ldr	x0, [x0, #0x558]
 12d3a30: 97f7b12a     	bl	0x10bfed8 <CloseNLSocket+0x410>
 12d3a34: d000ac80     	adrp	x0, 0x2865000
 12d3a38: f942b000     	ldr	x0, [x0, #0x560]
 12d3a3c: 97f7b127     	bl	0x10bfed8 <CloseNLSocket+0x410>
 12d3a40: d000ac80     	adrp	x0, 0x2865000
 12d3a44: f942b400     	ldr	x0, [x0, #0x568]
 12d3a48: 97f7b124     	bl	0x10bfed8 <CloseNLSocket+0x410>
 12d3a4c: d000ac80     	adrp	x0, 0x2865000
 12d3a50: f942b800     	ldr	x0, [x0, #0x570]
 12d3a54: 97f7b121     	bl	0x10bfed8 <CloseNLSocket+0x410>
 12d3a58: 52800028     	mov	w8, #0x1                // =1
 12d3a5c: 392a7288     	strb	w8, [x20, #0xa9c]
 12d3a60: f9405260     	ldr	x0, [x19, #0xa0]
 12d3a64: b4002120     	cbz	x0, 0x12d3e88 <__start_il2cpp+0x12c6c4>
 12d3a68: f9405674     	ldr	x20, [x19, #0xa8]
 12d3a6c: aa1f03e1     	mov	x1, xzr
 12d3a70: 97ff4ae7     	bl	0x12a660c <__start_il2cpp+0xfee48>
 12d3a74: b40020b4     	cbz	x20, 0x12d3e88 <__start_il2cpp+0x12c6c4>
 12d3a78: b9402262     	ldr	w2, [x19, #0x20]
 12d3a7c: 2a0003e1     	mov	w1, w0
 12d3a80: aa1403e0     	mov	x0, x20
 12d3a84: aa1f03e3     	mov	x3, xzr
 12d3a88: 97fee6b8     	bl	0x128d568 <__start_il2cpp+0xe5da4>
 12d3a8c: b9402668     	ldr	w8, [x19, #0x24]
 12d3a90: 2a0003f4     	mov	w20, w0
 12d3a94: 51000d09     	sub	w9, w8, #0x3
 12d3a98: 7100093f     	cmp	w9, #0x2
 12d3a9c: 540000a2     	b.hs	0x12d3ab0 <__start_il2cpp+0x12c2ec>
 12d3aa0: d000ac88     	adrp	x8, 0x2865000
 12d3aa4: f9402275     	ldr	x21, [x19, #0x40]
 12d3aa8: f9429108     	ldr	x8, [x8, #0x520]
 12d3aac: 14000010     	b	0x12d3aec <__start_il2cpp+0x12c328>
 12d3ab0: 7100091f     	cmp	w8, #0x2
 12d3ab4: 540000a1     	b.ne	0x12d3ac8 <__start_il2cpp+0x12c304>
 12d3ab8: d000ac88     	adrp	x8, 0x2865000
 12d3abc: f9402275     	ldr	x21, [x19, #0x40]
 12d3ac0: f9429d08     	ldr	x8, [x8, #0x538]
 12d3ac4: 1400000a     	b	0x12d3aec <__start_il2cpp+0x12c328>
 12d3ac8: b9402268     	ldr	w8, [x19, #0x20]
 12d3acc: f9402275     	ldr	x21, [x19, #0x40]
 12d3ad0: 7100551f     	cmp	w8, #0x15
 12d3ad4: 54000081     	b.ne	0x12d3ae4 <__start_il2cpp+0x12c320>
 12d3ad8: d000ac88     	adrp	x8, 0x2865000
 12d3adc: f942a908     	ldr	x8, [x8, #0x550]
 12d3ae0: 14000003     	b	0x12d3aec <__start_il2cpp+0x12c328>
 12d3ae4: d000ac88     	adrp	x8, 0x2865000
 12d3ae8: f942b908     	ldr	x8, [x8, #0x570]
 12d3aec: f9400100     	ldr	x0, [x8]
 12d3af0: 2a1f03e1     	mov	w1, wzr
 12d3af4: aa1f03e2     	mov	x2, xzr
 12d3af8: 94005c5c     	bl	0x12eac68 <__start_il2cpp+0x1434a4>
 12d3afc: b4001c75     	cbz	x21, 0x12d3e88 <__start_il2cpp+0x12c6c4>
 12d3b00: aa0003e1     	mov	x1, x0
 12d3b04: aa1503e0     	mov	x0, x21
 12d3b08: aa1f03e2     	mov	x2, xzr
 12d3b0c: 97fe9f19     	bl	0x127b770 <__start_il2cpp+0xd3fac>
 12d3b10: b9402668     	ldr	w8, [x19, #0x24]
 12d3b14: 7100051f     	cmp	w8, #0x1
 12d3b18: 54000121     	b.ne	0x12d3b3c <__start_il2cpp+0x12c378>
 12d3b1c: f9405660     	ldr	x0, [x19, #0xa8]
 12d3b20: b4001b40     	cbz	x0, 0x12d3e88 <__start_il2cpp+0x12c6c4>
 12d3b24: b9402261     	ldr	w1, [x19, #0x20]
 12d3b28: aa1f03e2     	mov	x2, xzr
 12d3b2c: 97feeaab     	bl	0x128e5d8 <__start_il2cpp+0xe6e14>
 12d3b30: 6b00029f     	cmp	w20, w0
 12d3b34: 5400012b     	b.lt	0x12d3b58 <__start_il2cpp+0x12c394>
 12d3b38: b9402668     	ldr	w8, [x19, #0x24]
 12d3b3c: 7100091f     	cmp	w8, #0x2
 12d3b40: 540000c0     	b.eq	0x12d3b58 <__start_il2cpp+0x12c394>
 12d3b44: 7100029f     	cmp	w20, #0x0
 12d3b48: 540007ec     	b.gt	0x12d3c44 <__start_il2cpp+0x12c480>
 12d3b4c: 51000d08     	sub	w8, w8, #0x3
 12d3b50: 7100091f     	cmp	w8, #0x2
 12d3b54: 54000782     	b.hs	0x12d3c44 <__start_il2cpp+0x12c480>
 12d3b58: f9405660     	ldr	x0, [x19, #0xa8]
 12d3b5c: b4001960     	cbz	x0, 0x12d3e88 <__start_il2cpp+0x12c6c4>
 12d3b60: b9402261     	ldr	w1, [x19, #0x20]
 12d3b64: 2a1403e2     	mov	w2, w20
 12d3b68: aa1f03e3     	mov	x3, xzr
 12d3b6c: 97fee843     	bl	0x128dc78 <__start_il2cpp+0xe64b4>
 12d3b70: f9401e68     	ldr	x8, [x19, #0x38]
 12d3b74: b9002a60     	str	w0, [x19, #0x28]
 12d3b78: b4001888     	cbz	x8, 0x12d3e88 <__start_il2cpp+0x12c6c4>
 12d3b7c: 52800021     	mov	w1, #0x1                // =1
 12d3b80: aa0803e0     	mov	x0, x8
 12d3b84: aa1f03e2     	mov	x2, xzr
 12d3b88: 944786c2     	bl	0x24b5690 <__start_il2cpp+0x130decc>
 12d3b8c: f9402e60     	ldr	x0, [x19, #0x58]
 12d3b90: b40017c0     	cbz	x0, 0x12d3e88 <__start_il2cpp+0x12c6c4>
 12d3b94: 52800021     	mov	w1, #0x1                // =1
 12d3b98: aa1f03e2     	mov	x2, xzr
 12d3b9c: 944786bd     	bl	0x24b5690 <__start_il2cpp+0x130decc>
 12d3ba0: b9402269     	ldr	w9, [x19, #0x20]
 12d3ba4: 51001528     	sub	w8, w9, #0x5
 12d3ba8: 71000d1f     	cmp	w8, #0x3
 12d3bac: 1a9f27e8     	cset	w8, lo
 12d3bb0: 7100253f     	cmp	w9, #0x9
 12d3bb4: 1a9f17e9     	cset	w9, eq
 12d3bb8: 71001a9f     	cmp	w20, #0x6
 12d3bbc: 540003eb     	b.lt	0x12d3c38 <__start_il2cpp+0x12c474>
 12d3bc0: 2a080128     	orr	w8, w9, w8
 12d3bc4: 340003a8     	cbz	w8, 0x12d3c38 <__start_il2cpp+0x12c474>
 12d3bc8: f9401e60     	ldr	x0, [x19, #0x38]
 12d3bcc: b40015e0     	cbz	x0, 0x12d3e88 <__start_il2cpp+0x12c6c4>
 12d3bd0: 2a1f03e1     	mov	w1, wzr
 12d3bd4: aa1f03e2     	mov	x2, xzr
 12d3bd8: 944786ae     	bl	0x24b5690 <__start_il2cpp+0x130decc>
 12d3bdc: f9402e60     	ldr	x0, [x19, #0x58]
 12d3be0: b4001540     	cbz	x0, 0x12d3e88 <__start_il2cpp+0x12c6c4>
 12d3be4: 2a1f03e1     	mov	w1, wzr
 12d3be8: aa1f03e2     	mov	x2, xzr
 12d3bec: 944786a9     	bl	0x24b5690 <__start_il2cpp+0x130decc>
 12d3bf0: d000ac88     	adrp	x8, 0x2865000
 12d3bf4: d000ac89     	adrp	x9, 0x2865000
 12d3bf8: f9402273     	ldr	x19, [x19, #0x40]
 12d3bfc: f942b108     	ldr	x8, [x8, #0x560]
 12d3c00: f942b529     	ldr	x9, [x9, #0x568]
 12d3c04: 71001a9f     	cmp	w20, #0x6
 12d3c08: 2a1f03e1     	mov	w1, wzr
 12d3c0c: aa1f03e2     	mov	x2, xzr
 12d3c10: 9a890108     	csel	x8, x8, x9, eq
 12d3c14: f9400100     	ldr	x0, [x8]
 12d3c18: 94005c14     	bl	0x12eac68 <__start_il2cpp+0x1434a4>
 12d3c1c: b4001373     	cbz	x19, 0x12d3e88 <__start_il2cpp+0x12c6c4>
 12d3c20: aa0003e1     	mov	x1, x0
 12d3c24: aa1303e0     	mov	x0, x19
 12d3c28: a9414ff4     	ldp	x20, x19, [sp, #0x10]
 12d3c2c: aa1f03e2     	mov	x2, xzr
 12d3c30: a8c257fe     	ldp	x30, x21, [sp], #0x20
 12d3c34: 17fe9ecf     	b	0x127b770 <__start_il2cpp+0xd3fac>
 12d3c38: a9414ff4     	ldp	x20, x19, [sp, #0x10]
 12d3c3c: a8c257fe     	ldp	x30, x21, [sp], #0x20
 12d3c40: d65f03c0     	ret
 12d3c44: b9402268     	ldr	w8, [x19, #0x20]
 12d3c48: 7100551f     	cmp	w8, #0x15
 12d3c4c: 540001c1     	b.ne	0x12d3c84 <__start_il2cpp+0x12c4c0>
 12d3c50: f9405260     	ldr	x0, [x19, #0xa0]
 12d3c54: b40011a0     	cbz	x0, 0x12d3e88 <__start_il2cpp+0x12c6c4>
 12d3c58: f9405675     	ldr	x21, [x19, #0xa8]
 12d3c5c: aa1f03e1     	mov	x1, xzr
 12d3c60: 97ff4a6b     	bl	0x12a660c <__start_il2cpp+0xfee48>
 12d3c64: b4001135     	cbz	x21, 0x12d3e88 <__start_il2cpp+0x12c6c4>
 12d3c68: 2a0003e1     	mov	w1, w0
 12d3c6c: 528002e2     	mov	w2, #0x17               // =23
 12d3c70: aa1503e0     	mov	x0, x21
 12d3c74: aa1f03e3     	mov	x3, xzr
 12d3c78: 97fee740     	bl	0x128d978 <__start_il2cpp+0xe61b4>
 12d3c7c: 7100041f     	cmp	w0, #0x1
 12d3c80: 54fff6c0     	b.eq	0x12d3b58 <__start_il2cpp+0x12c394>
 12d3c84: f9401e60     	ldr	x0, [x19, #0x38]
 12d3c88: b4001000     	cbz	x0, 0x12d3e88 <__start_il2cpp+0x12c6c4>
 12d3c8c: 2a1f03e1     	mov	w1, wzr
 12d3c90: aa1f03e2     	mov	x2, xzr
 12d3c94: 9447867f     	bl	0x24b5690 <__start_il2cpp+0x130decc>
 12d3c98: f9402e60     	ldr	x0, [x19, #0x58]
 12d3c9c: b4000f60     	cbz	x0, 0x12d3e88 <__start_il2cpp+0x12c6c4>
 12d3ca0: 2a1f03e1     	mov	w1, wzr
 12d3ca4: aa1f03e2     	mov	x2, xzr
 12d3ca8: 9447867a     	bl	0x24b5690 <__start_il2cpp+0x130decc>
 12d3cac: b9402668     	ldr	w8, [x19, #0x24]
 12d3cb0: 7100111f     	cmp	w8, #0x4
 12d3cb4: 54000340     	b.eq	0x12d3d1c <__start_il2cpp+0x12c558>
 12d3cb8: 71000d1f     	cmp	w8, #0x3
 12d3cbc: 54000381     	b.ne	0x12d3d2c <__start_il2cpp+0x12c568>
 12d3cc0: f9405260     	ldr	x0, [x19, #0xa0]
 12d3cc4: b4000e20     	cbz	x0, 0x12d3e88 <__start_il2cpp+0x12c6c4>
 12d3cc8: f9405674     	ldr	x20, [x19, #0xa8]
 12d3ccc: aa1f03e1     	mov	x1, xzr
 12d3cd0: 97ff4a4f     	bl	0x12a660c <__start_il2cpp+0xfee48>
 12d3cd4: b4000db4     	cbz	x20, 0x12d3e88 <__start_il2cpp+0x12c6c4>
 12d3cd8: 2a0003e1     	mov	w1, w0
 12d3cdc: aa1403e0     	mov	x0, x20
 12d3ce0: aa1f03e2     	mov	x2, xzr
 12d3ce4: 97feeb8b     	bl	0x128eb10 <__start_il2cpp+0xe734c>
 12d3ce8: 7100381f     	cmp	w0, #0xe
 12d3cec: 540009a8     	b.hi	0x12d3e20 <__start_il2cpp+0x12c65c>
 12d3cf0: 90ff9f29     	adrp	x9, 0x6b7000
 12d3cf4: 2a0003e8     	mov	w8, w0
 12d3cf8: 912ad129     	add	x9, x9, #0xab4
 12d3cfc: 1000008a     	adr	x10, 0x12d3d0c <__start_il2cpp+0x12c548>
 12d3d00: 3868692b     	ldrb	w11, [x9, x8]
 12d3d04: 8b0b094a     	add	x10, x10, x11, lsl #2
 12d3d08: d61f0140     	br	x10
 12d3d0c: b9402268     	ldr	w8, [x19, #0x20]
 12d3d10: 71003d1f     	cmp	w8, #0xf
 12d3d14: 54000861     	b.ne	0x12d3e20 <__start_il2cpp+0x12c65c>
 12d3d18: 14000049     	b	0x12d3e3c <__start_il2cpp+0x12c678>
 12d3d1c: d000ac88     	adrp	x8, 0x2865000
 12d3d20: f9402274     	ldr	x20, [x19, #0x40]
 12d3d24: f942ad08     	ldr	x8, [x8, #0x558]
 12d3d28: 14000048     	b	0x12d3e48 <__start_il2cpp+0x12c684>
 12d3d2c: b9402268     	ldr	w8, [x19, #0x20]
 12d3d30: f9402274     	ldr	x20, [x19, #0x40]
 12d3d34: 7100551f     	cmp	w8, #0x15
 12d3d38: 54000081     	b.ne	0x12d3d48 <__start_il2cpp+0x12c584>
 12d3d3c: d000ac88     	adrp	x8, 0x2865000
 12d3d40: f942a508     	ldr	x8, [x8, #0x548]
 12d3d44: 14000041     	b	0x12d3e48 <__start_il2cpp+0x12c684>
 12d3d48: d000ac88     	adrp	x8, 0x2865000
 12d3d4c: f942a108     	ldr	x8, [x8, #0x540]
 12d3d50: 1400003e     	b	0x12d3e48 <__start_il2cpp+0x12c684>
 12d3d54: b9402268     	ldr	w8, [x19, #0x20]
 12d3d58: 7100411f     	cmp	w8, #0x10
 12d3d5c: 54000621     	b.ne	0x12d3e20 <__start_il2cpp+0x12c65c>
 12d3d60: 14000037     	b	0x12d3e3c <__start_il2cpp+0x12c678>
 12d3d64: b9402268     	ldr	w8, [x19, #0x20]
 12d3d68: 7100451f     	cmp	w8, #0x11
 12d3d6c: 540005a1     	b.ne	0x12d3e20 <__start_il2cpp+0x12c65c>
 12d3d70: 14000033     	b	0x12d3e3c <__start_il2cpp+0x12c678>
 12d3d74: b9402268     	ldr	w8, [x19, #0x20]
 12d3d78: 7100491f     	cmp	w8, #0x12
 12d3d7c: 54000521     	b.ne	0x12d3e20 <__start_il2cpp+0x12c65c>
 12d3d80: 1400002f     	b	0x12d3e3c <__start_il2cpp+0x12c678>
 12d3d84: b9402268     	ldr	w8, [x19, #0x20]
 12d3d88: 71004d1f     	cmp	w8, #0x13
 12d3d8c: 540004a1     	b.ne	0x12d3e20 <__start_il2cpp+0x12c65c>
 12d3d90: 1400002b     	b	0x12d3e3c <__start_il2cpp+0x12c678>
 12d3d94: b9402268     	ldr	w8, [x19, #0x20]
 12d3d98: 7100511f     	cmp	w8, #0x14
 12d3d9c: 54000421     	b.ne	0x12d3e20 <__start_il2cpp+0x12c65c>
 12d3da0: 14000027     	b	0x12d3e3c <__start_il2cpp+0x12c678>
 12d3da4: b9402268     	ldr	w8, [x19, #0x20]
 12d3da8: 7100591f     	cmp	w8, #0x16
 12d3dac: 540003a1     	b.ne	0x12d3e20 <__start_il2cpp+0x12c65c>
 12d3db0: 14000023     	b	0x12d3e3c <__start_il2cpp+0x12c678>
 12d3db4: b9402268     	ldr	w8, [x19, #0x20]
 12d3db8: 7100711f     	cmp	w8, #0x1c
 12d3dbc: 54000321     	b.ne	0x12d3e20 <__start_il2cpp+0x12c65c>
 12d3dc0: 1400001f     	b	0x12d3e3c <__start_il2cpp+0x12c678>
 12d3dc4: b9402268     	ldr	w8, [x19, #0x20]
 12d3dc8: 7100751f     	cmp	w8, #0x1d
 12d3dcc: 540002a1     	b.ne	0x12d3e20 <__start_il2cpp+0x12c65c>
 12d3dd0: 1400001b     	b	0x12d3e3c <__start_il2cpp+0x12c678>
 12d3dd4: b9402268     	ldr	w8, [x19, #0x20]
 12d3dd8: 7100791f     	cmp	w8, #0x1e
 12d3ddc: 54000221     	b.ne	0x12d3e20 <__start_il2cpp+0x12c65c>
 12d3de0: 14000017     	b	0x12d3e3c <__start_il2cpp+0x12c678>
 12d3de4: b9402268     	ldr	w8, [x19, #0x20]
 12d3de8: 71007d1f     	cmp	w8, #0x1f
 12d3dec: 540001a1     	b.ne	0x12d3e20 <__start_il2cpp+0x12c65c>
 12d3df0: 14000013     	b	0x12d3e3c <__start_il2cpp+0x12c678>
 12d3df4: b9402268     	ldr	w8, [x19, #0x20]
 12d3df8: 7100811f     	cmp	w8, #0x20
 12d3dfc: 54000121     	b.ne	0x12d3e20 <__start_il2cpp+0x12c65c>
 12d3e00: 1400000f     	b	0x12d3e3c <__start_il2cpp+0x12c678>
 12d3e04: b9402268     	ldr	w8, [x19, #0x20]
 12d3e08: 7100851f     	cmp	w8, #0x21
 12d3e0c: 540000a1     	b.ne	0x12d3e20 <__start_il2cpp+0x12c65c>
 12d3e10: 1400000b     	b	0x12d3e3c <__start_il2cpp+0x12c678>
 12d3e14: b9402268     	ldr	w8, [x19, #0x20]
 12d3e18: 7100891f     	cmp	w8, #0x22
 12d3e1c: 54000100     	b.eq	0x12d3e3c <__start_il2cpp+0x12c678>
 12d3e20: d000ac88     	adrp	x8, 0x2865000
 12d3e24: f9402274     	ldr	x20, [x19, #0x40]
 12d3e28: f9429908     	ldr	x8, [x8, #0x530]
 12d3e2c: 14000007     	b	0x12d3e48 <__start_il2cpp+0x12c684>
 12d3e30: b9402268     	ldr	w8, [x19, #0x20]
 12d3e34: 71008d1f     	cmp	w8, #0x23
 12d3e38: 54ffff41     	b.ne	0x12d3e20 <__start_il2cpp+0x12c65c>
 12d3e3c: d000ac88     	adrp	x8, 0x2865000
 12d3e40: f9402274     	ldr	x20, [x19, #0x40]
 12d3e44: f9429508     	ldr	x8, [x8, #0x528]
 12d3e48: f9400100     	ldr	x0, [x8]
 12d3e4c: 2a1f03e1     	mov	w1, wzr
 12d3e50: aa1f03e2     	mov	x2, xzr
 12d3e54: 94005b85     	bl	0x12eac68 <__start_il2cpp+0x1434a4>
 12d3e58: b4000194     	cbz	x20, 0x12d3e88 <__start_il2cpp+0x12c6c4>
 12d3e5c: aa0003e1     	mov	x1, x0
 12d3e60: aa1403e0     	mov	x0, x20
 12d3e64: aa1f03e2     	mov	x2, xzr
 12d3e68: 97fe9e42     	bl	0x127b770 <__start_il2cpp+0xd3fac>
 12d3e6c: f9402e60     	ldr	x0, [x19, #0x58]
 12d3e70: b40000c0     	cbz	x0, 0x12d3e88 <__start_il2cpp+0x12c6c4>
 12d3e74: a9414ff4     	ldp	x20, x19, [sp, #0x10]
 12d3e78: 2a1f03e1     	mov	w1, wzr
 12d3e7c: aa1f03e2     	mov	x2, xzr
 12d3e80: a8c257fe     	ldp	x30, x21, [sp], #0x20
 12d3e84: 14478603     	b	0x24b5690 <__start_il2cpp+0x130decc>
 12d3e88: 97f7b09e     	bl	0x10c0100 <CloseNLSocket+0x638>
