
/tmp/temple-libil2cpp.so:	file format elf64-littleaarch64

Disassembly of section il2cpp:

00000000011a77c4 <__start_il2cpp>:
 12e08ec: fd401403     	ldr	d3, [x0, #0x28]
 12e08f0: bd403004     	ldr	s4, [x0, #0x30]
 12e08f4: 52800028     	mov	w8, #0x1                // =1
 12e08f8: 6e0c0420     	mov	v0.s[1], v1.s[0]
 12e08fc: 0e23d400     	fadd	v0.2s, v0.2s, v3.2s
 12e0900: 1e242841     	fadd	s1, s2, s4
 12e0904: fd001400     	str	d0, [x0, #0x28]
 12e0908: bd003001     	str	s1, [x0, #0x30]
 12e090c: 39009008     	strb	w8, [x0, #0x24]
 12e0910: d65f03c0     	ret
