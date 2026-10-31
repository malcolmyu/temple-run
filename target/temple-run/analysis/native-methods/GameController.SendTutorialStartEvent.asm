
/tmp/temple-libil2cpp.so:	file format elf64-littleaarch64

Disassembly of section il2cpp:

00000000011a77c4 <__start_il2cpp>:
 1266d50: f81e0ffe     	str	x30, [sp, #-0x20]!
 1266d54: a9014ff4     	stp	x20, x19, [sp, #0x10]
 1266d58: f000be73     	adrp	x19, 0x2a35000
 1266d5c: 395c4e68     	ldrb	w8, [x19, #0x713]
 1266d60: 370000c8     	tbnz	w8, #0x0, 0x1266d78 <__start_il2cpp+0xbf5b4>
 1266d64: 9000afe0     	adrp	x0, 0x2862000
 1266d68: f940dc00     	ldr	x0, [x0, #0x1b8]
 1266d6c: 97f9645b     	bl	0x10bfed8 <CloseNLSocket+0x410>
 1266d70: 52800028     	mov	w8, #0x1                // =1
 1266d74: 391c4e68     	strb	w8, [x19, #0x713]
 1266d78: f000be73     	adrp	x19, 0x2a35000
 1266d7c: 395dea68     	ldrb	w8, [x19, #0x77a]
 1266d80: 350000c8     	cbnz	w8, 0x1266d98 <__start_il2cpp+0xbf5d4>
 1266d84: f000afc0     	adrp	x0, 0x2861000
 1266d88: f941bc00     	ldr	x0, [x0, #0x378]
 1266d8c: 97f96453     	bl	0x10bfed8 <CloseNLSocket+0x410>
 1266d90: 52800028     	mov	w8, #0x1                // =1
 1266d94: 391dea68     	strb	w8, [x19, #0x77a]
 1266d98: f000afd4     	adrp	x20, 0x2861000
 1266d9c: f941be94     	ldr	x20, [x20, #0x378]
 1266da0: 9000aff3     	adrp	x19, 0x2862000
 1266da4: f9400280     	ldr	x0, [x20]
 1266da8: b940e008     	ldr	w8, [x0, #0xe0]
 1266dac: f940de73     	ldr	x19, [x19, #0x1b8]
 1266db0: 35000068     	cbnz	w8, 0x1266dbc <__start_il2cpp+0xbf5f8>
 1266db4: 97f9648b     	bl	0x10bffe0 <CloseNLSocket+0x518>
 1266db8: f9400280     	ldr	x0, [x20]
 1266dbc: f9400268     	ldr	x8, [x19]
 1266dc0: f9405c09     	ldr	x9, [x0, #0xb8]
 1266dc4: b940e10a     	ldr	w10, [x8, #0xe0]
 1266dc8: f9406d33     	ldr	x19, [x9, #0xd8]
 1266dcc: 3500006a     	cbnz	w10, 0x1266dd8 <__start_il2cpp+0xbf614>
 1266dd0: aa0803e0     	mov	x0, x8
 1266dd4: 97f96483     	bl	0x10bffe0 <CloseNLSocket+0x518>
 1266dd8: aa1303e0     	mov	x0, x19
 1266ddc: a9414ff4     	ldp	x20, x19, [sp, #0x10]
 1266de0: aa1f03e1     	mov	x1, xzr
 1266de4: f84207fe     	ldr	x30, [sp], #0x20
 1266de8: 1400a8fc     	b	0x12911d8 <__start_il2cpp+0xe9a14>
