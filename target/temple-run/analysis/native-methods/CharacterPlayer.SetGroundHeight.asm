
/tmp/temple-libil2cpp.so:	file format elf64-littleaarch64

Disassembly of section il2cpp:

00000000011a77c4 <__start_il2cpp>:
 12982bc: bd413401     	ldr	s1, [x0, #0x134]
 12982c0: 1e202020     	fcmp	s1, s0
 12982c4: 54000065     	b.pl	0x12982d0 <__start_il2cpp+0xf0b0c>
 12982c8: 52800028     	mov	w8, #0x1                // =1
 12982cc: 3904c808     	strb	w8, [x0, #0x132]
 12982d0: bd013400     	str	s0, [x0, #0x134]
 12982d4: d65f03c0     	ret
