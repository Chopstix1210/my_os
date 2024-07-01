Section to describe the implementation of the smallest possible OS that can be used with GRUB 

Tasks:
	1. Write `0xCAFEBABE` to `eax` register 

This really isn't and OS but it is a start 

Most of the rest will be seen in Code. Visit https://github.com/Chopstix1210/my_os to find out more 

. note to change to directory above 

# Compiling the Operating System 
We will start with assembly. 
- C requires a stack and haven't gotten to that chapter 
- will be under `loader.s` 
The only thing that this OS will do is write 0xCAFEBABE to the eax register. 
We can compile `loader.s` into 32 bits with: 
- `nasm -f elf32 loader.s` 
We now have a `loader.o` file

# Linking the [[Kernel]]

- The code now has to be linked to produce an executable file. 
- We want [[GRUB]] to load the [[Kernel]] at a memory address 
	- Has to be larger than or equal to 0x00100000 (1 MB)
		- Due to addresses lower than 1 MB being used by [[GRUB]], [[BIOS]], and memory mapped I/O 
- We will create a linker script `link.ld`

The linker file will be linked to the `loader.o` file with the following command 

```
ld -T link.ld -melf_i386 loader.o -o kernel.elf
```

The final executable will be called `kernel.elf`

# Building an ISO image
We need to make able to be placed in a VM. We will use the ISO image files as the media 
To do this we will use `genisoimage` 

We also need to make a configuration file `menu.lst` for [[GRUB]] to let it know where the kernel is located

We can build the ISO with the following command
```
 genisoimage -R                              \
                -b boot/grub/stage2_eltorito    \
                -no-emul-boot                   \
                -boot-load-size 4               \
                -A os                           \
                -input-charset utf8             \
                -quiet                          \
                -boot-info-table                \
                -o os.iso                       \
                iso
```


