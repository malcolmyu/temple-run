
/tmp/temple-libil2cpp.so:	file format elf64-littleaarch64

Disassembly of section il2cpp:

00000000011a77c4 <__start_il2cpp>:
 1269eac: d10283ff     	sub	sp, sp, #0xa0
 1269eb0: fd0023ea     	str	d10, [sp, #0x40]
 1269eb4: 6d04a3e9     	stp	d9, d8, [sp, #0x48]
 1269eb8: f9002ffe     	str	x30, [sp, #0x58]
 1269ebc: a90667fa     	stp	x26, x25, [sp, #0x60]
 1269ec0: a9075ff8     	stp	x24, x23, [sp, #0x70]
 1269ec4: a90857f6     	stp	x22, x21, [sp, #0x80]
 1269ec8: a9094ff4     	stp	x20, x19, [sp, #0x90]
 1269ecc: 9000be74     	adrp	x20, 0x2a35000
 1269ed0: 395d5688     	ldrb	w8, [x20, #0x755]
 1269ed4: aa0003f3     	mov	x19, x0
 1269ed8: 37000608     	tbnz	w8, #0x0, 0x1269f98 <__start_il2cpp+0xc27d4>
 1269edc: b000afc0     	adrp	x0, 0x2862000
 1269ee0: f9423000     	ldr	x0, [x0, #0x460]
 1269ee4: 97f957fd     	bl	0x10bfed8 <CloseNLSocket+0x410>
 1269ee8: b000afc0     	adrp	x0, 0x2862000
 1269eec: f9423400     	ldr	x0, [x0, #0x468]
 1269ef0: 97f957fa     	bl	0x10bfed8 <CloseNLSocket+0x410>
 1269ef4: b000afc0     	adrp	x0, 0x2862000
 1269ef8: f9423800     	ldr	x0, [x0, #0x470]
 1269efc: 97f957f7     	bl	0x10bfed8 <CloseNLSocket+0x410>
 1269f00: b000afc0     	adrp	x0, 0x2862000
 1269f04: f9423c00     	ldr	x0, [x0, #0x478]
 1269f08: 97f957f4     	bl	0x10bfed8 <CloseNLSocket+0x410>
 1269f0c: b000afa0     	adrp	x0, 0x285e000
 1269f10: f9414000     	ldr	x0, [x0, #0x280]
 1269f14: 97f957f1     	bl	0x10bfed8 <CloseNLSocket+0x410>
 1269f18: b000afc0     	adrp	x0, 0x2862000
 1269f1c: f9424000     	ldr	x0, [x0, #0x480]
 1269f20: 97f957ee     	bl	0x10bfed8 <CloseNLSocket+0x410>
 1269f24: b000afc0     	adrp	x0, 0x2862000
 1269f28: f9424400     	ldr	x0, [x0, #0x488]
 1269f2c: 97f957eb     	bl	0x10bfed8 <CloseNLSocket+0x410>
 1269f30: f000af80     	adrp	x0, 0x285c000 <_ZTVN10__cxxabiv119__pointer_type_infoE+0x18>
 1269f34: f9456000     	ldr	x0, [x0, #0xac0]
 1269f38: 97f957e8     	bl	0x10bfed8 <CloseNLSocket+0x410>
 1269f3c: b000afc0     	adrp	x0, 0x2862000
 1269f40: f9424800     	ldr	x0, [x0, #0x490]
 1269f44: 97f957e5     	bl	0x10bfed8 <CloseNLSocket+0x410>
 1269f48: b000afc0     	adrp	x0, 0x2862000
 1269f4c: f9424c00     	ldr	x0, [x0, #0x498]
 1269f50: 97f957e2     	bl	0x10bfed8 <CloseNLSocket+0x410>
 1269f54: b000afc0     	adrp	x0, 0x2862000
 1269f58: f9425000     	ldr	x0, [x0, #0x4a0]
 1269f5c: 97f957df     	bl	0x10bfed8 <CloseNLSocket+0x410>
 1269f60: b000afc0     	adrp	x0, 0x2862000
 1269f64: f9425400     	ldr	x0, [x0, #0x4a8]
 1269f68: 97f957dc     	bl	0x10bfed8 <CloseNLSocket+0x410>
 1269f6c: b000afc0     	adrp	x0, 0x2862000
 1269f70: f9425800     	ldr	x0, [x0, #0x4b0]
 1269f74: 97f957d9     	bl	0x10bfed8 <CloseNLSocket+0x410>
 1269f78: b000afc0     	adrp	x0, 0x2862000
 1269f7c: f9425c00     	ldr	x0, [x0, #0x4b8]
 1269f80: 97f957d6     	bl	0x10bfed8 <CloseNLSocket+0x410>
 1269f84: b000afc0     	adrp	x0, 0x2862000
 1269f88: f9426000     	ldr	x0, [x0, #0x4c0]
 1269f8c: 97f957d3     	bl	0x10bfed8 <CloseNLSocket+0x410>
 1269f90: 52800028     	mov	w8, #0x1                // =1
 1269f94: 391d5688     	strb	w8, [x20, #0x755]
 1269f98: a9027fff     	stp	xzr, xzr, [sp, #0x20]
 1269f9c: f9001bff     	str	xzr, [sp, #0x30]
 1269fa0: d0ffa168     	adrp	x8, 0x697000
 1269fa4: f0ffa169     	adrp	x9, 0x698000
 1269fa8: 3dc1c500     	ldr	q0, [x8, #0x710]
 1269fac: 3dc00121     	ldr	q1, [x9]
 1269fb0: f9403660     	ldr	x0, [x19, #0x68]
 1269fb4: 528d650a     	mov	w10, #0x6b28            // =27432
 1269fb8: 72a9cdca     	movk	w10, #0x4e6e, lsl #16
 1269fbc: 52a8590b     	mov	w11, #0x42c80000        // =1120403456
 1269fc0: 0e040d42     	dup	v2.2s, w10
 1269fc4: fd00a262     	str	d2, [x19, #0x140]
 1269fc8: ad090660     	stp	q0, q1, [x19, #0x120]
 1269fcc: b9014a6b     	str	w11, [x19, #0x148]
 1269fd0: b4005100     	cbz	x0, 0x126a9f0 <__start_il2cpp+0xc322c>
 1269fd4: f9400008     	ldr	x8, [x0]
 1269fd8: a95a8509     	ldp	x9, x1, [x8, #0x1a8]
 1269fdc: d63f0120     	blr	x9
 1269fe0: f9403668     	ldr	x8, [x19, #0x68]
 1269fe4: b4000208     	cbz	x8, 0x126a024 <__start_il2cpp+0xc2860>
 1269fe8: b000afc9     	adrp	x9, 0x2862000
 1269fec: f9423129     	ldr	x9, [x9, #0x460]
 1269ff0: f940010a     	ldr	x10, [x8]
 1269ff4: f9400129     	ldr	x9, [x9]
 1269ff8: 3944c14c     	ldrb	w12, [x10, #0x130]
 1269ffc: 3944c12b     	ldrb	w11, [x9, #0x130]
 126a000: 6b0b019f     	cmp	w12, w11
 126a004: 54000062     	b.hs	0x126a010 <__start_il2cpp+0xc284c>
 126a008: aa1f03e8     	mov	x8, xzr
 126a00c: 14000006     	b	0x126a024 <__start_il2cpp+0xc2860>
 126a010: f940654a     	ldr	x10, [x10, #0xc8]
 126a014: 8b0b0d4a     	add	x10, x10, x11, lsl #3
 126a018: f85f814a     	ldur	x10, [x10, #-0x8]
 126a01c: eb09015f     	cmp	x10, x9
 126a020: 9a9f0108     	csel	x8, x8, xzr, eq
 126a024: f9003a68     	str	x8, [x19, #0x70]
 126a028: f9402a68     	ldr	x8, [x19, #0x50]
 126a02c: 52a81e09     	mov	w9, #0x40f00000         // =1089470464
 126a030: b9014e7f     	str	wzr, [x19, #0x14c]
 126a034: b9021a69     	str	w9, [x19, #0x218]
 126a038: 3908d27f     	strb	wzr, [x19, #0x234]
 126a03c: b902427f     	str	wzr, [x19, #0x240]
 126a040: b4004d88     	cbz	x8, 0x126a9f0 <__start_il2cpp+0xc322c>
 126a044: 9000afc9     	adrp	x9, 0x2862000
 126a048: 9000afd5     	adrp	x21, 0x2862000
 126a04c: f9425929     	ldr	x9, [x9, #0x4b0]
 126a050: f94256b5     	ldr	x21, [x21, #0x4a8]
 126a054: 3903311f     	strb	wzr, [x8, #0xcc]
 126a058: 9105c268     	add	x8, x19, #0x170
 126a05c: 9107726a     	add	x10, x19, #0x1dc
 126a060: f900867f     	str	xzr, [x19, #0x108]
 126a064: 3903827f     	strb	wzr, [x19, #0xe0]
 126a068: b900fa7f     	str	wzr, [x19, #0xf8]
 126a06c: f9001e7f     	str	xzr, [x19, #0x38]
 126a070: 3905927f     	strb	wzr, [x19, #0x164]
 126a074: 3905b27f     	strb	wzr, [x19, #0x16c]
 126a078: b9018a7f     	str	wzr, [x19, #0x188]
 126a07c: f80ec27f     	stur	xzr, [x19, #0xec]
 126a080: f80e427f     	stur	xzr, [x19, #0xe4]
 126a084: 7901ea7f     	strh	wzr, [x19, #0xf4]
 126a088: a9177e7f     	stp	xzr, xzr, [x19, #0x170]
 126a08c: f800d11f     	stur	xzr, [x8, #0xd]
 126a090: a900fd5f     	stp	xzr, xzr, [x10, #0x8]
 126a094: f900015f     	str	xzr, [x10]
 126a098: f9400120     	ldr	x0, [x9]
 126a09c: f94002a1     	ldr	x1, [x21]
 126a0a0: 9000afd6     	adrp	x22, 0x2862000
 126a0a4: 9000afd4     	adrp	x20, 0x2862000
 126a0a8: f9424ed6     	ldr	x22, [x22, #0x498]
 126a0ac: f9425294     	ldr	x20, [x20, #0x4a0]
 126a0b0: aa1f03e2     	mov	x2, xzr
 126a0b4: 9449262f     	bl	0x24b3970 <__start_il2cpp+0x130c1ac>
 126a0b8: f94002a1     	ldr	x1, [x21]
 126a0bc: aa1f03e2     	mov	x2, xzr
 126a0c0: 942b661e     	bl	0x1d43938 <__start_il2cpp+0xb9c174>
 126a0c4: 12000008     	and	w8, w0, #0x1
 126a0c8: 39041268     	strb	w8, [x19, #0x104]
 126a0cc: f94002c0     	ldr	x0, [x22]
 126a0d0: f94002a1     	ldr	x1, [x21]
 126a0d4: aa1f03e2     	mov	x2, xzr
 126a0d8: 94492626     	bl	0x24b3970 <__start_il2cpp+0x130c1ac>
 126a0dc: f94002a1     	ldr	x1, [x21]
 126a0e0: aa1f03e2     	mov	x2, xzr
 126a0e4: 942b6615     	bl	0x1d43938 <__start_il2cpp+0xb9c174>
 126a0e8: 12000008     	and	w8, w0, #0x1
 126a0ec: 3906a268     	strb	w8, [x19, #0x1a8]
 126a0f0: f9400280     	ldr	x0, [x20]
 126a0f4: aa1f03e1     	mov	x1, xzr
 126a0f8: 9449262f     	bl	0x24b39b4 <__start_il2cpp+0x130c1f0>
 126a0fc: aa1f03e1     	mov	x1, xzr
 126a100: 942b6784     	bl	0x1d43f10 <__start_il2cpp+0xb9c74c>
 126a104: 36000220     	tbz	w0, #0x0, 0x126a148 <__start_il2cpp+0xc2984>
 126a108: aa1f03e0     	mov	x0, xzr
 126a10c: 94463dc3     	bl	0x23f9818 <__start_il2cpp+0x1252054>
 126a110: b4004700     	cbz	x0, 0x126a9f0 <__start_il2cpp+0xc322c>
 126a114: 9000afc8     	adrp	x8, 0x2862000
 126a118: f9400c14     	ldr	x20, [x0, #0x18]
 126a11c: f9425d08     	ldr	x8, [x8, #0x4b8]
 126a120: aa1f03e2     	mov	x2, xzr
 126a124: aa1403e0     	mov	x0, x20
 126a128: f9400101     	ldr	x1, [x8]
 126a12c: 942b6603     	bl	0x1d43938 <__start_il2cpp+0xb9c174>
 126a130: 9000afc8     	adrp	x8, 0x2862000
 126a134: f9426108     	ldr	x8, [x8, #0x4c0]
 126a138: 7200001f     	tst	w0, #0x1
 126a13c: f9400108     	ldr	x8, [x8]
 126a140: 9a941101     	csel	x1, x8, x20, ne
 126a144: 14000005     	b	0x126a158 <__start_il2cpp+0xc2994>
 126a148: f9400280     	ldr	x0, [x20]
 126a14c: aa1f03e1     	mov	x1, xzr
 126a150: 94492619     	bl	0x24b39b4 <__start_il2cpp+0x130c1f0>
 126a154: aa0003e1     	mov	x1, x0
 126a158: 9000afd6     	adrp	x22, 0x2862000
 126a15c: f9424ad6     	ldr	x22, [x22, #0x490]
 126a160: 52800022     	mov	w2, #0x1                // =1
 126a164: 940023ae     	bl	0x127301c <__start_il2cpp+0xcb858>
 126a168: aa1303e0     	mov	x0, x19
 126a16c: 94002444     	bl	0x127327c <__start_il2cpp+0xcbab8>
 126a170: aa1303e0     	mov	x0, x19
 126a174: 940004dc     	bl	0x126b4e4 <__start_il2cpp+0xc3d20>
 126a178: 52a86f48     	mov	w8, #0x437a0000         // =1132068864
 126a17c: 0f01f5c0     	fmov	v0.2s, #15.00000000
 126a180: 52800649     	mov	w9, #0x32               // =50
 126a184: b9016268     	str	w8, [x19, #0x160]
 126a188: fd00ae60     	str	d0, [x19, #0x158]
 126a18c: b9015669     	str	w9, [x19, #0x154]
 126a190: f94002c0     	ldr	x0, [x22]
 126a194: b940e008     	ldr	w8, [x0, #0xe0]
 126a198: 35000068     	cbnz	w8, 0x126a1a4 <__start_il2cpp+0xc29e0>
 126a19c: 97f95791     	bl	0x10bffe0 <CloseNLSocket+0x518>
 126a1a0: f94002c0     	ldr	x0, [x22]
 126a1a4: f9405c08     	ldr	x8, [x0, #0xb8]
 126a1a8: b9001d1f     	str	wzr, [x8, #0x1c]
 126a1ac: f9405e60     	ldr	x0, [x19, #0xb8]
 126a1b0: b4004200     	cbz	x0, 0x126a9f0 <__start_il2cpp+0xc322c>
 126a1b4: f9405a74     	ldr	x20, [x19, #0xb0]
 126a1b8: aa1f03e1     	mov	x1, xzr
 126a1bc: 9400f114     	bl	0x12a660c <__start_il2cpp+0xfee48>
 126a1c0: b4004194     	cbz	x20, 0x126a9f0 <__start_il2cpp+0xc322c>
 126a1c4: 2a0003e1     	mov	w1, w0
 126a1c8: 528000e2     	mov	w2, #0x7                // =7
 126a1cc: aa1403e0     	mov	x0, x20
 126a1d0: aa1f03e3     	mov	x3, xzr
 126a1d4: 94008ce5     	bl	0x128d568 <__start_il2cpp+0xe5da4>
 126a1d8: 51000408     	sub	w8, w0, #0x1
 126a1dc: 7100151f     	cmp	w8, #0x5
 126a1e0: 540006c8     	b.hi	0x126a2b8 <__start_il2cpp+0xc2af4>
 126a1e4: b0ffa269     	adrp	x9, 0x6b7000
 126a1e8: 9121d929     	add	x9, x9, #0x876
 126a1ec: 1000008a     	adr	x10, 0x126a1fc <__start_il2cpp+0xc2a38>
 126a1f0: 3868692b     	ldrb	w11, [x9, x8]
 126a1f4: 8b0b094a     	add	x10, x10, x11, lsl #2
 126a1f8: d61f0140     	br	x10
 126a1fc: 528012c8     	mov	w8, #0x96               // =150
 126a200: 14000008     	b	0x126a220 <__start_il2cpp+0xc2a5c>
 126a204: 52800c88     	mov	w8, #0x64               // =100
 126a208: 14000006     	b	0x126a220 <__start_il2cpp+0xc2a5c>
 126a20c: 52800fa8     	mov	w8, #0x7d               // =125
 126a210: 14000004     	b	0x126a220 <__start_il2cpp+0xc2a5c>
 126a214: 52800648     	mov	w8, #0x32               // =50
 126a218: 14000002     	b	0x126a220 <__start_il2cpp+0xc2a5c>
 126a21c: 52800968     	mov	w8, #0x4b               // =75
 126a220: b9015668     	str	w8, [x19, #0x154]
 126a224: f94002c0     	ldr	x0, [x22]
 126a228: b940e008     	ldr	w8, [x0, #0xe0]
 126a22c: 35000068     	cbnz	w8, 0x126a238 <__start_il2cpp+0xc2a74>
 126a230: 97f9576c     	bl	0x10bffe0 <CloseNLSocket+0x518>
 126a234: f94002c0     	ldr	x0, [x22]
 126a238: f9405c08     	ldr	x8, [x0, #0xb8]
 126a23c: 529999a9     	mov	w9, #0xcccd             // =52429
 126a240: 72a7c989     	movk	w9, #0x3e4c, lsl #16
 126a244: b9001d09     	str	w9, [x8, #0x1c]
 126a248: b940e008     	ldr	w8, [x0, #0xe0]
 126a24c: 35000068     	cbnz	w8, 0x126a258 <__start_il2cpp+0xc2a94>
 126a250: 97f95764     	bl	0x10bffe0 <CloseNLSocket+0x518>
 126a254: f94002c0     	ldr	x0, [x22]
 126a258: f9405c08     	ldr	x8, [x0, #0xb8]
 126a25c: b900211f     	str	wzr, [x8, #0x20]
 126a260: f9405e60     	ldr	x0, [x19, #0xb8]
 126a264: b4003c60     	cbz	x0, 0x126a9f0 <__start_il2cpp+0xc322c>
 126a268: f9405a74     	ldr	x20, [x19, #0xb0]
 126a26c: aa1f03e1     	mov	x1, xzr
 126a270: 9400f0e7     	bl	0x12a660c <__start_il2cpp+0xfee48>
 126a274: b4003bf4     	cbz	x20, 0x126a9f0 <__start_il2cpp+0xc322c>
 126a278: 2a0003e1     	mov	w1, w0
 126a27c: 528000c2     	mov	w2, #0x6                // =6
 126a280: aa1403e0     	mov	x0, x20
 126a284: aa1f03e3     	mov	x3, xzr
 126a288: 94008cb8     	bl	0x128d568 <__start_il2cpp+0xe5da4>
 126a28c: 51000408     	sub	w8, w0, #0x1
 126a290: 7100151f     	cmp	w8, #0x5
 126a294: 54000728     	b.hi	0x126a378 <__start_il2cpp+0xc2bb4>
 126a298: b0ffa269     	adrp	x9, 0x6b7000
 126a29c: 9121f129     	add	x9, x9, #0x87c
 126a2a0: 1000008a     	adr	x10, 0x126a2b0 <__start_il2cpp+0xc2aec>
 126a2a4: 3868692b     	ldrb	w11, [x9, x8]
 126a2a8: 8b0b094a     	add	x10, x10, x11, lsl #2
 126a2ac: d61f0140     	br	x10
 126a2b0: 52a83908     	mov	w8, #0x41c80000         // =1103626240
 126a2b4: 1400000a     	b	0x126a2dc <__start_il2cpp+0xc2b18>
 126a2b8: f94002c0     	ldr	x0, [x22]
 126a2bc: 17ffffe3     	b	0x126a248 <__start_il2cpp+0xc2a84>
 126a2c0: 52a83408     	mov	w8, #0x41a00000         // =1101004800
 126a2c4: 14000006     	b	0x126a2dc <__start_il2cpp+0xc2b18>
 126a2c8: 52a83688     	mov	w8, #0x41b40000         // =1102315520
 126a2cc: 14000004     	b	0x126a2dc <__start_il2cpp+0xc2b18>
 126a2d0: 52a82e08     	mov	w8, #0x41700000         // =1097859072
 126a2d4: 14000002     	b	0x126a2dc <__start_il2cpp+0xc2b18>
 126a2d8: 52a83188     	mov	w8, #0x418c0000         // =1099694080
 126a2dc: b9015e68     	str	w8, [x19, #0x15c]
 126a2e0: f94002c0     	ldr	x0, [x22]
 126a2e4: b940e008     	ldr	w8, [x0, #0xe0]
 126a2e8: 35000068     	cbnz	w8, 0x126a2f4 <__start_il2cpp+0xc2b30>
 126a2ec: 97f9573d     	bl	0x10bffe0 <CloseNLSocket+0x518>
 126a2f0: f94002c0     	ldr	x0, [x22]
 126a2f4: f9405c08     	ldr	x8, [x0, #0xb8]
 126a2f8: 529999a9     	mov	w9, #0xcccd             // =52429
 126a2fc: 72a7c989     	movk	w9, #0x3e4c, lsl #16
 126a300: b9002109     	str	w9, [x8, #0x20]
 126a304: b940e008     	ldr	w8, [x0, #0xe0]
 126a308: 35000068     	cbnz	w8, 0x126a314 <__start_il2cpp+0xc2b50>
 126a30c: 97f95735     	bl	0x10bffe0 <CloseNLSocket+0x518>
 126a310: f94002c0     	ldr	x0, [x22]
 126a314: f9405c08     	ldr	x8, [x0, #0xb8]
 126a318: b900251f     	str	wzr, [x8, #0x24]
 126a31c: f9405e60     	ldr	x0, [x19, #0xb8]
 126a320: b4003680     	cbz	x0, 0x126a9f0 <__start_il2cpp+0xc322c>
 126a324: f9405a74     	ldr	x20, [x19, #0xb0]
 126a328: aa1f03e1     	mov	x1, xzr
 126a32c: 9400f0b8     	bl	0x12a660c <__start_il2cpp+0xfee48>
 126a330: b4003614     	cbz	x20, 0x126a9f0 <__start_il2cpp+0xc322c>
 126a334: 2a0003e1     	mov	w1, w0
 126a338: 528000a2     	mov	w2, #0x5                // =5
 126a33c: aa1403e0     	mov	x0, x20
 126a340: aa1f03e3     	mov	x3, xzr
 126a344: 94008c89     	bl	0x128d568 <__start_il2cpp+0xe5da4>
 126a348: 51000408     	sub	w8, w0, #0x1
 126a34c: 7100151f     	cmp	w8, #0x5
 126a350: 540007a8     	b.hi	0x126a444 <__start_il2cpp+0xc2c80>
 126a354: b0ffa269     	adrp	x9, 0x6b7000
 126a358: 91220929     	add	x9, x9, #0x882
 126a35c: 1000008a     	adr	x10, 0x126a36c <__start_il2cpp+0xc2ba8>
 126a360: 3868692b     	ldrb	w11, [x9, x8]
 126a364: 8b0b094a     	add	x10, x10, x11, lsl #2
 126a368: d61f0140     	br	x10
 126a36c: 52a83908     	mov	w8, #0x41c80000         // =1103626240
 126a370: 52800069     	mov	w9, #0x3                // =3
 126a374: 1400000c     	b	0x126a3a4 <__start_il2cpp+0xc2be0>
 126a378: f94002c0     	ldr	x0, [x22]
 126a37c: 17ffffe2     	b	0x126a304 <__start_il2cpp+0xc2b40>
 126a380: 52a83408     	mov	w8, #0x41a00000         // =1101004800
 126a384: 14000002     	b	0x126a38c <__start_il2cpp+0xc2bc8>
 126a388: 52a83908     	mov	w8, #0x41c80000         // =1103626240
 126a38c: 52800049     	mov	w9, #0x2                // =2
 126a390: 14000005     	b	0x126a3a4 <__start_il2cpp+0xc2be0>
 126a394: 52a82e08     	mov	w8, #0x41700000         // =1097859072
 126a398: 14000002     	b	0x126a3a0 <__start_il2cpp+0xc2bdc>
 126a39c: 52a83408     	mov	w8, #0x41a00000         // =1101004800
 126a3a0: 52800029     	mov	w9, #0x1                // =1
 126a3a4: b9015a68     	str	w8, [x19, #0x158]
 126a3a8: b9015269     	str	w9, [x19, #0x150]
 126a3ac: f94002c0     	ldr	x0, [x22]
 126a3b0: b940e008     	ldr	w8, [x0, #0xe0]
 126a3b4: 35000068     	cbnz	w8, 0x126a3c0 <__start_il2cpp+0xc2bfc>
 126a3b8: 97f9570a     	bl	0x10bffe0 <CloseNLSocket+0x518>
 126a3bc: f94002c0     	ldr	x0, [x22]
 126a3c0: f9405c08     	ldr	x8, [x0, #0xb8]
 126a3c4: 529999a9     	mov	w9, #0xcccd             // =52429
 126a3c8: 72a7c989     	movk	w9, #0x3e4c, lsl #16
 126a3cc: b9002509     	str	w9, [x8, #0x24]
 126a3d0: b940e008     	ldr	w8, [x0, #0xe0]
 126a3d4: 35000068     	cbnz	w8, 0x126a3e0 <__start_il2cpp+0xc2c1c>
 126a3d8: 97f95702     	bl	0x10bffe0 <CloseNLSocket+0x518>
 126a3dc: f94002c0     	ldr	x0, [x22]
 126a3e0: f9405c08     	ldr	x8, [x0, #0xb8]
 126a3e4: b900291f     	str	wzr, [x8, #0x28]
 126a3e8: f9405e60     	ldr	x0, [x19, #0xb8]
 126a3ec: b4003020     	cbz	x0, 0x126a9f0 <__start_il2cpp+0xc322c>
 126a3f0: f9405a74     	ldr	x20, [x19, #0xb0]
 126a3f4: aa1f03e1     	mov	x1, xzr
 126a3f8: 9400f085     	bl	0x12a660c <__start_il2cpp+0xfee48>
 126a3fc: b4002fb4     	cbz	x20, 0x126a9f0 <__start_il2cpp+0xc322c>
 126a400: 2a0003e1     	mov	w1, w0
 126a404: 52800122     	mov	w2, #0x9                // =9
 126a408: aa1403e0     	mov	x0, x20
 126a40c: aa1f03e3     	mov	x3, xzr
 126a410: 94008c56     	bl	0x128d568 <__start_il2cpp+0xe5da4>
 126a414: 51000408     	sub	w8, w0, #0x1
 126a418: 7100151f     	cmp	w8, #0x5
 126a41c: 540003e8     	b.hi	0x126a498 <__start_il2cpp+0xc2cd4>
 126a420: b0ffa269     	adrp	x9, 0x6b7000
 126a424: 91222129     	add	x9, x9, #0x888
 126a428: 1000008a     	adr	x10, 0x126a438 <__start_il2cpp+0xc2c74>
 126a42c: 3868692b     	ldrb	w11, [x9, x8]
 126a430: 8b0b094a     	add	x10, x10, x11, lsl #2
 126a434: d61f0140     	br	x10
 126a438: 52900008     	mov	w8, #0x8000             // =32768
 126a43c: 72a88768     	movk	w8, #0x443b, lsl #16
 126a440: 1400000c     	b	0x126a470 <__start_il2cpp+0xc2cac>
 126a444: f94002c0     	ldr	x0, [x22]
 126a448: 17ffffe2     	b	0x126a3d0 <__start_il2cpp+0xc2c0c>
 126a44c: 52a87f48     	mov	w8, #0x43fa0000         // =1140457472
 126a450: 14000008     	b	0x126a470 <__start_il2cpp+0xc2cac>
 126a454: 52880008     	mov	w8, #0x4000             // =16384
 126a458: 72a88388     	movk	w8, #0x441c, lsl #16
 126a45c: 14000005     	b	0x126a470 <__start_il2cpp+0xc2cac>
 126a460: 52a86f48     	mov	w8, #0x437a0000         // =1132068864
 126a464: 14000003     	b	0x126a470 <__start_il2cpp+0xc2cac>
 126a468: 52900008     	mov	w8, #0x8000             // =32768
 126a46c: 72a87768     	movk	w8, #0x43bb, lsl #16
 126a470: b9016268     	str	w8, [x19, #0x160]
 126a474: f94002c0     	ldr	x0, [x22]
 126a478: b940e008     	ldr	w8, [x0, #0xe0]
 126a47c: 35000068     	cbnz	w8, 0x126a488 <__start_il2cpp+0xc2cc4>
 126a480: 97f956d8     	bl	0x10bffe0 <CloseNLSocket+0x518>
 126a484: f94002c0     	ldr	x0, [x22]
 126a488: f9405c08     	ldr	x8, [x0, #0xb8]
 126a48c: 529999a9     	mov	w9, #0xcccd             // =52429
 126a490: 72a7c989     	movk	w9, #0x3e4c, lsl #16
 126a494: b9002909     	str	w9, [x8, #0x28]
 126a498: f9405e60     	ldr	x0, [x19, #0xb8]
 126a49c: b4002aa0     	cbz	x0, 0x126a9f0 <__start_il2cpp+0xc322c>
 126a4a0: f9405a74     	ldr	x20, [x19, #0xb0]
 126a4a4: aa1f03e1     	mov	x1, xzr
 126a4a8: 9400f059     	bl	0x12a660c <__start_il2cpp+0xfee48>
 126a4ac: b4002a34     	cbz	x20, 0x126a9f0 <__start_il2cpp+0xc322c>
 126a4b0: 9000afb5     	adrp	x21, 0x285e000
 126a4b4: f94142b5     	ldr	x21, [x21, #0x280]
 126a4b8: 2a0003e1     	mov	w1, w0
 126a4bc: 52800102     	mov	w2, #0x8                // =8
 126a4c0: aa1403e0     	mov	x0, x20
 126a4c4: aa1f03e3     	mov	x3, xzr
 126a4c8: 94008c28     	bl	0x128d568 <__start_il2cpp+0xe5da4>
 126a4cc: f94002a8     	ldr	x8, [x21]
 126a4d0: 2a0003f4     	mov	w20, w0
 126a4d4: b940e109     	ldr	w9, [x8, #0xe0]
 126a4d8: 35000069     	cbnz	w9, 0x126a4e4 <__start_il2cpp+0xc2d20>
 126a4dc: aa0803e0     	mov	x0, x8
 126a4e0: 97f956c0     	bl	0x10bffe0 <CloseNLSocket+0x518>
 126a4e4: 2a1403e0     	mov	w0, w20
 126a4e8: 940023e1     	bl	0x127346c <__start_il2cpp+0xcbca8>
 126a4ec: 1e220000     	scvtf	s0, w0
 126a4f0: 2a1403e0     	mov	w0, w20
 126a4f4: bd014260     	str	s0, [x19, #0x140]
 126a4f8: 94002406     	bl	0x1273510 <__start_il2cpp+0xcbd4c>
 126a4fc: 2a0003e8     	mov	w8, w0
 126a500: f9405e60     	ldr	x0, [x19, #0xb8]
 126a504: 1e220100     	scvtf	s0, w8
 126a508: bd014660     	str	s0, [x19, #0x144]
 126a50c: 3903f27f     	strb	wzr, [x19, #0xfc]
 126a510: b4002700     	cbz	x0, 0x126a9f0 <__start_il2cpp+0xc322c>
 126a514: f9405a74     	ldr	x20, [x19, #0xb0]
 126a518: aa1f03e1     	mov	x1, xzr
 126a51c: 9400f03c     	bl	0x12a660c <__start_il2cpp+0xfee48>
 126a520: b4002694     	cbz	x20, 0x126a9f0 <__start_il2cpp+0xc322c>
 126a524: 2a0003e1     	mov	w1, w0
 126a528: aa1403e0     	mov	x0, x20
 126a52c: aa1f03e2     	mov	x2, xzr
 126a530: 940091b8     	bl	0x128ec10 <__start_il2cpp+0xe744c>
 126a534: f9405e68     	ldr	x8, [x19, #0xb8]
 126a538: b40025c8     	cbz	x8, 0x126a9f0 <__start_il2cpp+0xc322c>
 126a53c: f9405a75     	ldr	x21, [x19, #0xb0]
 126a540: 2a0003f4     	mov	w20, w0
 126a544: aa0803e0     	mov	x0, x8
 126a548: aa1f03e1     	mov	x1, xzr
 126a54c: 9400f030     	bl	0x12a660c <__start_il2cpp+0xfee48>
 126a550: b4002515     	cbz	x21, 0x126a9f0 <__start_il2cpp+0xc322c>
 126a554: 2a0003e1     	mov	w1, w0
 126a558: aa1503e0     	mov	x0, x21
 126a55c: aa1f03e2     	mov	x2, xzr
 126a560: 940091b2     	bl	0x128ec28 <__start_il2cpp+0xe7464>
 126a564: f9405e68     	ldr	x8, [x19, #0xb8]
 126a568: 6b00029f     	cmp	w20, w0
 126a56c: 1a80c289     	csel	w9, w20, w0, gt
 126a570: b9010269     	str	w9, [x19, #0x100]
 126a574: b40023e8     	cbz	x8, 0x126a9f0 <__start_il2cpp+0xc322c>
 126a578: f9405a74     	ldr	x20, [x19, #0xb0]
 126a57c: aa0803e0     	mov	x0, x8
 126a580: aa1f03e1     	mov	x1, xzr
 126a584: 9400f022     	bl	0x12a660c <__start_il2cpp+0xfee48>
 126a588: b4002354     	cbz	x20, 0x126a9f0 <__start_il2cpp+0xc322c>
 126a58c: 2a0003e1     	mov	w1, w0
 126a590: aa1403e0     	mov	x0, x20
 126a594: aa1f03e2     	mov	x2, xzr
 126a598: 94008481     	bl	0x128b79c <__start_il2cpp+0xe3fd8>
 126a59c: 35000060     	cbnz	w0, 0x126a5a8 <__start_il2cpp+0xc2de4>
 126a5a0: 52800028     	mov	w8, #0x1                // =1
 126a5a4: 3903f268     	strb	w8, [x19, #0xfc]
 126a5a8: f94002c0     	ldr	x0, [x22]
 126a5ac: 39441274     	ldrb	w20, [x19, #0x104]
 126a5b0: b940e008     	ldr	w8, [x0, #0xe0]
 126a5b4: 35000068     	cbnz	w8, 0x126a5c0 <__start_il2cpp+0xc2dfc>
 126a5b8: 97f9568a     	bl	0x10bffe0 <CloseNLSocket+0x518>
 126a5bc: f94002c0     	ldr	x0, [x22]
 126a5c0: b0ffa16a     	adrp	x10, 0x697000
 126a5c4: f9405c08     	ldr	x8, [x0, #0xb8]
 126a5c8: fd41e140     	ldr	d0, [x10, #0x3c0]
 126a5cc: b0ffa16b     	adrp	x11, 0x697000
 126a5d0: 528000c9     	mov	w9, #0x6                // =6
 126a5d4: d2c0202a     	mov	x10, #0x10100000000     // =1103806595072
 126a5d8: fc02c100     	stur	d0, [x8, #0x2c]
 126a5dc: fd411160     	ldr	d0, [x11, #0x220]
 126a5e0: 7100029f     	cmp	w20, #0x0
 126a5e4: 528001eb     	mov	w11, #0xf               // =15
 126a5e8: f2e0002a     	movk	x10, #0x1, lsl #48
 126a5ec: 1a89016b     	csel	w11, w11, w9, eq
 126a5f0: 39001d1f     	strb	wzr, [x8, #0x7]
 126a5f4: f8034109     	stur	x9, [x8, #0x34]
 126a5f8: f800f10a     	stur	x10, [x8, #0xf]
 126a5fc: f900051f     	str	xzr, [x8, #0x8]
 126a600: b9003d0b     	str	w11, [x8, #0x3c]
 126a604: fd002100     	str	d0, [x8, #0x40]
 126a608: f9405260     	ldr	x0, [x19, #0xa0]
 126a60c: b4001f20     	cbz	x0, 0x126a9f0 <__start_il2cpp+0xc322c>
 126a610: aa1f03e1     	mov	x1, xzr
 126a614: 940154e8     	bl	0x12bf9b4 <__start_il2cpp+0x1181f0>
 126a618: aa1303e0     	mov	x0, x19
 126a61c: 9400225c     	bl	0x1272f8c <__start_il2cpp+0xcb7c8>
 126a620: f9403660     	ldr	x0, [x19, #0x68]
 126a624: b4001e60     	cbz	x0, 0x126a9f0 <__start_il2cpp+0xc322c>
 126a628: aa1f03e1     	mov	x1, xzr
 126a62c: 94492eb8     	bl	0x24b610c <__start_il2cpp+0x130e948>
 126a630: b4001e00     	cbz	x0, 0x126a9f0 <__start_il2cpp+0xc322c>
 126a634: 1e2703e0     	fmov	s0, wzr
 126a638: 1e2703e1     	fmov	s1, wzr
 126a63c: 1e2703e2     	fmov	s2, wzr
 126a640: aa1f03e1     	mov	x1, xzr
 126a644: 94496034     	bl	0x24c2714 <__start_il2cpp+0x131af50>
 126a648: f9403660     	ldr	x0, [x19, #0x68]
 126a64c: b4001d20     	cbz	x0, 0x126a9f0 <__start_il2cpp+0xc322c>
 126a650: aa1f03e1     	mov	x1, xzr
 126a654: 94492eae     	bl	0x24b610c <__start_il2cpp+0x130e948>
 126a658: b4001cc0     	cbz	x0, 0x126a9f0 <__start_il2cpp+0xc322c>
 126a65c: 1e2703e0     	fmov	s0, wzr
 126a660: 1e2703e1     	fmov	s1, wzr
 126a664: 1e2703e2     	fmov	s2, wzr
 126a668: aa1f03e1     	mov	x1, xzr
 126a66c: 94496094     	bl	0x24c28bc <__start_il2cpp+0x131b0f8>
 126a670: f9403660     	ldr	x0, [x19, #0x68]
 126a674: b4001be0     	cbz	x0, 0x126a9f0 <__start_il2cpp+0xc322c>
 126a678: f9400008     	ldr	x8, [x0]
 126a67c: a95a8509     	ldp	x9, x1, [x8, #0x1a8]
 126a680: d63f0120     	blr	x9
 126a684: f9403660     	ldr	x0, [x19, #0x68]
 126a688: b4001b40     	cbz	x0, 0x126a9f0 <__start_il2cpp+0xc322c>
 126a68c: f9400008     	ldr	x8, [x0]
 126a690: 52800021     	mov	w1, #0x1                // =1
 126a694: a9588909     	ldp	x9, x2, [x8, #0x188]
 126a698: d63f0120     	blr	x9
 126a69c: f9405e60     	ldr	x0, [x19, #0xb8]
 126a6a0: b4001a80     	cbz	x0, 0x126a9f0 <__start_il2cpp+0xc322c>
 126a6a4: f9405a74     	ldr	x20, [x19, #0xb0]
 126a6a8: aa1f03e1     	mov	x1, xzr
 126a6ac: 9400efd8     	bl	0x12a660c <__start_il2cpp+0xfee48>
 126a6b0: b4001a14     	cbz	x20, 0x126a9f0 <__start_il2cpp+0xc322c>
 126a6b4: 2a0003e1     	mov	w1, w0
 126a6b8: aa1403e0     	mov	x0, x20
 126a6bc: 2a1f03e2     	mov	w2, wzr
 126a6c0: aa1f03e3     	mov	x3, xzr
 126a6c4: 94008ba9     	bl	0x128d568 <__start_il2cpp+0xe5da4>
 126a6c8: f9403a68     	ldr	x8, [x19, #0x70]
 126a6cc: b4001928     	cbz	x8, 0x126a9f0 <__start_il2cpp+0xc322c>
 126a6d0: b9015d00     	str	w0, [x8, #0x15c]
 126a6d4: 39441268     	ldrb	w8, [x19, #0x104]
 126a6d8: 39041a7f     	strb	wzr, [x19, #0x106]
 126a6dc: 340000a8     	cbz	w8, 0x126a6f0 <__start_il2cpp+0xc2f2c>
 126a6e0: b9404a68     	ldr	w8, [x19, #0x48]
 126a6e4: 34000068     	cbz	w8, 0x126a6f0 <__start_il2cpp+0xc2f2c>
 126a6e8: 52800034     	mov	w20, #0x1               // =1
 126a6ec: 1400000e     	b	0x126a724 <__start_il2cpp+0xc2f60>
 126a6f0: f9403660     	ldr	x0, [x19, #0x68]
 126a6f4: 52800028     	mov	w8, #0x1                // =1
 126a6f8: 39041a68     	strb	w8, [x19, #0x106]
 126a6fc: b40017a0     	cbz	x0, 0x126a9f0 <__start_il2cpp+0xc322c>
 126a700: aa1f03e1     	mov	x1, xzr
 126a704: 94492e82     	bl	0x24b610c <__start_il2cpp+0x130e948>
 126a708: b4001740     	cbz	x0, 0x126a9f0 <__start_il2cpp+0xc322c>
 126a70c: 1e2703e0     	fmov	s0, wzr
 126a710: 1e2703e1     	fmov	s1, wzr
 126a714: 1e349002     	fmov	s2, #-10.00000000
 126a718: aa1f03e1     	mov	x1, xzr
 126a71c: 94495ffe     	bl	0x24c2714 <__start_il2cpp+0x131af50>
 126a720: 528004b4     	mov	w20, #0x25              // =37
 126a724: f94002c0     	ldr	x0, [x22]
 126a728: b940e008     	ldr	w8, [x0, #0xe0]
 126a72c: 35000048     	cbnz	w8, 0x126a734 <__start_il2cpp+0xc2f70>
 126a730: 97f9562c     	bl	0x10bffe0 <CloseNLSocket+0x518>
 126a734: 52800041     	mov	w1, #0x2                // =2
 126a738: 2a1403e0     	mov	w0, w20
 126a73c: aa1f03e2     	mov	x2, xzr
 126a740: 9401dc86     	bl	0x12e1958 <__start_il2cpp+0x13a194>
 126a744: b4001560     	cbz	x0, 0x126a9f0 <__start_il2cpp+0xc322c>
 126a748: aa1f03e1     	mov	x1, xzr
 126a74c: aa0003f4     	mov	x20, x0
 126a750: 944938eb     	bl	0x24b8afc <__start_il2cpp+0x1311338>
 126a754: b40014e0     	cbz	x0, 0x126a9f0 <__start_il2cpp+0xc322c>
 126a758: 9000afd5     	adrp	x21, 0x2862000
 126a75c: f94242b5     	ldr	x21, [x21, #0x480]
 126a760: 1e2703e0     	fmov	s0, wzr
 126a764: 1e2703e1     	fmov	s1, wzr
 126a768: 1e2703e2     	fmov	s2, wzr
 126a76c: aa1f03e1     	mov	x1, xzr
 126a770: 94495fe9     	bl	0x24c2714 <__start_il2cpp+0x131af50>
 126a774: f94002a1     	ldr	x1, [x21]
 126a778: aa1403e0     	mov	x0, x20
 126a77c: 9405b979     	bl	0x13d8d60 <__start_il2cpp+0x23159c>
 126a780: f9001660     	str	x0, [x19, #0x28]
 126a784: b4001360     	cbz	x0, 0x126a9f0 <__start_il2cpp+0xc322c>
 126a788: aa1f03e1     	mov	x1, xzr
 126a78c: 9401f024     	bl	0x12e681c <__start_il2cpp+0x13f058>
 126a790: 52800068     	mov	w8, #0x3                // =3
 126a794: b9003268     	str	w8, [x19, #0x30]
 126a798: f94002c8     	ldr	x8, [x22]
 126a79c: f9405d08     	ldr	x8, [x8, #0xb8]
 126a7a0: 3900191f     	strb	wzr, [x8, #0x6]
 126a7a4: f9401660     	ldr	x0, [x19, #0x28]
 126a7a8: b4001240     	cbz	x0, 0x126a9f0 <__start_il2cpp+0xc322c>
 126a7ac: 528000c1     	mov	w1, #0x6                // =6
 126a7b0: 52800062     	mov	w2, #0x3                // =3
 126a7b4: aa1f03e3     	mov	x3, xzr
 126a7b8: 9401f373     	bl	0x12e7584 <__start_il2cpp+0x13fdc0>
 126a7bc: f94002c8     	ldr	x8, [x22]
 126a7c0: 52800029     	mov	w9, #0x1                // =1
 126a7c4: f9405d08     	ldr	x8, [x8, #0xb8]
 126a7c8: 39001909     	strb	w9, [x8, #0x6]
 126a7cc: f9401660     	ldr	x0, [x19, #0x28]
 126a7d0: b4001100     	cbz	x0, 0x126a9f0 <__start_il2cpp+0xc322c>
 126a7d4: b9403262     	ldr	w2, [x19, #0x30]
 126a7d8: 52800101     	mov	w1, #0x8                // =8
 126a7dc: aa1f03e3     	mov	x3, xzr
 126a7e0: 9401f369     	bl	0x12e7584 <__start_il2cpp+0x13fdc0>
 126a7e4: 39441268     	ldrb	w8, [x19, #0x104]
 126a7e8: 34000148     	cbz	w8, 0x126a810 <__start_il2cpp+0xc304c>
 126a7ec: b9404a61     	ldr	w1, [x19, #0x48]
 126a7f0: 7100103f     	cmp	w1, #0x4
 126a7f4: 5400010c     	b.gt	0x126a814 <__start_il2cpp+0xc3050>
 126a7f8: f9401660     	ldr	x0, [x19, #0x28]
 126a7fc: b4000fa0     	cbz	x0, 0x126a9f0 <__start_il2cpp+0xc322c>
 126a800: aa1f03e2     	mov	x2, xzr
 126a804: 9401f06a     	bl	0x12e69ac <__start_il2cpp+0x13f1e8>
 126a808: 39441268     	ldrb	w8, [x19, #0x104]
 126a80c: 35000048     	cbnz	w8, 0x126a814 <__start_il2cpp+0xc3050>
 126a810: b9016a7f     	str	wzr, [x19, #0x168]
 126a814: d000af88     	adrp	x8, 0x285c000 <_ZTVN10__cxxabiv119__pointer_type_infoE+0x18>
 126a818: f9456108     	ldr	x8, [x8, #0xac0]
 126a81c: f9403a74     	ldr	x20, [x19, #0x70]
 126a820: f9400100     	ldr	x0, [x8]
 126a824: b940e008     	ldr	w8, [x0, #0xe0]
 126a828: 35000048     	cbnz	w8, 0x126a830 <__start_il2cpp+0xc306c>
 126a82c: 97f955ed     	bl	0x10bffe0 <CloseNLSocket+0x518>
 126a830: aa1403e0     	mov	x0, x20
 126a834: aa1f03e1     	mov	x1, xzr
 126a838: aa1f03e2     	mov	x2, xzr
 126a83c: 94493803     	bl	0x24b8848 <__start_il2cpp+0x1311084>
 126a840: 36000220     	tbz	w0, #0x0, 0x126a884 <__start_il2cpp+0xc30c0>
 126a844: f9403a74     	ldr	x20, [x19, #0x70]
 126a848: b4000d54     	cbz	x20, 0x126a9f0 <__start_il2cpp+0xc322c>
 126a84c: aa1403e0     	mov	x0, x20
 126a850: aa1f03e1     	mov	x1, xzr
 126a854: 94492e2e     	bl	0x24b610c <__start_il2cpp+0x130e948>
 126a858: b4000cc0     	cbz	x0, 0x126a9f0 <__start_il2cpp+0xc322c>
 126a85c: aa1f03e1     	mov	x1, xzr
 126a860: 944960b9     	bl	0x24c2b44 <__start_il2cpp+0x131b380>
 126a864: f9403a68     	ldr	x8, [x19, #0x70]
 126a868: b4000c48     	cbz	x8, 0x126a9f0 <__start_il2cpp+0xc322c>
 126a86c: bd40e503     	ldr	s3, [x8, #0xe4]
 126a870: 1e230800     	fmul	s0, s0, s3
 126a874: 1e230821     	fmul	s1, s1, s3
 126a878: 1e230842     	fmul	s2, s2, s3
 126a87c: 2d068680     	stp	s0, s1, [x20, #0x34]
 126a880: bd003e82     	str	s2, [x20, #0x3c]
 126a884: f9410660     	ldr	x0, [x19, #0x208]
 126a888: b4000b40     	cbz	x0, 0x126a9f0 <__start_il2cpp+0xc322c>
 126a88c: 9000afc8     	adrp	x8, 0x2862000
 126a890: f9424508     	ldr	x8, [x8, #0x488]
 126a894: 9000afd8     	adrp	x24, 0x2862000
 126a898: 9000afd7     	adrp	x23, 0x2862000
 126a89c: f9400101     	ldr	x1, [x8]
 126a8a0: f9423b18     	ldr	x24, [x24, #0x470]
 126a8a4: f94236f7     	ldr	x23, [x23, #0x468]
 126a8a8: 910023e8     	add	x8, sp, #0x8
 126a8ac: 941a4195     	bl	0x18faf00 <__start_il2cpp+0x75373c>
 126a8b0: 3cc083e0     	ldur	q0, [sp, #0x8]
 126a8b4: f9400fe8     	ldr	x8, [sp, #0x18]
 126a8b8: f000af94     	adrp	x20, 0x285d000
 126a8bc: f9474a94     	ldr	x20, [x20, #0xe90]
 126a8c0: d000be59     	adrp	x25, 0x2a34000
 126a8c4: 3d800be0     	str	q0, [sp, #0x20]
 126a8c8: f9001be8     	str	x8, [sp, #0x30]
 126a8cc: 5280003a     	mov	w26, #0x1               // =1
 126a8d0: f9400301     	ldr	x1, [x24]
 126a8d4: 910083e0     	add	x0, sp, #0x20
 126a8d8: 94121f78     	bl	0x16f26b8 <__start_il2cpp+0x54aef4>
 126a8dc: 360006a0     	tbz	w0, #0x0, 0x126a9b0 <__start_il2cpp+0xc31ec>
 126a8e0: f9401bf5     	ldr	x21, [sp, #0x30]
 126a8e4: b40008f5     	cbz	x21, 0x126aa00 <__start_il2cpp+0xc323c>
 126a8e8: aa1503e0     	mov	x0, x21
 126a8ec: aa1f03e1     	mov	x1, xzr
 126a8f0: 94492e07     	bl	0x24b610c <__start_il2cpp+0x130e948>
 126a8f4: 397e8328     	ldrb	w8, [x25, #0xfa0]
 126a8f8: aa0003f6     	mov	x22, x0
 126a8fc: 35000088     	cbnz	w8, 0x126a90c <__start_il2cpp+0xc3148>
 126a900: aa1403e0     	mov	x0, x20
 126a904: 97f95575     	bl	0x10bfed8 <CloseNLSocket+0x410>
 126a908: 393e833a     	strb	w26, [x25, #0xfa0]
 126a90c: b40007d6     	cbz	x22, 0x126aa04 <__start_il2cpp+0xc3240>
 126a910: f9400288     	ldr	x8, [x20]
 126a914: f9405d08     	ldr	x8, [x8, #0xb8]
 126a918: 2d408901     	ldp	s1, s2, [x8, #0x4]
 126a91c: bd400100     	ldr	s0, [x8]
 126a920: aa1603e0     	mov	x0, x22
 126a924: aa1f03e1     	mov	x1, xzr
 126a928: 94495fe5     	bl	0x24c28bc <__start_il2cpp+0x131b0f8>
 126a92c: aa1503e0     	mov	x0, x21
 126a930: aa1f03e1     	mov	x1, xzr
 126a934: 94492df6     	bl	0x24b610c <__start_il2cpp+0x130e948>
 126a938: aa0003f5     	mov	x21, x0
 126a93c: f9403660     	ldr	x0, [x19, #0x68]
 126a940: b40005c0     	cbz	x0, 0x126a9f8 <__start_il2cpp+0xc3234>
 126a944: aa1f03e1     	mov	x1, xzr
 126a948: 94492df1     	bl	0x24b610c <__start_il2cpp+0x130e948>
 126a94c: b4000580     	cbz	x0, 0x126a9fc <__start_il2cpp+0xc3238>
 126a950: aa1f03e1     	mov	x1, xzr
 126a954: 94495f48     	bl	0x24c2674 <__start_il2cpp+0x131aeb0>
 126a958: f9403660     	ldr	x0, [x19, #0x68]
 126a95c: b40004c0     	cbz	x0, 0x126a9f4 <__start_il2cpp+0xc3230>
 126a960: 4ea01c08     	mov	v8.16b, v0.16b
 126a964: 4ea11c29     	mov	v9.16b, v1.16b
 126a968: 4ea21c4a     	mov	v10.16b, v2.16b
 126a96c: aa1f03e1     	mov	x1, xzr
 126a970: 94492de7     	bl	0x24b610c <__start_il2cpp+0x130e948>
 126a974: b40004a0     	cbz	x0, 0x126aa08 <__start_il2cpp+0xc3244>
 126a978: aa1f03e1     	mov	x1, xzr
 126a97c: 94496072     	bl	0x24c2b44 <__start_il2cpp+0x131b380>
 126a980: b4000475     	cbz	x21, 0x126aa0c <__start_il2cpp+0xc3248>
 126a984: bd421a63     	ldr	s3, [x19, #0x218]
 126a988: 1e230842     	fmul	s2, s2, s3
 126a98c: 1e230821     	fmul	s1, s1, s3
 126a990: 1e230800     	fmul	s0, s0, s3
 126a994: 1e223942     	fsub	s2, s10, s2
 126a998: 1e213921     	fsub	s1, s9, s1
 126a99c: 1e203900     	fsub	s0, s8, s0
 126a9a0: aa1503e0     	mov	x0, x21
 126a9a4: aa1f03e1     	mov	x1, xzr
 126a9a8: 94495f5b     	bl	0x24c2714 <__start_il2cpp+0x131af50>
 126a9ac: 17ffffc9     	b	0x126a8d0 <__start_il2cpp+0xc310c>
 126a9b0: f94002e1     	ldr	x1, [x23]
 126a9b4: 910083e0     	add	x0, sp, #0x20
 126a9b8: 94121f3f     	bl	0x16f26b4 <__start_il2cpp+0x54aef0>
 126a9bc: f9403260     	ldr	x0, [x19, #0x60]
 126a9c0: b4000180     	cbz	x0, 0x126a9f0 <__start_il2cpp+0xc322c>
 126a9c4: aa1f03e1     	mov	x1, xzr
 126a9c8: 94023317     	bl	0x12f7624 <__start_il2cpp+0x14fe60>
 126a9cc: a9494ff4     	ldp	x20, x19, [sp, #0x90]
 126a9d0: a94857f6     	ldp	x22, x21, [sp, #0x80]
 126a9d4: a9475ff8     	ldp	x24, x23, [sp, #0x70]
 126a9d8: a94667fa     	ldp	x26, x25, [sp, #0x60]
 126a9dc: f9402ffe     	ldr	x30, [sp, #0x58]
 126a9e0: 6d44a3e9     	ldp	d9, d8, [sp, #0x48]
 126a9e4: fd4023ea     	ldr	d10, [sp, #0x40]
 126a9e8: 910283ff     	add	sp, sp, #0xa0
 126a9ec: d65f03c0     	ret
 126a9f0: 97f955c4     	bl	0x10c0100 <CloseNLSocket+0x638>
 126a9f4: 97f955c3     	bl	0x10c0100 <CloseNLSocket+0x638>
 126a9f8: 97f955c2     	bl	0x10c0100 <CloseNLSocket+0x638>
 126a9fc: 97f955c1     	bl	0x10c0100 <CloseNLSocket+0x638>
 126aa00: 97f955c0     	bl	0x10c0100 <CloseNLSocket+0x638>
 126aa04: 97f955bf     	bl	0x10c0100 <CloseNLSocket+0x638>
 126aa08: 97f955be     	bl	0x10c0100 <CloseNLSocket+0x638>
 126aa0c: 97f955bd     	bl	0x10c0100 <CloseNLSocket+0x638>
 126aa10: 14000010     	b	0x126aa50 <__start_il2cpp+0xc328c>
 126aa14: 1400000f     	b	0x126aa50 <__start_il2cpp+0xc328c>
 126aa18: 1400000e     	b	0x126aa50 <__start_il2cpp+0xc328c>
 126aa1c: 1400000d     	b	0x126aa50 <__start_il2cpp+0xc328c>
 126aa20: 1400000c     	b	0x126aa50 <__start_il2cpp+0xc328c>
 126aa24: 1400000b     	b	0x126aa50 <__start_il2cpp+0xc328c>
 126aa28: 1400000a     	b	0x126aa50 <__start_il2cpp+0xc328c>
 126aa2c: 14000009     	b	0x126aa50 <__start_il2cpp+0xc328c>
 126aa30: 14000008     	b	0x126aa50 <__start_il2cpp+0xc328c>
 126aa34: 14000007     	b	0x126aa50 <__start_il2cpp+0xc328c>
 126aa38: 14000006     	b	0x126aa50 <__start_il2cpp+0xc328c>
 126aa3c: 14000005     	b	0x126aa50 <__start_il2cpp+0xc328c>
 126aa40: 14000004     	b	0x126aa50 <__start_il2cpp+0xc328c>
 126aa44: 14000003     	b	0x126aa50 <__start_il2cpp+0xc328c>
 126aa48: 14000002     	b	0x126aa50 <__start_il2cpp+0xc328c>
 126aa4c: 14000001     	b	0x126aa50 <__start_il2cpp+0xc328c>
 126aa50: aa0003f4     	mov	x20, x0
 126aa54: 7100043f     	cmp	w1, #0x1
 126aa58: 54000161     	b.ne	0x126aa84 <__start_il2cpp+0xc32c0>
 126aa5c: aa1403e0     	mov	x0, x20
 126aa60: 945274a4     	bl	0x2707cf0 <__cxa_begin_catch@plt>
 126aa64: f9400015     	ldr	x21, [x0]
 126aa68: 945274a6     	bl	0x2707d00 <__cxa_end_catch@plt>
 126aa6c: f94002e1     	ldr	x1, [x23]
 126aa70: 910083e0     	add	x0, sp, #0x20
 126aa74: 94121f10     	bl	0x16f26b4 <__start_il2cpp+0x54aef0>
 126aa78: b4fffa35     	cbz	x21, 0x126a9bc <__start_il2cpp+0xc31f8>
 126aa7c: aa1503e0     	mov	x0, x21
 126aa80: 97f9559e     	bl	0x10c00f8 <CloseNLSocket+0x630>
 126aa84: aa1f03f5     	mov	x21, xzr
 126aa88: 14000002     	b	0x126aa90 <__start_il2cpp+0xc32cc>
 126aa8c: aa0003f4     	mov	x20, x0
 126aa90: f94002e1     	ldr	x1, [x23]
 126aa94: 910083e0     	add	x0, sp, #0x20
 126aa98: 94121f07     	bl	0x16f26b4 <__start_il2cpp+0x54aef0>
 126aa9c: b5000075     	cbnz	x21, 0x126aaa8 <__start_il2cpp+0xc32e4>
 126aaa0: aa1403e0     	mov	x0, x20
 126aaa4: 97fce316     	bl	0x11a36fc <__emutls_get_address+0x4b8>
 126aaa8: aa1503e0     	mov	x0, x21
 126aaac: 97f95593     	bl	0x10c00f8 <CloseNLSocket+0x630>
 126aab0: 97f38191     	bl	0xf4b0f4 <.text+0x178>
