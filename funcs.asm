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


; pass dx 
; pass bx 
drawVerticalLine:
    mov ah, 0ch
    loopVertical:
    dec dx
    cmp dx,bx
    je retVertical
    int 10h
    jmp loopVertical

retVertical:
ret

drawHorisontalLine:
    mov ah, 0ch
    loopHorisontal:
    dec cx   
    cmp cx,bx
    je retHorisontal
    int 10h
    jmp loopHorisontal

retHorisontal:
ret

drawDUL:
    mov ah,0ch
    loopDUL:
    dec cx ; 200 200-199   <--<  
    dec dx ; 100   bx:0
    cmp dx,bx
    je retDUL
    int 10h
    jmp loopDUL


retDUL:
ret

drawDUR:
    mov ah,0ch
    loopDUR:
    inc cx ; 
    dec dx ; 
    cmp dx,bx
    je retDUR
    int 10h
    jmp loopDUR


retDUR:
ret