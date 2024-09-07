# This file gives an introduction to labels and sections used in RISC-V.
# The code below is taken from eclass with added comments by me

#-------------------------------------------
# Basics - Labels and Sections
# Ported by: Noah Gergel
# Last updated: May 5 2020
#-------------------------------------------


# The data section contains static (constant) data allocations. The section ends implicity at the start of the next section.
# Start the data section. 
.data 

	# Labels are used to identify sections of memory, similar to variables in high-level languages.
	# Allocate two bytes and give them labels.
	exampleLabel1:
	    .space 1
	  
# Start the text section. The text section contains contains our assembly instructions. 
.text

	# Label can be the destination of a jump or branch instruction, or it can be the name of a procedure when defined in the text section.
	# Routine, subroutine, function, and procedure mean the same thing in assembly programming. 
	
	# This starts execution at the following line.
	foo:
	    add   a0, zero, zero        # Foo starts here.
	    jalr  zero, ra, 0           # Foo ends here.
	
	# This starts execution on the same line.
	bar:    add   a0, zero, zero    # Bar starts here.
	        jalr  zero, ra, 0       # Bar ends here.
	
	# This starts execution many lines later.
	baz:
	    add   a0, zero, zero        # Baz starts here.
	    jalr  zero, ra, 0           # Baz ends here.
	    
# All keywords used in this file will be explained later on