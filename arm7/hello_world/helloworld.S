.text
.global _start
_start:
    mov r10, #10
    bl test

helloworld:
    mov r0, #1
    ldr r1, =message
    ldr r2, =len
    # 4 in r7 indicates output to stdout
    mov r7, #4
    swi 0
    # branches back to memory location called from
    bx lr

test:
    # calls helloword branch
    # bl passes it location called from
    bl helloworld
    # subtracts 1 from r10
    sub r10, r10, #1
    # compare r10, 0
    cmp r10, #0
    # checks NE flag, if high, branch to test again
    bne test
    b end

end:
    # 1 in r7 indicates exit
    mov r7, #1
    swi 0
 
.data
message:
    .asciz "hello world\n"
len = .-message

