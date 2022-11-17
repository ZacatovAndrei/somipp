clearscreen:
    ;Cleaning the window by scrolling it up
        mov ax, 0600h
        mov bh,1eh
        mov cx,0
        mov dx,184fh
        ;xor dx,dx
        int 10h
        push 0
        call gotoxy
ret

gotoxy:
    ;Moving cursor to the start position
        push dx
        push bx
        mov bp,sp
        mov dx,[bp+08]
        mov ax,0200h
        xor bx,bx
        int 10h 
        pop bx
        pop dx
ret 2

strwrite:
    mov ah,13h
    mov al,1
    int 10h
ret
