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
	beq $t5, $t1, ConversionPrep
	slti $t6, $t5, 48 # if char < ascii(48), input invalid, ascii(48) = 0
	bne $t6, $zero, InputIsInvalid
	slti $t6, $t5, 58 # if char < ascii(58), input is valid, ascii(58) = 9
	bne $t6, $zero, PushCharacter
	slti $t6, $t5, 65 # if char < ascii(65), input invalid, ascii(97) = A
	bne $t6, $zero, InputIsInvalid
	slti $t6, $t5, 88 # if char < ascii(88), input is valid, ascii(88) = X
	bne $t6, $zero, PushCharacter
	slti $t6, $t5, 97 # if char < ascii(97), input invalid, ascii(97) = a
	bne $t6, $zero, InputIsInvalid
	slti $t6, $t5, 120 # if char < ascii(120), input is valid, ascii(120) = x
	bne $t6, $zero, PushCharacter
	bgt $t5, 119, InputIsInvalid # if char > ascii(119), input invalid, ascii(119) = w

PushCharacter:
	addi $a0, $a0, 1
	j CheckThestring

ConversionPrep:
	move $a0, $t4
	addi $t7, $t7, 0
	add $s0, $s0, $t0
	addi $s0, $s0, -1	
	li $s3, 3
	li $s2, 2
	li $s1, 1
	li $s5, 0

baseConverterInput:
	lb $s4, 0($a0)
	beqz $s4, print_result
	beq $s4, $t1, print_result
	slti $t6, $s4, 58
	bne $t6, $zero, ConvertBaseTen
	slti $t6, $s4, 88
	bne $t6, $zero, ConvertBase33
	slti $t6, $s4, 120
	bne $t6, $zero, LowerConverter

