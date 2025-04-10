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
        la a0,msg_original	# Muestra "Arreglo Original: "
        ecall
        
        jal print_original	# Salta para una subrutina donde escribira el arreglo original
        
        # ---- copia ARREGLO a RES ----
        la s0,ARREGLO        # carga direccion del ARREGLO
        la s1,RES	# carga direccion de RES
        la t0,N              # Carga dirección de N
        lw s2,0(t0)          # Carga valor de N
        li t0,0        # indice inicializado en 0
        
copy_loop:
        bge t0, s2,end_copy	# Si el indice es mayor o igual a N, entonces salta a otra subrutina (i >= N)
        slli t1,t0,2	# t1 = i * 4 (offset en bytes)
        add t2,s0,t1        # t2 = direccion del ARREGLO [i] (s0 + offset)
        lw t3, 0(t2)        # Carga ARREGLO[i] en t3
        add t4,s1,t1        # t4 = dirección de RES[i] (s1 + offset)
        sw t3,0(t4)        # Almacena t3 en RES[i]
        addi t0,t0,1        # incrementa el indice (i++)
       
        j copy_loop	# salto incondicional al inicio del bucle
        
end_copy:
        # ---- algoritmo Sort en RES ----
        la s1, RES	# carga direccion base de RES
        la t0,N		# indice externo (i)
        lw s2,0(t0)	#carga el indice externo N (i)
        li t0,0		#inicializa el indice externo (i)
        
outer_loop:
        bge t0,s2,end_sort	# si el indice i >= N , salta a end_sort
        mv t1,t0	# Copia el valor de t0(i) a t1 (j <- i)
        addi t2,t0,1        # t2 = j+1 = (i+1)
        
inner_loop:
        bge t2,s2, end_inner    # si j+1 >= N salta a end_inner
        slli t3,t2,2		# calcula el offset de RES[j]
        add t4,s1,t3		# Obtiene la direccion de RES[j]
        lw t5, 0(t4)        # t5 = valor de RES[j]
        slli t3,t1,2        # min_idx (indice minimo actual)
        add t6,s1,t3	    # direccion de RES[min_idx(indice minimo actual)]
        lw t6, 0(t6)        # t6 = RES[min_idx()indice minimo actual]
        bge t5,t6, no_update # si RES[j >= RES[min_idx(indice minimo actual)], salta a no_update
        mv t1,t2        # actualiza el minimo actual osea min_idx <- j
        
no_update:
        addi t2,t2,1        # incrementa indice j en 1
        j inner_loop	 # salto incondicional a inner loop
        
end_inner:
    # Intercambiar RES[i] y RES[min_idx]
    slli t3, t0, 2       # calcula offset para i (i * 4)
    add t4, s1, t3       # t4 = dirección RES[i]
    lw t5, 0(t4)         # t5 = valor actual de RES[i]
    slli t3, t1, 2       # t3 = min_idx * 4 offset para RES[min_idx(indice minimo actual)]
    add t6, s1, t3       # t6 = dirección RES[min_idx]
    lw a0, 0(t6)         # a0 = valor de RES[min_idx]
    #----operacion de intercambio-----
    sw a0, 0(t4)         # guarda el minimo en RES[i]
    sw t5, 0(t6)         # guarda el antiguo RES[i] en posicion min_idx
    #---- preparacion para nueva eiteracion-----
    addi t0, t0, 1       # i++ (avanza al sig elemento)
    j outer_loop	# salto incondicional al buble principal
            
end_sort:
        # ---- Mostrar arreglo ordenado RES ----
        li a7, 4		
        la a0, msg_ordenado
        ecall
        #---- llamada a la subrutina para imprimir el arrego RES
        jal print_res

        # ---- Terminar programa ----
        li a7, 10
        ecall

# Función para imprimir ARREGLO original
print_original:
        la t0, ARREGLO # direccion base del ARREGLO original
        la t1,N		# direcciond de la variable N
        lw t1,0(t1)	# valor de N (tamaño del arreglo)
        li t2, 0	#indice del bucle (i = 0 )
        
loop_original:
#----control del bucle----
        bge t2, t1, end_print_original # si indice >= N salta a end-print_original
        
        slli t3, t2, 2		# calculo de offset 
        add t4, t0, t3		# t4 = direccion de RES[i] (base * offset)
        #----impresion del elemento----
        lw a0, 0(t4) 	# en a0 = valord el ARREGLO[i]
        li a7, 1	# codigo para imprimir int
        ecall
        #----impresion de espacio----
        li a7, 4	#codigo para imprimir string
        la a0, espacio	
        ecall
        #----incremento de indice----
        addi t2, t2, 1	#i++
        j loop_original	#salto incondicional el bucle mismo
        
end_print_original:
        ret        # retorna al main

# Función para imprimir RES ordenado
print_res:
        la t0, RES # direccion del arreglo RES (ordenado)
        la t1,N		# direccion de N
        lw t1,0(t1)	# t1 = valor de N
        li t2, 0	# indice del bucle (i = 0)
        
loop_res:
        bge t2, t1, end_print_res	# si i >= N salta a end_pritn_res
        slli t3, t2, 2		# calcula offset
        add t4, t0, t3		# t4 = direccion RES[i]
        #----impresion de elemento----
        lw a0, 0(t4)	#valor de RES[i]
        li a7, 1
        ecall
        #---- impresion de separacion---
        li a7, 4
        la a0, espacio
        ecall
        #incrementa contador y salta
        addi t2, t2, 1
        j loop_res
        
end_print_res:
        ret 
	
		
		
	
