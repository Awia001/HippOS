/* Declare constants for the multiboot header. */
.set ALIGN,    1<<0             /* align loaded modules on page boundaries */
.set MEMINFO,  1<<1             /* provide memory map */
.set FLAGS,    ALIGN | MEMINFO  /* this is the Multiboot 'flag' field */
.set MAGIC,    0x1BADB002       /* 'magic number' lets bootloader find the header */
.set CHECKSUM, -(MAGIC + FLAGS) /* checksum of above, to prove we are multiboot */
 
/* 
Add the multiboot header
*/
.section .multiboot
.align 4
.long MAGIC
.long FLAGS
.long CHECKSUM
 
/*
setup the stack
*/
.section .bss
.align 16
stack_bottom:
.skip 16384 # 16 KiB
stack_top:
 
/*
Create the _start function which the bootloader will jump to
*/
.section .text
.global _start
.type _start, @function
_start:
	
 
	/*
	point esp at the stack
	*/
	mov $stack_top, %esp
 
	/*
	Need to setup GDT and other things here
	*/
 
	/*
	call the kernel_main function
	*/
	call kernel_main
 
	/*
	infinite lopp!
	*/
	cli
1:	hlt
	jmp 1b
 
/*
Size of the _start function
*/
.size _start, . - _start
