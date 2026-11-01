
/tmp/temple-libil2cpp.so:	file format elf64-littleaarch64

Disassembly of section il2cpp:

00000000011a77c4 <__start_il2cpp>:
 126ffb0: d10203ff     	sub	sp, sp, #0x80
 126ffb4: 6d0233ed     	stp	d13, d12, [sp, #0x20]
 126ffb8: 6d032beb     	stp	d11, d10, [sp, #0x30]
 126ffbc: 6d0423e9     	stp	d9, d8, [sp, #0x40]
 126ffc0: a9055ffe     	stp	x30, x23, [sp, #0x50]
 126ffc4: a90657f6     	stp	x22, x21, [sp, #0x60]
 126ffc8: a9074ff4     	stp	x20, x19, [sp, #0x70]
 126ffcc: d000be34     	adrp	x20, 0x2a35000
 126ffd0: b000af76     	adrp	x22, 0x285c000 <_ZTVN10__cxxabiv119__pointer_type_infoE+0x18>
 126ffd4: 395d2288     	ldrb	w8, [x20, #0x748]
 126ffd8: f94562d6     	ldr	x22, [x22, #0xac0]
 126ffdc: aa0003f3     	mov	x19, x0
 126ffe0: 37000608     	tbnz	w8, #0x0, 0x12700a0 <__start_il2cpp+0xc88dc>
 126ffe4: b000af60     	adrp	x0, 0x285c000 <_ZTVN10__cxxabiv119__pointer_type_infoE+0x18>
 126ffe8: f9471800     	ldr	x0, [x0, #0xe30]
 126ffec: 97f93fbb     	bl	0x10bfed8 <CloseNLSocket+0x410>
 126fff0: f000af60     	adrp	x0, 0x285e000
 126fff4: f9414000     	ldr	x0, [x0, #0x280]
 126fff8: 97f93fb8     	bl	0x10bfed8 <CloseNLSocket+0x410>
 126fffc: b000af60     	adrp	x0, 0x285c000 <_ZTVN10__cxxabiv119__pointer_type_infoE+0x18>
 1270000: f9456000     	ldr	x0, [x0, #0xac0]
 1270004: 97f93fb5     	bl	0x10bfed8 <CloseNLSocket+0x410>
 1270008: d000af80     	adrp	x0, 0x2862000
 127000c: f9435000     	ldr	x0, [x0, #0x6a0]
 1270010: 97f93fb2     	bl	0x10bfed8 <CloseNLSocket+0x410>
 1270014: b000af60     	adrp	x0, 0x285d000
 1270018: f9411800     	ldr	x0, [x0, #0x230]
 127001c: 97f93faf     	bl	0x10bfed8 <CloseNLSocket+0x410>
 1270020: d000af80     	adrp	x0, 0x2862000
 1270024: f9435800     	ldr	x0, [x0, #0x6b0]
 1270028: 97f93fac     	bl	0x10bfed8 <CloseNLSocket+0x410>
 127002c: d000af80     	adrp	x0, 0x2862000
 1270030: f9435c00     	ldr	x0, [x0, #0x6b8]
 1270034: 97f93fa9     	bl	0x10bfed8 <CloseNLSocket+0x410>
 1270038: d000af80     	adrp	x0, 0x2862000
 127003c: f9436000     	ldr	x0, [x0, #0x6c0]
 1270040: 97f93fa6     	bl	0x10bfed8 <CloseNLSocket+0x410>
 1270044: d000af80     	adrp	x0, 0x2862000
 1270048: f9436400     	ldr	x0, [x0, #0x6c8]
 127004c: 97f93fa3     	bl	0x10bfed8 <CloseNLSocket+0x410>
 1270050: d000af80     	adrp	x0, 0x2862000
 1270054: f9436800     	ldr	x0, [x0, #0x6d0]
 1270058: 97f93fa0     	bl	0x10bfed8 <CloseNLSocket+0x410>
 127005c: d000af80     	adrp	x0, 0x2862000
 1270060: f9436c00     	ldr	x0, [x0, #0x6d8]
 1270064: 97f93f9d     	bl	0x10bfed8 <CloseNLSocket+0x410>
 1270068: d000af80     	adrp	x0, 0x2862000
 127006c: f9437000     	ldr	x0, [x0, #0x6e0]
 1270070: 97f93f9a     	bl	0x10bfed8 <CloseNLSocket+0x410>
 1270074: d000af80     	adrp	x0, 0x2862000
 1270078: f9437400     	ldr	x0, [x0, #0x6e8]
 127007c: 97f93f97     	bl	0x10bfed8 <CloseNLSocket+0x410>
 1270080: d000af80     	adrp	x0, 0x2862000
 1270084: f9437800     	ldr	x0, [x0, #0x6f0]
 1270088: 97f93f94     	bl	0x10bfed8 <CloseNLSocket+0x410>
 127008c: d000af80     	adrp	x0, 0x2862000
 1270090: f9437c00     	ldr	x0, [x0, #0x6f8]
 1270094: 97f93f91     	bl	0x10bfed8 <CloseNLSocket+0x410>
 1270098: 52800028     	mov	w8, #0x1                // =1
 127009c: 391d2288     	strb	w8, [x20, #0x748]
 12700a0: f94002c0     	ldr	x0, [x22]
 12700a4: 390063ff     	strb	wzr, [sp, #0x18]
 12700a8: b90017ff     	str	wzr, [sp, #0x14]
 12700ac: f90007ff     	str	xzr, [sp, #0x8]
 12700b0: b940e008     	ldr	w8, [x0, #0xe0]
 12700b4: f9401674     	ldr	x20, [x19, #0x28]
 12700b8: 35000048     	cbnz	w8, 0x12700c0 <__start_il2cpp+0xc88fc>
 12700bc: 97f93fc9     	bl	0x10bffe0 <CloseNLSocket+0x518>
 12700c0: aa1403e0     	mov	x0, x20
 12700c4: aa1f03e1     	mov	x1, xzr
 12700c8: aa1f03e2     	mov	x2, xzr
 12700cc: 944921df     	bl	0x24b8848 <__start_il2cpp+0x1311084>
 12700d0: f9403a68     	ldr	x8, [x19, #0x70]
 12700d4: b4003e08     	cbz	x8, 0x1270894 <__start_il2cpp+0xc90d0>
 12700d8: 39436109     	ldrb	w9, [x8, #0xd8]
 12700dc: 0a290009     	bic	w9, w0, w9
 12700e0: 36003c69     	tbz	w9, #0x0, 0x127086c <__start_il2cpp+0xc90a8>
 12700e4: 52a82409     	mov	w9, #0x41200000         // =1092616192
 12700e8: b9001fe9     	str	w9, [sp, #0x1c]
 12700ec: bd413500     	ldr	s0, [x8, #0x134]
 12700f0: 1e23d001     	fmov	s1, #7.50000000
 12700f4: 1e249008     	fmov	s8, #10.00000000
 12700f8: 1e212000     	fcmp	s0, s1
 12700fc: 5400008d     	b.le	0x127010c <__start_il2cpp+0xc8948>
 1270100: 52a81a09     	mov	w9, #0x40d00000         // =1087373312
 1270104: 1e235008     	fmov	s8, #6.50000000
 1270108: b9001fe9     	str	w9, [sp, #0x1c]
 127010c: f9401674     	ldr	x20, [x19, #0x28]
 1270110: aa0803e0     	mov	x0, x8
 1270114: aa1f03e1     	mov	x1, xzr
 1270118: 944917fd     	bl	0x24b610c <__start_il2cpp+0x130e948>
 127011c: b4003bc0     	cbz	x0, 0x1270894 <__start_il2cpp+0xc90d0>
 1270120: aa1f03e1     	mov	x1, xzr
 1270124: 94494954     	bl	0x24c2674 <__start_il2cpp+0x131aeb0>
 1270128: b4003b74     	cbz	x20, 0x1270894 <__start_il2cpp+0xc90d0>
 127012c: b9403261     	ldr	w1, [x19, #0x30]
 1270130: 52800022     	mov	w2, #0x1                // =1
 1270134: 52800063     	mov	w3, #0x3                // =3
 1270138: aa1403e0     	mov	x0, x20
 127013c: 4ea81d03     	mov	v3.16b, v8.16b
 1270140: aa1f03e4     	mov	x4, xzr
 1270144: 9401df31     	bl	0x12e7e08 <__start_il2cpp+0x140644>
 1270148: f94002c8     	ldr	x8, [x22]
 127014c: aa0003f4     	mov	x20, x0
 1270150: b940e109     	ldr	w9, [x8, #0xe0]
 1270154: 35000069     	cbnz	w9, 0x1270160 <__start_il2cpp+0xc899c>
 1270158: aa0803e0     	mov	x0, x8
 127015c: 97f93fa1     	bl	0x10bffe0 <CloseNLSocket+0x518>
 1270160: aa1403e0     	mov	x0, x20
 1270164: aa1f03e1     	mov	x1, xzr
 1270168: aa1f03e2     	mov	x2, xzr
 127016c: 944921b7     	bl	0x24b8848 <__start_il2cpp+0x1311084>
 1270170: 360037e0     	tbz	w0, #0x0, 0x127086c <__start_il2cpp+0xc90a8>
 1270174: f94002c0     	ldr	x0, [x22]
 1270178: f9401675     	ldr	x21, [x19, #0x28]
 127017c: b940e008     	ldr	w8, [x0, #0xe0]
 1270180: 35000048     	cbnz	w8, 0x1270188 <__start_il2cpp+0xc89c4>
 1270184: 97f93f97     	bl	0x10bffe0 <CloseNLSocket+0x518>
 1270188: aa1403e0     	mov	x0, x20
 127018c: aa1503e1     	mov	x1, x21
 1270190: aa1f03e2     	mov	x2, xzr
 1270194: 944921ad     	bl	0x24b8848 <__start_il2cpp+0x1311084>
 1270198: 36001020     	tbz	w0, #0x0, 0x127039c <__start_il2cpp+0xc8bd8>
 127019c: f9403a60     	ldr	x0, [x19, #0x70]
 12701a0: b40037a0     	cbz	x0, 0x1270894 <__start_il2cpp+0xc90d0>
 12701a4: aa1f03e1     	mov	x1, xzr
 12701a8: 944917d9     	bl	0x24b610c <__start_il2cpp+0x130e948>
 12701ac: b4003740     	cbz	x0, 0x1270894 <__start_il2cpp+0xc90d0>
 12701b0: aa1f03e1     	mov	x1, xzr
 12701b4: 94494930     	bl	0x24c2674 <__start_il2cpp+0x131aeb0>
 12701b8: f9403a60     	ldr	x0, [x19, #0x70]
 12701bc: b40036c0     	cbz	x0, 0x1270894 <__start_il2cpp+0xc90d0>
 12701c0: aa1f03e1     	mov	x1, xzr
 12701c4: 4ea01c08     	mov	v8.16b, v0.16b
 12701c8: 944917d1     	bl	0x24b610c <__start_il2cpp+0x130e948>
 12701cc: b4003640     	cbz	x0, 0x1270894 <__start_il2cpp+0xc90d0>
 12701d0: aa1f03e1     	mov	x1, xzr
 12701d4: 94494928     	bl	0x24c2674 <__start_il2cpp+0x131aeb0>
 12701d8: b40035f4     	cbz	x20, 0x1270894 <__start_il2cpp+0xc90d0>
 12701dc: aa1403e0     	mov	x0, x20
 12701e0: aa1f03e1     	mov	x1, xzr
 12701e4: 4ea21c4a     	mov	v10.16b, v2.16b
 12701e8: 944917c9     	bl	0x24b610c <__start_il2cpp+0x130e948>
 12701ec: b4003540     	cbz	x0, 0x1270894 <__start_il2cpp+0xc90d0>
 12701f0: aa1f03e1     	mov	x1, xzr
 12701f4: 94494920     	bl	0x24c2674 <__start_il2cpp+0x131aeb0>
 12701f8: aa1403e0     	mov	x0, x20
 12701fc: aa1f03e1     	mov	x1, xzr
 1270200: 4ea01c09     	mov	v9.16b, v0.16b
 1270204: 944917c2     	bl	0x24b610c <__start_il2cpp+0x130e948>
 1270208: b4003460     	cbz	x0, 0x1270894 <__start_il2cpp+0xc90d0>
 127020c: aa1f03e1     	mov	x1, xzr
 1270210: 94494919     	bl	0x24c2674 <__start_il2cpp+0x131aeb0>
 1270214: b000be35     	adrp	x21, 0x2a35000
 1270218: 395df6a8     	ldrb	w8, [x21, #0x77d]
 127021c: 4ea21c4b     	mov	v11.16b, v2.16b
 1270220: 350000c8     	cbnz	w8, 0x1270238 <__start_il2cpp+0xc8a74>
 1270224: d000af60     	adrp	x0, 0x285e000
 1270228: f9417800     	ldr	x0, [x0, #0x2f0]
 127022c: 97f93f2b     	bl	0x10bfed8 <CloseNLSocket+0x410>
 1270230: 52800028     	mov	w8, #0x1                // =1
 1270234: 391df6a8     	strb	w8, [x21, #0x77d]
 1270238: d000af68     	adrp	x8, 0x285e000
 127023c: f9417908     	ldr	x8, [x8, #0x2f0]
 1270240: 1e29390d     	fsub	s13, s8, s9
 1270244: 1e2b394c     	fsub	s12, s10, s11
 1270248: f9400100     	ldr	x0, [x8]
 127024c: b940e008     	ldr	w8, [x0, #0xe0]
 1270250: 35000048     	cbnz	w8, 0x1270258 <__start_il2cpp+0xc8a94>
 1270254: 97f93f63     	bl	0x10bffe0 <CloseNLSocket+0x518>
 1270258: b000af68     	adrp	x8, 0x285d000
 127025c: f9411908     	ldr	x8, [x8, #0x230]
 1270260: 1e2d09a0     	fmul	s0, s13, s13
 1270264: 1e2c0981     	fmul	s1, s12, s12
 1270268: 1e212800     	fadd	s0, s0, s1
 127026c: f9400100     	ldr	x0, [x8]
 1270270: 1e21c000     	fsqrt	s0, s0
 1270274: 52800101     	mov	w1, #0x8                // =8
 1270278: bd0017e0     	str	s0, [sp, #0x14]
 127027c: 97f93f35     	bl	0x10bff50 <CloseNLSocket+0x488>
 1270280: b40030a0     	cbz	x0, 0x1270894 <__start_il2cpp+0xc90d0>
 1270284: b9401808     	ldr	w8, [x0, #0x18]
 1270288: aa0003f5     	mov	x21, x0
 127028c: 34003068     	cbz	w8, 0x1270898 <__start_il2cpp+0xc90d4>
 1270290: d000af88     	adrp	x8, 0x2862000
 1270294: f9437108     	ldr	x8, [x8, #0x6e0]
 1270298: 910023e0     	add	x0, sp, #0x8
 127029c: aa1f03e1     	mov	x1, xzr
 12702a0: aa1f03e2     	mov	x2, xzr
 12702a4: f9400108     	ldr	x8, [x8]
 12702a8: aa1f03e3     	mov	x3, xzr
 12702ac: f90012a8     	str	x8, [x21, #0x20]
 12702b0: 2d012be8     	stp	s8, s10, [sp, #0x8]
 12702b4: 94002103     	bl	0x12786c0 <__start_il2cpp+0xd0efc>
 12702b8: b9401aa8     	ldr	w8, [x21, #0x18]
 12702bc: 7100051f     	cmp	w8, #0x1
 12702c0: 54002ec9     	b.ls	0x1270898 <__start_il2cpp+0xc90d4>
 12702c4: 7100091f     	cmp	w8, #0x2
 12702c8: f90016a0     	str	x0, [x21, #0x28]
 12702cc: 54002e60     	b.eq	0x1270898 <__start_il2cpp+0xc90d4>
 12702d0: d000af88     	adrp	x8, 0x2862000
 12702d4: f9435d08     	ldr	x8, [x8, #0x6b8]
 12702d8: 910023e0     	add	x0, sp, #0x8
 12702dc: aa1f03e1     	mov	x1, xzr
 12702e0: aa1f03e2     	mov	x2, xzr
 12702e4: f9400108     	ldr	x8, [x8]
 12702e8: aa1f03e3     	mov	x3, xzr
 12702ec: f9001aa8     	str	x8, [x21, #0x30]
 12702f0: 2d012fe9     	stp	s9, s11, [sp, #0x8]
 12702f4: 940020f3     	bl	0x12786c0 <__start_il2cpp+0xd0efc>
 12702f8: b9401aa8     	ldr	w8, [x21, #0x18]
 12702fc: 71000d1f     	cmp	w8, #0x3
 1270300: 54002cc9     	b.ls	0x1270898 <__start_il2cpp+0xc90d4>
 1270304: 7100111f     	cmp	w8, #0x4
 1270308: f9001ea0     	str	x0, [x21, #0x38]
 127030c: 54002c60     	b.eq	0x1270898 <__start_il2cpp+0xc90d4>
 1270310: d000af88     	adrp	x8, 0x2862000
 1270314: f9435908     	ldr	x8, [x8, #0x6b0]
 1270318: 910053e0     	add	x0, sp, #0x14
 127031c: aa1f03e1     	mov	x1, xzr
 1270320: f9400108     	ldr	x8, [x8]
 1270324: f90022a8     	str	x8, [x21, #0x40]
 1270328: 94311947     	bl	0x1eb6844 <__start_il2cpp+0xd0f080>
 127032c: b9401aa8     	ldr	w8, [x21, #0x18]
 1270330: 7100151f     	cmp	w8, #0x5
 1270334: 54002b29     	b.ls	0x1270898 <__start_il2cpp+0xc90d4>
 1270338: 7100191f     	cmp	w8, #0x6
 127033c: f90026a0     	str	x0, [x21, #0x48]
 1270340: 54002ac0     	b.eq	0x1270898 <__start_il2cpp+0xc90d4>
 1270344: d000af88     	adrp	x8, 0x2862000
 1270348: f9437d08     	ldr	x8, [x8, #0x6f8]
 127034c: 910073e0     	add	x0, sp, #0x1c
 1270350: aa1f03e1     	mov	x1, xzr
 1270354: f9400108     	ldr	x8, [x8]
 1270358: f9002aa8     	str	x8, [x21, #0x50]
 127035c: 9431193a     	bl	0x1eb6844 <__start_il2cpp+0xd0f080>
 1270360: b9401aa8     	ldr	w8, [x21, #0x18]
 1270364: 71001d1f     	cmp	w8, #0x7
 1270368: 54002989     	b.ls	0x1270898 <__start_il2cpp+0xc90d4>
 127036c: f9002ea0     	str	x0, [x21, #0x58]
 1270370: aa1503e0     	mov	x0, x21
 1270374: aa1f03e1     	mov	x1, xzr
 1270378: 942b4f30     	bl	0x1d44038 <__start_il2cpp+0xb9c874>
 127037c: aa1f03e1     	mov	x1, xzr
 1270380: 94021c93     	bl	0x12f75cc <__start_il2cpp+0x14fe08>
 1270384: d000af88     	adrp	x8, 0x2862000
 1270388: f9436908     	ldr	x8, [x8, #0x6d0]
 127038c: aa1403e1     	mov	x1, x20
 1270390: aa1f03e2     	mov	x2, xzr
 1270394: f9400100     	ldr	x0, [x8]
 1270398: 94021a6b     	bl	0x12f6d44 <__start_il2cpp+0x14f580>
 127039c: b9403268     	ldr	w8, [x19, #0x30]
 12703a0: 350000e8     	cbnz	w8, 0x12703bc <__start_il2cpp+0xc8bf8>
 12703a4: d000af88     	adrp	x8, 0x2862000
 12703a8: f9437508     	ldr	x8, [x8, #0x6e8]
 12703ac: aa1303e1     	mov	x1, x19
 12703b0: aa1f03e2     	mov	x2, xzr
 12703b4: f9400100     	ldr	x0, [x8]
 12703b8: 94021a63     	bl	0x12f6d44 <__start_il2cpp+0x14f580>
 12703bc: 390063ff     	strb	wzr, [sp, #0x18]
 12703c0: f9403a68     	ldr	x8, [x19, #0x70]
 12703c4: b4002688     	cbz	x8, 0x1270894 <__start_il2cpp+0xc90d0>
 12703c8: 3945d108     	ldrb	w8, [x8, #0x174]
 12703cc: 35000068     	cbnz	w8, 0x12703d8 <__start_il2cpp+0xc8c14>
 12703d0: 394a4668     	ldrb	w8, [x19, #0x291]
 12703d4: 34000508     	cbz	w8, 0x1270474 <__start_il2cpp+0xc8cb0>
 12703d8: f94002c0     	ldr	x0, [x22]
 12703dc: f9401e75     	ldr	x21, [x19, #0x38]
 12703e0: b940e008     	ldr	w8, [x0, #0xe0]
 12703e4: 35000048     	cbnz	w8, 0x12703ec <__start_il2cpp+0xc8c28>
 12703e8: 97f93efe     	bl	0x10bffe0 <CloseNLSocket+0x518>
 12703ec: aa1403e0     	mov	x0, x20
 12703f0: aa1503e1     	mov	x1, x21
 12703f4: aa1f03e2     	mov	x2, xzr
 12703f8: 94492114     	bl	0x24b8848 <__start_il2cpp+0x1311084>
 12703fc: 360003c0     	tbz	w0, #0x0, 0x1270474 <__start_il2cpp+0xc8cb0>
 1270400: 52800028     	mov	w8, #0x1                // =1
 1270404: 390063e8     	strb	w8, [sp, #0x18]
 1270408: b4002474     	cbz	x20, 0x1270894 <__start_il2cpp+0xc90d0>
 127040c: b9403261     	ldr	w1, [x19, #0x30]
 1270410: aa1403e0     	mov	x0, x20
 1270414: aa1f03e2     	mov	x2, xzr
 1270418: 9401ca9c     	bl	0x12e2e88 <__start_il2cpp+0x13b6c4>
 127041c: 360010e0     	tbz	w0, #0x0, 0x1270638 <__start_il2cpp+0xc8e74>
 1270420: b9403261     	ldr	w1, [x19, #0x30]
 1270424: aa1403e0     	mov	x0, x20
 1270428: aa1f03e2     	mov	x2, xzr
 127042c: 9401cac6     	bl	0x12e2f44 <__start_il2cpp+0x13b780>
 1270430: 36001040     	tbz	w0, #0x0, 0x1270638 <__start_il2cpp+0xc8e74>
 1270434: f9403e68     	ldr	x8, [x19, #0x78]
 1270438: b40022e8     	cbz	x8, 0x1270894 <__start_il2cpp+0xc90d0>
 127043c: 39408509     	ldrb	w9, [x8, #0x21]
 1270440: 35001209     	cbnz	w9, 0x1270680 <__start_il2cpp+0xc8ebc>
 1270444: 39408908     	ldrb	w8, [x8, #0x22]
 1270448: 350011c8     	cbnz	w8, 0x1270680 <__start_il2cpp+0xc8ebc>
 127044c: 52800041     	mov	w1, #0x2                // =2
 1270450: 2a1f03e0     	mov	w0, wzr
 1270454: aa1f03e2     	mov	x2, xzr
 1270458: 94490ea4     	bl	0x24b3ee8 <__start_il2cpp+0x130c724>
 127045c: f9403e68     	ldr	x8, [x19, #0x78]
 1270460: b40021a8     	cbz	x8, 0x1270894 <__start_il2cpp+0xc90d0>
 1270464: 52800029     	mov	w9, #0x1                // =1
 1270468: 34002120     	cbz	w0, 0x127088c <__start_il2cpp+0xc90c8>
 127046c: 39008909     	strb	w9, [x8, #0x22]
 1270470: 14000084     	b	0x1270680 <__start_il2cpp+0xc8ebc>
 1270474: d000af97     	adrp	x23, 0x2862000
 1270478: f94352f7     	ldr	x23, [x23, #0x6a0]
 127047c: f94002c0     	ldr	x0, [x22]
 1270480: f94002e8     	ldr	x8, [x23]
 1270484: b940e009     	ldr	w9, [x0, #0xe0]
 1270488: f9405d08     	ldr	x8, [x8, #0xb8]
 127048c: f9400115     	ldr	x21, [x8]
 1270490: 35000049     	cbnz	w9, 0x1270498 <__start_il2cpp+0xc8cd4>
 1270494: 97f93ed3     	bl	0x10bffe0 <CloseNLSocket+0x518>
 1270498: aa1503e0     	mov	x0, x21
 127049c: aa1f03e1     	mov	x1, xzr
 12704a0: aa1f03e2     	mov	x2, xzr
 12704a4: 944920e9     	bl	0x24b8848 <__start_il2cpp+0x1311084>
 12704a8: 360004e0     	tbz	w0, #0x0, 0x1270544 <__start_il2cpp+0xc8d80>
 12704ac: f94002e8     	ldr	x8, [x23]
 12704b0: f9405d08     	ldr	x8, [x8, #0xb8]
 12704b4: f9400108     	ldr	x8, [x8]
 12704b8: b4001ee8     	cbz	x8, 0x1270894 <__start_il2cpp+0xc90d0>
 12704bc: b9406908     	ldr	w8, [x8, #0x68]
 12704c0: 34000428     	cbz	w8, 0x1270544 <__start_il2cpp+0xc8d80>
 12704c4: f94002c0     	ldr	x0, [x22]
 12704c8: f9401e75     	ldr	x21, [x19, #0x38]
 12704cc: b940e008     	ldr	w8, [x0, #0xe0]
 12704d0: 35000048     	cbnz	w8, 0x12704d8 <__start_il2cpp+0xc8d14>
 12704d4: 97f93ec3     	bl	0x10bffe0 <CloseNLSocket+0x518>
 12704d8: aa1403e0     	mov	x0, x20
 12704dc: aa1503e1     	mov	x1, x21
 12704e0: aa1f03e2     	mov	x2, xzr
 12704e4: 944920d9     	bl	0x24b8848 <__start_il2cpp+0x1311084>
 12704e8: 360002e0     	tbz	w0, #0x0, 0x1270544 <__start_il2cpp+0xc8d80>
 12704ec: f94002e8     	ldr	x8, [x23]
 12704f0: f9405d08     	ldr	x8, [x8, #0xb8]
 12704f4: f9400108     	ldr	x8, [x8]
 12704f8: b4001ce8     	cbz	x8, 0x1270894 <__start_il2cpp+0xc90d0>
 12704fc: b9406909     	ldr	w9, [x8, #0x68]
 1270500: 3100053f     	cmn	w9, #0x1
 1270504: 54000161     	b.ne	0x1270530 <__start_il2cpp+0xc8d6c>
 1270508: b4001c74     	cbz	x20, 0x1270894 <__start_il2cpp+0xc90d0>
 127050c: b9403261     	ldr	w1, [x19, #0x30]
 1270510: aa1403e0     	mov	x0, x20
 1270514: aa1f03e2     	mov	x2, xzr
 1270518: 9401ca5c     	bl	0x12e2e88 <__start_il2cpp+0x13b6c4>
 127051c: 37000980     	tbnz	w0, #0x0, 0x127064c <__start_il2cpp+0xc8e88>
 1270520: f94002e8     	ldr	x8, [x23]
 1270524: f9405d08     	ldr	x8, [x8, #0xb8]
 1270528: f9400108     	ldr	x8, [x8]
 127052c: b4001b48     	cbz	x8, 0x1270894 <__start_il2cpp+0xc90d0>
 1270530: b9406908     	ldr	w8, [x8, #0x68]
 1270534: 7100051f     	cmp	w8, #0x1
 1270538: 54000a41     	b.ne	0x1270680 <__start_il2cpp+0xc8ebc>
 127053c: b5000914     	cbnz	x20, 0x127065c <__start_il2cpp+0xc8e98>
 1270540: 140000d5     	b	0x1270894 <__start_il2cpp+0xc90d0>
 1270544: d000af68     	adrp	x8, 0x285e000
 1270548: f9414108     	ldr	x8, [x8, #0x280]
 127054c: f9400100     	ldr	x0, [x8]
 1270550: b940e008     	ldr	w8, [x0, #0xe0]
 1270554: 35000048     	cbnz	w8, 0x127055c <__start_il2cpp+0xc8d98>
 1270558: 97f93ea2     	bl	0x10bffe0 <CloseNLSocket+0x518>
 127055c: 9400086b     	bl	0x1272708 <__start_il2cpp+0xcaf44>
 1270560: 36000900     	tbz	w0, #0x0, 0x1270680 <__start_il2cpp+0xc8ebc>
 1270564: f94002c0     	ldr	x0, [x22]
 1270568: f9401e75     	ldr	x21, [x19, #0x38]
 127056c: b940e008     	ldr	w8, [x0, #0xe0]
 1270570: 35000048     	cbnz	w8, 0x1270578 <__start_il2cpp+0xc8db4>
 1270574: 97f93e9b     	bl	0x10bffe0 <CloseNLSocket+0x518>
 1270578: aa1403e0     	mov	x0, x20
 127057c: aa1503e1     	mov	x1, x21
 1270580: aa1f03e2     	mov	x2, xzr
 1270584: 944920b1     	bl	0x24b8848 <__start_il2cpp+0x1311084>
 1270588: 360007c0     	tbz	w0, #0x0, 0x1270680 <__start_il2cpp+0xc8ebc>
 127058c: f9403a68     	ldr	x8, [x19, #0x70]
 1270590: b4001828     	cbz	x8, 0x1270894 <__start_il2cpp+0xc90d0>
 1270594: bd419100     	ldr	s0, [x8, #0x190]
 1270598: 1e229001     	fmov	s1, #5.00000000
 127059c: 1e212000     	fcmp	s0, s1
 12705a0: 5400020d     	b.le	0x12705e0 <__start_il2cpp+0xc8e1c>
 12705a4: b4001794     	cbz	x20, 0x1270894 <__start_il2cpp+0xc90d0>
 12705a8: b9403261     	ldr	w1, [x19, #0x30]
 12705ac: aa1403e0     	mov	x0, x20
 12705b0: aa1f03e2     	mov	x2, xzr
 12705b4: 9401ca35     	bl	0x12e2e88 <__start_il2cpp+0x13b6c4>
 12705b8: 36000140     	tbz	w0, #0x0, 0x12705e0 <__start_il2cpp+0xc8e1c>
 12705bc: f9403e68     	ldr	x8, [x19, #0x78]
 12705c0: b40016a8     	cbz	x8, 0x1270894 <__start_il2cpp+0xc90d0>
 12705c4: 39408909     	ldrb	w9, [x8, #0x22]
 12705c8: 34000469     	cbz	w9, 0x1270654 <__start_il2cpp+0xc8e90>
 12705cc: b9403261     	ldr	w1, [x19, #0x30]
 12705d0: aa1403e0     	mov	x0, x20
 12705d4: aa1f03e2     	mov	x2, xzr
 12705d8: 9401ca5b     	bl	0x12e2f44 <__start_il2cpp+0x13b780>
 12705dc: 36000380     	tbz	w0, #0x0, 0x127064c <__start_il2cpp+0xc8e88>
 12705e0: f9403a68     	ldr	x8, [x19, #0x70]
 12705e4: b4001588     	cbz	x8, 0x1270894 <__start_il2cpp+0xc90d0>
 12705e8: bd419100     	ldr	s0, [x8, #0x190]
 12705ec: 1e329001     	fmov	s1, #-5.00000000
 12705f0: 1e212000     	fcmp	s0, s1
 12705f4: 54000465     	b.pl	0x1270680 <__start_il2cpp+0xc8ebc>
 12705f8: b40014f4     	cbz	x20, 0x1270894 <__start_il2cpp+0xc90d0>
 12705fc: b9403261     	ldr	w1, [x19, #0x30]
 1270600: aa1403e0     	mov	x0, x20
 1270604: aa1f03e2     	mov	x2, xzr
 1270608: 9401ca4f     	bl	0x12e2f44 <__start_il2cpp+0x13b780>
 127060c: 360003a0     	tbz	w0, #0x0, 0x1270680 <__start_il2cpp+0xc8ebc>
 1270610: f9403e68     	ldr	x8, [x19, #0x78]
 1270614: b4001408     	cbz	x8, 0x1270894 <__start_il2cpp+0xc90d0>
 1270618: 39408509     	ldrb	w9, [x8, #0x21]
 127061c: 340002e9     	cbz	w9, 0x1270678 <__start_il2cpp+0xc8eb4>
 1270620: b9403261     	ldr	w1, [x19, #0x30]
 1270624: aa1403e0     	mov	x0, x20
 1270628: aa1f03e2     	mov	x2, xzr
 127062c: 9401ca17     	bl	0x12e2e88 <__start_il2cpp+0x13b6c4>
 1270630: 36000200     	tbz	w0, #0x0, 0x1270670 <__start_il2cpp+0xc8eac>
 1270634: 14000013     	b	0x1270680 <__start_il2cpp+0xc8ebc>
 1270638: b9403261     	ldr	w1, [x19, #0x30]
 127063c: aa1403e0     	mov	x0, x20
 1270640: aa1f03e2     	mov	x2, xzr
 1270644: 9401ca11     	bl	0x12e2e88 <__start_il2cpp+0x13b6c4>
 1270648: 360000a0     	tbz	w0, #0x0, 0x127065c <__start_il2cpp+0xc8e98>
 127064c: f9403e68     	ldr	x8, [x19, #0x78]
 1270650: b4001228     	cbz	x8, 0x1270894 <__start_il2cpp+0xc90d0>
 1270654: 52800029     	mov	w9, #0x1                // =1
 1270658: 14000009     	b	0x127067c <__start_il2cpp+0xc8eb8>
 127065c: b9403261     	ldr	w1, [x19, #0x30]
 1270660: aa1403e0     	mov	x0, x20
 1270664: aa1f03e2     	mov	x2, xzr
 1270668: 9401ca37     	bl	0x12e2f44 <__start_il2cpp+0x13b780>
 127066c: 360000a0     	tbz	w0, #0x0, 0x1270680 <__start_il2cpp+0xc8ebc>
 1270670: f9403e68     	ldr	x8, [x19, #0x78]
 1270674: b4001108     	cbz	x8, 0x1270894 <__start_il2cpp+0xc90d0>
 1270678: 52802009     	mov	w9, #0x100              // =256
 127067c: 78021109     	sturh	w9, [x8, #0x21]
 1270680: f9403e68     	ldr	x8, [x19, #0x78]
 1270684: b4001088     	cbz	x8, 0x1270894 <__start_il2cpp+0xc90d0>
 1270688: 39408509     	ldrb	w9, [x8, #0x21]
 127068c: 340001c9     	cbz	w9, 0x12706c4 <__start_il2cpp+0xc8f00>
 1270690: b4001034     	cbz	x20, 0x1270894 <__start_il2cpp+0xc90d0>
 1270694: b9403261     	ldr	w1, [x19, #0x30]
 1270698: aa1403e0     	mov	x0, x20
 127069c: aa1f03e2     	mov	x2, xzr
 12706a0: 9401c9fa     	bl	0x12e2e88 <__start_il2cpp+0x13b6c4>
 12706a4: 360000c0     	tbz	w0, #0x0, 0x12706bc <__start_il2cpp+0xc8ef8>
 12706a8: f9403a60     	ldr	x0, [x19, #0x70]
 12706ac: b4000f40     	cbz	x0, 0x1270894 <__start_il2cpp+0xc90d0>
 12706b0: aa1f03e1     	mov	x1, xzr
 12706b4: 9400a0ba     	bl	0x129899c <__start_il2cpp+0xf11d8>
 12706b8: 1400000f     	b	0x12706f4 <__start_il2cpp+0xc8f30>
 12706bc: f9403e68     	ldr	x8, [x19, #0x78]
 12706c0: b4000ea8     	cbz	x8, 0x1270894 <__start_il2cpp+0xc90d0>
 12706c4: 39408908     	ldrb	w8, [x8, #0x22]
 12706c8: 34000268     	cbz	w8, 0x1270714 <__start_il2cpp+0xc8f50>
 12706cc: b4000e54     	cbz	x20, 0x1270894 <__start_il2cpp+0xc90d0>
 12706d0: b9403261     	ldr	w1, [x19, #0x30]
 12706d4: aa1403e0     	mov	x0, x20
 12706d8: aa1f03e2     	mov	x2, xzr
 12706dc: 9401ca1a     	bl	0x12e2f44 <__start_il2cpp+0x13b780>
 12706e0: 360001a0     	tbz	w0, #0x0, 0x1270714 <__start_il2cpp+0xc8f50>
 12706e4: f9403a60     	ldr	x0, [x19, #0x70]
 12706e8: b4000d60     	cbz	x0, 0x1270894 <__start_il2cpp+0xc90d0>
 12706ec: aa1f03e1     	mov	x1, xzr
 12706f0: 9400a0c9     	bl	0x1298a14 <__start_il2cpp+0xf1250>
 12706f4: f9403e68     	ldr	x8, [x19, #0x78]
 12706f8: b4000ce8     	cbz	x8, 0x1270894 <__start_il2cpp+0xc90d0>
 12706fc: 52800029     	mov	w9, #0x1                // =1
 1270700: b900291f     	str	wzr, [x8, #0x28]
 1270704: 3900891f     	strb	wzr, [x8, #0x22]
 1270708: 79004109     	strh	w9, [x8, #0x20]
 127070c: f9001e74     	str	x20, [x19, #0x38]
 1270710: 14000057     	b	0x127086c <__start_il2cpp+0xc90a8>
 1270714: 394063e8     	ldrb	w8, [sp, #0x18]
 1270718: 34000aa8     	cbz	w8, 0x127086c <__start_il2cpp+0xc90a8>
 127071c: b000af68     	adrp	x8, 0x285d000
 1270720: f9411908     	ldr	x8, [x8, #0x230]
 1270724: 52800101     	mov	w1, #0x8                // =8
 1270728: f9400100     	ldr	x0, [x8]
 127072c: 97f93e09     	bl	0x10bff50 <CloseNLSocket+0x488>
 1270730: b4000b20     	cbz	x0, 0x1270894 <__start_il2cpp+0xc90d0>
 1270734: b9401808     	ldr	w8, [x0, #0x18]
 1270738: aa0003f5     	mov	x21, x0
 127073c: 34000ae8     	cbz	w8, 0x1270898 <__start_il2cpp+0xc90d4>
 1270740: d000af88     	adrp	x8, 0x2862000
 1270744: f9436508     	ldr	x8, [x8, #0x6c8]
 1270748: 9000af76     	adrp	x22, 0x285c000 <_ZTVN10__cxxabiv119__pointer_type_infoE+0x18>
 127074c: f9400108     	ldr	x8, [x8]
 1270750: f90012a8     	str	x8, [x21, #0x20]
 1270754: f9471ad6     	ldr	x22, [x22, #0xe30]
 1270758: f94002c0     	ldr	x0, [x22]
 127075c: b940e008     	ldr	w8, [x0, #0xe0]
 1270760: 35000048     	cbnz	w8, 0x1270768 <__start_il2cpp+0xc8fa4>
 1270764: 97f93e1f     	bl	0x10bffe0 <CloseNLSocket+0x518>
 1270768: 910063e0     	add	x0, sp, #0x18
 127076c: aa1f03e1     	mov	x1, xzr
 1270770: 942eec10     	bl	0x1e2b7b0 <__start_il2cpp+0xc83fec>
 1270774: f9400ea8     	ldr	x8, [x21, #0x18]
 1270778: 7100051f     	cmp	w8, #0x1
 127077c: 540008e9     	b.ls	0x1270898 <__start_il2cpp+0xc90d4>
 1270780: 7100091f     	cmp	w8, #0x2
 1270784: f90016a0     	str	x0, [x21, #0x28]
 1270788: 54000880     	b.eq	0x1270898 <__start_il2cpp+0xc90d4>
 127078c: d000af89     	adrp	x9, 0x2862000
 1270790: f9436129     	ldr	x9, [x9, #0x6c0]
 1270794: f9400129     	ldr	x9, [x9]
 1270798: f9001aa9     	str	x9, [x21, #0x30]
 127079c: b40000f4     	cbz	x20, 0x12707b8 <__start_il2cpp+0xc8ff4>
 12707a0: f9400288     	ldr	x8, [x20]
 12707a4: aa1403e0     	mov	x0, x20
 12707a8: a9568509     	ldp	x9, x1, [x8, #0x168]
 12707ac: d63f0120     	blr	x9
 12707b0: f9400ea8     	ldr	x8, [x21, #0x18]
 12707b4: 14000002     	b	0x12707bc <__start_il2cpp+0xc8ff8>
 12707b8: aa1f03e0     	mov	x0, xzr
 12707bc: 71000d1f     	cmp	w8, #0x3
 12707c0: 540006c9     	b.ls	0x1270898 <__start_il2cpp+0xc90d4>
 12707c4: 7100111f     	cmp	w8, #0x4
 12707c8: f9001ea0     	str	x0, [x21, #0x38]
 12707cc: 54000660     	b.eq	0x1270898 <__start_il2cpp+0xc90d4>
 12707d0: d000af88     	adrp	x8, 0x2862000
 12707d4: f9436d08     	ldr	x8, [x8, #0x6d8]
 12707d8: f9400108     	ldr	x8, [x8]
 12707dc: f90022a8     	str	x8, [x21, #0x40]
 12707e0: f9403e68     	ldr	x8, [x19, #0x78]
 12707e4: b4000588     	cbz	x8, 0x1270894 <__start_il2cpp+0xc90d0>
 12707e8: f94002c0     	ldr	x0, [x22]
 12707ec: 91008516     	add	x22, x8, #0x21
 12707f0: b940e009     	ldr	w9, [x0, #0xe0]
 12707f4: 35000049     	cbnz	w9, 0x12707fc <__start_il2cpp+0xc9038>
 12707f8: 97f93dfa     	bl	0x10bffe0 <CloseNLSocket+0x518>
 12707fc: aa1603e0     	mov	x0, x22
 1270800: aa1f03e1     	mov	x1, xzr
 1270804: 942eebeb     	bl	0x1e2b7b0 <__start_il2cpp+0xc83fec>
 1270808: b9401aa8     	ldr	w8, [x21, #0x18]
 127080c: 7100151f     	cmp	w8, #0x5
 1270810: 54000449     	b.ls	0x1270898 <__start_il2cpp+0xc90d4>
 1270814: 7100191f     	cmp	w8, #0x6
 1270818: f90026a0     	str	x0, [x21, #0x48]
 127081c: 540003e0     	b.eq	0x1270898 <__start_il2cpp+0xc90d4>
 1270820: d000af88     	adrp	x8, 0x2862000
 1270824: f9437908     	ldr	x8, [x8, #0x6f0]
 1270828: f9400108     	ldr	x8, [x8]
 127082c: f9002aa8     	str	x8, [x21, #0x50]
 1270830: f9403e68     	ldr	x8, [x19, #0x78]
 1270834: b4000308     	cbz	x8, 0x1270894 <__start_il2cpp+0xc90d0>
 1270838: 91008900     	add	x0, x8, #0x22
 127083c: aa1f03e1     	mov	x1, xzr
 1270840: 942eebdc     	bl	0x1e2b7b0 <__start_il2cpp+0xc83fec>
 1270844: b9401aa8     	ldr	w8, [x21, #0x18]
 1270848: 71001d1f     	cmp	w8, #0x7
 127084c: 54000269     	b.ls	0x1270898 <__start_il2cpp+0xc90d4>
 1270850: f9002ea0     	str	x0, [x21, #0x58]
 1270854: aa1503e0     	mov	x0, x21
 1270858: aa1f03e1     	mov	x1, xzr
 127085c: 942b4df7     	bl	0x1d44038 <__start_il2cpp+0xb9c874>
 1270860: aa1403e1     	mov	x1, x20
 1270864: aa1f03e2     	mov	x2, xzr
 1270868: 94021937     	bl	0x12f6d44 <__start_il2cpp+0x14f580>
 127086c: a9474ff4     	ldp	x20, x19, [sp, #0x70]
 1270870: a94657f6     	ldp	x22, x21, [sp, #0x60]
 1270874: a9455ffe     	ldp	x30, x23, [sp, #0x50]
 1270878: 6d4423e9     	ldp	d9, d8, [sp, #0x40]
 127087c: 6d432beb     	ldp	d11, d10, [sp, #0x30]
 1270880: 6d4233ed     	ldp	d13, d12, [sp, #0x20]
 1270884: 910203ff     	add	sp, sp, #0x80
 1270888: d65f03c0     	ret
 127088c: 39008509     	strb	w9, [x8, #0x21]
 1270890: 17ffff7c     	b	0x1270680 <__start_il2cpp+0xc8ebc>
 1270894: 97f93e1b     	bl	0x10c0100 <CloseNLSocket+0x638>
 1270898: 97f93e1c     	bl	0x10c0108 <CloseNLSocket+0x640>
