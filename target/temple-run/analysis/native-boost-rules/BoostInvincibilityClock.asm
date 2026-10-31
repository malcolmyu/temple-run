
/tmp/temple-libil2cpp.so:	file format elf64-littleaarch64

Disassembly of section il2cpp:

00000000011a77c4 <__start_il2cpp>:
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
