    INCLUDE Irvine32.inc

.data
	
.code
    main PROC

    mov ah, -1
    sub ah, 1 
    
	call Dumpregs

    mov al, 127
    add al, 129

    
	call Dumpregs

    mov bh, -50
    add bh, -1 
    
	call Dumpregs

    mov bl, -128
    add bl, 128
    
	call Dumpregs

    exit
    main ENDP
	
    END main
