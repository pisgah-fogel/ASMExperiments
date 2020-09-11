read battery status

Nice assembler (64b intel) tutorial: https://cs.lmu.edu/~ray/notes/gasexamples/
AMD 64 ABI reference: http://www.x86-64.org/documentation/abi.pdf
SSE2 references: https://softpixel.com/~cwright/programming/simd/sse2.php

Arguments (integers and pointers): rdi, rsi, rdx, rcx, r8, r9.
For floating-point (float, double), xmm0, xmm1, xmm2, xmm3, xmm4, xmm5, xmm6, xmm7
Additional parameters are pushed on the stack, right to left, and are removed by the caller after the call.

After the parameters are pushed, the call instruction is made, so when the called function gets control, the return address is at (%rsp), the first memory parameter is at 8(%rsp), etc.

Integers are returned in rax or rdx:rax, and floating point values are returned in xmm0 or xmm1:xmm0.

The only registers that the called function is required to preserve (the calle-save registers) are: rbp, rbx, r12, r13, r14, r15. All others are free to be changed by the called function.
