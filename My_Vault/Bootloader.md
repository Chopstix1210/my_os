Transfered control from [[BIOS]]

The bootloader's task is to transfer control to us, the OS dev code. 
- Due to some restrictions of the hardware and due to backwards compatibility the bootloader is often split into two parts 
	1. bootloader will transfer control to the second part 
	2. give control to OS
- writing a bootloader requires a lot of lower level code that interacts with [[BIOS]] 
	- Thus we will use an existing bootloader
	- GNU gRand Unified Bootloader ([[GRUB]])
- Using [[GRUB]] will allow us to build the OS as an odinary ELF exec
	- will be loaded by GRUB into the correct memory location 
- The compilation of the [[Kernel]] requires that the code is laid out in memory in a specific way 
- [[GRUB]] will transfer control to OS by jumping to a position in memory
	- before jump grub will make sure it is actually jumping to an OS and not some random code
	- This is part of the multiboot specification that [[GRUB]] adheres to 
	