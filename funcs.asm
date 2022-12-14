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


drawpixel:
    mov ah,0ch
    int 10h
ret

drawVerticalLine:
    push dx
    loopVertical:
        dec dx
        cmp dx,bx
        je retVertical
        call drawpixel
    jmp loopVertical
retVertical:
pop dx
ret

drawHorisontalLine:
    push cx
    loopHorisontal:
        dec cx   
        cmp cx,bx
        je retHorisontal
        call drawpixel
    jmp loopHorisontal
retHorisontal:
pop cx
ret

drawSlopedLeft:  ;draws sloped line from bottom to the top
    push cx
    push dx
    lsl:
        dec cx ;moving to the left 
        dec dx ; moving up since y=0 is on the top of the screen
        cmp cx,bx
        je retlsl 
        call drawpixel
    jmp lsl
retlsl:
pop dx
pop cx 
ret

drawSlopedRight:  ;draws sloped line from bottom to the top
    push cx
    push dx
    lsr:
        inc cx ;moving to the right 
        dec dx ; moving up since y=0 is on the top of the screen
        cmp cx,bx
        je retlsl 
        call drawpixel
    jmp lsr
retlsr:
pop dx
pop cx
ret