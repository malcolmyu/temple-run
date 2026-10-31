
/tmp/temple-libil2cpp.so:	file format elf64-littleaarch64

Disassembly of section il2cpp:

00000000011a77c4 <__start_il2cpp>:
 12751a8: f94002e0     	ldr	x0, [x23]
 12751ac: b4012140     	cbz	x0, 0x12775d4 <__start_il2cpp+0xcfe10>
 12751b0: b000af73     	adrp	x19, 0x2862000
 12751b4: f9448673     	ldr	x19, [x19, #0x908]
 12751b8: 2a1403e1     	mov	w1, w20
 12751bc: aa1f03e3     	mov	x3, xzr
 12751c0: f9400262     	ldr	x2, [x19]
 12751c4: 94005f5c     	bl	0x128cf34 <__start_il2cpp+0xe5770>
 12751c8: 52a85908     	mov	w8, #0x42c80000         // =1120403456
 12751cc: 1e270101     	fmov	s1, w8
 12751d0: 1e212000     	fcmp	s0, s1
 12751d4: 540005c5     	b.pl	0x127528c <__start_il2cpp+0xcdac8>
 12751d8: f9403b88     	ldr	x8, [x28, #0x70]
 12751dc: b4011fc8     	cbz	x8, 0x12775d4 <__start_il2cpp+0xcfe10>
 12751e0: bd414500     	ldr	s0, [x8, #0x144]
 12751e4: 1e229001     	fmov	s1, #5.00000000
 12751e8: 52a85908     	mov	w8, #0x42c80000         // =1120403456
 12751ec: 5e21d800     	scvtf	s0, s0
 12751f0: 1e211800     	fdiv	s0, s0, s1
 12751f4: 1e270101     	fmov	s1, w8
 12751f8: 1e210800     	fmul	s0, s0, s1
 12751fc: 1e212000     	fcmp	s0, s1
 1275200: 540003ab     	b.lt	0x1275274 <__start_il2cpp+0xcdab0>
 1275204: f9400300     	ldr	x0, [x24]
 1275208: b4011e60     	cbz	x0, 0x12775d4 <__start_il2cpp+0xcfe10>
 127520c: f000af29     	adrp	x9, 0x285c000 <_ZTVN10__cxxabiv119__pointer_type_infoE+0x18>
 1275210: f9400261     	ldr	x1, [x19]
 1275214: f947a529     	ldr	x9, [x9, #0xf48]
 1275218: b9401c0a     	ldr	w10, [x0, #0x1c]
 127521c: f9400808     	ldr	x8, [x0, #0x10]
 1275220: f9400129     	ldr	x9, [x9]
 1275224: 1100054a     	add	w10, w10, #0x1
 1275228: b9001c0a     	str	w10, [x0, #0x1c]
 127522c: b4011d48     	cbz	x8, 0x12775d4 <__start_il2cpp+0xcfe10>
 1275230: b980180a     	ldrsw	x10, [x0, #0x18]
 1275234: b940190b     	ldr	w11, [x8, #0x18]
 1275238: 6b0b015f     	cmp	w10, w11
 127523c: 54000102     	b.hs	0x127525c <__start_il2cpp+0xcda98>
 1275240: 11000549     	add	w9, w10, #0x1
 1275244: 8b0a0d08     	add	x8, x8, x10, lsl #3
 1275248: 52a8590a     	mov	w10, #0x42c80000        // =1120403456
 127524c: b9001809     	str	w9, [x0, #0x18]
 1275250: f9001101     	str	x1, [x8, #0x20]
 1275254: 1e270140     	fmov	s0, w10
 1275258: 14000007     	b	0x1275274 <__start_il2cpp+0xcdab0>
 127525c: f9401128     	ldr	x8, [x9, #0x20]
 1275260: f9406108     	ldr	x8, [x8, #0xc0]
 1275264: f9403902     	ldr	x2, [x8, #0x70]
 1275268: 941a146b     	bl	0x18fa414 <__start_il2cpp+0x752c50>
 127526c: 52a85908     	mov	w8, #0x42c80000         // =1120403456
 1275270: 1e270100     	fmov	s0, w8
 1275274: f94002e0     	ldr	x0, [x23]
 1275278: b4011ae0     	cbz	x0, 0x12775d4 <__start_il2cpp+0xcfe10>
 127527c: f9400262     	ldr	x2, [x19]
 1275280: 2a1403e1     	mov	w1, w20
 1275284: aa1f03e3     	mov	x3, xzr
 1275288: 94005f33     	bl	0x128cf54 <__start_il2cpp+0xe5790>
 127528c: f94002e0     	ldr	x0, [x23]
 1275290: b4011a20     	cbz	x0, 0x12775d4 <__start_il2cpp+0xcfe10>
 1275294: b000af73     	adrp	x19, 0x2862000
 1275298: f9447673     	ldr	x19, [x19, #0x8e8]
 127529c: 2a1403e1     	mov	w1, w20
 12752a0: aa1f03e3     	mov	x3, xzr
 12752a4: f9400262     	ldr	x2, [x19]
 12752a8: 94005f23     	bl	0x128cf34 <__start_il2cpp+0xe5770>
 12752ac: 52a85908     	mov	w8, #0x42c80000         // =1120403456
 12752b0: 1e270101     	fmov	s1, w8
 12752b4: 1e212000     	fcmp	s0, s1
 12752b8: 54000545     	b.pl	0x1275360 <__start_il2cpp+0xcdb9c>
 12752bc: bd40f380     	ldr	s0, [x28, #0xf0]
 12752c0: 52a85908     	mov	w8, #0x42c80000         // =1120403456
 12752c4: 1e270101     	fmov	s1, w8
 12752c8: 5e21d800     	scvtf	s0, s0
 12752cc: 1e210800     	fmul	s0, s0, s1
 12752d0: 1e212000     	fcmp	s0, s1
 12752d4: 540003ab     	b.lt	0x1275348 <__start_il2cpp+0xcdb84>
 12752d8: f9400300     	ldr	x0, [x24]
 12752dc: b40117c0     	cbz	x0, 0x12775d4 <__start_il2cpp+0xcfe10>
 12752e0: f000af29     	adrp	x9, 0x285c000 <_ZTVN10__cxxabiv119__pointer_type_infoE+0x18>
 12752e4: f9400261     	ldr	x1, [x19]
 12752e8: f947a529     	ldr	x9, [x9, #0xf48]
 12752ec: b9401c0a     	ldr	w10, [x0, #0x1c]
 12752f0: f9400808     	ldr	x8, [x0, #0x10]
 12752f4: f9400129     	ldr	x9, [x9]
 12752f8: 1100054a     	add	w10, w10, #0x1
 12752fc: b9001c0a     	str	w10, [x0, #0x1c]
 1275300: b40116a8     	cbz	x8, 0x12775d4 <__start_il2cpp+0xcfe10>
 1275304: b980180a     	ldrsw	x10, [x0, #0x18]
 1275308: b940190b     	ldr	w11, [x8, #0x18]
 127530c: 6b0b015f     	cmp	w10, w11
 1275310: 54000102     	b.hs	0x1275330 <__start_il2cpp+0xcdb6c>
 1275314: 11000549     	add	w9, w10, #0x1
 1275318: 8b0a0d08     	add	x8, x8, x10, lsl #3
 127531c: 52a8590a     	mov	w10, #0x42c80000        // =1120403456
 1275320: b9001809     	str	w9, [x0, #0x18]
 1275324: f9001101     	str	x1, [x8, #0x20]
 1275328: 1e270140     	fmov	s0, w10
 127532c: 14000007     	b	0x1275348 <__start_il2cpp+0xcdb84>
 1275330: f9401128     	ldr	x8, [x9, #0x20]
 1275334: f9406108     	ldr	x8, [x8, #0xc0]
 1275338: f9403902     	ldr	x2, [x8, #0x70]
 127533c: 941a1436     	bl	0x18fa414 <__start_il2cpp+0x752c50>
 1275340: 52a85908     	mov	w8, #0x42c80000         // =1120403456
 1275344: 1e270100     	fmov	s0, w8
 1275348: f94002e0     	ldr	x0, [x23]
 127534c: b4011440     	cbz	x0, 0x12775d4 <__start_il2cpp+0xcfe10>
 1275350: f9400262     	ldr	x2, [x19]
 1275354: 2a1403e1     	mov	w1, w20
 1275358: aa1f03e3     	mov	x3, xzr
 127535c: 94005efe     	bl	0x128cf54 <__start_il2cpp+0xe5790>
 1275360: f94002e0     	ldr	x0, [x23]
 1275364: b4011380     	cbz	x0, 0x12775d4 <__start_il2cpp+0xcfe10>
 1275368: b000af73     	adrp	x19, 0x2862000
 127536c: f9446a73     	ldr	x19, [x19, #0x8d0]
 1275370: 2a1403e1     	mov	w1, w20
 1275374: aa1f03e3     	mov	x3, xzr
 1275378: f9400262     	ldr	x2, [x19]
 127537c: 94005eee     	bl	0x128cf34 <__start_il2cpp+0xe5770>
 1275380: 52a85908     	mov	w8, #0x42c80000         // =1120403456
 1275384: 1e270101     	fmov	s1, w8
 1275388: 1e212000     	fcmp	s0, s1
 127538c: 54000585     	b.pl	0x127543c <__start_il2cpp+0xcdc78>
 1275390: bd40f380     	ldr	s0, [x28, #0xf0]
 1275394: 1e2c1001     	fmov	s1, #0.50000000
 1275398: 52a85908     	mov	w8, #0x42c80000         // =1120403456
 127539c: 5e21d800     	scvtf	s0, s0
 12753a0: 1e210800     	fmul	s0, s0, s1
 12753a4: 1e270101     	fmov	s1, w8
 12753a8: 1e210800     	fmul	s0, s0, s1
 12753ac: 1e212000     	fcmp	s0, s1
 12753b0: 540003ab     	b.lt	0x1275424 <__start_il2cpp+0xcdc60>
 12753b4: f9400300     	ldr	x0, [x24]
 12753b8: b40110e0     	cbz	x0, 0x12775d4 <__start_il2cpp+0xcfe10>
 12753bc: f000af29     	adrp	x9, 0x285c000 <_ZTVN10__cxxabiv119__pointer_type_infoE+0x18>
 12753c0: f9400261     	ldr	x1, [x19]
 12753c4: f947a529     	ldr	x9, [x9, #0xf48]
 12753c8: b9401c0a     	ldr	w10, [x0, #0x1c]
 12753cc: f9400808     	ldr	x8, [x0, #0x10]
 12753d0: f9400129     	ldr	x9, [x9]
 12753d4: 1100054a     	add	w10, w10, #0x1
 12753d8: b9001c0a     	str	w10, [x0, #0x1c]
 12753dc: b4010fc8     	cbz	x8, 0x12775d4 <__start_il2cpp+0xcfe10>
 12753e0: b980180a     	ldrsw	x10, [x0, #0x18]
 12753e4: b940190b     	ldr	w11, [x8, #0x18]
 12753e8: 6b0b015f     	cmp	w10, w11
 12753ec: 54000102     	b.hs	0x127540c <__start_il2cpp+0xcdc48>
 12753f0: 11000549     	add	w9, w10, #0x1
 12753f4: 8b0a0d08     	add	x8, x8, x10, lsl #3
 12753f8: 52a8590a     	mov	w10, #0x42c80000        // =1120403456
 12753fc: b9001809     	str	w9, [x0, #0x18]
 1275400: f9001101     	str	x1, [x8, #0x20]
 1275404: 1e270140     	fmov	s0, w10
 1275408: 14000007     	b	0x1275424 <__start_il2cpp+0xcdc60>
 127540c: f9401128     	ldr	x8, [x9, #0x20]
 1275410: f9406108     	ldr	x8, [x8, #0xc0]
 1275414: f9403902     	ldr	x2, [x8, #0x70]
 1275418: 941a13ff     	bl	0x18fa414 <__start_il2cpp+0x752c50>
 127541c: 52a85908     	mov	w8, #0x42c80000         // =1120403456
 1275420: 1e270100     	fmov	s0, w8
 1275424: f94002e0     	ldr	x0, [x23]
 1275428: b4010d60     	cbz	x0, 0x12775d4 <__start_il2cpp+0xcfe10>
 127542c: f9400262     	ldr	x2, [x19]
 1275430: 2a1403e1     	mov	w1, w20
 1275434: aa1f03e3     	mov	x3, xzr
 1275438: 94005ec7     	bl	0x128cf54 <__start_il2cpp+0xe5790>
 127543c: f94002e0     	ldr	x0, [x23]
 1275440: b4010ca0     	cbz	x0, 0x12775d4 <__start_il2cpp+0xcfe10>
 1275444: b000af73     	adrp	x19, 0x2862000
 1275448: f943ce73     	ldr	x19, [x19, #0x798]
 127544c: 2a1403e1     	mov	w1, w20
 1275450: aa1f03e3     	mov	x3, xzr
 1275454: f9400262     	ldr	x2, [x19]
 1275458: 94005eb7     	bl	0x128cf34 <__start_il2cpp+0xe5770>
 127545c: 52a85908     	mov	w8, #0x42c80000         // =1120403456
 1275460: 1e270101     	fmov	s1, w8
 1275464: 1e212000     	fcmp	s0, s1
 1275468: 54000525     	b.pl	0x127550c <__start_il2cpp+0xcdd48>
 127546c: 3943d388     	ldrb	w8, [x28, #0xf4]
 1275470: 35000068     	cbnz	w8, 0x127547c <__start_il2cpp+0xcdcb8>
 1275474: 3943d788     	ldrb	w8, [x28, #0xf5]
 1275478: 340003c8     	cbz	w8, 0x12754f0 <__start_il2cpp+0xcdd2c>
 127547c: f9400300     	ldr	x0, [x24]
 1275480: b4010aa0     	cbz	x0, 0x12775d4 <__start_il2cpp+0xcfe10>
 1275484: f000af29     	adrp	x9, 0x285c000 <_ZTVN10__cxxabiv119__pointer_type_infoE+0x18>
 1275488: f9400261     	ldr	x1, [x19]
 127548c: f947a529     	ldr	x9, [x9, #0xf48]
 1275490: b9401c0a     	ldr	w10, [x0, #0x1c]
 1275494: f9400808     	ldr	x8, [x0, #0x10]
 1275498: f9400129     	ldr	x9, [x9]
 127549c: 1100054a     	add	w10, w10, #0x1
 12754a0: b9001c0a     	str	w10, [x0, #0x1c]
 12754a4: b4010988     	cbz	x8, 0x12775d4 <__start_il2cpp+0xcfe10>
 12754a8: b980180a     	ldrsw	x10, [x0, #0x18]
 12754ac: b940190b     	ldr	w11, [x8, #0x18]
 12754b0: 6b0b015f     	cmp	w10, w11
 12754b4: 54000102     	b.hs	0x12754d4 <__start_il2cpp+0xcdd10>
 12754b8: 11000549     	add	w9, w10, #0x1
 12754bc: 8b0a0d08     	add	x8, x8, x10, lsl #3
 12754c0: 52a8590a     	mov	w10, #0x42c80000        // =1120403456
 12754c4: b9001809     	str	w9, [x0, #0x18]
 12754c8: f9001101     	str	x1, [x8, #0x20]
 12754cc: 1e270140     	fmov	s0, w10
 12754d0: 14000009     	b	0x12754f4 <__start_il2cpp+0xcdd30>
 12754d4: f9401128     	ldr	x8, [x9, #0x20]
 12754d8: f9406108     	ldr	x8, [x8, #0xc0]
 12754dc: f9403902     	ldr	x2, [x8, #0x70]
 12754e0: 941a13cd     	bl	0x18fa414 <__start_il2cpp+0x752c50>
 12754e4: 52a85908     	mov	w8, #0x42c80000         // =1120403456
 12754e8: 1e270100     	fmov	s0, w8
 12754ec: 14000002     	b	0x12754f4 <__start_il2cpp+0xcdd30>
 12754f0: 1e2703e0     	fmov	s0, wzr
 12754f4: f94002e0     	ldr	x0, [x23]
 12754f8: b40106e0     	cbz	x0, 0x12775d4 <__start_il2cpp+0xcfe10>
 12754fc: f9400262     	ldr	x2, [x19]
 1275500: 2a1403e1     	mov	w1, w20
 1275504: aa1f03e3     	mov	x3, xzr
 1275508: 94005e93     	bl	0x128cf54 <__start_il2cpp+0xe5790>
