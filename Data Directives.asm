# This file is about directives in the data section of the file. 

#-------------------------------------------
# Basics - Data Section Directives
# Ported by: Noah Gergel
# Last updated: May 5 2020
#-------------------------------------------


# List of common data directives and their uses
#----------------------------------------------------
# .space: Allocates an specified number of bytes in the program's data segment in memory (like malloc in c)
# .align: Aligns the next data item along a specified byte boundary: 0 = byte, 1 = half, 2 = word, 3 = double. 
# The align directive is commonly used in conjunction with another directive.
# .byte, .half, .word: Store the listed value(s) as bytes/halfwords/words in the data segment of memory.
# .include: Inserts the contents of a specified file. Use double-quotes around the file name (exactly like #include in C)
# .asciz: Stores the string in memory, with a null-terminator.
# .ascii: Stores the string in memory without a null-terminator (a variable that stores a string)

#-----------------------------------------------------


# This directive starts the data section.
.data

# All of the the following directives can be initialised by putting a comma
# separated list of values after the directive.

# Allocating space for bytes of data uses the .byte directive.
one_byte:
    .byte 255

many_bytes:
    .byte 1, 2, 3, 0x55, -128

# Allocating space for a halfword (2 bytes) uses the .half directive.
one_halfword:
    .half 65535

many_halfwords:
    .half 256, 0xFFFE, -19

# Allocating space for a word (4 bytes, an int, a pointer) uses the .word directive.
one_word:
    .word 4294967295

many_words:
    .word 65536, 0xDEADBEEF, -2147483648


# Allocating strings with and without the null-terminator.
str_with_null:
    .asciz "Hello world!"

str_without_null:
    .ascii "Hello world!"

hello_world_in_bytes:
  .byte 0x48, 0x65, 0x6C, 0x6C, 0x6f, 0x20, 0x77, 0x6F, 0x72, 0x6C, 0x64, 0x21
  .byte 0x00 # Null terminator

# Alternately, if you'd like to just request UNINITIALISED space for data (for
# an array or something similar) you can use the .space directive. This will
# give you the requested number of BYTES of space uninitialised.

# Space for 16 words.
some_space:
    .space 64