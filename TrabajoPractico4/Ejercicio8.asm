#EJERCICIO 8
#Escribir un programa que, dados dos arreglos A y B de 15 enteros, reemplace en A,
#aquellos elementos que tengan un 1 en los bits 3 y 12, por los valores correspondientes
#del arreglo B.
.data
A:  .word 0x1109, 0x1008, 0x0008, 0x1000, 0x1234, 0x5678, 0x9ABC, 0xDEF0, 0x1001, 0x2002, 0x3003, 0x4004, 0x5005, 0x6006, 0x7007
B:  .word 0xFFFF, 0xEEEE, 0xDDDD, 0xCCCC, 0xBBBB, 0xAAAA, 0x9999, 0x8888, 0x7777, 0x6666, 0x5555, 0x4444, 0x3333, 0x2222, 0x1111
N: .word 15 #longitud del arreglo

.text
.globl main
main:
	# Inicializo
	la t0, A
	la t1, B
	la a1, N
	lw t2, 0(a1)	
	li t3, 0	# indice del buble (i=0)
	
loop:
	# verifica si continua.
	bge t3,t2, end	# si indice >= a N entonces salta a end
	# calculamox desplazamiento (i*4)
	slli t4,t3, 2	# i* 4 desplazamiento en bytes
	
	# obtener A[i]
	add t5, t0, t4	#obtengo la posicion A[i]
	lw t6,0(t5)	#guardo A[i]
	
	# Crear mascara de el 3 bit y 12
	li t5, 0x1008	# Mascara para el bit 3 y 12
	
	# verifica con mascara
	and t6, t6, t5 # aplica mascara
	beq t6, t5, replace #si el resultado del and (t6) es igual a la mascara, entonces salta
continue:
	addi t3,t3,1 	# incrementa indice
	j loop
	
replace:
	#obtener B[i]
	add t5, t1, t4 # direccion de B[i]
	lw t6, 0(t5)	# t6 = B[i]
	
	#almacena B[i] en A[i]
	add t5, t0, t4	# direccion de A[i]
	sw t6, 0(t5)	#almaceno B[i] en A[i]
	j continue
	
end:
	li a7,10
	ecall
	
	
