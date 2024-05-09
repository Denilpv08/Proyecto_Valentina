.model small
.stack 64

.data
    ; Declarar variables
    texto db "Multiplicacion de 2 numeros$"
    mensaje1 db 13,10, "Ingrese el primer dígito: $"
    num1 db 0
    mensaje2 db 13, 10, "Ingrese el segundo dígito: $"
    num2 db 0
    resultado db 13, 10, "El resultado de la multiplicación es: $"
    producto db 0

.code
; Hacemos la operacion matematica
operacion PROC far
    mov ax, @data
    mov ds, ax

    ; Mostrar texto 
    lea dx,texto
    mov ah, 9h
    int 21h

    ; Mostrar mensaje para ingresar el primer dígito
    lea dx,mensaje1
    mov ah, 9h
    int 21h

    ; Leer el primer dígito
    mov ah, 01
    int 21h
    sub al, 30h      ; Convertir los valores en numerico
    mov num1, al       ; Almacenar el primer dígito 

    ; Mostrar mensaje para ingresar el segundo dígito
    lea dx,mensaje2
    mov ah, 9h
    int 21h

    ; Leer el segundo dígito
    mov ah, 01
    int 21h
    sub al, 30h      ; Convertir los valores en numerico
    mov num2, al       ; Almacenar el segundo dígito 

    ; Texto de resultado 
    lea dx,resultado
    mov ah,9h
    int 21h

    ; Multiplicar los dos dígitos
    mov al, num1       
    mul num2           
    add al, 30h    ; Convertir los caracteres a numerico
    mov producto, al       ; Divisor para obtener el dígito de las unidades
    
    ; Mostrar resultado
    mov ah, 02
    mov dl, producto
    int 21h

    mov ah, 4Ch      ; Salir del programa
    int 21h
.exit
operacion ENDP

end operacion
