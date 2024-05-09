.model small
.stack
.data
; Colocar en varibles los datos
nombre db "Nombre:$"
nombre2 db 13,10, "Valentina Maldonado Rodriguez$"    
numeroID db 13,10, "Numero de identidad:$" 
numeroID2 db 13,10, "1003232239$"              

.code
; Mostrar en pantalla el nombre y el numero de identificacion 
main proc
    mov ax,@data
    mov ds,ax

    lea dx,nombre
    mov ah,9h
    int 21h

    lea dx,nombre2
    mov ah,9h
    int 21h

    lea dx,numeroID
    mov ah,9h
    int 21h

    lea dx,numeroID2
    mov ah,9h
    int 21h

    ;Cerrando programa
    mov ax,4c00h
    int 21h

.exit

; Finalizando el proceso
main endp
end main