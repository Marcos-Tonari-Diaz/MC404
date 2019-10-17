# Global symbol
    .globl faz_nada
    .globl _start

	.align 4

_start:

faz_nada:

    # Save the callee-save registers, and the return address.
    addi sp, sp, -4
    sw s4, 0(sp)
    addi sp, sp, -4
    sw s5, 0(sp)
    addi sp, sp, -4
    sw s6, 0(sp)
    addi sp, sp, -4
    sw ra, 0(sp)

	li   s4,  0
	li   s5,  1
	li   s6,  2

    sw ra, 0(sp)
    addi sp, sp, 4
    lw s6, 0(sp)
    addi sp, sp, 4
    lw s5, 4(sp)
    addi sp, sp, 4
    lw s4, 8(sp)
    addi sp, sp, 4
    
    #Restore the registers and return


faz_nada_resumido:
    # Note que salvamos todos os registradores de callee-save, e o ra tudo de uma vez
    addi sp, sp, -16
    sw s4, 0(sp)
    sw s5, 4(sp)
    sw s6, 8(sp)
    sw ra, 12(sp)

	li   s4,  0
	li   s5,  1
	li   s6,  2
   
   
    sw s4, 0(sp)
    sw s5, 4(sp)
    sw s6, 8(sp)
    sw ra, 12(sp)
    addi sp, sp, 16

    li a0, 0 # exit code
    li a7, 93 # syscall exit
    ecall
        
    # Note que na versão resumida alocamos e desalocamos toda a pilha de uma vez.
