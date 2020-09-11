	.file	"main.c"
	.text
	.section	.rodata
.LC0:
	.string	"r"
.LC1:
	.string	"Error, cannot read file\n"
	.text
	.globl	print_file
	.type	print_file, @function
print_file:
.LFB6:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$64, %rsp
	movq	%rdi, -56(%rbp)
	movq	%fs:40, %rax
	movq	%rax, -8(%rbp)
	xorl	%eax, %eax
	movq	-56(%rbp), %rax
	leaq	.LC0(%rip), %rsi
	movq	%rax, %rdi
	call	fopen@PLT
	movq	%rax, -40(%rbp)
	cmpq	$0, -40(%rbp)
	jne	.L2
	movq	stdout(%rip), %rax
	movq	%rax, %rcx
	movl	$24, %edx
	movl	$1, %esi
	leaq	.LC1(%rip), %rdi
	call	fwrite@PLT
	jmp	.L1
.L2:
	movq	-40(%rbp), %rdx
	leaq	-18(%rbp), %rax
	movq	%rdx, %rcx
	movl	$10, %edx
	movl	$1, %esi
	movq	%rax, %rdi
	call	fread@PLT
	movq	%rax, -32(%rbp)
	movq	stdout(%rip), %rcx
	movq	-32(%rbp), %rdx
	leaq	-18(%rbp), %rax
	movl	$1, %esi
	movq	%rax, %rdi
	call	fwrite@PLT
	cmpq	$10, -32(%rbp)
	je	.L2
	movq	-40(%rbp), %rax
	movq	%rax, %rdi
	call	fclose@PLT
.L1:
	movq	-8(%rbp), %rax
	xorq	%fs:40, %rax
	je	.L4
	call	__stack_chk_fail@PLT
.L4:
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE6:
	.size	print_file, .-print_file
	.section	.rodata
	.align 8
.LC2:
	.string	"Warning: better increase the buffer's size\n"
	.text
	.globl	int_from_file
	.type	int_from_file, @function
int_from_file:
.LFB7:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$64, %rsp
	movq	%rdi, -56(%rbp)
	movq	%fs:40, %rax
	movq	%rax, -8(%rbp)
	xorl	%eax, %eax
	movq	-56(%rbp), %rax
	leaq	.LC0(%rip), %rsi
	movq	%rax, %rdi
	call	fopen@PLT
	movq	%rax, -32(%rbp)
	cmpq	$0, -32(%rbp)
	jne	.L6
	movq	stdout(%rip), %rax
	movq	%rax, %rcx
	movl	$24, %edx
	movl	$1, %esi
	leaq	.LC1(%rip), %rdi
	call	fwrite@PLT
	movl	$-1, %eax
	jmp	.L9
.L6:
	movq	-32(%rbp), %rdx
	leaq	-18(%rbp), %rax
	movq	%rdx, %rcx
	movl	$10, %edx
	movl	$1, %esi
	movq	%rax, %rdi
	call	fread@PLT
	movl	%eax, -40(%rbp)
	cmpl	$9, -40(%rbp)
	jle	.L8
	movq	stdout(%rip), %rax
	movq	%rax, %rcx
	movl	$43, %edx
	movl	$1, %esi
	leaq	.LC2(%rip), %rdi
	call	fwrite@PLT
.L8:
	leaq	-18(%rbp), %rax
	movq	%rax, %rdi
	call	atoi@PLT
	movl	%eax, -36(%rbp)
	movq	-32(%rbp), %rax
	movq	%rax, %rdi
	call	fclose@PLT
	movl	-36(%rbp), %eax
.L9:
	movq	-8(%rbp), %rcx
	xorq	%fs:40, %rcx
	je	.L10
	call	__stack_chk_fail@PLT
.L10:
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE7:
	.size	int_from_file, .-int_from_file
	.section	.rodata
	.align 8
.LC3:
	.string	"/sys/class/power_supply/BATC/charge_now"
	.align 8
.LC4:
	.string	"/sys/class/power_supply/BATC/charge_full"
.LC5:
	.string	"Charge: %d / %d "
.LC6:
	.string	" %d% \n"
	.align 8
.LC7:
	.string	"/sys/class/power_supply/BATC/capacity"
.LC8:
	.string	"Capacity: %d - "
	.align 8
.LC9:
	.string	"/sys/class/power_supply/BATC/capacity_level"
	.align 8
.LC10:
	.string	"/sys/class/power_supply/BATC/voltage_now"
	.align 8
.LC11:
	.string	"/sys/class/power_supply/BATC/voltage_min_design"
.LC12:
	.string	"Voltage: %d, min: %d\n"
	.text
	.globl	main
	.type	main, @function
main:
.LFB8:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$48, %rsp
	movl	%edi, -36(%rbp)
	movq	%rsi, -48(%rbp)
	leaq	.LC3(%rip), %rdi
	call	int_from_file
	movl	%eax, -24(%rbp)
	leaq	.LC4(%rip), %rdi
	call	int_from_file
	movl	%eax, -20(%rbp)
	movl	-20(%rbp), %edx
	movl	-24(%rbp), %eax
	movl	%eax, %esi
	leaq	.LC5(%rip), %rdi
	movl	$0, %eax
	call	printf@PLT
	movl	-24(%rbp), %eax
	imull	$100, %eax, %eax
	cltd
	idivl	-20(%rbp)
	movl	%eax, -16(%rbp)
	movl	-16(%rbp), %eax
	movl	%eax, %esi
	leaq	.LC6(%rip), %rdi
	movl	$0, %eax
	call	printf@PLT
	leaq	.LC7(%rip), %rdi
	call	int_from_file
	movl	%eax, -12(%rbp)
	movl	-12(%rbp), %eax
	movl	%eax, %esi
	leaq	.LC8(%rip), %rdi
	movl	$0, %eax
	call	printf@PLT
	leaq	.LC9(%rip), %rdi
	call	print_file
	leaq	.LC10(%rip), %rdi
	call	int_from_file
	movl	%eax, -8(%rbp)
	leaq	.LC11(%rip), %rdi
	call	int_from_file
	movl	%eax, -4(%rbp)
	movl	-4(%rbp), %edx
	movl	-8(%rbp), %eax
	movl	%eax, %esi
	leaq	.LC12(%rip), %rdi
	movl	$0, %eax
	call	printf@PLT
	movl	$0, %eax
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE8:
	.size	main, .-main
	.ident	"GCC: (Arch Linux 9.2.1+20200130-2) 9.2.1 20200130"
	.section	.note.GNU-stack,"",@progbits
