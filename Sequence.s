	.file	"Sequence.c"
	.local	syscall_buf
	.comm	syscall_buf,256,32
	.section	.rodata
	.align 4
.LC0:
	.string	"Please enter a positive integer: "
	.align 4
.LC1:
	.string	"The integer you entered is not positive."
.LC2:
	.string	"(2*%i + 1)"
.LC3:
	.string	" + "
.LC4:
	.string	" = "
.LC5:
	.string	"%i\n"
	.text
	.globl	main
	.type	main, @function
main:
.LFB0:
	.cfi_startproc
	pushl	%ebp
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	movl	%esp, %ebp
	.cfi_def_cfa_register 5
	andl	$-16, %esp
	subl	$32, %esp
	movl	stdout, %eax
	movl	%eax, %edx
	movl	$.LC0, %eax
	movl	%edx, 12(%esp)
	movl	$33, 8(%esp)
	movl	$1, 4(%esp)
	movl	%eax, (%esp)
	call	fwrite
	movl	stdin, %eax
	movl	%eax, 8(%esp)
	movl	$256, 4(%esp)
	movl	$syscall_buf, (%esp)
	call	fgets
	movl	%eax, (%esp)
	call	atoi
	movl	%eax, 28(%esp)
	cmpl	$0, 28(%esp)
	jns	.L2
	movl	$.LC1, (%esp)
	call	puts
	movl	$1, (%esp)
	call	exit
.L2:
	movl	$0, 20(%esp)
	movl	$0, 24(%esp)
	jmp	.L3
.L6:
	movl	24(%esp), %eax
	addl	%eax, %eax
	addl	$1, %eax
	addl	%eax, 20(%esp)
	movl	$.LC2, %eax
	movl	24(%esp), %edx
	movl	%edx, 4(%esp)
	movl	%eax, (%esp)
	call	printf
	movl	28(%esp), %eax
	subl	$1, %eax
	cmpl	24(%esp), %eax
	jle	.L4
	movl	$.LC3, %eax
	movl	%eax, (%esp)
	call	printf
	jmp	.L5
.L4:
	movl	$.LC4, %eax
	movl	%eax, (%esp)
	call	printf
.L5:
	addl	$1, 24(%esp)
.L3:
	movl	24(%esp), %eax
	cmpl	28(%esp), %eax
	jl	.L6
	movl	$.LC5, %eax
	movl	20(%esp), %edx
	movl	%edx, 4(%esp)
	movl	%eax, (%esp)
	call	printf
	movl	$0, %eax
	leave
	.cfi_restore 5
	.cfi_def_cfa 4, 4
	ret
	.cfi_endproc
.LFE0:
	.size	main, .-main
	.ident	"GCC: (Ubuntu/Linaro 4.6.1-9ubuntu3) 4.6.1"
	.section	.note.GNU-stack,"",@progbits
