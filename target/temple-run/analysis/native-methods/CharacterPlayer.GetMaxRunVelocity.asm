
/tmp/temple-libil2cpp.so:	file format elf64-littleaarch64

Disassembly of section il2cpp:

00000000011a77c4 <__start_il2cpp>:
 129833c: 3945d008     	ldrb	w8, [x0, #0x174]
 1298340: 340000e8     	cbz	w8, 0x129835c <__start_il2cpp+0xf0b98>
 1298344: 3945d408     	ldrb	w8, [x0, #0x175]
 1298348: bd40ec00     	ldr	s0, [x0, #0xec]
 129834c: 340000c8     	cbz	w8, 0x1298364 <__start_il2cpp+0xf0ba0>
 1298350: 1e209001     	fmov	s1, #2.50000000
 1298354: 1e210800     	fmul	s0, s0, s1
 1298358: d65f03c0     	ret
 129835c: bd40ec00     	ldr	s0, [x0, #0xec]
 1298360: d65f03c0     	ret
 1298364: 1e202800     	fadd	s0, s0, s0
 1298368: d65f03c0     	ret
