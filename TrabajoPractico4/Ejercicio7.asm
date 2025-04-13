#Escribir un programa que sume todos los valores de un arreglo de 10 elementos de tipo
#half-word, que tengan un 1 en el bit 3.
.data
# arreglo con 10 elementos en hexa
ARREGLO:  .half 0x0001, 0x0008, 0x0004, 0x000F, 0x0010,0x0023, 0x0040, 0x0088, 0x00FF, 0x0F0F
suma: .word 0		# aqui almacenamos la suma

.text
.globl main

main:
	#inicializo
	la t0,ARREGLO	# puntero al arreglo
	li t1,10	#contador de elemento
	li t2, 0 	# acumulador de suma
	li t3, 0x0008 #cargo la mascara para 3 bit (0000 0000 0000 1000)

loop:
	
	beqz t1, fin
	
	lh t4, 0(t0) # carga half-word
	
	# verifica si el bit 3 es 1
	and t5,t4,t3	# aplico mascara
	beqz t5, siguiente	#si es 0 salta 
	
	add t2, t2, t4 # sumo
	
siguiente:
	# avanza al siguiente elemento
	addi t0, t0, 2	#cada half-word ocupa 2 bytes
	addi t1,t1,-1	# decremento contador
	j loop
	
fin:
	# almanar resultado
	la t6, suma
	sw t2,0(t6)
	
	#mostrar resultado
	li a7, 1
	mv a0, t2
	ecall
	
	li a7,10
	ecall	
	
	
	
	
	
