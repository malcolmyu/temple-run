
/tmp/temple-libil2cpp.so:	file format elf64-littleaarch64

Disassembly of section il2cpp:

00000000011a77c4 <__start_il2cpp>:
 12e1c18: a9bd5ffe     	stp	x30, x23, [sp, #-0x30]!
 12e1c1c: a90157f6     	stp	x22, x21, [sp, #0x10]
 12e1c20: a9024ff4     	stp	x20, x19, [sp, #0x20]
 12e1c24: 9000bab4     	adrp	x20, 0x2a35000
 12e1c28: 396c2e88     	ldrb	w8, [x20, #0xb0b]
 12e1c2c: aa0003f3     	mov	x19, x0
 12e1c30: 37000308     	tbnz	w8, #0x0, 0x12e1c90 <__start_il2cpp+0x13a4cc>
 12e1c34: f000abc0     	adrp	x0, 0x285c000 <_ZTVN10__cxxabiv119__pointer_type_infoE+0x18>
 12e1c38: f9456000     	ldr	x0, [x0, #0xac0]
 12e1c3c: 97f778a7     	bl	0x10bfed8 <CloseNLSocket+0x410>
 12e1c40: b000ac00     	adrp	x0, 0x2862000
 12e1c44: f9424800     	ldr	x0, [x0, #0x490]
 12e1c48: 97f778a4     	bl	0x10bfed8 <CloseNLSocket+0x410>
 12e1c4c: 9000ac20     	adrp	x0, 0x2865000
 12e1c50: f9479400     	ldr	x0, [x0, #0xf28]
 12e1c54: 97f778a1     	bl	0x10bfed8 <CloseNLSocket+0x410>
 12e1c58: 9000ac20     	adrp	x0, 0x2865000
 12e1c5c: f9479800     	ldr	x0, [x0, #0xf30]
 12e1c60: 97f7789e     	bl	0x10bfed8 <CloseNLSocket+0x410>
 12e1c64: 9000abe0     	adrp	x0, 0x285d000
 12e1c68: f940a000     	ldr	x0, [x0, #0x140]
 12e1c6c: 97f7789b     	bl	0x10bfed8 <CloseNLSocket+0x410>
 12e1c70: 9000abe0     	adrp	x0, 0x285d000
 12e1c74: f942ec00     	ldr	x0, [x0, #0x5d8]
 12e1c78: 97f77898     	bl	0x10bfed8 <CloseNLSocket+0x410>
 12e1c7c: 9000ac20     	adrp	x0, 0x2865000
 12e1c80: f9479c00     	ldr	x0, [x0, #0xf38]
 12e1c84: 97f77895     	bl	0x10bfed8 <CloseNLSocket+0x410>
 12e1c88: 52800028     	mov	w8, #0x1                // =1
 12e1c8c: 392c2e88     	strb	w8, [x20, #0xb0b]
 12e1c90: b9403268     	ldr	w8, [x19, #0x30]
 12e1c94: 34000328     	cbz	w8, 0x12e1cf8 <__start_il2cpp+0x13a534>
 12e1c98: b9403668     	ldr	w8, [x19, #0x34]
 12e1c9c: 340002e8     	cbz	w8, 0x12e1cf8 <__start_il2cpp+0x13a534>
 12e1ca0: aa1303e0     	mov	x0, x19
 12e1ca4: 940003b6     	bl	0x12e2b7c <__start_il2cpp+0x13b3b8>
 12e1ca8: aa1303e0     	mov	x0, x19
 12e1cac: aa1f03e1     	mov	x1, xzr
 12e1cb0: 97ff2fc0     	bl	0x12adbb0 <__start_il2cpp+0x1063ec>
 12e1cb4: b000ac16     	adrp	x22, 0x2862000
 12e1cb8: f9424ad6     	ldr	x22, [x22, #0x490]
 12e1cbc: 29465275     	ldp	w21, w20, [x19, #0x30]
 12e1cc0: f94002c0     	ldr	x0, [x22]
 12e1cc4: b940e008     	ldr	w8, [x0, #0xe0]
 12e1cc8: 35000048     	cbnz	w8, 0x12e1cd0 <__start_il2cpp+0x13a50c>
 12e1ccc: 97f778c5     	bl	0x10bffe0 <CloseNLSocket+0x518>
 12e1cd0: 2a1503e0     	mov	w0, w21
 12e1cd4: 2a1403e1     	mov	w1, w20
 12e1cd8: 94000081     	bl	0x12e1edc <__start_il2cpp+0x13a718>
 12e1cdc: 9000abe8     	adrp	x8, 0x285d000
 12e1ce0: f940a108     	ldr	x8, [x8, #0x140]
 12e1ce4: aa1f03e2     	mov	x2, xzr
 12e1ce8: aa0003f4     	mov	x20, x0
 12e1cec: f9400101     	ldr	x1, [x8]
 12e1cf0: 94298712     	bl	0x1d43938 <__start_il2cpp+0xb9c174>
 12e1cf4: 360000a0     	tbz	w0, #0x0, 0x12e1d08 <__start_il2cpp+0x13a544>
 12e1cf8: a9424ff4     	ldp	x20, x19, [sp, #0x20]
 12e1cfc: a94157f6     	ldp	x22, x21, [sp, #0x10]
 12e1d00: a8c35ffe     	ldp	x30, x23, [sp], #0x30
 12e1d04: d65f03c0     	ret
 12e1d08: 9000ac28     	adrp	x8, 0x2865000
 12e1d0c: f9479d08     	ldr	x8, [x8, #0xf38]
 12e1d10: aa1303e0     	mov	x0, x19
 12e1d14: aa1403e1     	mov	x1, x20
 12e1d18: aa1f03e3     	mov	x3, xzr
 12e1d1c: f9400102     	ldr	x2, [x8]
 12e1d20: 97ff2e8e     	bl	0x12ad758 <__start_il2cpp+0x105f94>
 12e1d24: f000abd7     	adrp	x23, 0x285c000 <_ZTVN10__cxxabiv119__pointer_type_infoE+0x18>
 12e1d28: f94562f7     	ldr	x23, [x23, #0xac0]
 12e1d2c: aa0003f5     	mov	x21, x0
 12e1d30: f94002e8     	ldr	x8, [x23]
 12e1d34: b940e109     	ldr	w9, [x8, #0xe0]
 12e1d38: 35000069     	cbnz	w9, 0x12e1d44 <__start_il2cpp+0x13a580>
 12e1d3c: aa0803e0     	mov	x0, x8
 12e1d40: 97f778a8     	bl	0x10bffe0 <CloseNLSocket+0x518>
 12e1d44: aa1503e0     	mov	x0, x21
 12e1d48: aa1f03e1     	mov	x1, xzr
 12e1d4c: aa1f03e2     	mov	x2, xzr
 12e1d50: 94475dd2     	bl	0x24b9498 <__start_il2cpp+0x1311cd4>
 12e1d54: 36000200     	tbz	w0, #0x0, 0x12e1d94 <__start_il2cpp+0x13a5d0>
 12e1d58: 9000ac28     	adrp	x8, 0x2865000
 12e1d5c: 9000abe9     	adrp	x9, 0x285d000
 12e1d60: f9479908     	ldr	x8, [x8, #0xf30]
 12e1d64: f942ed29     	ldr	x9, [x9, #0x5d8]
 12e1d68: aa1403e1     	mov	x1, x20
 12e1d6c: aa1f03e3     	mov	x3, xzr
 12e1d70: f9400100     	ldr	x0, [x8]
 12e1d74: f9400122     	ldr	x2, [x9]
 12e1d78: 94298836     	bl	0x1d43e50 <__start_il2cpp+0xb9c68c>
 12e1d7c: aa1303e1     	mov	x1, x19
 12e1d80: a9424ff4     	ldp	x20, x19, [sp, #0x20]
 12e1d84: a94157f6     	ldp	x22, x21, [sp, #0x10]
 12e1d88: aa1f03e2     	mov	x2, xzr
 12e1d8c: a8c35ffe     	ldp	x30, x23, [sp], #0x30
 12e1d90: 140053ed     	b	0x12f6d44 <__start_il2cpp+0x14f580>
 12e1d94: f94002e0     	ldr	x0, [x23]
 12e1d98: f9401674     	ldr	x20, [x19, #0x28]
 12e1d9c: b940e008     	ldr	w8, [x0, #0xe0]
 12e1da0: 35000048     	cbnz	w8, 0x12e1da8 <__start_il2cpp+0x13a5e4>
 12e1da4: 97f7788f     	bl	0x10bffe0 <CloseNLSocket+0x518>
 12e1da8: aa1403e0     	mov	x0, x20
 12e1dac: aa1f03e1     	mov	x1, xzr
 12e1db0: aa1f03e2     	mov	x2, xzr
 12e1db4: 94475db9     	bl	0x24b9498 <__start_il2cpp+0x1311cd4>
 12e1db8: 360001c0     	tbz	w0, #0x0, 0x12e1df0 <__start_il2cpp+0x13a62c>
 12e1dbc: aa1303e0     	mov	x0, x19
 12e1dc0: aa1f03e1     	mov	x1, xzr
 12e1dc4: 944768d1     	bl	0x24bc108 <__start_il2cpp+0x1314944>
 12e1dc8: 9000ac28     	adrp	x8, 0x2865000
 12e1dcc: f9479508     	ldr	x8, [x8, #0xf28]
 12e1dd0: aa0003e1     	mov	x1, x0
 12e1dd4: aa1f03e2     	mov	x2, xzr
 12e1dd8: f9400108     	ldr	x8, [x8]
 12e1ddc: aa0803e0     	mov	x0, x8
 12e1de0: 9429642f     	bl	0x1d3ae9c <__start_il2cpp+0xb936d8>
 12e1de4: aa1303e1     	mov	x1, x19
 12e1de8: aa1f03e2     	mov	x2, xzr
 12e1dec: 940053d6     	bl	0x12f6d44 <__start_il2cpp+0x14f580>
 12e1df0: f94002c0     	ldr	x0, [x22]
 12e1df4: b9403274     	ldr	w20, [x19, #0x30]
 12e1df8: b940e008     	ldr	w8, [x0, #0xe0]
 12e1dfc: 35000048     	cbnz	w8, 0x12e1e04 <__start_il2cpp+0x13a640>
 12e1e00: 97f77878     	bl	0x10bffe0 <CloseNLSocket+0x518>
 12e1e04: 51002e88     	sub	w8, w20, #0xb
 12e1e08: 7100651f     	cmp	w8, #0x19
 12e1e0c: 540004e8     	b.hi	0x12e1ea8 <__start_il2cpp+0x13a6e4>
 12e1e10: 52800028     	mov	w8, #0x1                // =1
 12e1e14: 3900f268     	strb	w8, [x19, #0x3c]
 12e1e18: 39010268     	strb	w8, [x19, #0x40]
 12e1e1c: f94002c0     	ldr	x0, [x22]
 12e1e20: b9403274     	ldr	w20, [x19, #0x30]
 12e1e24: b940e008     	ldr	w8, [x0, #0xe0]
 12e1e28: 35000048     	cbnz	w8, 0x12e1e30 <__start_il2cpp+0x13a66c>
 12e1e2c: 97f7786d     	bl	0x10bffe0 <CloseNLSocket+0x518>
 12e1e30: 51002e88     	sub	w8, w20, #0xb
 12e1e34: 7100151f     	cmp	w8, #0x5
 12e1e38: 54000068     	b.hi	0x12e1e44 <__start_il2cpp+0x13a680>
 12e1e3c: 52800028     	mov	w8, #0x1                // =1
 12e1e40: 14000019     	b	0x12e1ea4 <__start_il2cpp+0x13a6e0>
 12e1e44: f94002c0     	ldr	x0, [x22]
 12e1e48: b9403274     	ldr	w20, [x19, #0x30]
 12e1e4c: b940e008     	ldr	w8, [x0, #0xe0]
 12e1e50: 35000048     	cbnz	w8, 0x12e1e58 <__start_il2cpp+0x13a694>
 12e1e54: 97f77863     	bl	0x10bffe0 <CloseNLSocket+0x518>
 12e1e58: 51004688     	sub	w8, w20, #0x11
 12e1e5c: 7100351f     	cmp	w8, #0xd
 12e1e60: 54000068     	b.hi	0x12e1e6c <__start_il2cpp+0x13a6a8>
 12e1e64: 52800048     	mov	w8, #0x2                // =2
 12e1e68: 1400000f     	b	0x12e1ea4 <__start_il2cpp+0x13a6e0>
 12e1e6c: b9403274     	ldr	w20, [x19, #0x30]
 12e1e70: 51007e88     	sub	w8, w20, #0x1f
 12e1e74: 7100051f     	cmp	w8, #0x1
 12e1e78: 54000068     	b.hi	0x12e1e84 <__start_il2cpp+0x13a6c0>
 12e1e7c: 528000c8     	mov	w8, #0x6                // =6
 12e1e80: 14000009     	b	0x12e1ea4 <__start_il2cpp+0x13a6e0>
 12e1e84: f94002c0     	ldr	x0, [x22]
 12e1e88: b940e008     	ldr	w8, [x0, #0xe0]
 12e1e8c: 35000048     	cbnz	w8, 0x12e1e94 <__start_il2cpp+0x13a6d0>
 12e1e90: 97f77854     	bl	0x10bffe0 <CloseNLSocket+0x518>
 12e1e94: 51008688     	sub	w8, w20, #0x21
 12e1e98: 71000d1f     	cmp	w8, #0x3
 12e1e9c: 54000068     	b.hi	0x12e1ea8 <__start_il2cpp+0x13a6e4>
 12e1ea0: 528000e8     	mov	w8, #0x7                // =7
 12e1ea4: b9003a68     	str	w8, [x19, #0x38]
 12e1ea8: aa1303e0     	mov	x0, x19
 12e1eac: 94000281     	bl	0x12e28b0 <__start_il2cpp+0x13b0ec>
 12e1eb0: 3607f240     	tbz	w0, #0x0, 0x12e1cf8 <__start_il2cpp+0x13a534>
 12e1eb4: 52800028     	mov	w8, #0x1                // =1
 12e1eb8: 39010268     	strb	w8, [x19, #0x40]
 12e1ebc: 17ffff8f     	b	0x12e1cf8 <__start_il2cpp+0x13a534>
