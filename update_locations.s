	.file	"update_locations.c"
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
	movl	%edi, -36(%rbp)
	movl	%esi, %eax
	movw	%ax, -40(%rbp)
	movzwl	-40(%rbp), %eax
	pxor	%xmm0, %xmm0
	cvtsi2ss	%eax, %xmm0
	movss	.LC0(%rip), %xmm1
	mulss	%xmm1, %xmm0
	ucomiss	.LC1(%rip), %xmm0
	jnb	.L2
	cvttss2siq	%xmm0, %rax
	jmp	.L3
.L2:
	movss	.LC1(%rip), %xmm1
	subss	%xmm1, %xmm0
	cvttss2siq	%xmm0, %rax
	movabsq	$-9223372036854775808, %rdx
	xorq	%rdx, %rax
.L3:
	movq	%rax, %rdi
	call	malloc
	movq	%rax, -24(%rbp)
	movl	$0, -28(%rbp)
	jmp	.L4
.L5:
	movl	-28(%rbp), %eax
	leaq	0(,%rax,4), %rdx
	movq	-24(%rbp), %rax
	leaq	(%rdx,%rax), %rbx
	call	rand
	pxor	%xmm0, %xmm0
	cvtsi2ss	%eax, %xmm0
	movss	%xmm0, (%rbx)
	addl	$1, -28(%rbp)
.L4:
	movl	-28(%rbp), %eax
	cmpl	-36(%rbp), %eax
	jb	.L5
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
	movl	%edi, -4(%rbp)
	movq	%rsi, -16(%rbp)
	movq	%rdx, -24(%rbp)
	movq	%rcx, -32(%rbp)
	movq	%r8, -40(%rbp)
	movq	%r9, -48(%rbp)
	movl	-4(%rbp), %eax
	leaq	0(,%rax,4), %rdx
	movq	-16(%rbp), %rax
	addq	%rdx, %rax
	movl	-4(%rbp), %edx
	leaq	0(,%rdx,4), %rcx
	movq	-16(%rbp), %rdx
	addq	%rcx, %rdx
	movss	(%rdx), %xmm1
	movl	-4(%rbp), %edx
	leaq	0(,%rdx,4), %rcx
	movq	-40(%rbp), %rdx
	addq	%rcx, %rdx
	movss	(%rdx), %xmm0
	addss	%xmm1, %xmm0
	movss	%xmm0, (%rax)
	movl	-4(%rbp), %eax
	leaq	0(,%rax,4), %rdx
	movq	-24(%rbp), %rax
	addq	%rdx, %rax
	movl	-4(%rbp), %edx
	leaq	0(,%rdx,4), %rcx
	movq	-24(%rbp), %rdx
	addq	%rcx, %rdx
	movss	(%rdx), %xmm1
	movl	-4(%rbp), %edx
	leaq	0(,%rdx,4), %rcx
	movq	-48(%rbp), %rdx
	addq	%rcx, %rdx
	movss	(%rdx), %xmm0
	addss	%xmm1, %xmm0
	movss	%xmm0, (%rax)
	movl	-4(%rbp), %eax
	leaq	0(,%rax,4), %rdx
	movq	-32(%rbp), %rax
	addq	%rdx, %rax
	movl	-4(%rbp), %edx
	leaq	0(,%rdx,4), %rcx
	movq	-32(%rbp), %rdx
	addq	%rcx, %rdx
	movss	(%rdx), %xmm1
	movl	-4(%rbp), %edx
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
	movl	%esi, -28(%rbp)
	pxor	%xmm0, %xmm0
	movss	%xmm0, -8(%rbp)
	movl	$0, -4(%rbp)
	jmp	.L9
.L10:
	movl	-4(%rbp), %eax
	leaq	0(,%rax,4), %rdx
	movq	-24(%rbp), %rax
	addq	%rdx, %rax
	movss	(%rax), %xmm0
	movss	-8(%rbp), %xmm1
	addss	%xmm1, %xmm0
	movss	%xmm0, -8(%rbp)
	addl	$1, -4(%rbp)
.L9:
	movl	-4(%rbp), %eax
	cmpl	-28(%rbp), %eax
	jb	.L10
	movss	-8(%rbp), %xmm0
	popq	%rbp
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE4:
	.size	sum, .-sum
	.section	.rodata
	.align 8
.LC3:
	.string	"Required arguments: vector_length(N) and iterations_num(M)"
	.align 8
.LC5:
	.string	"Mean time per coordinate: %f us\n"
.LC6:
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
	subq	$144, %rsp
	movl	%edi, -132(%rbp)
	movq	%rsi, -144(%rbp)
	movq	%fs:40, %rax
	movq	%rax, -8(%rbp)
	xorl	%eax, %eax
	cmpl	$3, -132(%rbp)
	je	.L13
	movl	$.LC3, %edi
	call	puts
	movl	$-1, %edi
	call	exit
.L13:
	movq	-144(%rbp), %rax
	addq	$8, %rax
	movq	(%rax), %rax
	movzbl	(%rax), %eax
	movsbl	%al, %eax
	movl	%eax, -108(%rbp)
	movq	-144(%rbp), %rax
	addq	$16, %rax
	movq	(%rax), %rax
	movzbl	(%rax), %eax
	movsbl	%al, %eax
	movl	%eax, -104(%rbp)
	movl	-108(%rbp), %eax
	movl	%eax, %edi
	call	srand
	movl	-108(%rbp), %eax
	movl	$1000, %esi
	movl	%eax, %edi
	call	generate_random_list
	movq	%rax, -96(%rbp)
	movl	-108(%rbp), %eax
	movl	$1000, %esi
	movl	%eax, %edi
	call	generate_random_list
	movq	%rax, -88(%rbp)
	movl	-108(%rbp), %eax
	movl	$1000, %esi
	movl	%eax, %edi
	call	generate_random_list
	movq	%rax, -80(%rbp)
	movl	-108(%rbp), %eax
	movl	$1, %esi
	movl	%eax, %edi
	call	generate_random_list
	movq	%rax, -72(%rbp)
	movl	-108(%rbp), %eax
	movl	$1, %esi
	movl	%eax, %edi
	call	generate_random_list
	movq	%rax, -64(%rbp)
	movl	-108(%rbp), %eax
	movl	$1, %esi
	movl	%eax, %edi
	call	generate_random_list
	movq	%rax, -56(%rbp)
	leaq	-48(%rbp), %rax
	movq	%rax, %rsi
	movl	$1, %edi
	call	clock_gettime
	movl	$0, -116(%rbp)
	jmp	.L14
.L17:
	movl	$0, -112(%rbp)
	jmp	.L15
.L16:
	movq	-64(%rbp), %r8
	movq	-72(%rbp), %rdi
	movq	-80(%rbp), %rcx
	movq	-88(%rbp), %rdx
	movq	-96(%rbp), %rsi
	movl	-112(%rbp), %eax
	subq	$8, %rsp
	pushq	-56(%rbp)
	movq	%r8, %r9
	movq	%rdi, %r8
	movl	%eax, %edi
	call	update_coords
	addq	$16, %rsp
	addl	$1, -112(%rbp)
.L15:
	movl	-112(%rbp), %eax
	cmpl	-108(%rbp), %eax
	jb	.L16
	addl	$1, -116(%rbp)
.L14:
	movl	-116(%rbp), %eax
	cmpl	-104(%rbp), %eax
	jb	.L17
	leaq	-32(%rbp), %rax
	movq	%rax, %rsi
	movl	$1, %edi
	call	clock_gettime
	movl	-108(%rbp), %edx
	movq	-96(%rbp), %rax
	movl	%edx, %esi
	movq	%rax, %rdi
	call	sum
	movss	%xmm0, -136(%rbp)
	movl	-108(%rbp), %edx
	movq	-88(%rbp), %rax
	movl	%edx, %esi
	movq	%rax, %rdi
	call	sum
	movaps	%xmm0, %xmm2
	addss	-136(%rbp), %xmm2
	movss	%xmm2, -136(%rbp)
	movl	-108(%rbp), %edx
	movq	-80(%rbp), %rax
	movl	%edx, %esi
	movq	%rax, %rdi
	call	sum
	addss	-136(%rbp), %xmm0
	movss	%xmm0, -100(%rbp)
	movq	-24(%rbp), %rdx
	movq	-40(%rbp), %rax
	subq	%rax, %rdx
	movq	%rdx, %rax
	pxor	%xmm0, %xmm0
	cvtsi2sdq	%rax, %xmm0
	movsd	.LC4(%rip), %xmm1
	divsd	%xmm1, %xmm0
	movapd	%xmm0, %xmm1
	movl	-108(%rbp), %eax
	imull	-104(%rbp), %eax
	movl	%eax, %eax
	testq	%rax, %rax
	js	.L18
	pxor	%xmm0, %xmm0
	cvtsi2sdq	%rax, %xmm0
	jmp	.L19
.L18:
	movq	%rax, %rdx
	shrq	%rdx
	andl	$1, %eax
	orq	%rax, %rdx
	pxor	%xmm0, %xmm0
	cvtsi2sdq	%rdx, %xmm0
	addsd	%xmm0, %xmm0
.L19:
	mulsd	%xmm1, %xmm0
	movl	$.LC5, %edi
	movl	$1, %eax
	call	printf
	cvtss2sd	-100(%rbp), %xmm0
	movl	$.LC6, %edi
	movl	$1, %eax
	call	printf
	movl	$0, %eax
	movq	-8(%rbp), %rcx
	xorq	%fs:40, %rcx
	je	.L21
	call	__stack_chk_fail
.L21:
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
.LC4:
	.long	0
	.long	1104006501
	.ident	"GCC: (Ubuntu 5.2.1-22ubuntu2) 5.2.1 20151010"
	.section	.note.GNU-stack,"",@progbits
