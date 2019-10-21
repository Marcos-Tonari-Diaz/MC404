.globl _start

funcao_rec:
ADDI sp, sp, -4
SW ra, 0(sp)
ADDI a0, a0, -1
BLT a0, zero, fr_retorna
JAL funcao_rec
fr_retorna:
LW ra, 0(sp)
ADDI sp, sp, 4
RET
_start:
li a0, 2
jal funcao_rec

