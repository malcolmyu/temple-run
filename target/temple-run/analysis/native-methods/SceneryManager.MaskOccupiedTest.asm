
/tmp/temple-libil2cpp.so:	file format elf64-littleaarch64

Disassembly of section il2cpp:

00000000011a77c4 <__start_il2cpp>:
 12f6fcc: d10143ff     	sub	sp, sp, #0x50
 12f6fd0: 6d0123e9     	stp	d9, d8, [sp, #0x10]
 12f6fd4: a9025ffe     	stp	x30, x23, [sp, #0x20]
 12f6fd8: a90357f6     	stp	x22, x21, [sp, #0x30]
 12f6fdc: a9044ff4     	stp	x20, x19, [sp, #0x40]
 12f6fe0: f000b9f6     	adrp	x22, 0x2a35000
 12f6fe4: f000ab35     	adrp	x21, 0x285d000
 12f6fe8: 396ee2c8     	ldrb	w8, [x22, #0xbb8]
 12f6fec: f9411ab5     	ldr	x21, [x21, #0x230]
 12f6ff0: aa0103f4     	mov	x20, x1
 12f6ff4: 4ea11c28     	mov	v8.16b, v1.16b
 12f6ff8: 4ea01c09     	mov	v9.16b, v0.16b
 12f6ffc: aa0003f3     	mov	x19, x0
 12f7000: 37000248     	tbnz	w8, #0x0, 0x12f7048 <__start_il2cpp+0x14f884>
 12f7004: d000ab20     	adrp	x0, 0x285d000
 12f7008: f9411800     	ldr	x0, [x0, #0x230]
 12f700c: 97f723b3     	bl	0x10bfed8 <CloseNLSocket+0x410>
 12f7010: f000ab60     	adrp	x0, 0x2866000
 12f7014: f9445400     	ldr	x0, [x0, #0x8a8]
 12f7018: 97f723b0     	bl	0x10bfed8 <CloseNLSocket+0x410>
 12f701c: f000ab60     	adrp	x0, 0x2866000
 12f7020: f9445800     	ldr	x0, [x0, #0x8b0]
 12f7024: 97f723ad     	bl	0x10bfed8 <CloseNLSocket+0x410>
 12f7028: f000ab60     	adrp	x0, 0x2866000
 12f702c: f9445c00     	ldr	x0, [x0, #0x8b8]
 12f7030: 97f723aa     	bl	0x10bfed8 <CloseNLSocket+0x410>
 12f7034: f000ab60     	adrp	x0, 0x2866000
 12f7038: f9446000     	ldr	x0, [x0, #0x8c0]
 12f703c: 97f723a7     	bl	0x10bfed8 <CloseNLSocket+0x410>
 12f7040: 52800028     	mov	w8, #0x1                // =1
 12f7044: 392ee2c8     	strb	w8, [x22, #0xbb8]
 12f7048: 52a84e08     	mov	w8, #0x42700000         // =1114636288
 12f704c: 52aff009     	mov	w9, #0x7f800000         // =2139095040
 12f7050: 1e270100     	fmov	s0, w8
 12f7054: f94002a0     	ldr	x0, [x21]
 12f7058: 1e201921     	fdiv	s1, s9, s0
 12f705c: 1e270122     	fmov	s2, w9
 12f7060: 52b00008     	mov	w8, #-0x80000000        // =-2147483648
 12f7064: 1e201900     	fdiv	s0, s8, s0
 12f7068: 1e380029     	fcvtzs	w9, s1
 12f706c: 1e222020     	fcmp	s1, s2
 12f7070: 1a89010a     	csel	w10, w8, w9, eq
 12f7074: 1e380009     	fcvtzs	w9, s0
 12f7078: 1e222000     	fcmp	s0, s2
 12f707c: 1a890108     	csel	w8, w8, w9, eq
 12f7080: 528000c1     	mov	w1, #0x6                // =6
 12f7084: 29012be8     	stp	w8, w10, [sp, #0x8]
 12f7088: 97f723b2     	bl	0x10bff50 <CloseNLSocket+0x488>
 12f708c: b4000ea0     	cbz	x0, 0x12f7260 <__start_il2cpp+0x14fa9c>
 12f7090: b9401808     	ldr	w8, [x0, #0x18]
 12f7094: aa0003f5     	mov	x21, x0
 12f7098: 34000e28     	cbz	w8, 0x12f725c <__start_il2cpp+0x14fa98>
 12f709c: f000ab68     	adrp	x8, 0x2866000
 12f70a0: f9446108     	ldr	x8, [x8, #0x8c0]
 12f70a4: 910003e0     	mov	x0, sp
 12f70a8: aa1f03e1     	mov	x1, xzr
 12f70ac: aa1f03e2     	mov	x2, xzr
 12f70b0: f9400108     	ldr	x8, [x8]
 12f70b4: aa1f03e3     	mov	x3, xzr
 12f70b8: f90012a8     	str	x8, [x21, #0x20]
 12f70bc: 2d0023e9     	stp	s9, s8, [sp]
 12f70c0: 97fe0580     	bl	0x12786c0 <__start_il2cpp+0xd0efc>
 12f70c4: b9401aa8     	ldr	w8, [x21, #0x18]
 12f70c8: 7100051f     	cmp	w8, #0x1
 12f70cc: 54000c89     	b.ls	0x12f725c <__start_il2cpp+0x14fa98>
 12f70d0: 7100091f     	cmp	w8, #0x2
 12f70d4: f90016a0     	str	x0, [x21, #0x28]
 12f70d8: 54000c20     	b.eq	0x12f725c <__start_il2cpp+0x14fa98>
 12f70dc: f000ab68     	adrp	x8, 0x2866000
 12f70e0: f9445508     	ldr	x8, [x8, #0x8a8]
 12f70e4: 910033e0     	add	x0, sp, #0xc
 12f70e8: aa1f03e1     	mov	x1, xzr
 12f70ec: f9400108     	ldr	x8, [x8]
 12f70f0: f9001aa8     	str	x8, [x21, #0x30]
 12f70f4: 942eac88     	bl	0x1ea2314 <__start_il2cpp+0xcfab50>
 12f70f8: b9401aa8     	ldr	w8, [x21, #0x18]
 12f70fc: 71000d1f     	cmp	w8, #0x3
 12f7100: 54000ae9     	b.ls	0x12f725c <__start_il2cpp+0x14fa98>
 12f7104: 7100111f     	cmp	w8, #0x4
 12f7108: f9001ea0     	str	x0, [x21, #0x38]
 12f710c: 54000a80     	b.eq	0x12f725c <__start_il2cpp+0x14fa98>
 12f7110: f000ab76     	adrp	x22, 0x2866000
 12f7114: f9445ad6     	ldr	x22, [x22, #0x8b0]
 12f7118: 910023e0     	add	x0, sp, #0x8
 12f711c: aa1f03e1     	mov	x1, xzr
 12f7120: f94002c8     	ldr	x8, [x22]
 12f7124: f90022a8     	str	x8, [x21, #0x40]
 12f7128: 942eac7b     	bl	0x1ea2314 <__start_il2cpp+0xcfab50>
 12f712c: b9401aa8     	ldr	w8, [x21, #0x18]
 12f7130: 7100151f     	cmp	w8, #0x5
 12f7134: 54000949     	b.ls	0x12f725c <__start_il2cpp+0x14fa98>
 12f7138: f000ab77     	adrp	x23, 0x2866000
 12f713c: f9445ef7     	ldr	x23, [x23, #0x8b8]
 12f7140: f90026a0     	str	x0, [x21, #0x48]
 12f7144: aa1503e0     	mov	x0, x21
 12f7148: aa1f03e1     	mov	x1, xzr
 12f714c: 942933bb     	bl	0x1d44038 <__start_il2cpp+0xb9c874>
 12f7150: aa1403e1     	mov	x1, x20
 12f7154: 94000044     	bl	0x12f7264 <__start_il2cpp+0x14faa0>
 12f7158: b9805268     	ldrsw	x8, [x19, #0x50]
 12f715c: 3200ebea     	mov	w10, #0x77777777        // =2004318071
 12f7160: b9400fe9     	ldr	w9, [sp, #0xc]
 12f7164: 910033e0     	add	x0, sp, #0xc
 12f7168: 9b0a7d0b     	mul	x11, x8, x10
 12f716c: d360fd6b     	lsr	x11, x11, #32
 12f7170: 4b080168     	sub	w8, w11, w8
 12f7174: 13057d0b     	asr	w11, w8, #5
 12f7178: 0b487d68     	add	w8, w11, w8, lsr #31
 12f717c: 0b090108     	add	w8, w8, w9
 12f7180: b9000fe8     	str	w8, [sp, #0xc]
 12f7184: b9805668     	ldrsw	x8, [x19, #0x54]
 12f7188: b9400be9     	ldr	w9, [sp, #0x8]
 12f718c: aa1f03e1     	mov	x1, xzr
 12f7190: 9b0a7d0a     	mul	x10, x8, x10
 12f7194: d360fd4a     	lsr	x10, x10, #32
 12f7198: 4b080148     	sub	w8, w10, w8
 12f719c: 13057d0a     	asr	w10, w8, #5
 12f71a0: 0b487d48     	add	w8, w10, w8, lsr #31
 12f71a4: 0b090108     	add	w8, w8, w9
 12f71a8: b9000be8     	str	w8, [sp, #0x8]
 12f71ac: 942eac5a     	bl	0x1ea2314 <__start_il2cpp+0xcfab50>
 12f71b0: aa0003f5     	mov	x21, x0
 12f71b4: 910023e0     	add	x0, sp, #0x8
 12f71b8: aa1f03e1     	mov	x1, xzr
 12f71bc: 942eac56     	bl	0x1ea2314 <__start_il2cpp+0xcfab50>
 12f71c0: f94002e8     	ldr	x8, [x23]
 12f71c4: f94002c2     	ldr	x2, [x22]
 12f71c8: aa0003e3     	mov	x3, x0
 12f71cc: aa1503e1     	mov	x1, x21
 12f71d0: aa0803e0     	mov	x0, x8
 12f71d4: aa1f03e4     	mov	x4, xzr
 12f71d8: 94293356     	bl	0x1d43f30 <__start_il2cpp+0xb9c76c>
 12f71dc: aa1403e1     	mov	x1, x20
 12f71e0: 94000021     	bl	0x12f7264 <__start_il2cpp+0x14faa0>
 12f71e4: b9400fe8     	ldr	w8, [sp, #0xc]
 12f71e8: 37f802c8     	tbnz	w8, #0x1f, 0x12f7240 <__start_il2cpp+0x14fa7c>
 12f71ec: b9400be9     	ldr	w9, [sp, #0x8]
 12f71f0: 2a1f03e0     	mov	w0, wzr
 12f71f4: 7100493f     	cmp	w9, #0x12
 12f71f8: 54000268     	b.hi	0x12f7244 <__start_il2cpp+0x14fa80>
 12f71fc: 7100491f     	cmp	w8, #0x12
 12f7200: 5400022c     	b.gt	0x12f7244 <__start_il2cpp+0x14fa80>
 12f7204: f940326a     	ldr	x10, [x19, #0x60]
 12f7208: b40002ca     	cbz	x10, 0x12f7260 <__start_il2cpp+0x14fa9c>
 12f720c: f940094b     	ldr	x11, [x10, #0x10]
 12f7210: b940016c     	ldr	w12, [x11]
 12f7214: 6b0c011f     	cmp	w8, w12
 12f7218: 54000222     	b.hs	0x12f725c <__start_il2cpp+0x14fa98>
 12f721c: f940096b     	ldr	x11, [x11, #0x10]
 12f7220: 6b0b013f     	cmp	w9, w11
 12f7224: 540001c2     	b.hs	0x12f725c <__start_il2cpp+0x14fa98>
 12f7228: 9b082568     	madd	x8, x11, x8, x9
 12f722c: 8b080148     	add	x8, x10, x8
 12f7230: 39408108     	ldrb	w8, [x8, #0x20]
 12f7234: 7100011f     	cmp	w8, #0x0
 12f7238: 1a9f07e0     	cset	w0, ne
 12f723c: 14000002     	b	0x12f7244 <__start_il2cpp+0x14fa80>
 12f7240: 2a1f03e0     	mov	w0, wzr
 12f7244: a9444ff4     	ldp	x20, x19, [sp, #0x40]
 12f7248: a94357f6     	ldp	x22, x21, [sp, #0x30]
 12f724c: a9425ffe     	ldp	x30, x23, [sp, #0x20]
 12f7250: 6d4123e9     	ldp	d9, d8, [sp, #0x10]
 12f7254: 910143ff     	add	sp, sp, #0x50
 12f7258: d65f03c0     	ret
 12f725c: 97f723ab     	bl	0x10c0108 <CloseNLSocket+0x640>
 12f7260: 97f723a8     	bl	0x10c0100 <CloseNLSocket+0x638>
