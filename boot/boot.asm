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

mov ax, 0xb800;0xb800文本显示器的内存区区域
;ds段寄存器
mov ds, ax
;显示H，0表示偏移地址
;段寄存器ds=0xb800,地址则为0xb800 * 0x10(即十进制的16) + 0（即偏移地址）
mov byte [0], 'H'

;程序悬停
jmp $
times 510 - ($ - $$) db 0

db 0x55, 0xaa
