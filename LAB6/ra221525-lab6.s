#MC404A LAB6 RA221525
#armazenar numeros funcionando
.globl _start

_start:
    # 1.Salvar os numeros da primeira linha
    li a0, 0 # file descriptor = 0 (stdin)
    la a1, linha1 #  declarar rotulo
    li a2, 12 # quantidade de bytes a serem lidos
    li a7, 63 # syscall read (63)
    ecall

    la s0, linha1 #carrega o endereco
    #la s1, temp
    li s2, 10 #new-line
    la s3, numerosl1
    #"apontador" temporario dos numeros da l1
    la s8, numerosl1
    #constantes da base 10
    li s4, 10
    li s5, 100
    li s6, 1000
    #"iterador"
    li a0, 2
    li a1, 1

getNum:
    lbu t0, 0(s0) #caracter de sinal
    lbu t1, 1(s0) #carrega um byte a partir de linha1 - mais significativo
    lbu t2, 2(s0) 
    lbu t3, 3(s0)
    lbu t4, 4(s0) #menos significativo

    #converte cada digito de ascii para o valor numerico 
    addi t1, t1, -48
    addi t2, t2, -48
    addi t3, t3, -48
    addi t4, t4, -48
    #guarda o inteiro em s7
    mul t3, t3, s4
    mul t2, t2, s5
    mul t1, t1, s6
    addi s7, t4, 0
    add s7, s7, t3
    add s7, s7, t2
    add s7, s7, t1

    #trata o sinal
    li s11, 43
    beq t0, s11, positivo

    #inverte o sinal (complemento de 2) 
    xori s7, s7, -1
    addi s7, s7, 1

positivo:
    #guarda o numero
    sw s7, 0(s8)
    #atualiza o inicio da memoria para o proximo numero
    addi s0, s0, 6
    addi s8, s8, 4
    #"atualiza o iterador"
    addi a1, a1, 1

    #desvio para realizar uma nova iteracao
    beq a0, a1, getNum

    # 2.Salvar os numeros da segunda linha
    li a0, 0 # file descriptor = 0 (stdin)
    la a1, linha2 #  declarar rotulo
    li a2, 20 # quantidade de bytes a serem lidos
    li a7, 63 # syscall read (63)
    ecall

    la s0, linha2 #carrega o endereco
    li s2, 10 #new-line
    la s9, numerosl2
    #"apontador" temporario dos numeros da l2
    la s8, numerosl2
    #constantes da base 10
    li s4, 10
    li s5, 100
    li s6, 1000
    #"iterador"
    li a0, 4
    li a1, 0

getNum2:
    lbu t1, 0(s0) #carrega um byte a partir de linha2 - mais significativo
    lbu t2, 1(s0) 
    lbu t3, 2(s0)
    lbu t4, 3(s0) #menos significativo

    #converte cada digito de ascii para o valor numerico 
    addi t1, t1, -48
    addi t2, t2, -48
    addi t3, t3, -48
    addi t4, t4, -48
    #guarda o inteiro em s7
    mul t3, t3, s4
    mul t2, t2, s5
    mul t1, t1, s6
    addi s7, t4, 0
    add s7, s7, t3
    add s7, s7, t2
    add s7, s7, t1

    #guarda o numero
    sw s7, 0(s8)
    #atualiza o inicio da memoria para o proximo numero
    addi s0, s0, 5
    addi s8, s8, 4
    #"atualiza o iterador"
    addi a1, a1, 1

    #desvio para realizar uma nova iteracao
    blt a1, a0, getNum2

    #3.computar distancias dA, dB, dC (funcionando)
    la s9, numerosl2
    la s1, distancias
    la s10, distancias #copia para iteracao
    #iteradores
    li a0, 3 
    li a1, 0
    #tR
    lw s2, 12(s9)
    li s4, 3 #cte 3
    li s5, 10 #cte 10
computaDistancia:
    #tA, tB, tC
    lw t0, 0(s9)
    sub t1, s2, t0 # t1 = tr - tA,B ou C
    mul t1, t1, s4 # t1x3
    div t1, t1, s5 # t1/10
    sw t1, 0(s10)
    addi s9, s9, 4
    addi s10, s10, 4
    addi a1, a1, 1
    blt a1, a0, computaDistancia

    #4.computar Y (eq4)
    la s10, resultadoY
    la s1, distancias
    la s2, numerosl1
    lw s3, 0(s1) #dA
    lw s4, 4(s1) #dB
    lw s5, 0(s2) #Yb
    mul s3, s3, s3 #dA^2
    mul s4, s4, s4 #dB^2
    mul s6, s5, s5 #Yb^2
    add s7, s3, s6 #y 
    sub s7, s7, s4
    slli s5, s5, 1 #2Yb
    div s7, s7, s5
    sw s7, 0(s10)
    #obs: y esta aproximado devido a divisao inteira

    #5.computar X (eq5)
    la s2, resultadoY
    la s1, distancias
    lw s3, 0(s1) #dA
    lw s4, 0(s2) #y
    mul s3, s3, s3 #dA²
    mul s8, s4, s4 #y²
    sub s5 ,s3, s8 # (dA²-y²)
    #algoritmo para computar a raiz
    srli t0, s5 , 1 # k = y/2
    #iteradores
    li a0, 10 
    li a1, 0
iteracaoRaiz:
    div t1, s5, t0 #y/k
    add t2, t0, t1 #k+y/k
    srli t0, t2, 1 #k'=(k+y/k)/2
    addi a1, a1, 1
    blt a1, a0, iteracaoRaiz
    #x1: t0
    #x2:t1 = -t0
    xori t1, t0, -1
    addi t1, t1, 1
    #substituir na versao modificada da eq3: (x-xC)²+y²-dC²=0
    la s0, numerosl1
    la s1, distancias
    lw s2, 4(s0) #xC
    lw s3, 8(s1) #dC
    #para x1 (t2)
    sub t2, t0, s2 #x1-Xc
    mul t2, t2, t2 #(x1-Xc)²
    add t2, t2, s8 #(x1-Xc)²+y²
    mul s3, s3, s3 #dC²
    sub t2, t2, s3 #(x1-Xc)²+y² -dC²
    #para x2 (t3)
    sub t3, t1, s2 #x2-Xc
    mul t3, t3, t3 #(x2-Xc)²
    add t3, t3, s8 #(x2-Xc)²+y²
    sub t3, t3, s3 #(x2-Xc)²+y²-dC²

    #operacao de modulo
    bge t2, zero, t2pos
    #se negativo, inverte o sinal
    xori t2, t2, -1
    addi t2, t2, 1
t2pos:
    bge t3, zero, t3pos
    #se negativo, inverte o sinal
    xori t3, t3, -1
    addi t3, t3, 1
t3pos:
    la s10, resultadoX
    #compara os valores
    blt t2, t3, x2maior
    sw t1, 0(s10) 
    j x1maior
x2maior:
    sw t0, 0(s10)
x1maior:
    #teste
    lw s9, 0(s10) 
    #6.conversao para ASCII
    la a0, resultadoX
    la a1, resultadoY
    la a2, printXY
    lw s0, 0(a0) #x
    lw s1, 0(a1) #y
    li s4, 10
    li s5, 100
    li s6, 1000
    li s7, 43 #"+"
    li s8, 45 #"-"
    li s9, 32 #" "
    li a3, 10 #newline
    #converter x
    bge s0, zero, xpos
    sb s8, 0(a2)
    xori s0, s0, -1
    addi s0, s0, 1
    j xneg
xpos:
    sb s7, 0(a2)
xneg:
    #mais significativo
    div t0, s0, s6 
    add t1, t0, 48
    sb t1, 1(a2)
    mul t0, t0, s6
    sub s0, s0, t0
    
    div t0, s0, s5 
    add t1, t0, 48
    sb t1, 2(a2)
    mul t0, t0, s5
    sub s0, s0, t0
    
    div t0, s0, s4 
    add t1, t0, 48
    sb t1, 3(a2)
    mul t0, t0, s4
    sub s0, s0, t0
    
    #menos significativo 
    add t1, s0, 48
    sb t1, 4(a2)

    #espaco " "
    sb s9, 5(a2)

    #converter y
    bge s1, zero, ypos
    sb s8, 6(a2)
    xori s1, s1, -1
    addi s1, s1, 1
    j yneg
ypos:
    sb s7, 6(a2)
yneg:
    #mais significativo
    div t0, s1, s6 
    add t1, t0, 48
    sb t1, 7(a2)
    mul t0, t0, s6
    sub s1, s1, t0
    
    div t0, s1, s5 
    add t1, t0, 48
    sb t1, 8(a2)
    mul t0, t0, s5
    sub s1, s1, t0
    
    div t0, s1, s4 
    add t1, t0, 48
    sb t1, 9(a2)
    mul t0, t0, s4
    sub s1, s1, t0
    
    #menos significativo 
    add t1, s1, 48
    sb t1, 10(a2)

    #newline
    sb a3, 11(a2)

    #7.saida
    li a0, 1 # file descriptor = 1 (stdout)
    la a1, printXY #  buffer
    li a2, 12 # size
    li a7, 64 # syscall write (64)
    ecall
    
    li a0, 0 # exit code
    li a7, 93 # syscall exit
    ecall

linha1:
    .skip 12
linha2:
    .skip 20
numerosl1:
    .skip 8
numerosl2:
    .skip 16
distancias:
    .skip 12
resultadoY:
    .skip 4
resultadoX:
    .skip 4
printXY:
    .skip 12
