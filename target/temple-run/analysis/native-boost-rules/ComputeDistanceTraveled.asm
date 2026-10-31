
/tmp/temple-libil2cpp.so:	file format elf64-littleaarch64

Disassembly of section il2cpp:

00000000011a77c4 <__start_il2cpp>:
 126e458: f9403a68     	ldr	x8, [x19, #0x70]
 126e45c: b4001828     	cbz	x8, 0x126e760 <__start_il2cpp+0xc6f9c>
 126e460: 3945d109     	ldrb	w9, [x8, #0x174]
 126e464: 34000089     	cbz	w9, 0x126e474 <__start_il2cpp+0xc6cb0>
 126e468: bd417900     	ldr	s0, [x8, #0x178]
 126e46c: 1e283800     	fsub	s0, s0, s8
 126e470: bd017900     	str	s0, [x8, #0x178]
