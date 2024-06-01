TITLE ;4.3.2_Semenyuchenko

INCLUDE Irvine32.inc

.data
    max_cols DWORD 80      ; столбцы
    max_rows DWORD 30      ; строки
    num_stars DWORD 10     ; звезды
    colors DWORD 7         ; цвета
    color BYTE 0
    buffer BYTE 0

.code

main PROC
    START:
    ; число звезд
    mov eax, max_cols
    call RandomRange
    mov num_stars, eax

    STARFALL:
        mov ecx, max_rows   
        xor dh, dh          

    NEXT_ROW:
        call ClrScr
        mov dl, 0
        call GotoXY         ; переход курсора на следующую строку
        mov ecx, max_cols

        ; вывод звезд
        mov ebx, num_stars
    PRINT_STARS:
        ; рандом позиция
        mov eax, max_cols
        call RandomRange
        mov dl, al

        ; рандом символ
        mov eax, 94        
        call RandomRange
        add al, 33         ; смещение для символа
        mov buffer, al

        ; рандом цвет
        mov eax, colors
        call RandomRange
        add al, 1          ; смещение для цвета
        mov color, al

        ; установка цвета
        movzx eax, color
        call SetTextColor

        ; вывод символа
        call GotoXY
        mov al, buffer
        call WriteChar

        dec ebx
        jnz PRINT_STARS

        ; задержка
        mov eax, 200
        call Delay

        ; переход на следующую строку
        inc dh
        cmp dh, BYTE PTR max_rows
        jl NEXT_ROW        

        ; всё заново
        jmp START

    exit
main ENDP
END main
