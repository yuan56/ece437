	org 0x0000
	ori		$10, $0, 0x0E09
	ori 		$11, $0, 0x0D08

	push	$10
	push 	$11


	pop		$7 #var1
	pop 	$3 #var2
	add 	$4, $0, $0 #result
	ori 	$5, $0, 0x0001  #$5 = 0x0001
	add 	$6, $3, $0  #temp_var2

count_start:
	beq		$3, $0,		count_end
	and		$6, $5, $3 #do maske to get least siginificant bit

	beq 	$6, $0,		do_not_add
	add 	$4, $4, $7	#do addition
	#sll 	$7, $7, 0x0001  #shift var1 to left

do_not_add:
	srl 	$3, $3, 0x0001  #shift temp_var2 to right
	sll 	$7, $7, 0x0001  #shift var1 to left
	j					count_start

count_end:
	push 	$4			#push the result back to stack

	halt
