
/tmp/temple-libil2cpp.so:	file format elf64-littleaarch64

Disassembly of section il2cpp:

00000000011a77c4 <__start_il2cpp>:
 12bf434: a9be57fe     	stp	x30, x21, [sp, #-0x20]!
 12bf438: a9014ff4     	stp	x20, x19, [sp, #0x10]
 12bf43c: d000bbb4     	adrp	x20, 0x2a35000
 12bf440: b000ad35     	adrp	x21, 0x2864000
 12bf444: 39681288     	ldrb	w8, [x20, #0xa04]
 12bf448: f9450eb5     	ldr	x21, [x21, #0xa18]
 12bf44c: aa0003f3     	mov	x19, x0
 12bf450: 37000188     	tbnz	w8, #0x0, 0x12bf480 <__start_il2cpp+0x117cbc>
 12bf454: f000ad00     	adrp	x0, 0x2862000
 12bf458: f9429c00     	ldr	x0, [x0, #0x538]
 12bf45c: 97f8029f     	bl	0x10bfed8 <CloseNLSocket+0x410>
 12bf460: b000ad20     	adrp	x0, 0x2864000
 12bf464: f9450800     	ldr	x0, [x0, #0xa10]
 12bf468: 97f8029c     	bl	0x10bfed8 <CloseNLSocket+0x410>
 12bf46c: b000ad20     	adrp	x0, 0x2864000
 12bf470: f9450c00     	ldr	x0, [x0, #0xa18]
 12bf474: 97f80299     	bl	0x10bfed8 <CloseNLSocket+0x410>
 12bf478: 52800028     	mov	w8, #0x1                // =1
 12bf47c: 39281288     	strb	w8, [x20, #0xa04]
 12bf480: f94002a8     	ldr	x8, [x21]
 12bf484: f9403660     	ldr	x0, [x19, #0x68]
 12bf488: f9002668     	str	x8, [x19, #0x48]
 12bf48c: b40002c0     	cbz	x0, 0x12bf4e4 <__start_il2cpp+0x117d20>
 12bf490: b000ad28     	adrp	x8, 0x2864000
 12bf494: f9450908     	ldr	x8, [x8, #0xa10]
 12bf498: f000ad14     	adrp	x20, 0x2862000
 12bf49c: f9400101     	ldr	x1, [x8]
 12bf4a0: f9429e94     	ldr	x20, [x20, #0x538]
 12bf4a4: 940466c8     	bl	0x13d8fc4 <__start_il2cpp+0x231800>
 12bf4a8: f9004a60     	str	x0, [x19, #0x90]
 12bf4ac: f9400288     	ldr	x8, [x20]
 12bf4b0: aa1303e0     	mov	x0, x19
 12bf4b4: 2a1f03e1     	mov	w1, wzr
 12bf4b8: f9405d08     	ldr	x8, [x8, #0xb8]
 12bf4bc: f9000113     	str	x19, [x8]
 12bf4c0: 9400000a     	bl	0x12bf4e8 <__start_il2cpp+0x117d24>
 12bf4c4: aa1303e0     	mov	x0, x19
 12bf4c8: 2a1f03e1     	mov	w1, wzr
 12bf4cc: 94000017     	bl	0x12bf528 <__start_il2cpp+0x117d64>
 12bf4d0: aa1303e0     	mov	x0, x19
 12bf4d4: a9414ff4     	ldp	x20, x19, [sp, #0x10]
 12bf4d8: 52800321     	mov	w1, #0x19               // =25
 12bf4dc: a8c257fe     	ldp	x30, x21, [sp], #0x20
 12bf4e0: 14000022     	b	0x12bf568 <__start_il2cpp+0x117da4>
 12bf4e4: 97f80307     	bl	0x10c0100 <CloseNLSocket+0x638>
