include game.inc

.code

SetBackgroundColor proc
    mov AH, 0Bh                        
    
    mov BH, 0                        
    mov BL, lGrayColor                 
    int 10h                       
    
    ret
SetBackgroundColor endp

DrawStartStand proc far
    mov AH, 0Ch                       
    mov AL, brownColor                 
    mov BH, 0                          
    
    mov CX, 30                         
    
    StandOuter:
        mov DX, 90                     
        StandInner:
            int 10h                    
            inc DX                     
            cmp DX, 350                
            jl StandInner              
        inc CX                         
        cmp CX, 35       
        jl StandOuter                  

    mov DX, 90                         
    
    UpLineOuter:
        mov CX, 30                     
        UpLineInner:
            int 10h                   
            inc CX                    
            cmp CX, 150     
            jl UpLineInner             
        inc DX                         
        cmp DX, 95                  
        jl UpLineOuter                

    mov DX, 345                        
    
    BaseLineOuter:
        mov CX, 10                     
        BaseLineInner:
            int 10h                    
            inc CX                     
            cmp CX, 50                    
            jl BaseLineInner           
        inc DX                         
        cmp DX, 350
        jl BaseLineOuter               
    
    mov DX, 90                         
    mov CX, 90                         
    
    SupLineOuter:
        push CX
        mov BL, 0                      
        SupLineInner:
            int 10h                   
            inc CX                     
            inc BL                     
            cmp BL, 7
            jl SupLineInner           
        inc DX                         
        pop CX
        dec CX                         
        cmp DX, 151 
        jl SupLineOuter                
        
    mov DX, 90                         
    mov CX, 35                         

    RopeOuter:
        mov CX, 120                    
        RopeInner:
            int 10h                    
            inc CX                    
            cmp CX, 125               
            jl RopeInner               
        inc DX                         
        cmp DX, 160              
        jl RopeOuter                   
    ret
DrawStartStand endp

DrawBody proc far
    push AX
    push BX
    push CX
    push DX

    mov AH, 0Ch                        
    mov BH, 0                          
    mov DX, 200                        
    
    BodyOuter:
    mov CX, 119                        
        BodyInner:
            int 10h                   
            inc CX                    
            cmp CX, 126       
            jl BodyInner              
        inc DX                        
        cmp DX, 265            
        jl BodyOuter                 
    pop DX
    pop CX
    pop BX
    pop AX
    ret
DrawBody endp

DrawRightHand proc far
    push AX
    push BX
    push CX
    push DX

    mov AH, 0Ch                        
    mov BH, 0                         
    mov DX, 215                        
    mov CX, 119                        

    rHandOuter:
        push CX                        
        mov BL, 0                      
        rHandInner:
            int 10h                   
            inc CX                    
            inc BL                     
            cmp BL, 7         
            jl rHandInner              
        inc DX                         
        pop CX                         
        dec CX                         
        cmp DX, 245          
        jl rHandOuter                  
    pop DX
    pop CX
    pop BX
    pop AX
    ret
DrawRightHand endp

DrawHead proc far     
    push AX
    push BX
    push CX
    push DX

    mov AH, 0Ch                        
    mov BH, 0                          
    
    mov DX, 160                        
    
    HeadUpOuter:
    mov CX, 102                        
        HeadUpInner:
            int 10h                    
            inc CX                     
            cmp CX, 143
            jl HeadUpInner             
        inc DX                         
        cmp DX, 165
        jl HeadUpOuter                
    
    mov DX, 195                        

    HeadDownOuter:
    mov CX, 102                       
        HeadDownInner:
            int 10h                   
            inc CX                    
            cmp CX, 143 
            jl HeadDownInner         
        inc DX                         
        cmp DX, 200       
        jl HeadDownOuter              
    
    mov DX, 165                       

    HeadLeftOuter:
    mov CX, 102                       
        HeadLeftInner:
            int 10h                    
            inc CX                     
            cmp CX, 107
            jl HeadLeftInner           
        inc DX                         
        cmp DX, 195
        JL HeadLeftOuter               

    mov DX, 165                        

    HeadRightOuter:
    mov CX, 138                       
        HeadRightInner:
            int 10h                    
            inc CX                    
            cmp CX, 143
            jl HeadRightInner          
        inc DX
        cmp DX, 195
        jl HeadRightOuter              
    pop DX
    pop CX
    pop BX
    pop AX
    ret
DrawHead endp

DrawLeftHand proc far
    push AX
    push BX
    push CX
    push DX

    mov AH, 0Ch                         
    mov BH, 0                         
    mov DX, 215                       
    mov CX, 119                       
    
    LeftHandOuter:
        push CX      
        mov BL, 0                      
        LeftHandInner:
            int 10h                    
            inc CX                    
            inc BL                    
            cmp BL, 7 
            jl LeftHandInner          
        inc DX                        
        pop CX
        inc CX                         
        cmp DX, 245       
        jl LeftHandOuter              
    pop DX
    pop CX
    pop BX
    pop AX
    ret
DrawLeftHand endp

DrawLeftLeg proc far
    ; save reg values
    push AX
    push BX
    push CX
    push DX
    
    mov AH, 0Ch                       
    mov BH, 0                          
    mov DX, 265                        
    mov CX, 119                        
    
    LeftLegOuter:
        push CX                        
        mov BL, 0                      
        LeftLegInner:
            int 10h                  
            inc CX                   
            inc BL                    
            cmp BL, 7      
            jl LeftLegInner           
        inc DX                        
        pop CX
        inc CX                        
        cmp DX, 295
        jl LeftLegOuter                
    pop DX
    pop CX
    pop BX
    pop AX
    ret
DrawLeftLeg endp

DrawRightLeg proc far
    push AX
    push BX
    push CX
    push DX

    mov AH, 0Ch                         
    mov BH, 0                          
    mov DX, 265                        
    mov CX, 119                        
    
    RightLegOuter:
        push CX                        
        mov BL, 0                      
        RightLegInner:
            int 10h                                
            inc CX                     
            inc BL                     
            cmp BL, 7
            jl RightLegInner           
        inc DX                        
        pop CX
        dec CX                            
        cmp DX, 295    
        jl RightLegOuter               
    pop DX
    pop CX
    pop BX
    pop AX
    ret
DrawRightLeg endp

EndGameLbl proc
    mov AH, 2                          
    mov BH, 0                          
    mov DH, 23                         
    mov DL, 34                         
    int 10h                            

    mov AH, 0Eh                        
    mov BH, 0                          
    mov BL, lRedColor
    lea SI, endGameMsg                   
    cld                              
    
    mov CX, LENGTHOF endGameMsg         
    
    EndGameLoop:
        lodsb                    
        int 10h                        
        loop EndGameLoop             
    
    ret
EndGameLbl endp

GameTitleLbl proc
    mov AH, 2                          
    mov BH, 0                          
    mov DH, 1                          
    mov DL, 37                         
    int 10h               
    
    mov AH, 0Eh                        
    mov BH, 0                          
    mov BL, magentaColor
    lea SI, gameTitle
    cld
    
    mov CX, LENGTHOF gameTitle

    GameTitleLoop:
        lodsb                          
        int 10h                        
        loop GameTitleLoop
    ret
GameTitleLbl endp        

TCharsLbl proc
    mov AH, 2                          
    mov BH, 0                          
    mov DH, 16                         
    mov DL, 30                              
    int 10h

    mov AH, 0Eh                        
    mov BH, 0                          
    mov BL, lGreenColor       
    lea SI, tCharsMsg
    cld
    
    mov CX, LENGTHOF tCharsMsg
    
    TCharsLoop:
        lodsb
        int 10h
        loop TCharsLoop
    ret
TCharsLbl endp

QuestionLbl proc
    mov AH, 2                          
    mov BH, 0                          
    mov DH, 25                         
    mov DL, 1                          
    int 10h  

    mov AH, 0Eh                        
    mov BH, 0                          
    mov BL, lGreenColor
    lea SI, questionMsg
    cld
    mov CX, LENGTHOF questionMsg

    QLblLoop:
        lodsb
        int 10h
        loop QLblLoop
    ret
QuestionLbl endp

AnswerLbl proc
    mov AH, 2                          
    mov BH, 0                          
    mov DH, 27                         
    mov DL, 1                                
    int 10H  
    
    mov AH, 0Eh                        
    mov BH, 0                          
    mov BL, lGreenColor                          
    lea SI, answerMsg
    cld
    mov CX, LENGTHOF answerMsg

    AnswerLoop:
        lodsb
        int 10h
        loop AnswerLoop
    ret
AnswerLbl endp

ShowQuestion proc
    push AX
    push BX
    push DX
    push CX
    
    mov AH, 2                          
    mov BH, 0                          
    mov DH, 25                         
    mov DL, 11                         
    int 10h                            
    
    mov CX, 69                         
    mov AH, 0Eh                        
    mov BH, 0                          
    mov BL, redColor                       
    mov AL, ' '             
    
    PrintSpace1:
        int 10h                        
        loop PrintSpace1               
    
    mov AH, 2                          
    mov BH, 0                          
    mov DH, 26                          
    mov DL, 0                          
    int 10h                            
   
    mov CX, 79                        
    mov AH, 0Eh                        
    mov BH, 0                          
    mov BL, 2                          
    mov AL, ' '
    
    PrintSpace2:
        int 10h                        
        loop PrintSpace2               
    
    mov AH, 2                          
    mov BH, 0                          
    mov DH, 25                         
    mov DL, 11                         
    int 10h                            
 
    pop CX

    mov AH, 0Eh                        
    mov BH, 0                          
    mov BL, 2                          
    
    ShowQues:
        lodsb                          
        int 10h                        
        loop ShowQues                  
    
    pop DX
    pop BX
    pop AX
    ret
ShowQuestion endp

ShowQMarks proc
    push AX
    push BX
    push DX
    push CX

    mov AH, 2                         
    mov BH, 0                          
    mov DH, 27                            
    mov DL, 10                         
    int 10h                            
    
    mov AH, 0Eh                        
    xor BH, BH           
    mov BL, 2                          
    mov AL, ' '                       
    mov CX, 70                         

    PrintSpace:
        int 10h                        
        loop PrintSpace                

    mov AH, 2                          
    mov BH, 0                          
    mov DH, 27                         
    mov DL, 10                         
    int 10h                            
    
    pop CX                          
    mov AH, 0Eh                        
    mov BH, 0                          
    mov BL, 2                          
    mov AL, '?'                        

    PrintQuestionMark:
        int 10h                        
        loop PrintQuestionMark         

    pop DX
    pop BX
    pop AX
    ret
ShowQMarks endp

WriteTChar proc
    push AX                
    push BX
    push CX
    push DX

    mov AH, 2                          
    mov BH, 0                          
    mov DH, 16                         
    
    int 10h                            
    
    mov AH, 0Eh                        
    mov BH, 0                         
    mov BL, 2                          
    int 10h
    
    pop DX
    pop CX
    pop BX
    pop AX
    ret    
WriteTChar endp

ClearTChar proc
    push AX
    push BX
    push CX
    push DX

    mov AH, 2                          
    mov BH, 0                          
    mov DH, 16                        
    mov DL, 48                        
    int 10h                            

    mov AL, ' '                        

    mov AH, 0Eh                        
    mov BH, 0                          
    mov BL, 2                          
    mov CX, 32                         
 
    ClearLoop:
        int 10h                        
        loop ClearLoop                 

    pop DX
    pop CX
    pop BX
    pop AX
    ret
ClearTChar endp
