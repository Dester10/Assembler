INCLUDE Irvine32.inc

.data
    inputCount BYTE "Enter the number of elements in the array: ", 0
    inputElems BYTE "Enter the elements of the array (each number on a separate line): ", 0
    inputMessage BYTE "Original array       : ", 0
    outputMessage BYTE "Sorted array         : ", 0
    array DWORD 1024 DUP(0)
    count DWORD ?
    quantity DWORD ?

.code

main PROC
    
    mov edx, OFFSET inputCount
    call WriteString
    
    call ReadInt
    mov quantity, eax
    
    mov edx, OFFSET inputElems
    call WriteString
    
    call CrLf
    
    ; записываем введенные числа в массив
    mov ecx, quantity
    mov ebx, 0
    L0:
        call ReadInt
        mov array[ebx], eax
        
        add ebx, TYPE array
        loop L0
    
    ; сортировка вставками
    INSERTION_SORT:
        
        call CrLf
        
        ; вывод исходного массива
        mov edx, OFFSET inputMessage
        call WriteString
        
        mov ecx, quantity
        mov ebx, 0
        
        INPUT_LOOP:
            
            mov eax, array[ebx]
            add ebx, TYPE array
            call WriteInt
            
            mov al, 20h                 ; пробел между элементами
            call WriteChar
            
            loop INPUT_LOOP
        
        ; сама сортировка
        mov ecx, quantity
        mov eax, 0
        
        L1:
            mov count, ecx
            dec ecx
            
            cmp ecx, 0
            je OUTPUT                   ; если ecx 0, то конец сортировки
            
            mov ebx, 0                  ; сброс edx
            
            L2:
                
                mov esi, array[ebx]
                add ebx, TYPE array
                mov edi, array[ebx]     ; получаем два элемента
                
                cmp esi, edi
                jg CHANGE               ; если esi больше, чем edi, то меняем их местами
                jng NEXT                ; иначе переходим к следующему элементу
                
                CHANGE:
                    sub ebx, TYPE array ; возвращаем ebx на один назад
                    
                    mov eax, array[ebx]
                    mov array[ebx], edi
                    add ebx, TYPE array
                    mov array[ebx], eax ; меняем местами элементы
                    
                NEXT:
                loop L2
            
            mov ecx, count         ; восстанавливает ecx для следующей итерации
            
            loop L1
        
    OUTPUT:
        call CrLf
        
        ; вывод отсортированного массива
        mov edx, OFFSET outputMessage
        call WriteString
        
        mov ecx, quantity
        mov ebx, 0
        
        OUTPUT_LOOP:
            
            mov eax, array[ebx]
            add ebx, TYPE array
            call WriteInt
            
            mov al, 20h             ; пробел между элементами
            call WriteChar
            
            loop OUTPUT_LOOP
        
        call CrLf
exit

main ENDP
END main
