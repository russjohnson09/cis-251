	.file	1 "/home/johnsoru/cis-251/sequence2.c"
	.rdata
	.align	2
$LC0:
	.ascii	"Please enter a positive integer: \000"
	.align	2
$LC1:
	.ascii	"The integer you entered is not positive.\n\000"
	.align	2
$LC2:
	.ascii	"(2*%i + 1)\000"
	.sdata
	.align	2
$LC3:
	.ascii	" + \000"
	.align	2
$LC4:
	.ascii	" = \000"
	.align	2
$LC5:
	.ascii	"%i\n\000"
	.text
	.align	2
	.globl	main
	.ent	main
main:
	.frame	$fp,40,$31		# vars= 16, regs= 2/0, args= 16, extra= 0
	.mask	0xc0000000,-4
	.fmask	0x00000000,0
	subu	$sp,$sp,40
	sw	$31,36($sp)
	sw	$fp,32($sp)
	move	$fp,$sp
	jal	__main
	la	$4,$LC0
	jal	syscall_print_string
	jal	syscall_read_int
	sw	$2,16($fp)
	lw	$2,16($fp)
	bgez	$2,$L2
	la	$4,$LC1
	jal	printf
	li	$4,1			# 0x1
	jal	exit
$L2:
	sw	$0,20($fp)
	sw	$0,24($fp)
$L3:
	lw	$2,24($fp)
	lw	$3,16($fp)
	slt	$2,$2,$3
	bne	$2,$0,$L6
	j	$L4
$L6:
	lw	$2,24($fp)
	sll	$3,$2,1
	lw	$2,20($fp)
	addu	$2,$3,$2
	addu	$2,$2,1
	sw	$2,20($fp)
	la	$4,$LC2
	lw	$5,24($fp)
	jal	printf
	lw	$2,16($fp)
	addu	$3,$2,-1
	lw	$2,24($fp)
	slt	$2,$2,$3
	beq	$2,$0,$L7
	la	$4,$LC3
	jal	printf
	j	$L5
$L7:
	la	$4,$LC4
	jal	printf
$L5:
	lw	$2,24($fp)
	addu	$2,$2,1
	sw	$2,24($fp)
	j	$L3
$L4:
	la	$4,$LC5
	lw	$5,20($fp)
	jal	printf
	move	$2,$0
	move	$sp,$fp
	lw	$31,36($sp)
	lw	$fp,32($sp)
	addu	$sp,$sp,40
	j	$31
	.end	main
