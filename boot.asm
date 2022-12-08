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
    mov ax,0013h
    int 10h

    ;fucntion to draw stuff
    mov al,01h   ;color
    mov dx, 150  ; y 
    mov cx,110   ; x
    mov bx,50    ; final
    call drawVerticalLine


    mov al,02h
    mov dx,50
    mov cx,210
    mov bx,110
    call drawHorisontalLine


    mov al,0eh ;color
    mov dx,50  ;y
    mov cx,210  ;x
    mov bx,0
    call drawDUL

    mov al,0fh ;color
    mov dx,50  ;y
    mov cx,110 ;x
    mov bx,0
    call drawDUR
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