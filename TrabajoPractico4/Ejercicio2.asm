#EJERCICIO 2
#Escribir un programa que lea un número entero desde el teclado y calcule su tabla de
#multiplicar del 1 al 10, mostrando cada resultado.
.data
prompt:     .asciz "Introduce un número entero: "
line_msg:   .asciz " x "
equals_msg: .asciz " = "
newline:    .asciz "\n"
	.text
	.globl main
main:
	#mostrar msg para pedir numero
	li a7,4 #print
	la a0,prompt
	ecall
	
	#leer int
	li a7,5 #read_int
	ecall
	mv t0,a0 #t0 = numero asignado
	
	#inicializar contador
	li t1,1

loop:
	#verificar si el contador llego a 10
	li t2,10
	bgt t1,t2,end_loop	#t1 > t2 salta a end_loop
	
	
	#imprimir numero base(t0)
	li a7,1 #imprime print_int
	mv a0,t0
	ecall
	
	#imprimir "x"
	li a7,4
	la a0,line_msg
	ecall
	
	#imprimir el multiplicador
	li a7,1
	mv a0,t1
	ecall
	
	#imprimir "="
	li a7,4
	la a0,equals_msg
	ecall
	
	#calculamos
	mul t3,t0,t1 #en t3 = t0 * t1
	li a7,1
	mv a0,t3
	ecall
	
	#salto de linea entre calculos
	li a7,4
	la a0,newline
	ecall
	
	#incrementamos contador y repetir
	addi t1,t1,1 #t1=t1+1
	j loop 
	
end_loop:
	#salir sistema
	li a7,10
	ecall

	
	
	
	
	