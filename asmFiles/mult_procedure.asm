	org 0x0000
	ori		$20, $0, 0x0A01
	ori 	$21, $0, 0x0B02
	ori 	$22, $0, 0x0003
	ori 	$23, $0, 0x0004
	ori 	$24, $0, 0x0004

	push	$20
	push	$21
	push	$22
	push	$23
	push	$24


	pop		$11 #counter
	
	ori 	$12, $0, 0x0001 #$12 = 0x0001
check:
	beq 	$11, $12, 	done 	 		
	jal		mul_ftn
	j 		check

done:
	halt


mul_ftn:
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

do_not_add:
	srl 	$3, $3, 0x0001  #shift temp_var2 to right
	sll 	$7, $7, 0x0001  #shift var1 to left
	j					count_start

count_end:
	push 	$4			#push the result back to stack

	addi 	$12, $12, 0x0001
	jr		$31

