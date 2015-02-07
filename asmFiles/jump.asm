org 0x0000

ori $1, $0, 0xdead
ori $2, $0, 0x00ad
ori $3, $0, 0xde00
jal mult
j label2
jal mult
label2:
halt

mult:
add $4, $3, $2
bne $4, $1, ret
ori $4,$0,0x0000
or $4, $2, $3
beq $4, $1, ret
ret:
jr $31
