	.file	"update_locations_float.c"
	.text
	.globl	generate_random_list
	.type	generate_random_list, @function
generate_random_list:
.LFB2:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	pushq	%rbx
	subq	$40, %rsp
	.cfi_offset 3, -24
	movq	%rdi, -40(%rbp)
	movq	%rsi, -48(%rbp)
	movq	-40(%rbp), %rax
	testq	%rax, %rax
	js	.L2
	pxor	%xmm0, %xmm0
	cvtsi2ssq	%rax, %xmm0
	jmp	.L3
.L2:
	movq	%rax, %rdx
	shrq	%rdx
	andl	$1, %eax
	orq	%rax, %rdx
	pxor	%xmm0, %xmm0
	cvtsi2ssq	%rdx, %xmm0
	addss	%xmm0, %xmm0
.L3:
	movss	.LC0(%rip), %xmm1
	mulss	%xmm1, %xmm0
	ucomiss	.LC1(%rip), %xmm0
	jnb	.L4
	cvttss2siq	%xmm0, %rax
	jmp	.L5
.L4:
	movss	.LC1(%rip), %xmm1
	subss	%xmm1, %xmm0
	cvttss2siq	%xmm0, %rax
	movabsq	$-9223372036854775808, %rdx
	xorq	%rdx, %rax
.L5:
	movq	%rax, %rdi
	call	malloc
	movq	%rax, -24(%rbp)
	movq	$0, -32(%rbp)
	jmp	.L6
.L9:
	movq	-32(%rbp), %rax
	leaq	0(,%rax,4), %rdx
	movq	-24(%rbp), %rax
	leaq	(%rdx,%rax), %rbx
	call	rand
	pxor	%xmm1, %xmm1
	cvtsi2ss	%eax, %xmm1
	movl	$2147483647, %eax
	movl	$0, %edx
	divq	-48(%rbp)
	testq	%rax, %rax
	js	.L7
	pxor	%xmm0, %xmm0
	cvtsi2ssq	%rax, %xmm0
	jmp	.L8
.L7:
	movq	%rax, %rdx
	shrq	%rdx
	andl	$1, %eax
	orq	%rax, %rdx
	pxor	%xmm0, %xmm0
	cvtsi2ssq	%rdx, %xmm0
	addss	%xmm0, %xmm0
.L8:
	divss	%xmm0, %xmm1
	movaps	%xmm1, %xmm0
	movss	%xmm0, (%rbx)
	addq	$1, -32(%rbp)
.L6:
	movq	-32(%rbp), %rax
	cmpq	-40(%rbp), %rax
	jb	.L9
	movq	-24(%rbp), %rax
	addq	$40, %rsp
	popq	%rbx
	popq	%rbp
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE2:
	.size	generate_random_list, .-generate_random_list
	.globl	update_coords
	.type	update_coords, @function
update_coords:
.LFB3:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	movq	%rdi, -8(%rbp)
	movq	%rsi, -16(%rbp)
	movq	%rdx, -24(%rbp)
	movq	%rcx, -32(%rbp)
	movq	%r8, -40(%rbp)
	movq	%r9, -48(%rbp)
	movq	-8(%rbp), %rax
	leaq	0(,%rax,4), %rdx
	movq	-16(%rbp), %rax
	addq	%rdx, %rax
	movq	-8(%rbp), %rdx
	leaq	0(,%rdx,4), %rcx
	movq	-16(%rbp), %rdx
	addq	%rcx, %rdx
	movss	(%rdx), %xmm1
	movq	-8(%rbp), %rdx
	leaq	0(,%rdx,4), %rcx
	movq	-40(%rbp), %rdx
	addq	%rcx, %rdx
	movss	(%rdx), %xmm0
	addss	%xmm1, %xmm0
	movss	%xmm0, (%rax)
	movq	-8(%rbp), %rax
	leaq	0(,%rax,4), %rdx
	movq	-24(%rbp), %rax
	addq	%rdx, %rax
	movq	-8(%rbp), %rdx
	leaq	0(,%rdx,4), %rcx
	movq	-24(%rbp), %rdx
	addq	%rcx, %rdx
	movss	(%rdx), %xmm1
	movq	-8(%rbp), %rdx
	leaq	0(,%rdx,4), %rcx
	movq	-48(%rbp), %rdx
	addq	%rcx, %rdx
	movss	(%rdx), %xmm0
	addss	%xmm1, %xmm0
	movss	%xmm0, (%rax)
	movq	-8(%rbp), %rax
	leaq	0(,%rax,4), %rdx
	movq	-32(%rbp), %rax
	addq	%rdx, %rax
	movq	-8(%rbp), %rdx
	leaq	0(,%rdx,4), %rcx
	movq	-32(%rbp), %rdx
	addq	%rcx, %rdx
	movss	(%rdx), %xmm1
	movq	-8(%rbp), %rdx
	leaq	0(,%rdx,4), %rcx
	movq	16(%rbp), %rdx
	addq	%rcx, %rdx
	movss	(%rdx), %xmm0
	addss	%xmm1, %xmm0
	movss	%xmm0, (%rax)
	nop
	popq	%rbp
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE3:
	.size	update_coords, .-update_coords
	.globl	sum
	.type	sum, @function
sum:
.LFB4:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	movq	%rdi, -24(%rbp)
	movq	%rsi, -32(%rbp)
	movq	$0, -8(%rbp)
	jmp	.L13
.L14:
	movq	-8(%rbp), %rax
	leaq	0(,%rax,4), %rdx
	movq	-24(%rbp), %rax
	addq	%rdx, %rax
	movss	(%rax), %xmm0
	movss	-12(%rbp), %xmm1
	addss	%xmm1, %xmm0
	movss	%xmm0, -12(%rbp)
	addq	$1, -8(%rbp)
.L13:
	movq	-8(%rbp), %rax
	cmpq	-32(%rbp), %rax
	jb	.L14
	movss	-12(%rbp), %xmm0
	popq	%rbp
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE4:
	.size	sum, .-sum
	.section	.rodata
	.align 8
.LC2:
	.string	"Required arguments: vector_length(N) and iterations_num(M)"
	.align 8
.LC4:
	.string	" (1000000 * %f) / (%lu * %lu))\n"
	.align 8
.LC6:
	.string	"Mean time per coordinate: %f us\n"
.LC7:
	.string	"Final checksum is: %f\n"
	.text
	.globl	main
	.type	main, @function
main:
.LFB5:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$160, %rsp
	movl	%edi, -148(%rbp)
	movq	%rsi, -160(%rbp)
	movq	%fs:40, %rax
	movq	%rax, -8(%rbp)
	xorl	%eax, %eax
	cmpl	$3, -148(%rbp)
	je	.L17
	movl	$.LC2, %edi
	call	puts
	movl	$-1, %edi
	call	exit
.L17:
	movq	-160(%rbp), %rax
	addq	$8, %rax
	movq	(%rax), %rax
	movq	%rax, %rdi
	call	atoi
	cltq
	movq	%rax, -112(%rbp)
	movq	-160(%rbp), %rax
	addq	$16, %rax
	movq	(%rax), %rax
	movq	%rax, %rdi
	call	atoi
	cltq
	movq	%rax, -104(%rbp)
	movq	-112(%rbp), %rax
	movl	%eax, %edi
	call	srand
	movq	-112(%rbp), %rax
	movl	$1000, %esi
	movq	%rax, %rdi
	call	generate_random_list
	movq	%rax, -96(%rbp)
	movq	-112(%rbp), %rax
	movl	$1000, %esi
	movq	%rax, %rdi
	call	generate_random_list
	movq	%rax, -88(%rbp)
	movq	-112(%rbp), %rax
	movl	$1000, %esi
	movq	%rax, %rdi
	call	generate_random_list
	movq	%rax, -80(%rbp)
	movq	-112(%rbp), %rax
	movl	$1, %esi
	movq	%rax, %rdi
	call	generate_random_list
	movq	%rax, -72(%rbp)
	movq	-112(%rbp), %rax
	movl	$1, %esi
	movq	%rax, %rdi
	call	generate_random_list
	movq	%rax, -64(%rbp)
	movq	-112(%rbp), %rax
	movl	$1, %esi
	movq	%rax, %rdi
	call	generate_random_list
	movq	%rax, -56(%rbp)
	leaq	-48(%rbp), %rax
	movq	%rax, %rsi
	movl	$1, %edi
	call	clock_gettime
	movq	$0, -128(%rbp)
	jmp	.L18
.L21:
	movq	$0, -120(%rbp)
	jmp	.L19
.L20:
	movq	-64(%rbp), %r8
	movq	-72(%rbp), %rdi
	movq	-80(%rbp), %rcx
	movq	-88(%rbp), %rdx
	movq	-96(%rbp), %rsi
	movq	-120(%rbp), %rax
	subq	$8, %rsp
	pushq	-56(%rbp)
	movq	%r8, %r9
	movq	%rdi, %r8
	movq	%rax, %rdi
	call	update_coords
	addq	$16, %rsp
	addq	$1, -120(%rbp)
.L19:
	movq	-120(%rbp), %rax
	cmpq	-112(%rbp), %rax
	jb	.L20
	addq	$1, -128(%rbp)
.L18:
	movq	-128(%rbp), %rax
	cmpq	-104(%rbp), %rax
	jb	.L21
	leaq	-32(%rbp), %rax
	movq	%rax, %rsi
	movl	$1, %edi
	call	clock_gettime
	movq	-112(%rbp), %rdx
	movq	-96(%rbp), %rax
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	sum
	movss	%xmm0, -152(%rbp)
	movq	-112(%rbp), %rdx
	movq	-88(%rbp), %rax
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	sum
	movaps	%xmm0, %xmm4
	addss	-152(%rbp), %xmm4
	movss	%xmm4, -152(%rbp)
	movq	-112(%rbp), %rdx
	movq	-80(%rbp), %rax
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	sum
	addss	-152(%rbp), %xmm0
	movss	%xmm0, -136(%rbp)
	movq	-32(%rbp), %rax
	pxor	%xmm1, %xmm1
	cvtsi2sdq	%rax, %xmm1
	movq	-24(%rbp), %rax
	pxor	%xmm0, %xmm0
	cvtsi2sdq	%rax, %xmm0
	movsd	.LC3(%rip), %xmm2
	divsd	%xmm2, %xmm0
	addsd	%xmm1, %xmm0
	movq	-48(%rbp), %rax
	pxor	%xmm2, %xmm2
	cvtsi2sdq	%rax, %xmm2
	movq	-40(%rbp), %rax
	pxor	%xmm1, %xmm1
	cvtsi2sdq	%rax, %xmm1
	movsd	.LC3(%rip), %xmm3
	divsd	%xmm3, %xmm1
	addsd	%xmm2, %xmm1
	subsd	%xmm1, %xmm0
	cvtsd2ss	%xmm0, %xmm6
	movss	%xmm6, -132(%rbp)
	cvtss2sd	-132(%rbp), %xmm0
	movq	-104(%rbp), %rdx
	movq	-112(%rbp), %rax
	movq	%rax, %rsi
	movl	$.LC4, %edi
	movl	$1, %eax
	call	printf
	cvtss2sd	-132(%rbp), %xmm0
	movsd	.LC5(%rip), %xmm1
	mulsd	%xmm0, %xmm1
	movq	-112(%rbp), %rax
	imulq	-104(%rbp), %rax
	testq	%rax, %rax
	js	.L22
	pxor	%xmm0, %xmm0
	cvtsi2sdq	%rax, %xmm0
	jmp	.L23
.L22:
	movq	%rax, %rdx
	shrq	%rdx
	andl	$1, %eax
	orq	%rax, %rdx
	pxor	%xmm0, %xmm0
	cvtsi2sdq	%rdx, %xmm0
	addsd	%xmm0, %xmm0
.L23:
	divsd	%xmm0, %xmm1
	movapd	%xmm1, %xmm0
	movl	$.LC6, %edi
	movl	$1, %eax
	call	printf
	cvtss2sd	-136(%rbp), %xmm0
	movl	$.LC7, %edi
	movl	$1, %eax
	call	printf
	movl	$0, %eax
	movq	-8(%rbp), %rcx
	xorq	%fs:40, %rcx
	je	.L25
	call	__stack_chk_fail
.L25:
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE5:
	.size	main, .-main
	.section	.rodata
	.align 4
.LC0:
	.long	1082130432
	.align 4
.LC1:
	.long	1593835520
	.align 8
.LC3:
	.long	0
	.long	1104006501
	.align 8
.LC5:
	.long	0
	.long	1093567616
	.ident	"GCC: (Ubuntu 5.2.1-22ubuntu2) 5.2.1 20151010"
	.section	.note.GNU-stack,"",@progbits
