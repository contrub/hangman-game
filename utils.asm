.code
StrTODec proc
    push BX
    push CX
    push DX
    @BeginProc:
        xor BX, BX
        xor CX, CX
        lodsb
        @InnerLoop:
            cmp al, '0'
            jnge @NotDigit
            cmp AL, '9'
            jnle @NotDigit
            and AX, 000Fh
            push AX
            mov AX, 10
            mul BX
            pop BX
            add BX, AX
            lodsb
            cmp al, 0DH
            jne @InnerLoop
        mov AX, BX
    @ExitProc:
        pop DX
        pop CX
        pop BX
        ret
    @NotDigit:
        jmp @BeginProc
StrTODec endp
BinTODec proc
    push AX
    push CX
    push DX
    @EndIF:
        xor CX, CX
        mov BX, 10d
    @LoopRepeat:
        xor DX, DX
        div BX
        push DX
        inc CX
        or AX, AX
        jne @LoopRepeat
    mov BX, CX
    @LoopPrint:
        pop AX
        or al, 30h
        stosb
    loop @LoopPrint
    pop DX
    pop CX
    pop AX
    ret
BinTODec endp