#EJERCICIO 5
#A partir del ejercicio anterior, implementar un algoritmo que ordene el arreglo de menor
# a mayor. El arreglo ordenado debe almacenarse en uno nuevo llamado RES
.data
ARREGLO:    .word 5,1,12,30,10   # Estos son los números desordenados (como juguetes tirados)
RES:        .word 0,0,0,0,0      # Aquí guardaremos los números ordenados (como estantes vacíos)
N:          .word 5               # Cuántos números tenemos (5 juguetes)
msg_original: .string "Arreglo Original: "  # Mensaje para mostrar
msg_ordenado: .string "\nArreglo ordenado(RES): "  # Otro mensaje
espacio:    .string " "           # Un espacio para separar los números

.text
.globl main
main:
        # --- mostrar arreglo original ---
        li a7,4
        la a0,msg_original
        ecall
        
        jal print_original
        
        # ---- copia ARREGLO a RES ----
        la s0,ARREGLO        # carga direccion del ARREGLO
        la s1,RES
        la t0,N              # Carga dirección de N
        lw s2,0(t0)          # Carga valor de N
        li t0,0        # indice
        
copy_loop:
        bge t0, s2,end_copy
        slli t1,t0,2
        add t2,s0,t1        # direccion ARREGLO[i]
        lw t3, 0(t2)        # t3 = ARREGLO[i]
        add t4,s1,t1        # direccion de RES[i]
        sw t3,0(t4)        # RES[i] = ARREGLO[i]
        addi t0,t0,1        # i++
        j copy_loop
        
end_copy:
        # ---- algoritmo Sort en RES ----
        la s1, RES
        la t0,N
        lw s2,0(t0)
        li t0,0
        
outer_loop:
        bge t0,s2,end_sort
        mv t1,t0
        addi t2,t0,1        # t2 = j = i+1
        
inner_loop:
        bge t2,s2, end_inner    
        slli t3,t2,2
        add t4,s1,t3
        lw t5, 0(t4)        # t5 = RES[j]
        slli t3,t1,2        # min_idx
        add t6,s1,t3
        lw t6, 0(t6)        # t6 = RES[min_idx]
        bge t5,t6, no_update
        mv t1,t2        # min_idx = j
        
no_update:
        addi t2,t2,1        # j++
        j inner_loop
        
end_inner:
    # Intercambiar RES[i] y RES[min_idx]
    slli t3, t0, 2       # i * 4
    add t4, s1, t3       # t4 = dirección RES[i]
    lw t5, 0(t4)         # t5 = RES[i]
    slli t3, t1, 2       # min_idx * 4
    add t6, s1, t3       # t6 = dirección RES[min_idx]
    lw a0, 0(t6)         # a0 = RES[min_idx] (usamos a0 temporalmente)
    
    sw a0, 0(t4)         # RES[i] = RES[min_idx]
    sw t5, 0(t6)         # RES[min_idx] = RES[i]
    
    addi t0, t0, 1       # i++ (¡ahora seguro!)
    j outer_loop
            
end_sort:
        # ---- Mostrar arreglo ordenado RES ----
        li a7, 4
        la a0, msg_ordenado
        ecall
        jal print_res

        # ---- Terminar programa ----
        li a7, 10
        ecall

# Función para imprimir ARREGLO original
print_original:
        la t0, ARREGLO
        la t1,N
        lw t1,0(t1)
        li t2, 0
        
loop_original:
        bge t2, t1, end_print_original
        slli t3, t2, 2
        add t4, t0, t3
        lw a0, 0(t4)
        li a7, 1
        ecall
        li a7, 4
        la a0, espacio
        ecall
        addi t2, t2, 1
        j loop_original
        
end_print_original:
        ret        # retorna al main

# Función para imprimir RES ordenado
print_res:
        la t0, RES
        la t1,N
        lw t1,0(t1)
        li t2, 0
        
loop_res:
        bge t2, t1, end_print_res
        slli t3, t2, 2
        add t4, t0, t3
        lw a0, 0(t4)
        li a7, 1
        ecall
        li a7, 4
        la a0, espacio
        ecall
        addi t2, t2, 1
        j loop_res
        
end_print_res:
        ret 
	
		
		
	