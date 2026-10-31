
/tmp/temple-libil2cpp.so:	file format elf64-littleaarch64

Disassembly of section il2cpp:

00000000011a77c4 <__start_il2cpp>:
 126fc40: f94002a0     	ldr	x0, [x21]
 126fc44: b4000560     	cbz	x0, 0x126fcf0 <__start_il2cpp+0xc852c>
 126fc48: 3945d008     	ldrb	w8, [x0, #0x174]
 126fc4c: 4ea01c08     	mov	v8.16b, v0.16b
 126fc50: 34000208     	cbz	w8, 0x126fc90 <__start_il2cpp+0xc84cc>
 126fc54: bd417800     	ldr	s0, [x0, #0x178]
 126fc58: bd418001     	ldr	s1, [x0, #0x180]
 126fc5c: 1e212000     	fcmp	s0, s1
 126fc60: 5400006d     	b.le	0x126fc6c <__start_il2cpp+0xc84a8>
 126fc64: 52a862c8     	mov	w8, #0x43160000         // =1125515264
 126fc68: 14000009     	b	0x126fc8c <__start_il2cpp+0xc84c8>
 126fc6c: aa1f03e1     	mov	x1, xzr
 126fc70: 9400a19a     	bl	0x12982d8 <__start_il2cpp+0xf0b14>
 126fc74: f94002a0     	ldr	x0, [x21]
 126fc78: b40003c0     	cbz	x0, 0x126fcf0 <__start_il2cpp+0xc852c>
 126fc7c: bd417c01     	ldr	s1, [x0, #0x17c]
 126fc80: 1e212000     	fcmp	s0, s1
 126fc84: 5400006d     	b.le	0x126fc90 <__start_il2cpp+0xc84cc>
 126fc88: 52b862c8     	mov	w8, #-0x3cea0000        // =-1021968384
 126fc8c: 1e270108     	fmov	s8, w8
