.data
 emptyInput: .asciiz "Input is empty."
invalidbase: .asciiz "Invalid base-33 number."
inputoolong: .asciiz "Input is too long."
 userInput: .space 1000

.text

main:
 li $v0, 8
 la $a0, userInput
 li $a1, 100
 syscall

DeleteLeftSpaces:
	li $t8, 32 # space
	lb $t9, 0($a0)
