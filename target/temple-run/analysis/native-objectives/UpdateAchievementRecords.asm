
/tmp/temple-libil2cpp.so:	file format elf64-littleaarch64

Disassembly of section il2cpp:

00000000011a77c4 <__start_il2cpp>:
 12736cc: d10243ff     	sub	sp, sp, #0x90
 12736d0: fd0013e8     	str	d8, [sp, #0x20]
 12736d4: a9037bfd     	stp	x29, x30, [sp, #0x30]
 12736d8: a9046ffc     	stp	x28, x27, [sp, #0x40]
 12736dc: a90567fa     	stp	x26, x25, [sp, #0x50]
 12736e0: a9065ff8     	stp	x24, x23, [sp, #0x60]
 12736e4: a90757f6     	stp	x22, x21, [sp, #0x70]
 12736e8: a9084ff4     	stp	x20, x19, [sp, #0x80]
 12736ec: d000be13     	adrp	x19, 0x2a35000
 12736f0: 395d7e68     	ldrb	w8, [x19, #0x75f]
 12736f4: aa0003fc     	mov	x28, x0
 12736f8: 37001748     	tbnz	w8, #0x0, 0x12739e0 <__start_il2cpp+0xcc21c>
 12736fc: b000af40     	adrp	x0, 0x285c000 <_ZTVN10__cxxabiv119__pointer_type_infoE+0x18>
 1273700: f947a400     	ldr	x0, [x0, #0xf48]
 1273704: 97f931f5     	bl	0x10bfed8 <CloseNLSocket+0x410>
 1273708: f000af40     	adrp	x0, 0x285e000
 127370c: f9426000     	ldr	x0, [x0, #0x4c0]
 1273710: 97f931f2     	bl	0x10bfed8 <CloseNLSocket+0x410>
 1273714: f000af40     	adrp	x0, 0x285e000
 1273718: f9432400     	ldr	x0, [x0, #0x648]
 127371c: 97f931ef     	bl	0x10bfed8 <CloseNLSocket+0x410>
 1273720: f000af40     	adrp	x0, 0x285e000
 1273724: f9432800     	ldr	x0, [x0, #0x650]
 1273728: 97f931ec     	bl	0x10bfed8 <CloseNLSocket+0x410>
 127372c: f000af60     	adrp	x0, 0x2862000
 1273730: f943c800     	ldr	x0, [x0, #0x790]
 1273734: 97f931e9     	bl	0x10bfed8 <CloseNLSocket+0x410>
 1273738: f000af60     	adrp	x0, 0x2862000
 127373c: f943cc00     	ldr	x0, [x0, #0x798]
 1273740: 97f931e6     	bl	0x10bfed8 <CloseNLSocket+0x410>
 1273744: f000af60     	adrp	x0, 0x2862000
 1273748: f943d000     	ldr	x0, [x0, #0x7a0]
 127374c: 97f931e3     	bl	0x10bfed8 <CloseNLSocket+0x410>
 1273750: f000af60     	adrp	x0, 0x2862000
 1273754: f943d400     	ldr	x0, [x0, #0x7a8]
 1273758: 97f931e0     	bl	0x10bfed8 <CloseNLSocket+0x410>
 127375c: f000af60     	adrp	x0, 0x2862000
 1273760: f943d800     	ldr	x0, [x0, #0x7b0]
 1273764: 97f931dd     	bl	0x10bfed8 <CloseNLSocket+0x410>
 1273768: f000af60     	adrp	x0, 0x2862000
 127376c: f943dc00     	ldr	x0, [x0, #0x7b8]
 1273770: 97f931da     	bl	0x10bfed8 <CloseNLSocket+0x410>
 1273774: f000af60     	adrp	x0, 0x2862000
 1273778: f943e000     	ldr	x0, [x0, #0x7c0]
 127377c: 97f931d7     	bl	0x10bfed8 <CloseNLSocket+0x410>
 1273780: f000af60     	adrp	x0, 0x2862000
 1273784: f943e400     	ldr	x0, [x0, #0x7c8]
 1273788: 97f931d4     	bl	0x10bfed8 <CloseNLSocket+0x410>
 127378c: f000af60     	adrp	x0, 0x2862000
 1273790: f943e800     	ldr	x0, [x0, #0x7d0]
 1273794: 97f931d1     	bl	0x10bfed8 <CloseNLSocket+0x410>
 1273798: f000af60     	adrp	x0, 0x2862000
 127379c: f943ec00     	ldr	x0, [x0, #0x7d8]
 12737a0: 97f931ce     	bl	0x10bfed8 <CloseNLSocket+0x410>
 12737a4: f000af60     	adrp	x0, 0x2862000
 12737a8: f943f000     	ldr	x0, [x0, #0x7e0]
 12737ac: 97f931cb     	bl	0x10bfed8 <CloseNLSocket+0x410>
 12737b0: f000af60     	adrp	x0, 0x2862000
 12737b4: f943f400     	ldr	x0, [x0, #0x7e8]
 12737b8: 97f931c8     	bl	0x10bfed8 <CloseNLSocket+0x410>
 12737bc: f000af60     	adrp	x0, 0x2862000
 12737c0: f943f800     	ldr	x0, [x0, #0x7f0]
 12737c4: 97f931c5     	bl	0x10bfed8 <CloseNLSocket+0x410>
 12737c8: f000af60     	adrp	x0, 0x2862000
 12737cc: f943fc00     	ldr	x0, [x0, #0x7f8]
 12737d0: 97f931c2     	bl	0x10bfed8 <CloseNLSocket+0x410>
 12737d4: f000af60     	adrp	x0, 0x2862000
 12737d8: f9440000     	ldr	x0, [x0, #0x800]
 12737dc: 97f931bf     	bl	0x10bfed8 <CloseNLSocket+0x410>
 12737e0: f000af60     	adrp	x0, 0x2862000
 12737e4: f9440400     	ldr	x0, [x0, #0x808]
 12737e8: 97f931bc     	bl	0x10bfed8 <CloseNLSocket+0x410>
 12737ec: f000af60     	adrp	x0, 0x2862000
 12737f0: f9440800     	ldr	x0, [x0, #0x810]
 12737f4: 97f931b9     	bl	0x10bfed8 <CloseNLSocket+0x410>
 12737f8: f000af60     	adrp	x0, 0x2862000
 12737fc: f9440c00     	ldr	x0, [x0, #0x818]
 1273800: 97f931b6     	bl	0x10bfed8 <CloseNLSocket+0x410>
 1273804: f000af60     	adrp	x0, 0x2862000
 1273808: f9441000     	ldr	x0, [x0, #0x820]
 127380c: 97f931b3     	bl	0x10bfed8 <CloseNLSocket+0x410>
 1273810: f000af60     	adrp	x0, 0x2862000
 1273814: f9441400     	ldr	x0, [x0, #0x828]
 1273818: 97f931b0     	bl	0x10bfed8 <CloseNLSocket+0x410>
 127381c: f000af60     	adrp	x0, 0x2862000
 1273820: f9441800     	ldr	x0, [x0, #0x830]
 1273824: 97f931ad     	bl	0x10bfed8 <CloseNLSocket+0x410>
 1273828: f000af60     	adrp	x0, 0x2862000
 127382c: f9441c00     	ldr	x0, [x0, #0x838]
 1273830: 97f931aa     	bl	0x10bfed8 <CloseNLSocket+0x410>
 1273834: f000af60     	adrp	x0, 0x2862000
 1273838: f9442000     	ldr	x0, [x0, #0x840]
 127383c: 97f931a7     	bl	0x10bfed8 <CloseNLSocket+0x410>
 1273840: f000af60     	adrp	x0, 0x2862000
 1273844: f9442400     	ldr	x0, [x0, #0x848]
 1273848: 97f931a4     	bl	0x10bfed8 <CloseNLSocket+0x410>
 127384c: f000af60     	adrp	x0, 0x2862000
 1273850: f9442800     	ldr	x0, [x0, #0x850]
 1273854: 97f931a1     	bl	0x10bfed8 <CloseNLSocket+0x410>
 1273858: f000af60     	adrp	x0, 0x2862000
 127385c: f9442c00     	ldr	x0, [x0, #0x858]
 1273860: 97f9319e     	bl	0x10bfed8 <CloseNLSocket+0x410>
 1273864: f000af60     	adrp	x0, 0x2862000
 1273868: f9443000     	ldr	x0, [x0, #0x860]
 127386c: 97f9319b     	bl	0x10bfed8 <CloseNLSocket+0x410>
 1273870: f000af60     	adrp	x0, 0x2862000
 1273874: f9443400     	ldr	x0, [x0, #0x868]
 1273878: 97f93198     	bl	0x10bfed8 <CloseNLSocket+0x410>
 127387c: f000af60     	adrp	x0, 0x2862000
 1273880: f9443800     	ldr	x0, [x0, #0x870]
 1273884: 97f93195     	bl	0x10bfed8 <CloseNLSocket+0x410>
 1273888: f000af60     	adrp	x0, 0x2862000
 127388c: f9443c00     	ldr	x0, [x0, #0x878]
 1273890: 97f93192     	bl	0x10bfed8 <CloseNLSocket+0x410>
 1273894: f000af60     	adrp	x0, 0x2862000
 1273898: f9444000     	ldr	x0, [x0, #0x880]
 127389c: 97f9318f     	bl	0x10bfed8 <CloseNLSocket+0x410>
 12738a0: f000af60     	adrp	x0, 0x2862000
 12738a4: f9444400     	ldr	x0, [x0, #0x888]
 12738a8: 97f9318c     	bl	0x10bfed8 <CloseNLSocket+0x410>
 12738ac: f000af60     	adrp	x0, 0x2862000
 12738b0: f9444800     	ldr	x0, [x0, #0x890]
 12738b4: 97f93189     	bl	0x10bfed8 <CloseNLSocket+0x410>
 12738b8: f000af60     	adrp	x0, 0x2862000
 12738bc: f9444c00     	ldr	x0, [x0, #0x898]
 12738c0: 97f93186     	bl	0x10bfed8 <CloseNLSocket+0x410>
 12738c4: f000af60     	adrp	x0, 0x2862000
 12738c8: f9445000     	ldr	x0, [x0, #0x8a0]
 12738cc: 97f93183     	bl	0x10bfed8 <CloseNLSocket+0x410>
 12738d0: f000af60     	adrp	x0, 0x2862000
 12738d4: f9445400     	ldr	x0, [x0, #0x8a8]
 12738d8: 97f93180     	bl	0x10bfed8 <CloseNLSocket+0x410>
 12738dc: f000af60     	adrp	x0, 0x2862000
 12738e0: f9445800     	ldr	x0, [x0, #0x8b0]
 12738e4: 97f9317d     	bl	0x10bfed8 <CloseNLSocket+0x410>
 12738e8: f000af60     	adrp	x0, 0x2862000
 12738ec: f9445c00     	ldr	x0, [x0, #0x8b8]
 12738f0: 97f9317a     	bl	0x10bfed8 <CloseNLSocket+0x410>
 12738f4: f000af60     	adrp	x0, 0x2862000
 12738f8: f9446000     	ldr	x0, [x0, #0x8c0]
 12738fc: 97f93177     	bl	0x10bfed8 <CloseNLSocket+0x410>
 1273900: f000af60     	adrp	x0, 0x2862000
 1273904: f9446400     	ldr	x0, [x0, #0x8c8]
 1273908: 97f93174     	bl	0x10bfed8 <CloseNLSocket+0x410>
 127390c: f000af60     	adrp	x0, 0x2862000
 1273910: f9446800     	ldr	x0, [x0, #0x8d0]
 1273914: 97f93171     	bl	0x10bfed8 <CloseNLSocket+0x410>
 1273918: f000af60     	adrp	x0, 0x2862000
 127391c: f9446c00     	ldr	x0, [x0, #0x8d8]
 1273920: 97f9316e     	bl	0x10bfed8 <CloseNLSocket+0x410>
 1273924: f000af60     	adrp	x0, 0x2862000
 1273928: f9447000     	ldr	x0, [x0, #0x8e0]
 127392c: 97f9316b     	bl	0x10bfed8 <CloseNLSocket+0x410>
 1273930: f000af60     	adrp	x0, 0x2862000
 1273934: f9447400     	ldr	x0, [x0, #0x8e8]
 1273938: 97f93168     	bl	0x10bfed8 <CloseNLSocket+0x410>
 127393c: f000af60     	adrp	x0, 0x2862000
 1273940: f9447800     	ldr	x0, [x0, #0x8f0]
 1273944: 97f93165     	bl	0x10bfed8 <CloseNLSocket+0x410>
 1273948: f000af60     	adrp	x0, 0x2862000
 127394c: f9447c00     	ldr	x0, [x0, #0x8f8]
 1273950: 97f93162     	bl	0x10bfed8 <CloseNLSocket+0x410>
 1273954: f000af60     	adrp	x0, 0x2862000
 1273958: f9448000     	ldr	x0, [x0, #0x900]
 127395c: 97f9315f     	bl	0x10bfed8 <CloseNLSocket+0x410>
 1273960: f000af60     	adrp	x0, 0x2862000
 1273964: f9448400     	ldr	x0, [x0, #0x908]
 1273968: 97f9315c     	bl	0x10bfed8 <CloseNLSocket+0x410>
 127396c: f000af60     	adrp	x0, 0x2862000
 1273970: f9448800     	ldr	x0, [x0, #0x910]
 1273974: 97f93159     	bl	0x10bfed8 <CloseNLSocket+0x410>
 1273978: f000af60     	adrp	x0, 0x2862000
 127397c: f9448c00     	ldr	x0, [x0, #0x918]
 1273980: 97f93156     	bl	0x10bfed8 <CloseNLSocket+0x410>
 1273984: f000af60     	adrp	x0, 0x2862000
 1273988: f9449000     	ldr	x0, [x0, #0x920]
 127398c: 97f93153     	bl	0x10bfed8 <CloseNLSocket+0x410>
 1273990: f000af60     	adrp	x0, 0x2862000
 1273994: f9449400     	ldr	x0, [x0, #0x928]
 1273998: 97f93150     	bl	0x10bfed8 <CloseNLSocket+0x410>
 127399c: f000af60     	adrp	x0, 0x2862000
 12739a0: f9449800     	ldr	x0, [x0, #0x930]
 12739a4: 97f9314d     	bl	0x10bfed8 <CloseNLSocket+0x410>
 12739a8: f000af60     	adrp	x0, 0x2862000
 12739ac: f9449c00     	ldr	x0, [x0, #0x938]
 12739b0: 97f9314a     	bl	0x10bfed8 <CloseNLSocket+0x410>
 12739b4: f000af60     	adrp	x0, 0x2862000
 12739b8: f944a000     	ldr	x0, [x0, #0x940]
 12739bc: 97f93147     	bl	0x10bfed8 <CloseNLSocket+0x410>
 12739c0: f000af60     	adrp	x0, 0x2862000
 12739c4: f944a400     	ldr	x0, [x0, #0x948]
 12739c8: 97f93144     	bl	0x10bfed8 <CloseNLSocket+0x410>
 12739cc: f000af60     	adrp	x0, 0x2862000
 12739d0: f944a800     	ldr	x0, [x0, #0x950]
 12739d4: 97f93141     	bl	0x10bfed8 <CloseNLSocket+0x410>
 12739d8: 52800028     	mov	w8, #0x1                // =1
 12739dc: 391d7e68     	strb	w8, [x19, #0x75f]
 12739e0: f9413788     	ldr	x8, [x28, #0x268]
 12739e4: b401df88     	cbz	x8, 0x12775d4 <__start_il2cpp+0xcfe10>
 12739e8: 29432502     	ldp	w2, w9, [x8, #0x18]
 12739ec: 11000529     	add	w9, w9, #0x1
 12739f0: 7100045f     	cmp	w2, #0x1
 12739f4: 2903251f     	stp	wzr, w9, [x8, #0x18]
 12739f8: 540000ab     	b.lt	0x1273a0c <__start_il2cpp+0xcc248>
 12739fc: f9400900     	ldr	x0, [x8, #0x10]
 1273a00: 2a1f03e1     	mov	w1, wzr
 1273a04: aa1f03e3     	mov	x3, xzr
 1273a08: 94314c0a     	bl	0x1ec6a30 <__start_il2cpp+0xd1f26c>
 1273a0c: f9405f80     	ldr	x0, [x28, #0xb8]
 1273a10: b401de20     	cbz	x0, 0x12775d4 <__start_il2cpp+0xcfe10>
 1273a14: aa1f03e1     	mov	x1, xzr
 1273a18: 9400cafd     	bl	0x12a660c <__start_il2cpp+0xfee48>
 1273a1c: aa1c03f7     	mov	x23, x28
 1273a20: f84b0ee8     	ldr	x8, [x23, #0xb0]!
 1273a24: b401dd88     	cbz	x8, 0x12775d4 <__start_il2cpp+0xcfe10>
 1273a28: f000af73     	adrp	x19, 0x2862000
 1273a2c: f9440673     	ldr	x19, [x19, #0x808]
 1273a30: 2a0003f4     	mov	w20, w0
 1273a34: aa0803e0     	mov	x0, x8
 1273a38: 2a1403e1     	mov	w1, w20
 1273a3c: f9400262     	ldr	x2, [x19]
 1273a40: aa1f03e3     	mov	x3, xzr
 1273a44: 9109a398     	add	x24, x28, #0x268
 1273a48: 9400653b     	bl	0x128cf34 <__start_il2cpp+0xe5770>
 1273a4c: 52a85908     	mov	w8, #0x42c80000         // =1120403456
 1273a50: 1e270101     	fmov	s1, w8
 1273a54: 1e212000     	fcmp	s0, s1
 1273a58: 54000585     	b.pl	0x1273b08 <__start_il2cpp+0xcc344>
 1273a5c: bd412780     	ldr	s0, [x28, #0x124]
 1273a60: 52a87f48     	mov	w8, #0x43fa0000         // =1140457472
 1273a64: 1e270101     	fmov	s1, w8
 1273a68: 52a85908     	mov	w8, #0x42c80000         // =1120403456
 1273a6c: 1e211800     	fdiv	s0, s0, s1
 1273a70: 1e270101     	fmov	s1, w8
 1273a74: 1e210800     	fmul	s0, s0, s1
 1273a78: 1e212000     	fcmp	s0, s1
 1273a7c: 540003ab     	b.lt	0x1273af0 <__start_il2cpp+0xcc32c>
 1273a80: f9400300     	ldr	x0, [x24]
 1273a84: b401da80     	cbz	x0, 0x12775d4 <__start_il2cpp+0xcfe10>
 1273a88: b000af49     	adrp	x9, 0x285c000 <_ZTVN10__cxxabiv119__pointer_type_infoE+0x18>
 1273a8c: f9400261     	ldr	x1, [x19]
 1273a90: f947a529     	ldr	x9, [x9, #0xf48]
 1273a94: b9401c0a     	ldr	w10, [x0, #0x1c]
 1273a98: f9400808     	ldr	x8, [x0, #0x10]
 1273a9c: f9400129     	ldr	x9, [x9]
 1273aa0: 1100054a     	add	w10, w10, #0x1
 1273aa4: b9001c0a     	str	w10, [x0, #0x1c]
 1273aa8: b401d968     	cbz	x8, 0x12775d4 <__start_il2cpp+0xcfe10>
 1273aac: b980180a     	ldrsw	x10, [x0, #0x18]
 1273ab0: b940190b     	ldr	w11, [x8, #0x18]
 1273ab4: 6b0b015f     	cmp	w10, w11
 1273ab8: 54000102     	b.hs	0x1273ad8 <__start_il2cpp+0xcc314>
 1273abc: 11000549     	add	w9, w10, #0x1
 1273ac0: 8b0a0d08     	add	x8, x8, x10, lsl #3
 1273ac4: 52a8590a     	mov	w10, #0x42c80000        // =1120403456
 1273ac8: b9001809     	str	w9, [x0, #0x18]
 1273acc: f9001101     	str	x1, [x8, #0x20]
 1273ad0: 1e270140     	fmov	s0, w10
 1273ad4: 14000007     	b	0x1273af0 <__start_il2cpp+0xcc32c>
 1273ad8: f9401128     	ldr	x8, [x9, #0x20]
 1273adc: f9406108     	ldr	x8, [x8, #0xc0]
 1273ae0: f9403902     	ldr	x2, [x8, #0x70]
 1273ae4: 941a1a4c     	bl	0x18fa414 <__start_il2cpp+0x752c50>
 1273ae8: 52a85908     	mov	w8, #0x42c80000         // =1120403456
 1273aec: 1e270100     	fmov	s0, w8
 1273af0: f94002e0     	ldr	x0, [x23]
 1273af4: b401d700     	cbz	x0, 0x12775d4 <__start_il2cpp+0xcfe10>
 1273af8: f9400262     	ldr	x2, [x19]
 1273afc: 2a1403e1     	mov	w1, w20
 1273b00: aa1f03e3     	mov	x3, xzr
 1273b04: 94006514     	bl	0x128cf54 <__start_il2cpp+0xe5790>
 1273b08: f94002e0     	ldr	x0, [x23]
 1273b0c: b401d640     	cbz	x0, 0x12775d4 <__start_il2cpp+0xcfe10>
 1273b10: f000af73     	adrp	x19, 0x2862000
 1273b14: f9447273     	ldr	x19, [x19, #0x8e0]
 1273b18: 2a1403e1     	mov	w1, w20
 1273b1c: aa1f03e3     	mov	x3, xzr
 1273b20: f9400262     	ldr	x2, [x19]
 1273b24: 94006504     	bl	0x128cf34 <__start_il2cpp+0xe5770>
 1273b28: 52a85908     	mov	w8, #0x42c80000         // =1120403456
 1273b2c: 1e270101     	fmov	s1, w8
 1273b30: 1e212000     	fcmp	s0, s1
 1273b34: 54000585     	b.pl	0x1273be4 <__start_il2cpp+0xcc420>
 1273b38: bd40fb80     	ldr	s0, [x28, #0xf8]
 1273b3c: 52a87f48     	mov	w8, #0x43fa0000         // =1140457472
 1273b40: 1e270101     	fmov	s1, w8
 1273b44: 52a85908     	mov	w8, #0x42c80000         // =1120403456
 1273b48: 1e211800     	fdiv	s0, s0, s1
 1273b4c: 1e270101     	fmov	s1, w8
 1273b50: 1e210800     	fmul	s0, s0, s1
 1273b54: 1e212000     	fcmp	s0, s1
 1273b58: 540003ab     	b.lt	0x1273bcc <__start_il2cpp+0xcc408>
 1273b5c: f9400300     	ldr	x0, [x24]
 1273b60: b401d3a0     	cbz	x0, 0x12775d4 <__start_il2cpp+0xcfe10>
 1273b64: b000af49     	adrp	x9, 0x285c000 <_ZTVN10__cxxabiv119__pointer_type_infoE+0x18>
 1273b68: f9400261     	ldr	x1, [x19]
 1273b6c: f947a529     	ldr	x9, [x9, #0xf48]
 1273b70: b9401c0a     	ldr	w10, [x0, #0x1c]
 1273b74: f9400808     	ldr	x8, [x0, #0x10]
 1273b78: f9400129     	ldr	x9, [x9]
 1273b7c: 1100054a     	add	w10, w10, #0x1
 1273b80: b9001c0a     	str	w10, [x0, #0x1c]
 1273b84: b401d288     	cbz	x8, 0x12775d4 <__start_il2cpp+0xcfe10>
 1273b88: b980180a     	ldrsw	x10, [x0, #0x18]
 1273b8c: b940190b     	ldr	w11, [x8, #0x18]
 1273b90: 6b0b015f     	cmp	w10, w11
 1273b94: 54000102     	b.hs	0x1273bb4 <__start_il2cpp+0xcc3f0>
 1273b98: 11000549     	add	w9, w10, #0x1
 1273b9c: 8b0a0d08     	add	x8, x8, x10, lsl #3
 1273ba0: 52a8590a     	mov	w10, #0x42c80000        // =1120403456
 1273ba4: b9001809     	str	w9, [x0, #0x18]
 1273ba8: f9001101     	str	x1, [x8, #0x20]
 1273bac: 1e270140     	fmov	s0, w10
 1273bb0: 14000007     	b	0x1273bcc <__start_il2cpp+0xcc408>
 1273bb4: f9401128     	ldr	x8, [x9, #0x20]
 1273bb8: f9406108     	ldr	x8, [x8, #0xc0]
 1273bbc: f9403902     	ldr	x2, [x8, #0x70]
 1273bc0: 941a1a15     	bl	0x18fa414 <__start_il2cpp+0x752c50>
 1273bc4: 52a85908     	mov	w8, #0x42c80000         // =1120403456
 1273bc8: 1e270100     	fmov	s0, w8
 1273bcc: f94002e0     	ldr	x0, [x23]
 1273bd0: b401d020     	cbz	x0, 0x12775d4 <__start_il2cpp+0xcfe10>
 1273bd4: f9400262     	ldr	x2, [x19]
 1273bd8: 2a1403e1     	mov	w1, w20
 1273bdc: aa1f03e3     	mov	x3, xzr
 1273be0: 940064dd     	bl	0x128cf54 <__start_il2cpp+0xe5790>
 1273be4: f94002e0     	ldr	x0, [x23]
 1273be8: b401cf60     	cbz	x0, 0x12775d4 <__start_il2cpp+0xcfe10>
 1273bec: f000af73     	adrp	x19, 0x2862000
 1273bf0: f9440e73     	ldr	x19, [x19, #0x818]
 1273bf4: 2a1403e1     	mov	w1, w20
 1273bf8: aa1f03e3     	mov	x3, xzr
 1273bfc: f9400262     	ldr	x2, [x19]
 1273c00: 940064cd     	bl	0x128cf34 <__start_il2cpp+0xe5770>
 1273c04: 52a85908     	mov	w8, #0x42c80000         // =1120403456
 1273c08: 1e270101     	fmov	s1, w8
 1273c0c: 1e212000     	fcmp	s0, s1
 1273c10: 54000585     	b.pl	0x1273cc0 <__start_il2cpp+0xcc4fc>
 1273c14: bd412780     	ldr	s0, [x28, #0x124]
 1273c18: 52a88f48     	mov	w8, #0x447a0000         // =1148846080
 1273c1c: 1e270101     	fmov	s1, w8
 1273c20: 52a85908     	mov	w8, #0x42c80000         // =1120403456
 1273c24: 1e211800     	fdiv	s0, s0, s1
 1273c28: 1e270101     	fmov	s1, w8
 1273c2c: 1e210800     	fmul	s0, s0, s1
 1273c30: 1e212000     	fcmp	s0, s1
 1273c34: 540003ab     	b.lt	0x1273ca8 <__start_il2cpp+0xcc4e4>
 1273c38: f9400300     	ldr	x0, [x24]
 1273c3c: b401ccc0     	cbz	x0, 0x12775d4 <__start_il2cpp+0xcfe10>
 1273c40: b000af49     	adrp	x9, 0x285c000 <_ZTVN10__cxxabiv119__pointer_type_infoE+0x18>
 1273c44: f9400261     	ldr	x1, [x19]
 1273c48: f947a529     	ldr	x9, [x9, #0xf48]
 1273c4c: b9401c0a     	ldr	w10, [x0, #0x1c]
 1273c50: f9400808     	ldr	x8, [x0, #0x10]
 1273c54: f9400129     	ldr	x9, [x9]
 1273c58: 1100054a     	add	w10, w10, #0x1
 1273c5c: b9001c0a     	str	w10, [x0, #0x1c]
 1273c60: b401cba8     	cbz	x8, 0x12775d4 <__start_il2cpp+0xcfe10>
 1273c64: b980180a     	ldrsw	x10, [x0, #0x18]
 1273c68: b940190b     	ldr	w11, [x8, #0x18]
 1273c6c: 6b0b015f     	cmp	w10, w11
 1273c70: 54000102     	b.hs	0x1273c90 <__start_il2cpp+0xcc4cc>
 1273c74: 11000549     	add	w9, w10, #0x1
 1273c78: 8b0a0d08     	add	x8, x8, x10, lsl #3
 1273c7c: 52a8590a     	mov	w10, #0x42c80000        // =1120403456
 1273c80: b9001809     	str	w9, [x0, #0x18]
 1273c84: f9001101     	str	x1, [x8, #0x20]
 1273c88: 1e270140     	fmov	s0, w10
 1273c8c: 14000007     	b	0x1273ca8 <__start_il2cpp+0xcc4e4>
 1273c90: f9401128     	ldr	x8, [x9, #0x20]
 1273c94: f9406108     	ldr	x8, [x8, #0xc0]
 1273c98: f9403902     	ldr	x2, [x8, #0x70]
 1273c9c: 941a19de     	bl	0x18fa414 <__start_il2cpp+0x752c50>
 1273ca0: 52a85908     	mov	w8, #0x42c80000         // =1120403456
 1273ca4: 1e270100     	fmov	s0, w8
 1273ca8: f94002e0     	ldr	x0, [x23]
 1273cac: b401c940     	cbz	x0, 0x12775d4 <__start_il2cpp+0xcfe10>
 1273cb0: f9400262     	ldr	x2, [x19]
 1273cb4: 2a1403e1     	mov	w1, w20
 1273cb8: aa1f03e3     	mov	x3, xzr
 1273cbc: 940064a6     	bl	0x128cf54 <__start_il2cpp+0xe5790>
 1273cc0: f94002e0     	ldr	x0, [x23]
 1273cc4: b401c880     	cbz	x0, 0x12775d4 <__start_il2cpp+0xcfe10>
 1273cc8: f000af73     	adrp	x19, 0x2862000
 1273ccc: f9446673     	ldr	x19, [x19, #0x8c8]
 1273cd0: 2a1403e1     	mov	w1, w20
 1273cd4: aa1f03e3     	mov	x3, xzr
 1273cd8: f9400262     	ldr	x2, [x19]
 1273cdc: 94006496     	bl	0x128cf34 <__start_il2cpp+0xe5770>
 1273ce0: 52a85908     	mov	w8, #0x42c80000         // =1120403456
 1273ce4: 1e270101     	fmov	s1, w8
 1273ce8: 1e212000     	fcmp	s0, s1
 1273cec: 54000585     	b.pl	0x1273d9c <__start_il2cpp+0xcc5d8>
 1273cf0: bd40fb80     	ldr	s0, [x28, #0xf8]
 1273cf4: 52a88f48     	mov	w8, #0x447a0000         // =1148846080
 1273cf8: 1e270101     	fmov	s1, w8
 1273cfc: 52a85908     	mov	w8, #0x42c80000         // =1120403456
 1273d00: 1e211800     	fdiv	s0, s0, s1
 1273d04: 1e270101     	fmov	s1, w8
 1273d08: 1e210800     	fmul	s0, s0, s1
 1273d0c: 1e212000     	fcmp	s0, s1
 1273d10: 540003ab     	b.lt	0x1273d84 <__start_il2cpp+0xcc5c0>
 1273d14: f9400300     	ldr	x0, [x24]
 1273d18: b401c5e0     	cbz	x0, 0x12775d4 <__start_il2cpp+0xcfe10>
 1273d1c: b000af49     	adrp	x9, 0x285c000 <_ZTVN10__cxxabiv119__pointer_type_infoE+0x18>
 1273d20: f9400261     	ldr	x1, [x19]
 1273d24: f947a529     	ldr	x9, [x9, #0xf48]
 1273d28: b9401c0a     	ldr	w10, [x0, #0x1c]
 1273d2c: f9400808     	ldr	x8, [x0, #0x10]
 1273d30: f9400129     	ldr	x9, [x9]
 1273d34: 1100054a     	add	w10, w10, #0x1
 1273d38: b9001c0a     	str	w10, [x0, #0x1c]
 1273d3c: b401c4c8     	cbz	x8, 0x12775d4 <__start_il2cpp+0xcfe10>
 1273d40: b980180a     	ldrsw	x10, [x0, #0x18]
 1273d44: b940190b     	ldr	w11, [x8, #0x18]
 1273d48: 6b0b015f     	cmp	w10, w11
 1273d4c: 54000102     	b.hs	0x1273d6c <__start_il2cpp+0xcc5a8>
 1273d50: 11000549     	add	w9, w10, #0x1
 1273d54: 8b0a0d08     	add	x8, x8, x10, lsl #3
 1273d58: 52a8590a     	mov	w10, #0x42c80000        // =1120403456
 1273d5c: b9001809     	str	w9, [x0, #0x18]
 1273d60: f9001101     	str	x1, [x8, #0x20]
 1273d64: 1e270140     	fmov	s0, w10
 1273d68: 14000007     	b	0x1273d84 <__start_il2cpp+0xcc5c0>
 1273d6c: f9401128     	ldr	x8, [x9, #0x20]
 1273d70: f9406108     	ldr	x8, [x8, #0xc0]
 1273d74: f9403902     	ldr	x2, [x8, #0x70]
 1273d78: 941a19a7     	bl	0x18fa414 <__start_il2cpp+0x752c50>
 1273d7c: 52a85908     	mov	w8, #0x42c80000         // =1120403456
 1273d80: 1e270100     	fmov	s0, w8
 1273d84: f94002e0     	ldr	x0, [x23]
 1273d88: b401c260     	cbz	x0, 0x12775d4 <__start_il2cpp+0xcfe10>
 1273d8c: f9400262     	ldr	x2, [x19]
 1273d90: 2a1403e1     	mov	w1, w20
 1273d94: aa1f03e3     	mov	x3, xzr
 1273d98: 9400646f     	bl	0x128cf54 <__start_il2cpp+0xe5790>
 1273d9c: f94002e0     	ldr	x0, [x23]
 1273da0: b401c1a0     	cbz	x0, 0x12775d4 <__start_il2cpp+0xcfe10>
 1273da4: f000af73     	adrp	x19, 0x2862000
 1273da8: f9447a73     	ldr	x19, [x19, #0x8f0]
 1273dac: 2a1403e1     	mov	w1, w20
 1273db0: aa1f03e3     	mov	x3, xzr
 1273db4: f9400262     	ldr	x2, [x19]
 1273db8: 9400645f     	bl	0x128cf34 <__start_il2cpp+0xe5770>
 1273dbc: 52a85908     	mov	w8, #0x42c80000         // =1120403456
 1273dc0: 1e270101     	fmov	s1, w8
 1273dc4: 1e212000     	fcmp	s0, s1
 1273dc8: 54000585     	b.pl	0x1273e78 <__start_il2cpp+0xcc6b4>
 1273dcc: 90ffa128     	adrp	x8, 0x697000
 1273dd0: bd412780     	ldr	s0, [x28, #0x124]
 1273dd4: bd465501     	ldr	s1, [x8, #0x654]
 1273dd8: 52a85908     	mov	w8, #0x42c80000         // =1120403456
 1273ddc: 1e211800     	fdiv	s0, s0, s1
 1273de0: 1e270101     	fmov	s1, w8
 1273de4: 1e210800     	fmul	s0, s0, s1
 1273de8: 1e212000     	fcmp	s0, s1
 1273dec: 540003ab     	b.lt	0x1273e60 <__start_il2cpp+0xcc69c>
 1273df0: f9400300     	ldr	x0, [x24]
 1273df4: b401bf00     	cbz	x0, 0x12775d4 <__start_il2cpp+0xcfe10>
 1273df8: b000af49     	adrp	x9, 0x285c000 <_ZTVN10__cxxabiv119__pointer_type_infoE+0x18>
 1273dfc: f9400261     	ldr	x1, [x19]
 1273e00: f947a529     	ldr	x9, [x9, #0xf48]
 1273e04: b9401c0a     	ldr	w10, [x0, #0x1c]
 1273e08: f9400808     	ldr	x8, [x0, #0x10]
 1273e0c: f9400129     	ldr	x9, [x9]
 1273e10: 1100054a     	add	w10, w10, #0x1
 1273e14: b9001c0a     	str	w10, [x0, #0x1c]
 1273e18: b401bde8     	cbz	x8, 0x12775d4 <__start_il2cpp+0xcfe10>
 1273e1c: b980180a     	ldrsw	x10, [x0, #0x18]
 1273e20: b940190b     	ldr	w11, [x8, #0x18]
 1273e24: 6b0b015f     	cmp	w10, w11
 1273e28: 54000102     	b.hs	0x1273e48 <__start_il2cpp+0xcc684>
 1273e2c: 11000549     	add	w9, w10, #0x1
 1273e30: 8b0a0d08     	add	x8, x8, x10, lsl #3
 1273e34: 52a8590a     	mov	w10, #0x42c80000        // =1120403456
 1273e38: b9001809     	str	w9, [x0, #0x18]
 1273e3c: f9001101     	str	x1, [x8, #0x20]
 1273e40: 1e270140     	fmov	s0, w10
 1273e44: 14000007     	b	0x1273e60 <__start_il2cpp+0xcc69c>
 1273e48: f9401128     	ldr	x8, [x9, #0x20]
 1273e4c: f9406108     	ldr	x8, [x8, #0xc0]
 1273e50: f9403902     	ldr	x2, [x8, #0x70]
 1273e54: 941a1970     	bl	0x18fa414 <__start_il2cpp+0x752c50>
 1273e58: 52a85908     	mov	w8, #0x42c80000         // =1120403456
 1273e5c: 1e270100     	fmov	s0, w8
 1273e60: f94002e0     	ldr	x0, [x23]
 1273e64: b401bb80     	cbz	x0, 0x12775d4 <__start_il2cpp+0xcfe10>
 1273e68: f9400262     	ldr	x2, [x19]
 1273e6c: 2a1403e1     	mov	w1, w20
 1273e70: aa1f03e3     	mov	x3, xzr
 1273e74: 94006438     	bl	0x128cf54 <__start_il2cpp+0xe5790>
 1273e78: f94002e0     	ldr	x0, [x23]
 1273e7c: b401bac0     	cbz	x0, 0x12775d4 <__start_il2cpp+0xcfe10>
 1273e80: f000af73     	adrp	x19, 0x2862000
 1273e84: f9445673     	ldr	x19, [x19, #0x8a8]
 1273e88: 2a1403e1     	mov	w1, w20
 1273e8c: aa1f03e3     	mov	x3, xzr
 1273e90: f9400262     	ldr	x2, [x19]
 1273e94: 94006428     	bl	0x128cf34 <__start_il2cpp+0xe5770>
 1273e98: 52a85908     	mov	w8, #0x42c80000         // =1120403456
 1273e9c: 1e270101     	fmov	s1, w8
 1273ea0: 1e212000     	fcmp	s0, s1
 1273ea4: 54000585     	b.pl	0x1273f54 <__start_il2cpp+0xcc790>
 1273ea8: 90ffa128     	adrp	x8, 0x697000
 1273eac: bd412780     	ldr	s0, [x28, #0x124]
 1273eb0: bd463d01     	ldr	s1, [x8, #0x63c]
 1273eb4: 52a85908     	mov	w8, #0x42c80000         // =1120403456
 1273eb8: 1e211800     	fdiv	s0, s0, s1
 1273ebc: 1e270101     	fmov	s1, w8
 1273ec0: 1e210800     	fmul	s0, s0, s1
 1273ec4: 1e212000     	fcmp	s0, s1
 1273ec8: 540003ab     	b.lt	0x1273f3c <__start_il2cpp+0xcc778>
 1273ecc: f9400300     	ldr	x0, [x24]
 1273ed0: b401b820     	cbz	x0, 0x12775d4 <__start_il2cpp+0xcfe10>
 1273ed4: b000af49     	adrp	x9, 0x285c000 <_ZTVN10__cxxabiv119__pointer_type_infoE+0x18>
 1273ed8: f9400261     	ldr	x1, [x19]
 1273edc: f947a529     	ldr	x9, [x9, #0xf48]
 1273ee0: b9401c0a     	ldr	w10, [x0, #0x1c]
 1273ee4: f9400808     	ldr	x8, [x0, #0x10]
 1273ee8: f9400129     	ldr	x9, [x9]
 1273eec: 1100054a     	add	w10, w10, #0x1
 1273ef0: b9001c0a     	str	w10, [x0, #0x1c]
 1273ef4: b401b708     	cbz	x8, 0x12775d4 <__start_il2cpp+0xcfe10>
 1273ef8: b980180a     	ldrsw	x10, [x0, #0x18]
 1273efc: b940190b     	ldr	w11, [x8, #0x18]
 1273f00: 6b0b015f     	cmp	w10, w11
 1273f04: 54000102     	b.hs	0x1273f24 <__start_il2cpp+0xcc760>
 1273f08: 11000549     	add	w9, w10, #0x1
 1273f0c: 8b0a0d08     	add	x8, x8, x10, lsl #3
 1273f10: 52a8590a     	mov	w10, #0x42c80000        // =1120403456
 1273f14: b9001809     	str	w9, [x0, #0x18]
 1273f18: f9001101     	str	x1, [x8, #0x20]
 1273f1c: 1e270140     	fmov	s0, w10
 1273f20: 14000007     	b	0x1273f3c <__start_il2cpp+0xcc778>
 1273f24: f9401128     	ldr	x8, [x9, #0x20]
 1273f28: f9406108     	ldr	x8, [x8, #0xc0]
 1273f2c: f9403902     	ldr	x2, [x8, #0x70]
 1273f30: 941a1939     	bl	0x18fa414 <__start_il2cpp+0x752c50>
 1273f34: 52a85908     	mov	w8, #0x42c80000         // =1120403456
 1273f38: 1e270100     	fmov	s0, w8
 1273f3c: f94002e0     	ldr	x0, [x23]
 1273f40: b401b4a0     	cbz	x0, 0x12775d4 <__start_il2cpp+0xcfe10>
 1273f44: f9400262     	ldr	x2, [x19]
 1273f48: 2a1403e1     	mov	w1, w20
 1273f4c: aa1f03e3     	mov	x3, xzr
 1273f50: 94006401     	bl	0x128cf54 <__start_il2cpp+0xe5790>
 1273f54: f94002e0     	ldr	x0, [x23]
 1273f58: b401b3e0     	cbz	x0, 0x12775d4 <__start_il2cpp+0xcfe10>
 1273f5c: f000af73     	adrp	x19, 0x2862000
 1273f60: f9446273     	ldr	x19, [x19, #0x8c0]
 1273f64: 2a1403e1     	mov	w1, w20
 1273f68: aa1f03e3     	mov	x3, xzr
 1273f6c: f9400262     	ldr	x2, [x19]
 1273f70: 940063f1     	bl	0x128cf34 <__start_il2cpp+0xe5770>
 1273f74: 52a85908     	mov	w8, #0x42c80000         // =1120403456
 1273f78: 1e270101     	fmov	s1, w8
 1273f7c: 1e212000     	fcmp	s0, s1
 1273f80: 54000585     	b.pl	0x1274030 <__start_il2cpp+0xcc86c>
 1273f84: 90ffa128     	adrp	x8, 0x697000
 1273f88: bd412780     	ldr	s0, [x28, #0x124]
 1273f8c: bd45d501     	ldr	s1, [x8, #0x5d4]
 1273f90: 52a85908     	mov	w8, #0x42c80000         // =1120403456
 1273f94: 1e211800     	fdiv	s0, s0, s1
 1273f98: 1e270101     	fmov	s1, w8
 1273f9c: 1e210800     	fmul	s0, s0, s1
 1273fa0: 1e212000     	fcmp	s0, s1
 1273fa4: 540003ab     	b.lt	0x1274018 <__start_il2cpp+0xcc854>
 1273fa8: f9400300     	ldr	x0, [x24]
 1273fac: b401b140     	cbz	x0, 0x12775d4 <__start_il2cpp+0xcfe10>
 1273fb0: b000af49     	adrp	x9, 0x285c000 <_ZTVN10__cxxabiv119__pointer_type_infoE+0x18>
 1273fb4: f9400261     	ldr	x1, [x19]
 1273fb8: f947a529     	ldr	x9, [x9, #0xf48]
 1273fbc: b9401c0a     	ldr	w10, [x0, #0x1c]
 1273fc0: f9400808     	ldr	x8, [x0, #0x10]
 1273fc4: f9400129     	ldr	x9, [x9]
 1273fc8: 1100054a     	add	w10, w10, #0x1
 1273fcc: b9001c0a     	str	w10, [x0, #0x1c]
 1273fd0: b401b028     	cbz	x8, 0x12775d4 <__start_il2cpp+0xcfe10>
 1273fd4: b980180a     	ldrsw	x10, [x0, #0x18]
 1273fd8: b940190b     	ldr	w11, [x8, #0x18]
 1273fdc: 6b0b015f     	cmp	w10, w11
 1273fe0: 54000102     	b.hs	0x1274000 <__start_il2cpp+0xcc83c>
 1273fe4: 11000549     	add	w9, w10, #0x1
 1273fe8: 8b0a0d08     	add	x8, x8, x10, lsl #3
 1273fec: 52a8590a     	mov	w10, #0x42c80000        // =1120403456
 1273ff0: b9001809     	str	w9, [x0, #0x18]
 1273ff4: f9001101     	str	x1, [x8, #0x20]
 1273ff8: 1e270140     	fmov	s0, w10
 1273ffc: 14000007     	b	0x1274018 <__start_il2cpp+0xcc854>
 1274000: f9401128     	ldr	x8, [x9, #0x20]
 1274004: f9406108     	ldr	x8, [x8, #0xc0]
 1274008: f9403902     	ldr	x2, [x8, #0x70]
 127400c: 941a1902     	bl	0x18fa414 <__start_il2cpp+0x752c50>
 1274010: 52a85908     	mov	w8, #0x42c80000         // =1120403456
 1274014: 1e270100     	fmov	s0, w8
 1274018: f94002e0     	ldr	x0, [x23]
 127401c: b401adc0     	cbz	x0, 0x12775d4 <__start_il2cpp+0xcfe10>
 1274020: f9400262     	ldr	x2, [x19]
 1274024: 2a1403e1     	mov	w1, w20
 1274028: aa1f03e3     	mov	x3, xzr
 127402c: 940063ca     	bl	0x128cf54 <__start_il2cpp+0xe5790>
 1274030: 39459388     	ldrb	w8, [x28, #0x164]
 1274034: 35000e28     	cbnz	w8, 0x12741f8 <__start_il2cpp+0xcca34>
 1274038: f94002e0     	ldr	x0, [x23]
 127403c: b401acc0     	cbz	x0, 0x12775d4 <__start_il2cpp+0xcfe10>
 1274040: d000af73     	adrp	x19, 0x2862000
 1274044: f9444273     	ldr	x19, [x19, #0x880]
 1274048: 2a1403e1     	mov	w1, w20
 127404c: aa1f03e3     	mov	x3, xzr
 1274050: f9400262     	ldr	x2, [x19]
 1274054: 940063b8     	bl	0x128cf34 <__start_il2cpp+0xe5770>
 1274058: 52a85908     	mov	w8, #0x42c80000         // =1120403456
 127405c: 1e270101     	fmov	s1, w8
 1274060: 1e212000     	fcmp	s0, s1
 1274064: 54000585     	b.pl	0x1274114 <__start_il2cpp+0xcc950>
 1274068: f0ffa108     	adrp	x8, 0x697000
 127406c: bd412780     	ldr	s0, [x28, #0x124]
 1274070: bd463d01     	ldr	s1, [x8, #0x63c]
 1274074: 52a85908     	mov	w8, #0x42c80000         // =1120403456
 1274078: 1e211800     	fdiv	s0, s0, s1
 127407c: 1e270101     	fmov	s1, w8
 1274080: 1e210800     	fmul	s0, s0, s1
 1274084: 1e212000     	fcmp	s0, s1
 1274088: 540003ab     	b.lt	0x12740fc <__start_il2cpp+0xcc938>
 127408c: f9400300     	ldr	x0, [x24]
 1274090: b401aa20     	cbz	x0, 0x12775d4 <__start_il2cpp+0xcfe10>
 1274094: 9000af49     	adrp	x9, 0x285c000 <_ZTVN10__cxxabiv119__pointer_type_infoE+0x18>
 1274098: f9400261     	ldr	x1, [x19]
 127409c: f947a529     	ldr	x9, [x9, #0xf48]
 12740a0: b9401c0a     	ldr	w10, [x0, #0x1c]
 12740a4: f9400808     	ldr	x8, [x0, #0x10]
 12740a8: f9400129     	ldr	x9, [x9]
 12740ac: 1100054a     	add	w10, w10, #0x1
 12740b0: b9001c0a     	str	w10, [x0, #0x1c]
 12740b4: b401a908     	cbz	x8, 0x12775d4 <__start_il2cpp+0xcfe10>
 12740b8: b980180a     	ldrsw	x10, [x0, #0x18]
 12740bc: b940190b     	ldr	w11, [x8, #0x18]
 12740c0: 6b0b015f     	cmp	w10, w11
 12740c4: 54000102     	b.hs	0x12740e4 <__start_il2cpp+0xcc920>
 12740c8: 11000549     	add	w9, w10, #0x1
 12740cc: 8b0a0d08     	add	x8, x8, x10, lsl #3
 12740d0: 52a8590a     	mov	w10, #0x42c80000        // =1120403456
 12740d4: b9001809     	str	w9, [x0, #0x18]
 12740d8: f9001101     	str	x1, [x8, #0x20]
 12740dc: 1e270140     	fmov	s0, w10
 12740e0: 14000007     	b	0x12740fc <__start_il2cpp+0xcc938>
 12740e4: f9401128     	ldr	x8, [x9, #0x20]
 12740e8: f9406108     	ldr	x8, [x8, #0xc0]
 12740ec: f9403902     	ldr	x2, [x8, #0x70]
 12740f0: 941a18c9     	bl	0x18fa414 <__start_il2cpp+0x752c50>
 12740f4: 52a85908     	mov	w8, #0x42c80000         // =1120403456
 12740f8: 1e270100     	fmov	s0, w8
 12740fc: f94002e0     	ldr	x0, [x23]
 1274100: b401a6a0     	cbz	x0, 0x12775d4 <__start_il2cpp+0xcfe10>
 1274104: f9400262     	ldr	x2, [x19]
 1274108: 2a1403e1     	mov	w1, w20
 127410c: aa1f03e3     	mov	x3, xzr
 1274110: 94006391     	bl	0x128cf54 <__start_il2cpp+0xe5790>
 1274114: 39459388     	ldrb	w8, [x28, #0x164]
 1274118: 35000708     	cbnz	w8, 0x12741f8 <__start_il2cpp+0xcca34>
 127411c: f94002e0     	ldr	x0, [x23]
 1274120: b401a5a0     	cbz	x0, 0x12775d4 <__start_il2cpp+0xcfe10>
 1274124: d000af73     	adrp	x19, 0x2862000
 1274128: f9445a73     	ldr	x19, [x19, #0x8b0]
 127412c: 2a1403e1     	mov	w1, w20
 1274130: aa1f03e3     	mov	x3, xzr
 1274134: f9400262     	ldr	x2, [x19]
 1274138: 9400637f     	bl	0x128cf34 <__start_il2cpp+0xe5770>
 127413c: 52a85908     	mov	w8, #0x42c80000         // =1120403456
 1274140: 1e270101     	fmov	s1, w8
 1274144: 1e212000     	fcmp	s0, s1
 1274148: 54000585     	b.pl	0x12741f8 <__start_il2cpp+0xcca34>
 127414c: f0ffa108     	adrp	x8, 0x697000
 1274150: bd412780     	ldr	s0, [x28, #0x124]
 1274154: bd465501     	ldr	s1, [x8, #0x654]
 1274158: 52a85908     	mov	w8, #0x42c80000         // =1120403456
 127415c: 1e211800     	fdiv	s0, s0, s1
 1274160: 1e270101     	fmov	s1, w8
 1274164: 1e210800     	fmul	s0, s0, s1
 1274168: 1e212000     	fcmp	s0, s1
 127416c: 540003ab     	b.lt	0x12741e0 <__start_il2cpp+0xcca1c>
 1274170: f9400300     	ldr	x0, [x24]
 1274174: b401a300     	cbz	x0, 0x12775d4 <__start_il2cpp+0xcfe10>
 1274178: 9000af49     	adrp	x9, 0x285c000 <_ZTVN10__cxxabiv119__pointer_type_infoE+0x18>
 127417c: f9400261     	ldr	x1, [x19]
 1274180: f947a529     	ldr	x9, [x9, #0xf48]
 1274184: b9401c0a     	ldr	w10, [x0, #0x1c]
 1274188: f9400808     	ldr	x8, [x0, #0x10]
 127418c: f9400129     	ldr	x9, [x9]
 1274190: 1100054a     	add	w10, w10, #0x1
 1274194: b9001c0a     	str	w10, [x0, #0x1c]
 1274198: b401a1e8     	cbz	x8, 0x12775d4 <__start_il2cpp+0xcfe10>
 127419c: b980180a     	ldrsw	x10, [x0, #0x18]
 12741a0: b940190b     	ldr	w11, [x8, #0x18]
 12741a4: 6b0b015f     	cmp	w10, w11
 12741a8: 54000102     	b.hs	0x12741c8 <__start_il2cpp+0xcca04>
 12741ac: 11000549     	add	w9, w10, #0x1
 12741b0: 8b0a0d08     	add	x8, x8, x10, lsl #3
 12741b4: 52a8590a     	mov	w10, #0x42c80000        // =1120403456
 12741b8: b9001809     	str	w9, [x0, #0x18]
 12741bc: f9001101     	str	x1, [x8, #0x20]
 12741c0: 1e270140     	fmov	s0, w10
 12741c4: 14000007     	b	0x12741e0 <__start_il2cpp+0xcca1c>
 12741c8: f9401128     	ldr	x8, [x9, #0x20]
 12741cc: f9406108     	ldr	x8, [x8, #0xc0]
 12741d0: f9403902     	ldr	x2, [x8, #0x70]
 12741d4: 941a1890     	bl	0x18fa414 <__start_il2cpp+0x752c50>
 12741d8: 52a85908     	mov	w8, #0x42c80000         // =1120403456
 12741dc: 1e270100     	fmov	s0, w8
 12741e0: f94002e0     	ldr	x0, [x23]
 12741e4: b4019f80     	cbz	x0, 0x12775d4 <__start_il2cpp+0xcfe10>
 12741e8: f9400262     	ldr	x2, [x19]
 12741ec: 2a1403e1     	mov	w1, w20
 12741f0: aa1f03e3     	mov	x3, xzr
 12741f4: 94006358     	bl	0x128cf54 <__start_il2cpp+0xe5790>
 12741f8: f94002e0     	ldr	x0, [x23]
 12741fc: b4019ec0     	cbz	x0, 0x12775d4 <__start_il2cpp+0xcfe10>
 1274200: d000af73     	adrp	x19, 0x2862000
 1274204: f9445e73     	ldr	x19, [x19, #0x8b8]
 1274208: 2a1403e1     	mov	w1, w20
 127420c: aa1f03e3     	mov	x3, xzr
 1274210: f9400262     	ldr	x2, [x19]
 1274214: 94006348     	bl	0x128cf34 <__start_il2cpp+0xe5770>
 1274218: 52a85908     	mov	w8, #0x42c80000         // =1120403456
 127421c: 1e270101     	fmov	s1, w8
 1274220: 1e212000     	fcmp	s0, s1
 1274224: 54000625     	b.pl	0x12742e8 <__start_il2cpp+0xccb24>
 1274228: f9403b88     	ldr	x8, [x28, #0x70]
 127422c: b4019d48     	cbz	x8, 0x12775d4 <__start_il2cpp+0xcfe10>
 1274230: bd413900     	ldr	s0, [x8, #0x138]
 1274234: f0ffa108     	adrp	x8, 0x697000
 1274238: bd450901     	ldr	s1, [x8, #0x508]
 127423c: 52a85908     	mov	w8, #0x42c80000         // =1120403456
 1274240: 5e21d800     	scvtf	s0, s0
 1274244: 1e211800     	fdiv	s0, s0, s1
 1274248: 1e270101     	fmov	s1, w8
 127424c: 1e210800     	fmul	s0, s0, s1
 1274250: 1e212000     	fcmp	s0, s1
 1274254: 540003eb     	b.lt	0x12742d0 <__start_il2cpp+0xccb0c>
 1274258: f9400300     	ldr	x0, [x24]
 127425c: b4019bc0     	cbz	x0, 0x12775d4 <__start_il2cpp+0xcfe10>
 1274260: 9000af49     	adrp	x9, 0x285c000 <_ZTVN10__cxxabiv119__pointer_type_infoE+0x18>
 1274264: f9400261     	ldr	x1, [x19]
 1274268: f947a529     	ldr	x9, [x9, #0xf48]
 127426c: b9401c0a     	ldr	w10, [x0, #0x1c]
 1274270: f9400808     	ldr	x8, [x0, #0x10]
 1274274: f9400129     	ldr	x9, [x9]
 1274278: 1100054a     	add	w10, w10, #0x1
 127427c: b9001c0a     	str	w10, [x0, #0x1c]
 1274280: b4019aa8     	cbz	x8, 0x12775d4 <__start_il2cpp+0xcfe10>
 1274284: b980180a     	ldrsw	x10, [x0, #0x18]
 1274288: b940190b     	ldr	w11, [x8, #0x18]
 127428c: 6b0b015f     	cmp	w10, w11
 1274290: 540000c2     	b.hs	0x12742a8 <__start_il2cpp+0xccae4>
 1274294: 11000549     	add	w9, w10, #0x1
 1274298: 8b0a0d08     	add	x8, x8, x10, lsl #3
 127429c: b9001809     	str	w9, [x0, #0x18]
 12742a0: f9001101     	str	x1, [x8, #0x20]
 12742a4: 14000005     	b	0x12742b8 <__start_il2cpp+0xccaf4>
 12742a8: f9401128     	ldr	x8, [x9, #0x20]
 12742ac: f9406108     	ldr	x8, [x8, #0xc0]
 12742b0: f9403902     	ldr	x2, [x8, #0x70]
 12742b4: 941a1858     	bl	0x18fa414 <__start_il2cpp+0x752c50>
 12742b8: f9403b88     	ldr	x8, [x28, #0x70]
 12742bc: b40198c8     	cbz	x8, 0x12775d4 <__start_il2cpp+0xcfe10>
 12742c0: b9413901     	ldr	w1, [x8, #0x138]
 12742c4: 97ffcddd     	bl	0x1267a38 <__start_il2cpp+0xc0274>
 12742c8: 52a85908     	mov	w8, #0x42c80000         // =1120403456
 12742cc: 1e270100     	fmov	s0, w8
 12742d0: f94002e0     	ldr	x0, [x23]
 12742d4: b4019800     	cbz	x0, 0x12775d4 <__start_il2cpp+0xcfe10>
 12742d8: f9400262     	ldr	x2, [x19]
 12742dc: 2a1403e1     	mov	w1, w20
 12742e0: aa1f03e3     	mov	x3, xzr
 12742e4: 9400631c     	bl	0x128cf54 <__start_il2cpp+0xe5790>
 12742e8: f94002e0     	ldr	x0, [x23]
 12742ec: b4019740     	cbz	x0, 0x12775d4 <__start_il2cpp+0xcfe10>
 12742f0: d000af73     	adrp	x19, 0x2862000
 12742f4: f9449a73     	ldr	x19, [x19, #0x930]
 12742f8: 2a1403e1     	mov	w1, w20
 12742fc: aa1f03e3     	mov	x3, xzr
 1274300: f9400262     	ldr	x2, [x19]
 1274304: 9400630c     	bl	0x128cf34 <__start_il2cpp+0xe5770>
 1274308: 52a85908     	mov	w8, #0x42c80000         // =1120403456
 127430c: 1e270101     	fmov	s1, w8
 1274310: 1e212000     	fcmp	s0, s1
 1274314: 54000625     	b.pl	0x12743d8 <__start_il2cpp+0xccc14>
 1274318: f9403b88     	ldr	x8, [x28, #0x70]
 127431c: b40195c8     	cbz	x8, 0x12775d4 <__start_il2cpp+0xcfe10>
 1274320: bd413900     	ldr	s0, [x8, #0x138]
 1274324: f0ffa108     	adrp	x8, 0x697000
 1274328: bd450d01     	ldr	s1, [x8, #0x50c]
 127432c: 52a85908     	mov	w8, #0x42c80000         // =1120403456
 1274330: 5e21d800     	scvtf	s0, s0
 1274334: 1e211800     	fdiv	s0, s0, s1
 1274338: 1e270101     	fmov	s1, w8
 127433c: 1e210800     	fmul	s0, s0, s1
 1274340: 1e212000     	fcmp	s0, s1
 1274344: 540003eb     	b.lt	0x12743c0 <__start_il2cpp+0xccbfc>
 1274348: f9400300     	ldr	x0, [x24]
 127434c: b4019440     	cbz	x0, 0x12775d4 <__start_il2cpp+0xcfe10>
 1274350: 9000af49     	adrp	x9, 0x285c000 <_ZTVN10__cxxabiv119__pointer_type_infoE+0x18>
 1274354: f9400261     	ldr	x1, [x19]
 1274358: f947a529     	ldr	x9, [x9, #0xf48]
 127435c: b9401c0a     	ldr	w10, [x0, #0x1c]
 1274360: f9400808     	ldr	x8, [x0, #0x10]
 1274364: f9400129     	ldr	x9, [x9]
 1274368: 1100054a     	add	w10, w10, #0x1
 127436c: b9001c0a     	str	w10, [x0, #0x1c]
 1274370: b4019328     	cbz	x8, 0x12775d4 <__start_il2cpp+0xcfe10>
 1274374: b980180a     	ldrsw	x10, [x0, #0x18]
 1274378: b940190b     	ldr	w11, [x8, #0x18]
 127437c: 6b0b015f     	cmp	w10, w11
 1274380: 540000c2     	b.hs	0x1274398 <__start_il2cpp+0xccbd4>
 1274384: 11000549     	add	w9, w10, #0x1
 1274388: 8b0a0d08     	add	x8, x8, x10, lsl #3
 127438c: b9001809     	str	w9, [x0, #0x18]
 1274390: f9001101     	str	x1, [x8, #0x20]
 1274394: 14000005     	b	0x12743a8 <__start_il2cpp+0xccbe4>
 1274398: f9401128     	ldr	x8, [x9, #0x20]
 127439c: f9406108     	ldr	x8, [x8, #0xc0]
 12743a0: f9403902     	ldr	x2, [x8, #0x70]
 12743a4: 941a181c     	bl	0x18fa414 <__start_il2cpp+0x752c50>
 12743a8: f9403b88     	ldr	x8, [x28, #0x70]
 12743ac: b4019148     	cbz	x8, 0x12775d4 <__start_il2cpp+0xcfe10>
 12743b0: b9413901     	ldr	w1, [x8, #0x138]
 12743b4: 97ffcda1     	bl	0x1267a38 <__start_il2cpp+0xc0274>
 12743b8: 52a85908     	mov	w8, #0x42c80000         // =1120403456
 12743bc: 1e270100     	fmov	s0, w8
 12743c0: f94002e0     	ldr	x0, [x23]
 12743c4: b4019080     	cbz	x0, 0x12775d4 <__start_il2cpp+0xcfe10>
 12743c8: f9400262     	ldr	x2, [x19]
 12743cc: 2a1403e1     	mov	w1, w20
 12743d0: aa1f03e3     	mov	x3, xzr
 12743d4: 940062e0     	bl	0x128cf54 <__start_il2cpp+0xe5790>
 12743d8: f94002e0     	ldr	x0, [x23]
 12743dc: b4018fc0     	cbz	x0, 0x12775d4 <__start_il2cpp+0xcfe10>
 12743e0: d000af73     	adrp	x19, 0x2862000
 12743e4: f9448e73     	ldr	x19, [x19, #0x918]
 12743e8: 2a1403e1     	mov	w1, w20
 12743ec: aa1f03e3     	mov	x3, xzr
 12743f0: f9400262     	ldr	x2, [x19]
 12743f4: 940062d0     	bl	0x128cf34 <__start_il2cpp+0xe5770>
 12743f8: 52a85908     	mov	w8, #0x42c80000         // =1120403456
 12743fc: 1e270101     	fmov	s1, w8
 1274400: 1e212000     	fcmp	s0, s1
 1274404: 54000625     	b.pl	0x12744c8 <__start_il2cpp+0xccd04>
 1274408: f9403b88     	ldr	x8, [x28, #0x70]
 127440c: b4018e48     	cbz	x8, 0x12775d4 <__start_il2cpp+0xcfe10>
 1274410: bd413900     	ldr	s0, [x8, #0x138]
 1274414: f0ffa108     	adrp	x8, 0x697000
 1274418: bd44dd01     	ldr	s1, [x8, #0x4dc]
 127441c: 52a85908     	mov	w8, #0x42c80000         // =1120403456
 1274420: 5e21d800     	scvtf	s0, s0
 1274424: 1e211800     	fdiv	s0, s0, s1
 1274428: 1e270101     	fmov	s1, w8
 127442c: 1e210800     	fmul	s0, s0, s1
 1274430: 1e212000     	fcmp	s0, s1
 1274434: 540003eb     	b.lt	0x12744b0 <__start_il2cpp+0xcccec>
 1274438: f9400300     	ldr	x0, [x24]
 127443c: b4018cc0     	cbz	x0, 0x12775d4 <__start_il2cpp+0xcfe10>
 1274440: 9000af49     	adrp	x9, 0x285c000 <_ZTVN10__cxxabiv119__pointer_type_infoE+0x18>
 1274444: f9400261     	ldr	x1, [x19]
 1274448: f947a529     	ldr	x9, [x9, #0xf48]
 127444c: b9401c0a     	ldr	w10, [x0, #0x1c]
 1274450: f9400808     	ldr	x8, [x0, #0x10]
 1274454: f9400129     	ldr	x9, [x9]
 1274458: 1100054a     	add	w10, w10, #0x1
 127445c: b9001c0a     	str	w10, [x0, #0x1c]
 1274460: b4018ba8     	cbz	x8, 0x12775d4 <__start_il2cpp+0xcfe10>
 1274464: b980180a     	ldrsw	x10, [x0, #0x18]
 1274468: b940190b     	ldr	w11, [x8, #0x18]
 127446c: 6b0b015f     	cmp	w10, w11
 1274470: 540000c2     	b.hs	0x1274488 <__start_il2cpp+0xcccc4>
 1274474: 11000549     	add	w9, w10, #0x1
 1274478: 8b0a0d08     	add	x8, x8, x10, lsl #3
 127447c: b9001809     	str	w9, [x0, #0x18]
 1274480: f9001101     	str	x1, [x8, #0x20]
 1274484: 14000005     	b	0x1274498 <__start_il2cpp+0xcccd4>
 1274488: f9401128     	ldr	x8, [x9, #0x20]
 127448c: f9406108     	ldr	x8, [x8, #0xc0]
 1274490: f9403902     	ldr	x2, [x8, #0x70]
 1274494: 941a17e0     	bl	0x18fa414 <__start_il2cpp+0x752c50>
 1274498: f9403b88     	ldr	x8, [x28, #0x70]
 127449c: b40189c8     	cbz	x8, 0x12775d4 <__start_il2cpp+0xcfe10>
 12744a0: b9413901     	ldr	w1, [x8, #0x138]
 12744a4: 97ffcd65     	bl	0x1267a38 <__start_il2cpp+0xc0274>
 12744a8: 52a85908     	mov	w8, #0x42c80000         // =1120403456
 12744ac: 1e270100     	fmov	s0, w8
 12744b0: f94002e0     	ldr	x0, [x23]
 12744b4: b4018900     	cbz	x0, 0x12775d4 <__start_il2cpp+0xcfe10>
 12744b8: f9400262     	ldr	x2, [x19]
 12744bc: 2a1403e1     	mov	w1, w20
 12744c0: aa1f03e3     	mov	x3, xzr
 12744c4: 940062a4     	bl	0x128cf54 <__start_il2cpp+0xe5790>
 12744c8: f94002e0     	ldr	x0, [x23]
 12744cc: b4018840     	cbz	x0, 0x12775d4 <__start_il2cpp+0xcfe10>
 12744d0: d000af73     	adrp	x19, 0x2862000
 12744d4: f9441a73     	ldr	x19, [x19, #0x830]
 12744d8: 2a1403e1     	mov	w1, w20
 12744dc: aa1f03e3     	mov	x3, xzr
 12744e0: f9400262     	ldr	x2, [x19]
 12744e4: 94006294     	bl	0x128cf34 <__start_il2cpp+0xe5770>
 12744e8: 52a85908     	mov	w8, #0x42c80000         // =1120403456
 12744ec: 1e270101     	fmov	s1, w8
 12744f0: 1e212000     	fcmp	s0, s1
 12744f4: 54000625     	b.pl	0x12745b8 <__start_il2cpp+0xccdf4>
 12744f8: f9403b88     	ldr	x8, [x28, #0x70]
 12744fc: b40186c8     	cbz	x8, 0x12775d4 <__start_il2cpp+0xcfe10>
 1274500: bd413900     	ldr	s0, [x8, #0x138]
 1274504: f0ffa108     	adrp	x8, 0x697000
 1274508: bd454901     	ldr	s1, [x8, #0x548]
 127450c: 52a85908     	mov	w8, #0x42c80000         // =1120403456
 1274510: 5e21d800     	scvtf	s0, s0
 1274514: 1e211800     	fdiv	s0, s0, s1
 1274518: 1e270101     	fmov	s1, w8
 127451c: 1e210800     	fmul	s0, s0, s1
 1274520: 1e212000     	fcmp	s0, s1
 1274524: 540003eb     	b.lt	0x12745a0 <__start_il2cpp+0xccddc>
 1274528: f9400300     	ldr	x0, [x24]
 127452c: b4018540     	cbz	x0, 0x12775d4 <__start_il2cpp+0xcfe10>
 1274530: 9000af49     	adrp	x9, 0x285c000 <_ZTVN10__cxxabiv119__pointer_type_infoE+0x18>
 1274534: f9400261     	ldr	x1, [x19]
 1274538: f947a529     	ldr	x9, [x9, #0xf48]
 127453c: b9401c0a     	ldr	w10, [x0, #0x1c]
 1274540: f9400808     	ldr	x8, [x0, #0x10]
 1274544: f9400129     	ldr	x9, [x9]
 1274548: 1100054a     	add	w10, w10, #0x1
 127454c: b9001c0a     	str	w10, [x0, #0x1c]
 1274550: b4018428     	cbz	x8, 0x12775d4 <__start_il2cpp+0xcfe10>
 1274554: b980180a     	ldrsw	x10, [x0, #0x18]
 1274558: b940190b     	ldr	w11, [x8, #0x18]
 127455c: 6b0b015f     	cmp	w10, w11
 1274560: 540000c2     	b.hs	0x1274578 <__start_il2cpp+0xccdb4>
 1274564: 11000549     	add	w9, w10, #0x1
 1274568: 8b0a0d08     	add	x8, x8, x10, lsl #3
 127456c: b9001809     	str	w9, [x0, #0x18]
 1274570: f9001101     	str	x1, [x8, #0x20]
 1274574: 14000005     	b	0x1274588 <__start_il2cpp+0xccdc4>
 1274578: f9401128     	ldr	x8, [x9, #0x20]
 127457c: f9406108     	ldr	x8, [x8, #0xc0]
 1274580: f9403902     	ldr	x2, [x8, #0x70]
 1274584: 941a17a4     	bl	0x18fa414 <__start_il2cpp+0x752c50>
 1274588: f9403b88     	ldr	x8, [x28, #0x70]
 127458c: b4018248     	cbz	x8, 0x12775d4 <__start_il2cpp+0xcfe10>
 1274590: b9413901     	ldr	w1, [x8, #0x138]
 1274594: 97ffcd29     	bl	0x1267a38 <__start_il2cpp+0xc0274>
 1274598: 52a85908     	mov	w8, #0x42c80000         // =1120403456
 127459c: 1e270100     	fmov	s0, w8
 12745a0: f94002e0     	ldr	x0, [x23]
 12745a4: b4018180     	cbz	x0, 0x12775d4 <__start_il2cpp+0xcfe10>
 12745a8: f9400262     	ldr	x2, [x19]
 12745ac: 2a1403e1     	mov	w1, w20
 12745b0: aa1f03e3     	mov	x3, xzr
 12745b4: 94006268     	bl	0x128cf54 <__start_il2cpp+0xe5790>
 12745b8: f94002e0     	ldr	x0, [x23]
 12745bc: b40180c0     	cbz	x0, 0x12775d4 <__start_il2cpp+0xcfe10>
 12745c0: d000af73     	adrp	x19, 0x2862000
 12745c4: f9442e73     	ldr	x19, [x19, #0x858]
 12745c8: 2a1403e1     	mov	w1, w20
 12745cc: aa1f03e3     	mov	x3, xzr
 12745d0: f9400262     	ldr	x2, [x19]
 12745d4: 94006258     	bl	0x128cf34 <__start_il2cpp+0xe5770>
 12745d8: 52a85908     	mov	w8, #0x42c80000         // =1120403456
 12745dc: 1e270101     	fmov	s1, w8
 12745e0: 1e212000     	fcmp	s0, s1
 12745e4: 54000625     	b.pl	0x12746a8 <__start_il2cpp+0xccee4>
 12745e8: f9403b88     	ldr	x8, [x28, #0x70]
 12745ec: b4017f48     	cbz	x8, 0x12775d4 <__start_il2cpp+0xcfe10>
 12745f0: bd413900     	ldr	s0, [x8, #0x138]
 12745f4: f0ffa108     	adrp	x8, 0x697000
 12745f8: bd45e501     	ldr	s1, [x8, #0x5e4]
 12745fc: 52a85908     	mov	w8, #0x42c80000         // =1120403456
 1274600: 5e21d800     	scvtf	s0, s0
 1274604: 1e211800     	fdiv	s0, s0, s1
 1274608: 1e270101     	fmov	s1, w8
 127460c: 1e210800     	fmul	s0, s0, s1
 1274610: 1e212000     	fcmp	s0, s1
 1274614: 540003eb     	b.lt	0x1274690 <__start_il2cpp+0xccecc>
 1274618: f9400300     	ldr	x0, [x24]
 127461c: b4017dc0     	cbz	x0, 0x12775d4 <__start_il2cpp+0xcfe10>
 1274620: 9000af49     	adrp	x9, 0x285c000 <_ZTVN10__cxxabiv119__pointer_type_infoE+0x18>
 1274624: f9400261     	ldr	x1, [x19]
 1274628: f947a529     	ldr	x9, [x9, #0xf48]
 127462c: b9401c0a     	ldr	w10, [x0, #0x1c]
 1274630: f9400808     	ldr	x8, [x0, #0x10]
 1274634: f9400129     	ldr	x9, [x9]
 1274638: 1100054a     	add	w10, w10, #0x1
 127463c: b9001c0a     	str	w10, [x0, #0x1c]
 1274640: b4017ca8     	cbz	x8, 0x12775d4 <__start_il2cpp+0xcfe10>
 1274644: b980180a     	ldrsw	x10, [x0, #0x18]
 1274648: b940190b     	ldr	w11, [x8, #0x18]
 127464c: 6b0b015f     	cmp	w10, w11
 1274650: 540000c2     	b.hs	0x1274668 <__start_il2cpp+0xccea4>
 1274654: 11000549     	add	w9, w10, #0x1
 1274658: 8b0a0d08     	add	x8, x8, x10, lsl #3
 127465c: b9001809     	str	w9, [x0, #0x18]
 1274660: f9001101     	str	x1, [x8, #0x20]
 1274664: 14000005     	b	0x1274678 <__start_il2cpp+0xcceb4>
 1274668: f9401128     	ldr	x8, [x9, #0x20]
 127466c: f9406108     	ldr	x8, [x8, #0xc0]
 1274670: f9403902     	ldr	x2, [x8, #0x70]
 1274674: 941a1768     	bl	0x18fa414 <__start_il2cpp+0x752c50>
 1274678: f9403b88     	ldr	x8, [x28, #0x70]
 127467c: b4017ac8     	cbz	x8, 0x12775d4 <__start_il2cpp+0xcfe10>
 1274680: b9413901     	ldr	w1, [x8, #0x138]
 1274684: 97ffcced     	bl	0x1267a38 <__start_il2cpp+0xc0274>
 1274688: 52a85908     	mov	w8, #0x42c80000         // =1120403456
 127468c: 1e270100     	fmov	s0, w8
 1274690: f94002e0     	ldr	x0, [x23]
 1274694: b4017a00     	cbz	x0, 0x12775d4 <__start_il2cpp+0xcfe10>
 1274698: f9400262     	ldr	x2, [x19]
 127469c: 2a1403e1     	mov	w1, w20
 12746a0: aa1f03e3     	mov	x3, xzr
 12746a4: 9400622c     	bl	0x128cf54 <__start_il2cpp+0xe5790>
 12746a8: f94002e0     	ldr	x0, [x23]
 12746ac: b4017940     	cbz	x0, 0x12775d4 <__start_il2cpp+0xcfe10>
 12746b0: d000af73     	adrp	x19, 0x2862000
 12746b4: f943e673     	ldr	x19, [x19, #0x7c8]
 12746b8: 2a1403e1     	mov	w1, w20
 12746bc: aa1f03e3     	mov	x3, xzr
 12746c0: f9400262     	ldr	x2, [x19]
 12746c4: 9400621c     	bl	0x128cf34 <__start_il2cpp+0xe5770>
 12746c8: 52a85908     	mov	w8, #0x42c80000         // =1120403456
 12746cc: 1e270101     	fmov	s1, w8
 12746d0: 1e212000     	fcmp	s0, s1
 12746d4: 54000625     	b.pl	0x1274798 <__start_il2cpp+0xccfd4>
 12746d8: f9403b88     	ldr	x8, [x28, #0x70]
 12746dc: b40177c8     	cbz	x8, 0x12775d4 <__start_il2cpp+0xcfe10>
 12746e0: bd413900     	ldr	s0, [x8, #0x138]
 12746e4: f0ffa108     	adrp	x8, 0x697000
 12746e8: bd46c101     	ldr	s1, [x8, #0x6c0]
 12746ec: 52a85908     	mov	w8, #0x42c80000         // =1120403456
 12746f0: 5e21d800     	scvtf	s0, s0
 12746f4: 1e211800     	fdiv	s0, s0, s1
 12746f8: 1e270101     	fmov	s1, w8
 12746fc: 1e210800     	fmul	s0, s0, s1
 1274700: 1e212000     	fcmp	s0, s1
 1274704: 540003eb     	b.lt	0x1274780 <__start_il2cpp+0xccfbc>
 1274708: f9400300     	ldr	x0, [x24]
 127470c: b4017640     	cbz	x0, 0x12775d4 <__start_il2cpp+0xcfe10>
 1274710: 9000af49     	adrp	x9, 0x285c000 <_ZTVN10__cxxabiv119__pointer_type_infoE+0x18>
 1274714: f9400261     	ldr	x1, [x19]
 1274718: f947a529     	ldr	x9, [x9, #0xf48]
 127471c: b9401c0a     	ldr	w10, [x0, #0x1c]
 1274720: f9400808     	ldr	x8, [x0, #0x10]
 1274724: f9400129     	ldr	x9, [x9]
 1274728: 1100054a     	add	w10, w10, #0x1
 127472c: b9001c0a     	str	w10, [x0, #0x1c]
 1274730: b4017528     	cbz	x8, 0x12775d4 <__start_il2cpp+0xcfe10>
 1274734: b980180a     	ldrsw	x10, [x0, #0x18]
 1274738: b940190b     	ldr	w11, [x8, #0x18]
 127473c: 6b0b015f     	cmp	w10, w11
 1274740: 540000c2     	b.hs	0x1274758 <__start_il2cpp+0xccf94>
 1274744: 11000549     	add	w9, w10, #0x1
 1274748: 8b0a0d08     	add	x8, x8, x10, lsl #3
 127474c: b9001809     	str	w9, [x0, #0x18]
 1274750: f9001101     	str	x1, [x8, #0x20]
 1274754: 14000005     	b	0x1274768 <__start_il2cpp+0xccfa4>
 1274758: f9401128     	ldr	x8, [x9, #0x20]
 127475c: f9406108     	ldr	x8, [x8, #0xc0]
 1274760: f9403902     	ldr	x2, [x8, #0x70]
 1274764: 941a172c     	bl	0x18fa414 <__start_il2cpp+0x752c50>
 1274768: f9403b88     	ldr	x8, [x28, #0x70]
 127476c: b4017348     	cbz	x8, 0x12775d4 <__start_il2cpp+0xcfe10>
 1274770: b9413901     	ldr	w1, [x8, #0x138]
 1274774: 97ffccb1     	bl	0x1267a38 <__start_il2cpp+0xc0274>
 1274778: 52a85908     	mov	w8, #0x42c80000         // =1120403456
 127477c: 1e270100     	fmov	s0, w8
 1274780: f94002e0     	ldr	x0, [x23]
 1274784: b4017280     	cbz	x0, 0x12775d4 <__start_il2cpp+0xcfe10>
 1274788: f9400262     	ldr	x2, [x19]
 127478c: 2a1403e1     	mov	w1, w20
 1274790: aa1f03e3     	mov	x3, xzr
 1274794: 940061f0     	bl	0x128cf54 <__start_il2cpp+0xe5790>
 1274798: f94002e0     	ldr	x0, [x23]
 127479c: b40171c0     	cbz	x0, 0x12775d4 <__start_il2cpp+0xcfe10>
 12747a0: d000af73     	adrp	x19, 0x2862000
 12747a4: f943f273     	ldr	x19, [x19, #0x7e0]
 12747a8: 2a1403e1     	mov	w1, w20
 12747ac: aa1f03e3     	mov	x3, xzr
 12747b0: f9400262     	ldr	x2, [x19]
 12747b4: 940061e0     	bl	0x128cf34 <__start_il2cpp+0xe5770>
 12747b8: 52a85908     	mov	w8, #0x42c80000         // =1120403456
 12747bc: 1e270101     	fmov	s1, w8
 12747c0: 1e212000     	fcmp	s0, s1
 12747c4: 54000625     	b.pl	0x1274888 <__start_il2cpp+0xcd0c4>
 12747c8: f9403b88     	ldr	x8, [x28, #0x70]
 12747cc: b4017048     	cbz	x8, 0x12775d4 <__start_il2cpp+0xcfe10>
 12747d0: bd413900     	ldr	s0, [x8, #0x138]
 12747d4: f0ffa108     	adrp	x8, 0x697000
 12747d8: bd46b501     	ldr	s1, [x8, #0x6b4]
 12747dc: 52a85908     	mov	w8, #0x42c80000         // =1120403456
 12747e0: 5e21d800     	scvtf	s0, s0
 12747e4: 1e211800     	fdiv	s0, s0, s1
 12747e8: 1e270101     	fmov	s1, w8
 12747ec: 1e210800     	fmul	s0, s0, s1
 12747f0: 1e212000     	fcmp	s0, s1
 12747f4: 540003eb     	b.lt	0x1274870 <__start_il2cpp+0xcd0ac>
 12747f8: f9400300     	ldr	x0, [x24]
 12747fc: b4016ec0     	cbz	x0, 0x12775d4 <__start_il2cpp+0xcfe10>
 1274800: 9000af49     	adrp	x9, 0x285c000 <_ZTVN10__cxxabiv119__pointer_type_infoE+0x18>
 1274804: f9400261     	ldr	x1, [x19]
 1274808: f947a529     	ldr	x9, [x9, #0xf48]
 127480c: b9401c0a     	ldr	w10, [x0, #0x1c]
 1274810: f9400808     	ldr	x8, [x0, #0x10]
 1274814: f9400129     	ldr	x9, [x9]
 1274818: 1100054a     	add	w10, w10, #0x1
 127481c: b9001c0a     	str	w10, [x0, #0x1c]
 1274820: b4016da8     	cbz	x8, 0x12775d4 <__start_il2cpp+0xcfe10>
 1274824: b980180a     	ldrsw	x10, [x0, #0x18]
 1274828: b940190b     	ldr	w11, [x8, #0x18]
 127482c: 6b0b015f     	cmp	w10, w11
 1274830: 540000c2     	b.hs	0x1274848 <__start_il2cpp+0xcd084>
 1274834: 11000549     	add	w9, w10, #0x1
 1274838: 8b0a0d08     	add	x8, x8, x10, lsl #3
 127483c: b9001809     	str	w9, [x0, #0x18]
 1274840: f9001101     	str	x1, [x8, #0x20]
 1274844: 14000005     	b	0x1274858 <__start_il2cpp+0xcd094>
 1274848: f9401128     	ldr	x8, [x9, #0x20]
 127484c: f9406108     	ldr	x8, [x8, #0xc0]
 1274850: f9403902     	ldr	x2, [x8, #0x70]
 1274854: 941a16f0     	bl	0x18fa414 <__start_il2cpp+0x752c50>
 1274858: f9403b88     	ldr	x8, [x28, #0x70]
 127485c: b4016bc8     	cbz	x8, 0x12775d4 <__start_il2cpp+0xcfe10>
 1274860: b9413901     	ldr	w1, [x8, #0x138]
 1274864: 97ffcc75     	bl	0x1267a38 <__start_il2cpp+0xc0274>
 1274868: 52a85908     	mov	w8, #0x42c80000         // =1120403456
 127486c: 1e270100     	fmov	s0, w8
 1274870: f94002e0     	ldr	x0, [x23]
 1274874: b4016b00     	cbz	x0, 0x12775d4 <__start_il2cpp+0xcfe10>
 1274878: f9400262     	ldr	x2, [x19]
 127487c: 2a1403e1     	mov	w1, w20
 1274880: aa1f03e3     	mov	x3, xzr
 1274884: 940061b4     	bl	0x128cf54 <__start_il2cpp+0xe5790>
 1274888: f94002e0     	ldr	x0, [x23]
 127488c: b4016a40     	cbz	x0, 0x12775d4 <__start_il2cpp+0xcfe10>
 1274890: d000af73     	adrp	x19, 0x2862000
 1274894: f9449673     	ldr	x19, [x19, #0x928]
 1274898: 2a1403e1     	mov	w1, w20
 127489c: aa1f03e3     	mov	x3, xzr
 12748a0: f9400262     	ldr	x2, [x19]
 12748a4: 940061a4     	bl	0x128cf34 <__start_il2cpp+0xe5770>
 12748a8: 52a85908     	mov	w8, #0x42c80000         // =1120403456
 12748ac: 1e270101     	fmov	s1, w8
 12748b0: 1e212000     	fcmp	s0, s1
 12748b4: 54000625     	b.pl	0x1274978 <__start_il2cpp+0xcd1b4>
 12748b8: f9403b88     	ldr	x8, [x28, #0x70]
 12748bc: b40168c8     	cbz	x8, 0x12775d4 <__start_il2cpp+0xcfe10>
 12748c0: bd413900     	ldr	s0, [x8, #0x138]
 12748c4: f0ffa108     	adrp	x8, 0x697000
 12748c8: bd458901     	ldr	s1, [x8, #0x588]
 12748cc: 52a85908     	mov	w8, #0x42c80000         // =1120403456
 12748d0: 5e21d800     	scvtf	s0, s0
 12748d4: 1e211800     	fdiv	s0, s0, s1
 12748d8: 1e270101     	fmov	s1, w8
 12748dc: 1e210800     	fmul	s0, s0, s1
 12748e0: 1e212000     	fcmp	s0, s1
 12748e4: 540003eb     	b.lt	0x1274960 <__start_il2cpp+0xcd19c>
 12748e8: f9400300     	ldr	x0, [x24]
 12748ec: b4016740     	cbz	x0, 0x12775d4 <__start_il2cpp+0xcfe10>
 12748f0: 9000af49     	adrp	x9, 0x285c000 <_ZTVN10__cxxabiv119__pointer_type_infoE+0x18>
 12748f4: f9400261     	ldr	x1, [x19]
 12748f8: f947a529     	ldr	x9, [x9, #0xf48]
 12748fc: b9401c0a     	ldr	w10, [x0, #0x1c]
 1274900: f9400808     	ldr	x8, [x0, #0x10]
 1274904: f9400129     	ldr	x9, [x9]
 1274908: 1100054a     	add	w10, w10, #0x1
 127490c: b9001c0a     	str	w10, [x0, #0x1c]
 1274910: b4016628     	cbz	x8, 0x12775d4 <__start_il2cpp+0xcfe10>
 1274914: b980180a     	ldrsw	x10, [x0, #0x18]
 1274918: b940190b     	ldr	w11, [x8, #0x18]
 127491c: 6b0b015f     	cmp	w10, w11
 1274920: 540000c2     	b.hs	0x1274938 <__start_il2cpp+0xcd174>
 1274924: 11000549     	add	w9, w10, #0x1
 1274928: 8b0a0d08     	add	x8, x8, x10, lsl #3
 127492c: b9001809     	str	w9, [x0, #0x18]
 1274930: f9001101     	str	x1, [x8, #0x20]
 1274934: 14000005     	b	0x1274948 <__start_il2cpp+0xcd184>
 1274938: f9401128     	ldr	x8, [x9, #0x20]
 127493c: f9406108     	ldr	x8, [x8, #0xc0]
 1274940: f9403902     	ldr	x2, [x8, #0x70]
 1274944: 941a16b4     	bl	0x18fa414 <__start_il2cpp+0x752c50>
 1274948: f9403b88     	ldr	x8, [x28, #0x70]
 127494c: b4016448     	cbz	x8, 0x12775d4 <__start_il2cpp+0xcfe10>
 1274950: b9413901     	ldr	w1, [x8, #0x138]
 1274954: 97ffcc39     	bl	0x1267a38 <__start_il2cpp+0xc0274>
 1274958: 52a85908     	mov	w8, #0x42c80000         // =1120403456
 127495c: 1e270100     	fmov	s0, w8
 1274960: f94002e0     	ldr	x0, [x23]
 1274964: b4016380     	cbz	x0, 0x12775d4 <__start_il2cpp+0xcfe10>
 1274968: f9400262     	ldr	x2, [x19]
 127496c: 2a1403e1     	mov	w1, w20
 1274970: aa1f03e3     	mov	x3, xzr
 1274974: 94006178     	bl	0x128cf54 <__start_il2cpp+0xe5790>
 1274978: 3945b388     	ldrb	w8, [x28, #0x16c]
 127497c: 35000768     	cbnz	w8, 0x1274a68 <__start_il2cpp+0xcd2a4>
 1274980: f94002e0     	ldr	x0, [x23]
 1274984: b4016280     	cbz	x0, 0x12775d4 <__start_il2cpp+0xcfe10>
 1274988: d000af73     	adrp	x19, 0x2862000
 127498c: f9442673     	ldr	x19, [x19, #0x848]
 1274990: 2a1403e1     	mov	w1, w20
 1274994: aa1f03e3     	mov	x3, xzr
 1274998: f9400262     	ldr	x2, [x19]
 127499c: 94006166     	bl	0x128cf34 <__start_il2cpp+0xe5770>
 12749a0: 52a85908     	mov	w8, #0x42c80000         // =1120403456
 12749a4: 1e270101     	fmov	s1, w8
 12749a8: 1e212000     	fcmp	s0, s1
 12749ac: 540005e5     	b.pl	0x1274a68 <__start_il2cpp+0xcd2a4>
 12749b0: f9403b88     	ldr	x8, [x28, #0x70]
 12749b4: b4016108     	cbz	x8, 0x12775d4 <__start_il2cpp+0xcfe10>
 12749b8: bd413900     	ldr	s0, [x8, #0x138]
 12749bc: f0ffa108     	adrp	x8, 0x697000
 12749c0: bd46c101     	ldr	s1, [x8, #0x6c0]
 12749c4: 52a85908     	mov	w8, #0x42c80000         // =1120403456
 12749c8: 5e21d800     	scvtf	s0, s0
 12749cc: 1e211800     	fdiv	s0, s0, s1
 12749d0: 1e270101     	fmov	s1, w8
 12749d4: 1e210800     	fmul	s0, s0, s1
 12749d8: 1e212000     	fcmp	s0, s1
 12749dc: 540003ab     	b.lt	0x1274a50 <__start_il2cpp+0xcd28c>
 12749e0: f9400300     	ldr	x0, [x24]
 12749e4: b4015f80     	cbz	x0, 0x12775d4 <__start_il2cpp+0xcfe10>
 12749e8: 9000af49     	adrp	x9, 0x285c000 <_ZTVN10__cxxabiv119__pointer_type_infoE+0x18>
 12749ec: f9400261     	ldr	x1, [x19]
 12749f0: f947a529     	ldr	x9, [x9, #0xf48]
 12749f4: b9401c0a     	ldr	w10, [x0, #0x1c]
 12749f8: f9400808     	ldr	x8, [x0, #0x10]
 12749fc: f9400129     	ldr	x9, [x9]
 1274a00: 1100054a     	add	w10, w10, #0x1
 1274a04: b9001c0a     	str	w10, [x0, #0x1c]
 1274a08: b4015e68     	cbz	x8, 0x12775d4 <__start_il2cpp+0xcfe10>
 1274a0c: b980180a     	ldrsw	x10, [x0, #0x18]
 1274a10: b940190b     	ldr	w11, [x8, #0x18]
 1274a14: 6b0b015f     	cmp	w10, w11
 1274a18: 54000102     	b.hs	0x1274a38 <__start_il2cpp+0xcd274>
 1274a1c: 11000549     	add	w9, w10, #0x1
 1274a20: 8b0a0d08     	add	x8, x8, x10, lsl #3
 1274a24: 52a8590a     	mov	w10, #0x42c80000        // =1120403456
 1274a28: b9001809     	str	w9, [x0, #0x18]
 1274a2c: f9001101     	str	x1, [x8, #0x20]
 1274a30: 1e270140     	fmov	s0, w10
 1274a34: 14000007     	b	0x1274a50 <__start_il2cpp+0xcd28c>
 1274a38: f9401128     	ldr	x8, [x9, #0x20]
 1274a3c: f9406108     	ldr	x8, [x8, #0xc0]
 1274a40: f9403902     	ldr	x2, [x8, #0x70]
 1274a44: 941a1674     	bl	0x18fa414 <__start_il2cpp+0x752c50>
 1274a48: 52a85908     	mov	w8, #0x42c80000         // =1120403456
 1274a4c: 1e270100     	fmov	s0, w8
 1274a50: f94002e0     	ldr	x0, [x23]
 1274a54: b4015c00     	cbz	x0, 0x12775d4 <__start_il2cpp+0xcfe10>
 1274a58: f9400262     	ldr	x2, [x19]
 1274a5c: 2a1403e1     	mov	w1, w20
 1274a60: aa1f03e3     	mov	x3, xzr
 1274a64: 9400613c     	bl	0x128cf54 <__start_il2cpp+0xe5790>
 1274a68: f94002e0     	ldr	x0, [x23]
 1274a6c: b4015b40     	cbz	x0, 0x12775d4 <__start_il2cpp+0xcfe10>
 1274a70: d000af73     	adrp	x19, 0x2862000
 1274a74: f943f673     	ldr	x19, [x19, #0x7e8]
 1274a78: 2a1403e1     	mov	w1, w20
 1274a7c: aa1f03e3     	mov	x3, xzr
 1274a80: f9400262     	ldr	x2, [x19]
 1274a84: 9400612c     	bl	0x128cf34 <__start_il2cpp+0xe5770>
 1274a88: 52a85908     	mov	w8, #0x42c80000         // =1120403456
 1274a8c: 1e270101     	fmov	s1, w8
 1274a90: 1e212000     	fcmp	s0, s1
 1274a94: 54000625     	b.pl	0x1274b58 <__start_il2cpp+0xcd394>
 1274a98: f9403b88     	ldr	x8, [x28, #0x70]
 1274a9c: b40159c8     	cbz	x8, 0x12775d4 <__start_il2cpp+0xcfe10>
 1274aa0: bd413900     	ldr	s0, [x8, #0x138]
 1274aa4: f0ffa108     	adrp	x8, 0x697000
 1274aa8: bd456901     	ldr	s1, [x8, #0x568]
 1274aac: 52a85908     	mov	w8, #0x42c80000         // =1120403456
 1274ab0: 5e21d800     	scvtf	s0, s0
 1274ab4: 1e211800     	fdiv	s0, s0, s1
 1274ab8: 1e270101     	fmov	s1, w8
 1274abc: 1e210800     	fmul	s0, s0, s1
 1274ac0: 1e212000     	fcmp	s0, s1
 1274ac4: 540003eb     	b.lt	0x1274b40 <__start_il2cpp+0xcd37c>
 1274ac8: f9400300     	ldr	x0, [x24]
 1274acc: b4015840     	cbz	x0, 0x12775d4 <__start_il2cpp+0xcfe10>
 1274ad0: 9000af49     	adrp	x9, 0x285c000 <_ZTVN10__cxxabiv119__pointer_type_infoE+0x18>
 1274ad4: f9400261     	ldr	x1, [x19]
 1274ad8: f947a529     	ldr	x9, [x9, #0xf48]
 1274adc: b9401c0a     	ldr	w10, [x0, #0x1c]
 1274ae0: f9400808     	ldr	x8, [x0, #0x10]
 1274ae4: f9400129     	ldr	x9, [x9]
 1274ae8: 1100054a     	add	w10, w10, #0x1
 1274aec: b9001c0a     	str	w10, [x0, #0x1c]
 1274af0: b4015728     	cbz	x8, 0x12775d4 <__start_il2cpp+0xcfe10>
 1274af4: b980180a     	ldrsw	x10, [x0, #0x18]
 1274af8: b940190b     	ldr	w11, [x8, #0x18]
 1274afc: 6b0b015f     	cmp	w10, w11
 1274b00: 540000c2     	b.hs	0x1274b18 <__start_il2cpp+0xcd354>
 1274b04: 11000549     	add	w9, w10, #0x1
 1274b08: 8b0a0d08     	add	x8, x8, x10, lsl #3
 1274b0c: b9001809     	str	w9, [x0, #0x18]
 1274b10: f9001101     	str	x1, [x8, #0x20]
 1274b14: 14000005     	b	0x1274b28 <__start_il2cpp+0xcd364>
 1274b18: f9401128     	ldr	x8, [x9, #0x20]
 1274b1c: f9406108     	ldr	x8, [x8, #0xc0]
 1274b20: f9403902     	ldr	x2, [x8, #0x70]
 1274b24: 941a163c     	bl	0x18fa414 <__start_il2cpp+0x752c50>
 1274b28: f9403b88     	ldr	x8, [x28, #0x70]
 1274b2c: b4015548     	cbz	x8, 0x12775d4 <__start_il2cpp+0xcfe10>
 1274b30: b9413901     	ldr	w1, [x8, #0x138]
 1274b34: 97ffcbc1     	bl	0x1267a38 <__start_il2cpp+0xc0274>
 1274b38: 52a85908     	mov	w8, #0x42c80000         // =1120403456
 1274b3c: 1e270100     	fmov	s0, w8
 1274b40: f94002e0     	ldr	x0, [x23]
 1274b44: b4015480     	cbz	x0, 0x12775d4 <__start_il2cpp+0xcfe10>
 1274b48: f9400262     	ldr	x2, [x19]
 1274b4c: 2a1403e1     	mov	w1, w20
 1274b50: aa1f03e3     	mov	x3, xzr
 1274b54: 94006100     	bl	0x128cf54 <__start_il2cpp+0xe5790>
 1274b58: f94002e0     	ldr	x0, [x23]
 1274b5c: b40153c0     	cbz	x0, 0x12775d4 <__start_il2cpp+0xcfe10>
 1274b60: d000af73     	adrp	x19, 0x2862000
 1274b64: f943d273     	ldr	x19, [x19, #0x7a0]
 1274b68: 2a1403e1     	mov	w1, w20
 1274b6c: aa1f03e3     	mov	x3, xzr
 1274b70: f9400262     	ldr	x2, [x19]
 1274b74: 940060f0     	bl	0x128cf34 <__start_il2cpp+0xe5770>
 1274b78: 52a85908     	mov	w8, #0x42c80000         // =1120403456
 1274b7c: 1e270101     	fmov	s1, w8
 1274b80: 1e212000     	fcmp	s0, s1
 1274b84: 540005a5     	b.pl	0x1274c38 <__start_il2cpp+0xcd474>
 1274b88: f9403b88     	ldr	x8, [x28, #0x70]
 1274b8c: b4015248     	cbz	x8, 0x12775d4 <__start_il2cpp+0xcfe10>
 1274b90: bd414900     	ldr	s0, [x8, #0x148]
 1274b94: 52a85908     	mov	w8, #0x42c80000         // =1120403456
 1274b98: 1e270101     	fmov	s1, w8
 1274b9c: 5e21d800     	scvtf	s0, s0
 1274ba0: 1e211800     	fdiv	s0, s0, s1
 1274ba4: 1e210800     	fmul	s0, s0, s1
 1274ba8: 1e212000     	fcmp	s0, s1
 1274bac: 540003ab     	b.lt	0x1274c20 <__start_il2cpp+0xcd45c>
 1274bb0: f9400300     	ldr	x0, [x24]
 1274bb4: b4015100     	cbz	x0, 0x12775d4 <__start_il2cpp+0xcfe10>
 1274bb8: 9000af49     	adrp	x9, 0x285c000 <_ZTVN10__cxxabiv119__pointer_type_infoE+0x18>
 1274bbc: f9400261     	ldr	x1, [x19]
 1274bc0: f947a529     	ldr	x9, [x9, #0xf48]
 1274bc4: b9401c0a     	ldr	w10, [x0, #0x1c]
 1274bc8: f9400808     	ldr	x8, [x0, #0x10]
 1274bcc: f9400129     	ldr	x9, [x9]
 1274bd0: 1100054a     	add	w10, w10, #0x1
 1274bd4: b9001c0a     	str	w10, [x0, #0x1c]
 1274bd8: b4014fe8     	cbz	x8, 0x12775d4 <__start_il2cpp+0xcfe10>
 1274bdc: b980180a     	ldrsw	x10, [x0, #0x18]
 1274be0: b940190b     	ldr	w11, [x8, #0x18]
 1274be4: 6b0b015f     	cmp	w10, w11
 1274be8: 54000102     	b.hs	0x1274c08 <__start_il2cpp+0xcd444>
 1274bec: 11000549     	add	w9, w10, #0x1
 1274bf0: 8b0a0d08     	add	x8, x8, x10, lsl #3
 1274bf4: 52a8590a     	mov	w10, #0x42c80000        // =1120403456
 1274bf8: b9001809     	str	w9, [x0, #0x18]
 1274bfc: f9001101     	str	x1, [x8, #0x20]
 1274c00: 1e270140     	fmov	s0, w10
 1274c04: 14000007     	b	0x1274c20 <__start_il2cpp+0xcd45c>
 1274c08: f9401128     	ldr	x8, [x9, #0x20]
 1274c0c: f9406108     	ldr	x8, [x8, #0xc0]
 1274c10: f9403902     	ldr	x2, [x8, #0x70]
 1274c14: 941a1600     	bl	0x18fa414 <__start_il2cpp+0x752c50>
 1274c18: 52a85908     	mov	w8, #0x42c80000         // =1120403456
 1274c1c: 1e270100     	fmov	s0, w8
 1274c20: f94002e0     	ldr	x0, [x23]
 1274c24: b4014d80     	cbz	x0, 0x12775d4 <__start_il2cpp+0xcfe10>
 1274c28: f9400262     	ldr	x2, [x19]
 1274c2c: 2a1403e1     	mov	w1, w20
 1274c30: aa1f03e3     	mov	x3, xzr
 1274c34: 940060c8     	bl	0x128cf54 <__start_il2cpp+0xe5790>
 1274c38: f94002e0     	ldr	x0, [x23]
 1274c3c: b4014cc0     	cbz	x0, 0x12775d4 <__start_il2cpp+0xcfe10>
 1274c40: d000af73     	adrp	x19, 0x2862000
 1274c44: f9442a73     	ldr	x19, [x19, #0x850]
 1274c48: 2a1403e1     	mov	w1, w20
 1274c4c: aa1f03e3     	mov	x3, xzr
 1274c50: f9400262     	ldr	x2, [x19]
 1274c54: 940060b8     	bl	0x128cf34 <__start_il2cpp+0xe5770>
 1274c58: 52a85908     	mov	w8, #0x42c80000         // =1120403456
 1274c5c: 1e270101     	fmov	s1, w8
 1274c60: 1e212000     	fcmp	s0, s1
 1274c64: 540005e5     	b.pl	0x1274d20 <__start_il2cpp+0xcd55c>
 1274c68: f9403b88     	ldr	x8, [x28, #0x70]
 1274c6c: b4014b48     	cbz	x8, 0x12775d4 <__start_il2cpp+0xcfe10>
 1274c70: bd414900     	ldr	s0, [x8, #0x148]
 1274c74: 52a86f48     	mov	w8, #0x437a0000         // =1132068864
 1274c78: 1e270101     	fmov	s1, w8
 1274c7c: 52a85908     	mov	w8, #0x42c80000         // =1120403456
 1274c80: 5e21d800     	scvtf	s0, s0
 1274c84: 1e211800     	fdiv	s0, s0, s1
 1274c88: 1e270101     	fmov	s1, w8
 1274c8c: 1e210800     	fmul	s0, s0, s1
 1274c90: 1e212000     	fcmp	s0, s1
 1274c94: 540003ab     	b.lt	0x1274d08 <__start_il2cpp+0xcd544>
 1274c98: f9400300     	ldr	x0, [x24]
 1274c9c: b40149c0     	cbz	x0, 0x12775d4 <__start_il2cpp+0xcfe10>
 1274ca0: 9000af49     	adrp	x9, 0x285c000 <_ZTVN10__cxxabiv119__pointer_type_infoE+0x18>
 1274ca4: f9400261     	ldr	x1, [x19]
 1274ca8: f947a529     	ldr	x9, [x9, #0xf48]
 1274cac: b9401c0a     	ldr	w10, [x0, #0x1c]
 1274cb0: f9400808     	ldr	x8, [x0, #0x10]
 1274cb4: f9400129     	ldr	x9, [x9]
 1274cb8: 1100054a     	add	w10, w10, #0x1
 1274cbc: b9001c0a     	str	w10, [x0, #0x1c]
 1274cc0: b40148a8     	cbz	x8, 0x12775d4 <__start_il2cpp+0xcfe10>
 1274cc4: b980180a     	ldrsw	x10, [x0, #0x18]
 1274cc8: b940190b     	ldr	w11, [x8, #0x18]
 1274ccc: 6b0b015f     	cmp	w10, w11
 1274cd0: 54000102     	b.hs	0x1274cf0 <__start_il2cpp+0xcd52c>
 1274cd4: 11000549     	add	w9, w10, #0x1
 1274cd8: 8b0a0d08     	add	x8, x8, x10, lsl #3
 1274cdc: 52a8590a     	mov	w10, #0x42c80000        // =1120403456
 1274ce0: b9001809     	str	w9, [x0, #0x18]
 1274ce4: f9001101     	str	x1, [x8, #0x20]
 1274ce8: 1e270140     	fmov	s0, w10
 1274cec: 14000007     	b	0x1274d08 <__start_il2cpp+0xcd544>
 1274cf0: f9401128     	ldr	x8, [x9, #0x20]
 1274cf4: f9406108     	ldr	x8, [x8, #0xc0]
 1274cf8: f9403902     	ldr	x2, [x8, #0x70]
 1274cfc: 941a15c6     	bl	0x18fa414 <__start_il2cpp+0x752c50>
 1274d00: 52a85908     	mov	w8, #0x42c80000         // =1120403456
 1274d04: 1e270100     	fmov	s0, w8
 1274d08: f94002e0     	ldr	x0, [x23]
 1274d0c: b4014640     	cbz	x0, 0x12775d4 <__start_il2cpp+0xcfe10>
 1274d10: f9400262     	ldr	x2, [x19]
 1274d14: 2a1403e1     	mov	w1, w20
 1274d18: aa1f03e3     	mov	x3, xzr
 1274d1c: 9400608e     	bl	0x128cf54 <__start_il2cpp+0xe5790>
 1274d20: f94002e0     	ldr	x0, [x23]
 1274d24: b4014580     	cbz	x0, 0x12775d4 <__start_il2cpp+0xcfe10>
 1274d28: d000af73     	adrp	x19, 0x2862000
 1274d2c: f943fe73     	ldr	x19, [x19, #0x7f8]
 1274d30: 2a1403e1     	mov	w1, w20
 1274d34: aa1f03e3     	mov	x3, xzr
 1274d38: f9400262     	ldr	x2, [x19]
 1274d3c: 9400607e     	bl	0x128cf34 <__start_il2cpp+0xe5770>
 1274d40: 52a85908     	mov	w8, #0x42c80000         // =1120403456
 1274d44: 1e270101     	fmov	s1, w8
 1274d48: 1e212000     	fcmp	s0, s1
 1274d4c: 540005e5     	b.pl	0x1274e08 <__start_il2cpp+0xcd644>
 1274d50: f9403b88     	ldr	x8, [x28, #0x70]
 1274d54: b4014408     	cbz	x8, 0x12775d4 <__start_il2cpp+0xcfe10>
 1274d58: bd414900     	ldr	s0, [x8, #0x148]
 1274d5c: 52a87f48     	mov	w8, #0x43fa0000         // =1140457472
 1274d60: 1e270101     	fmov	s1, w8
 1274d64: 52a85908     	mov	w8, #0x42c80000         // =1120403456
 1274d68: 5e21d800     	scvtf	s0, s0
 1274d6c: 1e211800     	fdiv	s0, s0, s1
 1274d70: 1e270101     	fmov	s1, w8
 1274d74: 1e210800     	fmul	s0, s0, s1
 1274d78: 1e212000     	fcmp	s0, s1
 1274d7c: 540003ab     	b.lt	0x1274df0 <__start_il2cpp+0xcd62c>
 1274d80: f9400300     	ldr	x0, [x24]
 1274d84: b4014280     	cbz	x0, 0x12775d4 <__start_il2cpp+0xcfe10>
 1274d88: 9000af49     	adrp	x9, 0x285c000 <_ZTVN10__cxxabiv119__pointer_type_infoE+0x18>
 1274d8c: f9400261     	ldr	x1, [x19]
 1274d90: f947a529     	ldr	x9, [x9, #0xf48]
 1274d94: b9401c0a     	ldr	w10, [x0, #0x1c]
 1274d98: f9400808     	ldr	x8, [x0, #0x10]
 1274d9c: f9400129     	ldr	x9, [x9]
 1274da0: 1100054a     	add	w10, w10, #0x1
 1274da4: b9001c0a     	str	w10, [x0, #0x1c]
 1274da8: b4014168     	cbz	x8, 0x12775d4 <__start_il2cpp+0xcfe10>
 1274dac: b980180a     	ldrsw	x10, [x0, #0x18]
 1274db0: b940190b     	ldr	w11, [x8, #0x18]
 1274db4: 6b0b015f     	cmp	w10, w11
 1274db8: 54000102     	b.hs	0x1274dd8 <__start_il2cpp+0xcd614>
 1274dbc: 11000549     	add	w9, w10, #0x1
 1274dc0: 8b0a0d08     	add	x8, x8, x10, lsl #3
 1274dc4: 52a8590a     	mov	w10, #0x42c80000        // =1120403456
 1274dc8: b9001809     	str	w9, [x0, #0x18]
 1274dcc: f9001101     	str	x1, [x8, #0x20]
 1274dd0: 1e270140     	fmov	s0, w10
 1274dd4: 14000007     	b	0x1274df0 <__start_il2cpp+0xcd62c>
 1274dd8: f9401128     	ldr	x8, [x9, #0x20]
 1274ddc: f9406108     	ldr	x8, [x8, #0xc0]
 1274de0: f9403902     	ldr	x2, [x8, #0x70]
 1274de4: 941a158c     	bl	0x18fa414 <__start_il2cpp+0x752c50>
 1274de8: 52a85908     	mov	w8, #0x42c80000         // =1120403456
 1274dec: 1e270100     	fmov	s0, w8
 1274df0: f94002e0     	ldr	x0, [x23]
 1274df4: b4013f00     	cbz	x0, 0x12775d4 <__start_il2cpp+0xcfe10>
 1274df8: f9400262     	ldr	x2, [x19]
 1274dfc: 2a1403e1     	mov	w1, w20
 1274e00: aa1f03e3     	mov	x3, xzr
 1274e04: 94006054     	bl	0x128cf54 <__start_il2cpp+0xe5790>
 1274e08: f94002e0     	ldr	x0, [x23]
 1274e0c: b4013e40     	cbz	x0, 0x12775d4 <__start_il2cpp+0xcfe10>
 1274e10: d000af73     	adrp	x19, 0x2862000
 1274e14: f9443e73     	ldr	x19, [x19, #0x878]
 1274e18: 2a1403e1     	mov	w1, w20
 1274e1c: aa1f03e3     	mov	x3, xzr
 1274e20: f9400262     	ldr	x2, [x19]
 1274e24: 94006044     	bl	0x128cf34 <__start_il2cpp+0xe5770>
 1274e28: 52a85908     	mov	w8, #0x42c80000         // =1120403456
 1274e2c: 1e270101     	fmov	s1, w8
 1274e30: 1e212000     	fcmp	s0, s1
 1274e34: 540005e5     	b.pl	0x1274ef0 <__start_il2cpp+0xcd72c>
 1274e38: f9403b88     	ldr	x8, [x28, #0x70]
 1274e3c: b4013cc8     	cbz	x8, 0x12775d4 <__start_il2cpp+0xcfe10>
 1274e40: bd414900     	ldr	s0, [x8, #0x148]
 1274e44: f0ffa108     	adrp	x8, 0x697000
 1274e48: bd44e101     	ldr	s1, [x8, #0x4e0]
 1274e4c: 52a85908     	mov	w8, #0x42c80000         // =1120403456
 1274e50: 5e21d800     	scvtf	s0, s0
 1274e54: 1e211800     	fdiv	s0, s0, s1
 1274e58: 1e270101     	fmov	s1, w8
 1274e5c: 1e210800     	fmul	s0, s0, s1
 1274e60: 1e212000     	fcmp	s0, s1
 1274e64: 540003ab     	b.lt	0x1274ed8 <__start_il2cpp+0xcd714>
 1274e68: f9400300     	ldr	x0, [x24]
 1274e6c: b4013b40     	cbz	x0, 0x12775d4 <__start_il2cpp+0xcfe10>
 1274e70: 9000af49     	adrp	x9, 0x285c000 <_ZTVN10__cxxabiv119__pointer_type_infoE+0x18>
 1274e74: f9400261     	ldr	x1, [x19]
 1274e78: f947a529     	ldr	x9, [x9, #0xf48]
 1274e7c: b9401c0a     	ldr	w10, [x0, #0x1c]
 1274e80: f9400808     	ldr	x8, [x0, #0x10]
 1274e84: f9400129     	ldr	x9, [x9]
 1274e88: 1100054a     	add	w10, w10, #0x1
 1274e8c: b9001c0a     	str	w10, [x0, #0x1c]
 1274e90: b4013a28     	cbz	x8, 0x12775d4 <__start_il2cpp+0xcfe10>
 1274e94: b980180a     	ldrsw	x10, [x0, #0x18]
 1274e98: b940190b     	ldr	w11, [x8, #0x18]
 1274e9c: 6b0b015f     	cmp	w10, w11
 1274ea0: 54000102     	b.hs	0x1274ec0 <__start_il2cpp+0xcd6fc>
 1274ea4: 11000549     	add	w9, w10, #0x1
 1274ea8: 8b0a0d08     	add	x8, x8, x10, lsl #3
 1274eac: 52a8590a     	mov	w10, #0x42c80000        // =1120403456
 1274eb0: b9001809     	str	w9, [x0, #0x18]
 1274eb4: f9001101     	str	x1, [x8, #0x20]
 1274eb8: 1e270140     	fmov	s0, w10
 1274ebc: 14000007     	b	0x1274ed8 <__start_il2cpp+0xcd714>
 1274ec0: f9401128     	ldr	x8, [x9, #0x20]
 1274ec4: f9406108     	ldr	x8, [x8, #0xc0]
 1274ec8: f9403902     	ldr	x2, [x8, #0x70]
 1274ecc: 941a1552     	bl	0x18fa414 <__start_il2cpp+0x752c50>
 1274ed0: 52a85908     	mov	w8, #0x42c80000         // =1120403456
 1274ed4: 1e270100     	fmov	s0, w8
 1274ed8: f94002e0     	ldr	x0, [x23]
 1274edc: b40137c0     	cbz	x0, 0x12775d4 <__start_il2cpp+0xcfe10>
 1274ee0: f9400262     	ldr	x2, [x19]
 1274ee4: 2a1403e1     	mov	w1, w20
 1274ee8: aa1f03e3     	mov	x3, xzr
 1274eec: 9400601a     	bl	0x128cf54 <__start_il2cpp+0xe5790>
 1274ef0: f94002e0     	ldr	x0, [x23]
 1274ef4: b4013700     	cbz	x0, 0x12775d4 <__start_il2cpp+0xcfe10>
 1274ef8: d000af73     	adrp	x19, 0x2862000
 1274efc: f943d673     	ldr	x19, [x19, #0x7a8]
 1274f00: 2a1403e1     	mov	w1, w20
 1274f04: aa1f03e3     	mov	x3, xzr
 1274f08: f9400262     	ldr	x2, [x19]
 1274f0c: 9400600a     	bl	0x128cf34 <__start_il2cpp+0xe5770>
 1274f10: 52a85908     	mov	w8, #0x42c80000         // =1120403456
 1274f14: 1e270101     	fmov	s1, w8
 1274f18: 1e212000     	fcmp	s0, s1
 1274f1c: 540005e5     	b.pl	0x1274fd8 <__start_il2cpp+0xcd814>
 1274f20: f9403b88     	ldr	x8, [x28, #0x70]
 1274f24: b4013588     	cbz	x8, 0x12775d4 <__start_il2cpp+0xcfe10>
 1274f28: bd414900     	ldr	s0, [x8, #0x148]
 1274f2c: 52a88f48     	mov	w8, #0x447a0000         // =1148846080
 1274f30: 1e270101     	fmov	s1, w8
 1274f34: 52a85908     	mov	w8, #0x42c80000         // =1120403456
 1274f38: 5e21d800     	scvtf	s0, s0
 1274f3c: 1e211800     	fdiv	s0, s0, s1
 1274f40: 1e270101     	fmov	s1, w8
 1274f44: 1e210800     	fmul	s0, s0, s1
 1274f48: 1e212000     	fcmp	s0, s1
 1274f4c: 540003ab     	b.lt	0x1274fc0 <__start_il2cpp+0xcd7fc>
 1274f50: f9400300     	ldr	x0, [x24]
 1274f54: b4013400     	cbz	x0, 0x12775d4 <__start_il2cpp+0xcfe10>
 1274f58: 9000af49     	adrp	x9, 0x285c000 <_ZTVN10__cxxabiv119__pointer_type_infoE+0x18>
 1274f5c: f9400261     	ldr	x1, [x19]
 1274f60: f947a529     	ldr	x9, [x9, #0xf48]
 1274f64: b9401c0a     	ldr	w10, [x0, #0x1c]
 1274f68: f9400808     	ldr	x8, [x0, #0x10]
 1274f6c: f9400129     	ldr	x9, [x9]
 1274f70: 1100054a     	add	w10, w10, #0x1
 1274f74: b9001c0a     	str	w10, [x0, #0x1c]
 1274f78: b40132e8     	cbz	x8, 0x12775d4 <__start_il2cpp+0xcfe10>
 1274f7c: b980180a     	ldrsw	x10, [x0, #0x18]
 1274f80: b940190b     	ldr	w11, [x8, #0x18]
 1274f84: 6b0b015f     	cmp	w10, w11
 1274f88: 54000102     	b.hs	0x1274fa8 <__start_il2cpp+0xcd7e4>
 1274f8c: 11000549     	add	w9, w10, #0x1
 1274f90: 8b0a0d08     	add	x8, x8, x10, lsl #3
 1274f94: 52a8590a     	mov	w10, #0x42c80000        // =1120403456
 1274f98: b9001809     	str	w9, [x0, #0x18]
 1274f9c: f9001101     	str	x1, [x8, #0x20]
 1274fa0: 1e270140     	fmov	s0, w10
 1274fa4: 14000007     	b	0x1274fc0 <__start_il2cpp+0xcd7fc>
 1274fa8: f9401128     	ldr	x8, [x9, #0x20]
 1274fac: f9406108     	ldr	x8, [x8, #0xc0]
 1274fb0: f9403902     	ldr	x2, [x8, #0x70]
 1274fb4: 941a1518     	bl	0x18fa414 <__start_il2cpp+0x752c50>
 1274fb8: 52a85908     	mov	w8, #0x42c80000         // =1120403456
 1274fbc: 1e270100     	fmov	s0, w8
 1274fc0: f94002e0     	ldr	x0, [x23]
 1274fc4: b4013080     	cbz	x0, 0x12775d4 <__start_il2cpp+0xcfe10>
 1274fc8: f9400262     	ldr	x2, [x19]
 1274fcc: 2a1403e1     	mov	w1, w20
 1274fd0: aa1f03e3     	mov	x3, xzr
 1274fd4: 94005fe0     	bl	0x128cf54 <__start_il2cpp+0xe5790>
 1274fd8: f94002e0     	ldr	x0, [x23]
 1274fdc: b4012fc0     	cbz	x0, 0x12775d4 <__start_il2cpp+0xcfe10>
 1274fe0: d000af73     	adrp	x19, 0x2862000
 1274fe4: f943ee73     	ldr	x19, [x19, #0x7d8]
 1274fe8: 2a1403e1     	mov	w1, w20
 1274fec: aa1f03e3     	mov	x3, xzr
 1274ff0: f9400262     	ldr	x2, [x19]
 1274ff4: 94005fd0     	bl	0x128cf34 <__start_il2cpp+0xe5770>
 1274ff8: 52a85908     	mov	w8, #0x42c80000         // =1120403456
 1274ffc: 1e270101     	fmov	s1, w8
 1275000: 1e212000     	fcmp	s0, s1
 1275004: 540005e5     	b.pl	0x12750c0 <__start_il2cpp+0xcd8fc>
 1275008: f9403b88     	ldr	x8, [x28, #0x70]
 127500c: b4012e48     	cbz	x8, 0x12775d4 <__start_il2cpp+0xcfe10>
 1275010: bd414900     	ldr	s0, [x8, #0x148]
 1275014: d0ffa108     	adrp	x8, 0x697000
 1275018: bd465501     	ldr	s1, [x8, #0x654]
 127501c: 52a85908     	mov	w8, #0x42c80000         // =1120403456
 1275020: 5e21d800     	scvtf	s0, s0
 1275024: 1e211800     	fdiv	s0, s0, s1
 1275028: 1e270101     	fmov	s1, w8
 127502c: 1e210800     	fmul	s0, s0, s1
 1275030: 1e212000     	fcmp	s0, s1
 1275034: 540003ab     	b.lt	0x12750a8 <__start_il2cpp+0xcd8e4>
 1275038: f9400300     	ldr	x0, [x24]
 127503c: b4012cc0     	cbz	x0, 0x12775d4 <__start_il2cpp+0xcfe10>
 1275040: f000af29     	adrp	x9, 0x285c000 <_ZTVN10__cxxabiv119__pointer_type_infoE+0x18>
 1275044: f9400261     	ldr	x1, [x19]
 1275048: f947a529     	ldr	x9, [x9, #0xf48]
 127504c: b9401c0a     	ldr	w10, [x0, #0x1c]
 1275050: f9400808     	ldr	x8, [x0, #0x10]
 1275054: f9400129     	ldr	x9, [x9]
 1275058: 1100054a     	add	w10, w10, #0x1
 127505c: b9001c0a     	str	w10, [x0, #0x1c]
 1275060: b4012ba8     	cbz	x8, 0x12775d4 <__start_il2cpp+0xcfe10>
 1275064: b980180a     	ldrsw	x10, [x0, #0x18]
 1275068: b940190b     	ldr	w11, [x8, #0x18]
 127506c: 6b0b015f     	cmp	w10, w11
 1275070: 54000102     	b.hs	0x1275090 <__start_il2cpp+0xcd8cc>
 1275074: 11000549     	add	w9, w10, #0x1
 1275078: 8b0a0d08     	add	x8, x8, x10, lsl #3
 127507c: 52a8590a     	mov	w10, #0x42c80000        // =1120403456
 1275080: b9001809     	str	w9, [x0, #0x18]
 1275084: f9001101     	str	x1, [x8, #0x20]
 1275088: 1e270140     	fmov	s0, w10
 127508c: 14000007     	b	0x12750a8 <__start_il2cpp+0xcd8e4>
 1275090: f9401128     	ldr	x8, [x9, #0x20]
 1275094: f9406108     	ldr	x8, [x8, #0xc0]
 1275098: f9403902     	ldr	x2, [x8, #0x70]
 127509c: 941a14de     	bl	0x18fa414 <__start_il2cpp+0x752c50>
 12750a0: 52a85908     	mov	w8, #0x42c80000         // =1120403456
 12750a4: 1e270100     	fmov	s0, w8
 12750a8: f94002e0     	ldr	x0, [x23]
 12750ac: b4012940     	cbz	x0, 0x12775d4 <__start_il2cpp+0xcfe10>
 12750b0: f9400262     	ldr	x2, [x19]
 12750b4: 2a1403e1     	mov	w1, w20
 12750b8: aa1f03e3     	mov	x3, xzr
 12750bc: 94005fa6     	bl	0x128cf54 <__start_il2cpp+0xe5790>
 12750c0: f94002e0     	ldr	x0, [x23]
 12750c4: b4012880     	cbz	x0, 0x12775d4 <__start_il2cpp+0xcfe10>
 12750c8: b000af73     	adrp	x19, 0x2862000
 12750cc: f9440a73     	ldr	x19, [x19, #0x810]
 12750d0: 2a1403e1     	mov	w1, w20
 12750d4: aa1f03e3     	mov	x3, xzr
 12750d8: f9400262     	ldr	x2, [x19]
 12750dc: 94005f96     	bl	0x128cf34 <__start_il2cpp+0xe5770>
 12750e0: 52a85908     	mov	w8, #0x42c80000         // =1120403456
 12750e4: 1e270101     	fmov	s1, w8
 12750e8: 1e212000     	fcmp	s0, s1
 12750ec: 540005e5     	b.pl	0x12751a8 <__start_il2cpp+0xcd9e4>
 12750f0: f9403b88     	ldr	x8, [x28, #0x70]
 12750f4: b4012708     	cbz	x8, 0x12775d4 <__start_il2cpp+0xcfe10>
 12750f8: bd414900     	ldr	s0, [x8, #0x148]
 12750fc: d0ffa108     	adrp	x8, 0x697000
 1275100: bd463d01     	ldr	s1, [x8, #0x63c]
 1275104: 52a85908     	mov	w8, #0x42c80000         // =1120403456
 1275108: 5e21d800     	scvtf	s0, s0
 127510c: 1e211800     	fdiv	s0, s0, s1
 1275110: 1e270101     	fmov	s1, w8
 1275114: 1e210800     	fmul	s0, s0, s1
 1275118: 1e212000     	fcmp	s0, s1
 127511c: 540003ab     	b.lt	0x1275190 <__start_il2cpp+0xcd9cc>
 1275120: f9400300     	ldr	x0, [x24]
 1275124: b4012580     	cbz	x0, 0x12775d4 <__start_il2cpp+0xcfe10>
 1275128: f000af29     	adrp	x9, 0x285c000 <_ZTVN10__cxxabiv119__pointer_type_infoE+0x18>
 127512c: f9400261     	ldr	x1, [x19]
 1275130: f947a529     	ldr	x9, [x9, #0xf48]
 1275134: b9401c0a     	ldr	w10, [x0, #0x1c]
 1275138: f9400808     	ldr	x8, [x0, #0x10]
 127513c: f9400129     	ldr	x9, [x9]
 1275140: 1100054a     	add	w10, w10, #0x1
 1275144: b9001c0a     	str	w10, [x0, #0x1c]
 1275148: b4012468     	cbz	x8, 0x12775d4 <__start_il2cpp+0xcfe10>
 127514c: b980180a     	ldrsw	x10, [x0, #0x18]
 1275150: b940190b     	ldr	w11, [x8, #0x18]
 1275154: 6b0b015f     	cmp	w10, w11
 1275158: 54000102     	b.hs	0x1275178 <__start_il2cpp+0xcd9b4>
 127515c: 11000549     	add	w9, w10, #0x1
 1275160: 8b0a0d08     	add	x8, x8, x10, lsl #3
 1275164: 52a8590a     	mov	w10, #0x42c80000        // =1120403456
 1275168: b9001809     	str	w9, [x0, #0x18]
 127516c: f9001101     	str	x1, [x8, #0x20]
 1275170: 1e270140     	fmov	s0, w10
 1275174: 14000007     	b	0x1275190 <__start_il2cpp+0xcd9cc>
 1275178: f9401128     	ldr	x8, [x9, #0x20]
 127517c: f9406108     	ldr	x8, [x8, #0xc0]
 1275180: f9403902     	ldr	x2, [x8, #0x70]
 1275184: 941a14a4     	bl	0x18fa414 <__start_il2cpp+0x752c50>
 1275188: 52a85908     	mov	w8, #0x42c80000         // =1120403456
 127518c: 1e270100     	fmov	s0, w8
 1275190: f94002e0     	ldr	x0, [x23]
 1275194: b4012200     	cbz	x0, 0x12775d4 <__start_il2cpp+0xcfe10>
 1275198: f9400262     	ldr	x2, [x19]
 127519c: 2a1403e1     	mov	w1, w20
 12751a0: aa1f03e3     	mov	x3, xzr
 12751a4: 94005f6c     	bl	0x128cf54 <__start_il2cpp+0xe5790>
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
 127550c: f94002e0     	ldr	x0, [x23]
 1275510: b4010620     	cbz	x0, 0x12775d4 <__start_il2cpp+0xcfe10>
 1275514: b000af79     	adrp	x25, 0x2862000
 1275518: f944ab39     	ldr	x25, [x25, #0x950]
 127551c: 2a1403e1     	mov	w1, w20
 1275520: aa1f03e3     	mov	x3, xzr
 1275524: f9400322     	ldr	x2, [x25]
 1275528: 94005e83     	bl	0x128cf34 <__start_il2cpp+0xe5770>
 127552c: 52a85908     	mov	w8, #0x42c80000         // =1120403456
 1275530: 1e270101     	fmov	s1, w8
 1275534: 1e212000     	fcmp	s0, s1
 1275538: 54000b85     	b.pl	0x12756a8 <__start_il2cpp+0xcdee4>
 127553c: f94002e0     	ldr	x0, [x23]
 1275540: b40104a0     	cbz	x0, 0x12775d4 <__start_il2cpp+0xcfe10>
 1275544: 528000c2     	mov	w2, #0x6                // =6
 1275548: 2a1403e1     	mov	w1, w20
 127554c: aa1f03e3     	mov	x3, xzr
 1275550: 94006006     	bl	0x128d568 <__start_il2cpp+0xe5da4>
 1275554: f94002e8     	ldr	x8, [x23]
 1275558: b40103e8     	cbz	x8, 0x12775d4 <__start_il2cpp+0xcfe10>
 127555c: 2a0003f3     	mov	w19, w0
 1275560: 528000e2     	mov	w2, #0x7                // =7
 1275564: aa0803e0     	mov	x0, x8
 1275568: 2a1403e1     	mov	w1, w20
 127556c: aa1f03e3     	mov	x3, xzr
 1275570: 94005ffe     	bl	0x128d568 <__start_il2cpp+0xe5da4>
 1275574: f94002e8     	ldr	x8, [x23]
 1275578: b40102e8     	cbz	x8, 0x12775d4 <__start_il2cpp+0xcfe10>
 127557c: 2a0003f5     	mov	w21, w0
 1275580: 52800102     	mov	w2, #0x8                // =8
 1275584: aa0803e0     	mov	x0, x8
 1275588: 2a1403e1     	mov	w1, w20
 127558c: aa1f03e3     	mov	x3, xzr
 1275590: 94005ff6     	bl	0x128d568 <__start_il2cpp+0xe5da4>
 1275594: f94002e8     	ldr	x8, [x23]
 1275598: b40101e8     	cbz	x8, 0x12775d4 <__start_il2cpp+0xcfe10>
 127559c: 2a0003f6     	mov	w22, w0
 12755a0: 528000a2     	mov	w2, #0x5                // =5
 12755a4: aa0803e0     	mov	x0, x8
 12755a8: 2a1403e1     	mov	w1, w20
 12755ac: aa1f03e3     	mov	x3, xzr
 12755b0: 94005fee     	bl	0x128d568 <__start_il2cpp+0xe5da4>
 12755b4: f94002e8     	ldr	x8, [x23]
 12755b8: b40100e8     	cbz	x8, 0x12775d4 <__start_il2cpp+0xcfe10>
 12755bc: 7100027f     	cmp	w19, #0x0
 12755c0: 52800029     	mov	w9, #0x1                // =1
 12755c4: 1a9fd7ea     	cset	w10, gt
 12755c8: 1a89d529     	cinc	w9, w9, gt
 12755cc: 710006bf     	cmp	w21, #0x1
 12755d0: 1a89b149     	csel	w9, w10, w9, lt
 12755d4: 710002df     	cmp	w22, #0x0
 12755d8: 1a89d529     	cinc	w9, w9, gt
 12755dc: 7100001f     	cmp	w0, #0x0
 12755e0: 52800122     	mov	w2, #0x9                // =9
 12755e4: aa0803e0     	mov	x0, x8
 12755e8: 2a1403e1     	mov	w1, w20
 12755ec: aa1f03e3     	mov	x3, xzr
 12755f0: 1a89d533     	cinc	w19, w9, gt
 12755f4: 94005fdd     	bl	0x128d568 <__start_il2cpp+0xe5da4>
 12755f8: 7100001f     	cmp	w0, #0x0
 12755fc: 1a93d668     	cinc	w8, w19, gt
 1275600: 1e229000     	fmov	s0, #5.00000000
 1275604: 1e220101     	scvtf	s1, w8
 1275608: 52a85908     	mov	w8, #0x42c80000         // =1120403456
 127560c: 1e201820     	fdiv	s0, s1, s0
 1275610: 1e270101     	fmov	s1, w8
 1275614: 1e210800     	fmul	s0, s0, s1
 1275618: 1e212000     	fcmp	s0, s1
 127561c: 540003ab     	b.lt	0x1275690 <__start_il2cpp+0xcdecc>
 1275620: f9400300     	ldr	x0, [x24]
 1275624: b400fd80     	cbz	x0, 0x12775d4 <__start_il2cpp+0xcfe10>
 1275628: f000af29     	adrp	x9, 0x285c000 <_ZTVN10__cxxabiv119__pointer_type_infoE+0x18>
 127562c: f9400321     	ldr	x1, [x25]
 1275630: f947a529     	ldr	x9, [x9, #0xf48]
 1275634: b9401c0a     	ldr	w10, [x0, #0x1c]
 1275638: f9400808     	ldr	x8, [x0, #0x10]
 127563c: f9400129     	ldr	x9, [x9]
 1275640: 1100054a     	add	w10, w10, #0x1
 1275644: b9001c0a     	str	w10, [x0, #0x1c]
 1275648: b400fc68     	cbz	x8, 0x12775d4 <__start_il2cpp+0xcfe10>
 127564c: b980180a     	ldrsw	x10, [x0, #0x18]
 1275650: b940190b     	ldr	w11, [x8, #0x18]
 1275654: 6b0b015f     	cmp	w10, w11
 1275658: 54000102     	b.hs	0x1275678 <__start_il2cpp+0xcdeb4>
 127565c: 11000549     	add	w9, w10, #0x1
 1275660: 8b0a0d08     	add	x8, x8, x10, lsl #3
 1275664: 52a8590a     	mov	w10, #0x42c80000        // =1120403456
 1275668: b9001809     	str	w9, [x0, #0x18]
 127566c: f9001101     	str	x1, [x8, #0x20]
 1275670: 1e270140     	fmov	s0, w10
 1275674: 14000007     	b	0x1275690 <__start_il2cpp+0xcdecc>
 1275678: f9401128     	ldr	x8, [x9, #0x20]
 127567c: f9406108     	ldr	x8, [x8, #0xc0]
 1275680: f9403902     	ldr	x2, [x8, #0x70]
 1275684: 941a1364     	bl	0x18fa414 <__start_il2cpp+0x752c50>
 1275688: 52a85908     	mov	w8, #0x42c80000         // =1120403456
 127568c: 1e270100     	fmov	s0, w8
 1275690: f94002e0     	ldr	x0, [x23]
 1275694: b400fa00     	cbz	x0, 0x12775d4 <__start_il2cpp+0xcfe10>
 1275698: f9400322     	ldr	x2, [x25]
 127569c: 2a1403e1     	mov	w1, w20
 12756a0: aa1f03e3     	mov	x3, xzr
 12756a4: 94005e2c     	bl	0x128cf54 <__start_il2cpp+0xe5790>
 12756a8: f94002e0     	ldr	x0, [x23]
 12756ac: b400f940     	cbz	x0, 0x12775d4 <__start_il2cpp+0xcfe10>
 12756b0: b000af79     	adrp	x25, 0x2862000
 12756b4: f9443339     	ldr	x25, [x25, #0x860]
 12756b8: 2a1403e1     	mov	w1, w20
 12756bc: aa1f03e3     	mov	x3, xzr
 12756c0: f9400322     	ldr	x2, [x25]
 12756c4: 94005e1c     	bl	0x128cf34 <__start_il2cpp+0xe5770>
 12756c8: 52a85908     	mov	w8, #0x42c80000         // =1120403456
 12756cc: 1e270101     	fmov	s1, w8
 12756d0: 1e212000     	fcmp	s0, s1
 12756d4: 54000b85     	b.pl	0x1275844 <__start_il2cpp+0xce080>
 12756d8: f94002e0     	ldr	x0, [x23]
 12756dc: b400f7c0     	cbz	x0, 0x12775d4 <__start_il2cpp+0xcfe10>
 12756e0: 528000c2     	mov	w2, #0x6                // =6
 12756e4: 2a1403e1     	mov	w1, w20
 12756e8: aa1f03e3     	mov	x3, xzr
 12756ec: 94005f9f     	bl	0x128d568 <__start_il2cpp+0xe5da4>
 12756f0: f94002e8     	ldr	x8, [x23]
 12756f4: b400f708     	cbz	x8, 0x12775d4 <__start_il2cpp+0xcfe10>
 12756f8: 2a0003f3     	mov	w19, w0
 12756fc: 528000e2     	mov	w2, #0x7                // =7
 1275700: aa0803e0     	mov	x0, x8
 1275704: 2a1403e1     	mov	w1, w20
 1275708: aa1f03e3     	mov	x3, xzr
 127570c: 94005f97     	bl	0x128d568 <__start_il2cpp+0xe5da4>
 1275710: f94002e8     	ldr	x8, [x23]
 1275714: b400f608     	cbz	x8, 0x12775d4 <__start_il2cpp+0xcfe10>
 1275718: 2a0003f5     	mov	w21, w0
 127571c: 52800102     	mov	w2, #0x8                // =8
 1275720: aa0803e0     	mov	x0, x8
 1275724: 2a1403e1     	mov	w1, w20
 1275728: aa1f03e3     	mov	x3, xzr
 127572c: 94005f8f     	bl	0x128d568 <__start_il2cpp+0xe5da4>
 1275730: f94002e8     	ldr	x8, [x23]
 1275734: b400f508     	cbz	x8, 0x12775d4 <__start_il2cpp+0xcfe10>
 1275738: 2a0003f6     	mov	w22, w0
 127573c: 528000a2     	mov	w2, #0x5                // =5
 1275740: aa0803e0     	mov	x0, x8
 1275744: 2a1403e1     	mov	w1, w20
 1275748: aa1f03e3     	mov	x3, xzr
 127574c: 94005f87     	bl	0x128d568 <__start_il2cpp+0xe5da4>
 1275750: f94002e8     	ldr	x8, [x23]
 1275754: b400f408     	cbz	x8, 0x12775d4 <__start_il2cpp+0xcfe10>
 1275758: 7100127f     	cmp	w19, #0x4
 127575c: 52800029     	mov	w9, #0x1                // =1
 1275760: 1a9fd7ea     	cset	w10, gt
 1275764: 1a89d529     	cinc	w9, w9, gt
 1275768: 710016bf     	cmp	w21, #0x5
 127576c: 1a89b149     	csel	w9, w10, w9, lt
 1275770: 710012df     	cmp	w22, #0x4
 1275774: 1a89d529     	cinc	w9, w9, gt
 1275778: 7100101f     	cmp	w0, #0x4
 127577c: 52800122     	mov	w2, #0x9                // =9
 1275780: aa0803e0     	mov	x0, x8
 1275784: 2a1403e1     	mov	w1, w20
 1275788: aa1f03e3     	mov	x3, xzr
 127578c: 1a89d533     	cinc	w19, w9, gt
 1275790: 94005f76     	bl	0x128d568 <__start_il2cpp+0xe5da4>
 1275794: 7100101f     	cmp	w0, #0x4
 1275798: 1a93d668     	cinc	w8, w19, gt
 127579c: 1e229000     	fmov	s0, #5.00000000
 12757a0: 1e220101     	scvtf	s1, w8
 12757a4: 52a85908     	mov	w8, #0x42c80000         // =1120403456
 12757a8: 1e201820     	fdiv	s0, s1, s0
 12757ac: 1e270101     	fmov	s1, w8
 12757b0: 1e210800     	fmul	s0, s0, s1
 12757b4: 1e212000     	fcmp	s0, s1
 12757b8: 540003ab     	b.lt	0x127582c <__start_il2cpp+0xce068>
 12757bc: f9400300     	ldr	x0, [x24]
 12757c0: b400f0a0     	cbz	x0, 0x12775d4 <__start_il2cpp+0xcfe10>
 12757c4: f000af29     	adrp	x9, 0x285c000 <_ZTVN10__cxxabiv119__pointer_type_infoE+0x18>
 12757c8: f9400321     	ldr	x1, [x25]
 12757cc: f947a529     	ldr	x9, [x9, #0xf48]
 12757d0: b9401c0a     	ldr	w10, [x0, #0x1c]
 12757d4: f9400808     	ldr	x8, [x0, #0x10]
 12757d8: f9400129     	ldr	x9, [x9]
 12757dc: 1100054a     	add	w10, w10, #0x1
 12757e0: b9001c0a     	str	w10, [x0, #0x1c]
 12757e4: b400ef88     	cbz	x8, 0x12775d4 <__start_il2cpp+0xcfe10>
 12757e8: b980180a     	ldrsw	x10, [x0, #0x18]
 12757ec: b940190b     	ldr	w11, [x8, #0x18]
 12757f0: 6b0b015f     	cmp	w10, w11
 12757f4: 54000102     	b.hs	0x1275814 <__start_il2cpp+0xce050>
 12757f8: 11000549     	add	w9, w10, #0x1
 12757fc: 8b0a0d08     	add	x8, x8, x10, lsl #3
 1275800: 52a8590a     	mov	w10, #0x42c80000        // =1120403456
 1275804: b9001809     	str	w9, [x0, #0x18]
 1275808: f9001101     	str	x1, [x8, #0x20]
 127580c: 1e270140     	fmov	s0, w10
 1275810: 14000007     	b	0x127582c <__start_il2cpp+0xce068>
 1275814: f9401128     	ldr	x8, [x9, #0x20]
 1275818: f9406108     	ldr	x8, [x8, #0xc0]
 127581c: f9403902     	ldr	x2, [x8, #0x70]
 1275820: 941a12fd     	bl	0x18fa414 <__start_il2cpp+0x752c50>
 1275824: 52a85908     	mov	w8, #0x42c80000         // =1120403456
 1275828: 1e270100     	fmov	s0, w8
 127582c: f94002e0     	ldr	x0, [x23]
 1275830: b400ed20     	cbz	x0, 0x12775d4 <__start_il2cpp+0xcfe10>
 1275834: f9400322     	ldr	x2, [x25]
 1275838: 2a1403e1     	mov	w1, w20
 127583c: aa1f03e3     	mov	x3, xzr
 1275840: 94005dc5     	bl	0x128cf54 <__start_il2cpp+0xe5790>
 1275844: f94002e0     	ldr	x0, [x23]
 1275848: b400ec60     	cbz	x0, 0x12775d4 <__start_il2cpp+0xcfe10>
 127584c: b000af68     	adrp	x8, 0x2862000
 1275850: f9440108     	ldr	x8, [x8, #0x800]
 1275854: 2a1403e1     	mov	w1, w20
 1275858: aa1f03e3     	mov	x3, xzr
 127585c: f9400102     	ldr	x2, [x8]
 1275860: 94005db5     	bl	0x128cf34 <__start_il2cpp+0xe5770>
 1275864: 52a85908     	mov	w8, #0x42c80000         // =1120403456
 1275868: 1e270101     	fmov	s1, w8
 127586c: 1e212000     	fcmp	s0, s1
 1275870: f90017fc     	str	x28, [sp, #0x28]
 1275874: f9000ff8     	str	x24, [sp, #0x18]
 1275878: 54001825     	b.pl	0x1275b7c <__start_il2cpp+0xce3b8>
 127587c: f94002e0     	ldr	x0, [x23]
 1275880: b400eaa0     	cbz	x0, 0x12775d4 <__start_il2cpp+0xcfe10>
 1275884: 52800202     	mov	w2, #0x10               // =16
 1275888: 2a1403e1     	mov	w1, w20
 127588c: aa1f03e3     	mov	x3, xzr
 1275890: 94005f36     	bl	0x128d568 <__start_il2cpp+0xe5da4>
 1275894: f94002e8     	ldr	x8, [x23]
 1275898: b400e9e8     	cbz	x8, 0x12775d4 <__start_il2cpp+0xcfe10>
 127589c: 2a0003f5     	mov	w21, w0
 12758a0: 52800222     	mov	w2, #0x11               // =17
 12758a4: aa0803e0     	mov	x0, x8
 12758a8: 2a1403e1     	mov	w1, w20
 12758ac: aa1f03e3     	mov	x3, xzr
 12758b0: 94005f2e     	bl	0x128d568 <__start_il2cpp+0xe5da4>
 12758b4: f94002e8     	ldr	x8, [x23]
 12758b8: b400e8e8     	cbz	x8, 0x12775d4 <__start_il2cpp+0xcfe10>
 12758bc: 2a0003f6     	mov	w22, w0
 12758c0: 52800242     	mov	w2, #0x12               // =18
 12758c4: aa0803e0     	mov	x0, x8
 12758c8: 2a1403e1     	mov	w1, w20
 12758cc: aa1f03e3     	mov	x3, xzr
 12758d0: 94005f26     	bl	0x128d568 <__start_il2cpp+0xe5da4>
 12758d4: f94002e8     	ldr	x8, [x23]
 12758d8: b400e7e8     	cbz	x8, 0x12775d4 <__start_il2cpp+0xcfe10>
 12758dc: 2a0003f3     	mov	w19, w0
 12758e0: 52800262     	mov	w2, #0x13               // =19
 12758e4: aa0803e0     	mov	x0, x8
 12758e8: 2a1403e1     	mov	w1, w20
 12758ec: aa1f03e3     	mov	x3, xzr
 12758f0: 94005f1e     	bl	0x128d568 <__start_il2cpp+0xe5da4>
 12758f4: f94002e8     	ldr	x8, [x23]
 12758f8: b400e6e8     	cbz	x8, 0x12775d4 <__start_il2cpp+0xcfe10>
 12758fc: 2a0003f9     	mov	w25, w0
 1275900: 52800282     	mov	w2, #0x14               // =20
 1275904: aa0803e0     	mov	x0, x8
 1275908: 2a1403e1     	mov	w1, w20
 127590c: aa1f03e3     	mov	x3, xzr
 1275910: 94005f16     	bl	0x128d568 <__start_il2cpp+0xe5da4>
 1275914: f94002e8     	ldr	x8, [x23]
 1275918: b400e5e8     	cbz	x8, 0x12775d4 <__start_il2cpp+0xcfe10>
 127591c: 2a0003fa     	mov	w26, w0
 1275920: 528002c2     	mov	w2, #0x16               // =22
 1275924: aa0803e0     	mov	x0, x8
 1275928: 2a1403e1     	mov	w1, w20
 127592c: aa1f03e3     	mov	x3, xzr
 1275930: 94005f0e     	bl	0x128d568 <__start_il2cpp+0xe5da4>
 1275934: f94002e8     	ldr	x8, [x23]
 1275938: b400e4e8     	cbz	x8, 0x12775d4 <__start_il2cpp+0xcfe10>
 127593c: 2a0003fb     	mov	w27, w0
 1275940: 52800382     	mov	w2, #0x1c               // =28
 1275944: aa0803e0     	mov	x0, x8
 1275948: 2a1403e1     	mov	w1, w20
 127594c: aa1f03e3     	mov	x3, xzr
 1275950: 94005f06     	bl	0x128d568 <__start_il2cpp+0xe5da4>
 1275954: f94002e8     	ldr	x8, [x23]
 1275958: b400e3e8     	cbz	x8, 0x12775d4 <__start_il2cpp+0xcfe10>
 127595c: b90017e0     	str	w0, [sp, #0x14]
 1275960: 528003a2     	mov	w2, #0x1d               // =29
 1275964: aa0803e0     	mov	x0, x8
 1275968: 2a1403e1     	mov	w1, w20
 127596c: aa1f03e3     	mov	x3, xzr
 1275970: 94005efe     	bl	0x128d568 <__start_il2cpp+0xe5da4>
 1275974: f94002e8     	ldr	x8, [x23]
 1275978: b90013e0     	str	w0, [sp, #0x10]
 127597c: b400e2c8     	cbz	x8, 0x12775d4 <__start_il2cpp+0xcfe10>
 1275980: 528003c2     	mov	w2, #0x1e               // =30
 1275984: aa0803e0     	mov	x0, x8
 1275988: 2a1403e1     	mov	w1, w20
 127598c: aa1f03e3     	mov	x3, xzr
 1275990: b9000ffb     	str	w27, [sp, #0xc]
 1275994: 2a1a03fc     	mov	w28, w26
 1275998: 94005ef4     	bl	0x128d568 <__start_il2cpp+0xe5da4>
 127599c: f94002e8     	ldr	x8, [x23]
 12759a0: b400e1a8     	cbz	x8, 0x12775d4 <__start_il2cpp+0xcfe10>
 12759a4: 2a0003fd     	mov	w29, w0
 12759a8: 528003e2     	mov	w2, #0x1f               // =31
 12759ac: aa0803e0     	mov	x0, x8
 12759b0: 2a1403e1     	mov	w1, w20
 12759b4: aa1f03e3     	mov	x3, xzr
 12759b8: 2a1903fb     	mov	w27, w25
 12759bc: 94005eeb     	bl	0x128d568 <__start_il2cpp+0xe5da4>
 12759c0: f94002e8     	ldr	x8, [x23]
 12759c4: b400e088     	cbz	x8, 0x12775d4 <__start_il2cpp+0xcfe10>
 12759c8: 2a0003fa     	mov	w26, w0
 12759cc: 52800402     	mov	w2, #0x20               // =32
 12759d0: aa0803e0     	mov	x0, x8
 12759d4: 2a1403e1     	mov	w1, w20
 12759d8: aa1f03e3     	mov	x3, xzr
 12759dc: 2a1603f8     	mov	w24, w22
 12759e0: 94005ee2     	bl	0x128d568 <__start_il2cpp+0xe5da4>
 12759e4: f94002e8     	ldr	x8, [x23]
 12759e8: b400df68     	cbz	x8, 0x12775d4 <__start_il2cpp+0xcfe10>
 12759ec: 2a0003f9     	mov	w25, w0
 12759f0: 52800422     	mov	w2, #0x21               // =33
 12759f4: aa0803e0     	mov	x0, x8
 12759f8: 2a1403e1     	mov	w1, w20
 12759fc: aa1f03e3     	mov	x3, xzr
 1275a00: 94005eda     	bl	0x128d568 <__start_il2cpp+0xe5da4>
 1275a04: f94002e8     	ldr	x8, [x23]
 1275a08: b400de68     	cbz	x8, 0x12775d4 <__start_il2cpp+0xcfe10>
 1275a0c: 2a0003f6     	mov	w22, w0
 1275a10: 52800442     	mov	w2, #0x22               // =34
 1275a14: aa0803e0     	mov	x0, x8
 1275a18: 2a1403e1     	mov	w1, w20
 1275a1c: aa1f03e3     	mov	x3, xzr
 1275a20: 94005ed2     	bl	0x128d568 <__start_il2cpp+0xe5da4>
 1275a24: f94002e8     	ldr	x8, [x23]
 1275a28: b400dd68     	cbz	x8, 0x12775d4 <__start_il2cpp+0xcfe10>
 1275a2c: 710002bf     	cmp	w21, #0x0
 1275a30: 52800029     	mov	w9, #0x1                // =1
 1275a34: 1a9fd7ea     	cset	w10, gt
 1275a38: 1a89d529     	cinc	w9, w9, gt
 1275a3c: 7100071f     	cmp	w24, #0x1
 1275a40: 1a89b149     	csel	w9, w10, w9, lt
 1275a44: b9400fea     	ldr	w10, [sp, #0xc]
 1275a48: 7100027f     	cmp	w19, #0x0
 1275a4c: 1a89d529     	cinc	w9, w9, gt
 1275a50: 7100037f     	cmp	w27, #0x0
 1275a54: 1a89d529     	cinc	w9, w9, gt
 1275a58: 7100039f     	cmp	w28, #0x0
 1275a5c: 1a89d529     	cinc	w9, w9, gt
 1275a60: 7100015f     	cmp	w10, #0x0
 1275a64: b94017ea     	ldr	w10, [sp, #0x14]
 1275a68: 1a89d529     	cinc	w9, w9, gt
 1275a6c: 52800462     	mov	w2, #0x23               // =35
 1275a70: 2a1403e1     	mov	w1, w20
 1275a74: 7100015f     	cmp	w10, #0x0
 1275a78: b94013ea     	ldr	w10, [sp, #0x10]
 1275a7c: 1a89d529     	cinc	w9, w9, gt
 1275a80: aa1f03e3     	mov	x3, xzr
 1275a84: 7100015f     	cmp	w10, #0x0
 1275a88: 1a89d529     	cinc	w9, w9, gt
 1275a8c: 710003bf     	cmp	w29, #0x0
 1275a90: 1a89d529     	cinc	w9, w9, gt
 1275a94: 7100035f     	cmp	w26, #0x0
 1275a98: 1a89d529     	cinc	w9, w9, gt
 1275a9c: 7100033f     	cmp	w25, #0x0
 1275aa0: 1a89d529     	cinc	w9, w9, gt
 1275aa4: 710002df     	cmp	w22, #0x0
 1275aa8: 1a89d529     	cinc	w9, w9, gt
 1275aac: 7100001f     	cmp	w0, #0x0
 1275ab0: aa0803e0     	mov	x0, x8
 1275ab4: 1a89d533     	cinc	w19, w9, gt
 1275ab8: 94005eac     	bl	0x128d568 <__start_il2cpp+0xe5da4>
 1275abc: 7100001f     	cmp	w0, #0x0
 1275ac0: 1a93d668     	cinc	w8, w19, gt
 1275ac4: b000af73     	adrp	x19, 0x2862000
 1275ac8: 1e2c1000     	fmov	s0, #0.50000000
 1275acc: 1e220101     	scvtf	s1, w8
 1275ad0: 52a85908     	mov	w8, #0x42c80000         // =1120403456
 1275ad4: f94017fc     	ldr	x28, [sp, #0x28]
 1275ad8: f9440273     	ldr	x19, [x19, #0x800]
 1275adc: f9400ff8     	ldr	x24, [sp, #0x18]
 1275ae0: 1e200820     	fmul	s0, s1, s0
 1275ae4: 1e270101     	fmov	s1, w8
 1275ae8: 1e210800     	fmul	s0, s0, s1
 1275aec: 1e212000     	fcmp	s0, s1
 1275af0: 540003ab     	b.lt	0x1275b64 <__start_il2cpp+0xce3a0>
 1275af4: f9400300     	ldr	x0, [x24]
 1275af8: b400d6e0     	cbz	x0, 0x12775d4 <__start_il2cpp+0xcfe10>
 1275afc: f000af29     	adrp	x9, 0x285c000 <_ZTVN10__cxxabiv119__pointer_type_infoE+0x18>
 1275b00: f9400261     	ldr	x1, [x19]
 1275b04: f947a529     	ldr	x9, [x9, #0xf48]
 1275b08: b9401c0a     	ldr	w10, [x0, #0x1c]
 1275b0c: f9400808     	ldr	x8, [x0, #0x10]
 1275b10: f9400129     	ldr	x9, [x9]
 1275b14: 1100054a     	add	w10, w10, #0x1
 1275b18: b9001c0a     	str	w10, [x0, #0x1c]
 1275b1c: b400d5c8     	cbz	x8, 0x12775d4 <__start_il2cpp+0xcfe10>
 1275b20: b980180a     	ldrsw	x10, [x0, #0x18]
 1275b24: b940190b     	ldr	w11, [x8, #0x18]
 1275b28: 6b0b015f     	cmp	w10, w11
 1275b2c: 54000102     	b.hs	0x1275b4c <__start_il2cpp+0xce388>
 1275b30: 11000549     	add	w9, w10, #0x1
 1275b34: 8b0a0d08     	add	x8, x8, x10, lsl #3
 1275b38: 52a8590a     	mov	w10, #0x42c80000        // =1120403456
 1275b3c: b9001809     	str	w9, [x0, #0x18]
 1275b40: f9001101     	str	x1, [x8, #0x20]
 1275b44: 1e270140     	fmov	s0, w10
 1275b48: 14000007     	b	0x1275b64 <__start_il2cpp+0xce3a0>
 1275b4c: f9401128     	ldr	x8, [x9, #0x20]
 1275b50: f9406108     	ldr	x8, [x8, #0xc0]
 1275b54: f9403902     	ldr	x2, [x8, #0x70]
 1275b58: 941a122f     	bl	0x18fa414 <__start_il2cpp+0x752c50>
 1275b5c: 52a85908     	mov	w8, #0x42c80000         // =1120403456
 1275b60: 1e270100     	fmov	s0, w8
 1275b64: f94002e0     	ldr	x0, [x23]
 1275b68: b400d360     	cbz	x0, 0x12775d4 <__start_il2cpp+0xcfe10>
 1275b6c: f9400262     	ldr	x2, [x19]
 1275b70: 2a1403e1     	mov	w1, w20
 1275b74: aa1f03e3     	mov	x3, xzr
 1275b78: 94005cf7     	bl	0x128cf54 <__start_il2cpp+0xe5790>
 1275b7c: f94002e0     	ldr	x0, [x23]
 1275b80: b400d2a0     	cbz	x0, 0x12775d4 <__start_il2cpp+0xcfe10>
 1275b84: b000af68     	adrp	x8, 0x2862000
 1275b88: f944a108     	ldr	x8, [x8, #0x940]
 1275b8c: 2a1403e1     	mov	w1, w20
 1275b90: aa1f03e3     	mov	x3, xzr
 1275b94: f9400102     	ldr	x2, [x8]
 1275b98: 94005ce7     	bl	0x128cf34 <__start_il2cpp+0xe5770>
 1275b9c: 52a85908     	mov	w8, #0x42c80000         // =1120403456
 1275ba0: 1e270101     	fmov	s1, w8
 1275ba4: 1e212000     	fcmp	s0, s1
 1275ba8: 54001805     	b.pl	0x1275ea8 <__start_il2cpp+0xce6e4>
 1275bac: f94002e0     	ldr	x0, [x23]
 1275bb0: b400d120     	cbz	x0, 0x12775d4 <__start_il2cpp+0xcfe10>
 1275bb4: 52800202     	mov	w2, #0x10               // =16
 1275bb8: 2a1403e1     	mov	w1, w20
 1275bbc: aa1f03e3     	mov	x3, xzr
 1275bc0: 94005e6a     	bl	0x128d568 <__start_il2cpp+0xe5da4>
 1275bc4: f94002e8     	ldr	x8, [x23]
 1275bc8: b400d068     	cbz	x8, 0x12775d4 <__start_il2cpp+0xcfe10>
 1275bcc: 2a0003f5     	mov	w21, w0
 1275bd0: 52800222     	mov	w2, #0x11               // =17
 1275bd4: aa0803e0     	mov	x0, x8
 1275bd8: 2a1403e1     	mov	w1, w20
 1275bdc: aa1f03e3     	mov	x3, xzr
 1275be0: 94005e62     	bl	0x128d568 <__start_il2cpp+0xe5da4>
 1275be4: f94002e8     	ldr	x8, [x23]
 1275be8: b400cf68     	cbz	x8, 0x12775d4 <__start_il2cpp+0xcfe10>
 1275bec: 2a0003f6     	mov	w22, w0
 1275bf0: 52800242     	mov	w2, #0x12               // =18
 1275bf4: aa0803e0     	mov	x0, x8
 1275bf8: 2a1403e1     	mov	w1, w20
 1275bfc: aa1f03e3     	mov	x3, xzr
 1275c00: 94005e5a     	bl	0x128d568 <__start_il2cpp+0xe5da4>
 1275c04: f94002e8     	ldr	x8, [x23]
 1275c08: b400ce68     	cbz	x8, 0x12775d4 <__start_il2cpp+0xcfe10>
 1275c0c: 2a0003f3     	mov	w19, w0
 1275c10: 52800262     	mov	w2, #0x13               // =19
 1275c14: aa0803e0     	mov	x0, x8
 1275c18: 2a1403e1     	mov	w1, w20
 1275c1c: aa1f03e3     	mov	x3, xzr
 1275c20: 94005e52     	bl	0x128d568 <__start_il2cpp+0xe5da4>
 1275c24: f94002e8     	ldr	x8, [x23]
 1275c28: b400cd68     	cbz	x8, 0x12775d4 <__start_il2cpp+0xcfe10>
 1275c2c: 2a0003f9     	mov	w25, w0
 1275c30: 52800282     	mov	w2, #0x14               // =20
 1275c34: aa0803e0     	mov	x0, x8
 1275c38: 2a1403e1     	mov	w1, w20
 1275c3c: aa1f03e3     	mov	x3, xzr
 1275c40: 94005e4a     	bl	0x128d568 <__start_il2cpp+0xe5da4>
 1275c44: f94002e8     	ldr	x8, [x23]
 1275c48: b400cc68     	cbz	x8, 0x12775d4 <__start_il2cpp+0xcfe10>
 1275c4c: 2a0003fa     	mov	w26, w0
 1275c50: 528002c2     	mov	w2, #0x16               // =22
 1275c54: aa0803e0     	mov	x0, x8
 1275c58: 2a1403e1     	mov	w1, w20
 1275c5c: aa1f03e3     	mov	x3, xzr
 1275c60: 94005e42     	bl	0x128d568 <__start_il2cpp+0xe5da4>
 1275c64: f94002e8     	ldr	x8, [x23]
 1275c68: b400cb68     	cbz	x8, 0x12775d4 <__start_il2cpp+0xcfe10>
 1275c6c: 2a0003fb     	mov	w27, w0
 1275c70: 52800382     	mov	w2, #0x1c               // =28
 1275c74: aa0803e0     	mov	x0, x8
 1275c78: 2a1403e1     	mov	w1, w20
 1275c7c: aa1f03e3     	mov	x3, xzr
 1275c80: 94005e3a     	bl	0x128d568 <__start_il2cpp+0xe5da4>
 1275c84: f94002e8     	ldr	x8, [x23]
 1275c88: b400ca68     	cbz	x8, 0x12775d4 <__start_il2cpp+0xcfe10>
 1275c8c: b90017e0     	str	w0, [sp, #0x14]
 1275c90: 528003a2     	mov	w2, #0x1d               // =29
 1275c94: aa0803e0     	mov	x0, x8
 1275c98: 2a1403e1     	mov	w1, w20
 1275c9c: aa1f03e3     	mov	x3, xzr
 1275ca0: 94005e32     	bl	0x128d568 <__start_il2cpp+0xe5da4>
 1275ca4: f94002e8     	ldr	x8, [x23]
 1275ca8: b400c968     	cbz	x8, 0x12775d4 <__start_il2cpp+0xcfe10>
 1275cac: 2901efe0     	stp	w0, w27, [sp, #0xc]
 1275cb0: 528003c2     	mov	w2, #0x1e               // =30
 1275cb4: aa0803e0     	mov	x0, x8
 1275cb8: 2a1403e1     	mov	w1, w20
 1275cbc: aa1f03e3     	mov	x3, xzr
 1275cc0: 94005e2a     	bl	0x128d568 <__start_il2cpp+0xe5da4>
 1275cc4: f94002e8     	ldr	x8, [x23]
 1275cc8: b400c868     	cbz	x8, 0x12775d4 <__start_il2cpp+0xcfe10>
 1275ccc: 2a0003fd     	mov	w29, w0
 1275cd0: 528003e2     	mov	w2, #0x1f               // =31
 1275cd4: aa0803e0     	mov	x0, x8
 1275cd8: 2a1403e1     	mov	w1, w20
 1275cdc: aa1f03e3     	mov	x3, xzr
 1275ce0: 2a1a03fc     	mov	w28, w26
 1275ce4: 2a1903fb     	mov	w27, w25
 1275ce8: 94005e20     	bl	0x128d568 <__start_il2cpp+0xe5da4>
 1275cec: f94002e8     	ldr	x8, [x23]
 1275cf0: b400c728     	cbz	x8, 0x12775d4 <__start_il2cpp+0xcfe10>
 1275cf4: 2a0003f8     	mov	w24, w0
 1275cf8: 52800402     	mov	w2, #0x20               // =32
 1275cfc: aa0803e0     	mov	x0, x8
 1275d00: 2a1403e1     	mov	w1, w20
 1275d04: aa1f03e3     	mov	x3, xzr
 1275d08: 2a1603fa     	mov	w26, w22
 1275d0c: 94005e17     	bl	0x128d568 <__start_il2cpp+0xe5da4>
 1275d10: f94002e8     	ldr	x8, [x23]
 1275d14: b400c608     	cbz	x8, 0x12775d4 <__start_il2cpp+0xcfe10>
 1275d18: 2a0003f9     	mov	w25, w0
 1275d1c: 52800422     	mov	w2, #0x21               // =33
 1275d20: aa0803e0     	mov	x0, x8
 1275d24: 2a1403e1     	mov	w1, w20
 1275d28: aa1f03e3     	mov	x3, xzr
 1275d2c: 94005e0f     	bl	0x128d568 <__start_il2cpp+0xe5da4>
 1275d30: f94002e8     	ldr	x8, [x23]
 1275d34: b400c508     	cbz	x8, 0x12775d4 <__start_il2cpp+0xcfe10>
 1275d38: 2a0003f6     	mov	w22, w0
 1275d3c: 52800442     	mov	w2, #0x22               // =34
 1275d40: aa0803e0     	mov	x0, x8
 1275d44: 2a1403e1     	mov	w1, w20
 1275d48: aa1f03e3     	mov	x3, xzr
 1275d4c: 94005e07     	bl	0x128d568 <__start_il2cpp+0xe5da4>
 1275d50: f94002e8     	ldr	x8, [x23]
 1275d54: b400c408     	cbz	x8, 0x12775d4 <__start_il2cpp+0xcfe10>
 1275d58: 710002bf     	cmp	w21, #0x0
 1275d5c: 52800029     	mov	w9, #0x1                // =1
 1275d60: 1a9fd7ea     	cset	w10, gt
 1275d64: 1a89d529     	cinc	w9, w9, gt
 1275d68: 7100075f     	cmp	w26, #0x1
 1275d6c: 1a89b149     	csel	w9, w10, w9, lt
 1275d70: b94013ea     	ldr	w10, [sp, #0x10]
 1275d74: 7100027f     	cmp	w19, #0x0
 1275d78: 1a89d529     	cinc	w9, w9, gt
 1275d7c: 7100037f     	cmp	w27, #0x0
 1275d80: 1a89d529     	cinc	w9, w9, gt
 1275d84: 7100039f     	cmp	w28, #0x0
 1275d88: 1a89d529     	cinc	w9, w9, gt
 1275d8c: 7100015f     	cmp	w10, #0x0
 1275d90: b94017ea     	ldr	w10, [sp, #0x14]
 1275d94: 1a89d529     	cinc	w9, w9, gt
 1275d98: 52800462     	mov	w2, #0x23               // =35
 1275d9c: 2a1403e1     	mov	w1, w20
 1275da0: 7100015f     	cmp	w10, #0x0
 1275da4: b9400fea     	ldr	w10, [sp, #0xc]
 1275da8: 1a89d529     	cinc	w9, w9, gt
 1275dac: aa1f03e3     	mov	x3, xzr
 1275db0: 7100015f     	cmp	w10, #0x0
 1275db4: 1a89d529     	cinc	w9, w9, gt
 1275db8: 710003bf     	cmp	w29, #0x0
 1275dbc: 1a89d529     	cinc	w9, w9, gt
 1275dc0: 7100031f     	cmp	w24, #0x0
 1275dc4: 1a89d529     	cinc	w9, w9, gt
 1275dc8: 7100033f     	cmp	w25, #0x0
 1275dcc: 1a89d529     	cinc	w9, w9, gt
 1275dd0: 710002df     	cmp	w22, #0x0
 1275dd4: 1a89d529     	cinc	w9, w9, gt
 1275dd8: 7100001f     	cmp	w0, #0x0
 1275ddc: aa0803e0     	mov	x0, x8
 1275de0: 1a89d533     	cinc	w19, w9, gt
 1275de4: 94005de1     	bl	0x128d568 <__start_il2cpp+0xe5da4>
 1275de8: 7100001f     	cmp	w0, #0x0
 1275dec: 1a93d668     	cinc	w8, w19, gt
 1275df0: b000af73     	adrp	x19, 0x2862000
 1275df4: 1e2a1000     	fmov	s0, #0.25000000
 1275df8: 1e220101     	scvtf	s1, w8
 1275dfc: 52a85908     	mov	w8, #0x42c80000         // =1120403456
 1275e00: f94017fc     	ldr	x28, [sp, #0x28]
 1275e04: f944a273     	ldr	x19, [x19, #0x940]
 1275e08: f9400ff8     	ldr	x24, [sp, #0x18]
 1275e0c: 1e200820     	fmul	s0, s1, s0
 1275e10: 1e270101     	fmov	s1, w8
 1275e14: 1e210800     	fmul	s0, s0, s1
 1275e18: 1e212000     	fcmp	s0, s1
 1275e1c: 540003ab     	b.lt	0x1275e90 <__start_il2cpp+0xce6cc>
 1275e20: f9400300     	ldr	x0, [x24]
 1275e24: b400bd80     	cbz	x0, 0x12775d4 <__start_il2cpp+0xcfe10>
 1275e28: f000af29     	adrp	x9, 0x285c000 <_ZTVN10__cxxabiv119__pointer_type_infoE+0x18>
 1275e2c: f9400261     	ldr	x1, [x19]
 1275e30: f947a529     	ldr	x9, [x9, #0xf48]
 1275e34: b9401c0a     	ldr	w10, [x0, #0x1c]
 1275e38: f9400808     	ldr	x8, [x0, #0x10]
 1275e3c: f9400129     	ldr	x9, [x9]
 1275e40: 1100054a     	add	w10, w10, #0x1
 1275e44: b9001c0a     	str	w10, [x0, #0x1c]
 1275e48: b400bc68     	cbz	x8, 0x12775d4 <__start_il2cpp+0xcfe10>
 1275e4c: b980180a     	ldrsw	x10, [x0, #0x18]
 1275e50: b940190b     	ldr	w11, [x8, #0x18]
 1275e54: 6b0b015f     	cmp	w10, w11
 1275e58: 54000102     	b.hs	0x1275e78 <__start_il2cpp+0xce6b4>
 1275e5c: 11000549     	add	w9, w10, #0x1
 1275e60: 8b0a0d08     	add	x8, x8, x10, lsl #3
 1275e64: 52a8590a     	mov	w10, #0x42c80000        // =1120403456
 1275e68: b9001809     	str	w9, [x0, #0x18]
 1275e6c: f9001101     	str	x1, [x8, #0x20]
 1275e70: 1e270140     	fmov	s0, w10
 1275e74: 14000007     	b	0x1275e90 <__start_il2cpp+0xce6cc>
 1275e78: f9401128     	ldr	x8, [x9, #0x20]
 1275e7c: f9406108     	ldr	x8, [x8, #0xc0]
 1275e80: f9403902     	ldr	x2, [x8, #0x70]
 1275e84: 941a1164     	bl	0x18fa414 <__start_il2cpp+0x752c50>
 1275e88: 52a85908     	mov	w8, #0x42c80000         // =1120403456
 1275e8c: 1e270100     	fmov	s0, w8
 1275e90: f94002e0     	ldr	x0, [x23]
 1275e94: b400ba00     	cbz	x0, 0x12775d4 <__start_il2cpp+0xcfe10>
 1275e98: f9400262     	ldr	x2, [x19]
 1275e9c: 2a1403e1     	mov	w1, w20
 1275ea0: aa1f03e3     	mov	x3, xzr
 1275ea4: 94005c2c     	bl	0x128cf54 <__start_il2cpp+0xe5790>
 1275ea8: f94002e0     	ldr	x0, [x23]
 1275eac: b400b940     	cbz	x0, 0x12775d4 <__start_il2cpp+0xcfe10>
 1275eb0: b000af68     	adrp	x8, 0x2862000
 1275eb4: f9447d08     	ldr	x8, [x8, #0x8f8]
 1275eb8: 2a1403e1     	mov	w1, w20
 1275ebc: aa1f03e3     	mov	x3, xzr
 1275ec0: f9400102     	ldr	x2, [x8]
 1275ec4: 94005c1c     	bl	0x128cf34 <__start_il2cpp+0xe5770>
 1275ec8: 52a85908     	mov	w8, #0x42c80000         // =1120403456
 1275ecc: 1e270101     	fmov	s1, w8
 1275ed0: 1e212000     	fcmp	s0, s1
 1275ed4: 54001805     	b.pl	0x12761d4 <__start_il2cpp+0xcea10>
 1275ed8: f94002e0     	ldr	x0, [x23]
 1275edc: b400b7c0     	cbz	x0, 0x12775d4 <__start_il2cpp+0xcfe10>
 1275ee0: 52800202     	mov	w2, #0x10               // =16
 1275ee4: 2a1403e1     	mov	w1, w20
 1275ee8: aa1f03e3     	mov	x3, xzr
 1275eec: 94005d9f     	bl	0x128d568 <__start_il2cpp+0xe5da4>
 1275ef0: f94002e8     	ldr	x8, [x23]
 1275ef4: b400b708     	cbz	x8, 0x12775d4 <__start_il2cpp+0xcfe10>
 1275ef8: 2a0003f5     	mov	w21, w0
 1275efc: 52800222     	mov	w2, #0x11               // =17
 1275f00: aa0803e0     	mov	x0, x8
 1275f04: 2a1403e1     	mov	w1, w20
 1275f08: aa1f03e3     	mov	x3, xzr
 1275f0c: 94005d97     	bl	0x128d568 <__start_il2cpp+0xe5da4>
 1275f10: f94002e8     	ldr	x8, [x23]
 1275f14: b400b608     	cbz	x8, 0x12775d4 <__start_il2cpp+0xcfe10>
 1275f18: 2a0003f6     	mov	w22, w0
 1275f1c: 52800242     	mov	w2, #0x12               // =18
 1275f20: aa0803e0     	mov	x0, x8
 1275f24: 2a1403e1     	mov	w1, w20
 1275f28: aa1f03e3     	mov	x3, xzr
 1275f2c: 94005d8f     	bl	0x128d568 <__start_il2cpp+0xe5da4>
 1275f30: f94002e8     	ldr	x8, [x23]
 1275f34: b400b508     	cbz	x8, 0x12775d4 <__start_il2cpp+0xcfe10>
 1275f38: 2a0003f3     	mov	w19, w0
 1275f3c: 52800262     	mov	w2, #0x13               // =19
 1275f40: aa0803e0     	mov	x0, x8
 1275f44: 2a1403e1     	mov	w1, w20
 1275f48: aa1f03e3     	mov	x3, xzr
 1275f4c: 94005d87     	bl	0x128d568 <__start_il2cpp+0xe5da4>
 1275f50: f94002e8     	ldr	x8, [x23]
 1275f54: b400b408     	cbz	x8, 0x12775d4 <__start_il2cpp+0xcfe10>
 1275f58: 2a0003f9     	mov	w25, w0
 1275f5c: 52800282     	mov	w2, #0x14               // =20
 1275f60: aa0803e0     	mov	x0, x8
 1275f64: 2a1403e1     	mov	w1, w20
 1275f68: aa1f03e3     	mov	x3, xzr
 1275f6c: 94005d7f     	bl	0x128d568 <__start_il2cpp+0xe5da4>
 1275f70: f94002e8     	ldr	x8, [x23]
 1275f74: b400b308     	cbz	x8, 0x12775d4 <__start_il2cpp+0xcfe10>
 1275f78: 2a0003fa     	mov	w26, w0
 1275f7c: 528002c2     	mov	w2, #0x16               // =22
 1275f80: aa0803e0     	mov	x0, x8
 1275f84: 2a1403e1     	mov	w1, w20
 1275f88: aa1f03e3     	mov	x3, xzr
 1275f8c: 94005d77     	bl	0x128d568 <__start_il2cpp+0xe5da4>
 1275f90: f94002e8     	ldr	x8, [x23]
 1275f94: b400b208     	cbz	x8, 0x12775d4 <__start_il2cpp+0xcfe10>
 1275f98: 2a0003fb     	mov	w27, w0
 1275f9c: 52800382     	mov	w2, #0x1c               // =28
 1275fa0: aa0803e0     	mov	x0, x8
 1275fa4: 2a1403e1     	mov	w1, w20
 1275fa8: aa1f03e3     	mov	x3, xzr
 1275fac: 94005d6f     	bl	0x128d568 <__start_il2cpp+0xe5da4>
 1275fb0: f94002e8     	ldr	x8, [x23]
 1275fb4: b400b108     	cbz	x8, 0x12775d4 <__start_il2cpp+0xcfe10>
 1275fb8: b90017e0     	str	w0, [sp, #0x14]
 1275fbc: 52800462     	mov	w2, #0x23               // =35
 1275fc0: aa0803e0     	mov	x0, x8
 1275fc4: 2a1403e1     	mov	w1, w20
 1275fc8: aa1f03e3     	mov	x3, xzr
 1275fcc: 94005d67     	bl	0x128d568 <__start_il2cpp+0xe5da4>
 1275fd0: f94002e8     	ldr	x8, [x23]
 1275fd4: b400b008     	cbz	x8, 0x12775d4 <__start_il2cpp+0xcfe10>
 1275fd8: 2901efe0     	stp	w0, w27, [sp, #0xc]
 1275fdc: 528003a2     	mov	w2, #0x1d               // =29
 1275fe0: aa0803e0     	mov	x0, x8
 1275fe4: 2a1403e1     	mov	w1, w20
 1275fe8: aa1f03e3     	mov	x3, xzr
 1275fec: 94005d5f     	bl	0x128d568 <__start_il2cpp+0xe5da4>
 1275ff0: f94002e8     	ldr	x8, [x23]
 1275ff4: b400af08     	cbz	x8, 0x12775d4 <__start_il2cpp+0xcfe10>
 1275ff8: 2a0003fd     	mov	w29, w0
 1275ffc: 528003c2     	mov	w2, #0x1e               // =30
 1276000: aa0803e0     	mov	x0, x8
 1276004: 2a1403e1     	mov	w1, w20
 1276008: aa1f03e3     	mov	x3, xzr
 127600c: 2a1a03fc     	mov	w28, w26
 1276010: 2a1903fb     	mov	w27, w25
 1276014: 94005d55     	bl	0x128d568 <__start_il2cpp+0xe5da4>
 1276018: f94002e8     	ldr	x8, [x23]
 127601c: b400adc8     	cbz	x8, 0x12775d4 <__start_il2cpp+0xcfe10>
 1276020: 2a0003f8     	mov	w24, w0
 1276024: 528003e2     	mov	w2, #0x1f               // =31
 1276028: aa0803e0     	mov	x0, x8
 127602c: 2a1403e1     	mov	w1, w20
 1276030: aa1f03e3     	mov	x3, xzr
 1276034: 2a1603fa     	mov	w26, w22
 1276038: 94005d4c     	bl	0x128d568 <__start_il2cpp+0xe5da4>
 127603c: f94002e8     	ldr	x8, [x23]
 1276040: b400aca8     	cbz	x8, 0x12775d4 <__start_il2cpp+0xcfe10>
 1276044: 2a0003f9     	mov	w25, w0
 1276048: 52800422     	mov	w2, #0x21               // =33
 127604c: aa0803e0     	mov	x0, x8
 1276050: 2a1403e1     	mov	w1, w20
 1276054: aa1f03e3     	mov	x3, xzr
 1276058: 94005d44     	bl	0x128d568 <__start_il2cpp+0xe5da4>
 127605c: f94002e8     	ldr	x8, [x23]
 1276060: b400aba8     	cbz	x8, 0x12775d4 <__start_il2cpp+0xcfe10>
 1276064: 2a0003f6     	mov	w22, w0
 1276068: 52800442     	mov	w2, #0x22               // =34
 127606c: aa0803e0     	mov	x0, x8
 1276070: 2a1403e1     	mov	w1, w20
 1276074: aa1f03e3     	mov	x3, xzr
 1276078: 94005d3c     	bl	0x128d568 <__start_il2cpp+0xe5da4>
 127607c: f94002e8     	ldr	x8, [x23]
 1276080: b400aaa8     	cbz	x8, 0x12775d4 <__start_il2cpp+0xcfe10>
 1276084: 710002bf     	cmp	w21, #0x0
 1276088: 52800029     	mov	w9, #0x1                // =1
 127608c: 1a9fd7ea     	cset	w10, gt
 1276090: 1a89d529     	cinc	w9, w9, gt
 1276094: 7100075f     	cmp	w26, #0x1
 1276098: 1a89b149     	csel	w9, w10, w9, lt
 127609c: b94013ea     	ldr	w10, [sp, #0x10]
 12760a0: 7100027f     	cmp	w19, #0x0
 12760a4: 1a89d529     	cinc	w9, w9, gt
 12760a8: 7100037f     	cmp	w27, #0x0
 12760ac: 1a89d529     	cinc	w9, w9, gt
 12760b0: 7100039f     	cmp	w28, #0x0
 12760b4: 1a89d529     	cinc	w9, w9, gt
 12760b8: 7100015f     	cmp	w10, #0x0
 12760bc: b94017ea     	ldr	w10, [sp, #0x14]
 12760c0: 1a89d529     	cinc	w9, w9, gt
 12760c4: 52800402     	mov	w2, #0x20               // =32
 12760c8: 2a1403e1     	mov	w1, w20
 12760cc: 7100015f     	cmp	w10, #0x0
 12760d0: b9400fea     	ldr	w10, [sp, #0xc]
 12760d4: 1a89d529     	cinc	w9, w9, gt
 12760d8: aa1f03e3     	mov	x3, xzr
 12760dc: 7100015f     	cmp	w10, #0x0
 12760e0: 1a89d529     	cinc	w9, w9, gt
 12760e4: 710003bf     	cmp	w29, #0x0
 12760e8: 1a89d529     	cinc	w9, w9, gt
 12760ec: 7100031f     	cmp	w24, #0x0
 12760f0: 1a89d529     	cinc	w9, w9, gt
 12760f4: 7100033f     	cmp	w25, #0x0
 12760f8: 1a89d529     	cinc	w9, w9, gt
 12760fc: 710002df     	cmp	w22, #0x0
 1276100: 1a89d529     	cinc	w9, w9, gt
 1276104: 7100001f     	cmp	w0, #0x0
 1276108: aa0803e0     	mov	x0, x8
 127610c: 1a89d533     	cinc	w19, w9, gt
 1276110: 94005d16     	bl	0x128d568 <__start_il2cpp+0xe5da4>
 1276114: 7100001f     	cmp	w0, #0x0
 1276118: 1a93d668     	cinc	w8, w19, gt
 127611c: 9000af73     	adrp	x19, 0x2862000
 1276120: 1e231000     	fmov	s0, #6.00000000
 1276124: 1e220101     	scvtf	s1, w8
 1276128: 52a85908     	mov	w8, #0x42c80000         // =1120403456
 127612c: f94017fc     	ldr	x28, [sp, #0x28]
 1276130: f9447e73     	ldr	x19, [x19, #0x8f8]
 1276134: f9400ff8     	ldr	x24, [sp, #0x18]
 1276138: 1e201820     	fdiv	s0, s1, s0
 127613c: 1e270101     	fmov	s1, w8
 1276140: 1e210800     	fmul	s0, s0, s1
 1276144: 1e212000     	fcmp	s0, s1
 1276148: 540003ab     	b.lt	0x12761bc <__start_il2cpp+0xce9f8>
 127614c: f9400300     	ldr	x0, [x24]
 1276150: b400a420     	cbz	x0, 0x12775d4 <__start_il2cpp+0xcfe10>
 1276154: d000af29     	adrp	x9, 0x285c000 <_ZTVN10__cxxabiv119__pointer_type_infoE+0x18>
 1276158: f9400261     	ldr	x1, [x19]
 127615c: f947a529     	ldr	x9, [x9, #0xf48]
 1276160: b9401c0a     	ldr	w10, [x0, #0x1c]
 1276164: f9400808     	ldr	x8, [x0, #0x10]
 1276168: f9400129     	ldr	x9, [x9]
 127616c: 1100054a     	add	w10, w10, #0x1
 1276170: b9001c0a     	str	w10, [x0, #0x1c]
 1276174: b400a308     	cbz	x8, 0x12775d4 <__start_il2cpp+0xcfe10>
 1276178: b980180a     	ldrsw	x10, [x0, #0x18]
 127617c: b940190b     	ldr	w11, [x8, #0x18]
 1276180: 6b0b015f     	cmp	w10, w11
 1276184: 54000102     	b.hs	0x12761a4 <__start_il2cpp+0xce9e0>
 1276188: 11000549     	add	w9, w10, #0x1
 127618c: 8b0a0d08     	add	x8, x8, x10, lsl #3
 1276190: 52a8590a     	mov	w10, #0x42c80000        // =1120403456
 1276194: b9001809     	str	w9, [x0, #0x18]
 1276198: f9001101     	str	x1, [x8, #0x20]
 127619c: 1e270140     	fmov	s0, w10
 12761a0: 14000007     	b	0x12761bc <__start_il2cpp+0xce9f8>
 12761a4: f9401128     	ldr	x8, [x9, #0x20]
 12761a8: f9406108     	ldr	x8, [x8, #0xc0]
 12761ac: f9403902     	ldr	x2, [x8, #0x70]
 12761b0: 941a1099     	bl	0x18fa414 <__start_il2cpp+0x752c50>
 12761b4: 52a85908     	mov	w8, #0x42c80000         // =1120403456
 12761b8: 1e270100     	fmov	s0, w8
 12761bc: f94002e0     	ldr	x0, [x23]
 12761c0: b400a0a0     	cbz	x0, 0x12775d4 <__start_il2cpp+0xcfe10>
 12761c4: f9400262     	ldr	x2, [x19]
 12761c8: 2a1403e1     	mov	w1, w20
 12761cc: aa1f03e3     	mov	x3, xzr
 12761d0: 94005b61     	bl	0x128cf54 <__start_il2cpp+0xe5790>
 12761d4: f94002e0     	ldr	x0, [x23]
 12761d8: b4009fe0     	cbz	x0, 0x12775d4 <__start_il2cpp+0xcfe10>
 12761dc: 9000af75     	adrp	x21, 0x2862000
 12761e0: f94492b5     	ldr	x21, [x21, #0x920]
 12761e4: 2a1403e1     	mov	w1, w20
 12761e8: aa1f03e3     	mov	x3, xzr
 12761ec: f94002a2     	ldr	x2, [x21]
 12761f0: 94005b51     	bl	0x128cf34 <__start_il2cpp+0xe5770>
 12761f4: 52a85908     	mov	w8, #0x42c80000         // =1120403456
 12761f8: 1e270101     	fmov	s1, w8
 12761fc: 1e212000     	fcmp	s0, s1
 1276200: 54000905     	b.pl	0x1276320 <__start_il2cpp+0xceb5c>
 1276204: f94002e0     	ldr	x0, [x23]
 1276208: b4009e60     	cbz	x0, 0x12775d4 <__start_il2cpp+0xcfe10>
 127620c: 528002e2     	mov	w2, #0x17               // =23
 1276210: 2a1403e1     	mov	w1, w20
 1276214: aa1f03e3     	mov	x3, xzr
 1276218: 94005cd4     	bl	0x128d568 <__start_il2cpp+0xe5da4>
 127621c: f94002e8     	ldr	x8, [x23]
 1276220: b4009da8     	cbz	x8, 0x12775d4 <__start_il2cpp+0xcfe10>
 1276224: 2a0003f3     	mov	w19, w0
 1276228: 52800302     	mov	w2, #0x18               // =24
 127622c: aa0803e0     	mov	x0, x8
 1276230: 2a1403e1     	mov	w1, w20
 1276234: aa1f03e3     	mov	x3, xzr
 1276238: 94005ccc     	bl	0x128d568 <__start_il2cpp+0xe5da4>
 127623c: f94002e8     	ldr	x8, [x23]
 1276240: b4009ca8     	cbz	x8, 0x12775d4 <__start_il2cpp+0xcfe10>
 1276244: 7100027f     	cmp	w19, #0x0
 1276248: 52800029     	mov	w9, #0x1                // =1
 127624c: 1a9fd7ea     	cset	w10, gt
 1276250: 1a89d529     	cinc	w9, w9, gt
 1276254: 7100041f     	cmp	w0, #0x1
 1276258: 52800322     	mov	w2, #0x19               // =25
 127625c: aa0803e0     	mov	x0, x8
 1276260: 2a1403e1     	mov	w1, w20
 1276264: aa1f03e3     	mov	x3, xzr
 1276268: 1a89b153     	csel	w19, w10, w9, lt
 127626c: 94005cbf     	bl	0x128d568 <__start_il2cpp+0xe5da4>
 1276270: 7100001f     	cmp	w0, #0x0
 1276274: 1a93d668     	cinc	w8, w19, gt
 1276278: 1e211000     	fmov	s0, #3.00000000
 127627c: 1e220101     	scvtf	s1, w8
 1276280: 52a85908     	mov	w8, #0x42c80000         // =1120403456
 1276284: 1e201820     	fdiv	s0, s1, s0
 1276288: 1e270101     	fmov	s1, w8
 127628c: 1e210800     	fmul	s0, s0, s1
 1276290: 1e212000     	fcmp	s0, s1
 1276294: 540003ab     	b.lt	0x1276308 <__start_il2cpp+0xceb44>
 1276298: f9400300     	ldr	x0, [x24]
 127629c: b40099c0     	cbz	x0, 0x12775d4 <__start_il2cpp+0xcfe10>
 12762a0: d000af29     	adrp	x9, 0x285c000 <_ZTVN10__cxxabiv119__pointer_type_infoE+0x18>
 12762a4: f94002a1     	ldr	x1, [x21]
 12762a8: f947a529     	ldr	x9, [x9, #0xf48]
 12762ac: b9401c0a     	ldr	w10, [x0, #0x1c]
 12762b0: f9400808     	ldr	x8, [x0, #0x10]
 12762b4: f9400129     	ldr	x9, [x9]
 12762b8: 1100054a     	add	w10, w10, #0x1
 12762bc: b9001c0a     	str	w10, [x0, #0x1c]
 12762c0: b40098a8     	cbz	x8, 0x12775d4 <__start_il2cpp+0xcfe10>
 12762c4: b980180a     	ldrsw	x10, [x0, #0x18]
 12762c8: b940190b     	ldr	w11, [x8, #0x18]
 12762cc: 6b0b015f     	cmp	w10, w11
 12762d0: 54000102     	b.hs	0x12762f0 <__start_il2cpp+0xceb2c>
 12762d4: 11000549     	add	w9, w10, #0x1
 12762d8: 8b0a0d08     	add	x8, x8, x10, lsl #3
 12762dc: 52a8590a     	mov	w10, #0x42c80000        // =1120403456
 12762e0: b9001809     	str	w9, [x0, #0x18]
 12762e4: f9001101     	str	x1, [x8, #0x20]
 12762e8: 1e270140     	fmov	s0, w10
 12762ec: 14000007     	b	0x1276308 <__start_il2cpp+0xceb44>
 12762f0: f9401128     	ldr	x8, [x9, #0x20]
 12762f4: f9406108     	ldr	x8, [x8, #0xc0]
 12762f8: f9403902     	ldr	x2, [x8, #0x70]
 12762fc: 941a1046     	bl	0x18fa414 <__start_il2cpp+0x752c50>
 1276300: 52a85908     	mov	w8, #0x42c80000         // =1120403456
 1276304: 1e270100     	fmov	s0, w8
 1276308: f94002e0     	ldr	x0, [x23]
 127630c: b4009640     	cbz	x0, 0x12775d4 <__start_il2cpp+0xcfe10>
 1276310: f94002a2     	ldr	x2, [x21]
 1276314: 2a1403e1     	mov	w1, w20
 1276318: aa1f03e3     	mov	x3, xzr
 127631c: 94005b0e     	bl	0x128cf54 <__start_il2cpp+0xe5790>
 1276320: f94002e0     	ldr	x0, [x23]
 1276324: b4009580     	cbz	x0, 0x12775d4 <__start_il2cpp+0xcfe10>
 1276328: 2a1403e1     	mov	w1, w20
 127632c: aa1f03e2     	mov	x2, xzr
 1276330: 9400551b     	bl	0x128b79c <__start_il2cpp+0xe3fd8>
 1276334: f94002e8     	ldr	x8, [x23]
 1276338: b40094e8     	cbz	x8, 0x12775d4 <__start_il2cpp+0xcfe10>
 127633c: 9000af73     	adrp	x19, 0x2862000
 1276340: f943fa73     	ldr	x19, [x19, #0x7f0]
 1276344: 1e220008     	scvtf	s8, w0
 1276348: aa0803e0     	mov	x0, x8
 127634c: 2a1403e1     	mov	w1, w20
 1276350: f9400262     	ldr	x2, [x19]
 1276354: aa1f03e3     	mov	x3, xzr
 1276358: 94005af7     	bl	0x128cf34 <__start_il2cpp+0xe5770>
 127635c: 52a85908     	mov	w8, #0x42c80000         // =1120403456
 1276360: 1e270101     	fmov	s1, w8
 1276364: 1e212000     	fcmp	s0, s1
 1276368: 54000565     	b.pl	0x1276414 <__start_il2cpp+0xcec50>
 127636c: 52a88f48     	mov	w8, #0x447a0000         // =1148846080
 1276370: 52a85909     	mov	w9, #0x42c80000         // =1120403456
 1276374: 1e270100     	fmov	s0, w8
 1276378: 1e201900     	fdiv	s0, s8, s0
 127637c: 1e270121     	fmov	s1, w9
 1276380: 1e210800     	fmul	s0, s0, s1
 1276384: 1e212000     	fcmp	s0, s1
 1276388: 540003ab     	b.lt	0x12763fc <__start_il2cpp+0xcec38>
 127638c: f9400300     	ldr	x0, [x24]
 1276390: b4009220     	cbz	x0, 0x12775d4 <__start_il2cpp+0xcfe10>
 1276394: d000af29     	adrp	x9, 0x285c000 <_ZTVN10__cxxabiv119__pointer_type_infoE+0x18>
 1276398: f9400261     	ldr	x1, [x19]
 127639c: f947a529     	ldr	x9, [x9, #0xf48]
 12763a0: b9401c0a     	ldr	w10, [x0, #0x1c]
 12763a4: f9400808     	ldr	x8, [x0, #0x10]
 12763a8: f9400129     	ldr	x9, [x9]
 12763ac: 1100054a     	add	w10, w10, #0x1
 12763b0: b9001c0a     	str	w10, [x0, #0x1c]
 12763b4: b4009108     	cbz	x8, 0x12775d4 <__start_il2cpp+0xcfe10>
 12763b8: b980180a     	ldrsw	x10, [x0, #0x18]
 12763bc: b940190b     	ldr	w11, [x8, #0x18]
 12763c0: 6b0b015f     	cmp	w10, w11
 12763c4: 54000102     	b.hs	0x12763e4 <__start_il2cpp+0xcec20>
 12763c8: 11000549     	add	w9, w10, #0x1
 12763cc: 8b0a0d08     	add	x8, x8, x10, lsl #3
 12763d0: 52a8590a     	mov	w10, #0x42c80000        // =1120403456
 12763d4: b9001809     	str	w9, [x0, #0x18]
 12763d8: f9001101     	str	x1, [x8, #0x20]
 12763dc: 1e270140     	fmov	s0, w10
 12763e0: 14000007     	b	0x12763fc <__start_il2cpp+0xcec38>
 12763e4: f9401128     	ldr	x8, [x9, #0x20]
 12763e8: f9406108     	ldr	x8, [x8, #0xc0]
 12763ec: f9403902     	ldr	x2, [x8, #0x70]
 12763f0: 941a1009     	bl	0x18fa414 <__start_il2cpp+0x752c50>
 12763f4: 52a85908     	mov	w8, #0x42c80000         // =1120403456
 12763f8: 1e270100     	fmov	s0, w8
 12763fc: f94002e0     	ldr	x0, [x23]
 1276400: b4008ea0     	cbz	x0, 0x12775d4 <__start_il2cpp+0xcfe10>
 1276404: f9400262     	ldr	x2, [x19]
 1276408: 2a1403e1     	mov	w1, w20
 127640c: aa1f03e3     	mov	x3, xzr
 1276410: 94005ad1     	bl	0x128cf54 <__start_il2cpp+0xe5790>
 1276414: f94002e0     	ldr	x0, [x23]
 1276418: b4008de0     	cbz	x0, 0x12775d4 <__start_il2cpp+0xcfe10>
 127641c: 9000af73     	adrp	x19, 0x2862000
 1276420: f9446e73     	ldr	x19, [x19, #0x8d8]
 1276424: 2a1403e1     	mov	w1, w20
 1276428: aa1f03e3     	mov	x3, xzr
 127642c: f9400262     	ldr	x2, [x19]
 1276430: 94005ac1     	bl	0x128cf34 <__start_il2cpp+0xe5770>
 1276434: 52a85908     	mov	w8, #0x42c80000         // =1120403456
 1276438: 1e270101     	fmov	s1, w8
 127643c: 1e212000     	fcmp	s0, s1
 1276440: 54000565     	b.pl	0x12764ec <__start_il2cpp+0xced28>
 1276444: b0ffa108     	adrp	x8, 0x697000
 1276448: bd463d00     	ldr	s0, [x8, #0x63c]
 127644c: 52a85908     	mov	w8, #0x42c80000         // =1120403456
 1276450: 1e270101     	fmov	s1, w8
 1276454: 1e201900     	fdiv	s0, s8, s0
 1276458: 1e210800     	fmul	s0, s0, s1
 127645c: 1e212000     	fcmp	s0, s1
 1276460: 540003ab     	b.lt	0x12764d4 <__start_il2cpp+0xced10>
 1276464: f9400300     	ldr	x0, [x24]
 1276468: b4008b60     	cbz	x0, 0x12775d4 <__start_il2cpp+0xcfe10>
 127646c: d000af29     	adrp	x9, 0x285c000 <_ZTVN10__cxxabiv119__pointer_type_infoE+0x18>
 1276470: f9400261     	ldr	x1, [x19]
 1276474: f947a529     	ldr	x9, [x9, #0xf48]
 1276478: b9401c0a     	ldr	w10, [x0, #0x1c]
 127647c: f9400808     	ldr	x8, [x0, #0x10]
 1276480: f9400129     	ldr	x9, [x9]
 1276484: 1100054a     	add	w10, w10, #0x1
 1276488: b9001c0a     	str	w10, [x0, #0x1c]
 127648c: b4008a48     	cbz	x8, 0x12775d4 <__start_il2cpp+0xcfe10>
 1276490: b980180a     	ldrsw	x10, [x0, #0x18]
 1276494: b940190b     	ldr	w11, [x8, #0x18]
 1276498: 6b0b015f     	cmp	w10, w11
 127649c: 54000102     	b.hs	0x12764bc <__start_il2cpp+0xcecf8>
 12764a0: 11000549     	add	w9, w10, #0x1
 12764a4: 8b0a0d08     	add	x8, x8, x10, lsl #3
 12764a8: 52a8590a     	mov	w10, #0x42c80000        // =1120403456
 12764ac: b9001809     	str	w9, [x0, #0x18]
 12764b0: f9001101     	str	x1, [x8, #0x20]
 12764b4: 1e270140     	fmov	s0, w10
 12764b8: 14000007     	b	0x12764d4 <__start_il2cpp+0xced10>
 12764bc: f9401128     	ldr	x8, [x9, #0x20]
 12764c0: f9406108     	ldr	x8, [x8, #0xc0]
 12764c4: f9403902     	ldr	x2, [x8, #0x70]
 12764c8: 941a0fd3     	bl	0x18fa414 <__start_il2cpp+0x752c50>
 12764cc: 52a85908     	mov	w8, #0x42c80000         // =1120403456
 12764d0: 1e270100     	fmov	s0, w8
 12764d4: f94002e0     	ldr	x0, [x23]
 12764d8: b40087e0     	cbz	x0, 0x12775d4 <__start_il2cpp+0xcfe10>
 12764dc: f9400262     	ldr	x2, [x19]
 12764e0: 2a1403e1     	mov	w1, w20
 12764e4: aa1f03e3     	mov	x3, xzr
 12764e8: 94005a9b     	bl	0x128cf54 <__start_il2cpp+0xe5790>
 12764ec: f94002e0     	ldr	x0, [x23]
 12764f0: b4008720     	cbz	x0, 0x12775d4 <__start_il2cpp+0xcfe10>
 12764f4: 9000af73     	adrp	x19, 0x2862000
 12764f8: f9442273     	ldr	x19, [x19, #0x840]
 12764fc: 2a1403e1     	mov	w1, w20
 1276500: aa1f03e3     	mov	x3, xzr
 1276504: f9400262     	ldr	x2, [x19]
 1276508: 94005a8b     	bl	0x128cf34 <__start_il2cpp+0xe5770>
 127650c: 52a85908     	mov	w8, #0x42c80000         // =1120403456
 1276510: 1e270101     	fmov	s1, w8
 1276514: 1e212000     	fcmp	s0, s1
 1276518: 54000565     	b.pl	0x12765c4 <__start_il2cpp+0xcee00>
 127651c: b0ffa108     	adrp	x8, 0x697000
 1276520: bd45d500     	ldr	s0, [x8, #0x5d4]
 1276524: 52a85908     	mov	w8, #0x42c80000         // =1120403456
 1276528: 1e270101     	fmov	s1, w8
 127652c: 1e201900     	fdiv	s0, s8, s0
 1276530: 1e210800     	fmul	s0, s0, s1
 1276534: 1e212000     	fcmp	s0, s1
 1276538: 540003ab     	b.lt	0x12765ac <__start_il2cpp+0xcede8>
 127653c: f9400300     	ldr	x0, [x24]
 1276540: b40084a0     	cbz	x0, 0x12775d4 <__start_il2cpp+0xcfe10>
 1276544: d000af29     	adrp	x9, 0x285c000 <_ZTVN10__cxxabiv119__pointer_type_infoE+0x18>
 1276548: f9400261     	ldr	x1, [x19]
 127654c: f947a529     	ldr	x9, [x9, #0xf48]
 1276550: b9401c0a     	ldr	w10, [x0, #0x1c]
 1276554: f9400808     	ldr	x8, [x0, #0x10]
 1276558: f9400129     	ldr	x9, [x9]
 127655c: 1100054a     	add	w10, w10, #0x1
 1276560: b9001c0a     	str	w10, [x0, #0x1c]
 1276564: b4008388     	cbz	x8, 0x12775d4 <__start_il2cpp+0xcfe10>
 1276568: b980180a     	ldrsw	x10, [x0, #0x18]
 127656c: b940190b     	ldr	w11, [x8, #0x18]
 1276570: 6b0b015f     	cmp	w10, w11
 1276574: 54000102     	b.hs	0x1276594 <__start_il2cpp+0xcedd0>
 1276578: 11000549     	add	w9, w10, #0x1
 127657c: 8b0a0d08     	add	x8, x8, x10, lsl #3
 1276580: 52a8590a     	mov	w10, #0x42c80000        // =1120403456
 1276584: b9001809     	str	w9, [x0, #0x18]
 1276588: f9001101     	str	x1, [x8, #0x20]
 127658c: 1e270140     	fmov	s0, w10
 1276590: 14000007     	b	0x12765ac <__start_il2cpp+0xcede8>
 1276594: f9401128     	ldr	x8, [x9, #0x20]
 1276598: f9406108     	ldr	x8, [x8, #0xc0]
 127659c: f9403902     	ldr	x2, [x8, #0x70]
 12765a0: 941a0f9d     	bl	0x18fa414 <__start_il2cpp+0x752c50>
 12765a4: 52a85908     	mov	w8, #0x42c80000         // =1120403456
 12765a8: 1e270100     	fmov	s0, w8
 12765ac: f94002e0     	ldr	x0, [x23]
 12765b0: b4008120     	cbz	x0, 0x12775d4 <__start_il2cpp+0xcfe10>
 12765b4: f9400262     	ldr	x2, [x19]
 12765b8: 2a1403e1     	mov	w1, w20
 12765bc: aa1f03e3     	mov	x3, xzr
 12765c0: 94005a65     	bl	0x128cf54 <__start_il2cpp+0xe5790>
 12765c4: f94002e0     	ldr	x0, [x23]
 12765c8: b4008060     	cbz	x0, 0x12775d4 <__start_il2cpp+0xcfe10>
 12765cc: 2a1403e1     	mov	w1, w20
 12765d0: aa1f03e2     	mov	x2, xzr
 12765d4: 9400619b     	bl	0x128ec40 <__start_il2cpp+0xe747c>
 12765d8: f94002e8     	ldr	x8, [x23]
 12765dc: b4007fc8     	cbz	x8, 0x12775d4 <__start_il2cpp+0xcfe10>
 12765e0: 9000af73     	adrp	x19, 0x2862000
 12765e4: f9444e73     	ldr	x19, [x19, #0x898]
 12765e8: 1e220008     	scvtf	s8, w0
 12765ec: aa0803e0     	mov	x0, x8
 12765f0: 2a1403e1     	mov	w1, w20
 12765f4: f9400262     	ldr	x2, [x19]
 12765f8: aa1f03e3     	mov	x3, xzr
 12765fc: 94005a4e     	bl	0x128cf34 <__start_il2cpp+0xe5770>
 1276600: 52a85908     	mov	w8, #0x42c80000         // =1120403456
 1276604: 1e270101     	fmov	s1, w8
 1276608: 1e212000     	fcmp	s0, s1
 127660c: 54000565     	b.pl	0x12766b8 <__start_il2cpp+0xceef4>
 1276610: b0ffa108     	adrp	x8, 0x697000
 1276614: bd44dd00     	ldr	s0, [x8, #0x4dc]
 1276618: 52a85908     	mov	w8, #0x42c80000         // =1120403456
 127661c: 1e270101     	fmov	s1, w8
 1276620: 1e201900     	fdiv	s0, s8, s0
 1276624: 1e210800     	fmul	s0, s0, s1
 1276628: 1e212000     	fcmp	s0, s1
 127662c: 540003ab     	b.lt	0x12766a0 <__start_il2cpp+0xceedc>
 1276630: f9400300     	ldr	x0, [x24]
 1276634: b4007d00     	cbz	x0, 0x12775d4 <__start_il2cpp+0xcfe10>
 1276638: d000af29     	adrp	x9, 0x285c000 <_ZTVN10__cxxabiv119__pointer_type_infoE+0x18>
 127663c: f9400261     	ldr	x1, [x19]
 1276640: f947a529     	ldr	x9, [x9, #0xf48]
 1276644: b9401c0a     	ldr	w10, [x0, #0x1c]
 1276648: f9400808     	ldr	x8, [x0, #0x10]
 127664c: f9400129     	ldr	x9, [x9]
 1276650: 1100054a     	add	w10, w10, #0x1
 1276654: b9001c0a     	str	w10, [x0, #0x1c]
 1276658: b4007be8     	cbz	x8, 0x12775d4 <__start_il2cpp+0xcfe10>
 127665c: b980180a     	ldrsw	x10, [x0, #0x18]
 1276660: b940190b     	ldr	w11, [x8, #0x18]
 1276664: 6b0b015f     	cmp	w10, w11
 1276668: 54000102     	b.hs	0x1276688 <__start_il2cpp+0xceec4>
 127666c: 11000549     	add	w9, w10, #0x1
 1276670: 8b0a0d08     	add	x8, x8, x10, lsl #3
 1276674: 52a8590a     	mov	w10, #0x42c80000        // =1120403456
 1276678: b9001809     	str	w9, [x0, #0x18]
 127667c: f9001101     	str	x1, [x8, #0x20]
 1276680: 1e270140     	fmov	s0, w10
 1276684: 14000007     	b	0x12766a0 <__start_il2cpp+0xceedc>
 1276688: f9401128     	ldr	x8, [x9, #0x20]
 127668c: f9406108     	ldr	x8, [x8, #0xc0]
 1276690: f9403902     	ldr	x2, [x8, #0x70]
 1276694: 941a0f60     	bl	0x18fa414 <__start_il2cpp+0x752c50>
 1276698: 52a85908     	mov	w8, #0x42c80000         // =1120403456
 127669c: 1e270100     	fmov	s0, w8
 12766a0: f94002e0     	ldr	x0, [x23]
 12766a4: b4007980     	cbz	x0, 0x12775d4 <__start_il2cpp+0xcfe10>
 12766a8: f9400262     	ldr	x2, [x19]
 12766ac: 2a1403e1     	mov	w1, w20
 12766b0: aa1f03e3     	mov	x3, xzr
 12766b4: 94005a28     	bl	0x128cf54 <__start_il2cpp+0xe5790>
 12766b8: f94002e0     	ldr	x0, [x23]
 12766bc: b40078c0     	cbz	x0, 0x12775d4 <__start_il2cpp+0xcfe10>
 12766c0: 9000af73     	adrp	x19, 0x2862000
 12766c4: f9443a73     	ldr	x19, [x19, #0x870]
 12766c8: 2a1403e1     	mov	w1, w20
 12766cc: aa1f03e3     	mov	x3, xzr
 12766d0: f9400262     	ldr	x2, [x19]
 12766d4: 94005a18     	bl	0x128cf34 <__start_il2cpp+0xe5770>
 12766d8: 52a85908     	mov	w8, #0x42c80000         // =1120403456
 12766dc: 1e270101     	fmov	s1, w8
 12766e0: 1e212000     	fcmp	s0, s1
 12766e4: 54000565     	b.pl	0x1276790 <__start_il2cpp+0xcefcc>
 12766e8: b0ffa108     	adrp	x8, 0x697000
 12766ec: bd45e500     	ldr	s0, [x8, #0x5e4]
 12766f0: 52a85908     	mov	w8, #0x42c80000         // =1120403456
 12766f4: 1e270101     	fmov	s1, w8
 12766f8: 1e201900     	fdiv	s0, s8, s0
 12766fc: 1e210800     	fmul	s0, s0, s1
 1276700: 1e212000     	fcmp	s0, s1
 1276704: 540003ab     	b.lt	0x1276778 <__start_il2cpp+0xcefb4>
 1276708: f9400300     	ldr	x0, [x24]
 127670c: b4007640     	cbz	x0, 0x12775d4 <__start_il2cpp+0xcfe10>
 1276710: d000af29     	adrp	x9, 0x285c000 <_ZTVN10__cxxabiv119__pointer_type_infoE+0x18>
 1276714: f9400261     	ldr	x1, [x19]
 1276718: f947a529     	ldr	x9, [x9, #0xf48]
 127671c: b9401c0a     	ldr	w10, [x0, #0x1c]
 1276720: f9400808     	ldr	x8, [x0, #0x10]
 1276724: f9400129     	ldr	x9, [x9]
 1276728: 1100054a     	add	w10, w10, #0x1
 127672c: b9001c0a     	str	w10, [x0, #0x1c]
 1276730: b4007528     	cbz	x8, 0x12775d4 <__start_il2cpp+0xcfe10>
 1276734: b980180a     	ldrsw	x10, [x0, #0x18]
 1276738: b940190b     	ldr	w11, [x8, #0x18]
 127673c: 6b0b015f     	cmp	w10, w11
 1276740: 54000102     	b.hs	0x1276760 <__start_il2cpp+0xcef9c>
 1276744: 11000549     	add	w9, w10, #0x1
 1276748: 8b0a0d08     	add	x8, x8, x10, lsl #3
 127674c: 52a8590a     	mov	w10, #0x42c80000        // =1120403456
 1276750: b9001809     	str	w9, [x0, #0x18]
 1276754: f9001101     	str	x1, [x8, #0x20]
 1276758: 1e270140     	fmov	s0, w10
 127675c: 14000007     	b	0x1276778 <__start_il2cpp+0xcefb4>
 1276760: f9401128     	ldr	x8, [x9, #0x20]
 1276764: f9406108     	ldr	x8, [x8, #0xc0]
 1276768: f9403902     	ldr	x2, [x8, #0x70]
 127676c: 941a0f2a     	bl	0x18fa414 <__start_il2cpp+0x752c50>
 1276770: 52a85908     	mov	w8, #0x42c80000         // =1120403456
 1276774: 1e270100     	fmov	s0, w8
 1276778: f94002e0     	ldr	x0, [x23]
 127677c: b40072c0     	cbz	x0, 0x12775d4 <__start_il2cpp+0xcfe10>
 1276780: f9400262     	ldr	x2, [x19]
 1276784: 2a1403e1     	mov	w1, w20
 1276788: aa1f03e3     	mov	x3, xzr
 127678c: 940059f2     	bl	0x128cf54 <__start_il2cpp+0xe5790>
 1276790: f94002e0     	ldr	x0, [x23]
 1276794: b4007200     	cbz	x0, 0x12775d4 <__start_il2cpp+0xcfe10>
 1276798: 9000af75     	adrp	x21, 0x2862000
 127679c: f9444ab5     	ldr	x21, [x21, #0x890]
 12767a0: 2a1403e1     	mov	w1, w20
 12767a4: aa1f03e3     	mov	x3, xzr
 12767a8: f94002a2     	ldr	x2, [x21]
 12767ac: 940059e2     	bl	0x128cf34 <__start_il2cpp+0xe5770>
 12767b0: 52a85908     	mov	w8, #0x42c80000         // =1120403456
 12767b4: 1e270101     	fmov	s1, w8
 12767b8: 1e212000     	fcmp	s0, s1
 12767bc: 54000625     	b.pl	0x1276880 <__start_il2cpp+0xcf0bc>
 12767c0: b0ffa108     	adrp	x8, 0x697000
 12767c4: bd46c100     	ldr	s0, [x8, #0x6c0]
 12767c8: 52a85908     	mov	w8, #0x42c80000         // =1120403456
 12767cc: 1e270101     	fmov	s1, w8
 12767d0: 1e201900     	fdiv	s0, s8, s0
 12767d4: 1e210808     	fmul	s8, s0, s1
 12767d8: 1e212100     	fcmp	s8, s1
 12767dc: 540003ab     	b.lt	0x1276850 <__start_il2cpp+0xcf08c>
 12767e0: f9400300     	ldr	x0, [x24]
 12767e4: b4006f80     	cbz	x0, 0x12775d4 <__start_il2cpp+0xcfe10>
 12767e8: d000af29     	adrp	x9, 0x285c000 <_ZTVN10__cxxabiv119__pointer_type_infoE+0x18>
 12767ec: f94002a1     	ldr	x1, [x21]
 12767f0: f947a529     	ldr	x9, [x9, #0xf48]
 12767f4: b9401c0a     	ldr	w10, [x0, #0x1c]
 12767f8: f9400808     	ldr	x8, [x0, #0x10]
 12767fc: f9400129     	ldr	x9, [x9]
 1276800: 1100054a     	add	w10, w10, #0x1
 1276804: b9001c0a     	str	w10, [x0, #0x1c]
 1276808: b4006e68     	cbz	x8, 0x12775d4 <__start_il2cpp+0xcfe10>
 127680c: b980180a     	ldrsw	x10, [x0, #0x18]
 1276810: b940190b     	ldr	w11, [x8, #0x18]
 1276814: 6b0b015f     	cmp	w10, w11
 1276818: 54000102     	b.hs	0x1276838 <__start_il2cpp+0xcf074>
 127681c: 11000549     	add	w9, w10, #0x1
 1276820: 8b0a0d08     	add	x8, x8, x10, lsl #3
 1276824: 52a8590a     	mov	w10, #0x42c80000        // =1120403456
 1276828: b9001809     	str	w9, [x0, #0x18]
 127682c: f9001101     	str	x1, [x8, #0x20]
 1276830: 1e270148     	fmov	s8, w10
 1276834: 14000007     	b	0x1276850 <__start_il2cpp+0xcf08c>
 1276838: f9401128     	ldr	x8, [x9, #0x20]
 127683c: f9406108     	ldr	x8, [x8, #0xc0]
 1276840: f9403902     	ldr	x2, [x8, #0x70]
 1276844: 941a0ef4     	bl	0x18fa414 <__start_il2cpp+0x752c50>
 1276848: 52a85908     	mov	w8, #0x42c80000         // =1120403456
 127684c: 1e270108     	fmov	s8, w8
 1276850: f9405f80     	ldr	x0, [x28, #0xb8]
 1276854: b4006c00     	cbz	x0, 0x12775d4 <__start_il2cpp+0xcfe10>
 1276858: f9405b93     	ldr	x19, [x28, #0xb0]
 127685c: aa1f03e1     	mov	x1, xzr
 1276860: 9400bf6b     	bl	0x12a660c <__start_il2cpp+0xfee48>
 1276864: b4006b93     	cbz	x19, 0x12775d4 <__start_il2cpp+0xcfe10>
 1276868: f94002a2     	ldr	x2, [x21]
 127686c: 2a0003e1     	mov	w1, w0
 1276870: aa1303e0     	mov	x0, x19
 1276874: 4ea81d00     	mov	v0.16b, v8.16b
 1276878: aa1f03e3     	mov	x3, xzr
 127687c: 940059b6     	bl	0x128cf54 <__start_il2cpp+0xe5790>
 1276880: f94002e0     	ldr	x0, [x23]
 1276884: b4006a80     	cbz	x0, 0x12775d4 <__start_il2cpp+0xcfe10>
 1276888: 2a1403e1     	mov	w1, w20
 127688c: aa1f03e2     	mov	x2, xzr
 1276890: 940060f2     	bl	0x128ec58 <__start_il2cpp+0xe7494>
 1276894: f94002e8     	ldr	x8, [x23]
 1276898: b40069e8     	cbz	x8, 0x12775d4 <__start_il2cpp+0xcfe10>
 127689c: 9000af73     	adrp	x19, 0x2862000
 12768a0: f9441e73     	ldr	x19, [x19, #0x838]
 12768a4: 1e220008     	scvtf	s8, w0
 12768a8: aa0803e0     	mov	x0, x8
 12768ac: 2a1403e1     	mov	w1, w20
 12768b0: f9400262     	ldr	x2, [x19]
 12768b4: aa1f03e3     	mov	x3, xzr
 12768b8: 9400599f     	bl	0x128cf34 <__start_il2cpp+0xe5770>
 12768bc: 52a85908     	mov	w8, #0x42c80000         // =1120403456
 12768c0: 1e270101     	fmov	s1, w8
 12768c4: 1e212000     	fcmp	s0, s1
 12768c8: 54000565     	b.pl	0x1276974 <__start_il2cpp+0xcf1b0>
 12768cc: b0ffa108     	adrp	x8, 0x697000
 12768d0: bd44dd00     	ldr	s0, [x8, #0x4dc]
 12768d4: 52a85908     	mov	w8, #0x42c80000         // =1120403456
 12768d8: 1e270101     	fmov	s1, w8
 12768dc: 1e201900     	fdiv	s0, s8, s0
 12768e0: 1e210800     	fmul	s0, s0, s1
 12768e4: 1e212000     	fcmp	s0, s1
 12768e8: 540003ab     	b.lt	0x127695c <__start_il2cpp+0xcf198>
 12768ec: f9400300     	ldr	x0, [x24]
 12768f0: b4006720     	cbz	x0, 0x12775d4 <__start_il2cpp+0xcfe10>
 12768f4: d000af29     	adrp	x9, 0x285c000 <_ZTVN10__cxxabiv119__pointer_type_infoE+0x18>
 12768f8: f9400261     	ldr	x1, [x19]
 12768fc: f947a529     	ldr	x9, [x9, #0xf48]
 1276900: b9401c0a     	ldr	w10, [x0, #0x1c]
 1276904: f9400808     	ldr	x8, [x0, #0x10]
 1276908: f9400129     	ldr	x9, [x9]
 127690c: 1100054a     	add	w10, w10, #0x1
 1276910: b9001c0a     	str	w10, [x0, #0x1c]
 1276914: b4006608     	cbz	x8, 0x12775d4 <__start_il2cpp+0xcfe10>
 1276918: b980180a     	ldrsw	x10, [x0, #0x18]
 127691c: b940190b     	ldr	w11, [x8, #0x18]
 1276920: 6b0b015f     	cmp	w10, w11
 1276924: 54000102     	b.hs	0x1276944 <__start_il2cpp+0xcf180>
 1276928: 11000549     	add	w9, w10, #0x1
 127692c: 8b0a0d08     	add	x8, x8, x10, lsl #3
 1276930: 52a8590a     	mov	w10, #0x42c80000        // =1120403456
 1276934: b9001809     	str	w9, [x0, #0x18]
 1276938: f9001101     	str	x1, [x8, #0x20]
 127693c: 1e270140     	fmov	s0, w10
 1276940: 14000007     	b	0x127695c <__start_il2cpp+0xcf198>
 1276944: f9401128     	ldr	x8, [x9, #0x20]
 1276948: f9406108     	ldr	x8, [x8, #0xc0]
 127694c: f9403902     	ldr	x2, [x8, #0x70]
 1276950: 941a0eb1     	bl	0x18fa414 <__start_il2cpp+0x752c50>
 1276954: 52a85908     	mov	w8, #0x42c80000         // =1120403456
 1276958: 1e270100     	fmov	s0, w8
 127695c: f94002e0     	ldr	x0, [x23]
 1276960: b40063a0     	cbz	x0, 0x12775d4 <__start_il2cpp+0xcfe10>
 1276964: f9400262     	ldr	x2, [x19]
 1276968: 2a1403e1     	mov	w1, w20
 127696c: aa1f03e3     	mov	x3, xzr
 1276970: 94005979     	bl	0x128cf54 <__start_il2cpp+0xe5790>
 1276974: f94002e0     	ldr	x0, [x23]
 1276978: b40062e0     	cbz	x0, 0x12775d4 <__start_il2cpp+0xcfe10>
 127697c: 9000af73     	adrp	x19, 0x2862000
 1276980: f9443673     	ldr	x19, [x19, #0x868]
 1276984: 2a1403e1     	mov	w1, w20
 1276988: aa1f03e3     	mov	x3, xzr
 127698c: f9400262     	ldr	x2, [x19]
 1276990: 94005969     	bl	0x128cf34 <__start_il2cpp+0xe5770>
 1276994: 52a85908     	mov	w8, #0x42c80000         // =1120403456
 1276998: 1e270101     	fmov	s1, w8
 127699c: 1e212000     	fcmp	s0, s1
 12769a0: 54000565     	b.pl	0x1276a4c <__start_il2cpp+0xcf288>
 12769a4: b0ffa108     	adrp	x8, 0x697000
 12769a8: bd46c100     	ldr	s0, [x8, #0x6c0]
 12769ac: 52a85908     	mov	w8, #0x42c80000         // =1120403456
 12769b0: 1e270101     	fmov	s1, w8
 12769b4: 1e201900     	fdiv	s0, s8, s0
 12769b8: 1e210800     	fmul	s0, s0, s1
 12769bc: 1e212000     	fcmp	s0, s1
 12769c0: 540003ab     	b.lt	0x1276a34 <__start_il2cpp+0xcf270>
 12769c4: f9400300     	ldr	x0, [x24]
 12769c8: b4006060     	cbz	x0, 0x12775d4 <__start_il2cpp+0xcfe10>
 12769cc: d000af29     	adrp	x9, 0x285c000 <_ZTVN10__cxxabiv119__pointer_type_infoE+0x18>
 12769d0: f9400261     	ldr	x1, [x19]
 12769d4: f947a529     	ldr	x9, [x9, #0xf48]
 12769d8: b9401c0a     	ldr	w10, [x0, #0x1c]
 12769dc: f9400808     	ldr	x8, [x0, #0x10]
 12769e0: f9400129     	ldr	x9, [x9]
 12769e4: 1100054a     	add	w10, w10, #0x1
 12769e8: b9001c0a     	str	w10, [x0, #0x1c]
 12769ec: b4005f48     	cbz	x8, 0x12775d4 <__start_il2cpp+0xcfe10>
 12769f0: b980180a     	ldrsw	x10, [x0, #0x18]
 12769f4: b940190b     	ldr	w11, [x8, #0x18]
 12769f8: 6b0b015f     	cmp	w10, w11
 12769fc: 54000102     	b.hs	0x1276a1c <__start_il2cpp+0xcf258>
 1276a00: 11000549     	add	w9, w10, #0x1
 1276a04: 8b0a0d08     	add	x8, x8, x10, lsl #3
 1276a08: 52a8590a     	mov	w10, #0x42c80000        // =1120403456
 1276a0c: b9001809     	str	w9, [x0, #0x18]
 1276a10: f9001101     	str	x1, [x8, #0x20]
 1276a14: 1e270140     	fmov	s0, w10
 1276a18: 14000007     	b	0x1276a34 <__start_il2cpp+0xcf270>
 1276a1c: f9401128     	ldr	x8, [x9, #0x20]
 1276a20: f9406108     	ldr	x8, [x8, #0xc0]
 1276a24: f9403902     	ldr	x2, [x8, #0x70]
 1276a28: 941a0e7b     	bl	0x18fa414 <__start_il2cpp+0x752c50>
 1276a2c: 52a85908     	mov	w8, #0x42c80000         // =1120403456
 1276a30: 1e270100     	fmov	s0, w8
 1276a34: f94002e0     	ldr	x0, [x23]
 1276a38: b4005ce0     	cbz	x0, 0x12775d4 <__start_il2cpp+0xcfe10>
 1276a3c: f9400262     	ldr	x2, [x19]
 1276a40: 2a1403e1     	mov	w1, w20
 1276a44: aa1f03e3     	mov	x3, xzr
 1276a48: 94005943     	bl	0x128cf54 <__start_il2cpp+0xe5790>
 1276a4c: f94002e0     	ldr	x0, [x23]
 1276a50: b4005c20     	cbz	x0, 0x12775d4 <__start_il2cpp+0xcfe10>
 1276a54: 9000af73     	adrp	x19, 0x2862000
 1276a58: f9444673     	ldr	x19, [x19, #0x888]
 1276a5c: 2a1403e1     	mov	w1, w20
 1276a60: aa1f03e3     	mov	x3, xzr
 1276a64: f9400262     	ldr	x2, [x19]
 1276a68: 94005933     	bl	0x128cf34 <__start_il2cpp+0xe5770>
 1276a6c: 52a85908     	mov	w8, #0x42c80000         // =1120403456
 1276a70: 1e270101     	fmov	s1, w8
 1276a74: 1e212000     	fcmp	s0, s1
 1276a78: 54000565     	b.pl	0x1276b24 <__start_il2cpp+0xcf360>
 1276a7c: b0ffa108     	adrp	x8, 0x697000
 1276a80: bd456900     	ldr	s0, [x8, #0x568]
 1276a84: 52a85908     	mov	w8, #0x42c80000         // =1120403456
 1276a88: 1e270101     	fmov	s1, w8
 1276a8c: 1e201900     	fdiv	s0, s8, s0
 1276a90: 1e210800     	fmul	s0, s0, s1
 1276a94: 1e212000     	fcmp	s0, s1
 1276a98: 540003ab     	b.lt	0x1276b0c <__start_il2cpp+0xcf348>
 1276a9c: f9400300     	ldr	x0, [x24]
 1276aa0: b40059a0     	cbz	x0, 0x12775d4 <__start_il2cpp+0xcfe10>
 1276aa4: d000af29     	adrp	x9, 0x285c000 <_ZTVN10__cxxabiv119__pointer_type_infoE+0x18>
 1276aa8: f9400261     	ldr	x1, [x19]
 1276aac: f947a529     	ldr	x9, [x9, #0xf48]
 1276ab0: b9401c0a     	ldr	w10, [x0, #0x1c]
 1276ab4: f9400808     	ldr	x8, [x0, #0x10]
 1276ab8: f9400129     	ldr	x9, [x9]
 1276abc: 1100054a     	add	w10, w10, #0x1
 1276ac0: b9001c0a     	str	w10, [x0, #0x1c]
 1276ac4: b4005888     	cbz	x8, 0x12775d4 <__start_il2cpp+0xcfe10>
 1276ac8: b980180a     	ldrsw	x10, [x0, #0x18]
 1276acc: b940190b     	ldr	w11, [x8, #0x18]
 1276ad0: 6b0b015f     	cmp	w10, w11
 1276ad4: 54000102     	b.hs	0x1276af4 <__start_il2cpp+0xcf330>
 1276ad8: 11000549     	add	w9, w10, #0x1
 1276adc: 8b0a0d08     	add	x8, x8, x10, lsl #3
 1276ae0: 52a8590a     	mov	w10, #0x42c80000        // =1120403456
 1276ae4: b9001809     	str	w9, [x0, #0x18]
 1276ae8: f9001101     	str	x1, [x8, #0x20]
 1276aec: 1e270140     	fmov	s0, w10
 1276af0: 14000007     	b	0x1276b0c <__start_il2cpp+0xcf348>
 1276af4: f9401128     	ldr	x8, [x9, #0x20]
 1276af8: f9406108     	ldr	x8, [x8, #0xc0]
 1276afc: f9403902     	ldr	x2, [x8, #0x70]
 1276b00: 941a0e45     	bl	0x18fa414 <__start_il2cpp+0x752c50>
 1276b04: 52a85908     	mov	w8, #0x42c80000         // =1120403456
 1276b08: 1e270100     	fmov	s0, w8
 1276b0c: f94002e0     	ldr	x0, [x23]
 1276b10: b4005620     	cbz	x0, 0x12775d4 <__start_il2cpp+0xcfe10>
 1276b14: f9400262     	ldr	x2, [x19]
 1276b18: 2a1403e1     	mov	w1, w20
 1276b1c: aa1f03e3     	mov	x3, xzr
 1276b20: 9400590d     	bl	0x128cf54 <__start_il2cpp+0xe5790>
 1276b24: f94002e0     	ldr	x0, [x23]
 1276b28: b4005560     	cbz	x0, 0x12775d4 <__start_il2cpp+0xcfe10>
 1276b2c: 9000af73     	adrp	x19, 0x2862000
 1276b30: f943ca73     	ldr	x19, [x19, #0x790]
 1276b34: 2a1403e1     	mov	w1, w20
 1276b38: aa1f03e3     	mov	x3, xzr
 1276b3c: f9400262     	ldr	x2, [x19]
 1276b40: 940058fd     	bl	0x128cf34 <__start_il2cpp+0xe5770>
 1276b44: 52a85908     	mov	w8, #0x42c80000         // =1120403456
 1276b48: 1e270101     	fmov	s1, w8
 1276b4c: 1e212000     	fcmp	s0, s1
 1276b50: 54000585     	b.pl	0x1276c00 <__start_il2cpp+0xcf43c>
 1276b54: bd417780     	ldr	s0, [x28, #0x174]
 1276b58: 1e229001     	fmov	s1, #5.00000000
 1276b5c: 52a85908     	mov	w8, #0x42c80000         // =1120403456
 1276b60: 5e21d800     	scvtf	s0, s0
 1276b64: 1e211800     	fdiv	s0, s0, s1
 1276b68: 1e270101     	fmov	s1, w8
 1276b6c: 1e210800     	fmul	s0, s0, s1
 1276b70: 1e212000     	fcmp	s0, s1
 1276b74: 540003ab     	b.lt	0x1276be8 <__start_il2cpp+0xcf424>
 1276b78: f9400300     	ldr	x0, [x24]
 1276b7c: b40052c0     	cbz	x0, 0x12775d4 <__start_il2cpp+0xcfe10>
 1276b80: d000af29     	adrp	x9, 0x285c000 <_ZTVN10__cxxabiv119__pointer_type_infoE+0x18>
 1276b84: f9400261     	ldr	x1, [x19]
 1276b88: f947a529     	ldr	x9, [x9, #0xf48]
 1276b8c: b9401c0a     	ldr	w10, [x0, #0x1c]
 1276b90: f9400808     	ldr	x8, [x0, #0x10]
 1276b94: f9400129     	ldr	x9, [x9]
 1276b98: 1100054a     	add	w10, w10, #0x1
 1276b9c: b9001c0a     	str	w10, [x0, #0x1c]
 1276ba0: b40051a8     	cbz	x8, 0x12775d4 <__start_il2cpp+0xcfe10>
 1276ba4: b980180a     	ldrsw	x10, [x0, #0x18]
 1276ba8: b940190b     	ldr	w11, [x8, #0x18]
 1276bac: 6b0b015f     	cmp	w10, w11
 1276bb0: 54000102     	b.hs	0x1276bd0 <__start_il2cpp+0xcf40c>
 1276bb4: 11000549     	add	w9, w10, #0x1
 1276bb8: 8b0a0d08     	add	x8, x8, x10, lsl #3
 1276bbc: 52a8590a     	mov	w10, #0x42c80000        // =1120403456
 1276bc0: b9001809     	str	w9, [x0, #0x18]
 1276bc4: f9001101     	str	x1, [x8, #0x20]
 1276bc8: 1e270140     	fmov	s0, w10
 1276bcc: 14000007     	b	0x1276be8 <__start_il2cpp+0xcf424>
 1276bd0: f9401128     	ldr	x8, [x9, #0x20]
 1276bd4: f9406108     	ldr	x8, [x8, #0xc0]
 1276bd8: f9403902     	ldr	x2, [x8, #0x70]
 1276bdc: 941a0e0e     	bl	0x18fa414 <__start_il2cpp+0x752c50>
 1276be0: 52a85908     	mov	w8, #0x42c80000         // =1120403456
 1276be4: 1e270100     	fmov	s0, w8
 1276be8: f94002e0     	ldr	x0, [x23]
 1276bec: b4004f40     	cbz	x0, 0x12775d4 <__start_il2cpp+0xcfe10>
 1276bf0: f9400262     	ldr	x2, [x19]
 1276bf4: 2a1403e1     	mov	w1, w20
 1276bf8: aa1f03e3     	mov	x3, xzr
 1276bfc: 940058d6     	bl	0x128cf54 <__start_il2cpp+0xe5790>
 1276c00: f94002e0     	ldr	x0, [x23]
 1276c04: b4004e80     	cbz	x0, 0x12775d4 <__start_il2cpp+0xcfe10>
 1276c08: 9000af73     	adrp	x19, 0x2862000
 1276c0c: f9449e73     	ldr	x19, [x19, #0x938]
 1276c10: 2a1403e1     	mov	w1, w20
 1276c14: aa1f03e3     	mov	x3, xzr
 1276c18: f9400262     	ldr	x2, [x19]
 1276c1c: 940058c6     	bl	0x128cf34 <__start_il2cpp+0xe5770>
 1276c20: 52a85908     	mov	w8, #0x42c80000         // =1120403456
 1276c24: 1e270101     	fmov	s1, w8
 1276c28: 1e212000     	fcmp	s0, s1
 1276c2c: 54000585     	b.pl	0x1276cdc <__start_il2cpp+0xcf518>
 1276c30: bd417780     	ldr	s0, [x28, #0x174]
 1276c34: 1e249001     	fmov	s1, #10.00000000
 1276c38: 52a85908     	mov	w8, #0x42c80000         // =1120403456
 1276c3c: 5e21d800     	scvtf	s0, s0
 1276c40: 1e211800     	fdiv	s0, s0, s1
 1276c44: 1e270101     	fmov	s1, w8
 1276c48: 1e210800     	fmul	s0, s0, s1
 1276c4c: 1e212000     	fcmp	s0, s1
 1276c50: 540003ab     	b.lt	0x1276cc4 <__start_il2cpp+0xcf500>
 1276c54: f9400300     	ldr	x0, [x24]
 1276c58: b4004be0     	cbz	x0, 0x12775d4 <__start_il2cpp+0xcfe10>
 1276c5c: d000af29     	adrp	x9, 0x285c000 <_ZTVN10__cxxabiv119__pointer_type_infoE+0x18>
 1276c60: f9400261     	ldr	x1, [x19]
 1276c64: f947a529     	ldr	x9, [x9, #0xf48]
 1276c68: b9401c0a     	ldr	w10, [x0, #0x1c]
 1276c6c: f9400808     	ldr	x8, [x0, #0x10]
 1276c70: f9400129     	ldr	x9, [x9]
 1276c74: 1100054a     	add	w10, w10, #0x1
 1276c78: b9001c0a     	str	w10, [x0, #0x1c]
 1276c7c: b4004ac8     	cbz	x8, 0x12775d4 <__start_il2cpp+0xcfe10>
 1276c80: b980180a     	ldrsw	x10, [x0, #0x18]
 1276c84: b940190b     	ldr	w11, [x8, #0x18]
 1276c88: 6b0b015f     	cmp	w10, w11
 1276c8c: 54000102     	b.hs	0x1276cac <__start_il2cpp+0xcf4e8>
 1276c90: 11000549     	add	w9, w10, #0x1
 1276c94: 8b0a0d08     	add	x8, x8, x10, lsl #3
 1276c98: 52a8590a     	mov	w10, #0x42c80000        // =1120403456
 1276c9c: b9001809     	str	w9, [x0, #0x18]
 1276ca0: f9001101     	str	x1, [x8, #0x20]
 1276ca4: 1e270140     	fmov	s0, w10
 1276ca8: 14000007     	b	0x1276cc4 <__start_il2cpp+0xcf500>
 1276cac: f9401128     	ldr	x8, [x9, #0x20]
 1276cb0: f9406108     	ldr	x8, [x8, #0xc0]
 1276cb4: f9403902     	ldr	x2, [x8, #0x70]
 1276cb8: 941a0dd7     	bl	0x18fa414 <__start_il2cpp+0x752c50>
 1276cbc: 52a85908     	mov	w8, #0x42c80000         // =1120403456
 1276cc0: 1e270100     	fmov	s0, w8
 1276cc4: f94002e0     	ldr	x0, [x23]
 1276cc8: b4004860     	cbz	x0, 0x12775d4 <__start_il2cpp+0xcfe10>
 1276ccc: f9400262     	ldr	x2, [x19]
 1276cd0: 2a1403e1     	mov	w1, w20
 1276cd4: aa1f03e3     	mov	x3, xzr
 1276cd8: 9400589f     	bl	0x128cf54 <__start_il2cpp+0xe5790>
 1276cdc: f94002e0     	ldr	x0, [x23]
 1276ce0: b40047a0     	cbz	x0, 0x12775d4 <__start_il2cpp+0xcfe10>
 1276ce4: 9000af73     	adrp	x19, 0x2862000
 1276ce8: f9448a73     	ldr	x19, [x19, #0x910]
 1276cec: 2a1403e1     	mov	w1, w20
 1276cf0: aa1f03e3     	mov	x3, xzr
 1276cf4: f9400262     	ldr	x2, [x19]
 1276cf8: 9400588f     	bl	0x128cf34 <__start_il2cpp+0xe5770>
 1276cfc: 52a85908     	mov	w8, #0x42c80000         // =1120403456
 1276d00: 1e270101     	fmov	s1, w8
 1276d04: 1e212000     	fcmp	s0, s1
 1276d08: 54000585     	b.pl	0x1276db8 <__start_il2cpp+0xcf5f4>
 1276d0c: bd417780     	ldr	s0, [x28, #0x174]
 1276d10: 1e269001     	fmov	s1, #20.00000000
 1276d14: 52a85908     	mov	w8, #0x42c80000         // =1120403456
 1276d18: 5e21d800     	scvtf	s0, s0
 1276d1c: 1e211800     	fdiv	s0, s0, s1
 1276d20: 1e270101     	fmov	s1, w8
 1276d24: 1e210800     	fmul	s0, s0, s1
 1276d28: 1e212000     	fcmp	s0, s1
 1276d2c: 540003ab     	b.lt	0x1276da0 <__start_il2cpp+0xcf5dc>
 1276d30: f9400300     	ldr	x0, [x24]
 1276d34: b4004500     	cbz	x0, 0x12775d4 <__start_il2cpp+0xcfe10>
 1276d38: d000af29     	adrp	x9, 0x285c000 <_ZTVN10__cxxabiv119__pointer_type_infoE+0x18>
 1276d3c: f9400261     	ldr	x1, [x19]
 1276d40: f947a529     	ldr	x9, [x9, #0xf48]
 1276d44: b9401c0a     	ldr	w10, [x0, #0x1c]
 1276d48: f9400808     	ldr	x8, [x0, #0x10]
 1276d4c: f9400129     	ldr	x9, [x9]
 1276d50: 1100054a     	add	w10, w10, #0x1
 1276d54: b9001c0a     	str	w10, [x0, #0x1c]
 1276d58: b40043e8     	cbz	x8, 0x12775d4 <__start_il2cpp+0xcfe10>
 1276d5c: b980180a     	ldrsw	x10, [x0, #0x18]
 1276d60: b940190b     	ldr	w11, [x8, #0x18]
 1276d64: 6b0b015f     	cmp	w10, w11
 1276d68: 54000102     	b.hs	0x1276d88 <__start_il2cpp+0xcf5c4>
 1276d6c: 11000549     	add	w9, w10, #0x1
 1276d70: 8b0a0d08     	add	x8, x8, x10, lsl #3
 1276d74: 52a8590a     	mov	w10, #0x42c80000        // =1120403456
 1276d78: b9001809     	str	w9, [x0, #0x18]
 1276d7c: f9001101     	str	x1, [x8, #0x20]
 1276d80: 1e270140     	fmov	s0, w10
 1276d84: 14000007     	b	0x1276da0 <__start_il2cpp+0xcf5dc>
 1276d88: f9401128     	ldr	x8, [x9, #0x20]
 1276d8c: f9406108     	ldr	x8, [x8, #0xc0]
 1276d90: f9403902     	ldr	x2, [x8, #0x70]
 1276d94: 941a0da0     	bl	0x18fa414 <__start_il2cpp+0x752c50>
 1276d98: 52a85908     	mov	w8, #0x42c80000         // =1120403456
 1276d9c: 1e270100     	fmov	s0, w8
 1276da0: f94002e0     	ldr	x0, [x23]
 1276da4: b4004180     	cbz	x0, 0x12775d4 <__start_il2cpp+0xcfe10>
 1276da8: f9400262     	ldr	x2, [x19]
 1276dac: 2a1403e1     	mov	w1, w20
 1276db0: aa1f03e3     	mov	x3, xzr
 1276db4: 94005868     	bl	0x128cf54 <__start_il2cpp+0xe5790>
 1276db8: f94002e0     	ldr	x0, [x23]
 1276dbc: b40040c0     	cbz	x0, 0x12775d4 <__start_il2cpp+0xcfe10>
 1276dc0: 9000af73     	adrp	x19, 0x2862000
 1276dc4: f944a673     	ldr	x19, [x19, #0x948]
 1276dc8: 2a1403e1     	mov	w1, w20
 1276dcc: aa1f03e3     	mov	x3, xzr
 1276dd0: f9400262     	ldr	x2, [x19]
 1276dd4: 94005858     	bl	0x128cf34 <__start_il2cpp+0xe5770>
 1276dd8: 52a85908     	mov	w8, #0x42c80000         // =1120403456
 1276ddc: 1e270101     	fmov	s1, w8
 1276de0: 1e212000     	fcmp	s0, s1
 1276de4: 54000585     	b.pl	0x1276e94 <__start_il2cpp+0xcf6d0>
 1276de8: bd418380     	ldr	s0, [x28, #0x180]
 1276dec: 1e229001     	fmov	s1, #5.00000000
 1276df0: 52a85908     	mov	w8, #0x42c80000         // =1120403456
 1276df4: 5e21d800     	scvtf	s0, s0
 1276df8: 1e211800     	fdiv	s0, s0, s1
 1276dfc: 1e270101     	fmov	s1, w8
 1276e00: 1e210800     	fmul	s0, s0, s1
 1276e04: 1e212000     	fcmp	s0, s1
 1276e08: 540003ab     	b.lt	0x1276e7c <__start_il2cpp+0xcf6b8>
 1276e0c: f9400300     	ldr	x0, [x24]
 1276e10: b4003e20     	cbz	x0, 0x12775d4 <__start_il2cpp+0xcfe10>
 1276e14: d000af29     	adrp	x9, 0x285c000 <_ZTVN10__cxxabiv119__pointer_type_infoE+0x18>
 1276e18: f9400261     	ldr	x1, [x19]
 1276e1c: f947a529     	ldr	x9, [x9, #0xf48]
 1276e20: b9401c0a     	ldr	w10, [x0, #0x1c]
 1276e24: f9400808     	ldr	x8, [x0, #0x10]
 1276e28: f9400129     	ldr	x9, [x9]
 1276e2c: 1100054a     	add	w10, w10, #0x1
 1276e30: b9001c0a     	str	w10, [x0, #0x1c]
 1276e34: b4003d08     	cbz	x8, 0x12775d4 <__start_il2cpp+0xcfe10>
 1276e38: b980180a     	ldrsw	x10, [x0, #0x18]
 1276e3c: b940190b     	ldr	w11, [x8, #0x18]
 1276e40: 6b0b015f     	cmp	w10, w11
 1276e44: 54000102     	b.hs	0x1276e64 <__start_il2cpp+0xcf6a0>
 1276e48: 11000549     	add	w9, w10, #0x1
 1276e4c: 8b0a0d08     	add	x8, x8, x10, lsl #3
 1276e50: 52a8590a     	mov	w10, #0x42c80000        // =1120403456
 1276e54: b9001809     	str	w9, [x0, #0x18]
 1276e58: f9001101     	str	x1, [x8, #0x20]
 1276e5c: 1e270140     	fmov	s0, w10
 1276e60: 14000007     	b	0x1276e7c <__start_il2cpp+0xcf6b8>
 1276e64: f9401128     	ldr	x8, [x9, #0x20]
 1276e68: f9406108     	ldr	x8, [x8, #0xc0]
 1276e6c: f9403902     	ldr	x2, [x8, #0x70]
 1276e70: 941a0d69     	bl	0x18fa414 <__start_il2cpp+0x752c50>
 1276e74: 52a85908     	mov	w8, #0x42c80000         // =1120403456
 1276e78: 1e270100     	fmov	s0, w8
 1276e7c: f94002e0     	ldr	x0, [x23]
 1276e80: b4003aa0     	cbz	x0, 0x12775d4 <__start_il2cpp+0xcfe10>
 1276e84: f9400262     	ldr	x2, [x19]
 1276e88: 2a1403e1     	mov	w1, w20
 1276e8c: aa1f03e3     	mov	x3, xzr
 1276e90: 94005831     	bl	0x128cf54 <__start_il2cpp+0xe5790>
 1276e94: f94002e0     	ldr	x0, [x23]
 1276e98: b40039e0     	cbz	x0, 0x12775d4 <__start_il2cpp+0xcfe10>
 1276e9c: 9000af73     	adrp	x19, 0x2862000
 1276ea0: f9441673     	ldr	x19, [x19, #0x828]
 1276ea4: 2a1403e1     	mov	w1, w20
 1276ea8: aa1f03e3     	mov	x3, xzr
 1276eac: f9400262     	ldr	x2, [x19]
 1276eb0: 94005821     	bl	0x128cf34 <__start_il2cpp+0xe5770>
 1276eb4: 52a85908     	mov	w8, #0x42c80000         // =1120403456
 1276eb8: 1e270101     	fmov	s1, w8
 1276ebc: 1e212000     	fcmp	s0, s1
 1276ec0: 54000585     	b.pl	0x1276f70 <__start_il2cpp+0xcf7ac>
 1276ec4: bd418380     	ldr	s0, [x28, #0x180]
 1276ec8: 1e249001     	fmov	s1, #10.00000000
 1276ecc: 52a85908     	mov	w8, #0x42c80000         // =1120403456
 1276ed0: 5e21d800     	scvtf	s0, s0
 1276ed4: 1e211800     	fdiv	s0, s0, s1
 1276ed8: 1e270101     	fmov	s1, w8
 1276edc: 1e210800     	fmul	s0, s0, s1
 1276ee0: 1e212000     	fcmp	s0, s1
 1276ee4: 540003ab     	b.lt	0x1276f58 <__start_il2cpp+0xcf794>
 1276ee8: f9400300     	ldr	x0, [x24]
 1276eec: b4003740     	cbz	x0, 0x12775d4 <__start_il2cpp+0xcfe10>
 1276ef0: d000af29     	adrp	x9, 0x285c000 <_ZTVN10__cxxabiv119__pointer_type_infoE+0x18>
 1276ef4: f9400261     	ldr	x1, [x19]
 1276ef8: f947a529     	ldr	x9, [x9, #0xf48]
 1276efc: b9401c0a     	ldr	w10, [x0, #0x1c]
 1276f00: f9400808     	ldr	x8, [x0, #0x10]
 1276f04: f9400129     	ldr	x9, [x9]
 1276f08: 1100054a     	add	w10, w10, #0x1
 1276f0c: b9001c0a     	str	w10, [x0, #0x1c]
 1276f10: b4003628     	cbz	x8, 0x12775d4 <__start_il2cpp+0xcfe10>
 1276f14: b980180a     	ldrsw	x10, [x0, #0x18]
 1276f18: b940190b     	ldr	w11, [x8, #0x18]
 1276f1c: 6b0b015f     	cmp	w10, w11
 1276f20: 54000102     	b.hs	0x1276f40 <__start_il2cpp+0xcf77c>
 1276f24: 11000549     	add	w9, w10, #0x1
 1276f28: 8b0a0d08     	add	x8, x8, x10, lsl #3
 1276f2c: 52a8590a     	mov	w10, #0x42c80000        // =1120403456
 1276f30: b9001809     	str	w9, [x0, #0x18]
 1276f34: f9001101     	str	x1, [x8, #0x20]
 1276f38: 1e270140     	fmov	s0, w10
 1276f3c: 14000007     	b	0x1276f58 <__start_il2cpp+0xcf794>
 1276f40: f9401128     	ldr	x8, [x9, #0x20]
 1276f44: f9406108     	ldr	x8, [x8, #0xc0]
 1276f48: f9403902     	ldr	x2, [x8, #0x70]
 1276f4c: 941a0d32     	bl	0x18fa414 <__start_il2cpp+0x752c50>
 1276f50: 52a85908     	mov	w8, #0x42c80000         // =1120403456
 1276f54: 1e270100     	fmov	s0, w8
 1276f58: f94002e0     	ldr	x0, [x23]
 1276f5c: b40033c0     	cbz	x0, 0x12775d4 <__start_il2cpp+0xcfe10>
 1276f60: f9400262     	ldr	x2, [x19]
 1276f64: 2a1403e1     	mov	w1, w20
 1276f68: aa1f03e3     	mov	x3, xzr
 1276f6c: 940057fa     	bl	0x128cf54 <__start_il2cpp+0xe5790>
 1276f70: f94002e0     	ldr	x0, [x23]
 1276f74: b4003300     	cbz	x0, 0x12775d4 <__start_il2cpp+0xcfe10>
 1276f78: 9000af73     	adrp	x19, 0x2862000
 1276f7c: f9448273     	ldr	x19, [x19, #0x900]
 1276f80: 2a1403e1     	mov	w1, w20
 1276f84: aa1f03e3     	mov	x3, xzr
 1276f88: f9400262     	ldr	x2, [x19]
 1276f8c: 940057ea     	bl	0x128cf34 <__start_il2cpp+0xe5770>
 1276f90: 52a85908     	mov	w8, #0x42c80000         // =1120403456
 1276f94: 1e270101     	fmov	s1, w8
 1276f98: 1e212000     	fcmp	s0, s1
 1276f9c: 54000585     	b.pl	0x127704c <__start_il2cpp+0xcf888>
 1276fa0: bd418380     	ldr	s0, [x28, #0x180]
 1276fa4: 1e269001     	fmov	s1, #20.00000000
 1276fa8: 52a85908     	mov	w8, #0x42c80000         // =1120403456
 1276fac: 5e21d800     	scvtf	s0, s0
 1276fb0: 1e211800     	fdiv	s0, s0, s1
 1276fb4: 1e270101     	fmov	s1, w8
 1276fb8: 1e210800     	fmul	s0, s0, s1
 1276fbc: 1e212000     	fcmp	s0, s1
 1276fc0: 540003ab     	b.lt	0x1277034 <__start_il2cpp+0xcf870>
 1276fc4: f9400300     	ldr	x0, [x24]
 1276fc8: b4003060     	cbz	x0, 0x12775d4 <__start_il2cpp+0xcfe10>
 1276fcc: d000af29     	adrp	x9, 0x285c000 <_ZTVN10__cxxabiv119__pointer_type_infoE+0x18>
 1276fd0: f9400261     	ldr	x1, [x19]
 1276fd4: f947a529     	ldr	x9, [x9, #0xf48]
 1276fd8: b9401c0a     	ldr	w10, [x0, #0x1c]
 1276fdc: f9400808     	ldr	x8, [x0, #0x10]
 1276fe0: f9400129     	ldr	x9, [x9]
 1276fe4: 1100054a     	add	w10, w10, #0x1
 1276fe8: b9001c0a     	str	w10, [x0, #0x1c]
 1276fec: b4002f48     	cbz	x8, 0x12775d4 <__start_il2cpp+0xcfe10>
 1276ff0: b980180a     	ldrsw	x10, [x0, #0x18]
 1276ff4: b940190b     	ldr	w11, [x8, #0x18]
 1276ff8: 6b0b015f     	cmp	w10, w11
 1276ffc: 54000102     	b.hs	0x127701c <__start_il2cpp+0xcf858>
 1277000: 11000549     	add	w9, w10, #0x1
 1277004: 8b0a0d08     	add	x8, x8, x10, lsl #3
 1277008: 52a8590a     	mov	w10, #0x42c80000        // =1120403456
 127700c: b9001809     	str	w9, [x0, #0x18]
 1277010: f9001101     	str	x1, [x8, #0x20]
 1277014: 1e270140     	fmov	s0, w10
 1277018: 14000007     	b	0x1277034 <__start_il2cpp+0xcf870>
 127701c: f9401128     	ldr	x8, [x9, #0x20]
 1277020: f9406108     	ldr	x8, [x8, #0xc0]
 1277024: f9403902     	ldr	x2, [x8, #0x70]
 1277028: 941a0cfb     	bl	0x18fa414 <__start_il2cpp+0x752c50>
 127702c: 52a85908     	mov	w8, #0x42c80000         // =1120403456
 1277030: 1e270100     	fmov	s0, w8
 1277034: f94002e0     	ldr	x0, [x23]
 1277038: b4002ce0     	cbz	x0, 0x12775d4 <__start_il2cpp+0xcfe10>
 127703c: f9400262     	ldr	x2, [x19]
 1277040: 2a1403e1     	mov	w1, w20
 1277044: aa1f03e3     	mov	x3, xzr
 1277048: 940057c3     	bl	0x128cf54 <__start_il2cpp+0xe5790>
 127704c: f94002e0     	ldr	x0, [x23]
 1277050: b4002c20     	cbz	x0, 0x12775d4 <__start_il2cpp+0xcfe10>
 1277054: f000af53     	adrp	x19, 0x2862000
 1277058: f943e273     	ldr	x19, [x19, #0x7c0]
 127705c: 2a1403e1     	mov	w1, w20
 1277060: aa1f03e3     	mov	x3, xzr
 1277064: f9400262     	ldr	x2, [x19]
 1277068: 940057b3     	bl	0x128cf34 <__start_il2cpp+0xe5770>
 127706c: 52a85908     	mov	w8, #0x42c80000         // =1120403456
 1277070: 1e270101     	fmov	s1, w8
 1277074: 1e212000     	fcmp	s0, s1
 1277078: 54000585     	b.pl	0x1277128 <__start_il2cpp+0xcf964>
 127707c: bd417f80     	ldr	s0, [x28, #0x17c]
 1277080: 1e229001     	fmov	s1, #5.00000000
 1277084: 52a85908     	mov	w8, #0x42c80000         // =1120403456
 1277088: 5e21d800     	scvtf	s0, s0
 127708c: 1e211800     	fdiv	s0, s0, s1
 1277090: 1e270101     	fmov	s1, w8
 1277094: 1e210800     	fmul	s0, s0, s1
 1277098: 1e212000     	fcmp	s0, s1
 127709c: 540003ab     	b.lt	0x1277110 <__start_il2cpp+0xcf94c>
 12770a0: f9400300     	ldr	x0, [x24]
 12770a4: b4002980     	cbz	x0, 0x12775d4 <__start_il2cpp+0xcfe10>
 12770a8: b000af29     	adrp	x9, 0x285c000 <_ZTVN10__cxxabiv119__pointer_type_infoE+0x18>
 12770ac: f9400261     	ldr	x1, [x19]
 12770b0: f947a529     	ldr	x9, [x9, #0xf48]
 12770b4: b9401c0a     	ldr	w10, [x0, #0x1c]
 12770b8: f9400808     	ldr	x8, [x0, #0x10]
 12770bc: f9400129     	ldr	x9, [x9]
 12770c0: 1100054a     	add	w10, w10, #0x1
 12770c4: b9001c0a     	str	w10, [x0, #0x1c]
 12770c8: b4002868     	cbz	x8, 0x12775d4 <__start_il2cpp+0xcfe10>
 12770cc: b980180a     	ldrsw	x10, [x0, #0x18]
 12770d0: b940190b     	ldr	w11, [x8, #0x18]
 12770d4: 6b0b015f     	cmp	w10, w11
 12770d8: 54000102     	b.hs	0x12770f8 <__start_il2cpp+0xcf934>
 12770dc: 11000549     	add	w9, w10, #0x1
 12770e0: 8b0a0d08     	add	x8, x8, x10, lsl #3
 12770e4: 52a8590a     	mov	w10, #0x42c80000        // =1120403456
 12770e8: b9001809     	str	w9, [x0, #0x18]
 12770ec: f9001101     	str	x1, [x8, #0x20]
 12770f0: 1e270140     	fmov	s0, w10
 12770f4: 14000007     	b	0x1277110 <__start_il2cpp+0xcf94c>
 12770f8: f9401128     	ldr	x8, [x9, #0x20]
 12770fc: f9406108     	ldr	x8, [x8, #0xc0]
 1277100: f9403902     	ldr	x2, [x8, #0x70]
 1277104: 941a0cc4     	bl	0x18fa414 <__start_il2cpp+0x752c50>
 1277108: 52a85908     	mov	w8, #0x42c80000         // =1120403456
 127710c: 1e270100     	fmov	s0, w8
 1277110: f94002e0     	ldr	x0, [x23]
 1277114: b4002600     	cbz	x0, 0x12775d4 <__start_il2cpp+0xcfe10>
 1277118: f9400262     	ldr	x2, [x19]
 127711c: 2a1403e1     	mov	w1, w20
 1277120: aa1f03e3     	mov	x3, xzr
 1277124: 9400578c     	bl	0x128cf54 <__start_il2cpp+0xe5790>
 1277128: f94002e0     	ldr	x0, [x23]
 127712c: b4002540     	cbz	x0, 0x12775d4 <__start_il2cpp+0xcfe10>
 1277130: f000af53     	adrp	x19, 0x2862000
 1277134: f943de73     	ldr	x19, [x19, #0x7b8]
 1277138: 2a1403e1     	mov	w1, w20
 127713c: aa1f03e3     	mov	x3, xzr
 1277140: f9400262     	ldr	x2, [x19]
 1277144: 9400577c     	bl	0x128cf34 <__start_il2cpp+0xe5770>
 1277148: 52a85908     	mov	w8, #0x42c80000         // =1120403456
 127714c: 1e270101     	fmov	s1, w8
 1277150: 1e212000     	fcmp	s0, s1
 1277154: 54000585     	b.pl	0x1277204 <__start_il2cpp+0xcfa40>
 1277158: bd417f80     	ldr	s0, [x28, #0x17c]
 127715c: 1e249001     	fmov	s1, #10.00000000
 1277160: 52a85908     	mov	w8, #0x42c80000         // =1120403456
 1277164: 5e21d800     	scvtf	s0, s0
 1277168: 1e211800     	fdiv	s0, s0, s1
 127716c: 1e270101     	fmov	s1, w8
 1277170: 1e210800     	fmul	s0, s0, s1
 1277174: 1e212000     	fcmp	s0, s1
 1277178: 540003ab     	b.lt	0x12771ec <__start_il2cpp+0xcfa28>
 127717c: f9400300     	ldr	x0, [x24]
 1277180: b40022a0     	cbz	x0, 0x12775d4 <__start_il2cpp+0xcfe10>
 1277184: b000af29     	adrp	x9, 0x285c000 <_ZTVN10__cxxabiv119__pointer_type_infoE+0x18>
 1277188: f9400261     	ldr	x1, [x19]
 127718c: f947a529     	ldr	x9, [x9, #0xf48]
 1277190: b9401c0a     	ldr	w10, [x0, #0x1c]
 1277194: f9400808     	ldr	x8, [x0, #0x10]
 1277198: f9400129     	ldr	x9, [x9]
 127719c: 1100054a     	add	w10, w10, #0x1
 12771a0: b9001c0a     	str	w10, [x0, #0x1c]
 12771a4: b4002188     	cbz	x8, 0x12775d4 <__start_il2cpp+0xcfe10>
 12771a8: b980180a     	ldrsw	x10, [x0, #0x18]
 12771ac: b940190b     	ldr	w11, [x8, #0x18]
 12771b0: 6b0b015f     	cmp	w10, w11
 12771b4: 54000102     	b.hs	0x12771d4 <__start_il2cpp+0xcfa10>
 12771b8: 11000549     	add	w9, w10, #0x1
 12771bc: 8b0a0d08     	add	x8, x8, x10, lsl #3
 12771c0: 52a8590a     	mov	w10, #0x42c80000        // =1120403456
 12771c4: b9001809     	str	w9, [x0, #0x18]
 12771c8: f9001101     	str	x1, [x8, #0x20]
 12771cc: 1e270140     	fmov	s0, w10
 12771d0: 14000007     	b	0x12771ec <__start_il2cpp+0xcfa28>
 12771d4: f9401128     	ldr	x8, [x9, #0x20]
 12771d8: f9406108     	ldr	x8, [x8, #0xc0]
 12771dc: f9403902     	ldr	x2, [x8, #0x70]
 12771e0: 941a0c8d     	bl	0x18fa414 <__start_il2cpp+0x752c50>
 12771e4: 52a85908     	mov	w8, #0x42c80000         // =1120403456
 12771e8: 1e270100     	fmov	s0, w8
 12771ec: f94002e0     	ldr	x0, [x23]
 12771f0: b4001f20     	cbz	x0, 0x12775d4 <__start_il2cpp+0xcfe10>
 12771f4: f9400262     	ldr	x2, [x19]
 12771f8: 2a1403e1     	mov	w1, w20
 12771fc: aa1f03e3     	mov	x3, xzr
 1277200: 94005755     	bl	0x128cf54 <__start_il2cpp+0xe5790>
 1277204: f94002e0     	ldr	x0, [x23]
 1277208: b4001e60     	cbz	x0, 0x12775d4 <__start_il2cpp+0xcfe10>
 127720c: f000af53     	adrp	x19, 0x2862000
 1277210: f943ea73     	ldr	x19, [x19, #0x7d0]
 1277214: 2a1403e1     	mov	w1, w20
 1277218: aa1f03e3     	mov	x3, xzr
 127721c: f9400262     	ldr	x2, [x19]
 1277220: 94005745     	bl	0x128cf34 <__start_il2cpp+0xe5770>
 1277224: 52a85908     	mov	w8, #0x42c80000         // =1120403456
 1277228: 1e270101     	fmov	s1, w8
 127722c: 1e212000     	fcmp	s0, s1
 1277230: 54000585     	b.pl	0x12772e0 <__start_il2cpp+0xcfb1c>
 1277234: bd417f80     	ldr	s0, [x28, #0x17c]
 1277238: 1e269001     	fmov	s1, #20.00000000
 127723c: 52a85908     	mov	w8, #0x42c80000         // =1120403456
 1277240: 5e21d800     	scvtf	s0, s0
 1277244: 1e211800     	fdiv	s0, s0, s1
 1277248: 1e270101     	fmov	s1, w8
 127724c: 1e210800     	fmul	s0, s0, s1
 1277250: 1e212000     	fcmp	s0, s1
 1277254: 540003ab     	b.lt	0x12772c8 <__start_il2cpp+0xcfb04>
 1277258: f9400300     	ldr	x0, [x24]
 127725c: b4001bc0     	cbz	x0, 0x12775d4 <__start_il2cpp+0xcfe10>
 1277260: b000af29     	adrp	x9, 0x285c000 <_ZTVN10__cxxabiv119__pointer_type_infoE+0x18>
 1277264: f9400261     	ldr	x1, [x19]
 1277268: f947a529     	ldr	x9, [x9, #0xf48]
 127726c: b9401c0a     	ldr	w10, [x0, #0x1c]
 1277270: f9400808     	ldr	x8, [x0, #0x10]
 1277274: f9400129     	ldr	x9, [x9]
 1277278: 1100054a     	add	w10, w10, #0x1
 127727c: b9001c0a     	str	w10, [x0, #0x1c]
 1277280: b4001aa8     	cbz	x8, 0x12775d4 <__start_il2cpp+0xcfe10>
 1277284: b980180a     	ldrsw	x10, [x0, #0x18]
 1277288: b940190b     	ldr	w11, [x8, #0x18]
 127728c: 6b0b015f     	cmp	w10, w11
 1277290: 54000102     	b.hs	0x12772b0 <__start_il2cpp+0xcfaec>
 1277294: 11000549     	add	w9, w10, #0x1
 1277298: 8b0a0d08     	add	x8, x8, x10, lsl #3
 127729c: 52a8590a     	mov	w10, #0x42c80000        // =1120403456
 12772a0: b9001809     	str	w9, [x0, #0x18]
 12772a4: f9001101     	str	x1, [x8, #0x20]
 12772a8: 1e270140     	fmov	s0, w10
 12772ac: 14000007     	b	0x12772c8 <__start_il2cpp+0xcfb04>
 12772b0: f9401128     	ldr	x8, [x9, #0x20]
 12772b4: f9406108     	ldr	x8, [x8, #0xc0]
 12772b8: f9403902     	ldr	x2, [x8, #0x70]
 12772bc: 941a0c56     	bl	0x18fa414 <__start_il2cpp+0x752c50>
 12772c0: 52a85908     	mov	w8, #0x42c80000         // =1120403456
 12772c4: 1e270100     	fmov	s0, w8
 12772c8: f94002e0     	ldr	x0, [x23]
 12772cc: b4001840     	cbz	x0, 0x12775d4 <__start_il2cpp+0xcfe10>
 12772d0: f9400262     	ldr	x2, [x19]
 12772d4: 2a1403e1     	mov	w1, w20
 12772d8: aa1f03e3     	mov	x3, xzr
 12772dc: 9400571e     	bl	0x128cf54 <__start_il2cpp+0xe5790>
 12772e0: f94002e0     	ldr	x0, [x23]
 12772e4: b4001780     	cbz	x0, 0x12775d4 <__start_il2cpp+0xcfe10>
 12772e8: f000af53     	adrp	x19, 0x2862000
 12772ec: f943da73     	ldr	x19, [x19, #0x7b0]
 12772f0: 2a1403e1     	mov	w1, w20
 12772f4: aa1f03e3     	mov	x3, xzr
 12772f8: f9400262     	ldr	x2, [x19]
 12772fc: 9400570e     	bl	0x128cf34 <__start_il2cpp+0xe5770>
 1277300: 52a85908     	mov	w8, #0x42c80000         // =1120403456
 1277304: 1e270101     	fmov	s1, w8
 1277308: 1e212000     	fcmp	s0, s1
 127730c: 54000585     	b.pl	0x12773bc <__start_il2cpp+0xcfbf8>
 1277310: bd417b80     	ldr	s0, [x28, #0x178]
 1277314: 1e229001     	fmov	s1, #5.00000000
 1277318: 52a85908     	mov	w8, #0x42c80000         // =1120403456
 127731c: 5e21d800     	scvtf	s0, s0
 1277320: 1e211800     	fdiv	s0, s0, s1
 1277324: 1e270101     	fmov	s1, w8
 1277328: 1e210800     	fmul	s0, s0, s1
 127732c: 1e212000     	fcmp	s0, s1
 1277330: 540003ab     	b.lt	0x12773a4 <__start_il2cpp+0xcfbe0>
 1277334: f9400300     	ldr	x0, [x24]
 1277338: b40014e0     	cbz	x0, 0x12775d4 <__start_il2cpp+0xcfe10>
 127733c: b000af29     	adrp	x9, 0x285c000 <_ZTVN10__cxxabiv119__pointer_type_infoE+0x18>
 1277340: f9400261     	ldr	x1, [x19]
 1277344: f947a529     	ldr	x9, [x9, #0xf48]
 1277348: b9401c0a     	ldr	w10, [x0, #0x1c]
 127734c: f9400808     	ldr	x8, [x0, #0x10]
 1277350: f9400129     	ldr	x9, [x9]
 1277354: 1100054a     	add	w10, w10, #0x1
 1277358: b9001c0a     	str	w10, [x0, #0x1c]
 127735c: b40013c8     	cbz	x8, 0x12775d4 <__start_il2cpp+0xcfe10>
 1277360: b980180a     	ldrsw	x10, [x0, #0x18]
 1277364: b940190b     	ldr	w11, [x8, #0x18]
 1277368: 6b0b015f     	cmp	w10, w11
 127736c: 54000102     	b.hs	0x127738c <__start_il2cpp+0xcfbc8>
 1277370: 11000549     	add	w9, w10, #0x1
 1277374: 8b0a0d08     	add	x8, x8, x10, lsl #3
 1277378: 52a8590a     	mov	w10, #0x42c80000        // =1120403456
 127737c: b9001809     	str	w9, [x0, #0x18]
 1277380: f9001101     	str	x1, [x8, #0x20]
 1277384: 1e270140     	fmov	s0, w10
 1277388: 14000007     	b	0x12773a4 <__start_il2cpp+0xcfbe0>
 127738c: f9401128     	ldr	x8, [x9, #0x20]
 1277390: f9406108     	ldr	x8, [x8, #0xc0]
 1277394: f9403902     	ldr	x2, [x8, #0x70]
 1277398: 941a0c1f     	bl	0x18fa414 <__start_il2cpp+0x752c50>
 127739c: 52a85908     	mov	w8, #0x42c80000         // =1120403456
 12773a0: 1e270100     	fmov	s0, w8
 12773a4: f94002e0     	ldr	x0, [x23]
 12773a8: b4001160     	cbz	x0, 0x12775d4 <__start_il2cpp+0xcfe10>
 12773ac: f9400262     	ldr	x2, [x19]
 12773b0: 2a1403e1     	mov	w1, w20
 12773b4: aa1f03e3     	mov	x3, xzr
 12773b8: 940056e7     	bl	0x128cf54 <__start_il2cpp+0xe5790>
 12773bc: f94002e0     	ldr	x0, [x23]
 12773c0: b40010a0     	cbz	x0, 0x12775d4 <__start_il2cpp+0xcfe10>
 12773c4: f000af53     	adrp	x19, 0x2862000
 12773c8: f9445273     	ldr	x19, [x19, #0x8a0]
 12773cc: 2a1403e1     	mov	w1, w20
 12773d0: aa1f03e3     	mov	x3, xzr
 12773d4: f9400262     	ldr	x2, [x19]
 12773d8: 940056d7     	bl	0x128cf34 <__start_il2cpp+0xe5770>
 12773dc: 52a85908     	mov	w8, #0x42c80000         // =1120403456
 12773e0: 1e270101     	fmov	s1, w8
 12773e4: 1e212000     	fcmp	s0, s1
 12773e8: 54000585     	b.pl	0x1277498 <__start_il2cpp+0xcfcd4>
 12773ec: bd417b80     	ldr	s0, [x28, #0x178]
 12773f0: 1e249001     	fmov	s1, #10.00000000
 12773f4: 52a85908     	mov	w8, #0x42c80000         // =1120403456
 12773f8: 5e21d800     	scvtf	s0, s0
 12773fc: 1e211800     	fdiv	s0, s0, s1
 1277400: 1e270101     	fmov	s1, w8
 1277404: 1e210800     	fmul	s0, s0, s1
 1277408: 1e212000     	fcmp	s0, s1
 127740c: 540003ab     	b.lt	0x1277480 <__start_il2cpp+0xcfcbc>
 1277410: f9400300     	ldr	x0, [x24]
 1277414: b4000e00     	cbz	x0, 0x12775d4 <__start_il2cpp+0xcfe10>
 1277418: b000af29     	adrp	x9, 0x285c000 <_ZTVN10__cxxabiv119__pointer_type_infoE+0x18>
 127741c: f9400261     	ldr	x1, [x19]
 1277420: f947a529     	ldr	x9, [x9, #0xf48]
 1277424: b9401c0a     	ldr	w10, [x0, #0x1c]
 1277428: f9400808     	ldr	x8, [x0, #0x10]
 127742c: f9400129     	ldr	x9, [x9]
 1277430: 1100054a     	add	w10, w10, #0x1
 1277434: b9001c0a     	str	w10, [x0, #0x1c]
 1277438: b4000ce8     	cbz	x8, 0x12775d4 <__start_il2cpp+0xcfe10>
 127743c: b980180a     	ldrsw	x10, [x0, #0x18]
 1277440: b940190b     	ldr	w11, [x8, #0x18]
 1277444: 6b0b015f     	cmp	w10, w11
 1277448: 54000102     	b.hs	0x1277468 <__start_il2cpp+0xcfca4>
 127744c: 11000549     	add	w9, w10, #0x1
 1277450: 8b0a0d08     	add	x8, x8, x10, lsl #3
 1277454: 52a8590a     	mov	w10, #0x42c80000        // =1120403456
 1277458: b9001809     	str	w9, [x0, #0x18]
 127745c: f9001101     	str	x1, [x8, #0x20]
 1277460: 1e270140     	fmov	s0, w10
 1277464: 14000007     	b	0x1277480 <__start_il2cpp+0xcfcbc>
 1277468: f9401128     	ldr	x8, [x9, #0x20]
 127746c: f9406108     	ldr	x8, [x8, #0xc0]
 1277470: f9403902     	ldr	x2, [x8, #0x70]
 1277474: 941a0be8     	bl	0x18fa414 <__start_il2cpp+0x752c50>
 1277478: 52a85908     	mov	w8, #0x42c80000         // =1120403456
 127747c: 1e270100     	fmov	s0, w8
 1277480: f94002e0     	ldr	x0, [x23]
 1277484: b4000a80     	cbz	x0, 0x12775d4 <__start_il2cpp+0xcfe10>
 1277488: f9400262     	ldr	x2, [x19]
 127748c: 2a1403e1     	mov	w1, w20
 1277490: aa1f03e3     	mov	x3, xzr
 1277494: 940056b0     	bl	0x128cf54 <__start_il2cpp+0xe5790>
 1277498: f94002e0     	ldr	x0, [x23]
 127749c: b40009c0     	cbz	x0, 0x12775d4 <__start_il2cpp+0xcfe10>
 12774a0: f000af53     	adrp	x19, 0x2862000
 12774a4: f9441273     	ldr	x19, [x19, #0x820]
 12774a8: 2a1403e1     	mov	w1, w20
 12774ac: aa1f03e3     	mov	x3, xzr
 12774b0: f9400262     	ldr	x2, [x19]
 12774b4: 940056a0     	bl	0x128cf34 <__start_il2cpp+0xe5770>
 12774b8: 52a85908     	mov	w8, #0x42c80000         // =1120403456
 12774bc: 1e270101     	fmov	s1, w8
 12774c0: 1e212000     	fcmp	s0, s1
 12774c4: 54000585     	b.pl	0x1277574 <__start_il2cpp+0xcfdb0>
 12774c8: bd417b80     	ldr	s0, [x28, #0x178]
 12774cc: 1e269001     	fmov	s1, #20.00000000
 12774d0: 52a85908     	mov	w8, #0x42c80000         // =1120403456
 12774d4: 5e21d800     	scvtf	s0, s0
 12774d8: 1e211800     	fdiv	s0, s0, s1
 12774dc: 1e270101     	fmov	s1, w8
 12774e0: 1e210800     	fmul	s0, s0, s1
 12774e4: 1e212000     	fcmp	s0, s1
 12774e8: 540003ab     	b.lt	0x127755c <__start_il2cpp+0xcfd98>
 12774ec: f9400300     	ldr	x0, [x24]
 12774f0: b4000720     	cbz	x0, 0x12775d4 <__start_il2cpp+0xcfe10>
 12774f4: b000af29     	adrp	x9, 0x285c000 <_ZTVN10__cxxabiv119__pointer_type_infoE+0x18>
 12774f8: f9400261     	ldr	x1, [x19]
 12774fc: f947a529     	ldr	x9, [x9, #0xf48]
 1277500: b9401c0a     	ldr	w10, [x0, #0x1c]
 1277504: f9400808     	ldr	x8, [x0, #0x10]
 1277508: f9400129     	ldr	x9, [x9]
 127750c: 1100054a     	add	w10, w10, #0x1
 1277510: b9001c0a     	str	w10, [x0, #0x1c]
 1277514: b4000608     	cbz	x8, 0x12775d4 <__start_il2cpp+0xcfe10>
 1277518: b980180a     	ldrsw	x10, [x0, #0x18]
 127751c: b940190b     	ldr	w11, [x8, #0x18]
 1277520: 6b0b015f     	cmp	w10, w11
 1277524: 54000102     	b.hs	0x1277544 <__start_il2cpp+0xcfd80>
 1277528: 11000549     	add	w9, w10, #0x1
 127752c: 8b0a0d08     	add	x8, x8, x10, lsl #3
 1277530: 52a8590a     	mov	w10, #0x42c80000        // =1120403456
 1277534: b9001809     	str	w9, [x0, #0x18]
 1277538: f9001101     	str	x1, [x8, #0x20]
 127753c: 1e270140     	fmov	s0, w10
 1277540: 14000007     	b	0x127755c <__start_il2cpp+0xcfd98>
 1277544: f9401128     	ldr	x8, [x9, #0x20]
 1277548: f9406108     	ldr	x8, [x8, #0xc0]
 127754c: f9403902     	ldr	x2, [x8, #0x70]
 1277550: 941a0bb1     	bl	0x18fa414 <__start_il2cpp+0x752c50>
 1277554: 52a85908     	mov	w8, #0x42c80000         // =1120403456
 1277558: 1e270100     	fmov	s0, w8
 127755c: f94002e0     	ldr	x0, [x23]
 1277560: b40003a0     	cbz	x0, 0x12775d4 <__start_il2cpp+0xcfe10>
 1277564: f9400262     	ldr	x2, [x19]
 1277568: 2a1403e1     	mov	w1, w20
 127756c: aa1f03e3     	mov	x3, xzr
 1277570: 94005679     	bl	0x128cf54 <__start_il2cpp+0xe5790>
 1277574: f94002e0     	ldr	x0, [x23]
 1277578: b40002e0     	cbz	x0, 0x12775d4 <__start_il2cpp+0xcfe10>
 127757c: aa1f03e1     	mov	x1, xzr
 1277580: 940058fd     	bl	0x128d974 <__start_il2cpp+0xe61b0>
 1277584: f9400300     	ldr	x0, [x24]
 1277588: b4000260     	cbz	x0, 0x12775d4 <__start_il2cpp+0xcfe10>
 127758c: f000af34     	adrp	x20, 0x285e000
 1277590: f9432a94     	ldr	x20, [x20, #0x650]
 1277594: 2a1f03f3     	mov	w19, wzr
 1277598: b9401808     	ldr	w8, [x0, #0x18]
 127759c: 6b08027f     	cmp	w19, w8
 12775a0: 540001ca     	b.ge	0x12775d8 <__start_il2cpp+0xcfe14>
 12775a4: f9400282     	ldr	x2, [x20]
 12775a8: 2a1303e1     	mov	w1, w19
 12775ac: 941a0ae9     	bl	0x18fa150 <__start_il2cpp+0x75298c>
 12775b0: f94002e8     	ldr	x8, [x23]
 12775b4: b4000108     	cbz	x8, 0x12775d4 <__start_il2cpp+0xcfe10>
 12775b8: aa0003e1     	mov	x1, x0
 12775bc: aa0803e0     	mov	x0, x8
 12775c0: aa1f03e2     	mov	x2, xzr
 12775c4: 94004519     	bl	0x1288a28 <__start_il2cpp+0xe1264>
 12775c8: f9400300     	ldr	x0, [x24]
 12775cc: 11000673     	add	w19, w19, #0x1
 12775d0: b5fffe40     	cbnz	x0, 0x1277598 <__start_il2cpp+0xcfdd4>
 12775d4: 97f922cb     	bl	0x10c0100 <CloseNLSocket+0x638>
