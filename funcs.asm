clearscreen:
    ;Cleaning the window by scrolling it up
        mov ax, 0600h
        mov bh,0fh
        xor cx,cx
        xor dx,dx
        int 10h
        call gotoxy
ret

gotoxy:
    ;Moving cursor to the start position
        mov ah,02h
        xor bx,bx
        int 10h 
ret

strwrite:
    mov ah,0eh
    loop:
        mov al,byte [si]
        inc si
        cmp al,0
        je stop
        int 10h
        jmp loop
    stop:
ret
