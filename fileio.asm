.code

ReadFile proc far
    push cx                            
    
    mov ah, 3Fh                       
    mov cx, 512                        
    int 21h                            
    
    pop cx                            
    ret
ReadFile endp 

OpenFile proc far
    mov ah, 3Dh                        
    mov al, 0                          
    int 21h                           
    ret                            
OpenFile endp

CloseFile proc far
    mov ah, 3Eh                        
    int 21h                            
    ret
CloseFile endp