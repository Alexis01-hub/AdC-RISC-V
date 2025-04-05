# Programa hola mundo en RISC-V
	.data #Esta sección contiene las variables y datos que utiliza el programa.Aquí se definen cadenas
		#de texto, constantes y otros valores que se almacenan en memoria.

str: 	.asciz "TRalalero Tralala\n"
	.text #Esta sección contiene las instrucciones ejecutables del programa.
	      #Es donde se escribe la lógica del programa utilizando las instrucciones del conjunto RISC-V.
main:
	la a0, str #En el primer argumento guarda str en hexa.
	li a7, 4 #en a7 guarda 4 oq hace referencia a una cadena de caracteres.
	ecall #busca a7 para saber que operacion hacer
	
	#codigo para cerrar el programa...
	li a7, 10 
	ecall
