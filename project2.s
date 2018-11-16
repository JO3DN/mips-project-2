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
	beq $t8, $t9, DeleteTheCharacter
	move $t9, $a0
	j input_len
	

DeleteTheCharacter:
	addi $a0, $a0, 1
	j DeleteLeftSpaces

input_len:
	addi $t0, $t0, 0
	addi $t1, $t1, 10
	add $t4, $t4, $a0
