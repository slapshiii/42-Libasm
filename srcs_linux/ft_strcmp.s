
section .text
    global ft_strcmp

ft_strcmp:
        xor     ecx, ecx
loop:
        movzx   eax, BYTE [rdi+rcx]
        movzx   edx, BYTE [rsi+rcx]
        test    al, al
        je      end
        inc     rcx
        cmp     al, dl
        jne     end
        test    dl, dl
        jne     loop
end:
        xor     r8, r8
        cmp     al, dl
        je      exit
        sub     eax, edx
        xor     r8, r8
        test    eax, eax
        setg    r8b
        lea     r8, [r8 - 1 + r8]
exit:
        mov     rax, r8
        ret