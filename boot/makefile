boot.bin: boot.asm
	nasm -f bin boot.asm -o boot.bin
master.img: boot.bin
	yes | bximage -q -hd=16 -func=create -sectsize=512 -imgmode=flat master.img
	dd if=boot.bin of=master.img bs=512 count=1 conv=notrunc

.PHONY: clean
clean:
	rm -f *.bin
	rm -f *.img

.PHONY: bochs
bochs:
	bochs -q

.PHONY: all
all: clean boot.bin master.img bochs