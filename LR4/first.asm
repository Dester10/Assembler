INCLUDE Irvine32.inc

.data
    operationType BYTE "Choose operation type: '+', '-', '*', '/' ('C' to exit): ", 0
    errorMessage BYTE "Wrong command. Try again.", 0
    divErrorMessage BYTE "Division by zero is prohibited. Try again.", 0
    firstInput BYTE "Enter first number: ", 0
    secondInput BYTE "Enter second number: ", 0
    outputMessage BYTE "Result: ", 0
    command BYTE 2 DUP(?)
    plusSymbol BYTE "+", 0
    minusSymbol BYTE "-", 0
    multiplierSymbol BYTE "*", 0
    dividerSymbol BYTE "/", 0
    endProgram BYTE "C", 0
    programWorkEnd BYTE "Programm finished.", 0
    
    answer DWORD 0
    
.code

    main PROC
        call ClrScr

        CALCULATOR:
        
            mov edx, OFFSET operationType
            call WriteString
            
            mov edx, OFFSET command
            mov ecx, SIZEOF command
            call ReadString
            
            mov al, endProgram
            .IF al == command
                jmp EXIT_PROG
            .ENDIF
            
            mov al, plusSymbol
            .IF al == command
                jmp CORRECT
            .ENDIF
            
            mov al, minusSymbol
            .IF al == command
                jmp CORRECT
            .ENDIF
            
            mov al, multiplierSymbol
            .IF al == command
                jmp CORRECT
            .ENDIF
            
            mov al, dividerSymbol
            .IF al == command
                jmp CORRECT
            .ELSEIF
                jmp ERROR1
            .ENDIF
            
            CORRECT:
                mov edx, OFFSET firstInput
                call WriteString
            
                call ReadInt
                push eax
            
                mov edx, OFFSET secondInput
                call WriteString
            
                call ReadInt
                push eax
                
                mov al, plusSymbol
                .IF al == command
                    jmp PLUS
                .ENDIF
            
                mov al, minusSymbol
                .IF al == command
                    jmp MINUS
                .ENDIF
            
                mov al, multiplierSymbol
                .IF al == command
                    jmp MULTIPLY
                .ENDIF
            
                mov al, dividerSymbol
                .IF al == command
                    jmp DIVIDE
                .ENDIF
            
            PLUS:
                pop ebx
                pop eax
                add eax, ebx
                
                mov answer, eax
                
                jmp OUTPUT
            
            MINUS:
                pop ebx
                pop eax
                sub eax, ebx
                
                mov answer, eax
                jmp OUTPUT
                
            MULTIPLY:
                pop ebx
                pop eax
                mov edx, 0
                mul ebx
                
                mov answer, eax
                jmp OUTPUT
                
            DIVIDE:
                pop ebx
                pop eax
                
                cmp ebx, 0
                je ERROR2
                
                mov edx, 0
                div ebx
                
                mov answer, eax
                jmp OUTPUT
                
            ERROR1:
                mov ax, 00000004
                call SetTextColor
                
                mov edx, OFFSET errorMessage
                call WriteString
                
                mov ax, 00000015
                call SetTextColor
                
                call CrLf
                call CrLf
                
                jmp CALCULATOR
                
            ERROR2:
                mov ax, 00000004
                call SetTextColor
                
                mov edx, OFFSET divErrorMessage
                call WriteString
                
                mov ax, 00000015
                call SetTextColor
                
                call CrLf
                call CrLf
                
                jmp CALCULATOR
                
            OUTPUT: 
                mov edx, OFFSET outputMessage
                call WriteString
                
                call WriteInt
                call CrLf
                call CrLf
                jmp CALCULATOR
        
        EXIT_PROG:
            mov edx, OFFSET programWorkEnd
            call WriteString
            call CrLf
    exit
    
main ENDP
END main
