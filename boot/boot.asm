[org 0x7c00]

;清屏，不然有可能无法显示
mov ax, 3
int 0x10

;初始化寄存器
mov ax, 0
mov ds, ax
mov es, ax
mov ss, ax
mov sp, 0x7c00

xchg bx, bx; bochs魔数断点

mov si, booting
call print

;程序悬停
jmp $

print:
    mov ah, 0x0e
.next:
    mov al, [si]; 取si入al
    cmp al, 0; al 为 0 表字符串结束
    jz .done; 完成
    int 0x10; 打印
    inc si; si自增1
    jmp .next
.done:
    ret

booting:
    db "Booting Onix....", 10, 13, 0; \n\r
times 510 - ($ - $$) db 0

db 0x55, 0xaa
