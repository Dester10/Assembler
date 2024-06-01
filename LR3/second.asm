TITLE ;4.2.2_Semenyuchenko

INCLUDE Irvine32.inc

.data
sInput BYTE ".\source.txt", 0
sKey BYTE ".\key.txt", 0
sDecrypt BYTE ".\encrypted.txt", 0
buffer BYTE 6 DUP(?)
crypt BYTE 6 DUP(?)


.code
main PROC
mov edx, OFFSET sInput ;помещаем
call OpenInputFile
mov edx, OFFSET buffer
mov ecx, LENGTHOF buffer
mov ebx, TYPE buffer
call ReadFromFile
call CloseFile
mov esi, OFFSET buffer
mov ecx, LENGTHOF buffer
mov ebx, TYPE buffer
call Dumpmem
call init
call createEncrypted
call writeToEncrypted
exit
main ENDP

init PROC
mov esi, OFFSET crypt
mov ecx, LENGTHOF crypt
call Randomize
L1:
call Random32
mov [esi], eax
add esi, TYPE crypt
loop L1
mov edx, OFFSET sKey
call CreateOutputFile
mov edx, OFFSET crypt
mov ecx, LENGTHOF crypt
call WriteToFile
call CloseFile
ret
init ENDP

writeToEncrypted PROC
mov edx, OFFSET sDecrypt
call CreateOutputFile
mov edx, OFFSET buffer
mov ecx, LENGTHOF buffer
call WriteToFile
ret
writeToEncrypted ENDP

createEncrypted PROC
mov esi, OFFSET buffer
mov edi, OFFSET crypt
mov ecx, 3
l1:
mov al, [edi]
add al, [esi]
mov [esi], al
add esi, 2
add edi, 2

loop l1
mov esi, OFFSET buffer
mov ecx, LENGTHOF buffer
mov ebx, TYPE buffer
call Dumpmem
ret
createEncrypted ENDP

; (код дополнительных процедур)
END main