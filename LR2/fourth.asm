TITLE ;3.4.2_Semenyuchenko
    
    INCLUDE Irvine32.inc

.data
    ; (variables)
    arText BYTE "нажал кабан на баклажан"
    arResult BYTE SIZEOF arText DUP(?)
	
.code
    main PROC
    ; (main code)
    mov esi, OFFSET arText
    mov ecx, LENGTHOF arText
    mov ebx, TYPE arText
    call DumpMem

    mov ecx, 5
    mov esi, 0
    mov edi, LENGTHOF arResult

    L1:
        mov al, arText[esi]
        dec edi
        inc esi
        mov arResult[edi], al
        loop L1

    mov bl, arText[esi]
    inc esi

    mov ecx, 3
    L2:
        mov al, arText[esi]
        dec edi
        inc esi
        mov arResult[edi], al
        loop L2

    dec edi
    mov arResult[edi], bl

    mov ecx, 2
    L3:
        mov al, arText[esi]
        dec edi
        inc esi
        mov arResult[edi], al
        loop L3

    inc esi
    dec edi
    mov arResult[edi], bl

    mov ecx, 2
    L4:
        mov al, arText[esi]
        dec edi
        inc esi
        mov arResult[edi], al
        loop L4

    inc esi

    mov ecx, 3
    L5:
        mov al, arText[esi]
        dec edi
        inc esi
        mov arResult[edi], al
        loop L5

    dec edi
    mov arResult[edi], bl

    mov ecx, 5
    L6:
        mov al, arText[esi]
        dec edi
        inc esi
        mov arResult[edi], al
        loop L6
    

    mov esi, OFFSET arResult
    mov ecx, LENGTHOF arResult
    mov ebx, TYPE arResult
    call DumpMem

    exit
    main ENDP
	
    ; (addition code)
    END main
