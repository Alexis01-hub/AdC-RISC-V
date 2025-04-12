#EJERCICIO 6
#Escribir un programa que, dado un arreglo de 10 bytes, genere dos nuevos arreglos:
#uno con los números pares (PAR) y otro con los números impares (IMPAR).
.data
ARREGLO: .byte 2,3,5,7,10,9,4,8,6,1 #10 bytes
PAR: .space 10
IMPAR: .space 10


.text
.globl main

main:

	# carga
	la t0,ARREGLO
	la t1, PAR
	la t2, IMPAR
	#contadores
	li t3,0	# indice general
	li t4,0	# indice par
	li t5,0 	# indice impar
	
loop:
	# verificar 
	li t6, 10
	beq t3,t6, done
	
	# carga el elemento actual(1 byte)
	lb a0, 0(t0)	# a0 = numero actual (8 bits)
	
	# verifica paridad
	
	 andi t6, a0, 1	#en t6 guarda el and entre a0 y 1
	 beqz t6, es_par #beqz dice que si t6 es igual a 0 entonces salta
	 
es_impar:
	# Almacenar impar
	sb a0, 0(t2)	#guarda el byte en IMPAR
	addi t2,t2,1	#incrementa puntero
	addi t5,t5,1	#incrementa contador impares
	j siguiente

es_par:
	# almacena par
	sb a0, 0(t1) 	#guarda el byte en PAR
	addi t1,t1,1 	#incremento el puntero
	addi t4,t4,1 	#incremento contador de pares
	j siguiente

siguiente:
	# prepara siguiente eiteracion
	addi t0,t0,1 #avanza puntero del arreglo
	addi t3,t3,1 #avanza indice del arreglo
	j loop
	
done:
	 li a7,10
	 ecall
	  
	    
	
	
	
	
	
	
