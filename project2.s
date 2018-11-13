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
		beqz $t0 , ifempty
		
		
		
		
		
	end:
	# make sure the rest of the code is only reached if i call them 
		li $v0, 10 #System call to end program 
		syscall
		
	ifempty:
		li $v0 , 4
		la $a0 , emptyinput
		syscall
		