#EJERCICIO 5
#Uso de li y mv: Escribir un programa para inicializar los registros x5, x6, x7, x8 con
#los valores 5, 6, 7 y 8 respectivamente usando li. Luego, transferir estos valores a los
#registros x15, x16, x17 y x18 usando mv. Contar cuántas instrucciones tiene el
#programa.

		.text
main:
		#Carga los valores que transfiere
		li x1,5
		li x2,6
		li x3,7
		li x4, 8
		#copia los valores anteriores a un nuevo registro
		mv x15,x1
		mv x16, x2
		mv x17,x3
		mv x18,x4
		#termina programa
		li a7,10
		ecall
