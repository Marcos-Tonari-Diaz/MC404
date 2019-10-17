#ler as linhas ate encontrar uma linha com so um inteiro "ccccc\n"
# comparar com 0 pq nenhum outro ascii vai ser 0
.globl _start

_start:
#0.Inicializar C e M com zeros
#vetor C
  la a0, C
  li a1, 16 # num_iteracoes
  li t0, 1 #iterador
preencherC:
  sw zero, 0(a0)
  addi a0, a0, 4
  addi t0, t0, 1
  bge a1, t0, preencherC
    
  #test
  lw t1, 45(a0)
  
# #2. Desconsidera o Header
#     li a0, 0 # file descriptor = 0 (stdin)
#     la a1, zero #  declarar rotulo
#     li a2, 12 # quantidade de bytes a serem lidos
#     li a7, 63 # syscall read (63)
#     ecall

# readLine:
# # 2.Salvar os numeros da primeira linha
#     li a0, 0 # file descriptor = 0 (stdin)
#     la a1, linha1 #  declarar rotulo
#     li a2, 12 # quantidade de bytes a serem lidos
#     li a7, 63 # syscall read (63)
#     ecall

#     la s0, linha1 #carrega o endereco
#     #la s1, temp
#     li s2, 10 #new-line
#     la s3, numerosl1
#     #"apontador" temporario dos numeros da l1
#     la s8, numerosl1
#     #constantes da base 10
#     li s4, 10
#     li s5, 100
#     li s6, 1000
#     #"iterador"
#     li a0, 2
#     li a1, 1

#   getNum4:
#       lbu t0, 0(s0) #caracter de sinal
#       lbu t1, 1(s0) #carrega um byte a partir de linha1 - mais significativo
#       lbu t2, 2(s0) 
#       lbu t3, 3(s0)
#       lbu t4, 4(s0) #menos significativo

#       #converte cada digito de ascii para o valor numerico 
#       addi t1, t1, -48
#       addi t2, t2, -48
#       addi t3, t3, -48
#       addi t4, t4, -48
#       #guarda o inteiro em s7
#       mul t3, t3, s4
#       mul t2, t2, s5
#       mul t1, t1, s6
#       addi s7, t4, 0
#       add s7, s7, t3
#       add s7, s7, t2
#       add s7, s7, t1

li a0, 0 # exit code
    li a7, 93 # syscall exit
    ecall

C:
    .skip 64
