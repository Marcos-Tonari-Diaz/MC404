.globl _start

_start:

    la t1, wordTest # 
    lw t0, 0(t1)
    addi t0, t0, 1
    li a0, 0 # exit code
    li a7, 93 # syscall exit
    ecall

wordTest: .word 1023
