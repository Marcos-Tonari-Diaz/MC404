#LAB 8 
#Marcos Diaz
#221525

.globl ajudaORobinson

ajudaORobinson:
    jal inicializaVisitados
    #inicializa a pilha
    li sp, 4000
    #carregar x e y atuais
    jal posicaoXRobinson
    mv  t0, a0 
    jal posicaoYRobinson
    #carrega parametros
    mv a1, a0 #a1 <- robY
    mv a0, t0 #a1 <- robX
    #guarda posicoes inicial e final
    #mv  s0, a0 # robX
    #mv  s1, a1 # robY
    jal posicaoXLocal
    mv  s2, a0 # locX
    jal posicaoYLocal
    mv  s3, a0 # locY

    #dfs recursiva (a0 = xAtual, a1 = yAtual)
    dfsRec:
        #empilha dfsRec
        addi sp, sp, -4
        sw ra, 0(sp)
        #marcar como visitado
        jal visitaCelula
        #1.saio se ja estou no LOCAL    
        bne a0, s2, preparaRecursao
        bne a1, s3, preparaRecursao
        j dfsRetorna
    preparaRecursao:
        addi s0, a0, -1 #x-1
        addi s1, a1, -1 #y-1
        #para cada vizinho 
        li s4, 3 #contadorx
        li s5, 3 #contadory
        incrX:
            incrY:
            #carrega parametros
            mv a0, s0
            mv a1, s1
            #validar vizinho
                #empilha dfsRec
            addi sp, sp, -4
            sw ra, 0(sp)
            jal validarVizinho
            addi s1, s1, 1 #y++
            addi s5, s5, -1 #contadory--
            blt zero, s5, incrY
        addi s0, s0, 1 #x++
        addi s4, s4, -1 #contadorx--
        blt zero, s4, incrX

    #valida o vizinho (a0 = xAtual, a1 = yAtual)
    validarVizinho:
        #salvar parametros (caller-save)
        mv t0, a0
        jal daParaPassar
        #bool daParaPassar 
        mv t2, a0
        mv a0, t0
        jal foiVisitado
        #bool foiVisitado 
        mv  t3, a0 
        beq t2, zero, naoChama #nao da pra passar
        bne t3, zero, naoChama #ja foi visitado
        #chamada recursiva
            #empilha dfsRec
        mv a0, t0
        addi sp, sp, -4
        sw ra, 0(sp)
        jal dfsRec
    naoChama:
        lw ra, 0(sp)
        addi sp, sp, 4
        ret

dfsRetorna: 
    #imprimir X e Y
    la t2, imprimeTupla 
    add a0, a0, 48
    add a1, a1, 48
    li t0, 32 #" "
    li t1, 10 #newline
    sb a0, 0(t2)  
    sb t0, 1(t2)  
    sb a1, 2(t2)  
    sb t1, 3(t2)  

    li a0, 1 # file descriptor = 1 (stdout)
    la a1, imprimeTupla #  buffer
    li a2, 4 # size
    li a7, 64 # syscall write (64)
    ecall

    lw ra, 0(sp)
    addi sp, sp, 4
    ret

    li a0, 0 # exit code
    li a7, 93 # syscall exit
    ecall

imprimeTupla:
    .skip 4
