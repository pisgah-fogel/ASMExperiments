	.global main
	.text
main:
	push    %rdi
	push    %rsi
	sub     $8, %rsp
	mov     (%rsi), %rdi
	call    puts
	add     $8, %rsp
	pop     %rsi
	pop     %rdi
	add     $8, %rsi
	dec     %rdi
	jnz     main
	ret
format:
	.asciz  "%s\n"
