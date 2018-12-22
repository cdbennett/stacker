ARM64

AREA .text, CODE

GLOBAL |rust_psm_stack_direction|
ALIGN 4
FRAME UNWIND OFF
|rust_psm_stack_direction| PROC
    orr w0, wzr, #STACK_DIRECTION_DESCENDING
    ret
ENDP


GLOBAL |rust_psm_stack_pointer|
ALIGN 4
FRAME UNWIND OFF
|rust_psm_stack_pointer| PROC
    mov x0, sp
    ret
ENDP


GLOBAL |rust_psm_replace_stack|
ALIGN 4
FRAME UNWIND OFF
|rust_psm_replace_stack| PROC
    mov sp, r2
    bx r1
ENDP

GLOBAL |rust_psm_on_stack|
ALIGN 4
FRAME UNWIND ON
|rust_psm_on_stack| PROC
    stp x29, x30, [sp, #-16]!
FRAME ADDRESS sp, 16
    mov x29, sp
FRAME ADDRESS x29, 16
FRAME SAVE x29, x30, -16
    mov sp, x3
    blr x2
    mov sp, x29
FRAME ADDRESS sp, 16
    ldp x29, x30, [sp], #16
FRAME RESTORE x29, x30
    ret
ENDP
