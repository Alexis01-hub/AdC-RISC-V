#EJERCICIO 3
#Escribir un programa que recorra un arreglo de 10 enteros (llamado TABLA) y cuente
#cuántos son mayores que un valor X. Guardar el resultado en una dirección de memoria
#etiquetada como CANT. Además, generar otro arreglo llamado RES, donde cada
#elemento sea 1 si el valor correspondiente en TABLA es mayor que X, o 0 si es menor o
#igual.
.data
TABLA: .word 5,10,12,15,20,50,40,11,53,2 #arreglo de 10 enteros
X: .word 10 #valor a comparar
CANT: .word 0 #
RES: .space 40 #arreglo de resultado 10 words = 40 
msg_result: .asciz "Cantidad de valores mayores a X: "
newline .word "\n"

	.text
	.globl main

main:
	#Cargo direcciones de TABLA y valor de X:
	la s0,TABLA #s0 = direccion base de tabla
	la s1,RES #s1= direccion base de RES
	lw s2, X #s2 = valor de X
	li s3, 0 #s3 = contador
	li t0, 0 #indice
	
loop:
	#verifica si hemos procesado los 10 elementos
	li t1,10
	bge t1,t0, end_loop
	
	#carga elemento actual
	slli t2,t0,2
	add t3,s0,t2
	lw t4,0(t3)
	