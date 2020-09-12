	.global main
	.text
main:
	mov %rdi, argc
	mov %rsi, argv

	add $8, %rsp
	mov $1, %rax
	mov $1, %rdi
	#mov $hello, %rsi
	mov argv, %rsi
	mov $14, %rdx
	syscall # write(stdout, message, len)

	mov $format, %rdi
	mov (argv), %rsi
	xor %rax, %rax
	sub $8, %rsp # align stack
	call printf
	add $8, %rsp

exit:
	mov $60, %rax
	xor %rdi, %rdi
	syscall # exit(0)

	.data
hello:	.ascii "Hello, world!\n"
format:	.asciz "Argv %s\n"
argc:	.quad	0
argv:	.quad	0
