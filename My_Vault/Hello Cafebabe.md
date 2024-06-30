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