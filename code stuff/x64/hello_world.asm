; hello world.asm
;
; Author Sage: Koellner
; Dagte 18-April-2021

global _start

section .text:

_start:
    mov eax, 0x4                    ; use the write syscall
    mov ebx, 1                      ; use stdout as the fd
    mov ecx, message                ; use the message as the buffer
    mov edx,  message               ; and suply the message length
    int 0x80                        ; invoke the syscall

    ; now gracefully exit

    mov eax, 0x1
    mov ebx, 0
    int 0x80

section .data:
    message: db "Hello World!", 0xA
    message_length equ $-message
