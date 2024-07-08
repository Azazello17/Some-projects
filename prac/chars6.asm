%include "io.inc"
section .bss

section .text
global CMAIN
CMAIN:
xor ecx, ecx
cycle1: 
    GET_CHAR ah
    mov bl, ah
    cycle2:
        GET_CHAR al
        cmp al, ','
        je end2
        cmp al, '.'
        je end1
        mov bl, al
        jmp cycle2
    end2:
        cmp bl,ah
        je plus
        jmp cycle1
        plus:
            inc ecx
            jmp cycle1
    end1:            
        cmp bl,ah
        je pl
        jmp end
        pl:
            inc ecx

end:
    PRINT_UDEC 4, ECX
    xor eax, eax
    ret