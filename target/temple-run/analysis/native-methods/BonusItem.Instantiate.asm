
/tmp/temple-libil2cpp.so:	file format elf64-littleaarch64

Disassembly of section il2cpp:

00000000011a77c4 <__start_il2cpp>:
 1296084: d10183ff     	sub	sp, sp, #0x60
 1296088: a90267fe     	stp	x30, x25, [sp, #0x20]
 129608c: a9035ff8     	stp	x24, x23, [sp, #0x30]
 1296090: a90457f6     	stp	x22, x21, [sp, #0x40]
 1296094: a9054ff4     	stp	x20, x19, [sp, #0x50]
 1296098: f000bcf5     	adrp	x21, 0x2a35000
 129609c: b000ae74     	adrp	x20, 0x2863000
 12960a0: 396222a8     	ldrb	w8, [x21, #0x888]
 12960a4: f9466e94     	ldr	x20, [x20, #0xcd8]
 12960a8: 2a0003f3     	mov	w19, w0
 12960ac: 37000968     	tbnz	w8, #0x0, 0x12961d8 <__start_il2cpp+0xeea14>
 12960b0: b000ae60     	adrp	x0, 0x2863000
 12960b4: f9467000     	ldr	x0, [x0, #0xce0]
 12960b8: 97f8a788     	bl	0x10bfed8 <CloseNLSocket+0x410>
 12960bc: b000ae60     	adrp	x0, 0x2863000
 12960c0: f9467400     	ldr	x0, [x0, #0xce8]
 12960c4: 97f8a785     	bl	0x10bfed8 <CloseNLSocket+0x410>
 12960c8: d000ae20     	adrp	x0, 0x285c000 <_ZTVN10__cxxabiv119__pointer_type_infoE+0x18>
 12960cc: f9457000     	ldr	x0, [x0, #0xae0]
 12960d0: 97f8a782     	bl	0x10bfed8 <CloseNLSocket+0x410>
 12960d4: b000ae60     	adrp	x0, 0x2863000
 12960d8: f9467800     	ldr	x0, [x0, #0xcf0]
 12960dc: 97f8a77f     	bl	0x10bfed8 <CloseNLSocket+0x410>
 12960e0: b000ae60     	adrp	x0, 0x2863000
 12960e4: f9467c00     	ldr	x0, [x0, #0xcf8]
 12960e8: 97f8a77c     	bl	0x10bfed8 <CloseNLSocket+0x410>
 12960ec: b000ae60     	adrp	x0, 0x2863000
 12960f0: f9468000     	ldr	x0, [x0, #0xd00]
 12960f4: 97f8a779     	bl	0x10bfed8 <CloseNLSocket+0x410>
 12960f8: b000ae60     	adrp	x0, 0x2863000
 12960fc: f9468400     	ldr	x0, [x0, #0xd08]
 1296100: 97f8a776     	bl	0x10bfed8 <CloseNLSocket+0x410>
 1296104: 9000ae40     	adrp	x0, 0x285e000
 1296108: f9451000     	ldr	x0, [x0, #0xa20]
 129610c: 97f8a773     	bl	0x10bfed8 <CloseNLSocket+0x410>
 1296110: f000ae20     	adrp	x0, 0x285d000
 1296114: f9461c00     	ldr	x0, [x0, #0xc38]
 1296118: 97f8a770     	bl	0x10bfed8 <CloseNLSocket+0x410>
 129611c: f000ae20     	adrp	x0, 0x285d000
 1296120: f9460c00     	ldr	x0, [x0, #0xc18]
 1296124: 97f8a76d     	bl	0x10bfed8 <CloseNLSocket+0x410>
 1296128: 9000ae40     	adrp	x0, 0x285e000
 129612c: f9447000     	ldr	x0, [x0, #0x8e0]
 1296130: 97f8a76a     	bl	0x10bfed8 <CloseNLSocket+0x410>
 1296134: b000ae60     	adrp	x0, 0x2863000
 1296138: f9468800     	ldr	x0, [x0, #0xd10]
 129613c: 97f8a767     	bl	0x10bfed8 <CloseNLSocket+0x410>
 1296140: b000ae60     	adrp	x0, 0x2863000
 1296144: f9468c00     	ldr	x0, [x0, #0xd18]
 1296148: 97f8a764     	bl	0x10bfed8 <CloseNLSocket+0x410>
 129614c: b000ae60     	adrp	x0, 0x2863000
 1296150: f9469000     	ldr	x0, [x0, #0xd20]
 1296154: 97f8a761     	bl	0x10bfed8 <CloseNLSocket+0x410>
 1296158: b000ae60     	adrp	x0, 0x2863000
 129615c: f9469400     	ldr	x0, [x0, #0xd28]
 1296160: 97f8a75e     	bl	0x10bfed8 <CloseNLSocket+0x410>
 1296164: b000ae60     	adrp	x0, 0x2863000
 1296168: f9469800     	ldr	x0, [x0, #0xd30]
 129616c: 97f8a75b     	bl	0x10bfed8 <CloseNLSocket+0x410>
 1296170: b000ae60     	adrp	x0, 0x2863000
 1296174: f9466c00     	ldr	x0, [x0, #0xcd8]
 1296178: 97f8a758     	bl	0x10bfed8 <CloseNLSocket+0x410>
 129617c: b000ae60     	adrp	x0, 0x2863000
 1296180: f9469c00     	ldr	x0, [x0, #0xd38]
 1296184: 97f8a755     	bl	0x10bfed8 <CloseNLSocket+0x410>
 1296188: b000ae60     	adrp	x0, 0x2863000
 129618c: f946a000     	ldr	x0, [x0, #0xd40]
 1296190: 97f8a752     	bl	0x10bfed8 <CloseNLSocket+0x410>
 1296194: b000ae60     	adrp	x0, 0x2863000
 1296198: f946a400     	ldr	x0, [x0, #0xd48]
 129619c: 97f8a74f     	bl	0x10bfed8 <CloseNLSocket+0x410>
 12961a0: b000ae60     	adrp	x0, 0x2863000
 12961a4: f946a800     	ldr	x0, [x0, #0xd50]
 12961a8: 97f8a74c     	bl	0x10bfed8 <CloseNLSocket+0x410>
 12961ac: b000ae60     	adrp	x0, 0x2863000
 12961b0: f946ac00     	ldr	x0, [x0, #0xd58]
 12961b4: 97f8a749     	bl	0x10bfed8 <CloseNLSocket+0x410>
 12961b8: b000ae60     	adrp	x0, 0x2863000
 12961bc: f946b000     	ldr	x0, [x0, #0xd60]
 12961c0: 97f8a746     	bl	0x10bfed8 <CloseNLSocket+0x410>
 12961c4: b000ae60     	adrp	x0, 0x2863000
 12961c8: f946b400     	ldr	x0, [x0, #0xd68]
 12961cc: 97f8a743     	bl	0x10bfed8 <CloseNLSocket+0x410>
 12961d0: 52800028     	mov	w8, #0x1                // =1
 12961d4: 392222a8     	strb	w8, [x21, #0x888]
 12961d8: b000ae77     	adrp	x23, 0x2863000
 12961dc: b000ae76     	adrp	x22, 0x2863000
 12961e0: f9468af7     	ldr	x23, [x23, #0xd10]
 12961e4: f94676d6     	ldr	x22, [x22, #0xce8]
 12961e8: f9400294     	ldr	x20, [x20]
 12961ec: 51000675     	sub	w21, w19, #0x1
 12961f0: 71001abf     	cmp	w21, #0x6
 12961f4: b9001fff     	str	wzr, [sp, #0x1c]
 12961f8: 54000148     	b.hi	0x1296220 <__start_il2cpp+0xeea5c>
 12961fc: b0ffa108     	adrp	x8, 0x6b7000
 1296200: 9129e108     	add	x8, x8, #0xa78
 1296204: 10000089     	adr	x9, 0x1296214 <__start_il2cpp+0xeea50>
 1296208: 3875690a     	ldrb	w10, [x8, x21]
 129620c: 8b0a0929     	add	x9, x9, x10, lsl #2
 1296210: d61f0120     	br	x9
 1296214: b000ae68     	adrp	x8, 0x2863000
 1296218: f946a508     	ldr	x8, [x8, #0xd48]
 129621c: 1400002e     	b	0x12962d4 <__start_il2cpp+0xeeb10>
 1296220: b000ae68     	adrp	x8, 0x2863000
 1296224: f9467108     	ldr	x8, [x8, #0xce0]
 1296228: 92800009     	mov	x9, #-0x1               // =-1
 129622c: 910003e0     	mov	x0, sp
 1296230: aa1f03e1     	mov	x1, xzr
 1296234: f9400108     	ldr	x8, [x8]
 1296238: b90013f3     	str	w19, [sp, #0x10]
 129623c: a90027e8     	stp	x8, x9, [sp]
 1296240: 94310f4e     	bl	0x1ed9f78 <__start_il2cpp+0xd327b4>
 1296244: b000ae68     	adrp	x8, 0x2863000
 1296248: f946ad08     	ldr	x8, [x8, #0xd58]
 129624c: aa0003e1     	mov	x1, x0
 1296250: aa1f03e2     	mov	x2, xzr
 1296254: f9400108     	ldr	x8, [x8]
 1296258: aa0803e0     	mov	x0, x8
 129625c: 942a9310     	bl	0x1d3ae9c <__start_il2cpp+0xb936d8>
 1296260: d000ae28     	adrp	x8, 0x285c000 <_ZTVN10__cxxabiv119__pointer_type_infoE+0x18>
 1296264: f9457108     	ldr	x8, [x8, #0xae0]
 1296268: aa0003f3     	mov	x19, x0
 129626c: f9400108     	ldr	x8, [x8]
 1296270: b940e109     	ldr	w9, [x8, #0xe0]
 1296274: 35000069     	cbnz	w9, 0x1296280 <__start_il2cpp+0xeeabc>
 1296278: aa0803e0     	mov	x0, x8
 129627c: 97f8a759     	bl	0x10bffe0 <CloseNLSocket+0x518>
 1296280: aa1303e0     	mov	x0, x19
 1296284: aa1f03e1     	mov	x1, xzr
 1296288: 9447ffc3     	bl	0x2496194 <__start_il2cpp+0x12ee9d0>
 129628c: 14000017     	b	0x12962e8 <__start_il2cpp+0xeeb24>
 1296290: b000ae68     	adrp	x8, 0x2863000
 1296294: f9469d08     	ldr	x8, [x8, #0xd38]
 1296298: 1400000f     	b	0x12962d4 <__start_il2cpp+0xeeb10>
 129629c: b000ae68     	adrp	x8, 0x2863000
 12962a0: f946a108     	ldr	x8, [x8, #0xd40]
 12962a4: 1400000c     	b	0x12962d4 <__start_il2cpp+0xeeb10>
 12962a8: b000ae68     	adrp	x8, 0x2863000
 12962ac: f946b108     	ldr	x8, [x8, #0xd60]
 12962b0: 14000009     	b	0x12962d4 <__start_il2cpp+0xeeb10>
 12962b4: b000ae68     	adrp	x8, 0x2863000
 12962b8: f9469908     	ldr	x8, [x8, #0xd30]
 12962bc: 14000006     	b	0x12962d4 <__start_il2cpp+0xeeb10>
 12962c0: b000ae68     	adrp	x8, 0x2863000
 12962c4: f9468d08     	ldr	x8, [x8, #0xd18]
 12962c8: 14000003     	b	0x12962d4 <__start_il2cpp+0xeeb10>
 12962cc: b000ae68     	adrp	x8, 0x2863000
 12962d0: f946b508     	ldr	x8, [x8, #0xd68]
 12962d4: f9400101     	ldr	x1, [x8]
 12962d8: aa1403e0     	mov	x0, x20
 12962dc: aa1f03e2     	mov	x2, xzr
 12962e0: 942a92ef     	bl	0x1d3ae9c <__start_il2cpp+0xb936d8>
 12962e4: aa0003f4     	mov	x20, x0
 12962e8: f94002e1     	ldr	x1, [x23]
 12962ec: aa1403e0     	mov	x0, x20
 12962f0: aa1f03e2     	mov	x2, xzr
 12962f4: 942a92ea     	bl	0x1d3ae9c <__start_il2cpp+0xb936d8>
 12962f8: f94002c8     	ldr	x8, [x22]
 12962fc: aa0003f3     	mov	x19, x0
 1296300: b940e109     	ldr	w9, [x8, #0xe0]
 1296304: 35000089     	cbnz	w9, 0x1296314 <__start_il2cpp+0xeeb50>
 1296308: aa0803e0     	mov	x0, x8
 129630c: 97f8a735     	bl	0x10bffe0 <CloseNLSocket+0x518>
 1296310: f94002c8     	ldr	x8, [x22]
 1296314: f9405d08     	ldr	x8, [x8, #0xb8]
 1296318: f9400500     	ldr	x0, [x8, #0x8]
 129631c: b40014e0     	cbz	x0, 0x12965b8 <__start_il2cpp+0xeedf4>
 1296320: b000ae68     	adrp	x8, 0x2863000
 1296324: f9467d08     	ldr	x8, [x8, #0xcf8]
 1296328: aa1303e1     	mov	x1, x19
 129632c: f9400102     	ldr	x2, [x8]
 1296330: 940f1c2a     	bl	0x165d3d8 <__start_il2cpp+0x4b5c14>
 1296334: 36000200     	tbz	w0, #0x0, 0x1296374 <__start_il2cpp+0xeebb0>
 1296338: f94002c0     	ldr	x0, [x22]
 129633c: b940e008     	ldr	w8, [x0, #0xe0]
 1296340: 35000068     	cbnz	w8, 0x129634c <__start_il2cpp+0xeeb88>
 1296344: 97f8a727     	bl	0x10bffe0 <CloseNLSocket+0x518>
 1296348: f94002c0     	ldr	x0, [x22]
 129634c: f9405c08     	ldr	x8, [x0, #0xb8]
 1296350: f9400500     	ldr	x0, [x8, #0x8]
 1296354: b4001320     	cbz	x0, 0x12965b8 <__start_il2cpp+0xeedf4>
 1296358: b000ae68     	adrp	x8, 0x2863000
 129635c: f9468108     	ldr	x8, [x8, #0xd00]
 1296360: aa1303e1     	mov	x1, x19
 1296364: f9400102     	ldr	x2, [x8]
 1296368: 940f1b7f     	bl	0x165d164 <__start_il2cpp+0x4b59a0>
 129636c: aa0003f4     	mov	x20, x0
 1296370: 14000027     	b	0x129640c <__start_il2cpp+0xeec48>
 1296374: 9000ae48     	adrp	x8, 0x285e000
 1296378: f9447108     	ldr	x8, [x8, #0x8e0]
 129637c: f9400100     	ldr	x0, [x8]
 1296380: 9000ae48     	adrp	x8, 0x285e000
 1296384: f9451108     	ldr	x8, [x8, #0xa20]
 1296388: b940e009     	ldr	w9, [x0, #0xe0]
 129638c: f9400114     	ldr	x20, [x8]
 1296390: 35000049     	cbnz	w9, 0x1296398 <__start_il2cpp+0xeebd4>
 1296394: 97f8a713     	bl	0x10bffe0 <CloseNLSocket+0x518>
 1296398: aa1403e0     	mov	x0, x20
 129639c: aa1f03e1     	mov	x1, xzr
 12963a0: 9430730e     	bl	0x1eb2fd8 <__start_il2cpp+0xd0b814>
 12963a4: aa0003e1     	mov	x1, x0
 12963a8: aa1303e0     	mov	x0, x19
 12963ac: aa1f03e2     	mov	x2, xzr
 12963b0: 944876fd     	bl	0x24b3fa4 <__start_il2cpp+0x130c7e0>
 12963b4: aa0003f4     	mov	x20, x0
 12963b8: b40000e0     	cbz	x0, 0x12963d4 <__start_il2cpp+0xeec10>
 12963bc: f000ae28     	adrp	x8, 0x285d000
 12963c0: f9461d08     	ldr	x8, [x8, #0xc38]
 12963c4: f9400101     	ldr	x1, [x8]
 12963c8: f9400288     	ldr	x8, [x20]
 12963cc: eb01011f     	cmp	x8, x1
 12963d0: 54000f61     	b.ne	0x12965bc <__start_il2cpp+0xeedf8>
 12963d4: f94002c0     	ldr	x0, [x22]
 12963d8: b940e008     	ldr	w8, [x0, #0xe0]
 12963dc: 35000068     	cbnz	w8, 0x12963e8 <__start_il2cpp+0xeec24>
 12963e0: 97f8a700     	bl	0x10bffe0 <CloseNLSocket+0x518>
 12963e4: f94002c0     	ldr	x0, [x22]
 12963e8: f9405c08     	ldr	x8, [x0, #0xb8]
 12963ec: f9400500     	ldr	x0, [x8, #0x8]
 12963f0: b4000e40     	cbz	x0, 0x12965b8 <__start_il2cpp+0xeedf4>
 12963f4: b000ae68     	adrp	x8, 0x2863000
 12963f8: f9467908     	ldr	x8, [x8, #0xcf0]
 12963fc: aa1303e1     	mov	x1, x19
 1296400: aa1403e2     	mov	x2, x20
 1296404: f9400103     	ldr	x3, [x8]
 1296408: 940f1b77     	bl	0x165d1e4 <__start_il2cpp+0x4b5a20>
 129640c: f000ae33     	adrp	x19, 0x285d000
 1296410: f9460e73     	ldr	x19, [x19, #0xc18]
 1296414: f9400260     	ldr	x0, [x19]
 1296418: b940e008     	ldr	w8, [x0, #0xe0]
 129641c: 35000068     	cbnz	w8, 0x1296428 <__start_il2cpp+0xeec64>
 1296420: 97f8a6f0     	bl	0x10bffe0 <CloseNLSocket+0x518>
 1296424: f9400260     	ldr	x0, [x19]
 1296428: f9405c08     	ldr	x8, [x0, #0xb8]
 129642c: f9400100     	ldr	x0, [x8]
 1296430: b4000c40     	cbz	x0, 0x12965b8 <__start_il2cpp+0xeedf4>
 1296434: b000ae68     	adrp	x8, 0x2863000
 1296438: f9469108     	ldr	x8, [x8, #0xd20]
 129643c: aa1f03e2     	mov	x2, xzr
 1296440: f9400101     	ldr	x1, [x8]
 1296444: 97fcce57     	bl	0x11c9da0 <__start_il2cpp+0x225dc>
 1296448: b4000b94     	cbz	x20, 0x12965b8 <__start_il2cpp+0xeedf4>
 129644c: aa0003f3     	mov	x19, x0
 1296450: aa1403e0     	mov	x0, x20
 1296454: aa1f03e1     	mov	x1, xzr
 1296458: 944889a9     	bl	0x24b8afc <__start_il2cpp+0x1311338>
 129645c: b4000af3     	cbz	x19, 0x12965b8 <__start_il2cpp+0xeedf4>
 1296460: aa0003e1     	mov	x1, x0
 1296464: aa1303e0     	mov	x0, x19
 1296468: aa1f03e2     	mov	x2, xzr
 129646c: 97fcd7f7     	bl	0x11cc448 <__start_il2cpp+0x24c84>
 1296470: b4000a40     	cbz	x0, 0x12965b8 <__start_il2cpp+0xeedf4>
 1296474: aa1f03e1     	mov	x1, xzr
 1296478: 94487f34     	bl	0x24b6148 <__start_il2cpp+0x130e984>
 129647c: b40009e0     	cbz	x0, 0x12965b8 <__start_il2cpp+0xeedf4>
 1296480: b000ae68     	adrp	x8, 0x2863000
 1296484: f9468508     	ldr	x8, [x8, #0xd08]
 1296488: aa0003f4     	mov	x20, x0
 129648c: f9400101     	ldr	x1, [x8]
 1296490: 94050a34     	bl	0x13d8d60 <__start_il2cpp+0x23159c>
 1296494: b4000920     	cbz	x0, 0x12965b8 <__start_il2cpp+0xeedf4>
 1296498: aa0003f3     	mov	x19, x0
 129649c: f94002c0     	ldr	x0, [x22]
 12964a0: b9407a68     	ldr	w8, [x19, #0x78]
 12964a4: b000ae77     	adrp	x23, 0x2863000
 12964a8: b000ae78     	adrp	x24, 0x2863000
 12964ac: b940e009     	ldr	w9, [x0, #0xe0]
 12964b0: f94696f7     	ldr	x23, [x23, #0xd28]
 12964b4: f946ab18     	ldr	x24, [x24, #0xd50]
 12964b8: 51000519     	sub	w25, w8, #0x1
 12964bc: 35000069     	cbnz	w9, 0x12964c8 <__start_il2cpp+0xeed04>
 12964c0: 97f8a6c8     	bl	0x10bffe0 <CloseNLSocket+0x518>
 12964c4: f94002c0     	ldr	x0, [x22]
 12964c8: f9405c08     	ldr	x8, [x0, #0xb8]
 12964cc: 910073e0     	add	x0, sp, #0x1c
 12964d0: aa1f03e1     	mov	x1, xzr
 12964d4: b9400109     	ldr	w9, [x8]
 12964d8: 1100052a     	add	w10, w9, #0x1
 12964dc: b900010a     	str	w10, [x8]
 12964e0: b9001fe9     	str	w9, [sp, #0x1c]
 12964e4: 94302f8c     	bl	0x1ea2314 <__start_il2cpp+0xcfab50>
 12964e8: 71000f3f     	cmp	w25, #0x3
 12964ec: 9a9832e8     	csel	x8, x23, x24, lo
 12964f0: f9400108     	ldr	x8, [x8]
 12964f4: aa0003e1     	mov	x1, x0
 12964f8: aa1f03e2     	mov	x2, xzr
 12964fc: aa0803e0     	mov	x0, x8
 1296500: 942a9267     	bl	0x1d3ae9c <__start_il2cpp+0xb936d8>
 1296504: aa0003e1     	mov	x1, x0
 1296508: aa1403e0     	mov	x0, x20
 129650c: aa1f03e2     	mov	x2, xzr
 1296510: 9448972a     	bl	0x24bc1b8 <__start_il2cpp+0x13149f4>
 1296514: 71001abf     	cmp	w21, #0x6
 1296518: 54000268     	b.hi	0x1296564 <__start_il2cpp+0xeeda0>
 129651c: b0ffa108     	adrp	x8, 0x6b7000
 1296520: 9129fd08     	add	x8, x8, #0xa7f
 1296524: 10000089     	adr	x9, 0x1296534 <__start_il2cpp+0xeed70>
 1296528: 3875690a     	ldrb	w10, [x8, x21]
 129652c: 8b0a0929     	add	x9, x9, x10, lsl #2
 1296530: d61f0120     	br	x9
 1296534: 52800328     	mov	w8, #0x19               // =25
 1296538: b9007e68     	str	w8, [x19, #0x7c]
 129653c: 1400000a     	b	0x1296564 <__start_il2cpp+0xeeda0>
 1296540: 528000a8     	mov	w8, #0x5                // =5
 1296544: 14000004     	b	0x1296554 <__start_il2cpp+0xeed90>
 1296548: 52800148     	mov	w8, #0xa                // =10
 129654c: 14000002     	b	0x1296554 <__start_il2cpp+0xeed90>
 1296550: 528001e8     	mov	w8, #0xf                // =15
 1296554: 52900009     	mov	w9, #0x8000             // =32768
 1296558: 72b87009     	movk	w9, #0xc380, lsl #16
 129655c: b9007e68     	str	w8, [x19, #0x7c]
 1296560: b9004e69     	str	w9, [x19, #0x4c]
 1296564: 52a87f48     	mov	w8, #0x43fa0000         // =1140457472
 1296568: 1e270100     	fmov	s0, w8
 129656c: aa1303e0     	mov	x0, x19
 1296570: aa1f03e1     	mov	x1, xzr
 1296574: 940129f4     	bl	0x12e0d44 <__start_il2cpp+0x139580>
 1296578: 52800021     	mov	w1, #0x1                // =1
 129657c: aa1303e0     	mov	x0, x19
 1296580: aa1f03e2     	mov	x2, xzr
 1296584: 94487c43     	bl	0x24b5690 <__start_il2cpp+0x130decc>
 1296588: f9400268     	ldr	x8, [x19]
 129658c: 52800021     	mov	w1, #0x1                // =1
 1296590: aa1303e0     	mov	x0, x19
 1296594: a9588909     	ldp	x9, x2, [x8, #0x188]
 1296598: d63f0120     	blr	x9
 129659c: aa1303e0     	mov	x0, x19
 12965a0: a9454ff4     	ldp	x20, x19, [sp, #0x50]
 12965a4: a94457f6     	ldp	x22, x21, [sp, #0x40]
 12965a8: a9435ff8     	ldp	x24, x23, [sp, #0x30]
 12965ac: a94267fe     	ldp	x30, x25, [sp, #0x20]
 12965b0: 910183ff     	add	sp, sp, #0x60
 12965b4: d65f03c0     	ret
 12965b8: 97f8a6d2     	bl	0x10c0100 <CloseNLSocket+0x638>
 12965bc: aa1403e0     	mov	x0, x20
 12965c0: 97f8a7b7     	bl	0x10c049c <CloseNLSocket+0x9d4>
