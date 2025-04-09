#EJERCIICIO 4
#Escribir un programa que busque el valor mínimo en un arreglo de N enteros de 32 bits
#y lo almacene en la dirección de memoria MINIMO.
		.data
ARREGLO: 	.word 5,1,12,30,10 #
N: 		.word 5
MINIMO: 	.word 0
msg:        .string "El valor mínimo es: "  # Mensaje para mostrar

		.text
		.globl main
main:
		#inicializacion
		la s0,ARREGLO
		la t0,N
		lw s1,0(t0)	#s1 = N
		#inicializa registro
		li t1,0 	#t1 = indice i
		lw t2,0(s0)	#t2 = minimo actual = ARREGLO[0]
	loop:
		beq t1,s1,fin	#termina si i == N
		slli t3,t1,2 #offset
		add t4,s0,t3 #t4 = ARREGLO[i]
		lw t5,0(t4) #t5 = ARREGLO[i]
		
		#compara el minimo actual
		bge t5,t2,no_update	#si t5>= t2 salta
		mv t2,t5		#mueve el contenido de t5 a t2 (actualiza el minimo del arreglo)
		
	no_update:
		addi t1,t1,1 	#incrementa el indice
		j loop
		
	fin:
		la t6,MINIMO 	#carga direccion del MINIMO
		sw t2,0(t6)		#almacena el valor del minimo
		
		# Mostrar mensaje por terminal
  	 	 li a7, 4             # Código de llamada al sistema para print_string
   	 	la a0, msg           # Cargar dirección del mensaje
		ecall
    
   		 # Mostrar el valor mínimo (entero)
		li a7, 1             # Código de llamada al sistema para print_int
   		 mv a0, t2            # Cargar el valor mínimo
   		 ecall
		
		#termina programa
		li a7,10
		ecall
		
