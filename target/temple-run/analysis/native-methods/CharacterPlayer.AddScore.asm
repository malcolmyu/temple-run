
/tmp/temple-libil2cpp.so:	file format elf64-littleaarch64

Disassembly of section il2cpp:

00000000011a77c4 <__start_il2cpp>:
 1298a8c: 7100043f     	cmp	w1, #0x1
 1298a90: 540000ab     	b.lt	0x1298aa4 <__start_il2cpp+0xf12e0>
 1298a94: b9413808     	ldr	w8, [x0, #0x138]
 1298a98: b9413c09     	ldr	w9, [x0, #0x13c]
 1298a9c: 1b012128     	madd	w8, w9, w1, w8
 1298aa0: b9013808     	str	w8, [x0, #0x138]
 1298aa4: d65f03c0     	ret
