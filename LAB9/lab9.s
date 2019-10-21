#LAB 9
#Marcos Diaz
#221525

.globl main
main:

# inicializa a pilha
li sp, 40000

li a0, 270
jal rotate

li a0, 20
jal move

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
    # empilha ra
    addi sp, sp, -4
	sw ra, 0(sp)
    # chama a rotacao
    mv a1, a0
    li a7, 2100
    li a0, 2
    ecall
    # espera a rotacao terminar
    rotwaitLoop:
        jal getRot
        beq a0, s1, rotsaiLoop
        mv s1, a0 # guarda a ultima rot
        jal printCoordenadas
        jal wait1sec
        j rotwaitLoop
    rotsaiLoop:
    # desempilha ra
    lw ra, 0(sp)
	addi sp, sp, 4
    ret

getTime_mSec:
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

# retorna o tempo em segundos no a0
getTime_Sec:
  la a0, buffer_timeval
  la a1, buffer_timerzone
  li a7, 169 # chamada de sistema gettimeofday
  ecall
  la a0, buffer_timeval
  lw t1, 0(a0) # tempo em segundos
  mv a0, t1
  ret

wait1sec:
    addi sp, sp, -4
	sw ra, 0(sp)
    addi sp, sp, -4
	sw s0, 0(sp)
    jal getTime_Sec
    mv s0, a0
    addi s0, s0, 1
    secloop:
        jal getTime_Sec
        mv t0, a0
        bne t0, s0, secloop
    lw s0, 0(sp)
	addi sp, sp, 4
    lw ra, 0(sp)
	addi sp, sp, 4
	ret


#imprime o tempo em segundos
printTime:
	addi sp, sp, -4
	sw ra, 0(sp)
	jal getTime_Sec
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
    # recebe valores
    jal getTime_Sec
    mv s1, a0
	jal getX
    mv s2, a0
    jal getZ
    mv s3, a0
    # carrega parametros
    mv a1, s1
    mv a2, s2
    mv a3, s3
	la a0, mask2
    
	jal printf
	lw ra, 0(sp)
	addi sp, sp, 4
	ret

# retorna a rotacao em graus em a0
getRot:
    li  a7, 2104
    li  a0, 0
    ecall
	la t0, rotMask
    lw t0, 0(t0)
	and a1, t0, a0
	srli a1, a1, 20
    mv a0, a1
    ret

# retorna a rotacao em graus em a0
getX:
    li  a7, 2104
    li  a0, 0
    ecall
	la t0, xMask
    lw t0, 0(t0)
	and a1, t0, a0
	srli a1, a1, 10
    mv a0, a1
    ret

# retorna a rotacao em graus em a0
getZ:
    li  a7, 2104
    li  a0, 0
    ecall
	la t0, zMask
    lw t0, 0(t0)
	and a1, t0, a0
    mv a0, a1
    ret


mask: .ascii "%x\n"
space: .skip 50
# segundos, x, z
mask2: .ascii "[%d.0] (%d, %d)\n"
space2: .skip 50
mask3: .ascii "r: %d\n"
space3: .skip 50
mask4: .ascii "t: %d\n"

rotMask: .word 4293918720
xMask: .word 1047552
zMask: .word 1023

buffer_timeval: .skip 12
buffer_timerzone: .skip 12
