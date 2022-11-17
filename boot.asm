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
    mov bx,0014h
    mov cx, msg1end - msg1
    mov dx,0h
    call strwrite
    

    ;push 0c17h
    ;call gotoxy

    mov bp , msg2
    mov bx,0001h
    mov cx, msg2end - msg2
    mov dx,0c17h
    call strwrite

    ;push 1832h
    ;call gotoxy

    mov bp , msg3
    mov bx,006ch
    mov cx, msg3end - msg3
    mov dx,1832h
    call strwrite
jmp $
%include "funcs.asm"
msg1 db "OOF-STUFF 18/11/2022"
msg1end:
msg2 db "This is some data for lab work #1"
msg2end:
msg3 db "Some cool stuff text thing"
msg3end:
times 510-($-$$) db 0
db 0x55,0xaa
