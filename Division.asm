.model small
.stack 64

; Declaracion de variables
.data
    texto db "Division de 2 numeros$"
    mensaje1 db 13,10, "Ingrese el dividendo: $"
    num1 db 0
    mensaje2 db 13, 10, "Ingrese el divisor: $"
    num2 db 0
    resultado db 13, 10, "El resultado de la division es: $"
    cociente db 0

.code

; Operacion 
operacion PROC far
    mov ax, @data
    mov ds, ax

    ; Mostrar mensaje de encabezado
    lea dx, texto
    mov ah, 09h
    int 21h

    ; Mostrar mensaje para ingresar el dividendo
    lea dx, mensaje1
    mov ah, 09h
    int 21h

    ; Leer el dividendo
    mov ah, 01h
    int 21h
    sub al, 30h      ; Convertir caracteres a número
    mov num1, al     ; Almacenar el dividendo

    ; Mostrar mensaje para ingresar el divisor
    lea dx, mensaje2
    mov ah, 09h
    int 21h

    ; Leer el divisor
    mov ah, 01h
    int 21h
    sub al, 30h      ; Convertir caracteres a número
    mov num2, al     ; Almacenar el divisor 

    ; Division
    mov al, num1     ; Mover el dividendo a AL
    mov bl, num2     ; Mover el divisor a BL
    xor ah, ah       ; Limpiar AH (resto)
    div bl           ; AL = AL / BL, AH = AL % BL

    ; Convertir el cociente a caracter
    add al, 30h      ; Convertir a caracter
    mov cociente, al ; Almacenar cociente

    ; Mostrar el resultado de la división
    lea dx, resultado
    mov ah, 09h
    int 21h

    ; Mostrar cociente
    mov ah, 02h
    mov dl, cociente
    int 21h

    mov ah, 4ch      ; Salir del programa
    int 21h
operacion ENDP

end operacion
