

section .text
global first_rule
global second_rule

first_rule:
    ;replace all numbers with letters (number as letter's number in alphabet)
    push ebp
    mov ebp, esp
    mov edx, dword[ebp+8]; edx=text
    mov eax, dword[ebp+8]
    .while:
        cmp byte[edx], 0
        je .end
        ;is it number? (>=1 and <=9)
        cmp byte[edx], '1'
        jge .num1; >=1
        inc edx
        jmp .while 
        .num1:
            cmp byte[edx], '9'
            jle .num2; <=9
            inc edx
            jmp .while
            .num2:
                mov cl, '1'
                sub byte[edx], cl; number of letter
                mov cl, 'a'
                add byte[edx], cl; replacement with a letter
                inc edx
                jmp .while
    .end:
    
    leave
    ret


second_rule:
    ;numbers must be first
    push ebp
    mov ebp, esp
    
    ;take memory in stack
    
    sub esp, 104
    
    mov eax, esp ;first element in stack as massiv
    mov edx, dword[ebp+8]; edx= *s
    
    xor ecx, ecx; elem
    
    ;write numbers in stack
    
    .cycle1:
        mov cl, byte[edx]
        test cl, cl; end of stack (zero bite)
        jz .end_c1
        cmp cl, '0'
        jb .continue_c1
        cmp cl, '9'
        ja .continue_c1
        mov byte[eax], cl
        inc eax
    .continue_c1:    ; isn't number
        inc edx
        jmp .cycle1
     .end_c1:
     
        mov edx, dword[ebp+8]
        
    ; write letters in stack
    .cycle2:
        mov cl, byte[edx]
        test cl, cl
        jz .end_c2
        cmp cl, '0'
        jb .sym_2
        cmp cl, '9'
        ja .sym_2
        jmp .continue_c2
    .sym_2:    ;letters
        mov byte[eax], cl
        inc eax
    .continue_c2:  ;isn't letters
        inc edx
        jmp .cycle2
     .end_c2:
     
        mov byte[eax], 0; end of string (in stack)
        
        mov edx, dword[ebp+8]
        mov eax, esp
        
     ;rewrite string (s=stack) 
     .cycle_3:
        mov cl, byte[eax]
        mov byte[edx], cl
        test cl, cl
        jz .end_c3
        inc eax
        inc edx
        jmp .cycle_3
    .end_c3        
        
        xor eax, eax
        
        ;come back to AB
        add esp, 104
        leave
        ret
