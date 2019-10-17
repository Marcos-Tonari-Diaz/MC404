.globl _start
# Função para obtenção do tempo atual. ao <= tempo atual
time_now:
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

# Função para tocar o canal a0 canal do sintetizador
play_channel:
  slli a1, a0, 2     # canal = canal*4 // calcula posicao do canal no vetor C
  add a7, s8, a1     # soma deslocamento na matriz M 
  add a4, s4, a1     # soma deslocamento no vetor P
  add a5, s5, a1     # soma deslocamento no vetor P2
  add a3, s3, a1     # soma deslocamento no vetor C
  lw t1, 0(a7)       # lê matriz
  srli t2, t1, 16    # t2 = frequencia||velocidade
  beq t2, zero, end  # se zero, não tocar nada
  lw t3, 0(a4)       # t3 = (frequencia||velocidade) tocadas por último
  bne t2, t3, tocar; # se diferente, trocou a nota, então deve tocar
  lw t3, 0(a5)       # Tempo de termino do que está tocando
  ble s7, t3, end;   # Se ainda não parou de tocar anterior, não deve tocar novamente
  tocar:
    sw t2, 0(a4)     # Atualiza (frequencia||velocidade) em P
    and t2, t1, s6   # t2 = delay
    add t2, t2, s7   # Calcula até quando ir tocar
    sw t2, 0(a5)     # Armazena no vetor P2
    mv a2, a0        # Define o Canal
    lw a0, 0(a3)     # Carrega instrumento do canal
    mv a1, t1        # move (frequencia||velocidade||delay) para a1
    li a7, 2048      # chamada de sistema
    ecall
  end:
    ret

# Função para tocar todos os canais do sintetizador
play_all_channels:
  li a0, 15
  mv s10, ra
  while_channels: 
    mv s9, a0
    jal play_channel
    add a0, s9, -1
    bge a0, zero, while_channels
  mv ra, s10
  ret

.text
_start:
############  Implemente o Parser aqui  #############

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

# matriz C
# nao consigo carregar 19200000 como imediato
# imediate_max = 4091
# iterar 150 vezes:
li a0,150
li a1, 2000
li a2, 16
li t0, 0
li t1, 0
li t2, 0
la t3, M
#iterar 150 vezes
iter150:
  # iterar 2.000 linhas
  iter2000:
    # iterar 16 colunas
    iter16:
      #guarda zero
      sw zero, 0(t3)
      #avanca a palavra
      addi t3, t3, 4
      addi t2, t2, 1
      bge a2, t2, iter16
  addi t1, t1, 1
  li t2, 0
  bge a1, t1, iter2000
addi t0, t0, 1
li t1, 0
bge a0, t0, iter150

# le uma linha
li a0, 0 # file descriptor = 0 (stdin)
    la a1, linha #  declarar rotulo
    li a2, 12 # quantidade de bytes a serem lidos
    li a7, 63 # syscall read (63)
    ecall

#1. Le BPM e Ticks

#2. Desconsidera o Header
    

#3. Decide se a linha e de Programa ou de Nota (avalia o primeiro char) 
# ou se  

readLine:
#4.Salvar os numeros da linha
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
   
    #"iterador"
    li a0, 2
    li a1, 1

   #constantes da base 10
    li s4, 10
    li s5, 100
    li s6, 1000
  getNum4:
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

li a0, 0 # exit code
    li a7, 93 # syscall exit
    ecall


############        Fim do Parser       #############

play:
  jal time_now 
  mv s1, a0 # s1 recebe o tempo atual em ms
  la s2, M
  la s3, C
  la s4, P
  la s5, P2
  li s6, 0xffff
while_1:
  jal time_now        # a0 recebe o tempo atual em ms
  sub s7, a0, s1      # s7 recebe o tempo desde o início da função
  slli a1, s7, 6      # a1 = a1*64 // calculo do deslocamento para linha
  add s8, s2, a1      #s8 = &M + a1 // endereço da linha a ser processada
  jal play_all_channels
j while_1

.data 
.align 4
buffer_timeval: .skip 12
buffer_timerzone: .skip 12
P:  .skip 64
P2: .skip 64
C:  .skip 64
.comm	M,19200000,4 # Reserva um espaço de memória com 19.2MB iniciado no endereço marcalo pelo rótulo M

#meus rotulos
linha:
  .skip 40