%include "io.inc"
section .bss
N resd 1
a resd 1
number resd 1
section .text
global CMAIN
CMAIN:
    xor ebx, ebx
    GET_UDEC 4, N
for:
    xor dword[N], 0 
    jz loop_end; if n==0
    GET_DEC 4, a
    dec dword[N]
    mov eax, dword[a];eax=a текущее
    xor ecx, ecx; count=0
cycle:
    cmp ecx, 5
    jae reassign; ecx>=5
    xor eax, 0
    jz for
    shr eax, 1
    jc counter
    xor ecx, ecx; встретили 0 зануляем счётчик
    jmp cycle
counter:
    inc ecx
    jmp cycle
reassign:
    inc ebx
    jmp for
loop_end:
    mov dword[number], ebx
    PRINT_DEC 4, [number]
    xor eax, eax
    ret