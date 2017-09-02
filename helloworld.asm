;   Bootloader - SenaOs - Operational system
;   SenaOs - Operational system
;   @version: alfa
;   @compile: nasm -f bin helloworld.asm -o helloworld.bin
;   @developer: Walderla Sena <walderlan@mentesvirtuaissena.com>

[bits 16]       ; Modo-Real - Definindo o codigo assembler para um binario de 16bits
[org 0x7c00]    ; O endereço da BIOS onde irá carregar o bootloader

start:          ;

    xor ax,ax
    mov ds,ax
    mov es,ax       ; these 3 lines will clears the ax,ds & es registers
    mov bx,0x8000   ; we will start from addreess 0x8000

    mov si,hello_world  ; set source index points to helloworld string
    call print_string   ; Chamando a função print_string

    hello_world db  'Hello World',13,0  ;define string

print_string:       ; Definindo a função print_string
    mov ah,0x0E     ; Valor que informar o manipulador de interrupção para tirar o valor de al & e imprimir na tela

.repeat_next_char:
    lodsb           ; Carrega o primeiro character of hello_world string to al register
    cmp al,0
    je  .done_print
    int 0x10        ; Inicia a interrupção de video da BIOS
    jmp .repeat_next_char

.done_print:
    ret

times (510 - ($ -$$)) db 0x00 ; set 512 bytes $$ are 2 bytes, this tells the bios that file contain bootloader components
dw  0xAA55  ; Repassa para bios que este arquivo comtem componentes de inicialização que precisam ser inicializados
