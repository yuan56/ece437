	org 0x0000
	ori 	$29, $0, 0xFFFC

	ori 	$20, $0, 0x07DF #current year 2015
	ori  	$21, $0, 0x0001 #current month 1
	ori 	$22, $0, 0x0016 #current date 22

#load constants
	ori 	$23, $0, 0x07D0 #year 2000
	ori 	$24, $0, 0x016D #constant 365
	ori 	$25, $0, 0x001E #constant 30
	ori 	$26, $0, 0x0001 #constant 1

	subu 	$15, $20, $23 	#$20 <= curr_year - 2000
	push 	$15
	push 	$24
	jal		mul1

	pop 	$20 #total days in years

	subu 	$16, $21, $26 #$21 <= curr_month - 1
	push 	$16
	push 	$25
	jal 	mul1

	pop		$21
	add 	$10, $21, $20 #$10 <= (30⋅(CurrentMonth-1))+365⋅(CurrentYear-2000)
	add 	$10, $10, $22

mul1:

#364 * totalyear
	pop		$7 #var1
	pop 	$3 #var2
	add 	$4, $0, $0 #result
	ori 	$5, $0, 0x0001  #$5 = 0x0001
	add 	$6, $3, $0  #temp_var2

count_start1:
	beq		$3, $0,		count_end1
	and		$6, $5, $3 #do maske to get least siginificant bit

	beq 	$6, $0,		do_not_add1
	add 	$4, $4, $7	#do addition

do_not_add1:
	srl 	$3, $3, 0x0001  #shift temp_var2 to right
	sll 	$7, $7, 0x0001  #shift var1 to left
	j					count_start1

count_end1:
	push 	$4			#push the result back to stack
	jr 		$31
