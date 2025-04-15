#EJERCICIO 9
#Escribir un programa que, dada una matriz de 3x3 enteros (word), calcule el valor
#máximo de cada fila y lo almacene en un arreglo llamado MAX.
		.data
MATRIZ:		.word 5,4,3, 	#fila 0
		.word 2,6,1,	#fila 1
		.word 9,7,6	#fila 2
MAX:		.space 12	# 3 * 4 = 12 (guardara 3 enteros)
		.text
		.globl main
main:
	# inicializamos
	la t0,MATRIZ
	la t1, MAX		
	li t2, 0		#indice i para la fila
	j loop_filas
	
	li a7,10
	ecall
loop_filas:
	li t3, 0 		#indice j para columnas
	li t6, 3		#numero de columnas
	
	# calcular  la direccion del primer elemento
	mul t4, t2, t6		# multiplica fila por columna
	
	mv a3,t4
	
	slli a4, a3, 2		# offset en bytes
	add t5, t0, a4		# t5 <- direccion de MATRIZ[i][0]
	
	mv a0, t5
	
	lw a1, 0(a0)		#t7 <- MATRIZ[i][0] (max inicial)
	
	li t3,1			# empezamos siguiente columna 
loop_columnas:
	bge t3, t6, fin_fila	#si columnas >= 3 salta
	
	#calcular direccion 
	mul t4, t2, t6		# fila * 3
	
	mv a5, t4
	
	add a5, a5, t3		# + columnas ???
	slli a5, a5, 2		# offset
	
	add a6, t0, a5		# a6 <- MATRIZ[i][j]
	lw t5, 0(a6)		#
	
	# compara con max 
	bge t5, a1, actualizar_max	# si t5 >= a1 salta
	
	j seguir
actualizar_max:
	mv a1, t5	#nuevo max
	
seguir:
	addi t3, t3,1	#j++
	j loop_columnas
fin_fila:
	#guardar max en MAX [i]
	slli t5, t2, 2	#offset
	mv a7,t5 
	add t5, t1, a7
	mv s1, t5
	sw t5, 0(s1)
	
	addi t2,t2,1 	#i++
	li s2, 3
	blt t2, s2, loop_filas
	jr ra 
	
