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

FindingLength:
	lb $t2, 0($a0)
	beqz $t2, PostLength
	beq $t2, $t1, PostLength
	addi $a0, $a0, 1
	addi $t0, $t0, 1
	j FindingLength

PostLength:
	beqz $t0, InputIsEmpty
	slti $t3, $t0, 5
	beqz $t3, inputIsTooLong
	move $a0, $t4
	j CheckThestring

CheckThestring:
	lb $t5, 0($a0)
	beqz $t5, ConversionPrep
	