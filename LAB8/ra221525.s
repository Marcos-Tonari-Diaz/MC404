#LAB 8 
#Marcos Diaz
#221525

.globl ajudaORobinson

ajudaORobinson:
    jal inicializaVisitados
    #inicializa a pilha
    li sp, 40000
    # carregar posicao do Robson
    jal posicaoXRobinson
    mv  t0, a0 
    jal posicaoYRobinson
    # carrega parametros
    mv a1, a0 #a1 <- robY
    mv a0, t0 #a1 <- robX
    # carrega destino
    jal posicaoXLocal
    mv  s2, a0 # locX
    jal posicaoYLocal
    mv  s3, a0 # locY
    li s6, 0
    jal dfsRec
    j fim
    # dfs recursiva (a0 = xAtual, a1 = yAtual)
    dfsRec:
        # empilha dfsRec, x, y
        addi sp, sp, -12
        sw ra, 8(sp)
        sw a0, 4(sp)
        sw a1, 0(sp)
        #tamanho da pilha
        addi s6, s6, 1
        # marcar como visitado
        mv s0, a0
        mv s1, a1
        jal visitaCelula
        # saio se ja estou no LOCAL    
        bne s0, s2, preparaRecursao
        bne s1, s3, preparaRecursao
        j dfsAcaba
    preparaRecursao:
        addi s0, s0, -1 # x-1
        addi s1, s1, -1 # y-1
        # para cada vizinho 
        li t4, 3 # contadorx
        li t5, 3 # contadory
        incrX:
            incrY:
            # validar vizinho: da para passar e nao foi visitado
            # carrega parametros
            mv a0, s0
            mv a1, s1            
            jal daParaPassar
            mv t0, a0
            # carrega parametros
            mv a0, s0
            mv a1, s1            
            jal foiVisitado
            mv  t1, a0 
            beq t0, zero, naoChama # nao da pra passar
            bne t1, zero, naoChama # ja foi visitado
            # carrega parametros para a chamada recursiva
            mv a0, s0 # x
            mv a1, s1 # y
            # chamada recursiva
            jal dfsRec
            # desempilhar y, x e ra atuais
            lw s1, 0(sp)
            lw s0, 4(sp)
            lw ra, 8(sp)
            addi sp, sp, 12
            addi s6, s6, -1
            j preparaRecursao
        naoChama:
            # laco
            addi s1, s1, 1 # y++
            addi t5, t5, -1 # contadorY--
            blt zero, t5, incrY
        addi s0, s0, 1 # x++
        addi s1, s1, -2 # reiniciar y
        li t5, 2 # reiniciar contadorY
        addi t4, t4, -1 # contadorX--
        blt zero, t4, incrX
    deadend:
        # desempilhar y, x e dfsRec
        lw zero, 0(sp) # descarte
        lw zero, 4(sp) # descarte
        lw ra, 8(sp) 
        addi sp, sp, 12
        addi s6, s6, -1
        ret
# desempilhar toda a pilha 
dfsAcaba: 
        # desempilhar y, x e dfsRec
        lw a1, 0(sp)
        lw a0, 4(sp)
        lw ra, 8(sp)
        # imprimir X e Y
        la t2, imprimeTupla 
        add a0, a0, 48
        add a1, a1, 48
        li t0, 32 # " "
        li t1, 10 # newline
        sb a0, 0(t2)  
        sb t0, 1(t2)  
        sb a1, 2(t2)  
        sb t1, 3(t2)  

        li a0, 1 # file descriptor = 1 (stdout)
        la a1, imprimeTupla # buffer
        li a2, 4 # size
        li a7, 64 # syscall write (64)
        ecall
        addi sp, sp, 12
        #decremeta s6
        addi s6, s6, -1
        bne zero, s6, dfsAcaba

fim:
    li a0, 0 # exit code
    li a7, 93 # syscall exit
    ecall

imprimeTupla:
    .skip 4
