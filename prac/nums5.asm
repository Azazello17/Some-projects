%include "io.inc"

section .text

global CMAIN
CMAIN:
    GET_DEC 4, eax
    xor edx, edx; кол-во перемены знаков 
    xor ebx, ebx
    shl eax, 1
    adc ebx, 0; ebc - старший бит
    
    while:
        GET_DEC 4, eax
        xor eax, 0
        jz end
        
        ;нахождение знака текущего
        
        xor ecx, ecx
        shl eax, 1
        adc ecx, 0
        
        
        cmp ecx, ebx; if not разные зкаки 
        je skip
        inc edx
        mov ebx, ecx
        
        skip:
            jmp while
        

end:
    PRINT_DEC 4, edx
        
    xor eax, eax
    ret