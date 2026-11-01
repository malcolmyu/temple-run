
/tmp/temple-libil2cpp.so:	file format elf64-littleaarch64

Disassembly of section il2cpp:

00000000011a77c4 <__start_il2cpp>:
 12f65a0: f81f0ffe     	str	x30, [sp, #-0x10]!
 12f65a4: aa1f03e1     	mov	x1, xzr
 12f65a8: 9446fee8     	bl	0x24b6148 <__start_il2cpp+0x130e984>
 12f65ac: b40000a0     	cbz	x0, 0x12f65c0 <__start_il2cpp+0x14edfc>
 12f65b0: 52800021     	mov	w1, #0x1                // =1
 12f65b4: aa1f03e2     	mov	x2, xzr
 12f65b8: f84107fe     	ldr	x30, [sp], #0x10
 12f65bc: 1447097f     	b	0x24b8bb8 <__start_il2cpp+0x13113f4>
 12f65c0: 97f726d0     	bl	0x10c0100 <CloseNLSocket+0x638>
