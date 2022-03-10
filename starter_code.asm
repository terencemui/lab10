.orig x3000
    LD R6, stack_addr
;this stack lab computes the polish notation of a set of calls
;push_val(4) pushes the value 4 onto the stack [4]
    AND R1, R1, #0
    ADD R1, R1, #4
    
    LD R5, push_val_addr
    JSRR R5

;push_val(3) pushes the value 3 onto the stack [4,3]
    AND R1, R1, #0
    ADD R1, R1, #3
    LD R5, push_val_addr
    JSRR R5

;push_val(2) pushes the value 2 onto the stack [4,3,2]
    AND R1, R1, #0
    ADD R1, R1, #2
    LD R5, push_val_addr
    JSRR R5

;add_val() pop 3,2 and push the result of 3+2 onto the stack [4,5]
    LD R5, add_val_addr
    JSRR R5

;add_val() pop 4,5 and push the result of 4+5 onto the stack[9]
    LD R5, add_val_addr
    JSRR R5

;move the top value of the stack into r4
    LDR R4, R6, #0

    HALT
    
stack_addr           .FILL    xFE00
push_val_addr   .FILL x3400
add_val_addr    .FILL x3800

.end





.orig x3400 ;;push_val(int val)implement your push function that will push a value onto the stack
    ADD R6, R6, #-1
    STR R1, R6, #0
    
    RET

.end

.orig x3800 ;; add_val() pops two values from the top of the stack and pushes the result of adding the poppped value into the stack
    
    AND R3, R3, #0
    LDR R1, R6, #0
    STR R3, R6, #0
    ADD R6, R6, #1
    
    LDR R2, R6, #0
    STR R3, R6, #0
    ADD R6, R6, #1
    
    ADD R1, R1, R2
    ADD R6, R6, #-1
    STR R1, R6, #0

    RET


.end



.orig x4200 ;;data you might need

.end


