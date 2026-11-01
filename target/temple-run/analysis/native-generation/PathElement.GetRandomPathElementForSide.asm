
/tmp/temple-libil2cpp.so:	file format elf64-littleaarch64

Disassembly of section il2cpp:

00000000011a77c4 <__start_il2cpp>:
 12e3e48: d10383ff     	sub	sp, sp, #0xe0
 12e3e4c: a9087bfd     	stp	x29, x30, [sp, #0x80]
 12e3e50: a9096ffc     	stp	x28, x27, [sp, #0x90]
 12e3e54: a90a67fa     	stp	x26, x25, [sp, #0xa0]
 12e3e58: a90b5ff8     	stp	x24, x23, [sp, #0xb0]
 12e3e5c: a90c57f6     	stp	x22, x21, [sp, #0xc0]
 12e3e60: a90d4ff4     	stp	x20, x19, [sp, #0xd0]
 12e3e64: d000ba95     	adrp	x21, 0x2a35000
 12e3e68: f000abfc     	adrp	x28, 0x2862000
 12e3e6c: 396c6aa8     	ldrb	w8, [x21, #0xb1a]
 12e3e70: f9424b9c     	ldr	x28, [x28, #0x490]
 12e3e74: 2a0103f4     	mov	w20, w1
 12e3e78: aa0003f3     	mov	x19, x0
 12e3e7c: 370005a8     	tbnz	w8, #0x0, 0x12e3f30 <__start_il2cpp+0x13c76c>
 12e3e80: b000abc0     	adrp	x0, 0x285c000 <_ZTVN10__cxxabiv119__pointer_type_infoE+0x18>
 12e3e84: f9471800     	ldr	x0, [x0, #0xe30]
 12e3e88: 97f77014     	bl	0x10bfed8 <CloseNLSocket+0x410>
 12e3e8c: f000ac00     	adrp	x0, 0x2866000
 12e3e90: f9410c00     	ldr	x0, [x0, #0x218]
 12e3e94: 97f77011     	bl	0x10bfed8 <CloseNLSocket+0x410>
 12e3e98: f000abe0     	adrp	x0, 0x2862000
 12e3e9c: f9424000     	ldr	x0, [x0, #0x480]
 12e3ea0: 97f7700e     	bl	0x10bfed8 <CloseNLSocket+0x410>
 12e3ea4: d000abc0     	adrp	x0, 0x285d000
 12e3ea8: f9456000     	ldr	x0, [x0, #0xac0]
 12e3eac: 97f7700b     	bl	0x10bfed8 <CloseNLSocket+0x410>
 12e3eb0: f000ac00     	adrp	x0, 0x2866000
 12e3eb4: f9412c00     	ldr	x0, [x0, #0x258]
 12e3eb8: 97f77008     	bl	0x10bfed8 <CloseNLSocket+0x410>
 12e3ebc: f000abe0     	adrp	x0, 0x2862000
 12e3ec0: f9424800     	ldr	x0, [x0, #0x490]
 12e3ec4: 97f77005     	bl	0x10bfed8 <CloseNLSocket+0x410>
 12e3ec8: f000ac00     	adrp	x0, 0x2866000
 12e3ecc: f9410400     	ldr	x0, [x0, #0x208]
 12e3ed0: 97f77002     	bl	0x10bfed8 <CloseNLSocket+0x410>
 12e3ed4: f000ac00     	adrp	x0, 0x2866000
 12e3ed8: f9412800     	ldr	x0, [x0, #0x250]
 12e3edc: 97f76fff     	bl	0x10bfed8 <CloseNLSocket+0x410>
 12e3ee0: d000abc0     	adrp	x0, 0x285d000
 12e3ee4: f9411800     	ldr	x0, [x0, #0x230]
 12e3ee8: 97f76ffc     	bl	0x10bfed8 <CloseNLSocket+0x410>
 12e3eec: f000ac00     	adrp	x0, 0x2866000
 12e3ef0: f9413c00     	ldr	x0, [x0, #0x278]
 12e3ef4: 97f76ff9     	bl	0x10bfed8 <CloseNLSocket+0x410>
 12e3ef8: f000ac00     	adrp	x0, 0x2866000
 12e3efc: f9414000     	ldr	x0, [x0, #0x280]
 12e3f00: 97f76ff6     	bl	0x10bfed8 <CloseNLSocket+0x410>
 12e3f04: f000ac00     	adrp	x0, 0x2866000
 12e3f08: f9414400     	ldr	x0, [x0, #0x288]
 12e3f0c: 97f76ff3     	bl	0x10bfed8 <CloseNLSocket+0x410>
 12e3f10: f000ac00     	adrp	x0, 0x2866000
 12e3f14: f9414800     	ldr	x0, [x0, #0x290]
 12e3f18: 97f76ff0     	bl	0x10bfed8 <CloseNLSocket+0x410>
 12e3f1c: f000ac00     	adrp	x0, 0x2866000
 12e3f20: f9414c00     	ldr	x0, [x0, #0x298]
 12e3f24: 97f76fed     	bl	0x10bfed8 <CloseNLSocket+0x410>
 12e3f28: 52800028     	mov	w8, #0x1                // =1
 12e3f2c: 392c6aa8     	strb	w8, [x21, #0xb1a]
 12e3f30: f9400388     	ldr	x8, [x28]
 12e3f34: 3901f3ff     	strb	wzr, [sp, #0x7c]
 12e3f38: b940e109     	ldr	w9, [x8, #0xe0]
 12e3f3c: 35000089     	cbnz	w9, 0x12e3f4c <__start_il2cpp+0x13c788>
 12e3f40: aa0803e0     	mov	x0, x8
 12e3f44: 97f77027     	bl	0x10bffe0 <CloseNLSocket+0x518>
 12e3f48: f9400388     	ldr	x8, [x28]
 12e3f4c: f9405d09     	ldr	x9, [x8, #0xb8]
 12e3f50: 39401d2a     	ldrb	w10, [x9, #0x7]
 12e3f54: 3400018a     	cbz	w10, 0x12e3f84 <__start_il2cpp+0x13c7c0>
 12e3f58: b940e10a     	ldr	w10, [x8, #0xe0]
 12e3f5c: b9407a75     	ldr	w21, [x19, #0x78]
 12e3f60: 350000aa     	cbnz	w10, 0x12e3f74 <__start_il2cpp+0x13c7b0>
 12e3f64: aa0803e0     	mov	x0, x8
 12e3f68: 97f7701e     	bl	0x10bffe0 <CloseNLSocket+0x518>
 12e3f6c: f9400388     	ldr	x8, [x28]
 12e3f70: f9405d09     	ldr	x9, [x8, #0xb8]
 12e3f74: b9402d29     	ldr	w9, [x9, #0x2c]
 12e3f78: 6b0902bf     	cmp	w21, w9
 12e3f7c: 1a9fb7fd     	cset	w29, ge
 12e3f80: 14000002     	b	0x12e3f88 <__start_il2cpp+0x13c7c4>
 12e3f84: 2a1f03fd     	mov	w29, wzr
 12e3f88: b9407a76     	ldr	w22, [x19, #0x78]
 12e3f8c: b940e109     	ldr	w9, [x8, #0xe0]
 12e3f90: b9408275     	ldr	w21, [x19, #0x80]
 12e3f94: 350000a9     	cbnz	w9, 0x12e3fa8 <__start_il2cpp+0x13c7e4>
 12e3f98: aa0803e0     	mov	x0, x8
 12e3f9c: 97f77011     	bl	0x10bffe0 <CloseNLSocket+0x518>
 12e3fa0: f9400388     	ldr	x8, [x28]
 12e3fa4: b940e109     	ldr	w9, [x8, #0xe0]
 12e3fa8: f9405d0a     	ldr	x10, [x8, #0xb8]
 12e3fac: 710006df     	cmp	w22, #0x1
 12e3fb0: b9407e77     	ldr	w23, [x19, #0x7c]
 12e3fb4: 1a9f07ec     	cset	w12, ne
 12e3fb8: b940314b     	ldr	w11, [x10, #0x30]
 12e3fbc: 6b0b02bf     	cmp	w21, w11
 12e3fc0: 1a9fa7eb     	cset	w11, lt
 12e3fc4: 0a0b0196     	and	w22, w12, w11
 12e3fc8: 350000a9     	cbnz	w9, 0x12e3fdc <__start_il2cpp+0x13c818>
 12e3fcc: aa0803e0     	mov	x0, x8
 12e3fd0: 97f77004     	bl	0x10bffe0 <CloseNLSocket+0x518>
 12e3fd4: f9400388     	ldr	x8, [x28]
 12e3fd8: f9405d0a     	ldr	x10, [x8, #0xb8]
 12e3fdc: b9403549     	ldr	w9, [x10, #0x34]
 12e3fe0: 6b0902ff     	cmp	w23, w9
 12e3fe4: 540002aa     	b.ge	0x12e4038 <__start_il2cpp+0x13c874>
 12e3fe8: 52807d01     	mov	w1, #0x3e8              // =1000
 12e3fec: 2a1f03e0     	mov	w0, wzr
 12e3ff0: aa1f03e2     	mov	x2, xzr
 12e3ff4: 94473fbd     	bl	0x24b3ee8 <__start_il2cpp+0x130c724>
 12e3ff8: f9400388     	ldr	x8, [x28]
 12e3ffc: 2a0003f5     	mov	w21, w0
 12e4000: b940e109     	ldr	w9, [x8, #0xe0]
 12e4004: 35000089     	cbnz	w9, 0x12e4014 <__start_il2cpp+0x13c850>
 12e4008: aa0803e0     	mov	x0, x8
 12e400c: 97f76ff5     	bl	0x10bffe0 <CloseNLSocket+0x518>
 12e4010: f9400388     	ldr	x8, [x28]
 12e4014: f9405d09     	ldr	x9, [x8, #0xb8]
 12e4018: 1e2202a1     	scvtf	s1, w21
 12e401c: bd403920     	ldr	s0, [x9, #0x38]
 12e4020: 52a88f49     	mov	w9, #0x447a0000         // =1148846080
 12e4024: 1e270122     	fmov	s2, w9
 12e4028: 1e220800     	fmul	s0, s0, s2
 12e402c: 1e212000     	fcmp	s0, s1
 12e4030: 54000048     	b.hi	0x12e4038 <__start_il2cpp+0x13c874>
 12e4034: 2a1f03f6     	mov	w22, wzr
 12e4038: d000ac18     	adrp	x24, 0x2866000
 12e403c: d000ac17     	adrp	x23, 0x2866000
 12e4040: d000ac15     	adrp	x21, 0x2866000
 12e4044: b940e109     	ldr	w9, [x8, #0xe0]
 12e4048: f9410718     	ldr	x24, [x24, #0x208]
 12e404c: f9413ef7     	ldr	x23, [x23, #0x278]
 12e4050: f9410eb5     	ldr	x21, [x21, #0x218]
 12e4054: 35000089     	cbnz	w9, 0x12e4064 <__start_il2cpp+0x13c8a0>
 12e4058: aa0803e0     	mov	x0, x8
 12e405c: 97f76fe1     	bl	0x10bffe0 <CloseNLSocket+0x518>
 12e4060: f9400388     	ldr	x8, [x28]
 12e4064: f9405d08     	ldr	x8, [x8, #0xb8]
 12e4068: f9400300     	ldr	x0, [x24]
 12e406c: b9403279     	ldr	w25, [x19, #0x30]
 12e4070: 52800081     	mov	w1, #0x4                // =4
 12e4074: b9404508     	ldr	w8, [x8, #0x44]
 12e4078: b9002fe8     	str	w8, [sp, #0x2c]
 12e407c: 97f76fb5     	bl	0x10bff50 <CloseNLSocket+0x488>
 12e4080: f94002e1     	ldr	x1, [x23]
 12e4084: aa1f03e2     	mov	x2, xzr
 12e4088: aa0003f7     	mov	x23, x0
 12e408c: 942c06d2     	bl	0x1de5bd4 <__start_il2cpp+0xc3e410>
 12e4090: f94002a2     	ldr	x2, [x21]
 12e4094: 2a1903e0     	mov	w0, w25
 12e4098: aa1703e1     	mov	x1, x23
 12e409c: 9403ce43     	bl	0x13d79a8 <__start_il2cpp+0x2301e4>
 12e40a0: 36000080     	tbz	w0, #0x0, 0x12e40b0 <__start_il2cpp+0x13c8ec>
 12e40a4: b9002bff     	str	wzr, [sp, #0x28]
 12e40a8: 2a1f03f6     	mov	w22, wzr
 12e40ac: 14000016     	b	0x12e4104 <__start_il2cpp+0x13c940>
 12e40b0: f9400300     	ldr	x0, [x24]
 12e40b4: d000ac17     	adrp	x23, 0x2866000
 12e40b8: f94142f7     	ldr	x23, [x23, #0x280]
 12e40bc: 52800081     	mov	w1, #0x4                // =4
 12e40c0: 97f76fa4     	bl	0x10bff50 <CloseNLSocket+0x488>
 12e40c4: f94002e1     	ldr	x1, [x23]
 12e40c8: aa1f03e2     	mov	x2, xzr
 12e40cc: aa0003f7     	mov	x23, x0
 12e40d0: 942c06c1     	bl	0x1de5bd4 <__start_il2cpp+0xc3e410>
 12e40d4: f94002a2     	ldr	x2, [x21]
 12e40d8: 2a1903e0     	mov	w0, w25
 12e40dc: aa1703e1     	mov	x1, x23
 12e40e0: 9403ce32     	bl	0x13d79a8 <__start_il2cpp+0x2301e4>
 12e40e4: 360000e0     	tbz	w0, #0x0, 0x12e4100 <__start_il2cpp+0x13c93c>
 12e40e8: aa1303e0     	mov	x0, x19
 12e40ec: 97fffbc5     	bl	0x12e3000 <__start_il2cpp+0x13b83c>
 12e40f0: 52000008     	eor	w8, w0, #0x1
 12e40f4: 0a0802d6     	and	w22, w22, w8
 12e40f8: b9002be8     	str	w8, [sp, #0x28]
 12e40fc: 14000002     	b	0x12e4104 <__start_il2cpp+0x13c940>
 12e4100: b9002bff     	str	wzr, [sp, #0x28]
 12e4104: 3940f268     	ldrb	w8, [x19, #0x3c]
 12e4108: f9400380     	ldr	x0, [x28]
 12e410c: 7100011f     	cmp	w8, #0x0
 12e4110: 1a9f17f7     	cset	w23, eq
 12e4114: 340001e8     	cbz	w8, 0x12e4150 <__start_il2cpp+0x13c98c>
 12e4118: b940e008     	ldr	w8, [x0, #0xe0]
 12e411c: 35000068     	cbnz	w8, 0x12e4128 <__start_il2cpp+0x13c964>
 12e4120: 97f76fb0     	bl	0x10bffe0 <CloseNLSocket+0x518>
 12e4124: f9400380     	ldr	x0, [x28]
 12e4128: f9405c08     	ldr	x8, [x0, #0xb8]
 12e412c: b9403a69     	ldr	w9, [x19, #0x38]
 12e4130: 39403908     	ldrb	w8, [x8, #0xe]
 12e4134: 51001529     	sub	w9, w9, #0x5
 12e4138: 7100011f     	cmp	w8, #0x0
 12e413c: 1a9f07e8     	cset	w8, ne
 12e4140: 7100053f     	cmp	w9, #0x1
 12e4144: 0a0803bd     	and	w29, w29, w8
 12e4148: 1a9f97e8     	cset	w8, hi
 12e414c: 0a0802d6     	and	w22, w22, w8
 12e4150: b940e008     	ldr	w8, [x0, #0xe0]
 12e4154: b9403675     	ldr	w21, [x19, #0x34]
 12e4158: 35000068     	cbnz	w8, 0x12e4164 <__start_il2cpp+0x13c9a0>
 12e415c: 97f76fa1     	bl	0x10bffe0 <CloseNLSocket+0x518>
 12e4160: f9400380     	ldr	x0, [x28]
 12e4164: f9405c08     	ldr	x8, [x0, #0xb8]
 12e4168: b90017f5     	str	w21, [sp, #0x14]
 12e416c: b9404508     	ldr	w8, [x8, #0x44]
 12e4170: 6b0802bf     	cmp	w21, w8
 12e4174: 54000220     	b.eq	0x12e41b8 <__start_il2cpp+0x13c9f4>
 12e4178: 51000729     	sub	w9, w25, #0x1
 12e417c: 7100053f     	cmp	w9, #0x1
 12e4180: 54000128     	b.hi	0x12e41a4 <__start_il2cpp+0x13c9e0>
 12e4184: 3940f269     	ldrb	w9, [x19, #0x3c]
 12e4188: 350000e9     	cbnz	w9, 0x12e41a4 <__start_il2cpp+0x13c9e0>
 12e418c: b9407a69     	ldr	w9, [x19, #0x78]
 12e4190: 71000d3f     	cmp	w9, #0x3
 12e4194: 5400008b     	b.lt	0x12e41a4 <__start_il2cpp+0x13c9e0>
 12e4198: b9407e69     	ldr	w9, [x19, #0x7c]
 12e419c: 71000d3f     	cmp	w9, #0x3
 12e41a0: 5400366a     	b.ge	0x12e486c <__start_il2cpp+0x13d0a8>
 12e41a4: b9403668     	ldr	w8, [x19, #0x34]
 12e41a8: 2a1f03f7     	mov	w23, wzr
 12e41ac: 2a1f03f6     	mov	w22, wzr
 12e41b0: 2a1f03fd     	mov	w29, wzr
 12e41b4: 290523ff     	stp	wzr, w8, [sp, #0x28]
 12e41b8: aa1303ea     	mov	x10, x19
 12e41bc: b8438d49     	ldr	w9, [x10, #0x38]!
 12e41c0: 2a1f03e8     	mov	w8, wzr
 12e41c4: 71001d3f     	cmp	w9, #0x7
 12e41c8: 2a1f03e9     	mov	w9, wzr
 12e41cc: f90007ea     	str	x10, [sp, #0x8]
 12e41d0: 540000c1     	b.ne	0x12e41e8 <__start_il2cpp+0x13ca24>
 12e41d4: 2a1f03f7     	mov	w23, wzr
 12e41d8: 2a1f03f6     	mov	w22, wzr
 12e41dc: 2a1f03fd     	mov	w29, wzr
 12e41e0: 2a0803e9     	mov	w9, w8
 12e41e4: b9002bff     	str	wzr, [sp, #0x28]
 12e41e8: b940e008     	ldr	w8, [x0, #0xe0]
 12e41ec: 2a1903f5     	mov	w21, w25
 12e41f0: b90013e9     	str	w9, [sp, #0x10]
 12e41f4: 35000068     	cbnz	w8, 0x12e4200 <__start_il2cpp+0x13ca3c>
 12e41f8: 97f76f7a     	bl	0x10bffe0 <CloseNLSocket+0x518>
 12e41fc: f9400380     	ldr	x0, [x28]
 12e4200: f9405c08     	ldr	x8, [x0, #0xb8]
 12e4204: b9402be9     	ldr	w9, [sp, #0x28]
 12e4208: f9400300     	ldr	x0, [x24]
 12e420c: 528004c1     	mov	w1, #0x26               // =38
 12e4210: 39412108     	ldrb	w8, [x8, #0x48]
 12e4214: 7100011f     	cmp	w8, #0x0
 12e4218: 1a9f17e8     	cset	w8, eq
 12e421c: 0a080129     	and	w9, w9, w8
 12e4220: 0a0802f9     	and	w25, w23, w8
 12e4224: b90023e9     	str	w9, [sp, #0x20]
 12e4228: 0a0802d7     	and	w23, w22, w8
 12e422c: 97f76f49     	bl	0x10bff50 <CloseNLSocket+0x488>
 12e4230: 2a1f03f8     	mov	w24, wzr
 12e4234: 52000328     	eor	w8, w25, #0x1
 12e4238: 128001f6     	mov	w22, #-0x10             // =-16
 12e423c: f9000fe0     	str	x0, [sp, #0x18]
 12e4240: b90007f9     	str	w25, [sp, #0x4]
 12e4244: b90027e8     	str	w8, [sp, #0x24]
 12e4248: 110046d9     	add	w25, w22, #0x11
 12e424c: 52800023     	mov	w3, #0x1                // =1
 12e4250: aa1303e0     	mov	x0, x19
 12e4254: 2a1903e1     	mov	w1, w25
 12e4258: 2a1403e2     	mov	w2, w20
 12e425c: 97fffd49     	bl	0x12e3780 <__start_il2cpp+0x13bfbc>
 12e4260: 2a0003fa     	mov	w26, w0
 12e4264: 3700013d     	tbnz	w29, #0x0, 0x12e4288 <__start_il2cpp+0x13cac4>
 12e4268: f9400380     	ldr	x0, [x28]
 12e426c: b940e008     	ldr	w8, [x0, #0xe0]
 12e4270: 35000048     	cbnz	w8, 0x12e4278 <__start_il2cpp+0x13cab4>
 12e4274: 97f76f5b     	bl	0x10bffe0 <CloseNLSocket+0x518>
 12e4278: 11003ac8     	add	w8, w22, #0xe
 12e427c: 71001d1f     	cmp	w8, #0x7
 12e4280: 1a9f97e8     	cset	w8, hi
 12e4284: 0a1a011a     	and	w26, w8, w26
 12e4288: f940039b     	ldr	x27, [x28]
 12e428c: b940e368     	ldr	w8, [x27, #0xe0]
 12e4290: 35000088     	cbnz	w8, 0x12e42a0 <__start_il2cpp+0x13cadc>
 12e4294: aa1b03e0     	mov	x0, x27
 12e4298: 97f76f52     	bl	0x10bffe0 <CloseNLSocket+0x518>
 12e429c: f940039b     	ldr	x27, [x28]
 12e42a0: f9405f68     	ldr	x8, [x27, #0xb8]
 12e42a4: 39403d09     	ldrb	w9, [x8, #0xf]
 12e42a8: 35000109     	cbnz	w9, 0x12e42c8 <__start_il2cpp+0x13cb04>
 12e42ac: b9403269     	ldr	w9, [x19, #0x30]
 12e42b0: 11002aca     	add	w10, w22, #0xa
 12e42b4: 7100055f     	cmp	w10, #0x1
 12e42b8: 54000668     	b.hi	0x12e4384 <__start_il2cpp+0x13cbc0>
 12e42bc: 7100053f     	cmp	w9, #0x1
 12e42c0: 54000621     	b.ne	0x12e4384 <__start_il2cpp+0x13cbc0>
 12e42c4: 2a1f03fa     	mov	w26, wzr
 12e42c8: 360006f7     	tbz	w23, #0x0, 0x12e43a4 <__start_il2cpp+0x13cbe0>
 12e42cc: 51007f29     	sub	w9, w25, #0x1f
 12e42d0: 7100093f     	cmp	w9, #0x2
 12e42d4: 540001c3     	b.lo	0x12e430c <__start_il2cpp+0x13cb48>
 12e42d8: 71003b3f     	cmp	w25, #0xe
 12e42dc: 54000060     	b.eq	0x12e42e8 <__start_il2cpp+0x13cb24>
 12e42e0: 71002f3f     	cmp	w25, #0xb
 12e42e4: 540009a1     	b.ne	0x12e4418 <__start_il2cpp+0x13cc54>
 12e42e8: b940e369     	ldr	w9, [x27, #0xe0]
 12e42ec: 350000a9     	cbnz	w9, 0x12e4300 <__start_il2cpp+0x13cb3c>
 12e42f0: aa1b03e0     	mov	x0, x27
 12e42f4: 97f76f3b     	bl	0x10bffe0 <CloseNLSocket+0x518>
 12e42f8: f940039b     	ldr	x27, [x28]
 12e42fc: f9405f68     	ldr	x8, [x27, #0xb8]
 12e4300: 39402108     	ldrb	w8, [x8, #0x8]
 12e4304: 35000288     	cbnz	w8, 0x12e4354 <__start_il2cpp+0x13cb90>
 12e4308: 14000040     	b	0x12e4408 <__start_il2cpp+0x13cc44>
 12e430c: b940e369     	ldr	w9, [x27, #0xe0]
 12e4310: 350000a9     	cbnz	w9, 0x12e4324 <__start_il2cpp+0x13cb60>
 12e4314: aa1b03e0     	mov	x0, x27
 12e4318: 97f76f32     	bl	0x10bffe0 <CloseNLSocket+0x518>
 12e431c: f940039b     	ldr	x27, [x28]
 12e4320: f9405f68     	ldr	x8, [x27, #0xb8]
 12e4324: b9402fe9     	ldr	w9, [sp, #0x2c]
 12e4328: 39402908     	ldrb	w8, [x8, #0xa]
 12e432c: 71000d3f     	cmp	w9, #0x3
 12e4330: 1a9f17e9     	cset	w9, eq
 12e4334: 7100011f     	cmp	w8, #0x0
 12e4338: 1a9f17e8     	cset	w8, eq
 12e433c: 2a080128     	orr	w8, w9, w8
 12e4340: b94027e9     	ldr	w9, [sp, #0x24]
 12e4344: 2a090108     	orr	w8, w8, w9
 12e4348: b9402be9     	ldr	w9, [sp, #0x28]
 12e434c: 2a080128     	orr	w8, w9, w8
 12e4350: 370005c8     	tbnz	w8, #0x0, 0x12e4408 <__start_il2cpp+0x13cc44>
 12e4354: b940e368     	ldr	w8, [x27, #0xe0]
 12e4358: 35000068     	cbnz	w8, 0x12e4364 <__start_il2cpp+0x13cba0>
 12e435c: aa1b03e0     	mov	x0, x27
 12e4360: 97f76f20     	bl	0x10bffe0 <CloseNLSocket+0x518>
 12e4364: 52800041     	mov	w1, #0x2                // =2
 12e4368: 2a1f03e0     	mov	w0, wzr
 12e436c: aa1f03e2     	mov	x2, xzr
 12e4370: 94473ede     	bl	0x24b3ee8 <__start_il2cpp+0x130c724>
 12e4374: 340004a0     	cbz	w0, 0x12e4408 <__start_il2cpp+0x13cc44>
 12e4378: 52000348     	eor	w8, w26, #0x1
 12e437c: 36000328     	tbz	w8, #0x0, 0x12e43e0 <__start_il2cpp+0x13cc1c>
 12e4380: 14000022     	b	0x12e4408 <__start_il2cpp+0x13cc44>
 12e4384: 7100093f     	cmp	w9, #0x2
 12e4388: 110022c9     	add	w9, w22, #0x8
 12e438c: 1a9f07ea     	cset	w10, ne
 12e4390: 7100053f     	cmp	w9, #0x1
 12e4394: 1a9f97e9     	cset	w9, hi
 12e4398: 2a0a0129     	orr	w9, w9, w10
 12e439c: 0a09035a     	and	w26, w26, w9
 12e43a0: 3707f977     	tbnz	w23, #0x0, 0x12e42cc <__start_il2cpp+0x13cb08>
 12e43a4: 2a1903e1     	mov	w1, w25
 12e43a8: 2a1503e2     	mov	w2, w21
 12e43ac: 97fffe92     	bl	0x12e3df4 <__start_il2cpp+0x13c630>
 12e43b0: 36000060     	tbz	w0, #0x0, 0x12e43bc <__start_il2cpp+0x13cbf8>
 12e43b4: 3700017a     	tbnz	w26, #0x0, 0x12e43e0 <__start_il2cpp+0x13cc1c>
 12e43b8: 14000014     	b	0x12e4408 <__start_il2cpp+0x13cc44>
 12e43bc: b940e368     	ldr	w8, [x27, #0xe0]
 12e43c0: 35000068     	cbnz	w8, 0x12e43cc <__start_il2cpp+0x13cc08>
 12e43c4: aa1b03e0     	mov	x0, x27
 12e43c8: 97f76f06     	bl	0x10bffe0 <CloseNLSocket+0x518>
 12e43cc: 11001ac8     	add	w8, w22, #0x6
 12e43d0: 7100651f     	cmp	w8, #0x19
 12e43d4: 1a9f97e8     	cset	w8, hi
 12e43d8: 0a1a0108     	and	w8, w8, w26
 12e43dc: 36000168     	tbz	w8, #0x0, 0x12e4408 <__start_il2cpp+0x13cc44>
 12e43e0: 7100973f     	cmp	w25, #0x25
 12e43e4: 54000568     	b.hi	0x12e4490 <__start_il2cpp+0x13cccc>
 12e43e8: 2a1903e8     	mov	w8, w25
 12e43ec: 52800029     	mov	w9, #0x1                // =1
 12e43f0: 9ac82128     	lsl	x8, x9, x8
 12e43f4: d2960009     	mov	x9, #0xb000             // =45056
 12e43f8: f2a00029     	movk	x9, #0x1, lsl #16
 12e43fc: f2c007c9     	movk	x9, #0x3e, lsl #32
 12e4400: ea09011f     	tst	x8, x9
 12e4404: 54000460     	b.eq	0x12e4490 <__start_il2cpp+0x13cccc>
 12e4408: 110006d6     	add	w22, w22, #0x1
 12e440c: 710056df     	cmp	w22, #0x15
 12e4410: 54fff1c1     	b.ne	0x12e4248 <__start_il2cpp+0x13ca84>
 12e4414: 14000031     	b	0x12e44d8 <__start_il2cpp+0x13cd14>
 12e4418: b940e368     	ldr	w8, [x27, #0xe0]
 12e441c: 35000068     	cbnz	w8, 0x12e4428 <__start_il2cpp+0x13cc64>
 12e4420: aa1b03e0     	mov	x0, x27
 12e4424: 97f76eef     	bl	0x10bffe0 <CloseNLSocket+0x518>
 12e4428: 710036df     	cmp	w22, #0xd
 12e442c: 54fffc48     	b.hi	0x12e43b4 <__start_il2cpp+0x13cbf0>
 12e4430: f9400380     	ldr	x0, [x28]
 12e4434: b940e008     	ldr	w8, [x0, #0xe0]
 12e4438: 35000068     	cbnz	w8, 0x12e4444 <__start_il2cpp+0x13cc80>
 12e443c: 97f76ee9     	bl	0x10bffe0 <CloseNLSocket+0x518>
 12e4440: f9400380     	ldr	x0, [x28]
 12e4444: b9402fe8     	ldr	w8, [sp, #0x2c]
 12e4448: 7100091f     	cmp	w8, #0x2
 12e444c: 52800028     	mov	w8, #0x1                // =1
 12e4450: 540000e1     	b.ne	0x12e446c <__start_il2cpp+0x13cca8>
 12e4454: f9405c09     	ldr	x9, [x0, #0xb8]
 12e4458: 39402529     	ldrb	w9, [x9, #0x9]
 12e445c: 34000089     	cbz	w9, 0x12e446c <__start_il2cpp+0x13cca8>
 12e4460: b9407a68     	ldr	w8, [x19, #0x78]
 12e4464: 7100091f     	cmp	w8, #0x2
 12e4468: 1a9fa7e8     	cset	w8, lt
 12e446c: b94023e9     	ldr	w9, [sp, #0x20]
 12e4470: 2a090108     	orr	w8, w8, w9
 12e4474: 34000208     	cbz	w8, 0x12e44b4 <__start_il2cpp+0x13ccf0>
 12e4478: 2a1903e1     	mov	w1, w25
 12e447c: 2a1503e2     	mov	w2, w21
 12e4480: 97fffe5d     	bl	0x12e3df4 <__start_il2cpp+0x13c630>
 12e4484: 0a000348     	and	w8, w26, w0
 12e4488: 3707fac8     	tbnz	w8, #0x0, 0x12e43e0 <__start_il2cpp+0x13cc1c>
 12e448c: 17ffffdf     	b	0x12e4408 <__start_il2cpp+0x13cc44>
 12e4490: f9400fe9     	ldr	x9, [sp, #0x18]
 12e4494: b4003ae9     	cbz	x9, 0x12e4bf0 <__start_il2cpp+0x13d42c>
 12e4498: b9401928     	ldr	w8, [x9, #0x18]
 12e449c: 6b08031f     	cmp	w24, w8
 12e44a0: 54003a62     	b.hs	0x12e4bec <__start_il2cpp+0x13d428>
 12e44a4: 8b38c928     	add	x8, x9, w24, sxtw #2
 12e44a8: 11000718     	add	w24, w24, #0x1
 12e44ac: b9002119     	str	w25, [x8, #0x20]
 12e44b0: 17ffffd6     	b	0x12e4408 <__start_il2cpp+0x13cc44>
 12e44b4: b940e008     	ldr	w8, [x0, #0xe0]
 12e44b8: 35000048     	cbnz	w8, 0x12e44c0 <__start_il2cpp+0x13ccfc>
 12e44bc: 97f76ec9     	bl	0x10bffe0 <CloseNLSocket+0x518>
 12e44c0: 52800041     	mov	w1, #0x2                // =2
 12e44c4: 2a1f03e0     	mov	w0, wzr
 12e44c8: aa1f03e2     	mov	x2, xzr
 12e44cc: 94473e87     	bl	0x24b3ee8 <__start_il2cpp+0x130c724>
 12e44d0: 35fff720     	cbnz	w0, 0x12e43b4 <__start_il2cpp+0x13cbf0>
 12e44d4: 17ffffe9     	b	0x12e4478 <__start_il2cpp+0x13ccb4>
 12e44d8: 34000f78     	cbz	w24, 0x12e46c4 <__start_il2cpp+0x13cf00>
 12e44dc: 2a1f03e0     	mov	w0, wzr
 12e44e0: 2a1803e1     	mov	w1, w24
 12e44e4: aa1f03e2     	mov	x2, xzr
 12e44e8: 94473e80     	bl	0x24b3ee8 <__start_il2cpp+0x130c724>
 12e44ec: f9400fe9     	ldr	x9, [sp, #0x18]
 12e44f0: b4003809     	cbz	x9, 0x12e4bf0 <__start_il2cpp+0x13d42c>
 12e44f4: b9401928     	ldr	w8, [x9, #0x18]
 12e44f8: 6b08001f     	cmp	w0, w8
 12e44fc: 54003782     	b.hs	0x12e4bec <__start_il2cpp+0x13d428>
 12e4500: 8b20c928     	add	x8, x9, w0, sxtw #2
 12e4504: b940211a     	ldr	w26, [x8, #0x20]
 12e4508: 2a1503f6     	mov	w22, w21
 12e450c: 5280003b     	mov	w27, #0x1               // =1
 12e4510: 71002f5f     	cmp	w26, #0xb
 12e4514: 54000160     	b.eq	0x12e4540 <__start_il2cpp+0x13cd7c>
 12e4518: 71003b5f     	cmp	w26, #0xe
 12e451c: 54000120     	b.eq	0x12e4540 <__start_il2cpp+0x13cd7c>
 12e4520: f9400380     	ldr	x0, [x28]
 12e4524: b940e008     	ldr	w8, [x0, #0xe0]
 12e4528: 35000048     	cbnz	w8, 0x12e4530 <__start_il2cpp+0x13cd6c>
 12e452c: 97f76ead     	bl	0x10bffe0 <CloseNLSocket+0x518>
 12e4530: 51004748     	sub	w8, w26, #0x11
 12e4534: 7100391f     	cmp	w8, #0xe
 12e4538: 1a9f27e8     	cset	w8, lo
 12e453c: 531f791b     	lsl	w27, w8, #1
 12e4540: 34001ef7     	cbz	w23, 0x12e491c <__start_il2cpp+0x13d158>
 12e4544: f9400380     	ldr	x0, [x28]
 12e4548: b940e008     	ldr	w8, [x0, #0xe0]
 12e454c: 35000068     	cbnz	w8, 0x12e4558 <__start_il2cpp+0x13cd94>
 12e4550: 97f76ea4     	bl	0x10bffe0 <CloseNLSocket+0x518>
 12e4554: f9400380     	ldr	x0, [x28]
 12e4558: f9405c08     	ldr	x8, [x0, #0xb8]
 12e455c: 39402d09     	ldrb	w9, [x8, #0xb]
 12e4560: 35000109     	cbnz	w9, 0x12e4580 <__start_il2cpp+0x13cdbc>
 12e4564: b940e009     	ldr	w9, [x0, #0xe0]
 12e4568: 35000089     	cbnz	w9, 0x12e4578 <__start_il2cpp+0x13cdb4>
 12e456c: 97f76e9d     	bl	0x10bffe0 <CloseNLSocket+0x518>
 12e4570: f9400380     	ldr	x0, [x28]
 12e4574: f9405c08     	ldr	x8, [x0, #0xb8]
 12e4578: 39403109     	ldrb	w9, [x8, #0xc]
 12e457c: 34001649     	cbz	w9, 0x12e4844 <__start_il2cpp+0x13d080>
 12e4580: b94023e8     	ldr	w8, [sp, #0x20]
 12e4584: 37001cc8     	tbnz	w8, #0x0, 0x12e491c <__start_il2cpp+0x13d158>
 12e4588: 51000748     	sub	w8, w26, #0x1
 12e458c: 7100051f     	cmp	w8, #0x1
 12e4590: 54001c68     	b.hi	0x12e491c <__start_il2cpp+0x13d158>
 12e4594: b940e008     	ldr	w8, [x0, #0xe0]
 12e4598: 35000048     	cbnz	w8, 0x12e45a0 <__start_il2cpp+0x13cddc>
 12e459c: 97f76e91     	bl	0x10bffe0 <CloseNLSocket+0x518>
 12e45a0: 52800041     	mov	w1, #0x2                // =2
 12e45a4: 2a1f03e0     	mov	w0, wzr
 12e45a8: aa1f03e2     	mov	x2, xzr
 12e45ac: 94473e4f     	bl	0x24b3ee8 <__start_il2cpp+0x130c724>
 12e45b0: 35001b60     	cbnz	w0, 0x12e491c <__start_il2cpp+0x13d158>
 12e45b4: b000abc8     	adrp	x8, 0x285d000
 12e45b8: f9456108     	ldr	x8, [x8, #0xac0]
 12e45bc: 52800081     	mov	w1, #0x4                // =4
 12e45c0: f9400100     	ldr	x0, [x8]
 12e45c4: 97f76e63     	bl	0x10bff50 <CloseNLSocket+0x488>
 12e45c8: f9400388     	ldr	x8, [x28]
 12e45cc: aa0003f8     	mov	x24, x0
 12e45d0: b940e109     	ldr	w9, [x8, #0xe0]
 12e45d4: 35000089     	cbnz	w9, 0x12e45e4 <__start_il2cpp+0x13ce20>
 12e45d8: aa0803e0     	mov	x0, x8
 12e45dc: 97f76e81     	bl	0x10bffe0 <CloseNLSocket+0x518>
 12e45e0: f9400388     	ldr	x8, [x28]
 12e45e4: b9402fea     	ldr	w10, [sp, #0x2c]
 12e45e8: f9405d09     	ldr	x9, [x8, #0xb8]
 12e45ec: 2a1f03f9     	mov	w25, wzr
 12e45f0: 7100095f     	cmp	w10, #0x2
 12e45f4: 54000101     	b.ne	0x12e4614 <__start_il2cpp+0x13ce50>
 12e45f8: 39402d2a     	ldrb	w10, [x9, #0xb]
 12e45fc: 340000ca     	cbz	w10, 0x12e4614 <__start_il2cpp+0x13ce50>
 12e4600: b4002f98     	cbz	x24, 0x12e4bf0 <__start_il2cpp+0x13d42c>
 12e4604: b9401b0a     	ldr	w10, [x24, #0x18]
 12e4608: 34002f2a     	cbz	w10, 0x12e4bec <__start_il2cpp+0x13d428>
 12e460c: 52800039     	mov	w25, #0x1               // =1
 12e4610: b900231f     	str	wzr, [x24, #0x20]
 12e4614: b940e10a     	ldr	w10, [x8, #0xe0]
 12e4618: 350000aa     	cbnz	w10, 0x12e462c <__start_il2cpp+0x13ce68>
 12e461c: aa0803e0     	mov	x0, x8
 12e4620: 97f76e70     	bl	0x10bffe0 <CloseNLSocket+0x518>
 12e4624: f9400388     	ldr	x8, [x28]
 12e4628: f9405d09     	ldr	x9, [x8, #0xb8]
 12e462c: b9402fea     	ldr	w10, [sp, #0x2c]
 12e4630: 7100095f     	cmp	w10, #0x2
 12e4634: 54000161     	b.ne	0x12e4660 <__start_il2cpp+0x13ce9c>
 12e4638: 3940312a     	ldrb	w10, [x9, #0xc]
 12e463c: 3400012a     	cbz	w10, 0x12e4660 <__start_il2cpp+0x13ce9c>
 12e4640: b4002d98     	cbz	x24, 0x12e4bf0 <__start_il2cpp+0x13d42c>
 12e4644: b9401b0a     	ldr	w10, [x24, #0x18]
 12e4648: 6b0a033f     	cmp	w25, w10
 12e464c: 54002d02     	b.hs	0x12e4bec <__start_il2cpp+0x13d428>
 12e4650: 8b394b0a     	add	x10, x24, w25, uxtw #2
 12e4654: 11000739     	add	w25, w25, #0x1
 12e4658: 5280002b     	mov	w11, #0x1               // =1
 12e465c: b900214b     	str	w11, [x10, #0x20]
 12e4660: b940e10a     	ldr	w10, [x8, #0xe0]
 12e4664: 350000aa     	cbnz	w10, 0x12e4678 <__start_il2cpp+0x13ceb4>
 12e4668: aa0803e0     	mov	x0, x8
 12e466c: 97f76e5d     	bl	0x10bffe0 <CloseNLSocket+0x518>
 12e4670: f9400388     	ldr	x8, [x28]
 12e4674: f9405d09     	ldr	x9, [x8, #0xb8]
 12e4678: b9402fe8     	ldr	w8, [sp, #0x2c]
 12e467c: 7100051f     	cmp	w8, #0x1
 12e4680: 540012e0     	b.eq	0x12e48dc <__start_il2cpp+0x13d118>
 12e4684: 39403528     	ldrb	w8, [x9, #0xd]
 12e4688: b94007e9     	ldr	w9, [sp, #0x4]
 12e468c: 0a090108     	and	w8, w8, w9
 12e4690: 34001268     	cbz	w8, 0x12e48dc <__start_il2cpp+0x13d118>
 12e4694: b4002af8     	cbz	x24, 0x12e4bf0 <__start_il2cpp+0x13d42c>
 12e4698: b9401b08     	ldr	w8, [x24, #0x18]
 12e469c: 6b08033f     	cmp	w25, w8
 12e46a0: 54002a62     	b.hs	0x12e4bec <__start_il2cpp+0x13d428>
 12e46a4: 11000721     	add	w1, w25, #0x1
 12e46a8: 8b394b08     	add	x8, x24, w25, uxtw #2
 12e46ac: 52800049     	mov	w9, #0x2                // =2
 12e46b0: 2a1f03e0     	mov	w0, wzr
 12e46b4: aa1f03e2     	mov	x2, xzr
 12e46b8: b9002109     	str	w9, [x8, #0x20]
 12e46bc: 94473e0b     	bl	0x24b3ee8 <__start_il2cpp+0x130c724>
 12e46c0: 1400008e     	b	0x12e48f8 <__start_il2cpp+0x13d134>
 12e46c4: b000abd7     	adrp	x23, 0x285d000
 12e46c8: d000ac18     	adrp	x24, 0x2866000
 12e46cc: d000ac1a     	adrp	x26, 0x2866000
 12e46d0: d000ac1b     	adrp	x27, 0x2866000
 12e46d4: d000ac1c     	adrp	x28, 0x2866000
 12e46d8: 9000abdd     	adrp	x29, 0x285c000 <_ZTVN10__cxxabiv119__pointer_type_infoE+0x18>
 12e46dc: f9411af7     	ldr	x23, [x23, #0x230]
 12e46e0: f9412b18     	ldr	x24, [x24, #0x250]
 12e46e4: f9414f5a     	ldr	x26, [x26, #0x298]
 12e46e8: f941477b     	ldr	x27, [x27, #0x288]
 12e46ec: f9412f9c     	ldr	x28, [x28, #0x258]
 12e46f0: f9471bbd     	ldr	x29, [x29, #0xe30]
 12e46f4: 52800035     	mov	w21, #0x1               // =1
 12e46f8: 92800019     	mov	x25, #-0x1              // =-1
 12e46fc: 52800023     	mov	w3, #0x1                // =1
 12e4700: aa1303e0     	mov	x0, x19
 12e4704: 2a1503e1     	mov	w1, w21
 12e4708: 2a1403e2     	mov	w2, w20
 12e470c: 97fffc1d     	bl	0x12e3780 <__start_il2cpp+0x13bfbc>
 12e4710: f94002e8     	ldr	x8, [x23]
 12e4714: 12000009     	and	w9, w0, #0x1
 12e4718: 528000e1     	mov	w1, #0x7                // =7
 12e471c: 3901f3e9     	strb	w9, [sp, #0x7c]
 12e4720: aa0803e0     	mov	x0, x8
 12e4724: 97f76e0b     	bl	0x10bff50 <CloseNLSocket+0x488>
 12e4728: f9400308     	ldr	x8, [x24]
 12e472c: aa0003f6     	mov	x22, x0
 12e4730: 910183e0     	add	x0, sp, #0x60
 12e4734: aa1f03e1     	mov	x1, xzr
 12e4738: a90667e8     	stp	x8, x25, [sp, #0x60]
 12e473c: b9403268     	ldr	w8, [x19, #0x30]
 12e4740: b90073e8     	str	w8, [sp, #0x70]
 12e4744: 942fd60d     	bl	0x1ed9f78 <__start_il2cpp+0xd327b4>
 12e4748: b4002556     	cbz	x22, 0x12e4bf0 <__start_il2cpp+0x13d42c>
 12e474c: b9401ac8     	ldr	w8, [x22, #0x18]
 12e4750: 340024e8     	cbz	w8, 0x12e4bec <__start_il2cpp+0x13d428>
 12e4754: 7100051f     	cmp	w8, #0x1
 12e4758: f90012c0     	str	x0, [x22, #0x20]
 12e475c: 54002480     	b.eq	0x12e4bec <__start_il2cpp+0x13d428>
 12e4760: f9400348     	ldr	x8, [x26]
 12e4764: 910123e0     	add	x0, sp, #0x48
 12e4768: aa1f03e1     	mov	x1, xzr
 12e476c: f90016c8     	str	x8, [x22, #0x28]
 12e4770: f9400308     	ldr	x8, [x24]
 12e4774: b9005bf5     	str	w21, [sp, #0x58]
 12e4778: a904e7e8     	stp	x8, x25, [sp, #0x48]
 12e477c: 942fd5ff     	bl	0x1ed9f78 <__start_il2cpp+0xd327b4>
 12e4780: b9401ac8     	ldr	w8, [x22, #0x18]
 12e4784: 7100091f     	cmp	w8, #0x2
 12e4788: 54002329     	b.ls	0x12e4bec <__start_il2cpp+0x13d428>
 12e478c: 71000d1f     	cmp	w8, #0x3
 12e4790: f9001ac0     	str	x0, [x22, #0x30]
 12e4794: 540022c0     	b.eq	0x12e4bec <__start_il2cpp+0x13d428>
 12e4798: f9400368     	ldr	x8, [x27]
 12e479c: 9100c3e0     	add	x0, sp, #0x30
 12e47a0: aa1f03e1     	mov	x1, xzr
 12e47a4: f9001ec8     	str	x8, [x22, #0x38]
 12e47a8: f9400388     	ldr	x8, [x28]
 12e47ac: b90043f4     	str	w20, [sp, #0x40]
 12e47b0: a90367e8     	stp	x8, x25, [sp, #0x30]
 12e47b4: 942fd5f1     	bl	0x1ed9f78 <__start_il2cpp+0xd327b4>
 12e47b8: b9401ac8     	ldr	w8, [x22, #0x18]
 12e47bc: 7100111f     	cmp	w8, #0x4
 12e47c0: 54002169     	b.ls	0x12e4bec <__start_il2cpp+0x13d428>
 12e47c4: 7100151f     	cmp	w8, #0x5
 12e47c8: f90022c0     	str	x0, [x22, #0x40]
 12e47cc: 54002100     	b.eq	0x12e4bec <__start_il2cpp+0x13d428>
 12e47d0: f9400368     	ldr	x8, [x27]
 12e47d4: f90026c8     	str	x8, [x22, #0x48]
 12e47d8: f94003a0     	ldr	x0, [x29]
 12e47dc: b940e008     	ldr	w8, [x0, #0xe0]
 12e47e0: 35000048     	cbnz	w8, 0x12e47e8 <__start_il2cpp+0x13d024>
 12e47e4: 97f76dff     	bl	0x10bffe0 <CloseNLSocket+0x518>
 12e47e8: 9101f3e0     	add	x0, sp, #0x7c
 12e47ec: aa1f03e1     	mov	x1, xzr
 12e47f0: 942d1bf0     	bl	0x1e2b7b0 <__start_il2cpp+0xc83fec>
 12e47f4: b9401ac8     	ldr	w8, [x22, #0x18]
 12e47f8: 7100191f     	cmp	w8, #0x6
 12e47fc: 54001f89     	b.ls	0x12e4bec <__start_il2cpp+0x13d428>
 12e4800: f9002ac0     	str	x0, [x22, #0x50]
 12e4804: aa1603e0     	mov	x0, x22
 12e4808: aa1f03e1     	mov	x1, xzr
 12e480c: 94297e0b     	bl	0x1d44038 <__start_il2cpp+0xb9c874>
 12e4810: aa1f03e1     	mov	x1, xzr
 12e4814: 94004b6e     	bl	0x12f75cc <__start_il2cpp+0x14fe08>
 12e4818: 110006b5     	add	w21, w21, #0x1
 12e481c: 71009abf     	cmp	w21, #0x26
 12e4820: 54fff6e1     	b.ne	0x12e46fc <__start_il2cpp+0x13cf38>
 12e4824: d000ac08     	adrp	x8, 0x2866000
 12e4828: f9414908     	ldr	x8, [x8, #0x290]
 12e482c: aa1303e1     	mov	x1, x19
 12e4830: aa1f03e2     	mov	x2, xzr
 12e4834: f9400100     	ldr	x0, [x8]
 12e4838: 94004943     	bl	0x12f6d44 <__start_il2cpp+0x14f580>
 12e483c: aa1f03f5     	mov	x21, xzr
 12e4840: 140000c0     	b	0x12e4b40 <__start_il2cpp+0x13d37c>
 12e4844: b940e009     	ldr	w9, [x0, #0xe0]
 12e4848: 35000089     	cbnz	w9, 0x12e4858 <__start_il2cpp+0x13d094>
 12e484c: 97f76de5     	bl	0x10bffe0 <CloseNLSocket+0x518>
 12e4850: f9400380     	ldr	x0, [x28]
 12e4854: f9405c08     	ldr	x8, [x0, #0xb8]
 12e4858: b94023e9     	ldr	w9, [sp, #0x20]
 12e485c: 37000609     	tbnz	w9, #0x0, 0x12e491c <__start_il2cpp+0x13d158>
 12e4860: 39403508     	ldrb	w8, [x8, #0xd]
 12e4864: 35ffe928     	cbnz	w8, 0x12e4588 <__start_il2cpp+0x13cdc4>
 12e4868: 1400002d     	b	0x12e491c <__start_il2cpp+0x13d158>
 12e486c: 71000ebf     	cmp	w21, #0x3
 12e4870: 540017a0     	b.eq	0x12e4b64 <__start_il2cpp+0x13d3a0>
 12e4874: 71000abf     	cmp	w21, #0x2
 12e4878: 54001ae1     	b.ne	0x12e4bd4 <__start_il2cpp+0x13d410>
 12e487c: b940e009     	ldr	w9, [x0, #0xe0]
 12e4880: 350000a9     	cbnz	w9, 0x12e4894 <__start_il2cpp+0x13d0d0>
 12e4884: 97f76dd7     	bl	0x10bffe0 <CloseNLSocket+0x518>
 12e4888: f9400380     	ldr	x0, [x28]
 12e488c: f9405c08     	ldr	x8, [x0, #0xb8]
 12e4890: b9404508     	ldr	w8, [x8, #0x44]
 12e4894: 71000d1f     	cmp	w8, #0x3
 12e4898: 540001c1     	b.ne	0x12e48d0 <__start_il2cpp+0x13d10c>
 12e489c: 51000688     	sub	w8, w20, #0x1
 12e48a0: 71000d1f     	cmp	w8, #0x3
 12e48a4: 54000108     	b.hi	0x12e48c4 <__start_il2cpp+0x13d100>
 12e48a8: f0ff9d89     	adrp	x9, 0x697000
 12e48ac: 91348129     	add	x9, x9, #0xd20
 12e48b0: b868d928     	ldr	w8, [x9, w8, sxtw #2]
 12e48b4: 52800049     	mov	w9, #0x2                // =2
 12e48b8: aa1303e0     	mov	x0, x19
 12e48bc: 29062668     	stp	w8, w9, [x19, #0x30]
 12e48c0: 97fff4d6     	bl	0x12e1c18 <__start_il2cpp+0x13a454>
 12e48c4: aa1303e0     	mov	x0, x19
 12e48c8: 97fff8ad     	bl	0x12e2b7c <__start_il2cpp+0x13b3b8>
 12e48cc: f9400380     	ldr	x0, [x28]
 12e48d0: b940e008     	ldr	w8, [x0, #0xe0]
 12e48d4: 35001608     	cbnz	w8, 0x12e4b94 <__start_il2cpp+0x13d3d0>
 12e48d8: 140000ad     	b	0x12e4b8c <__start_il2cpp+0x13d3c8>
 12e48dc: 7100073f     	cmp	w25, #0x1
 12e48e0: 5400182b     	b.lt	0x12e4be4 <__start_il2cpp+0x13d420>
 12e48e4: 2a1f03e0     	mov	w0, wzr
 12e48e8: 2a1903e1     	mov	w1, w25
 12e48ec: aa1f03e2     	mov	x2, xzr
 12e48f0: 94473d7e     	bl	0x24b3ee8 <__start_il2cpp+0x130c724>
 12e48f4: b40017f8     	cbz	x24, 0x12e4bf0 <__start_il2cpp+0x13d42c>
 12e48f8: b9401b08     	ldr	w8, [x24, #0x18]
 12e48fc: 6b08001f     	cmp	w0, w8
 12e4900: 54001762     	b.hs	0x12e4bec <__start_il2cpp+0x13d428>
 12e4904: 8b20cb08     	add	x8, x24, w0, sxtw #2
 12e4908: b9402108     	ldr	w8, [x8, #0x20]
 12e490c: 2a1503f6     	mov	w22, w21
 12e4910: 11000d09     	add	w9, w8, #0x3
 12e4914: 71000d1f     	cmp	w8, #0x3
 12e4918: 1a9b313b     	csel	w27, w9, w27, lo
 12e491c: f94007e8     	ldr	x8, [sp, #0x8]
 12e4920: b9402fe9     	ldr	w9, [sp, #0x2c]
 12e4924: b94017f5     	ldr	w21, [sp, #0x14]
 12e4928: 2a1a03f8     	mov	w24, w26
 12e492c: b9400108     	ldr	w8, [x8]
 12e4930: 71000d3f     	cmp	w9, #0x3
 12e4934: 54000181     	b.ne	0x12e4964 <__start_il2cpp+0x13d1a0>
 12e4938: 7100051f     	cmp	w8, #0x1
 12e493c: 2a1a03f8     	mov	w24, w26
 12e4940: 54000121     	b.ne	0x12e4964 <__start_il2cpp+0x13d1a0>
 12e4944: 71003adf     	cmp	w22, #0xe
 12e4948: 2a1603f8     	mov	w24, w22
 12e494c: 540000c0     	b.eq	0x12e4964 <__start_il2cpp+0x13d1a0>
 12e4950: 71002edf     	cmp	w22, #0xb
 12e4954: 54000061     	b.ne	0x12e4960 <__start_il2cpp+0x13d19c>
 12e4958: 52800178     	mov	w24, #0xb               // =11
 12e495c: 14000002     	b	0x12e4964 <__start_il2cpp+0x13d1a0>
 12e4960: 2a1a03f8     	mov	w24, w26
 12e4964: 7100051f     	cmp	w8, #0x1
 12e4968: 54000501     	b.ne	0x12e4a08 <__start_il2cpp+0x13d244>
 12e496c: 71003adf     	cmp	w22, #0xe
 12e4970: 54000060     	b.eq	0x12e497c <__start_il2cpp+0x13d1b8>
 12e4974: 71002edf     	cmp	w22, #0xb
 12e4978: 54000481     	b.ne	0x12e4a08 <__start_il2cpp+0x13d244>
 12e497c: 71002f1f     	cmp	w24, #0xb
 12e4980: 54000180     	b.eq	0x12e49b0 <__start_il2cpp+0x13d1ec>
 12e4984: 71003b1f     	cmp	w24, #0xe
 12e4988: 54000401     	b.ne	0x12e4a08 <__start_il2cpp+0x13d244>
 12e498c: 71000a9f     	cmp	w20, #0x2
 12e4990: 54000221     	b.ne	0x12e49d4 <__start_il2cpp+0x13d210>
 12e4994: b9402fe8     	ldr	w8, [sp, #0x2c]
 12e4998: 528001e9     	mov	w9, #0xf                // =15
 12e499c: aa1303e0     	mov	x0, x19
 12e49a0: 29062269     	stp	w9, w8, [x19, #0x30]
 12e49a4: 97fff49d     	bl	0x12e1c18 <__start_il2cpp+0x13a454>
 12e49a8: 52800218     	mov	w24, #0x10              // =16
 12e49ac: 14000017     	b	0x12e4a08 <__start_il2cpp+0x13d244>
 12e49b0: 7100069f     	cmp	w20, #0x1
 12e49b4: 540001e1     	b.ne	0x12e49f0 <__start_il2cpp+0x13d22c>
 12e49b8: b9402fe8     	ldr	w8, [sp, #0x2c]
 12e49bc: 52800189     	mov	w9, #0xc                // =12
 12e49c0: aa1303e0     	mov	x0, x19
 12e49c4: 29062269     	stp	w9, w8, [x19, #0x30]
 12e49c8: 97fff494     	bl	0x12e1c18 <__start_il2cpp+0x13a454>
 12e49cc: 528001b8     	mov	w24, #0xd               // =13
 12e49d0: 1400000e     	b	0x12e4a08 <__start_il2cpp+0x13d244>
 12e49d4: b9402fe8     	ldr	w8, [sp, #0x2c]
 12e49d8: 52800209     	mov	w9, #0x10               // =16
 12e49dc: aa1303e0     	mov	x0, x19
 12e49e0: 29062269     	stp	w9, w8, [x19, #0x30]
 12e49e4: 97fff48d     	bl	0x12e1c18 <__start_il2cpp+0x13a454>
 12e49e8: 528001f8     	mov	w24, #0xf               // =15
 12e49ec: 14000007     	b	0x12e4a08 <__start_il2cpp+0x13d244>
 12e49f0: b9402fe8     	ldr	w8, [sp, #0x2c]
 12e49f4: 528001a9     	mov	w9, #0xd                // =13
 12e49f8: aa1303e0     	mov	x0, x19
 12e49fc: 29062269     	stp	w9, w8, [x19, #0x30]
 12e4a00: 97fff486     	bl	0x12e1c18 <__start_il2cpp+0x13a454>
 12e4a04: 52800198     	mov	w24, #0xc               // =12
 12e4a08: b94013e8     	ldr	w8, [sp, #0x10]
 12e4a0c: 34000328     	cbz	w8, 0x12e4a70 <__start_il2cpp+0x13d2ac>
 12e4a10: 71000ebf     	cmp	w21, #0x3
 12e4a14: 54000081     	b.ne	0x12e4a24 <__start_il2cpp+0x13d260>
 12e4a18: b9402fe8     	ldr	w8, [sp, #0x2c]
 12e4a1c: 7100091f     	cmp	w8, #0x2
 12e4a20: 540001c0     	b.eq	0x12e4a58 <__start_il2cpp+0x13d294>
 12e4a24: b9402fe9     	ldr	w9, [sp, #0x2c]
 12e4a28: 7100093f     	cmp	w9, #0x2
 12e4a2c: 1a9f17e8     	cset	w8, eq
 12e4a30: 71000d3f     	cmp	w9, #0x3
 12e4a34: 1a9f17e9     	cset	w9, eq
 12e4a38: 71000abf     	cmp	w21, #0x2
 12e4a3c: 1a9f17ea     	cset	w10, eq
 12e4a40: 710006bf     	cmp	w21, #0x1
 12e4a44: 0a09014a     	and	w10, w10, w9
 12e4a48: 1a9f17e9     	cset	w9, eq
 12e4a4c: 3700006a     	tbnz	w10, #0x0, 0x12e4a58 <__start_il2cpp+0x13d294>
 12e4a50: 0a080128     	and	w8, w9, w8
 12e4a54: 340000e8     	cbz	w8, 0x12e4a70 <__start_il2cpp+0x13d2ac>
 12e4a58: 51000688     	sub	w8, w20, #0x1
 12e4a5c: 7100111f     	cmp	w8, #0x4
 12e4a60: 54000082     	b.hs	0x12e4a70 <__start_il2cpp+0x13d2ac>
 12e4a64: 90ff9da9     	adrp	x9, 0x698000
 12e4a68: 91008129     	add	x9, x9, #0x20
 12e4a6c: b868d938     	ldr	w24, [x9, w8, sxtw #2]
 12e4a70: f9400380     	ldr	x0, [x28]
 12e4a74: b940e008     	ldr	w8, [x0, #0xe0]
 12e4a78: 35000048     	cbnz	w8, 0x12e4a80 <__start_il2cpp+0x13d2bc>
 12e4a7c: 97f76d59     	bl	0x10bffe0 <CloseNLSocket+0x518>
 12e4a80: b9402fe1     	ldr	w1, [sp, #0x2c]
 12e4a84: 2a1803e0     	mov	w0, w24
 12e4a88: 97fff3b4     	bl	0x12e1958 <__start_il2cpp+0x13a194>
 12e4a8c: b4000b20     	cbz	x0, 0x12e4bf0 <__start_il2cpp+0x13d42c>
 12e4a90: d000abe8     	adrp	x8, 0x2862000
 12e4a94: f9424108     	ldr	x8, [x8, #0x480]
 12e4a98: f9400101     	ldr	x1, [x8]
 12e4a9c: 9403d0b1     	bl	0x13d8d60 <__start_il2cpp+0x23159c>
 12e4aa0: b4000a80     	cbz	x0, 0x12e4bf0 <__start_il2cpp+0x13d42c>
 12e4aa4: 51000768     	sub	w8, w27, #0x1
 12e4aa8: aa0003f5     	mov	x21, x0
 12e4aac: 7100051f     	cmp	w8, #0x1
 12e4ab0: 2913601a     	stp	w26, w24, [x0, #0x98]
 12e4ab4: 54000068     	b.hi	0x12e4ac0 <__start_il2cpp+0x13d2fc>
 12e4ab8: b9003abb     	str	w27, [x21, #0x38]
 12e4abc: 14000004     	b	0x12e4acc <__start_il2cpp+0x13d308>
 12e4ac0: aa1503e0     	mov	x0, x21
 12e4ac4: 2a1b03e1     	mov	w1, w27
 12e4ac8: 97fff79b     	bl	0x12e2934 <__start_il2cpp+0x13b170>
 12e4acc: b94023e8     	ldr	w8, [sp, #0x20]
 12e4ad0: 37000108     	tbnz	w8, #0x0, 0x12e4af0 <__start_il2cpp+0x13d32c>
 12e4ad4: aa1503e0     	mov	x0, x21
 12e4ad8: 2a1403e1     	mov	w1, w20
 12e4adc: aa1303e2     	mov	x2, x19
 12e4ae0: 94000045     	bl	0x12e4bf4 <__start_il2cpp+0x13d430>
 12e4ae4: aa1503e0     	mov	x0, x21
 12e4ae8: aa1303e2     	mov	x2, x19
 12e4aec: 9400050a     	bl	0x12e5f14 <__start_il2cpp+0x13e750>
 12e4af0: f9400380     	ldr	x0, [x28]
 12e4af4: b940e008     	ldr	w8, [x0, #0xe0]
 12e4af8: 35000048     	cbnz	w8, 0x12e4b00 <__start_il2cpp+0x13d33c>
 12e4afc: 97f76d39     	bl	0x10bffe0 <CloseNLSocket+0x518>
 12e4b00: 51000688     	sub	w8, w20, #0x1
 12e4b04: 71000d1f     	cmp	w8, #0x3
 12e4b08: 540000a8     	b.hi	0x12e4b1c <__start_il2cpp+0x13d358>
 12e4b0c: 90ff9da9     	adrp	x9, 0x698000
 12e4b10: 9104c129     	add	x9, x9, #0x130
 12e4b14: b868d922     	ldr	w2, [x9, w8, sxtw #2]
 12e4b18: 14000002     	b	0x12e4b20 <__start_il2cpp+0x13d35c>
 12e4b1c: 2a1f03e2     	mov	w2, wzr
 12e4b20: aa1303e0     	mov	x0, x19
 12e4b24: aa1503e1     	mov	x1, x21
 12e4b28: 94000608     	bl	0x12e6348 <__start_il2cpp+0x13eb84>
 12e4b2c: aa1503e0     	mov	x0, x21
 12e4b30: aa1303e1     	mov	x1, x19
 12e4b34: 940006c6     	bl	0x12e664c <__start_il2cpp+0x13ee88>
 12e4b38: aa1503e0     	mov	x0, x21
 12e4b3c: 94000738     	bl	0x12e681c <__start_il2cpp+0x13f058>
 12e4b40: aa1503e0     	mov	x0, x21
 12e4b44: a94d4ff4     	ldp	x20, x19, [sp, #0xd0]
 12e4b48: a94c57f6     	ldp	x22, x21, [sp, #0xc0]
 12e4b4c: a94b5ff8     	ldp	x24, x23, [sp, #0xb0]
 12e4b50: a94a67fa     	ldp	x26, x25, [sp, #0xa0]
 12e4b54: a9496ffc     	ldp	x28, x27, [sp, #0x90]
 12e4b58: a9487bfd     	ldp	x29, x30, [sp, #0x80]
 12e4b5c: 910383ff     	add	sp, sp, #0xe0
 12e4b60: d65f03c0     	ret
 12e4b64: b940e009     	ldr	w9, [x0, #0xe0]
 12e4b68: 350000a9     	cbnz	w9, 0x12e4b7c <__start_il2cpp+0x13d3b8>
 12e4b6c: 97f76d1d     	bl	0x10bffe0 <CloseNLSocket+0x518>
 12e4b70: f9400380     	ldr	x0, [x28]
 12e4b74: f9405c08     	ldr	x8, [x0, #0xb8]
 12e4b78: b9404508     	ldr	w8, [x8, #0x44]
 12e4b7c: 7100091f     	cmp	w8, #0x2
 12e4b80: 54000120     	b.eq	0x12e4ba4 <__start_il2cpp+0x13d3e0>
 12e4b84: b940e009     	ldr	w9, [x0, #0xe0]
 12e4b88: 350000a9     	cbnz	w9, 0x12e4b9c <__start_il2cpp+0x13d3d8>
 12e4b8c: 97f76d15     	bl	0x10bffe0 <CloseNLSocket+0x518>
 12e4b90: f9400380     	ldr	x0, [x28]
 12e4b94: f9405c08     	ldr	x8, [x0, #0xb8]
 12e4b98: b9404508     	ldr	w8, [x8, #0x44]
 12e4b9c: 7100051f     	cmp	w8, #0x1
 12e4ba0: 540001a1     	b.ne	0x12e4bd4 <__start_il2cpp+0x13d410>
 12e4ba4: 51000688     	sub	w8, w20, #0x1
 12e4ba8: 71000d1f     	cmp	w8, #0x3
 12e4bac: 540000e8     	b.hi	0x12e4bc8 <__start_il2cpp+0x13d404>
 12e4bb0: f0ff9d89     	adrp	x9, 0x697000
 12e4bb4: 91348129     	add	x9, x9, #0xd20
 12e4bb8: b868d928     	ldr	w8, [x9, w8, sxtw #2]
 12e4bbc: aa1303e0     	mov	x0, x19
 12e4bc0: 29065668     	stp	w8, w21, [x19, #0x30]
 12e4bc4: 97fff415     	bl	0x12e1c18 <__start_il2cpp+0x13a454>
 12e4bc8: aa1303e0     	mov	x0, x19
 12e4bcc: 97fff7ec     	bl	0x12e2b7c <__start_il2cpp+0x13b3b8>
 12e4bd0: f9400380     	ldr	x0, [x28]
 12e4bd4: 9100e268     	add	x8, x19, #0x38
 12e4bd8: f90007e8     	str	x8, [sp, #0x8]
 12e4bdc: 52800028     	mov	w8, #0x1                // =1
 12e4be0: 17fffd7d     	b	0x12e41d4 <__start_il2cpp+0x13ca10>
 12e4be4: 2a1503f6     	mov	w22, w21
 12e4be8: 17ffff4d     	b	0x12e491c <__start_il2cpp+0x13d158>
 12e4bec: 97f76d47     	bl	0x10c0108 <CloseNLSocket+0x640>
 12e4bf0: 97f76d44     	bl	0x10c0100 <CloseNLSocket+0x638>
