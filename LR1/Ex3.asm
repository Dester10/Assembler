    INCLUDE Irvine32.inc

.data
	word1 = "MAN"
    word2 = "GIRL"
.code
    main PROC

    mov eax, word1
    sub al, 0Ah
    add ah, 14h

    mov ebx, word2
    add ebx, 8h
    sub ebx, 0C00h

	call Dumpregs
    exit
    main ENDP
	
    END main
