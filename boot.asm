[org 0x7c00]

start:
    ; Imprimir mensaje ASCII carácter por carácter
    mov si, mensaje

.loop:
    lodsb                   ; AL ← siguiente byte, SI++
    cmp al, 0               ; ¿Fin de cadena?
    je  halt
    cmp al, 10              ; ¿Salto de línea?
    jne .print
        ; CR + LF
        mov ah, 0x0E
        mov al, 13
        int 0x10
        mov al, 10
        int 0x10
        jmp .loop

.print:
    mov ah, 0x0E            ; Teletype output
    mov bh, 0x00            ; Página 0
    mov bl, 0x07            ; Color: blanco sobre negro
    int 0x10
    jmp .loop

halt:
    jmp halt                ; Bucle infinito

; ---------- LOGO ASCII ----------
mensaje db " _   _ _____ _____ __  __",10
        db "| | | |_   _| ____|  \/  |",10
        db "| | | | | | |  _| | |\/| |",10
        db "| |_| | | | | |___| |  | |",10
        db "|_ _ _| |_| |_____|_|  |_|",10
        db "",10
        db " Bienvenido a tu OS UTEM!",10
        db 0
; ---------------------------------




times 510-($-$$) db 0
dw 0xAA55
