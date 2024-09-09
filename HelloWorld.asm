# RISC-V Assembly program to print "Hello World to stdout".

# Start data section of program
.data               	 

helloworld:
	.asciz "Hello World!\n"

# Start text section of program    
.text:
    
main:
	la a0, helloworld
	li a7, 4 # <- 4 specifies a PrintString call
	ecall
    
	li a7, 10 # <- 10 specifies an exit call
	ecall


