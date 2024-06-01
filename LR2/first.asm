    INCLUDE Irvine32.inc

.data
    ; (variables)
    arrayFirst BYTE 76q, 45q, 54q, 71q, 32q, 24q, 62q, 13q, 26q, 17q, 51q, 65q, 12q, 33q
    arraySecond BYTE LENGTHOF arrayFirst DUP(?)
	
.code
    main PROC
    ; (main code)
    mov esi, OFFSET arrayFirst
    mov edi, OFFSET arraySecond
    mov ecx, LENGTHOF arrayFirst
    mov edx, 1 ; счетчик отступа от конца
    
    L1:
        mov ebx, esi
        mov ah, [esi] ; первый элемент
        add esi, ecx
        sub esi, edx
        mov al, [esi] ; последний элемент
        add ah, al ; их сумма
        mov [edi], ah ; записываем в массив

        inc edi
        mov esi, ebx
        inc esi
        inc edx
        loop L1

    mov esi, OFFSET arraySecond
    mov ecx, LENGTHOF arraySecond
    mov ebx, TYPE arraySecond
    call DumpMem

    exit
    main ENDP
	
    ; (addition code)
    END main
