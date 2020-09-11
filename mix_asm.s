# 
	.globl test_asm
	.globl max_of_three
	.globl max_of_array
	.globl str_to_int64
	.text
test_asm:
	nop
	mov $10, %rax
	nop
	ret

max_of_three:
	mov %rdi, %rax # result = x
	cmp %rsi, %rax # result < y ?
	cmovl %rsi, %rax # then result = y
	cmp %rdx, %rax
	cmovl %rdx, %rax
	ret

max_of_array:
	mov (%rdi), %rax
	dec %rsi
loop_ma:
	add $8, %rdi
	cmp (%rdi), %rax
	cmovl (%rdi), %rax

	dec %rsi
	jnz loop_ma
	ret

# '0' = 48
str_to_int64:
	xor %rax, %rax # sum = 0
	xor %rdx, %rdx
	mov $10, %rcx
	mov (%rdi), %al # sum = str(0)
	sub $48, %rax
	dec %rsi
loop_sti:
	mul %rcx
	inc %rdi
	mov (%rdi), %dl
	sub $48, %dl
	add %rdx, %rax

	dec %rsi
	jnz loop_sti
	ret
