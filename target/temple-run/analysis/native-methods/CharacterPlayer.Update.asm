
/tmp/temple-libil2cpp.so:	file format elf64-littleaarch64

Disassembly of section il2cpp:

00000000011a77c4 <__start_il2cpp>:
 12971f0: fc1b0fec     	str	d12, [sp, #-0x50]!
 12971f4: 6d00abeb     	stp	d11, d10, [sp, #0x8]
 12971f8: 6d01a3e9     	stp	d9, d8, [sp, #0x18]
 12971fc: f90017fe     	str	x30, [sp, #0x28]
 1297200: a90357f6     	stp	x22, x21, [sp, #0x30]
 1297204: a9044ff4     	stp	x20, x19, [sp, #0x40]
 1297208: d000bcf4     	adrp	x20, 0x2a35000
 129720c: 39624688     	ldrb	w8, [x20, #0x891]
 1297210: aa0003f3     	mov	x19, x0
 1297214: 37000128     	tbnz	w8, #0x0, 0x1297238 <__start_il2cpp+0xefa74>
 1297218: f000ae20     	adrp	x0, 0x285e000
 129721c: f9414000     	ldr	x0, [x0, #0x280]
 1297220: 97f8a32e     	bl	0x10bfed8 <CloseNLSocket+0x410>
 1297224: 9000ae60     	adrp	x0, 0x2863000
 1297228: f946c400     	ldr	x0, [x0, #0xd88]
 129722c: 97f8a32b     	bl	0x10bfed8 <CloseNLSocket+0x410>
 1297230: 52800028     	mov	w8, #0x1                // =1
 1297234: 39224688     	strb	w8, [x20, #0x891]
 1297238: 39436268     	ldrb	w8, [x19, #0xd8]
 129723c: 35000428     	cbnz	w8, 0x12972c0 <__start_il2cpp+0xefafc>
 1297240: 3946c268     	ldrb	w8, [x19, #0x1b0]
 1297244: 350003e8     	cbnz	w8, 0x12972c0 <__start_il2cpp+0xefafc>
 1297248: f000ae34     	adrp	x20, 0x285e000
 129724c: f9414294     	ldr	x20, [x20, #0x280]
 1297250: f9400280     	ldr	x0, [x20]
 1297254: b940e008     	ldr	w8, [x0, #0xe0]
 1297258: 35000068     	cbnz	w8, 0x1297264 <__start_il2cpp+0xefaa0>
 129725c: 97f8a361     	bl	0x10bffe0 <CloseNLSocket+0x518>
 1297260: f9400280     	ldr	x0, [x20]
 1297264: f9405c08     	ldr	x8, [x0, #0xb8]
 1297268: f9400108     	ldr	x8, [x8]
 129726c: b4003b28     	cbz	x8, 0x12979d0 <__start_il2cpp+0xf020c>
 1297270: 39438109     	ldrb	w9, [x8, #0xe0]
 1297274: 35000269     	cbnz	w9, 0x12972c0 <__start_il2cpp+0xefafc>
 1297278: b940e009     	ldr	w9, [x0, #0xe0]
 129727c: 350000c9     	cbnz	w9, 0x1297294 <__start_il2cpp+0xefad0>
 1297280: 97f8a358     	bl	0x10bffe0 <CloseNLSocket+0x518>
 1297284: f9400280     	ldr	x0, [x20]
 1297288: f9405c08     	ldr	x8, [x0, #0xb8]
 129728c: f9400108     	ldr	x8, [x8]
 1297290: b4003a08     	cbz	x8, 0x12979d0 <__start_il2cpp+0xf020c>
 1297294: 3947dd09     	ldrb	w9, [x8, #0x1f7]
 1297298: 35000149     	cbnz	w9, 0x12972c0 <__start_il2cpp+0xefafc>
 129729c: b940e009     	ldr	w9, [x0, #0xe0]
 12972a0: 350000c9     	cbnz	w9, 0x12972b8 <__start_il2cpp+0xefaf4>
 12972a4: 97f8a34f     	bl	0x10bffe0 <CloseNLSocket+0x518>
 12972a8: f9400288     	ldr	x8, [x20]
 12972ac: f9405d08     	ldr	x8, [x8, #0xb8]
 12972b0: f9400108     	ldr	x8, [x8]
 12972b4: b40038e8     	cbz	x8, 0x12979d0 <__start_il2cpp+0xf020c>
 12972b8: 39437108     	ldrb	w8, [x8, #0xdc]
 12972bc: 34000108     	cbz	w8, 0x12972dc <__start_il2cpp+0xefb18>
 12972c0: a9444ff4     	ldp	x20, x19, [sp, #0x40]
 12972c4: a94357f6     	ldp	x22, x21, [sp, #0x30]
 12972c8: f94017fe     	ldr	x30, [sp, #0x28]
 12972cc: 6d41a3e9     	ldp	d9, d8, [sp, #0x18]
 12972d0: 6d40abeb     	ldp	d11, d10, [sp, #0x8]
 12972d4: fc4507ec     	ldr	d12, [sp], #0x50
 12972d8: d65f03c0     	ret
 12972dc: 39443668     	ldrb	w8, [x19, #0x10d]
 12972e0: 34000168     	cbz	w8, 0x129730c <__start_il2cpp+0xefb48>
 12972e4: bd411268     	ldr	s8, [x19, #0x110]
 12972e8: aa1f03e0     	mov	x0, xzr
 12972ec: 9448a059     	bl	0x24bf450 <__start_il2cpp+0x1317c8c>
 12972f0: 1e203900     	fsub	s0, s8, s0
 12972f4: 1e202008     	fcmp	s0, #0.0
 12972f8: bd011260     	str	s0, [x19, #0x110]
 12972fc: 54000088     	b.hi	0x129730c <__start_il2cpp+0xefb48>
 1297300: 1e2703e0     	fmov	s0, wzr
 1297304: aa1303e0     	mov	x0, x19
 1297308: 940001b4     	bl	0x12979d8 <__start_il2cpp+0xf0214>
 129730c: 3943e668     	ldrb	w8, [x19, #0xf9]
 1297310: 34000168     	cbz	w8, 0x129733c <__start_il2cpp+0xefb78>
 1297314: bd40fe68     	ldr	s8, [x19, #0xfc]
 1297318: aa1f03e0     	mov	x0, xzr
 129731c: 9448a04d     	bl	0x24bf450 <__start_il2cpp+0x1317c8c>
 1297320: 1e203900     	fsub	s0, s8, s0
 1297324: 1e202008     	fcmp	s0, #0.0
 1297328: bd00fe60     	str	s0, [x19, #0xfc]
 129732c: 54000088     	b.hi	0x129733c <__start_il2cpp+0xefb78>
 1297330: 1e2703e0     	fmov	s0, wzr
 1297334: aa1303e0     	mov	x0, x19
 1297338: 94000212     	bl	0x1297b80 <__start_il2cpp+0xf03bc>
 129733c: 39455268     	ldrb	w8, [x19, #0x154]
 1297340: 34000ea8     	cbz	w8, 0x1297514 <__start_il2cpp+0xefd50>
 1297344: 3945d268     	ldrb	w8, [x19, #0x174]
 1297348: 340000e8     	cbz	w8, 0x1297364 <__start_il2cpp+0xefba0>
 129734c: bd417a60     	ldr	s0, [x19, #0x178]
 1297350: 52a84908     	mov	w8, #0x42480000         // =1112014848
 1297354: 1e270101     	fmov	s1, w8
 1297358: 1e2c1008     	fmov	s8, #0.50000000
 129735c: 1e212000     	fcmp	s0, s1
 1297360: 540002a5     	b.pl	0x12973b4 <__start_il2cpp+0xefbf0>
 1297364: bd415a68     	ldr	s8, [x19, #0x158]
 1297368: aa1f03e0     	mov	x0, xzr
 129736c: 9448a039     	bl	0x24bf450 <__start_il2cpp+0x1317c8c>
 1297370: 1e203900     	fsub	s0, s8, s0
 1297374: aa1303e0     	mov	x0, x19
 1297378: bd015a60     	str	s0, [x19, #0x158]
 129737c: 97ffff47     	bl	0x1297098 <__start_il2cpp+0xef8d4>
 1297380: 4ea01c09     	mov	v9.16b, v0.16b
 1297384: bd415a60     	ldr	s0, [x19, #0x158]
 1297388: 1e209001     	fmov	s1, #2.50000000
 129738c: 1e2c1008     	fmov	s8, #0.50000000
 1297390: 1e212000     	fcmp	s0, s1
 1297394: 54000108     	b.hi	0x12973b4 <__start_il2cpp+0xefbf0>
 1297398: aa1f03e0     	mov	x0, xzr
 129739c: 9448a02d     	bl	0x24bf450 <__start_il2cpp+0x1317c8c>
 12973a0: 1e202800     	fadd	s0, s0, s0
 12973a4: 1e203928     	fsub	s8, s9, s0
 12973a8: 1e202108     	fcmp	s8, #0.0
 12973ac: 54000048     	b.hi	0x12973b4 <__start_il2cpp+0xefbf0>
 12973b0: 1e2c1008     	fmov	s8, #0.50000000
 12973b4: f9405a75     	ldr	x21, [x19, #0xb0]
 12973b8: b40030d5     	cbz	x21, 0x12979d0 <__start_il2cpp+0xf020c>
 12973bc: b9401aa8     	ldr	w8, [x21, #0x18]
 12973c0: 7100051f     	cmp	w8, #0x1
 12973c4: 5400046b     	b.lt	0x1297450 <__start_il2cpp+0xefc8c>
 12973c8: 2a1f03f6     	mov	w22, wzr
 12973cc: 6b0802df     	cmp	w22, w8
 12973d0: 54003022     	b.hs	0x12979d4 <__start_il2cpp+0xf0210>
 12973d4: 8b36cea8     	add	x8, x21, w22, sxtw #3
 12973d8: f9401114     	ldr	x20, [x8, #0x20]
 12973dc: b4002fb4     	cbz	x20, 0x12979d0 <__start_il2cpp+0xf020c>
 12973e0: aa1403e0     	mov	x0, x20
 12973e4: aa1f03e1     	mov	x1, xzr
 12973e8: 94481e27     	bl	0x249ec84 <__start_il2cpp+0x12f74c0>
 12973ec: b4002f20     	cbz	x0, 0x12979d0 <__start_il2cpp+0xf020c>
 12973f0: aa1f03e1     	mov	x1, xzr
 12973f4: 94482149     	bl	0x249f918 <__start_il2cpp+0x12f8154>
 12973f8: aa1f03e0     	mov	x0, xzr
 12973fc: 4ea01c09     	mov	v9.16b, v0.16b
 1297400: 4ea11c2a     	mov	v10.16b, v1.16b
 1297404: 9448a013     	bl	0x24bf450 <__start_il2cpp+0x1317c8c>
 1297408: aa1f03e0     	mov	x0, xzr
 129740c: 4ea01c0b     	mov	v11.16b, v0.16b
 1297410: 9448a010     	bl	0x24bf450 <__start_il2cpp+0x1317c8c>
 1297414: aa1403e0     	mov	x0, x20
 1297418: aa1f03e1     	mov	x1, xzr
 129741c: 4ea01c0c     	mov	v12.16b, v0.16b
 1297420: 94481e19     	bl	0x249ec84 <__start_il2cpp+0x12f74c0>
 1297424: b4002d60     	cbz	x0, 0x12979d0 <__start_il2cpp+0xf020c>
 1297428: 1e2c2980     	fadd	s0, s12, s12
 129742c: 1e2b2962     	fadd	s2, s11, s11
 1297430: 1e202941     	fadd	s1, s10, s0
 1297434: 1e222920     	fadd	s0, s9, s2
 1297438: aa1f03e1     	mov	x1, xzr
 129743c: 94482179     	bl	0x249fa20 <__start_il2cpp+0x12f825c>
 1297440: b9401aa8     	ldr	w8, [x21, #0x18]
 1297444: 110006d6     	add	w22, w22, #0x1
 1297448: 6b0802df     	cmp	w22, w8
 129744c: 54fffc0b     	b.lt	0x12973cc <__start_il2cpp+0xefc08>
 1297450: f9405e75     	ldr	x21, [x19, #0xb8]
 1297454: b4002bf5     	cbz	x21, 0x12979d0 <__start_il2cpp+0xf020c>
 1297458: b9401aa8     	ldr	w8, [x21, #0x18]
 129745c: 7100051f     	cmp	w8, #0x1
 1297460: 5400046b     	b.lt	0x12974ec <__start_il2cpp+0xefd28>
 1297464: 2a1f03f6     	mov	w22, wzr
 1297468: 6b0802df     	cmp	w22, w8
 129746c: 54002b42     	b.hs	0x12979d4 <__start_il2cpp+0xf0210>
 1297470: 8b36cea8     	add	x8, x21, w22, sxtw #3
 1297474: f9401114     	ldr	x20, [x8, #0x20]
 1297478: b4002ad4     	cbz	x20, 0x12979d0 <__start_il2cpp+0xf020c>
 129747c: aa1403e0     	mov	x0, x20
 1297480: aa1f03e1     	mov	x1, xzr
 1297484: 94481e00     	bl	0x249ec84 <__start_il2cpp+0x12f74c0>
 1297488: b4002a40     	cbz	x0, 0x12979d0 <__start_il2cpp+0xf020c>
 129748c: aa1f03e1     	mov	x1, xzr
 1297490: 94482122     	bl	0x249f918 <__start_il2cpp+0x12f8154>
 1297494: aa1f03e0     	mov	x0, xzr
 1297498: 4ea01c09     	mov	v9.16b, v0.16b
 129749c: 4ea11c2a     	mov	v10.16b, v1.16b
 12974a0: 94489fec     	bl	0x24bf450 <__start_il2cpp+0x1317c8c>
 12974a4: aa1f03e0     	mov	x0, xzr
 12974a8: 4ea01c0b     	mov	v11.16b, v0.16b
 12974ac: 94489fe9     	bl	0x24bf450 <__start_il2cpp+0x1317c8c>
 12974b0: aa1403e0     	mov	x0, x20
 12974b4: aa1f03e1     	mov	x1, xzr
 12974b8: 4ea01c0c     	mov	v12.16b, v0.16b
 12974bc: 94481df2     	bl	0x249ec84 <__start_il2cpp+0x12f74c0>
 12974c0: b4002880     	cbz	x0, 0x12979d0 <__start_il2cpp+0xf020c>
 12974c4: 1e2c2980     	fadd	s0, s12, s12
 12974c8: 1e2b2962     	fadd	s2, s11, s11
 12974cc: 1e202941     	fadd	s1, s10, s0
 12974d0: 1e222920     	fadd	s0, s9, s2
 12974d4: aa1f03e1     	mov	x1, xzr
 12974d8: 94482152     	bl	0x249fa20 <__start_il2cpp+0x12f825c>
 12974dc: b9401aa8     	ldr	w8, [x21, #0x18]
 12974e0: 110006d6     	add	w22, w22, #0x1
 12974e4: 6b0802df     	cmp	w22, w8
 12974e8: 54fffc0b     	b.lt	0x1297468 <__start_il2cpp+0xefca4>
 12974ec: bd415a60     	ldr	s0, [x19, #0x158]
 12974f0: 1e202008     	fcmp	s0, #0.0
 12974f4: 54000128     	b.hi	0x1297518 <__start_il2cpp+0xefd54>
 12974f8: aa1303e0     	mov	x0, x19
 12974fc: 3905527f     	strb	wzr, [x19, #0x154]
 1297500: 940001de     	bl	0x1297c78 <__start_il2cpp+0xf04b4>
 1297504: 3945d268     	ldrb	w8, [x19, #0x174]
 1297508: 34000088     	cbz	w8, 0x1297518 <__start_il2cpp+0xefd54>
 129750c: 7902ea7f     	strh	wzr, [x19, #0x174]
 1297510: 14000002     	b	0x1297518 <__start_il2cpp+0xefd54>
 1297514: 1e2e1008     	fmov	s8, #1.00000000
 1297518: aa1303e0     	mov	x0, x19
 129751c: 4ea81d00     	mov	v0.16b, v8.16b
 1297520: 97fffe71     	bl	0x1296ee4 <__start_il2cpp+0xef720>
 1297524: 39458668     	ldrb	w8, [x19, #0x161]
 1297528: 34000208     	cbz	w8, 0x1297568 <__start_il2cpp+0xefda4>
 129752c: 39458268     	ldrb	w8, [x19, #0x160]
 1297530: 35000408     	cbnz	w8, 0x12975b0 <__start_il2cpp+0xefdec>
 1297534: bd416668     	ldr	s8, [x19, #0x164]
 1297538: aa1f03e0     	mov	x0, xzr
 129753c: 94489fc5     	bl	0x24bf450 <__start_il2cpp+0x1317c8c>
 1297540: 1e203900     	fsub	s0, s8, s0
 1297544: 1e202008     	fcmp	s0, #0.0
 1297548: bd016660     	str	s0, [x19, #0x164]
 129754c: 540000c9     	b.ls	0x1297564 <__start_il2cpp+0xefda0>
 1297550: 39458668     	ldrb	w8, [x19, #0x161]
 1297554: 340000a8     	cbz	w8, 0x1297568 <__start_il2cpp+0xefda4>
 1297558: 39458268     	ldrb	w8, [x19, #0x160]
 129755c: 350002a8     	cbnz	w8, 0x12975b0 <__start_il2cpp+0xefdec>
 1297560: 14000002     	b	0x1297568 <__start_il2cpp+0xefda4>
 1297564: 7902c27f     	strh	wzr, [x19, #0x160]
 1297568: bd416a68     	ldr	s8, [x19, #0x168]
 129756c: 1e202108     	fcmp	s8, #0.0
 1297570: 5400020d     	b.le	0x12975b0 <__start_il2cpp+0xefdec>
 1297574: aa1f03e0     	mov	x0, xzr
 1297578: 94489fb6     	bl	0x24bf450 <__start_il2cpp+0x1317c8c>
 129757c: 1e203900     	fsub	s0, s8, s0
 1297580: 1e202008     	fcmp	s0, #0.0
 1297584: bd016a60     	str	s0, [x19, #0x168]
 1297588: 54000148     	b.hi	0x12975b0 <__start_il2cpp+0xefdec>
 129758c: b9415e68     	ldr	w8, [x19, #0x15c]
 1297590: b9016a7f     	str	wzr, [x19, #0x168]
 1297594: 7100051f     	cmp	w8, #0x1
 1297598: 540000cb     	b.lt	0x12975b0 <__start_il2cpp+0xefdec>
 129759c: f940de60     	ldr	x0, [x19, #0x1b8]
 12975a0: b4002180     	cbz	x0, 0x12979d0 <__start_il2cpp+0xf020c>
 12975a4: 1e2e1000     	fmov	s0, #1.00000000
 12975a8: 528002a1     	mov	w1, #0x15               // =21
 12975ac: 97fff804     	bl	0x12955bc <__start_il2cpp+0xeddf8>
 12975b0: 3945b268     	ldrb	w8, [x19, #0x16c]
 12975b4: 34000128     	cbz	w8, 0x12975d8 <__start_il2cpp+0xefe14>
 12975b8: bd417268     	ldr	s8, [x19, #0x170]
 12975bc: aa1f03e0     	mov	x0, xzr
 12975c0: 94489fa4     	bl	0x24bf450 <__start_il2cpp+0x1317c8c>
 12975c4: 1e203900     	fsub	s0, s8, s0
 12975c8: 1e202008     	fcmp	s0, #0.0
 12975cc: bd017260     	str	s0, [x19, #0x170]
 12975d0: 54000048     	b.hi	0x12975d8 <__start_il2cpp+0xefe14>
 12975d4: 3905b27f     	strb	wzr, [x19, #0x16c]
 12975d8: bd418668     	ldr	s8, [x19, #0x184]
 12975dc: aa1f03e0     	mov	x0, xzr
 12975e0: 94489f9c     	bl	0x24bf450 <__start_il2cpp+0x1317c8c>
 12975e4: 1e202900     	fadd	s0, s8, s0
 12975e8: bd018660     	str	s0, [x19, #0x184]
 12975ec: d000bcf4     	adrp	x20, 0x2a35000
 12975f0: 3964d288     	ldrb	w8, [x20, #0x934]
 12975f4: 350000c8     	cbnz	w8, 0x129760c <__start_il2cpp+0xefe48>
 12975f8: d000ae20     	adrp	x0, 0x285d000
 12975fc: f9474800     	ldr	x0, [x0, #0xe90]
 1297600: 97f8a236     	bl	0x10bfed8 <CloseNLSocket+0x410>
 1297604: 52800028     	mov	w8, #0x1                // =1
 1297608: 3924d288     	strb	w8, [x20, #0x934]
 129760c: d000ae28     	adrp	x8, 0x285d000
 1297610: f9474908     	ldr	x8, [x8, #0xe90]
 1297614: 52a86f49     	mov	w9, #0x437a0000         // =1132068864
 1297618: 1e270123     	fmov	s3, w9
 129761c: aa1303e0     	mov	x0, x19
 1297620: f9400108     	ldr	x8, [x8]
 1297624: aa1f03e1     	mov	x1, xzr
 1297628: f9405d08     	ldr	x8, [x8, #0xb8]
 129762c: 2d448500     	ldp	s0, s1, [x8, #0x24]
 1297630: bd402d02     	ldr	s2, [x8, #0x2c]
 1297634: 1e230800     	fmul	s0, s0, s3
 1297638: 1e230821     	fmul	s1, s1, s3
 129763c: 1e230842     	fmul	s2, s2, s3
 1297640: 940124ab     	bl	0x12e08ec <__start_il2cpp+0x139128>
 1297644: aa1303e0     	mov	x0, x19
 1297648: 940001fe     	bl	0x1297e40 <__start_il2cpp+0xf067c>
 129764c: 3944c275     	ldrb	w21, [x19, #0x130]
 1297650: aa1303e0     	mov	x0, x19
 1297654: aa1f03e1     	mov	x1, xzr
 1297658: 94487aad     	bl	0x24b610c <__start_il2cpp+0x130e948>
 129765c: b4001ba0     	cbz	x0, 0x12979d0 <__start_il2cpp+0xf020c>
 1297660: aa1f03e1     	mov	x1, xzr
 1297664: 9448ac04     	bl	0x24c2674 <__start_il2cpp+0x131aeb0>
 1297668: 3944c668     	ldrb	w8, [x19, #0x131]
 129766c: 4ea11c28     	mov	v8.16b, v1.16b
 1297670: 34000a68     	cbz	w8, 0x12977bc <__start_il2cpp+0xefff8>
 1297674: 3943c268     	ldrb	w8, [x19, #0xf0]
 1297678: bd413660     	ldr	s0, [x19, #0x134]
 129767c: 340009c8     	cbz	w8, 0x12977b4 <__start_il2cpp+0xefff0>
 1297680: 1e202100     	fcmp	s8, s0
 1297684: 540009c8     	b.hi	0x12977bc <__start_il2cpp+0xefff8>
 1297688: 1e331001     	fmov	s1, #-6.00000000
 129768c: 1e212800     	fadd	s0, s0, s1
 1297690: 1e202100     	fcmp	s8, s0
 1297694: 5400094b     	b.lt	0x12977bc <__start_il2cpp+0xefff8>
 1297698: 3943e269     	ldrb	w9, [x19, #0xf8]
 129769c: 340001a9     	cbz	w9, 0x12976d0 <__start_il2cpp+0xeff0c>
 12976a0: f940de60     	ldr	x0, [x19, #0x1b8]
 12976a4: b4001960     	cbz	x0, 0x12979d0 <__start_il2cpp+0xf020c>
 12976a8: 1e2e1000     	fmov	s0, #1.00000000
 12976ac: 528001c1     	mov	w1, #0xe                // =14
 12976b0: 97fff7c3     	bl	0x12955bc <__start_il2cpp+0xeddf8>
 12976b4: f9406a60     	ldr	x0, [x19, #0xd0]
 12976b8: b40018c0     	cbz	x0, 0x12979d0 <__start_il2cpp+0xf020c>
 12976bc: 52800021     	mov	w1, #0x1                // =1
 12976c0: aa1f03e2     	mov	x2, xzr
 12976c4: 944877f3     	bl	0x24b5690 <__start_il2cpp+0x130decc>
 12976c8: 3943c268     	ldrb	w8, [x19, #0xf0]
 12976cc: 3903e27f     	strb	wzr, [x19, #0xf8]
 12976d0: 34000168     	cbz	w8, 0x12976fc <__start_il2cpp+0xeff38>
 12976d4: bd413660     	ldr	s0, [x19, #0x134]
 12976d8: 1e301001     	fmov	s1, #-2.00000000
 12976dc: 1e212800     	fadd	s0, s0, s1
 12976e0: 1e202100     	fcmp	s8, s0
 12976e4: 540000c5     	b.pl	0x12976fc <__start_il2cpp+0xeff38>
 12976e8: 39455268     	ldrb	w8, [x19, #0x154]
 12976ec: 35000088     	cbnz	w8, 0x12976fc <__start_il2cpp+0xeff38>
 12976f0: 1e2703e0     	fmov	s0, wzr
 12976f4: aa1303e0     	mov	x0, x19
 12976f8: 940000b8     	bl	0x12979d8 <__start_il2cpp+0xf0214>
 12976fc: 3944ca68     	ldrb	w8, [x19, #0x132]
 1297700: 340001e8     	cbz	w8, 0x129773c <__start_il2cpp+0xeff78>
 1297704: bd413660     	ldr	s0, [x19, #0x134]
 1297708: 1e331001     	fmov	s1, #-6.00000000
 129770c: 1e212801     	fadd	s1, s0, s1
 1297710: 1e212100     	fcmp	s8, s1
 1297714: 5400014b     	b.lt	0x129773c <__start_il2cpp+0xeff78>
 1297718: 1e301001     	fmov	s1, #-2.00000000
 129771c: 1e212800     	fadd	s0, s0, s1
 1297720: 1e202100     	fcmp	s8, s0
 1297724: 540000c5     	b.pl	0x129773c <__start_il2cpp+0xeff78>
 1297728: 39455268     	ldrb	w8, [x19, #0x154]
 129772c: 35000088     	cbnz	w8, 0x129773c <__start_il2cpp+0xeff78>
 1297730: 1e2703e0     	fmov	s0, wzr
 1297734: aa1303e0     	mov	x0, x19
 1297738: 940000a8     	bl	0x12979d8 <__start_il2cpp+0xf0214>
 129773c: aa1303e0     	mov	x0, x19
 1297740: aa1f03e1     	mov	x1, xzr
 1297744: 94487a72     	bl	0x24b610c <__start_il2cpp+0x130e948>
 1297748: aa0003f4     	mov	x20, x0
 129774c: aa1303e0     	mov	x0, x19
 1297750: aa1f03e1     	mov	x1, xzr
 1297754: 94487a6e     	bl	0x24b610c <__start_il2cpp+0x130e948>
 1297758: b40013c0     	cbz	x0, 0x12979d0 <__start_il2cpp+0xf020c>
 129775c: aa1f03e1     	mov	x1, xzr
 1297760: 9448abc5     	bl	0x24c2674 <__start_il2cpp+0x131aeb0>
 1297764: bd413668     	ldr	s8, [x19, #0x134]
 1297768: aa1303e0     	mov	x0, x19
 129776c: aa1f03e1     	mov	x1, xzr
 1297770: 4ea01c09     	mov	v9.16b, v0.16b
 1297774: 94487a66     	bl	0x24b610c <__start_il2cpp+0x130e948>
 1297778: b40012c0     	cbz	x0, 0x12979d0 <__start_il2cpp+0xf020c>
 129777c: aa1f03e1     	mov	x1, xzr
 1297780: 9448abbd     	bl	0x24c2674 <__start_il2cpp+0x131aeb0>
 1297784: b4001274     	cbz	x20, 0x12979d0 <__start_il2cpp+0xf020c>
 1297788: aa1403e0     	mov	x0, x20
 129778c: 4ea91d20     	mov	v0.16b, v9.16b
 1297790: 4ea81d01     	mov	v1.16b, v8.16b
 1297794: aa1f03e1     	mov	x1, xzr
 1297798: 9448abdf     	bl	0x24c2714 <__start_il2cpp+0x131af50>
 129779c: bd413668     	ldr	s8, [x19, #0x134]
 12977a0: 52800028     	mov	w8, #0x1                // =1
 12977a4: b9003a7f     	str	wzr, [x19, #0x38]
 12977a8: 3904c268     	strb	w8, [x19, #0x130]
 12977ac: 3904ca7f     	strb	wzr, [x19, #0x132]
 12977b0: 14000004     	b	0x12977c0 <__start_il2cpp+0xefffc>
 12977b4: 1e202100     	fcmp	s8, s0
 12977b8: 54fff709     	b.ls	0x1297698 <__start_il2cpp+0xefed4>
 12977bc: 3904c27f     	strb	wzr, [x19, #0x130]
 12977c0: f9406660     	ldr	x0, [x19, #0xc8]
 12977c4: b4001060     	cbz	x0, 0x12979d0 <__start_il2cpp+0xf020c>
 12977c8: 3944c661     	ldrb	w1, [x19, #0x131]
 12977cc: aa1f03e2     	mov	x2, xzr
 12977d0: 944877b0     	bl	0x24b5690 <__start_il2cpp+0x130decc>
 12977d4: 3944c668     	ldrb	w8, [x19, #0x131]
 12977d8: 34000228     	cbz	w8, 0x129781c <__start_il2cpp+0xf0058>
 12977dc: f9406274     	ldr	x20, [x19, #0xc0]
 12977e0: b4000f94     	cbz	x20, 0x12979d0 <__start_il2cpp+0xf020c>
 12977e4: aa1403e0     	mov	x0, x20
 12977e8: aa1f03e1     	mov	x1, xzr
 12977ec: 9448aba2     	bl	0x24c2674 <__start_il2cpp+0x131aeb0>
 12977f0: f9406260     	ldr	x0, [x19, #0xc0]
 12977f4: b4000ee0     	cbz	x0, 0x12979d0 <__start_il2cpp+0xf020c>
 12977f8: bd41366a     	ldr	s10, [x19, #0x134]
 12977fc: aa1f03e1     	mov	x1, xzr
 1297800: 4ea01c09     	mov	v9.16b, v0.16b
 1297804: 9448ab9c     	bl	0x24c2674 <__start_il2cpp+0x131aeb0>
 1297808: aa1403e0     	mov	x0, x20
 129780c: 4ea91d20     	mov	v0.16b, v9.16b
 1297810: 4eaa1d41     	mov	v1.16b, v10.16b
 1297814: aa1f03e1     	mov	x1, xzr
 1297818: 9448abbf     	bl	0x24c2714 <__start_il2cpp+0x131af50>
 129781c: bd413660     	ldr	s0, [x19, #0x134]
 1297820: 1e202100     	fcmp	s8, s0
 1297824: 54000225     	b.pl	0x1297868 <__start_il2cpp+0xf00a4>
 1297828: bd40f669     	ldr	s9, [x19, #0xf4]
 129782c: aa1f03e0     	mov	x0, xzr
 1297830: 94489f08     	bl	0x24bf450 <__start_il2cpp+0x1317c8c>
 1297834: 3943c268     	ldrb	w8, [x19, #0xf0]
 1297838: 1e202920     	fadd	s0, s9, s0
 129783c: bd00f660     	str	s0, [x19, #0xf4]
 1297840: 34000188     	cbz	w8, 0x1297870 <__start_il2cpp+0xf00ac>
 1297844: 1e2a1001     	fmov	s1, #0.25000000
 1297848: 1e212000     	fcmp	s0, s1
 129784c: 5400018d     	b.le	0x129787c <__start_il2cpp+0xf00b8>
 1297850: f940de60     	ldr	x0, [x19, #0x1b8]
 1297854: b4000be0     	cbz	x0, 0x12979d0 <__start_il2cpp+0xf020c>
 1297858: 1e2e1000     	fmov	s0, #1.00000000
 129785c: 528002e1     	mov	w1, #0x17               // =23
 1297860: 97fff757     	bl	0x12955bc <__start_il2cpp+0xeddf8>
 1297864: 14000006     	b	0x129787c <__start_il2cpp+0xf00b8>
 1297868: 3903c27f     	strb	wzr, [x19, #0xf0]
 129786c: 14000004     	b	0x129787c <__start_il2cpp+0xf00b8>
 1297870: 52800028     	mov	w8, #0x1                // =1
 1297874: b900f67f     	str	wzr, [x19, #0xf4]
 1297878: 3903c268     	strb	w8, [x19, #0xf0]
 129787c: 39440268     	ldrb	w8, [x19, #0x100]
 1297880: 34000388     	cbz	w8, 0x12978f0 <__start_il2cpp+0xf012c>
 1297884: bd410669     	ldr	s9, [x19, #0x104]
 1297888: aa1f03e0     	mov	x0, xzr
 129788c: 94489ef1     	bl	0x24bf450 <__start_il2cpp+0x1317c8c>
 1297890: f9406a60     	ldr	x0, [x19, #0xd0]
 1297894: 1e202920     	fadd	s0, s9, s0
 1297898: bd010660     	str	s0, [x19, #0x104]
 129789c: b40009a0     	cbz	x0, 0x12979d0 <__start_il2cpp+0xf020c>
 12978a0: 52800021     	mov	w1, #0x1                // =1
 12978a4: aa1f03e2     	mov	x2, xzr
 12978a8: 9448777a     	bl	0x24b5690 <__start_il2cpp+0x130decc>
 12978ac: bd410660     	ldr	s0, [x19, #0x104]
 12978b0: bd410a61     	ldr	s1, [x19, #0x108]
 12978b4: 1e212000     	fcmp	s0, s1
 12978b8: 540001cd     	b.le	0x12978f0 <__start_il2cpp+0xf012c>
 12978bc: f940de60     	ldr	x0, [x19, #0x1b8]
 12978c0: 3904027f     	strb	wzr, [x19, #0x100]
 12978c4: b4000860     	cbz	x0, 0x12979d0 <__start_il2cpp+0xf020c>
 12978c8: 1e2e1000     	fmov	s0, #1.00000000
 12978cc: 52800361     	mov	w1, #0x1b               // =27
 12978d0: 97fff73b     	bl	0x12955bc <__start_il2cpp+0xeddf8>
 12978d4: f9405260     	ldr	x0, [x19, #0xa0]
 12978d8: b40007c0     	cbz	x0, 0x12979d0 <__start_il2cpp+0xf020c>
 12978dc: 9000ae68     	adrp	x8, 0x2863000
 12978e0: f946c508     	ldr	x8, [x8, #0xd88]
 12978e4: aa1f03e2     	mov	x2, xzr
 12978e8: f9400101     	ldr	x1, [x8]
 12978ec: 9447d598     	bl	0x248cf4c <__start_il2cpp+0x12e5788>
 12978f0: 350001d5     	cbnz	w21, 0x1297928 <__start_il2cpp+0xf0164>
 12978f4: 3944c268     	ldrb	w8, [x19, #0x130]
 12978f8: 34000188     	cbz	w8, 0x1297928 <__start_il2cpp+0xf0164>
 12978fc: 39443268     	ldrb	w8, [x19, #0x10c]
 1297900: 35000148     	cbnz	w8, 0x1297928 <__start_il2cpp+0xf0164>
 1297904: 39440268     	ldrb	w8, [x19, #0x100]
 1297908: 35000108     	cbnz	w8, 0x1297928 <__start_il2cpp+0xf0164>
 129790c: f9405260     	ldr	x0, [x19, #0xa0]
 1297910: b4000600     	cbz	x0, 0x12979d0 <__start_il2cpp+0xf020c>
 1297914: 9000ae68     	adrp	x8, 0x2863000
 1297918: f946c508     	ldr	x8, [x8, #0xd88]
 129791c: aa1f03e2     	mov	x2, xzr
 1297920: f9400101     	ldr	x1, [x8]
 1297924: 9447d58a     	bl	0x248cf4c <__start_il2cpp+0x12e5788>
 1297928: 39443268     	ldrb	w8, [x19, #0x10c]
 129792c: 34000148     	cbz	w8, 0x1297954 <__start_il2cpp+0xf0190>
 1297930: bd411669     	ldr	s9, [x19, #0x114]
 1297934: aa1f03e0     	mov	x0, xzr
 1297938: 94489ec6     	bl	0x24bf450 <__start_il2cpp+0x1317c8c>
 129793c: bd411a61     	ldr	s1, [x19, #0x118]
 1297940: 1e202920     	fadd	s0, s9, s0
 1297944: bd011660     	str	s0, [x19, #0x114]
 1297948: 1e212000     	fcmp	s0, s1
 129794c: 5400004d     	b.le	0x1297954 <__start_il2cpp+0xf0190>
 1297950: 3904327f     	strb	wzr, [x19, #0x10c]
 1297954: bd411e69     	ldr	s9, [x19, #0x11c]
 1297958: aa1f03e0     	mov	x0, xzr
 129795c: 94489ebd     	bl	0x24bf450 <__start_il2cpp+0x1317c8c>
 1297960: 39449668     	ldrb	w8, [x19, #0x125]
 1297964: 1e202920     	fadd	s0, s9, s0
 1297968: bd011e60     	str	s0, [x19, #0x11c]
 129796c: 34000148     	cbz	w8, 0x1297994 <__start_il2cpp+0xf01d0>
 1297970: bd412a69     	ldr	s9, [x19, #0x128]
 1297974: aa1f03e0     	mov	x0, xzr
 1297978: 94489eb6     	bl	0x24bf450 <__start_il2cpp+0x1317c8c>
 129797c: bd412e61     	ldr	s1, [x19, #0x12c]
 1297980: 1e202920     	fadd	s0, s9, s0
 1297984: bd012a60     	str	s0, [x19, #0x128]
 1297988: 1e212000     	fcmp	s0, s1
 129798c: 5400004d     	b.le	0x1297994 <__start_il2cpp+0xf01d0>
 1297990: 3904967f     	strb	wzr, [x19, #0x125]
 1297994: 52b84188     	mov	w8, #-0x3df40000        // =-1039400960
 1297998: 1e270100     	fmov	s0, w8
 129799c: 1e202100     	fcmp	s8, s0
 12979a0: 54000085     	b.pl	0x12979b0 <__start_il2cpp+0xf01ec>
 12979a4: 52800021     	mov	w1, #0x1                // =1
 12979a8: aa1303e0     	mov	x0, x19
 12979ac: 94000141     	bl	0x1297eb0 <__start_il2cpp+0xf06ec>
 12979b0: aa1303e0     	mov	x0, x19
 12979b4: a9444ff4     	ldp	x20, x19, [sp, #0x40]
 12979b8: a94357f6     	ldp	x22, x21, [sp, #0x30]
 12979bc: f94017fe     	ldr	x30, [sp, #0x28]
 12979c0: 6d41a3e9     	ldp	d9, d8, [sp, #0x18]
 12979c4: 6d40abeb     	ldp	d11, d10, [sp, #0x8]
 12979c8: fc4507ec     	ldr	d12, [sp], #0x50
 12979cc: 14000167     	b	0x1297f68 <__start_il2cpp+0xf07a4>
 12979d0: 97f8a1cc     	bl	0x10c0100 <CloseNLSocket+0x638>
 12979d4: 97f8a1cd     	bl	0x10c0108 <CloseNLSocket+0x640>
