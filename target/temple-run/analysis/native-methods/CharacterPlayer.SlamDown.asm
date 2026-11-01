
/tmp/temple-libil2cpp.so:	file format elf64-littleaarch64

Disassembly of section il2cpp:

00000000011a77c4 <__start_il2cpp>:
 129884c: 3943e008     	ldrb	w8, [x0, #0xf8]
 1298850: 34000068     	cbz	w8, 0x129885c <__start_il2cpp+0xf1098>
 1298854: 3943c008     	ldrb	w8, [x0, #0xf0]
 1298858: 34000068     	cbz	w8, 0x1298864 <__start_il2cpp+0xf10a0>
 129885c: 2a1f03e0     	mov	w0, wzr
 1298860: d65f03c0     	ret
 1298864: 52b84e08     	mov	w8, #-0x3d900000        // =-1032847360
 1298868: b9003808     	str	w8, [x0, #0x38]
 129886c: 52800020     	mov	w0, #0x1                // =1
 1298870: d65f03c0     	ret
