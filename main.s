.global _main
.text

_main:
    # Step 1: Write "Hello, World!\n" to the screen
    movq $0x02000004, %rax     ; macOS write system call number
    movq $1, %rdi              ; File descriptor 1 = stdout
    leaq msg(%rip), %rsi       ; Load address of the string
    movq $14, %rdx             ; Length of the string
    syscall                    ; Invoke the kernel

    # Step 2: Exit the program cleanly
    movq $0x02000001, %rax     ; macOS exit system call number
    xorq %rdi, %rdi            ; Return status code 0 (Success)
    syscall                    ; Invoke the kernel

.data
msg:
    .ascii "Hello, World!\n"

;run with clang main.s -o hello AND ./hello