    INCLUDE Irvine32.inc

.data
    ; (variables)
    arMass DWORD 1, 2, 5, 7, 10
    arBoost DWORD 10, 20, 30, 40, 50
    arRadius DWORD 1, 3, 5, 7, 9
    arResult DWORD 5 DUP(?)
    count DWORD 0
	
.code
    main PROC
    ; (main code)
    mov ecx, LENGTHOF arResult
    mov esi, 0
    mov edi, 0

    L1:
        mov count, ecx

        mov eax, arMass[esi]
        mov ebx, arBoost[esi]
        mov ecx, arRadius[esi]
       
        mul ebx
        mul ebx
        mul ecx

        mov arResult[edi], eax
        add esi, TYPE arMass
        add edi, TYPE arMass

        mov ecx, count
        loop L1

	mov ecx, LENGTHOF arResult
    mov esi, OFFSET arResult
    mov ebx, TYPE arResult 
    call DumpMem

    exit
    main ENDP
	
    ; (addition code)
    END main
