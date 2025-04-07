#Ejecutar y analizar código:
	.text
	addi x3, x0, 10 #carga en x3 o gp 10
a:	#loop
	addi x3,x3,-1 #resta 10 - 1
	bgt x3,x0, a #salta a "a" si x3 es mayor a x0
	
	#finaliza el programa
	li a7, 10
	ecall
#¿Qué hace este código?
#decrementa el contador x3 de 10 hasta 0