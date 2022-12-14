[bits 16]
[org 7c00h]
;init vga mode to 80x25 just in case?
    mov ax,00003h
    int 10h
    call clearscreen

;cursor shape just for fun and future use
    mov ch,5
    mov cl,7
    mov ax,0100h
    int 10h
    
    push cs
    pop es
    mov bp , msg1
    mov bx,001eh
    mov cx, msg1end - msg1
    mov dx,0h
    call strwrite
    
    mov bp , msg2
    mov bx,000bh
    mov cx, msg2end - msg2
    mov dx,0c17h
    call strwrite

    mov bp , msg3
    mov bx,006ch
    mov cx, msg3end - msg3
    mov dx,1832h
    call strwrite
    ;set screen into 320x200 graphical mode
    ;middle - 160,100
    ;cube = 
    ;       110-210 <- x
    ;       50-150  <- y
    mov ax,0013h
    int 10h

    ;Drawing stuff:
    ;Since the interrupt call takes ax,cx and dx
    ;Bx will be used to pass the stopping point to the function
    ;Drawing the house roof
    mov al,14  ;in yellow
    mov bx,160
    mov cx,210
    mov dx,50
    call drawSlopedLeft   
    mov bx,160
    mov cx,110
    mov dx,50
    ;Drawing house box
    call drawSlopedRight
    mov al,1  ;in blue
    mov dx,150
    mov cx,210
    mov bx,50 
    call drawVerticalLine
    mov cx,110
    call drawVerticalLine
    mov dx,150
    mov cx,210
    mov bx,110
    call drawHorisontalLine
    mov dx,50
    call drawHorisontalLine
    ;drawing the window
    mov al,4 ; in red
    mov dx,90
    mov bx,70 
    mov cx,120
    call drawVerticalLine
    mov cx,130
    call drawVerticalLine
    mov cx,140
    call drawVerticalLine
    
    mov dx,90
    mov cx,140
    mov bx,120
    call drawHorisontalLine
    mov dx,80
    call drawHorisontalLine
    mov dx,70
    call drawHorisontalLine
    
    mov al,15
    mov bx,145
    mov cx,190
    mov dx,75
    call drawHorisontalLine
    mov dx,150
    call drawHorisontalLine
    mov bx,75
    mov cx,190
    mov dx,150
    call drawVerticalLine
    mov cx,145
    call drawVerticalLine

end:
    jmp $
%include "funcs.asm"
msg1 db "FAF-201 18/11/2022"
msg1end:
msg2 db "This is some data for lab work #1"
msg2end:
msg3 db "Some cool stuff text thing"
msg3end:
times 510-($-$$) db 0
db 0x55,0xaa