

section .data
		msg1 db 'Ingrese 5 numeros y presione enter' ,0xA, 0xD ; decorador para enter
		len1 equ $-msg1
		
		arreglo db 0,0,0,0,0
		len_arreglo equ $-arreglo

section .bss
		dato resb 2
		num resb 2
		
section .text
		global _start
		
		
_start:
;se define el arreglo en los  registros indices contamaño y posicion 
	mov esi, arreglo 
	mov edi, 0
	
	mov eax, 4
	mov ebx, 1
	mov ecx, msg1
	mov edx, len1
	int 80h
	
	leer:
	mov eax, 3
	mov ebx, 2
	mov ecx, dato
	mov edx, 2
	int 80h
	


	
	


	
	
	
	mov al, [dato]
	sub al, '0' ; se convierte a decimal
	

	mov [esi], al
	
	
	add edi, 1 ; incrementamos el edi en +1
	add esi, 1 
	
	cmp edi, len_arreglo
	jb leer
	
	mov ecx, 0
	;mov bl, 0
	
	
	
	
	imprimir:
	push ecx
	mov al,[arreglo + ecx]
	add al, '0'
	
	
	mov [dato], al

	add al, '0'
	

	mov eax, 4
	mov ebx, 1
	mov ecx, dato
	mov edx, 1
	int 80h
	
		mov eax, 4
	mov ebx, 1
	mov ecx, num
	mov edx, 2
	int 80h

	pop ecx
	inc ecx
	cmp ecx, len_arreglo
	 jb imprimir
	




	
	salir:

	
	
	
	mov eax, 1
	int 80h
