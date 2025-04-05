# Programa hola mundo en RISC-V
	.data #Esta sección contiene las variables y datos que utiliza el programa.Aquí se definen cadenas
		#de texto, constantes y otros valores que se almacenan en memoria.

str: 	.asciz "Hola mundo en RISC-V!\n"
	.text #Esta sección contiene las instrucciones ejecutables del programa.
	      #Es donde se escribe la lógica del programa utilizando las instrucciones del conjunto RISC-V.
main:
	la a0, str
	li a7, 4
	ecall
	li a7, 10
	ecall
