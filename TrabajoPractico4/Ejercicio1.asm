#EJERCICIO 1
#Escribir un programa que lea dos números enteros desde el teclado, los sume y
#muestre el resultado por pantalla
	.data
prompt1: .asciz "Introduce el primer número: " #Mensaje de ingreso de un numero
prompt2: .asciz "Introduce el segundo número: " #mensaje de ingreso de segundo numero
result:  .asciz "La suma es: " #mensaje de suma
newline: .asciz "\n" #salto de linea
	.text
	.globl main
main:
	#mostrar el primer prompt
	li a7,4 #codigo de llamada al sistema para printf
	la a0,prompt1 #direccion del string a imprimir
	ecall
	
	#leer el primer entero
	li a7,5 #codigo de llamada para read_int
	ecall
	mv t0,a0 #guarda el numero a t0
	
	#mostrar el segundo prompt
	li a7,4
	la a0,prompt2
	ecall
	
	#leer el segundo entero
	li a7,5
	ecall
	mv t1,a0 #guarda el segundo entero en t1
	
	#calcular suma
	add t2,t1,t0 #t2= t1 + t0
	
	#mostrar mensaje de resultado
	li a7,4
	la a0,result
	ecall
	
	#mostrar el resultado
	li a7,1 #codigo de llamada a print_int
	mv a0,t2
	ecall
	
	#imprimir salto de linea
	li a7,4
	la a0,newline
	ecall
	
	#salir del programa
	li a7,10
	ecall
	
	
	
