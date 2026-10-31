
/tmp/temple-libil2cpp.so:	file format elf64-littleaarch64

Disassembly of section il2cpp:

00000000011a77c4 <__start_il2cpp>:
 12713e4: 6db923e9     	stp	d9, d8, [sp, #-0x70]!
 12713e8: f9000bfe     	str	x30, [sp, #0x10]
 12713ec: a9026ffc     	stp	x28, x27, [sp, #0x20]
 12713f0: a90367fa     	stp	x26, x25, [sp, #0x30]
 12713f4: a9045ff8     	stp	x24, x23, [sp, #0x40]
 12713f8: a90557f6     	stp	x22, x21, [sp, #0x50]
 12713fc: a9064ff4     	stp	x20, x19, [sp, #0x60]
 1271400: 9000be34     	adrp	x20, 0x2a35000
 1271404: f000af57     	adrp	x23, 0x285c000 <_ZTVN10__cxxabiv119__pointer_type_infoE+0x18>
 1271408: 395d3688     	ldrb	w8, [x20, #0x74d]
 127140c: f94562f7     	ldr	x23, [x23, #0xac0]
 1271410: aa0003f3     	mov	x19, x0
 1271414: 37000188     	tbnz	w8, #0x0, 0x1271444 <__start_il2cpp+0xc9c80>
 1271418: b000af80     	adrp	x0, 0x2862000
 127141c: f9438400     	ldr	x0, [x0, #0x708]
 1271420: 97f93aae     	bl	0x10bfed8 <CloseNLSocket+0x410>
 1271424: b000af80     	adrp	x0, 0x2862000
 1271428: f9438800     	ldr	x0, [x0, #0x710]
 127142c: 97f93aab     	bl	0x10bfed8 <CloseNLSocket+0x410>
 1271430: f000af40     	adrp	x0, 0x285c000 <_ZTVN10__cxxabiv119__pointer_type_infoE+0x18>
 1271434: f9456000     	ldr	x0, [x0, #0xac0]
 1271438: 97f93aa8     	bl	0x10bfed8 <CloseNLSocket+0x410>
 127143c: 52800028     	mov	w8, #0x1                // =1
 1271440: 391d3688     	strb	w8, [x20, #0x74d]
 1271444: f94002e0     	ldr	x0, [x23]
 1271448: f9404674     	ldr	x20, [x19, #0x88]
 127144c: b940e008     	ldr	w8, [x0, #0xe0]
 1271450: 35000048     	cbnz	w8, 0x1271458 <__start_il2cpp+0xc9c94>
 1271454: 97f93ae3     	bl	0x10bffe0 <CloseNLSocket+0x518>
 1271458: aa1403e0     	mov	x0, x20
 127145c: aa1f03e1     	mov	x1, xzr
 1271460: aa1f03e2     	mov	x2, xzr
 1271464: 9449200d     	bl	0x24b9498 <__start_il2cpp+0x1311cd4>
 1271468: 370016e0     	tbnz	w0, #0x0, 0x1271744 <__start_il2cpp+0xc9f80>
 127146c: f9404660     	ldr	x0, [x19, #0x88]
 1271470: b40017a0     	cbz	x0, 0x1271764 <__start_il2cpp+0xc9fa0>
 1271474: b000af88     	adrp	x8, 0x2862000
 1271478: f9438908     	ldr	x8, [x8, #0x710]
 127147c: f9400101     	ldr	x1, [x8]
 1271480: 9404c823     	bl	0x13a350c <__start_il2cpp+0x1fbd48>
 1271484: b4001700     	cbz	x0, 0x1271764 <__start_il2cpp+0xc9fa0>
 1271488: b9401808     	ldr	w8, [x0, #0x18]
 127148c: aa0003f4     	mov	x20, x0
 1271490: 7100051f     	cmp	w8, #0x1
 1271494: 5400158b     	b.lt	0x1271744 <__start_il2cpp+0xc9f80>
 1271498: b000af99     	adrp	x25, 0x2862000
 127149c: f9438739     	ldr	x25, [x25, #0x708]
 12714a0: 2a1f03f8     	mov	w24, wzr
 12714a4: 5280003a     	mov	w26, #0x1               // =1
 12714a8: 528000bb     	mov	w27, #0x5               // =5
 12714ac: 528000fc     	mov	w28, #0x7               // =7
 12714b0: 6b08031f     	cmp	w24, w8
 12714b4: 540015a2     	b.hs	0x1271768 <__start_il2cpp+0xc9fa4>
 12714b8: 8b38ce88     	add	x8, x20, w24, sxtw #3
 12714bc: f9401115     	ldr	x21, [x8, #0x20]
 12714c0: b4001535     	cbz	x21, 0x1271764 <__start_il2cpp+0xc9fa0>
 12714c4: aa1503e0     	mov	x0, x21
 12714c8: aa1f03e1     	mov	x1, xzr
 12714cc: 9449131f     	bl	0x24b6148 <__start_il2cpp+0x130e984>
 12714d0: b40014a0     	cbz	x0, 0x1271764 <__start_il2cpp+0xc9fa0>
 12714d4: aa1f03e1     	mov	x1, xzr
 12714d8: 94491dd8     	bl	0x24b8c38 <__start_il2cpp+0x1311474>
 12714dc: 360012c0     	tbz	w0, #0x0, 0x1271734 <__start_il2cpp+0xc9f70>
 12714e0: aa1503e0     	mov	x0, x21
 12714e4: aa1f03e1     	mov	x1, xzr
 12714e8: 94491309     	bl	0x24b610c <__start_il2cpp+0x130e948>
 12714ec: b40013c0     	cbz	x0, 0x1271764 <__start_il2cpp+0xc9fa0>
 12714f0: f9400321     	ldr	x1, [x25]
 12714f4: 9404c56a     	bl	0x13a2a9c <__start_il2cpp+0x1fb2d8>
 12714f8: f94002e8     	ldr	x8, [x23]
 12714fc: aa0003f6     	mov	x22, x0
 1271500: b940e109     	ldr	w9, [x8, #0xe0]
 1271504: 35000069     	cbnz	w9, 0x1271510 <__start_il2cpp+0xc9d4c>
 1271508: aa0803e0     	mov	x0, x8
 127150c: 97f93ab5     	bl	0x10bffe0 <CloseNLSocket+0x518>
 1271510: aa1603e0     	mov	x0, x22
 1271514: aa1f03e1     	mov	x1, xzr
 1271518: aa1f03e2     	mov	x2, xzr
 127151c: 94491ccb     	bl	0x24b8848 <__start_il2cpp+0x1311084>
 1271520: 360010a0     	tbz	w0, #0x0, 0x1271734 <__start_il2cpp+0xc9f70>
 1271524: 394086a8     	ldrb	w8, [x21, #0x21]
 1271528: f9403a60     	ldr	x0, [x19, #0x70]
 127152c: 340001e8     	cbz	w8, 0x1271568 <__start_il2cpp+0xc9da4>
 1271530: b40011a0     	cbz	x0, 0x1271764 <__start_il2cpp+0xc9fa0>
 1271534: 39440008     	ldrb	w8, [x0, #0x100]
 1271538: 34000088     	cbz	w8, 0x1271548 <__start_il2cpp+0xc9d84>
 127153c: f9402a68     	ldr	x8, [x19, #0x50]
 1271540: b4001128     	cbz	x8, 0x1271764 <__start_il2cpp+0xc9fa0>
 1271544: 3903311a     	strb	w26, [x8, #0xcc]
 1271548: 394082a8     	ldrb	w8, [x21, #0x20]
 127154c: 35000108     	cbnz	w8, 0x127156c <__start_il2cpp+0xc9da8>
 1271550: 39455008     	ldrb	w8, [x0, #0x154]
 1271554: 340000c8     	cbz	w8, 0x127156c <__start_il2cpp+0xc9da8>
 1271558: f9402a68     	ldr	x8, [x19, #0x50]
 127155c: b4001048     	cbz	x8, 0x1271764 <__start_il2cpp+0xc9fa0>
 1271560: 3903311a     	strb	w26, [x8, #0xcc]
 1271564: 14000002     	b	0x127156c <__start_il2cpp+0xc9da8>
 1271568: b4000fe0     	cbz	x0, 0x1271764 <__start_il2cpp+0xc9fa0>
 127156c: aa1f03e1     	mov	x1, xzr
 1271570: 94009c7b     	bl	0x129875c <__start_il2cpp+0xf0f98>
 1271574: b4000f96     	cbz	x22, 0x1271764 <__start_il2cpp+0xc9fa0>
 1271578: aa1603e0     	mov	x0, x22
 127157c: aa1f03e1     	mov	x1, xzr
 1271580: 94020d5e     	bl	0x12f4af8 <__start_il2cpp+0x14d334>
 1271584: 37000d80     	tbnz	w0, #0x0, 0x1271734 <__start_il2cpp+0xc9f70>
 1271588: 394082a8     	ldrb	w8, [x21, #0x20]
 127158c: 34000168     	cbz	w8, 0x12715b8 <__start_il2cpp+0xc9df4>
 1271590: f9403a60     	ldr	x0, [x19, #0x70]
 1271594: b4000e80     	cbz	x0, 0x1271764 <__start_il2cpp+0xc9fa0>
 1271598: aa1f03e1     	mov	x1, xzr
 127159c: 944912dc     	bl	0x24b610c <__start_il2cpp+0x130e948>
 12715a0: b4000e20     	cbz	x0, 0x1271764 <__start_il2cpp+0xc9fa0>
 12715a4: aa1f03e1     	mov	x1, xzr
 12715a8: 94494433     	bl	0x24c2674 <__start_il2cpp+0x131aeb0>
 12715ac: bd4032c0     	ldr	s0, [x22, #0x30]
 12715b0: 1e202020     	fcmp	s1, s0
 12715b4: 540000aa     	b.ge	0x12715c8 <__start_il2cpp+0xc9e04>
 12715b8: 394086a8     	ldrb	w8, [x21, #0x21]
 12715bc: 340001c8     	cbz	w8, 0x12715f4 <__start_il2cpp+0xc9e30>
 12715c0: 52800028     	mov	w8, #0x1                // =1
 12715c4: 14000004     	b	0x12715d4 <__start_il2cpp+0xc9e10>
 12715c8: 394086a8     	ldrb	w8, [x21, #0x21]
 12715cc: 34000b48     	cbz	w8, 0x1271734 <__start_il2cpp+0xc9f70>
 12715d0: 2a1f03e8     	mov	w8, wzr
 12715d4: f9403a60     	ldr	x0, [x19, #0x70]
 12715d8: b4000c60     	cbz	x0, 0x1271764 <__start_il2cpp+0xc9fa0>
 12715dc: 39440009     	ldrb	w9, [x0, #0x100]
 12715e0: 7100013f     	cmp	w9, #0x0
 12715e4: 1a9f17e9     	cset	w9, eq
 12715e8: 0a090108     	and	w8, w8, w9
 12715ec: 37000088     	tbnz	w8, #0x0, 0x12715fc <__start_il2cpp+0xc9e38>
 12715f0: 14000051     	b	0x1271734 <__start_il2cpp+0xc9f70>
 12715f4: f9403a60     	ldr	x0, [x19, #0x70]
 12715f8: b4000b60     	cbz	x0, 0x1271764 <__start_il2cpp+0xc9fa0>
 12715fc: aa1f03e1     	mov	x1, xzr
 1271600: 94009c57     	bl	0x129875c <__start_il2cpp+0xf0f98>
 1271604: f9403a60     	ldr	x0, [x19, #0x70]
 1271608: b4000ae0     	cbz	x0, 0x1271764 <__start_il2cpp+0xc9fa0>
 127160c: aa1f03e1     	mov	x1, xzr
 1271610: 4ea01c08     	mov	v8.16b, v0.16b
 1271614: 4ea11c29     	mov	v9.16b, v1.16b
 1271618: 9401be21     	bl	0x12e0e9c <__start_il2cpp+0x1396d8>
 127161c: 4ea01c02     	mov	v2.16b, v0.16b
 1271620: 4ea11c23     	mov	v3.16b, v1.16b
 1271624: aa1503e0     	mov	x0, x21
 1271628: 4ea81d00     	mov	v0.16b, v8.16b
 127162c: 4ea91d21     	mov	v1.16b, v9.16b
 1271630: aa1f03e1     	mov	x1, xzr
 1271634: 9401bf45     	bl	0x12e1348 <__start_il2cpp+0x139b84>
 1271638: 360007e0     	tbz	w0, #0x0, 0x1271734 <__start_il2cpp+0xc9f70>
 127163c: f9403a60     	ldr	x0, [x19, #0x70]
 1271640: b4000920     	cbz	x0, 0x1271764 <__start_il2cpp+0xc9fa0>
 1271644: 39455008     	ldrb	w8, [x0, #0x154]
 1271648: 340001c8     	cbz	w8, 0x1271680 <__start_il2cpp+0xc9ebc>
 127164c: f9404668     	ldr	x8, [x19, #0x88]
 1271650: b40008a8     	cbz	x8, 0x1271764 <__start_il2cpp+0xc9fa0>
 1271654: b9403908     	ldr	w8, [x8, #0x38]
 1271658: 7100191f     	cmp	w8, #0x6
 127165c: 540006c1     	b.ne	0x1271734 <__start_il2cpp+0xc9f70>
 1271660: aa1503e0     	mov	x0, x21
 1271664: aa1f03e1     	mov	x1, xzr
 1271668: 944912b8     	bl	0x24b6148 <__start_il2cpp+0x130e984>
 127166c: b40007c0     	cbz	x0, 0x1271764 <__start_il2cpp+0xc9fa0>
 1271670: 2a1f03e1     	mov	w1, wzr
 1271674: aa1f03e2     	mov	x2, xzr
 1271678: 94491d50     	bl	0x24b8bb8 <__start_il2cpp+0x13113f4>
 127167c: 1400002e     	b	0x1271734 <__start_il2cpp+0xc9f70>
 1271680: 39408aa8     	ldrb	w8, [x21, #0x22]
 1271684: 34000168     	cbz	w8, 0x12716b0 <__start_il2cpp+0xc9eec>
 1271688: 394082a9     	ldrb	w9, [x21, #0x20]
 127168c: 394086a8     	ldrb	w8, [x21, #0x21]
 1271690: 340002a9     	cbz	w9, 0x12716e4 <__start_il2cpp+0xc9f20>
 1271694: 340002e8     	cbz	w8, 0x12716f0 <__start_il2cpp+0xc9f2c>
 1271698: f9404668     	ldr	x8, [x19, #0x88]
 127169c: b4000648     	cbz	x8, 0x1271764 <__start_il2cpp+0xc9fa0>
 12716a0: b9403508     	ldr	w8, [x8, #0x34]
 12716a4: 7100051f     	cmp	w8, #0x1
 12716a8: 1a9b0381     	csel	w1, w28, w27, eq
 12716ac: 14000012     	b	0x12716f4 <__start_il2cpp+0xc9f30>
 12716b0: 1e2703e0     	fmov	s0, wzr
 12716b4: aa1f03e1     	mov	x1, xzr
 12716b8: 940098c8     	bl	0x12979d8 <__start_il2cpp+0xf0214>
 12716bc: f9402a60     	ldr	x0, [x19, #0x50]
 12716c0: b4000520     	cbz	x0, 0x1271764 <__start_il2cpp+0xc9fa0>
 12716c4: 1e2e1000     	fmov	s0, #1.00000000
 12716c8: 1e2f1001     	fmov	s1, #1.50000000
 12716cc: 1e2e1002     	fmov	s2, #1.00000000
 12716d0: 1e2703e3     	fmov	s3, wzr
 12716d4: aa1f03e1     	mov	x1, xzr
 12716d8: 9400ec54     	bl	0x12ac828 <__start_il2cpp+0x105064>
 12716dc: 3905927a     	strb	w26, [x19, #0x164]
 12716e0: 14000015     	b	0x1271734 <__start_il2cpp+0xc9f70>
 12716e4: 340000c8     	cbz	w8, 0x12716fc <__start_il2cpp+0xc9f38>
 12716e8: 52800061     	mov	w1, #0x3                // =3
 12716ec: 14000002     	b	0x12716f4 <__start_il2cpp+0xc9f30>
 12716f0: 52800041     	mov	w1, #0x2                // =2
 12716f4: aa1f03e2     	mov	x2, xzr
 12716f8: 940099ee     	bl	0x1297eb0 <__start_il2cpp+0xf06ec>
 12716fc: f9403a60     	ldr	x0, [x19, #0x70]
 1271700: b4000320     	cbz	x0, 0x1271764 <__start_il2cpp+0xc9fa0>
 1271704: f9400008     	ldr	x8, [x0]
 1271708: 2a1f03e1     	mov	w1, wzr
 127170c: a9588909     	ldp	x9, x2, [x8, #0x188]
 1271710: d63f0120     	blr	x9
 1271714: f9402a60     	ldr	x0, [x19, #0x50]
 1271718: b4000260     	cbz	x0, 0x1271764 <__start_il2cpp+0xc9fa0>
 127171c: 1e2e1000     	fmov	s0, #1.00000000
 1271720: 1e2e1001     	fmov	s1, #1.00000000
 1271724: 1e2e1002     	fmov	s2, #1.00000000
 1271728: 1e2703e3     	fmov	s3, wzr
 127172c: aa1f03e1     	mov	x1, xzr
 1271730: 9400ec3e     	bl	0x12ac828 <__start_il2cpp+0x105064>
 1271734: b9401a88     	ldr	w8, [x20, #0x18]
 1271738: 11000718     	add	w24, w24, #0x1
 127173c: 6b08031f     	cmp	w24, w8
 1271740: 54ffeb8b     	b.lt	0x12714b0 <__start_il2cpp+0xc9cec>
 1271744: a9464ff4     	ldp	x20, x19, [sp, #0x60]
 1271748: a94557f6     	ldp	x22, x21, [sp, #0x50]
 127174c: a9445ff8     	ldp	x24, x23, [sp, #0x40]
 1271750: a94367fa     	ldp	x26, x25, [sp, #0x30]
 1271754: a9426ffc     	ldp	x28, x27, [sp, #0x20]
 1271758: f9400bfe     	ldr	x30, [sp, #0x10]
 127175c: 6cc723e9     	ldp	d9, d8, [sp], #0x70
 1271760: d65f03c0     	ret
 1271764: 97f93a67     	bl	0x10c0100 <CloseNLSocket+0x638>
 1271768: 97f93a68     	bl	0x10c0108 <CloseNLSocket+0x640>
