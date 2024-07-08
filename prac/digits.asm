%include "io.inc"

section .text
global CMAIN
CMAIN:
    GET_DEC 4, eax
    xor ebx, ebx
    mov ecx, 10
    while:
        xor eax, 0
        jz end
        inc ebx
        cdq
        div ecx
        jmp while
   
    end:
        xor ebx, 0
        jne nozero
         
        inc ebx
    
        nozero:
            PRINT_DEC 4, ebx
    xor eax, eax
    ret