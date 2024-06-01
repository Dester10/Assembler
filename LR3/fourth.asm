TITLE ;4.4.2_Semenyuchenko

INCLUDE Irvine32.inc

.data
    inputWords BYTE "Enter amount of numbers: "
    input DWORD ?
    array DWORD 100 DUP(0)
.code

main PROC
    
    mov edx, OFFSET inputWords
    call WriteString
    
    call ReadInt
    mov input, eax
    
    mov ecx, input
    mov eax, 1 ; n
    mov ebx, 1 ; n-1
    mov edx, 0 ; n-2
    call Fib
    
    exit
main ENDP

Fib PROC
    push eax
    
    mov eax, ebx
    add eax, edx ; формула

    mov edx, ebx
    mov ebx, eax ; смещение элементов

    dec ecx

    .IF ecx > 0
        jmp Fib
    .ELSE
        jmp WriteToConsole
    .ENDIF
    
    ret
Fib ENDP

WriteToConsole PROC
    mov ecx, input
    mov eax, input
    mov ebx, 4
    mul ebx
    mov esi, eax

    L2:
        pop ebx
        mov array[esi], ebx
        sub esi, 4
        loop L2
    
    mov ecx, input
    mov esi, 0

    outputLoop:
        mov eax, array[esi]
        add esi, TYPE array
        call WriteInt
        mov al, 20h ; пробел
        call WriteChar
        loop outputLoop
    ret
WriteToConsole ENDP
    
END main