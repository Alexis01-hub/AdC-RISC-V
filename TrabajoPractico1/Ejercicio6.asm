#EJERCICIO 6
#Suma de los primeros N números naturales: Escribir un programa que calcule la
#suma de los primeros N números naturales
		.text
main:
		li a0, 10 #N natural
 		li t0, 0 #contador (i)
 		li t1, 0 #acumulador
 loop:
 	add t1, t1,t0 # sum = sum + 1
 	addi t0, t0, 1 # i++ 
 	ble t0, a0, loop # si i < N repetir
 	mv a1, t1
 	
 	#termina el programa
 	li a7,10
 	ecall