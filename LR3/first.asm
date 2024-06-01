INCLUDE Irvine32.inc

.data
; (переменные)
amountElem DWORD ?
firstElem DWORD ?
summa DWORD ?
massivElem DWORD 255 DUP(?)
input BYTE "input amount of numbers. from 0 to 255 - ", 0
input2 BYTE "Sum of numbers modul the first number - ", 0

.code
main PROC
mov edx, OFFSET input
call WriteString
call ReadInt
mov amountElem, eax

mov ecx, amountElem
mov esi, OFFSET massivElem
mov ebx, TYPE massivElem
L1:
call ReadInt
mov [esi], eax
add esi, ebx
loop L1

mov esi, OFFSET massivElem
mov ecx, amountElem
mov ebx, TYPE amountElem

mov eax, [esi]
mov firstElem, eax
mov edx, 0

L2:
mov eax, [esi]
add edx, eax
add esi, ebx
loop L2
mov eax, edx
mov edx, 0
mov ebx, firstElem
div ebx
mov summa, edx

mov eax, summa
mov edx, OFFSET input2
call WriteString
call WriteInt

exit
main ENDP

; (код дополнительных процедур)
END main
