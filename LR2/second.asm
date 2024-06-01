TITLE ;3.2.2_Semenyuchenko
    
    INCLUDE Irvine32.inc

.data
    ; (variables)
    first DWORD 1 ; n-2
    second DWORD 0 ; n-1
    current DWORD 0 ; n
    temp DWORD ?
    count DWORD ?
	
.code
    main PROC
    ; (main code)
    mov ecx, 20
    mov ebx, first
    mov edx, second
    mov eax, 0
    
    L1:
        mov count, ecx ; count

        mov temp, eax
        mov eax, current ; eax to 0
        add eax, ebx
        add eax, edx
        add eax, edx ; formula

        mov esi, OFFSET temp
        mov ecx, 1
        mov ebx, TYPE temp
        call DumpMem

        mov ecx, count ; count

        mov ebx, edx ; n now n-1
        mov edx, eax ; n-1 now n-2
        loop L1

    exit
    main ENDP
	
    ; (addition code)
    END main
