.globl _start

_start:
    li a0, 0 # file descriptor = 0 (stdin)
    la a1, linha1 #  declarar rotulo
    li a2, 12 # quantidade de bytes a serem lidos
    li a7, 63 # syscall read (63)
    ecall

    #copiando uma substring arbitraria
    la t0, linha1 #carrega o endereco
    lbu t1, 0(t0) #carrega um byte a partir de linha1
    lbu t2, 1(t0) 
    lbu t3, 2(t0) 
    li t4, 10 #newline
    la t6, temp #endereco da string temporaria
    sb t1, 0(t6)
    sb t2, 1(t6)
    sb t3, 2(t6)
    sb t4, 3(t6)

    li a0, 1 # file descriptor = 1 (stdout)
    la a1, temp #  buffer
    li a2, 4 # size
    li a7, 64 # syscall write (64)
    ecall
    
    li a0, 0 # exit code
    li a7, 93 # syscall exit
    ecall

linha1:
    .skip 12
temp:
    .skip 4
