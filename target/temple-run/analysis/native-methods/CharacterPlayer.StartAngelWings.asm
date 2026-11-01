
/tmp/temple-libil2cpp.so:	file format elf64-littleaarch64

Disassembly of section il2cpp:

00000000011a77c4 <__start_il2cpp>:
 1298c6c: 12000028     	and	w8, w1, #0x1
 1298c70: 52800029     	mov	w9, #0x1                // =1
 1298c74: 39058409     	strb	w9, [x0, #0x161]
 1298c78: 39058008     	strb	w8, [x0, #0x160]
 1298c7c: bd016400     	str	s0, [x0, #0x164]
 1298c80: 370000c1     	tbnz	w1, #0x0, 0x1298c98 <__start_il2cpp+0xf14d4>
 1298c84: b9415c08     	ldr	w8, [x0, #0x15c]
 1298c88: 52a84689     	mov	w9, #0x42340000         // =1110704128
 1298c8c: b9016809     	str	w9, [x0, #0x168]
 1298c90: 51000508     	sub	w8, w8, #0x1
 1298c94: b9015c08     	str	w8, [x0, #0x15c]
 1298c98: d65f03c0     	ret
