%include "io.inc"

section .text
global CMAIN
CMAIN:
    mov eax, 1
    mov ebx, 1
while:
    cmp eax, 100000
    ja end
    mov ecx, eax
    add eax, ebx; текущий
    mov ebx, ecx
    jmp while
end:
    PRINT_UDEC 4, eax
    xor eax, eax
    ret