%include "io.inc"


section .text
global CMAIN
CMAIN:
    GET_DEC 4, eax
    mov ebx, 3
    xor ecx, ecx
    while:
        cmp eax, 1
        jle end
        xor edx, edx
        div ebx
        cmp edx, 0
        jne end1
        inc ecx
        jmp while
        
        
    end1:
        mov ecx, -1
        
    end: 
        PRINT_DEC 4, ecx
    xor eax, eax
    ret