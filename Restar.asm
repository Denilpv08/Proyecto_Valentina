.model small
.stack 100h

.data
    mensaje1 db "Ingrese el primer dígito: $"
    mensaje2 db 13, 10, "Ingrese el segundo dígito: $"
    resultado db 13, 10, "El resultado de la resta es: $"

.code
main proc
    mov ax, @data
    mov ds, ax

    ; Mostrar mensaje para ingresar el primer dígito
    mov dx, offset mensaje1
    mov ah, 09h
    int 21h

    ; Leer el primer dígito
    mov ah, 01h
    int 21h
    sub al, 30h      ; Convertir de ASCII a número
    mov bl, al       ; Almacenar el primer dígito en BL

    ; Mostrar mensaje para ingresar el segundo dígito
    mov dx, offset mensaje2
    mov ah, 09h
    int 21h

    ; Leer el segundo dígito
    mov ah, 01h
    int 21h
    sub al, 30h      ; Convertir de ASCII a número
    sub bl, al       ; Restar el segundo dígito al primer dígito

    ; Convertir el resultado de la resta a ASCII
    add bl, 30h

    ; Mostrar el resultado de la resta
    mov dx, offset resultado
    mov ah, 09h
    int 21h

    mov dl, bl       ; Cargar el resultado en DL
    mov ah, 02h
    int 21h

    mov ah, 4Ch      ; Salir del programa
    int 21h
main endp

end main
