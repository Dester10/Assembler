TITLE ;[ЛР_2].[Задание_2].[Вариант_2]_[Семенюченко]
    
    INCLUDE Irvine32.inc

.data
	Cab = 10
    EGS = 9
    It = 8
    IGS = 7
    Ot = 6
    result SDWORD 0
.code
    main PROC

    mov eax, Cab
    add eax, EGS
    add eax, It
    sub eax, IGS
    sub eax, Ot

    mov result, eax

	call Dumpregs
    exit
    main ENDP
	
    END main
