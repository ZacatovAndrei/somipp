[org 7c00h]
;init vga mode to 80x25 just in case?
    mov ax,00003h
    int 10h

    call clearscreen

;cursor shape just for fun and future use
    mov ch,5
    mov cl,7
    mov ah, 1
    int 10h
    
    
    lea si,msg1
    call strwrite

    mov dx,0c17h
    call gotoxy
    lea si,msg2
    call strwrite
    mov dx,1832h
    call gotoxy
    lea si,msg3
    call strwrite
jmp $
%include "funcs.asm"
msg1 db "FAF-201, 18/11/2022",0
msg2 db "This is some data for lab work #1",0
msg3 db "Some cool stuff text thing",0
times 510-($-$$) db 0
db 0x55,0xaa
