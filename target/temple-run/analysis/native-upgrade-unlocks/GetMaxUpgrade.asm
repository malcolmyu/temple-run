
/tmp/temple-libil2cpp.so:	file format elf64-littleaarch64

Disassembly of section il2cpp:

00000000011a77c4 <__start_il2cpp>:
 128dc58: 71008c3f     	cmp	w1, #0x23
 128dc5c: 540000a8     	b.hi	0x128dc70 <__start_il2cpp+0xe64ac>
 128dc60: d0ffa148     	adrp	x8, 0x6b7000
 128dc64: 91255108     	add	x8, x8, #0x954
 128dc68: b861d900     	ldr	w0, [x8, w1, sxtw #2]
 128dc6c: d65f03c0     	ret
 128dc70: 2a1f03e0     	mov	w0, wzr
 128dc74: d65f03c0     	ret
