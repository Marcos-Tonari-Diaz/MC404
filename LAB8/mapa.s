	.file	"mapa.c"
	.option nopic
	.attribute arch, "rv32i2p0_m2p0_a2p0_f2p0_d2p0_c2p0"
	.attribute unaligned_access, 0
	.attribute stack_align, 16
	.text
.Ltext0:
	.cfi_sections	.debug_frame
	.globl	mapa
	.data
	.align	2
	.type	mapa, @object
	.size	mapa, 100
mapa:
	.ascii	"XXXXXXXXXX"
	.ascii	"X___XX_X_X"
	.ascii	"X_X_XX___X"
	.ascii	"X_XX___X_X"
	.ascii	"X_X__X___X"
	.ascii	"X___XX_X_X"
	.ascii	"X_X__X_X_X"
	.ascii	"X__X___X_X"
	.ascii	"X____X___X"
	.ascii	"XXXXXXXXXX"
	.comm	visitados,400,4
	.comm	xRob,4,4
	.comm	yRob,4,4
	.comm	xLoc,4,4
	.comm	yLoc,4,4
	.text
	.align	1
	.globl	_start
	.type	_start, @function
_start:
.LFB0:
	.file 1 "mapa.c"
	.loc 1 40 35
	.cfi_startproc
	addi	sp,sp,-32
	.cfi_def_cfa_offset 32
	sw	ra,28(sp)
	sw	s0,24(sp)
	.cfi_offset 1, -4
	.cfi_offset 8, -8
	addi	s0,sp,32
	.cfi_def_cfa 8, 0
	sw	a0,-20(s0)
	sw	a1,-24(s0)
	.loc 1 42 10
	lui	a5,%hi(xRob)
	li	a4,3
	sw	a4,%lo(xRob)(a5)
	.loc 1 43 10
	lui	a5,%hi(yRob)
	li	a4,1
	sw	a4,%lo(yRob)(a5)
	.loc 1 44 10
	lui	a5,%hi(xLoc)
	li	a4,8
	sw	a4,%lo(xLoc)(a5)
	.loc 1 45 10
	lui	a5,%hi(yLoc)
	li	a4,3
	sw	a4,%lo(yLoc)(a5)
	.loc 1 47 5
	call	ajudaORobinson
	.loc 1 49 12
	li	a5,0
	.loc 1 50 1
	mv	a0,a5
	lw	ra,28(sp)
	.cfi_restore 1
	lw	s0,24(sp)
	.cfi_restore 8
	.cfi_def_cfa 2, 32
	addi	sp,sp,32
	.cfi_def_cfa_offset 0
	jr	ra
	.cfi_endproc
.LFE0:
	.size	_start, .-_start
	.align	1
	.globl	daParaPassar
	.type	daParaPassar, @function
daParaPassar:
.LFB1:
	.loc 1 52 32
	.cfi_startproc
	addi	sp,sp,-32
	.cfi_def_cfa_offset 32
	sw	s0,28(sp)
	.cfi_offset 8, -4
	addi	s0,sp,32
	.cfi_def_cfa 8, 0
	sw	a0,-20(s0)
	sw	a1,-24(s0)
	.loc 1 53 5
	lw	a5,-20(s0)
	blt	a5,zero,.L4
	.loc 1 53 13 discriminator 1
	lw	a4,-20(s0)
	li	a5,9
	bgt	a4,a5,.L4
	.loc 1 53 31 discriminator 2
	lw	a5,-24(s0)
	blt	a5,zero,.L4
	.loc 1 53 41 discriminator 3
	lw	a4,-24(s0)
	li	a5,9
	ble	a4,a5,.L5
.L4:
	.loc 1 54 10
	li	a5,0
	j	.L6
.L5:
	.loc 1 56 17
	lui	a5,%hi(mapa)
	addi	a3,a5,%lo(mapa)
	lw	a4,-20(s0)
	mv	a5,a4
	slli	a5,a5,2
	add	a5,a5,a4
	slli	a5,a5,1
	add	a4,a3,a5
	lw	a5,-24(s0)
	add	a5,a4,a5
	lbu	a5,0(a5)
	.loc 1 56 21
	addi	a5,a5,-88
	snez	a5,a5
	andi	a5,a5,0xff
.L6:
	.loc 1 57 1
	mv	a0,a5
	lw	s0,28(sp)
	.cfi_restore 8
	.cfi_def_cfa 2, 32
	addi	sp,sp,32
	.cfi_def_cfa_offset 0
	jr	ra
	.cfi_endproc
.LFE1:
	.size	daParaPassar, .-daParaPassar
	.align	1
	.globl	posicaoXRobinson
	.type	posicaoXRobinson, @function
posicaoXRobinson:
.LFB2:
	.loc 1 59 24
	.cfi_startproc
	addi	sp,sp,-16
	.cfi_def_cfa_offset 16
	sw	s0,12(sp)
	.cfi_offset 8, -4
	addi	s0,sp,16
	.cfi_def_cfa 8, 0
	.loc 1 60 10
	lui	a5,%hi(xRob)
	lw	a5,%lo(xRob)(a5)
	.loc 1 61 1
	mv	a0,a5
	lw	s0,12(sp)
	.cfi_restore 8
	.cfi_def_cfa 2, 16
	addi	sp,sp,16
	.cfi_def_cfa_offset 0
	jr	ra
	.cfi_endproc
.LFE2:
	.size	posicaoXRobinson, .-posicaoXRobinson
	.align	1
	.globl	posicaoYRobinson
	.type	posicaoYRobinson, @function
posicaoYRobinson:
.LFB3:
	.loc 1 63 24
	.cfi_startproc
	addi	sp,sp,-16
	.cfi_def_cfa_offset 16
	sw	s0,12(sp)
	.cfi_offset 8, -4
	addi	s0,sp,16
	.cfi_def_cfa 8, 0
	.loc 1 64 10
	lui	a5,%hi(yRob)
	lw	a5,%lo(yRob)(a5)
	.loc 1 65 1
	mv	a0,a5
	lw	s0,12(sp)
	.cfi_restore 8
	.cfi_def_cfa 2, 16
	addi	sp,sp,16
	.cfi_def_cfa_offset 0
	jr	ra
	.cfi_endproc
.LFE3:
	.size	posicaoYRobinson, .-posicaoYRobinson
	.align	1
	.globl	posicaoXLocal
	.type	posicaoXLocal, @function
posicaoXLocal:
.LFB4:
	.loc 1 67 21
	.cfi_startproc
	addi	sp,sp,-16
	.cfi_def_cfa_offset 16
	sw	s0,12(sp)
	.cfi_offset 8, -4
	addi	s0,sp,16
	.cfi_def_cfa 8, 0
	.loc 1 68 10
	lui	a5,%hi(xLoc)
	lw	a5,%lo(xLoc)(a5)
	.loc 1 69 1
	mv	a0,a5
	lw	s0,12(sp)
	.cfi_restore 8
	.cfi_def_cfa 2, 16
	addi	sp,sp,16
	.cfi_def_cfa_offset 0
	jr	ra
	.cfi_endproc
.LFE4:
	.size	posicaoXLocal, .-posicaoXLocal
	.align	1
	.globl	posicaoYLocal
	.type	posicaoYLocal, @function
posicaoYLocal:
.LFB5:
	.loc 1 71 21
	.cfi_startproc
	addi	sp,sp,-16
	.cfi_def_cfa_offset 16
	sw	s0,12(sp)
	.cfi_offset 8, -4
	addi	s0,sp,16
	.cfi_def_cfa 8, 0
	.loc 1 72 10
	lui	a5,%hi(yLoc)
	lw	a5,%lo(yLoc)(a5)
	.loc 1 73 1
	mv	a0,a5
	lw	s0,12(sp)
	.cfi_restore 8
	.cfi_def_cfa 2, 16
	addi	sp,sp,16
	.cfi_def_cfa_offset 0
	jr	ra
	.cfi_endproc
.LFE5:
	.size	posicaoYLocal, .-posicaoYLocal
	.align	1
	.globl	inicializaVisitados
	.type	inicializaVisitados, @function
inicializaVisitados:
.LFB6:
	.loc 1 75 28
	.cfi_startproc
	addi	sp,sp,-32
	.cfi_def_cfa_offset 32
	sw	s0,28(sp)
	.cfi_offset 8, -4
	addi	s0,sp,32
	.cfi_def_cfa 8, 0
	.loc 1 77 10
	sw	zero,-20(s0)
	.loc 1 77 3
	j	.L16
.L19:
	.loc 1 78 12
	sw	zero,-24(s0)
	.loc 1 78 5
	j	.L17
.L18:
	.loc 1 79 23 discriminator 3
	lui	a5,%hi(visitados)
	addi	a3,a5,%lo(visitados)
	lw	a4,-20(s0)
	mv	a5,a4
	slli	a5,a5,2
	add	a5,a5,a4
	slli	a5,a5,1
	lw	a4,-24(s0)
	add	a5,a5,a4
	slli	a5,a5,2
	add	a5,a3,a5
	sw	zero,0(a5)
	.loc 1 78 32 discriminator 3
	lw	a5,-24(s0)
	addi	a5,a5,1
	sw	a5,-24(s0)
.L17:
	.loc 1 78 5 discriminator 1
	lw	a4,-24(s0)
	li	a5,9
	ble	a4,a5,.L18
	.loc 1 77 30 discriminator 2
	lw	a5,-20(s0)
	addi	a5,a5,1
	sw	a5,-20(s0)
.L16:
	.loc 1 77 3 discriminator 1
	lw	a4,-20(s0)
	li	a5,9
	ble	a4,a5,.L19
	.loc 1 82 1
	nop
	nop
	lw	s0,28(sp)
	.cfi_restore 8
	.cfi_def_cfa 2, 32
	addi	sp,sp,32
	.cfi_def_cfa_offset 0
	jr	ra
	.cfi_endproc
.LFE6:
	.size	inicializaVisitados, .-inicializaVisitados
	.align	1
	.globl	foiVisitado
	.type	foiVisitado, @function
foiVisitado:
.LFB7:
	.loc 1 84 31
	.cfi_startproc
	addi	sp,sp,-32
	.cfi_def_cfa_offset 32
	sw	s0,28(sp)
	.cfi_offset 8, -4
	addi	s0,sp,32
	.cfi_def_cfa 8, 0
	sw	a0,-20(s0)
	sw	a1,-24(s0)
	.loc 1 85 22
	lui	a5,%hi(visitados)
	addi	a3,a5,%lo(visitados)
	lw	a4,-20(s0)
	mv	a5,a4
	slli	a5,a5,2
	add	a5,a5,a4
	slli	a5,a5,1
	lw	a4,-24(s0)
	add	a5,a5,a4
	slli	a5,a5,2
	add	a5,a3,a5
	lw	a5,0(a5)
	.loc 1 85 26
	addi	a5,a5,-1
	seqz	a5,a5
	andi	a5,a5,0xff
	.loc 1 86 1
	mv	a0,a5
	lw	s0,28(sp)
	.cfi_restore 8
	.cfi_def_cfa 2, 32
	addi	sp,sp,32
	.cfi_def_cfa_offset 0
	jr	ra
	.cfi_endproc
.LFE7:
	.size	foiVisitado, .-foiVisitado
	.align	1
	.globl	visitaCelula
	.type	visitaCelula, @function
visitaCelula:
.LFB8:
	.loc 1 88 33
	.cfi_startproc
	addi	sp,sp,-32
	.cfi_def_cfa_offset 32
	sw	s0,28(sp)
	.cfi_offset 8, -4
	addi	s0,sp,32
	.cfi_def_cfa 8, 0
	sw	a0,-20(s0)
	sw	a1,-24(s0)
	.loc 1 89 19
	lui	a5,%hi(visitados)
	addi	a3,a5,%lo(visitados)
	lw	a4,-20(s0)
	mv	a5,a4
	slli	a5,a5,2
	add	a5,a5,a4
	slli	a5,a5,1
	lw	a4,-24(s0)
	add	a5,a5,a4
	slli	a5,a5,2
	add	a5,a3,a5
	li	a4,1
	sw	a4,0(a5)
	.loc 1 90 1
	nop
	lw	s0,28(sp)
	.cfi_restore 8
	.cfi_def_cfa 2, 32
	addi	sp,sp,32
	.cfi_def_cfa_offset 0
	jr	ra
	.cfi_endproc
.LFE8:
	.size	visitaCelula, .-visitaCelula
.Letext0:
	.section	.debug_info,"",@progbits
.Ldebug_info0:
	.4byte	0x238
	.2byte	0x4
	.4byte	.Ldebug_abbrev0
	.byte	0x4
	.byte	0x1
	.4byte	.LASF17
	.byte	0xc
	.4byte	.LASF18
	.4byte	.LASF19
	.4byte	.Ltext0
	.4byte	.Letext0-.Ltext0
	.4byte	.Ldebug_line0
	.byte	0x2
	.4byte	0x42
	.4byte	0x3b
	.byte	0x3
	.4byte	0x3b
	.byte	0x9
	.byte	0x3
	.4byte	0x3b
	.byte	0x9
	.byte	0
	.byte	0x4
	.byte	0x4
	.byte	0x7
	.4byte	.LASF0
	.byte	0x4
	.byte	0x1
	.byte	0x8
	.4byte	.LASF1
	.byte	0x5
	.4byte	.LASF2
	.byte	0x1
	.byte	0x6
	.byte	0x6
	.4byte	0x25
	.byte	0x5
	.byte	0x3
	.4byte	mapa
	.byte	0x2
	.4byte	0x71
	.4byte	0x71
	.byte	0x3
	.4byte	0x3b
	.byte	0x9
	.byte	0x3
	.4byte	0x3b
	.byte	0x9
	.byte	0
	.byte	0x6
	.byte	0x4
	.byte	0x5
	.string	"int"
	.byte	0x5
	.4byte	.LASF3
	.byte	0x1
	.byte	0x14
	.byte	0x5
	.4byte	0x5b
	.byte	0x5
	.byte	0x3
	.4byte	visitados
	.byte	0x5
	.4byte	.LASF4
	.byte	0x1
	.byte	0x16
	.byte	0x5
	.4byte	0x71
	.byte	0x5
	.byte	0x3
	.4byte	xRob
	.byte	0x5
	.4byte	.LASF5
	.byte	0x1
	.byte	0x16
	.byte	0xb
	.4byte	0x71
	.byte	0x5
	.byte	0x3
	.4byte	yRob
	.byte	0x5
	.4byte	.LASF6
	.byte	0x1
	.byte	0x16
	.byte	0x11
	.4byte	0x71
	.byte	0x5
	.byte	0x3
	.4byte	xLoc
	.byte	0x5
	.4byte	.LASF7
	.byte	0x1
	.byte	0x16
	.byte	0x17
	.4byte	0x71
	.byte	0x5
	.byte	0x3
	.4byte	yLoc
	.byte	0x7
	.4byte	.LASF20
	.byte	0x1
	.byte	0x58
	.byte	0x6
	.4byte	.LFB8
	.4byte	.LFE8-.LFB8
	.byte	0x1
	.byte	0x9c
	.4byte	0x103
	.byte	0x8
	.string	"x"
	.byte	0x1
	.byte	0x58
	.byte	0x17
	.4byte	0x71
	.byte	0x2
	.byte	0x91
	.byte	0x6c
	.byte	0x8
	.string	"y"
	.byte	0x1
	.byte	0x58
	.byte	0x1e
	.4byte	0x71
	.byte	0x2
	.byte	0x91
	.byte	0x68
	.byte	0
	.byte	0x9
	.4byte	.LASF12
	.byte	0x1
	.byte	0x54
	.byte	0x5
	.4byte	0x71
	.4byte	.LFB7
	.4byte	.LFE7-.LFB7
	.byte	0x1
	.byte	0x9c
	.4byte	0x138
	.byte	0x8
	.string	"x"
	.byte	0x1
	.byte	0x54
	.byte	0x15
	.4byte	0x71
	.byte	0x2
	.byte	0x91
	.byte	0x6c
	.byte	0x8
	.string	"y"
	.byte	0x1
	.byte	0x54
	.byte	0x1c
	.4byte	0x71
	.byte	0x2
	.byte	0x91
	.byte	0x68
	.byte	0
	.byte	0xa
	.4byte	.LASF21
	.byte	0x1
	.byte	0x4b
	.byte	0x6
	.4byte	.LFB6
	.4byte	.LFE6-.LFB6
	.byte	0x1
	.byte	0x9c
	.4byte	0x169
	.byte	0xb
	.string	"i"
	.byte	0x1
	.byte	0x4c
	.byte	0x7
	.4byte	0x71
	.byte	0x2
	.byte	0x91
	.byte	0x6c
	.byte	0xb
	.string	"j"
	.byte	0x1
	.byte	0x4c
	.byte	0xa
	.4byte	0x71
	.byte	0x2
	.byte	0x91
	.byte	0x68
	.byte	0
	.byte	0xc
	.4byte	.LASF8
	.byte	0x1
	.byte	0x47
	.byte	0x5
	.4byte	0x71
	.4byte	.LFB5
	.4byte	.LFE5-.LFB5
	.byte	0x1
	.byte	0x9c
	.byte	0xc
	.4byte	.LASF9
	.byte	0x1
	.byte	0x43
	.byte	0x5
	.4byte	0x71
	.4byte	.LFB4
	.4byte	.LFE4-.LFB4
	.byte	0x1
	.byte	0x9c
	.byte	0xc
	.4byte	.LASF10
	.byte	0x1
	.byte	0x3f
	.byte	0x5
	.4byte	0x71
	.4byte	.LFB3
	.4byte	.LFE3-.LFB3
	.byte	0x1
	.byte	0x9c
	.byte	0xc
	.4byte	.LASF11
	.byte	0x1
	.byte	0x3b
	.byte	0x5
	.4byte	0x71
	.4byte	.LFB2
	.4byte	.LFE2-.LFB2
	.byte	0x1
	.byte	0x9c
	.byte	0x9
	.4byte	.LASF13
	.byte	0x1
	.byte	0x34
	.byte	0x5
	.4byte	0x71
	.4byte	.LFB1
	.4byte	.LFE1-.LFB1
	.byte	0x1
	.byte	0x9c
	.4byte	0x1f6
	.byte	0x8
	.string	"x"
	.byte	0x1
	.byte	0x34
	.byte	0x16
	.4byte	0x71
	.byte	0x2
	.byte	0x91
	.byte	0x6c
	.byte	0x8
	.string	"y"
	.byte	0x1
	.byte	0x34
	.byte	0x1d
	.4byte	0x71
	.byte	0x2
	.byte	0x91
	.byte	0x68
	.byte	0
	.byte	0xd
	.4byte	.LASF14
	.byte	0x1
	.byte	0x28
	.byte	0x5
	.4byte	0x71
	.4byte	.LFB0
	.4byte	.LFE0-.LFB0
	.byte	0x1
	.byte	0x9c
	.4byte	0x22f
	.byte	0xe
	.4byte	.LASF15
	.byte	0x1
	.byte	0x28
	.byte	0x10
	.4byte	0x71
	.byte	0x2
	.byte	0x91
	.byte	0x6c
	.byte	0xe
	.4byte	.LASF16
	.byte	0x1
	.byte	0x28
	.byte	0x1d
	.4byte	0x22f
	.byte	0x2
	.byte	0x91
	.byte	0x68
	.byte	0
	.byte	0xf
	.byte	0x4
	.4byte	0x235
	.byte	0xf
	.byte	0x4
	.4byte	0x42
	.byte	0
	.section	.debug_abbrev,"",@progbits
.Ldebug_abbrev0:
	.byte	0x1
	.byte	0x11
	.byte	0x1
	.byte	0x25
	.byte	0xe
	.byte	0x13
	.byte	0xb
	.byte	0x3
	.byte	0xe
	.byte	0x1b
	.byte	0xe
	.byte	0x11
	.byte	0x1
	.byte	0x12
	.byte	0x6
	.byte	0x10
	.byte	0x17
	.byte	0
	.byte	0
	.byte	0x2
	.byte	0x1
	.byte	0x1
	.byte	0x49
	.byte	0x13
	.byte	0x1
	.byte	0x13
	.byte	0
	.byte	0
	.byte	0x3
	.byte	0x21
	.byte	0
	.byte	0x49
	.byte	0x13
	.byte	0x2f
	.byte	0xb
	.byte	0
	.byte	0
	.byte	0x4
	.byte	0x24
	.byte	0
	.byte	0xb
	.byte	0xb
	.byte	0x3e
	.byte	0xb
	.byte	0x3
	.byte	0xe
	.byte	0
	.byte	0
	.byte	0x5
	.byte	0x34
	.byte	0
	.byte	0x3
	.byte	0xe
	.byte	0x3a
	.byte	0xb
	.byte	0x3b
	.byte	0xb
	.byte	0x39
	.byte	0xb
	.byte	0x49
	.byte	0x13
	.byte	0x3f
	.byte	0x19
	.byte	0x2
	.byte	0x18
	.byte	0
	.byte	0
	.byte	0x6
	.byte	0x24
	.byte	0
	.byte	0xb
	.byte	0xb
	.byte	0x3e
	.byte	0xb
	.byte	0x3
	.byte	0x8
	.byte	0
	.byte	0
	.byte	0x7
	.byte	0x2e
	.byte	0x1
	.byte	0x3f
	.byte	0x19
	.byte	0x3
	.byte	0xe
	.byte	0x3a
	.byte	0xb
	.byte	0x3b
	.byte	0xb
	.byte	0x39
	.byte	0xb
	.byte	0x27
	.byte	0x19
	.byte	0x11
	.byte	0x1
	.byte	0x12
	.byte	0x6
	.byte	0x40
	.byte	0x18
	.byte	0x97,0x42
	.byte	0x19
	.byte	0x1
	.byte	0x13
	.byte	0
	.byte	0
	.byte	0x8
	.byte	0x5
	.byte	0
	.byte	0x3
	.byte	0x8
	.byte	0x3a
	.byte	0xb
	.byte	0x3b
	.byte	0xb
	.byte	0x39
	.byte	0xb
	.byte	0x49
	.byte	0x13
	.byte	0x2
	.byte	0x18
	.byte	0
	.byte	0
	.byte	0x9
	.byte	0x2e
	.byte	0x1
	.byte	0x3f
	.byte	0x19
	.byte	0x3
	.byte	0xe
	.byte	0x3a
	.byte	0xb
	.byte	0x3b
	.byte	0xb
	.byte	0x39
	.byte	0xb
	.byte	0x27
	.byte	0x19
	.byte	0x49
	.byte	0x13
	.byte	0x11
	.byte	0x1
	.byte	0x12
	.byte	0x6
	.byte	0x40
	.byte	0x18
	.byte	0x97,0x42
	.byte	0x19
	.byte	0x1
	.byte	0x13
	.byte	0
	.byte	0
	.byte	0xa
	.byte	0x2e
	.byte	0x1
	.byte	0x3f
	.byte	0x19
	.byte	0x3
	.byte	0xe
	.byte	0x3a
	.byte	0xb
	.byte	0x3b
	.byte	0xb
	.byte	0x39
	.byte	0xb
	.byte	0x11
	.byte	0x1
	.byte	0x12
	.byte	0x6
	.byte	0x40
	.byte	0x18
	.byte	0x97,0x42
	.byte	0x19
	.byte	0x1
	.byte	0x13
	.byte	0
	.byte	0
	.byte	0xb
	.byte	0x34
	.byte	0
	.byte	0x3
	.byte	0x8
	.byte	0x3a
	.byte	0xb
	.byte	0x3b
	.byte	0xb
	.byte	0x39
	.byte	0xb
	.byte	0x49
	.byte	0x13
	.byte	0x2
	.byte	0x18
	.byte	0
	.byte	0
	.byte	0xc
	.byte	0x2e
	.byte	0
	.byte	0x3f
	.byte	0x19
	.byte	0x3
	.byte	0xe
	.byte	0x3a
	.byte	0xb
	.byte	0x3b
	.byte	0xb
	.byte	0x39
	.byte	0xb
	.byte	0x49
	.byte	0x13
	.byte	0x11
	.byte	0x1
	.byte	0x12
	.byte	0x6
	.byte	0x40
	.byte	0x18
	.byte	0x97,0x42
	.byte	0x19
	.byte	0
	.byte	0
	.byte	0xd
	.byte	0x2e
	.byte	0x1
	.byte	0x3f
	.byte	0x19
	.byte	0x3
	.byte	0xe
	.byte	0x3a
	.byte	0xb
	.byte	0x3b
	.byte	0xb
	.byte	0x39
	.byte	0xb
	.byte	0x27
	.byte	0x19
	.byte	0x49
	.byte	0x13
	.byte	0x11
	.byte	0x1
	.byte	0x12
	.byte	0x6
	.byte	0x40
	.byte	0x18
	.byte	0x96,0x42
	.byte	0x19
	.byte	0x1
	.byte	0x13
	.byte	0
	.byte	0
	.byte	0xe
	.byte	0x5
	.byte	0
	.byte	0x3
	.byte	0xe
	.byte	0x3a
	.byte	0xb
	.byte	0x3b
	.byte	0xb
	.byte	0x39
	.byte	0xb
	.byte	0x49
	.byte	0x13
	.byte	0x2
	.byte	0x18
	.byte	0
	.byte	0
	.byte	0xf
	.byte	0xf
	.byte	0
	.byte	0xb
	.byte	0xb
	.byte	0x49
	.byte	0x13
	.byte	0
	.byte	0
	.byte	0
	.section	.debug_aranges,"",@progbits
	.4byte	0x1c
	.2byte	0x2
	.4byte	.Ldebug_info0
	.byte	0x4
	.byte	0
	.2byte	0
	.2byte	0
	.4byte	.Ltext0
	.4byte	.Letext0-.Ltext0
	.4byte	0
	.4byte	0
	.section	.debug_line,"",@progbits
.Ldebug_line0:
	.section	.debug_str,"MS",@progbits,1
.LASF0:
	.string	"unsigned int"
.LASF7:
	.string	"yLoc"
.LASF10:
	.string	"posicaoYRobinson"
.LASF17:
	.string	"GNU C17 9.2.0 -mtune=rocket -march=rv32gc -mabi=ilp32d -g"
.LASF18:
	.string	"mapa.c"
.LASF3:
	.string	"visitados"
.LASF20:
	.string	"visitaCelula"
.LASF15:
	.string	"argv"
.LASF19:
	.string	"/home/marcos/Documents/4SEM/MC404/LABS/LAB8"
.LASF1:
	.string	"char"
.LASF6:
	.string	"xLoc"
.LASF11:
	.string	"posicaoXRobinson"
.LASF5:
	.string	"yRob"
.LASF8:
	.string	"posicaoYLocal"
.LASF4:
	.string	"xRob"
.LASF16:
	.string	"argc"
.LASF21:
	.string	"inicializaVisitados"
.LASF12:
	.string	"foiVisitado"
.LASF13:
	.string	"daParaPassar"
.LASF14:
	.string	"_start"
.LASF9:
	.string	"posicaoXLocal"
.LASF2:
	.string	"mapa"
	.ident	"GCC: (GNU) 9.2.0"
