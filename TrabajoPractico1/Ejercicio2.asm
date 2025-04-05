#EJERCICIO 2
#Asignación de registros: Escribir un programa que asigne los siguientes valores a
#los registros indicados: x3=3, x4=4, x5=5, x6=6, x7=x7 y x8=8. Ejecutarlo paso a
#paso para comprobar que funciona correctamente.
	
	.text
main:
	li x3, 3 #en gp guarda 3
	li x1,4 #en ra guarda 4
	li x5, 5 #en t0 guarda 5
	li x6, 6 #en t1 guarda 6
	li x7,7 #en t2 guarda 7
	li x8, 8 #en s0 guarda 8
	
	#instruccion que termina el programa
	li a7, 10
	ecall