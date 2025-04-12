#EJERCICIO 6
#Escribir un programa que, dado un arreglo de 10 bytes, genere dos nuevos arreglos:
#uno con los números pares (PAR) y otro con los números impares (IMPAR).
.data
ARREGLO: .word 2,3 # 8bytes
PAR: .word 0
IMPAR: .word 0

.text
.globl main

main:
#completar
	# carga
	la t0,ARREGLO
	la t1, PAR
	la t2, IMPAR
	
