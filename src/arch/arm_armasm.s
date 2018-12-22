THUMB

AREA .text, CODE
GLOBAL |rust_psm_stack_direction|
ALIGN 4
FRAME UNWIND OFF
|rust_psm_stack_direction| PROC
    movs r0, #STACK_DIRECTION_DESCENDING
    bx lr
ENDP

GLOBAL |rust_psm_stack_pointer|
ALIGN 4
FRAME UNWIND OFF
|rust_psm_stack_pointer| PROC
    mov r0, sp
    bx  lr
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
    /* FIXME: needs those unwind infos! */
    push {r4, lr}
    mov r4, sp
    mov sp, r3
    blx r2
    mov sp, r4
    pop {r4, pc}
ENDP
