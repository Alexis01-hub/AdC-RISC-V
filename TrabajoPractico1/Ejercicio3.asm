#EJERCICIO 3
#Secuencia de valores: Escribir un programa donde:
#○ x3 tome los valores 0,1,2,3,4,5...
#○ x4 tome los valores 0,3,6,9,12,15...
#○ x5 tome los valores 0,5,10,15,20,25... indefinidamente. Ejecutarlo paso a paso para verificar su funcionamiento

		.text
main:
		#Inicializamos en 0
		li x3, 0
		li x4, 0
		li x5, 0
		#inicializamos para incrementar la suma
		li x6, 3
		li x7, 5
loop:
	addi x3, x3, 1 #incrementa x3 en 1 en cada eiteración
	add x4, x4, x6 #incrementa x4 en 3 en cada eiteración
	add x5, x5, x7 #incrementa x5 en 5 en cada eiteración
	#llama nuevamente a "loop"
	j loop  
	
	#finaliza el programa
	li a7, 10
	ecall

