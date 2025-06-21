include game.inc

.code

SetVideoMode proc
    mov AH, 0                         
    mov AL, 12h                        
    int 10h                            
    ret
SetVideoMode endp

MatchChar proc
    push CX
    push DI
    push AX

    inc CX                             
    cld                                

    repnz SCASB                        
    
    cmp CX, 0
    jne FoundChar                      
    
    mov DX, 0                         
    jmp ExitMatchChar                    
    
    FoundChar:
        mov DX, 1                      
        mov BX, DI                     
        dec BX                         
        dec DI                         
        mov AL, '.'                    

    stosb                              

    ExitMatchChar:
        pop AX
        pop DI
        sub BX, DI
        pop CX
    ret
MatchChar endp

QuestionProc proc near
    push AX
    push BX
    push CX
    push DX

    cld              
    call ShowQuestion
    mov CX, AX                         
    call ShowQMarks                
    mov guessedChars, AX                    
    mov maxChances, 6                      
    mov QCursor, 48                     
    mov CX, AX                         

    WhilePQ:
        cmp maxChances, 0
        je LoseExitBridge
        cmp guessedChars, 0
        je WinExitBridge

    mov AH, 0
    int 16h
    jmp InputBridge

    LoseExitBridge:
        jmp LoseExit

    WinExitBridge:
        jmp WinExit
    
    InputBridge:
        call MatchChar
        cmp DX, 1
        jne DECChance                 

    MatchRepeat:
        dec guessedChars                    
        add totalScore, 1             

    mov AH, 2
    mov DH, 27                         
    mov DL, 10                         
    add DL, BL                         
    mov BH, 0
    int 10h

    mov AH, 0Eh
    mov BL, 2                          
    int 10h
    call MatchChar
    cmp DX, 0
    je WhilePQ                         
    jmp MatchRepeat

    DECChance: 
        dec maxChances                     
        cmp totalScore, 0       
        je NextDraw                
        sub totalScore, 1             

    NextDraw:
        push DX
        mov DX, QCursor
        call WriteTChar
        inc QCursor
        pop DX
        push AX
        mov AL, 2
        cmp maxChances, 5
        je DRHead                   
        cmp maxChances, 4
        je DRBODY                   
        cmp maxChances, 3
        je DRRightHand             
        cmp maxChances, 2
        je DRLeftHand            
        cmp maxChances, 1                
        je DRRightLeg            
        cmp maxChances, 0
        je DRLeftLeg  

    DRHead:
        call DrawHead
        pop AX
        jmp WhilePQ

    DRBODY:
        call DrawBody
        pop AX
        jmp WhilePQ

    DRRightHand:
        call DrawRightHand
        pop AX
        jmp WhilePQ

    DRLeftHand:
        call DrawLeftHand
        pop AX
        jmp WhilePQ

    DRRightLeg:
        call DrawRightLeg
        pop AX
        jmp WhilePQ

    DRLeftLeg:
        call DrawLeftLeg
        pop AX
        jmp WhilePQ
        
    LoseExit:                       
        mov isGamed, 0
        jmp ExitQuestionProc

    WinExit:                      
        mov isGamed, 1

    ExitQuestionProc:
        pop DX
        pop CX
        pop BX
        pop AX
    ret
QuestionProc endp