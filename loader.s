global loader ; the entry symbol for ELF

MAGIC_NUMBER equ 0x1BADB002 ; define the magic number constant for multiboot 
FLAGS EQU 0x0 ; multiboot flags 
CHECKSUM equ -MAGIC_NUMBER  ; calculate the checksum
                            ; (magic number + flags + checksum) must be zero

section .text: ; start of the text (code) section 
align 4 ; the code must be 4 byte aligned 
    dd MAGIC_NUMBER ; write the magic number to the machine code 
    dd FLAGS ; write the flags to the machine code
    dd CHECKSUM ; write the checksum to the machine code

loader: ; the loader label (defined as entry point in linker script)
    mov eax, 0xCAFEBABE ; place the number 0xCAFEBABE in the eax register
.loop: 
    jmp .loop ; loop forever 