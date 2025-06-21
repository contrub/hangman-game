.model small
.stack 100h

include game.inc
include graphic.asm
include fileio.asm
include engine.asm
include utils.asm

.data
    gameTitle      DB 'Hangman'
    tCharsMsg      DB 'Pressed chars: '
    questionMsg    DB 'Question: '
    answerMsg      DB 'Answer: '
    endGameMsg     DB 'GAME ENDED'

    openFileErrMsg DB 0DH, 0Ah, 'OPEN ERROR - CODE '
    errCode        DB 30h, '$'

    QFile          DB 'Ques.txt', 0 
    AFile          DB 'Ans.txt', 0

    QSize          DW 0
    ASize          DW 0

    QPointer       DB 120 DUP (0)
    APointer       DB 120 DUP (0)

    BuffSize       DW 0
    QBuffer        DB 512 DUP (0)
    ABuffer        DB 512 DUP (0)
    SBuffer        DB 512 DUP (0)
    
    QHandle        DW ?
    AHandle        DW ?

    guessedChars   DW ?
    maxChances     DW 6

    QCursor        DW ?

    isGamed        DW ?
    totalScore     DB 0

.code
main proc
    mov AX, @data                     
    mov DS, AX                         
    mov ES, AX                         
    
    call SetVideoMode
    call SetBackgroundColor
    
    call DrawStartStand

    call GameTitleLbl
    call TCharsLbl
    call QuestionLbl
    call AnswerLbl
    
    lea DX, QFile                   
    mov AL, 0                          
    call OpenFile                      
    jc OpenFileErrBridge
    mov QHandle, AX                    
    
    lea DX, AFile                  
    mov AL, 0                          
    call OpenFile                     
    jc OpenFileErrBridge               
    mov AHandle, AX                    
    
    lea DX, QBuffer                     
    mov BX, QHandle                     
    call ReadFile                      
    or AX, AX
    je ExitBridge                      
    
    mov CX, AX                         
    lea DI, QPointer                 
    lea SI, QBuffer                    
    cld                             
        
    QLoop:
        cmp BYTE PTR [SI], 0Ah          
        je EndQLoop                    
        movSB                          
        inc QSize                      
        loop QLoop                     
        
    ReloadQBuffer:                     
        lea DX, QBuffer                 
        mov BX, QHandle                 
        call ReadFile                  
        or AX, AX
        je ExitBridge                  
        mov CX, AX                    
        lea SI, QBuffer                
        jmp QLoop                      
    
    ExitBridge:
        jmp ExitMainProc
    
    EndQLoop:
        movSB                          
        inc QSize                      
        mov AL, '$'
        stosb                          
        dec CX                        
        
    push SI
    push DI
    push AX
    push BX
    push CX
    push DX
                
    lea DI, APointer 
    mov AX, 0
    mov ASize, AX                     
    jmp Aloop                  

    OpenFileErrBridge:
        jmp OpenFileError
    
    Aloop:
        lea DX, ABuffer
        mov BX, AHandle
        push CX
        mov AH, 3Fh                 
        mov CX, 1                     
        int 21h                        
        pop CX
        cmp AX, 0                      
        je AddChar                    
        mov AL, [ABuffer + 0]          
        cmp AL, 0Ah
        je AddLineFeed                
        stosb                          
        inc ASize                      
        jmp Aloop
    
    AddLineFeed:
        stosb                          
        DEC ASize                      
    
    AddChar:                           
        mov AL, '$'
        stosb                          
        jmp NextLineSkip
     
    ReloadQBufferBridge:
        jmp ReloadQBuffer
    
    NextLineSkip:
        pop DX
        pop CX
        pop BX
        pop AX
        pop DI
        pop SI
        
    call ClearTChar

    push CX
    push SI
    push DI
        
    lea SI, QPointer
    lea DI, APointer
    mov CX, QSize
    sub CX, 2                         
    mov AX, ASize

    call QuestionProc

    cmp isGamed, 0
    je ExitMainProc                  

    mov AL, 0
    
    call DrawBody
    call DrawHead
    call DrawLeftHand
    call DrawRightHand
    call DrawRightLeg

    pop DI
    pop SI
    pop CX
    
    lea DI, QPointer                  
    mov AX, 0 
    mov QSize, AX                     
    cmp CX, 0                          
    jle ReloadQBufferBridge            
    jmp QLoop                         
    
    OpenFileError:
        lea DX, openFileErrMsg        
        add errCode, AL                
        mov AH, 9                      
        int 21H

    ExitMainProc:   
        call EndGameLbl

    mov AH, 2                         
    mov BH, 0                         
    mov DH, 20                        
    mov DL, 30                         
    int 10h

    mov AH, 4CH
    int 21h
    
main endp

end main