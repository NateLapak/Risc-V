Functions:
# This file is all about functions/subroutines in RISC-V.

#-------------------------------------------
# Subroutines - Basic Subroutines
# Ported by: Noah Gergel
# Last updated: May 6 2020
#-------------------------------------------


# A function or subroutine begins with a label and has a return statement at the end.
# This return statement uses the return address ra to specify the address where execution should return to
# In RISC-V, this is done using: jalr/jal/j and ret

# To call a function, we use jal (jump-and-link). For example: jal foo.
# Fall-through control flow invovles skipping using an instruction branch or jump (bne or j) (like if statements)
# To return execution to a function, use jalr zero, ra, 0

.text

# A function foo. This is still just a regular label, we just choose
# to think of it as a function.
foo:


	# Function code.

# This is an internal label of foo (function within a function).
_fooLabelName:

	# The return instruction.
	jalr  zero, ra, 0

# A function that calls bar.
foo1:
	addi	a0, zero, 0 	# a0 <- 0
	addi	a1, zero, 1 	# a1 <- 1
	jal 	ra bar      	# Call bar(0,1)
	add 	s0, zero, a0	# s0 <- a0

# A function demonstrating fall-through control flow.
foo2:
	# Initialize t0.
	add   t0, zero, zero  	# t0 <- 0
	bne   a0, zero, _skip 	# if a0 == 0, skip initialization of t1
	add   t1, zero, zero  	# t1 <- 0
_skip:
	sub t2, a1, t0

# Example with an exit label.
bar:
	# bar code...
	addi t0, zero, 31   	# t0 <- 31

	_barLabel:
    	addi t0, zero, 30   # t0 <- 30

    	# Jump to the end directly.
    	j _barDone

	# Another super useful command.
	sub t0, zero, t0    	# t0 <- 0 - t0

	# And if we didn't jump to _barDone earlier this falls through and goes to it
	# anyways, which is what we want.

_barDone:
	# At this point we are done and want to return.
	jalr  zero, ra, 0 # <- return value

MainFunction:
# This file is about the main function. In C, we use the main function as the driver for a program.
# In RISC-V, it's the same. When main is written, it tells the assembler to start at that function.

#-------------------------------------------
# Subroutines - Main Function
# Author: Noah Gergel
# Date: May 11 2020
#-------------------------------------------

.text

# Example of the main function.
main:

	# Dummy code. This is where the first lines of the program will be run.
	addi	t0, zero, 1
	addi	t1, zero, 1
	sub 	t0, t0, t1

	# ...

	# We can call functions from within main.
	jal 	ra, foo

	# ...

	# Exit the program.
	addi	a7, zero, 10
	ecall

# Does a neat thing.
foo:
	# Ah yes, very neat.
	addi	t0, zero, 2

	# Return to main.
	jalr	zero, ra, 0

