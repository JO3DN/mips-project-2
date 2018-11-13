.data
	emptyinput: .asciiz "Input is empty."
	inputoolong: .asciiz "Input is too long."
	invalidbase: .asciiz "Invalid base-33 number."
	userInput: .space 1000

.text
	main: 
	# getting user input
	li $v0 , 8
	la $a0 , userInput
	li $a1 , 1000
	syscall
	#making sure $t is empty (0) 
	li $t0 , 0
		Char:
		lbu $t0 , 0($a0)
