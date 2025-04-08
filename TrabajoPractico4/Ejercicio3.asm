#EJERCICIO 3
#Escribir un programa que recorra un arreglo de 10 enteros (llamado TABLA) y cuente
#cuántos son mayores que un valor X. Guardar el resultado en una dirección de memoria
#etiquetada como CANT. Además, generar otro arreglo llamado RES, donde cada
#elemento sea 1 si el valor correspondiente en TABLA es mayor que X, o 0 si es menor o
#igual.
.data
TABLA:      .word 5,10,12,15,20,50,40,11,53,2  # Arreglo de 10 enteros
X:          .word 10                            # Valor a comparar
CANT:       .word 0                             # Resultado del conteo
RES:        .space 40                          # Arreglo de resultados (10 words = 40 bytes)
msg_result: .asciz "Cantidad de valores mayores a X: "
newline:    .asciz "\n"

.text
.globl main

main:
    # Cargar direcciones y valores iniciales
    la s0, TABLA        # s0 = dirección base de TABLA
    la s1, RES          # s1 = dirección base de RES
    la t5, X            # Cargar dirección de X
    lw s2, 0(t5)        # s2 = valor de X
    li s3, 0            # s3 = contador (inicializado a 0)
    li t0, 0            # t0 = índice (i)

loop:
    # Verificar si hemos procesado los 10 elementos
    li t1, 10
    bge t0, t1, end_loop  # CORRECCIÓN: Comparación correcta (t0 >= t1)

    # Cargar elemento actual de TABLA
    slli t2, t0, 2      		# Convertir índice a offset (i × 4)
    add t3, s0, t2      		# Dirección de TABLA[i]
    lw t4, 0(t3)        		# t4 = TABLA[i]

    # Comparar con X
    ble t4, s2, menor_igual  # Si TABLA[i] <= X, saltar

    # Caso TABLA[i] > X
    li t5, 1            # RES[i] = 1
    addi s3, s3, 1      # Incrementar contador
    j store_result

menor_igual:
    li t5, 0            # RES[i] = 0

store_result:
    # Almacenar en RES[i]
    add t6, s1, t2      # Dirección de RES[i]
    sw t5, 0(t6)        # Guardar 1 o 0 en RES[i]

    # Incrementar índice y continuar
    addi t0, t0, 1
    j loop

end_loop:
    # Guardar resultado en CANT
    la t6, CANT
    sw s3, 0(t6)        # Almacenar el contador en CANT

    # Mostrar resultado por pantalla
    li a7, 4
    la a0, msg_result
    ecall

    li a7, 1
    mv a0, s3
    ecall

    li a7, 4
    la a0, newline
    ecall

    # Salir del programa
    li a7, 10
    ecall