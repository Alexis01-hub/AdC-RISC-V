#EJERCIICIO 4
#Escribir un programa que busque el valor mínimo en un arreglo de N enteros de 32 bits
#y lo almacene en la dirección de memoria MINIMO.
		.data
ARREGLO: 	.word 5,1,12,30,10 #
N: 		.word 5
MINIMO: 	.word 0
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
		
		