%include "io.inc"
section .bss

section .text
global CMAIN
CMAIN:
cycle: 
    GET_CHAR ah
    cmp ah,'.'
    je end
    cmp ah, '0'
    jb skip; '0'>ah
    cmp ah, '9'
    ja skip; '9'<ah
    je nine
    add ah, 1
    skip:
        PRINT_CHAR ah
        jmp cycle
nine:
    mov ah, '0'
    PRINT_CHAR ah
    jmp cycle

end:
    xor eax, eax
    ret