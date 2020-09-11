	.global _start
	.text 
_start:
	mov $1, %rax
	mov $1, %rdi
	mov $message, %rsi
	mov $13, %rdx
	syscall # write(stdout, message, len)

	mov $60, %rax
	xor %rdi, %rdi
	syscall

message:
	.ascii "Hello, world\n"
