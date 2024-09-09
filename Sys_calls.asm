# This file is about systems calls, also known as environment calls, in RISC-V,

#-------------------------------------------
# Basics - System Calls
# Author: Noah Gergel
# Date: May 11 2020
#-------------------------------------------


# -------------------------------------------
# A system call is a special instruction that notifies the operating system to complete a task for you.
# Computer resources such as computer security or resource management is operated by the OS rather the the user's program. Thus, we use sys calls to access them.
# RISC-V has 2 registers and 1 instruction that are involved in sys-calls. The registers used are a0 and a7.
# a7 is used when the system call does not require a value. If it does, use a0 instead.
# Sys-calls are used for I/O.

# PrintInt 	Integer to print                   	1
# PrintString 	Address of null-terminated string 	4
# ReadInt 	N/A, returns int read in a0          	5
# PrintChar 	Char to print, in the lowest 8 bits 	11
# Exit 	N/A, exits the program with code 0         	10

#--------------------------------------------


.data

# String to print later. Strings that you print must be null-terminated.
cool_str:
	.asciz "The quick brown fox jumps over the lazy dog. Again, he never really tires of it."

.text

# Our example routine for executing the system calls.
foo:

	# Print the character 'a' to console.
	li  	a0, 97  	# Alternative to addi a0, zero, 97
	li  	a7, 11
	ecall

	# Print the integer 12500.
	li  	a0, 12500
	li  	a7, 1
	ecall

	# Print the string in the data section.
	la  	a0, cool_str  # Loads the address of a label.
	li  	a7, 4
	ecall

	# Exit the program.
	li  	a7, 10
	ecall

	# This instruction will never run.
	addi	t0, zero, 1

