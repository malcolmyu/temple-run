
/tmp/temple-libil2cpp.so:	file format elf64-littleaarch64

Disassembly of section il2cpp:

00000000011a77c4 <__start_il2cpp>:
 12a1d94: a9bd5ffe     	stp	x30, x23, [sp, #-0x30]!
 12a1d98: a90157f6     	stp	x22, x21, [sp, #0x10]
 12a1d9c: a9024ff4     	stp	x20, x19, [sp, #0x20]
 12a1da0: 9000bcb4     	adrp	x20, 0x2a35000
 12a1da4: b000adf7     	adrp	x23, 0x285e000
 12a1da8: b000adf6     	adrp	x22, 0x285e000
 12a1dac: 39642e88     	ldrb	w8, [x20, #0x90b]
 12a1db0: f941cef7     	ldr	x23, [x23, #0x398]
 12a1db4: f941cad6     	ldr	x22, [x22, #0x390]
 12a1db8: aa0003f3     	mov	x19, x0
 12a1dbc: 37000188     	tbnz	w8, #0x0, 0x12a1dec <__start_il2cpp+0xfa628>
 12a1dc0: b000ade0     	adrp	x0, 0x285e000
 12a1dc4: f941c000     	ldr	x0, [x0, #0x380]
 12a1dc8: 97f87844     	bl	0x10bfed8 <CloseNLSocket+0x410>
 12a1dcc: b000ade0     	adrp	x0, 0x285e000
 12a1dd0: f941c800     	ldr	x0, [x0, #0x390]
 12a1dd4: 97f87841     	bl	0x10bfed8 <CloseNLSocket+0x410>
 12a1dd8: b000ade0     	adrp	x0, 0x285e000
 12a1ddc: f941cc00     	ldr	x0, [x0, #0x398]
 12a1de0: 97f8783e     	bl	0x10bfed8 <CloseNLSocket+0x410>
 12a1de4: 52800028     	mov	w8, #0x1                // =1
 12a1de8: 39242e88     	strb	w8, [x20, #0x90b]
 12a1dec: d0ff9fa8     	adrp	x8, 0x697000
 12a1df0: 3dc37100     	ldr	q0, [x8, #0xdc0]
 12a1df4: 528012c8     	mov	w8, #0x96               // =150
 12a1df8: b9003a68     	str	w8, [x19, #0x38]
 12a1dfc: 3c828260     	stur	q0, [x19, #0x28]
 12a1e00: f94002e0     	ldr	x0, [x23]
 12a1e04: 97f878bc     	bl	0x10c00f4 <CloseNLSocket+0x62c>
 12a1e08: f94002c1     	ldr	x1, [x22]
 12a1e0c: aa0003f4     	mov	x20, x0
 12a1e10: 9418f6e9     	bl	0x18df9b4 <__start_il2cpp+0x7381f0>
 12a1e14: b4001794     	cbz	x20, 0x12a2104 <__start_il2cpp+0xfa940>
 12a1e18: b000adf5     	adrp	x21, 0x285e000
 12a1e1c: f941c2b5     	ldr	x21, [x21, #0x380]
 12a1e20: b9401e8a     	ldr	w10, [x20, #0x1c]
 12a1e24: f9400a88     	ldr	x8, [x20, #0x10]
 12a1e28: f94002a9     	ldr	x9, [x21]
 12a1e2c: 1100054a     	add	w10, w10, #0x1
 12a1e30: b9001e8a     	str	w10, [x20, #0x1c]
 12a1e34: b4001688     	cbz	x8, 0x12a2104 <__start_il2cpp+0xfa940>
 12a1e38: b9801a8a     	ldrsw	x10, [x20, #0x18]
 12a1e3c: b940190b     	ldr	w11, [x8, #0x18]
 12a1e40: 6b0b015f     	cmp	w10, w11
 12a1e44: 54000142     	b.hs	0x12a1e6c <__start_il2cpp+0xfa6a8>
 12a1e48: 1100054b     	add	w11, w10, #0x1
 12a1e4c: 8b0a090a     	add	x10, x8, x10, lsl #2
 12a1e50: 5280064c     	mov	w12, #0x32              // =50
 12a1e54: b9001a8b     	str	w11, [x20, #0x18]
 12a1e58: b900214c     	str	w12, [x10, #0x20]
 12a1e5c: b9401e8a     	ldr	w10, [x20, #0x1c]
 12a1e60: 1100054a     	add	w10, w10, #0x1
 12a1e64: b9001e8a     	str	w10, [x20, #0x1c]
 12a1e68: 1400000d     	b	0x12a1e9c <__start_il2cpp+0xfa6d8>
 12a1e6c: f9401128     	ldr	x8, [x9, #0x20]
 12a1e70: 52800641     	mov	w1, #0x32               // =50
 12a1e74: aa1403e0     	mov	x0, x20
 12a1e78: f9406108     	ldr	x8, [x8, #0xc0]
 12a1e7c: f9403902     	ldr	x2, [x8, #0x70]
 12a1e80: 9418f8cb     	bl	0x18e01ac <__start_il2cpp+0x7389e8>
 12a1e84: b9401e8a     	ldr	w10, [x20, #0x1c]
 12a1e88: f9400a88     	ldr	x8, [x20, #0x10]
 12a1e8c: f94002a9     	ldr	x9, [x21]
 12a1e90: 1100054a     	add	w10, w10, #0x1
 12a1e94: b9001e8a     	str	w10, [x20, #0x1c]
 12a1e98: b4001368     	cbz	x8, 0x12a2104 <__start_il2cpp+0xfa940>
 12a1e9c: b9801a8a     	ldrsw	x10, [x20, #0x18]
 12a1ea0: b940190b     	ldr	w11, [x8, #0x18]
 12a1ea4: 6b0b015f     	cmp	w10, w11
 12a1ea8: 54000142     	b.hs	0x12a1ed0 <__start_il2cpp+0xfa70c>
 12a1eac: 1100054b     	add	w11, w10, #0x1
 12a1eb0: 8b0a090a     	add	x10, x8, x10, lsl #2
 12a1eb4: 5280082c     	mov	w12, #0x41              // =65
 12a1eb8: b9001a8b     	str	w11, [x20, #0x18]
 12a1ebc: b900214c     	str	w12, [x10, #0x20]
 12a1ec0: b9401e8a     	ldr	w10, [x20, #0x1c]
 12a1ec4: 1100054a     	add	w10, w10, #0x1
 12a1ec8: b9001e8a     	str	w10, [x20, #0x1c]
 12a1ecc: 1400000d     	b	0x12a1f00 <__start_il2cpp+0xfa73c>
 12a1ed0: f9401128     	ldr	x8, [x9, #0x20]
 12a1ed4: 52800821     	mov	w1, #0x41               // =65
 12a1ed8: aa1403e0     	mov	x0, x20
 12a1edc: f9406108     	ldr	x8, [x8, #0xc0]
 12a1ee0: f9403902     	ldr	x2, [x8, #0x70]
 12a1ee4: 9418f8b2     	bl	0x18e01ac <__start_il2cpp+0x7389e8>
 12a1ee8: b9401e8a     	ldr	w10, [x20, #0x1c]
 12a1eec: f9400a88     	ldr	x8, [x20, #0x10]
 12a1ef0: f94002a9     	ldr	x9, [x21]
 12a1ef4: 1100054a     	add	w10, w10, #0x1
 12a1ef8: b9001e8a     	str	w10, [x20, #0x1c]
 12a1efc: b4001048     	cbz	x8, 0x12a2104 <__start_il2cpp+0xfa940>
 12a1f00: b9801a8a     	ldrsw	x10, [x20, #0x18]
 12a1f04: b940190b     	ldr	w11, [x8, #0x18]
 12a1f08: 6b0b015f     	cmp	w10, w11
 12a1f0c: 540000e2     	b.hs	0x12a1f28 <__start_il2cpp+0xfa764>
 12a1f10: 11000549     	add	w9, w10, #0x1
 12a1f14: 8b0a0908     	add	x8, x8, x10, lsl #2
 12a1f18: 52800aaa     	mov	w10, #0x55              // =85
 12a1f1c: b9001a89     	str	w9, [x20, #0x18]
 12a1f20: b900210a     	str	w10, [x8, #0x20]
 12a1f24: 14000007     	b	0x12a1f40 <__start_il2cpp+0xfa77c>
 12a1f28: f9401128     	ldr	x8, [x9, #0x20]
 12a1f2c: 52800aa1     	mov	w1, #0x55               // =85
 12a1f30: aa1403e0     	mov	x0, x20
 12a1f34: f9406108     	ldr	x8, [x8, #0xc0]
 12a1f38: f9403902     	ldr	x2, [x8, #0x70]
 12a1f3c: 9418f89c     	bl	0x18e01ac <__start_il2cpp+0x7389e8>
 12a1f40: f9002274     	str	x20, [x19, #0x40]
 12a1f44: f94002e0     	ldr	x0, [x23]
 12a1f48: 97f8786b     	bl	0x10c00f4 <CloseNLSocket+0x62c>
 12a1f4c: f94002c1     	ldr	x1, [x22]
 12a1f50: aa0003f4     	mov	x20, x0
 12a1f54: 9418f698     	bl	0x18df9b4 <__start_il2cpp+0x7381f0>
 12a1f58: b4000d74     	cbz	x20, 0x12a2104 <__start_il2cpp+0xfa940>
 12a1f5c: b9401e8a     	ldr	w10, [x20, #0x1c]
 12a1f60: f9400a88     	ldr	x8, [x20, #0x10]
 12a1f64: f94002a9     	ldr	x9, [x21]
 12a1f68: 1100054a     	add	w10, w10, #0x1
 12a1f6c: b9001e8a     	str	w10, [x20, #0x1c]
 12a1f70: b4000ca8     	cbz	x8, 0x12a2104 <__start_il2cpp+0xfa940>
 12a1f74: b9801a8a     	ldrsw	x10, [x20, #0x18]
 12a1f78: b940190b     	ldr	w11, [x8, #0x18]
 12a1f7c: 6b0b015f     	cmp	w10, w11
 12a1f80: 54000142     	b.hs	0x12a1fa8 <__start_il2cpp+0xfa7e4>
 12a1f84: 1100054b     	add	w11, w10, #0x1
 12a1f88: 8b0a090a     	add	x10, x8, x10, lsl #2
 12a1f8c: 5281770c     	mov	w12, #0xbb8             // =3000
 12a1f90: b9001a8b     	str	w11, [x20, #0x18]
 12a1f94: b900214c     	str	w12, [x10, #0x20]
 12a1f98: b9401e8a     	ldr	w10, [x20, #0x1c]
 12a1f9c: 1100054a     	add	w10, w10, #0x1
 12a1fa0: b9001e8a     	str	w10, [x20, #0x1c]
 12a1fa4: 1400000d     	b	0x12a1fd8 <__start_il2cpp+0xfa814>
 12a1fa8: f9401128     	ldr	x8, [x9, #0x20]
 12a1fac: 52817701     	mov	w1, #0xbb8              // =3000
 12a1fb0: aa1403e0     	mov	x0, x20
 12a1fb4: f9406108     	ldr	x8, [x8, #0xc0]
 12a1fb8: f9403902     	ldr	x2, [x8, #0x70]
 12a1fbc: 9418f87c     	bl	0x18e01ac <__start_il2cpp+0x7389e8>
 12a1fc0: b9401e8a     	ldr	w10, [x20, #0x1c]
 12a1fc4: f9400a88     	ldr	x8, [x20, #0x10]
 12a1fc8: f94002a9     	ldr	x9, [x21]
 12a1fcc: 1100054a     	add	w10, w10, #0x1
 12a1fd0: b9001e8a     	str	w10, [x20, #0x1c]
 12a1fd4: b4000988     	cbz	x8, 0x12a2104 <__start_il2cpp+0xfa940>
 12a1fd8: b9801a8a     	ldrsw	x10, [x20, #0x18]
 12a1fdc: b940190b     	ldr	w11, [x8, #0x18]
 12a1fe0: 6b0b015f     	cmp	w10, w11
 12a1fe4: 54000142     	b.hs	0x12a200c <__start_il2cpp+0xfa848>
 12a1fe8: 1100054b     	add	w11, w10, #0x1
 12a1fec: 8b0a090a     	add	x10, x8, x10, lsl #2
 12a1ff0: 52807d0c     	mov	w12, #0x3e8             // =1000
 12a1ff4: b9001a8b     	str	w11, [x20, #0x18]
 12a1ff8: b900214c     	str	w12, [x10, #0x20]
 12a1ffc: b9401e8a     	ldr	w10, [x20, #0x1c]
 12a2000: 1100054a     	add	w10, w10, #0x1
 12a2004: b9001e8a     	str	w10, [x20, #0x1c]
 12a2008: 1400000d     	b	0x12a203c <__start_il2cpp+0xfa878>
 12a200c: f9401128     	ldr	x8, [x9, #0x20]
 12a2010: 52807d01     	mov	w1, #0x3e8              // =1000
 12a2014: aa1403e0     	mov	x0, x20
 12a2018: f9406108     	ldr	x8, [x8, #0xc0]
 12a201c: f9403902     	ldr	x2, [x8, #0x70]
 12a2020: 9418f863     	bl	0x18e01ac <__start_il2cpp+0x7389e8>
 12a2024: b9401e8a     	ldr	w10, [x20, #0x1c]
 12a2028: f9400a88     	ldr	x8, [x20, #0x10]
 12a202c: f94002a9     	ldr	x9, [x21]
 12a2030: 1100054a     	add	w10, w10, #0x1
 12a2034: b9001e8a     	str	w10, [x20, #0x1c]
 12a2038: b4000668     	cbz	x8, 0x12a2104 <__start_il2cpp+0xfa940>
 12a203c: b9801a8a     	ldrsw	x10, [x20, #0x18]
 12a2040: b940190b     	ldr	w11, [x8, #0x18]
 12a2044: 6b0b015f     	cmp	w10, w11
 12a2048: 54000142     	b.hs	0x12a2070 <__start_il2cpp+0xfa8ac>
 12a204c: 1100054b     	add	w11, w10, #0x1
 12a2050: 8b0a090a     	add	x10, x8, x10, lsl #2
 12a2054: 528012cc     	mov	w12, #0x96              // =150
 12a2058: b9001a8b     	str	w11, [x20, #0x18]
 12a205c: b900214c     	str	w12, [x10, #0x20]
 12a2060: b9401e8a     	ldr	w10, [x20, #0x1c]
 12a2064: 1100054a     	add	w10, w10, #0x1
 12a2068: b9001e8a     	str	w10, [x20, #0x1c]
 12a206c: 1400000d     	b	0x12a20a0 <__start_il2cpp+0xfa8dc>
 12a2070: f9401128     	ldr	x8, [x9, #0x20]
 12a2074: 528012c1     	mov	w1, #0x96               // =150
 12a2078: aa1403e0     	mov	x0, x20
 12a207c: f9406108     	ldr	x8, [x8, #0xc0]
 12a2080: f9403902     	ldr	x2, [x8, #0x70]
 12a2084: 9418f84a     	bl	0x18e01ac <__start_il2cpp+0x7389e8>
 12a2088: b9401e8a     	ldr	w10, [x20, #0x1c]
 12a208c: f9400a88     	ldr	x8, [x20, #0x10]
 12a2090: f94002a9     	ldr	x9, [x21]
 12a2094: 1100054a     	add	w10, w10, #0x1
 12a2098: b9001e8a     	str	w10, [x20, #0x1c]
 12a209c: b4000348     	cbz	x8, 0x12a2104 <__start_il2cpp+0xfa940>
 12a20a0: b9801a8a     	ldrsw	x10, [x20, #0x18]
 12a20a4: b940190b     	ldr	w11, [x8, #0x18]
 12a20a8: 6b0b015f     	cmp	w10, w11
 12a20ac: 540000e2     	b.hs	0x12a20c8 <__start_il2cpp+0xfa904>
 12a20b0: 11000549     	add	w9, w10, #0x1
 12a20b4: 8b0a0908     	add	x8, x8, x10, lsl #2
 12a20b8: 5280064a     	mov	w10, #0x32              // =50
 12a20bc: b9001a89     	str	w9, [x20, #0x18]
 12a20c0: b900210a     	str	w10, [x8, #0x20]
 12a20c4: 14000007     	b	0x12a20e0 <__start_il2cpp+0xfa91c>
 12a20c8: f9401128     	ldr	x8, [x9, #0x20]
 12a20cc: 52800641     	mov	w1, #0x32               // =50
 12a20d0: aa1403e0     	mov	x0, x20
 12a20d4: f9406108     	ldr	x8, [x8, #0xc0]
 12a20d8: f9403902     	ldr	x2, [x8, #0x70]
 12a20dc: 9418f834     	bl	0x18e01ac <__start_il2cpp+0x7389e8>
 12a20e0: 52800028     	mov	w8, #0x1                // =1
 12a20e4: f9002674     	str	x20, [x19, #0x48]
 12a20e8: 39004268     	strb	w8, [x19, #0x10]
 12a20ec: aa1303e0     	mov	x0, x19
 12a20f0: a9424ff4     	ldp	x20, x19, [sp, #0x20]
 12a20f4: a94157f6     	ldp	x22, x21, [sp, #0x10]
 12a20f8: aa1f03e1     	mov	x1, xzr
 12a20fc: a8c35ffe     	ldp	x30, x23, [sp], #0x30
 12a2100: 143110c1     	b	0x1ee6404 <__start_il2cpp+0xd3ec40>
 12a2104: 97f877ff     	bl	0x10c0100 <CloseNLSocket+0x638>
