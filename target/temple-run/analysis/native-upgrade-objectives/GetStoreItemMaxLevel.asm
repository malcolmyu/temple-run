
/tmp/temple-libil2cpp.so:	file format elf64-littleaarch64

Disassembly of section il2cpp:

00000000011a77c4 <__start_il2cpp>:
 128e5d8: 51001428     	sub	w8, w1, #0x5
 128e5dc: 7100251f     	cmp	w8, #0x9
 128e5e0: 540000a8     	b.hi	0x128e5f4 <__start_il2cpp+0xe6e30>
 128e5e4: b0ffa149     	adrp	x9, 0x6b7000
 128e5e8: 9127f129     	add	x9, x9, #0x9fc
 128e5ec: b868d920     	ldr	w0, [x9, w8, sxtw #2]
 128e5f0: d65f03c0     	ret
 128e5f4: 2a1f03e0     	mov	w0, wzr
 128e5f8: d65f03c0     	ret
