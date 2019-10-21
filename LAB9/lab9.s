#LAB 9
#Marcos Diaz
#221525

.globl main
main:

# inicializa a pilha
li sp, 40000

li a0, 20
jal move

li s1, 50
printLoop:
	jal printCoordenadas
	addi s1, s1, -1
	bne zero, s1, printLoop

    li a0, 0 # exit code
    li a7, 93 # syscall exit
    ecall


# anda a0 cm para frente
move:
    mv a1, a0
    li a7, 2100
    li a0, 1
    ecall
    ret

# roda a0 graus no sentido anti-horario
rotate:
    mv a1, a0
    li a7, 2100
    li a0, 2
    ecall
    ret

getTime:
  la a0, buffer_timeval
  la a1, buffer_timerzone
  li a7, 169 # chamada de sistema gettimeofday
  ecall
  la a0, buffer_timeval
  lw t1, 0(a0) # tempo em segundos
  lw t2, 8(a0) # fração do tempo em microssegundos
  li t3, 1000
  mul t1, t1, t3
  div t2, t2, t3
  add a0, t2, t1
  ret

#imprime o tempo em segundos
printTime:
	addi sp, sp, -4
	sw ra, 0(sp)
	jal getTime
    mv  a1, a0
	la  a0, mask
    jal printf
	lw ra, 0(sp)
	addi sp, sp, 4
	ret

printTest:
	addi sp, sp, -4
	sw ra, 0(sp)
    li  a7, 2104
    li  a0, 0
    ecall
    mv  a1, a0
    la  a0, mask
    jal printf
	lw ra, 0(sp)
	addi sp, sp, 4
	ret

 
#imprime as cordenadas
printCoordenadas:
	addi sp, sp, -4
	sw ra, 0(sp)
	li  a7, 2104
    li  a0, 0
    ecall
	la t0, rotMask
	la t1, xMask
	la t2, zMask
	and a1, t0, a0
	srli a1, a1, 20
	and a2, t1, a0
	srli a1, a1, 10
	and a3, t2, a0
	la a0, mask2
	jal printf
	lw ra, 0(sp)
	addi sp, sp, 4
	ret

mask: .ascii "%x\n"
space: .skip 50
mask2: .ascii "%rot: %d x: %d z: %d\n"


rotMask: .word 4293918720
xMask: .word 1047552
zMask: .word 1023

buffer_timeval: .skip 12
buffer_timerzone: .skip 12
