image:
	nasm -f bin boot.asm && ./thingy.lua
debug: image
	bochs "-q" 'boot:a' 'floppya: 1_44=fd.img, status=inserted'
clean:
	rm boot fd.img funcs
