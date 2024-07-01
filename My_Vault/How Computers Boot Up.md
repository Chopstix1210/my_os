https://manybutfinite.com/post/how-computers-boot-up/

**Booting is an involved, hacky, multi-stage affair

![[Pasted image 20240630172436.png]]

1. press the power button on the computer 
2. MOBO is powered up and it inits its own firmware 
	1. chipset and other things 
	2. tries to get the [[CPU]] running 
	3. If things fail you will likely have a system that looks completely dead except for fans spinning 
		1. ex. CPU is busted or missing
		2. Sometimes USB or other devices can cause this to happen 
3. If all is well CPU starts running 
4. In a multi-processor or multi-core system one CPU is dynamically chosen to be the bootstrap processor (BSP) that runs all of the [[BIOS]] and [[Kernel]] initialization code
	1. Intel CPUs (and cpus in general) have been evolving, but they're all fully backwards compatible 
	2. modern CPUs can behave like the original 1978 CPUs 
	3. This is what CPUs do when they first boot up 
	4. In primitive power up state the processor is in *Real Mode* with memory paging disabled
		1. similar to MS-DOS 
		2. Only 1 MB of memory can be addressed and any code can write to any place in memory 
		3. No notion of protection or privilege 
5. The remaining processors remain halted until later on when they are explicitly activated by the kernel 
	1. called application processors (AP)

- Most [[registers]] in the CPU have well-defined values after power up 
	- includes the instruction pointer (EIP) 
		- holds the mem add for instruction being execed by CPU 
- Intel CPUs have a hidden base address (an offset) applied to EIP so that hte first instruction executed is at address 0xFFFFFFF0 (16 bytes short of the end of 4 gigs of memory and well above one megabyte). 
	- This is called the [[reset vector]] 
	- standard for modern [[Intel CPU]]
- The motherboard ensures that instructions at the reset vector is a *jump* to the memory location mapped to the [[BIOS]] entry point
	- implicitly clears the hidden base address present at the power up 
- All of the memory locations have the right content needed by the CPU due to the [[memory map]] 
	- it's kept by the chipset
- They are all mapped to flash memory containing the BIOS since at this point the [[RAM]] modules have random crap in them 

EX: of relevant memory regions 
![[Screenshot_20240630_174331.png]]


