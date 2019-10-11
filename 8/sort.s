	.section	__TEXT,__text,regular,pure_instructions
	.build_version macos, 10, 15	sdk_version 10, 15
	.globl	_swap                   ## -- Begin function swap
	.p2align	4, 0x90
_swap:                                  ## @swap
Lfunc_begin0:
	.file	1 "/Users/Madhav/Desktop/Compiler/8" "sort.c"
	.loc	1 3 0                   ## sort.c:3:0
	.cfi_startproc
## %bb.0:
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset %rbp, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register %rbp
	movq	%rdi, -8(%rbp)
	movq	%rsi, -16(%rbp)
Ltmp0:
	.loc	1 4 11 prologue_end     ## sort.c:4:11
	movq	-8(%rbp), %rsi
	.loc	1 4 10 is_stmt 0        ## sort.c:4:10
	movl	(%rsi), %eax
	.loc	1 4 6                   ## sort.c:4:6
	movl	%eax, -20(%rbp)
	.loc	1 5 8 is_stmt 1         ## sort.c:5:8
	movq	-16(%rbp), %rsi
	.loc	1 5 7 is_stmt 0         ## sort.c:5:7
	movl	(%rsi), %eax
	.loc	1 5 3                   ## sort.c:5:3
	movq	-8(%rbp), %rsi
	.loc	1 5 5                   ## sort.c:5:5
	movl	%eax, (%rsi)
	.loc	1 6 7 is_stmt 1         ## sort.c:6:7
	movl	-20(%rbp), %eax
	.loc	1 6 3 is_stmt 0         ## sort.c:6:3
	movq	-16(%rbp), %rsi
	.loc	1 6 5                   ## sort.c:6:5
	movl	%eax, (%rsi)
	.loc	1 7 1 is_stmt 1         ## sort.c:7:1
	popq	%rbp
	retq
Ltmp1:
Lfunc_end0:
	.cfi_endproc
                                        ## -- End function
	.globl	_main                   ## -- Begin function main
	.p2align	4, 0x90
_main:                                  ## @main
Lfunc_begin1:
	.loc	1 9 0                   ## sort.c:9:0
	.cfi_startproc
## %bb.0:
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset %rbp, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register %rbp
	subq	$48, %rsp
	movq	___stack_chk_guard@GOTPCREL(%rip), %rax
	movq	(%rax), %rax
	movq	%rax, -8(%rbp)
	movl	$0, -36(%rbp)
Ltmp2:
	.loc	1 12 6 prologue_end     ## sort.c:12:6
	movq	L___const.main.arr(%rip), %rax
	movq	%rax, -32(%rbp)
	movq	L___const.main.arr+8(%rip), %rax
	movq	%rax, -24(%rbp)
Ltmp3:
	.loc	1 14 7                  ## sort.c:14:7
	movl	$0, -40(%rbp)
LBB1_1:                                 ## =>This Loop Header: Depth=1
                                        ##     Child Loop BB1_3 Depth 2
Ltmp4:
	.loc	1 14 11 is_stmt 0       ## sort.c:14:11
	cmpl	$4, -40(%rbp)
Ltmp5:
	.loc	1 14 2                  ## sort.c:14:2
	jge	LBB1_10
## %bb.2:                               ##   in Loop: Header=BB1_1 Depth=1
Ltmp6:
	.loc	1 15 9 is_stmt 1        ## sort.c:15:9
	movl	-40(%rbp), %eax
	.loc	1 15 10 is_stmt 0       ## sort.c:15:10
	addl	$1, %eax
	.loc	1 15 8                  ## sort.c:15:8
	movl	%eax, -44(%rbp)
LBB1_3:                                 ##   Parent Loop BB1_1 Depth=1
                                        ## =>  This Inner Loop Header: Depth=2
Ltmp7:
	.loc	1 15 14                 ## sort.c:15:14
	cmpl	$4, -44(%rbp)
Ltmp8:
	.loc	1 15 3                  ## sort.c:15:3
	jge	LBB1_8
## %bb.4:                               ##   in Loop: Header=BB1_3 Depth=2
Ltmp9:
	.loc	1 16 7 is_stmt 1        ## sort.c:16:7
	movslq	-40(%rbp), %rax
	movl	-32(%rbp,%rax,4), %ecx
	.loc	1 16 14 is_stmt 0       ## sort.c:16:14
	movslq	-44(%rbp), %rax
	.loc	1 16 13                 ## sort.c:16:13
	cmpl	-32(%rbp,%rax,4), %ecx
Ltmp10:
	.loc	1 16 7                  ## sort.c:16:7
	jle	LBB1_6
## %bb.5:                               ##   in Loop: Header=BB1_3 Depth=2
Ltmp11:
	.loc	1 17 11 is_stmt 1       ## sort.c:17:11
	movslq	-40(%rbp), %rax
	shlq	$2, %rax
	leaq	-32(%rbp), %rcx
	movq	%rcx, %rdx
	addq	%rax, %rdx
	.loc	1 17 19 is_stmt 0       ## sort.c:17:19
	movslq	-44(%rbp), %rax
	shlq	$2, %rax
	addq	%rax, %rcx
	.loc	1 17 5                  ## sort.c:17:5
	movq	%rdx, %rdi
	movq	%rcx, %rsi
	callq	_swap
LBB1_6:                                 ##   in Loop: Header=BB1_3 Depth=2
	.loc	1 16 19 is_stmt 1       ## sort.c:16:19
	jmp	LBB1_7
Ltmp12:
LBB1_7:                                 ##   in Loop: Header=BB1_3 Depth=2
	.loc	1 15 18                 ## sort.c:15:18
	movl	-44(%rbp), %eax
	addl	$1, %eax
	movl	%eax, -44(%rbp)
	.loc	1 15 3 is_stmt 0        ## sort.c:15:3
	jmp	LBB1_3
Ltmp13:
LBB1_8:                                 ##   in Loop: Header=BB1_1 Depth=1
	.loc	1 17 25 is_stmt 1       ## sort.c:17:25
	jmp	LBB1_9
Ltmp14:
LBB1_9:                                 ##   in Loop: Header=BB1_1 Depth=1
	.loc	1 14 15                 ## sort.c:14:15
	movl	-40(%rbp), %eax
	addl	$1, %eax
	movl	%eax, -40(%rbp)
	.loc	1 14 2 is_stmt 0        ## sort.c:14:2
	jmp	LBB1_1
Ltmp15:
LBB1_10:
	.loc	1 0 2                   ## sort.c:0:2
	movq	___stack_chk_guard@GOTPCREL(%rip), %rax
	movq	(%rax), %rax
	movq	-8(%rbp), %rcx
	cmpq	%rcx, %rax
	jne	LBB1_12
## %bb.11:
	xorl	%eax, %eax
	.loc	1 19 2 is_stmt 1        ## sort.c:19:2
	addq	$48, %rsp
	popq	%rbp
	retq
LBB1_12:
	.loc	1 0 0 is_stmt 0         ## sort.c:0:0
	callq	___stack_chk_fail
	ud2
Ltmp16:
Lfunc_end1:
	.cfi_endproc
                                        ## -- End function
	.section	__TEXT,__literal16,16byte_literals
	.p2align	4               ## @__const.main.arr
L___const.main.arr:
	.long	2                       ## 0x2
	.long	5                       ## 0x5
	.long	3                       ## 0x3
	.long	1                       ## 0x1

	.section	__DWARF,__debug_str,regular,debug
Linfo_string:
	.asciz	"Apple clang version 11.0.0 (clang-1100.0.32.5)" ## string offset=0
	.asciz	"sort.c"                ## string offset=47
	.asciz	"/Users/Madhav/Desktop/Compiler/8" ## string offset=54
	.asciz	"swap"                  ## string offset=87
	.asciz	"main"                  ## string offset=92
	.asciz	"int"                   ## string offset=97
	.asciz	"a"                     ## string offset=101
	.asciz	"b"                     ## string offset=103
	.asciz	"t"                     ## string offset=105
	.asciz	"i"                     ## string offset=107
	.asciz	"j"                     ## string offset=109
	.asciz	"k"                     ## string offset=111
	.asciz	"arr"                   ## string offset=113
	.asciz	"__ARRAY_SIZE_TYPE__"   ## string offset=117
	.section	__DWARF,__debug_abbrev,regular,debug
Lsection_abbrev:
	.byte	1                       ## Abbreviation Code
	.byte	17                      ## DW_TAG_compile_unit
	.byte	1                       ## DW_CHILDREN_yes
	.byte	37                      ## DW_AT_producer
	.byte	14                      ## DW_FORM_strp
	.byte	19                      ## DW_AT_language
	.byte	5                       ## DW_FORM_data2
	.byte	3                       ## DW_AT_name
	.byte	14                      ## DW_FORM_strp
	.byte	16                      ## DW_AT_stmt_list
	.byte	23                      ## DW_FORM_sec_offset
	.byte	27                      ## DW_AT_comp_dir
	.byte	14                      ## DW_FORM_strp
	.ascii	"\264B"                 ## DW_AT_GNU_pubnames
	.byte	25                      ## DW_FORM_flag_present
	.byte	17                      ## DW_AT_low_pc
	.byte	1                       ## DW_FORM_addr
	.byte	18                      ## DW_AT_high_pc
	.byte	6                       ## DW_FORM_data4
	.byte	0                       ## EOM(1)
	.byte	0                       ## EOM(2)
	.byte	2                       ## Abbreviation Code
	.byte	46                      ## DW_TAG_subprogram
	.byte	1                       ## DW_CHILDREN_yes
	.byte	17                      ## DW_AT_low_pc
	.byte	1                       ## DW_FORM_addr
	.byte	18                      ## DW_AT_high_pc
	.byte	6                       ## DW_FORM_data4
	.byte	64                      ## DW_AT_frame_base
	.byte	24                      ## DW_FORM_exprloc
	.byte	3                       ## DW_AT_name
	.byte	14                      ## DW_FORM_strp
	.byte	58                      ## DW_AT_decl_file
	.byte	11                      ## DW_FORM_data1
	.byte	59                      ## DW_AT_decl_line
	.byte	11                      ## DW_FORM_data1
	.byte	39                      ## DW_AT_prototyped
	.byte	25                      ## DW_FORM_flag_present
	.byte	63                      ## DW_AT_external
	.byte	25                      ## DW_FORM_flag_present
	.byte	0                       ## EOM(1)
	.byte	0                       ## EOM(2)
	.byte	3                       ## Abbreviation Code
	.byte	5                       ## DW_TAG_formal_parameter
	.byte	0                       ## DW_CHILDREN_no
	.byte	2                       ## DW_AT_location
	.byte	24                      ## DW_FORM_exprloc
	.byte	3                       ## DW_AT_name
	.byte	14                      ## DW_FORM_strp
	.byte	58                      ## DW_AT_decl_file
	.byte	11                      ## DW_FORM_data1
	.byte	59                      ## DW_AT_decl_line
	.byte	11                      ## DW_FORM_data1
	.byte	73                      ## DW_AT_type
	.byte	19                      ## DW_FORM_ref4
	.byte	0                       ## EOM(1)
	.byte	0                       ## EOM(2)
	.byte	4                       ## Abbreviation Code
	.byte	52                      ## DW_TAG_variable
	.byte	0                       ## DW_CHILDREN_no
	.byte	2                       ## DW_AT_location
	.byte	24                      ## DW_FORM_exprloc
	.byte	3                       ## DW_AT_name
	.byte	14                      ## DW_FORM_strp
	.byte	58                      ## DW_AT_decl_file
	.byte	11                      ## DW_FORM_data1
	.byte	59                      ## DW_AT_decl_line
	.byte	11                      ## DW_FORM_data1
	.byte	73                      ## DW_AT_type
	.byte	19                      ## DW_FORM_ref4
	.byte	0                       ## EOM(1)
	.byte	0                       ## EOM(2)
	.byte	5                       ## Abbreviation Code
	.byte	46                      ## DW_TAG_subprogram
	.byte	1                       ## DW_CHILDREN_yes
	.byte	17                      ## DW_AT_low_pc
	.byte	1                       ## DW_FORM_addr
	.byte	18                      ## DW_AT_high_pc
	.byte	6                       ## DW_FORM_data4
	.byte	64                      ## DW_AT_frame_base
	.byte	24                      ## DW_FORM_exprloc
	.byte	3                       ## DW_AT_name
	.byte	14                      ## DW_FORM_strp
	.byte	58                      ## DW_AT_decl_file
	.byte	11                      ## DW_FORM_data1
	.byte	59                      ## DW_AT_decl_line
	.byte	11                      ## DW_FORM_data1
	.byte	73                      ## DW_AT_type
	.byte	19                      ## DW_FORM_ref4
	.byte	63                      ## DW_AT_external
	.byte	25                      ## DW_FORM_flag_present
	.byte	0                       ## EOM(1)
	.byte	0                       ## EOM(2)
	.byte	6                       ## Abbreviation Code
	.byte	36                      ## DW_TAG_base_type
	.byte	0                       ## DW_CHILDREN_no
	.byte	3                       ## DW_AT_name
	.byte	14                      ## DW_FORM_strp
	.byte	62                      ## DW_AT_encoding
	.byte	11                      ## DW_FORM_data1
	.byte	11                      ## DW_AT_byte_size
	.byte	11                      ## DW_FORM_data1
	.byte	0                       ## EOM(1)
	.byte	0                       ## EOM(2)
	.byte	7                       ## Abbreviation Code
	.byte	15                      ## DW_TAG_pointer_type
	.byte	0                       ## DW_CHILDREN_no
	.byte	73                      ## DW_AT_type
	.byte	19                      ## DW_FORM_ref4
	.byte	0                       ## EOM(1)
	.byte	0                       ## EOM(2)
	.byte	8                       ## Abbreviation Code
	.byte	1                       ## DW_TAG_array_type
	.byte	1                       ## DW_CHILDREN_yes
	.byte	73                      ## DW_AT_type
	.byte	19                      ## DW_FORM_ref4
	.byte	0                       ## EOM(1)
	.byte	0                       ## EOM(2)
	.byte	9                       ## Abbreviation Code
	.byte	33                      ## DW_TAG_subrange_type
	.byte	0                       ## DW_CHILDREN_no
	.byte	73                      ## DW_AT_type
	.byte	19                      ## DW_FORM_ref4
	.byte	55                      ## DW_AT_count
	.byte	11                      ## DW_FORM_data1
	.byte	0                       ## EOM(1)
	.byte	0                       ## EOM(2)
	.byte	10                      ## Abbreviation Code
	.byte	36                      ## DW_TAG_base_type
	.byte	0                       ## DW_CHILDREN_no
	.byte	3                       ## DW_AT_name
	.byte	14                      ## DW_FORM_strp
	.byte	11                      ## DW_AT_byte_size
	.byte	11                      ## DW_FORM_data1
	.byte	62                      ## DW_AT_encoding
	.byte	11                      ## DW_FORM_data1
	.byte	0                       ## EOM(1)
	.byte	0                       ## EOM(2)
	.byte	0                       ## EOM(3)
	.section	__DWARF,__debug_info,regular,debug
Lsection_info:
Lcu_begin0:
.set Lset0, Ldebug_info_end0-Ldebug_info_start0 ## Length of Unit
	.long	Lset0
Ldebug_info_start0:
	.short	4                       ## DWARF version number
.set Lset1, Lsection_abbrev-Lsection_abbrev ## Offset Into Abbrev. Section
	.long	Lset1
	.byte	8                       ## Address Size (in bytes)
	.byte	1                       ## Abbrev [1] 0xb:0xd1 DW_TAG_compile_unit
	.long	0                       ## DW_AT_producer
	.short	12                      ## DW_AT_language
	.long	47                      ## DW_AT_name
.set Lset2, Lline_table_start0-Lsection_line ## DW_AT_stmt_list
	.long	Lset2
	.long	54                      ## DW_AT_comp_dir
                                        ## DW_AT_GNU_pubnames
	.quad	Lfunc_begin0            ## DW_AT_low_pc
.set Lset3, Lfunc_end1-Lfunc_begin0     ## DW_AT_high_pc
	.long	Lset3
	.byte	2                       ## Abbrev [2] 0x2a:0x40 DW_TAG_subprogram
	.quad	Lfunc_begin0            ## DW_AT_low_pc
.set Lset4, Lfunc_end0-Lfunc_begin0     ## DW_AT_high_pc
	.long	Lset4
	.byte	1                       ## DW_AT_frame_base
	.byte	86
	.long	87                      ## DW_AT_name
	.byte	1                       ## DW_AT_decl_file
	.byte	3                       ## DW_AT_decl_line
                                        ## DW_AT_prototyped
                                        ## DW_AT_external
	.byte	3                       ## Abbrev [3] 0x3f:0xe DW_TAG_formal_parameter
	.byte	2                       ## DW_AT_location
	.byte	145
	.byte	120
	.long	101                     ## DW_AT_name
	.byte	1                       ## DW_AT_decl_file
	.byte	3                       ## DW_AT_decl_line
	.long	195                     ## DW_AT_type
	.byte	3                       ## Abbrev [3] 0x4d:0xe DW_TAG_formal_parameter
	.byte	2                       ## DW_AT_location
	.byte	145
	.byte	112
	.long	103                     ## DW_AT_name
	.byte	1                       ## DW_AT_decl_file
	.byte	3                       ## DW_AT_decl_line
	.long	195                     ## DW_AT_type
	.byte	4                       ## Abbrev [4] 0x5b:0xe DW_TAG_variable
	.byte	2                       ## DW_AT_location
	.byte	145
	.byte	108
	.long	105                     ## DW_AT_name
	.byte	1                       ## DW_AT_decl_file
	.byte	4                       ## DW_AT_decl_line
	.long	188                     ## DW_AT_type
	.byte	0                       ## End Of Children Mark
	.byte	5                       ## Abbrev [5] 0x6a:0x52 DW_TAG_subprogram
	.quad	Lfunc_begin1            ## DW_AT_low_pc
.set Lset5, Lfunc_end1-Lfunc_begin1     ## DW_AT_high_pc
	.long	Lset5
	.byte	1                       ## DW_AT_frame_base
	.byte	86
	.long	92                      ## DW_AT_name
	.byte	1                       ## DW_AT_decl_file
	.byte	9                       ## DW_AT_decl_line
	.long	188                     ## DW_AT_type
                                        ## DW_AT_external
	.byte	4                       ## Abbrev [4] 0x83:0xe DW_TAG_variable
	.byte	2                       ## DW_AT_location
	.byte	145
	.byte	88
	.long	107                     ## DW_AT_name
	.byte	1                       ## DW_AT_decl_file
	.byte	11                      ## DW_AT_decl_line
	.long	188                     ## DW_AT_type
	.byte	4                       ## Abbrev [4] 0x91:0xe DW_TAG_variable
	.byte	2                       ## DW_AT_location
	.byte	145
	.byte	84
	.long	109                     ## DW_AT_name
	.byte	1                       ## DW_AT_decl_file
	.byte	11                      ## DW_AT_decl_line
	.long	188                     ## DW_AT_type
	.byte	4                       ## Abbrev [4] 0x9f:0xe DW_TAG_variable
	.byte	2                       ## DW_AT_location
	.byte	145
	.byte	80
	.long	111                     ## DW_AT_name
	.byte	1                       ## DW_AT_decl_file
	.byte	11                      ## DW_AT_decl_line
	.long	188                     ## DW_AT_type
	.byte	4                       ## Abbrev [4] 0xad:0xe DW_TAG_variable
	.byte	2                       ## DW_AT_location
	.byte	145
	.byte	96
	.long	113                     ## DW_AT_name
	.byte	1                       ## DW_AT_decl_file
	.byte	12                      ## DW_AT_decl_line
	.long	200                     ## DW_AT_type
	.byte	0                       ## End Of Children Mark
	.byte	6                       ## Abbrev [6] 0xbc:0x7 DW_TAG_base_type
	.long	97                      ## DW_AT_name
	.byte	5                       ## DW_AT_encoding
	.byte	4                       ## DW_AT_byte_size
	.byte	7                       ## Abbrev [7] 0xc3:0x5 DW_TAG_pointer_type
	.long	188                     ## DW_AT_type
	.byte	8                       ## Abbrev [8] 0xc8:0xc DW_TAG_array_type
	.long	188                     ## DW_AT_type
	.byte	9                       ## Abbrev [9] 0xcd:0x6 DW_TAG_subrange_type
	.long	212                     ## DW_AT_type
	.byte	4                       ## DW_AT_count
	.byte	0                       ## End Of Children Mark
	.byte	10                      ## Abbrev [10] 0xd4:0x7 DW_TAG_base_type
	.long	117                     ## DW_AT_name
	.byte	8                       ## DW_AT_byte_size
	.byte	7                       ## DW_AT_encoding
	.byte	0                       ## End Of Children Mark
Ldebug_info_end0:
	.section	__DWARF,__debug_macinfo,regular,debug
Ldebug_macinfo:
	.byte	0                       ## End Of Macro List Mark
	.section	__DWARF,__apple_names,regular,debug
Lnames_begin:
	.long	1212240712              ## Header Magic
	.short	1                       ## Header Version
	.short	0                       ## Header Hash Function
	.long	2                       ## Header Bucket Count
	.long	2                       ## Header Hash Count
	.long	12                      ## Header Data Length
	.long	0                       ## HeaderData Die Offset Base
	.long	1                       ## HeaderData Atom Count
	.short	1                       ## DW_ATOM_die_offset
	.short	6                       ## DW_FORM_data4
	.long	0                       ## Bucket 0
	.long	-1                      ## Bucket 1
	.long	2090499946              ## Hash in Bucket 0
	.long	2090739264              ## Hash in Bucket 0
.set Lset6, LNames0-Lnames_begin        ## Offset in Bucket 0
	.long	Lset6
.set Lset7, LNames1-Lnames_begin        ## Offset in Bucket 0
	.long	Lset7
LNames0:
	.long	92                      ## main
	.long	1                       ## Num DIEs
	.long	106
	.long	0
LNames1:
	.long	87                      ## swap
	.long	1                       ## Num DIEs
	.long	42
	.long	0
	.section	__DWARF,__apple_objc,regular,debug
Lobjc_begin:
	.long	1212240712              ## Header Magic
	.short	1                       ## Header Version
	.short	0                       ## Header Hash Function
	.long	1                       ## Header Bucket Count
	.long	0                       ## Header Hash Count
	.long	12                      ## Header Data Length
	.long	0                       ## HeaderData Die Offset Base
	.long	1                       ## HeaderData Atom Count
	.short	1                       ## DW_ATOM_die_offset
	.short	6                       ## DW_FORM_data4
	.long	-1                      ## Bucket 0
	.section	__DWARF,__apple_namespac,regular,debug
Lnamespac_begin:
	.long	1212240712              ## Header Magic
	.short	1                       ## Header Version
	.short	0                       ## Header Hash Function
	.long	1                       ## Header Bucket Count
	.long	0                       ## Header Hash Count
	.long	12                      ## Header Data Length
	.long	0                       ## HeaderData Die Offset Base
	.long	1                       ## HeaderData Atom Count
	.short	1                       ## DW_ATOM_die_offset
	.short	6                       ## DW_FORM_data4
	.long	-1                      ## Bucket 0
	.section	__DWARF,__apple_types,regular,debug
Ltypes_begin:
	.long	1212240712              ## Header Magic
	.short	1                       ## Header Version
	.short	0                       ## Header Hash Function
	.long	2                       ## Header Bucket Count
	.long	2                       ## Header Hash Count
	.long	20                      ## Header Data Length
	.long	0                       ## HeaderData Die Offset Base
	.long	3                       ## HeaderData Atom Count
	.short	1                       ## DW_ATOM_die_offset
	.short	6                       ## DW_FORM_data4
	.short	3                       ## DW_ATOM_die_tag
	.short	5                       ## DW_FORM_data2
	.short	4                       ## DW_ATOM_type_flags
	.short	11                      ## DW_FORM_data1
	.long	0                       ## Bucket 0
	.long	1                       ## Bucket 1
	.long	193495088               ## Hash in Bucket 0
	.long	-594775205              ## Hash in Bucket 1
.set Lset8, Ltypes1-Ltypes_begin        ## Offset in Bucket 0
	.long	Lset8
.set Lset9, Ltypes0-Ltypes_begin        ## Offset in Bucket 1
	.long	Lset9
Ltypes1:
	.long	97                      ## int
	.long	1                       ## Num DIEs
	.long	188
	.short	36
	.byte	0
	.long	0
Ltypes0:
	.long	117                     ## __ARRAY_SIZE_TYPE__
	.long	1                       ## Num DIEs
	.long	212
	.short	36
	.byte	0
	.long	0
	.section	__DWARF,__debug_gnu_pubn,regular,debug
.set Lset10, LpubNames_end0-LpubNames_begin0 ## Length of Public Names Info
	.long	Lset10
LpubNames_begin0:
	.short	2                       ## DWARF Version
.set Lset11, Lcu_begin0-Lsection_info   ## Offset of Compilation Unit Info
	.long	Lset11
	.long	220                     ## Compilation Unit Length
	.long	106                     ## DIE offset
	.byte	48                      ## Attributes: FUNCTION, EXTERNAL
	.asciz	"main"                  ## External Name
	.long	42                      ## DIE offset
	.byte	48                      ## Attributes: FUNCTION, EXTERNAL
	.asciz	"swap"                  ## External Name
	.long	0                       ## End Mark
LpubNames_end0:
	.section	__DWARF,__debug_gnu_pubt,regular,debug
.set Lset12, LpubTypes_end0-LpubTypes_begin0 ## Length of Public Types Info
	.long	Lset12
LpubTypes_begin0:
	.short	2                       ## DWARF Version
.set Lset13, Lcu_begin0-Lsection_info   ## Offset of Compilation Unit Info
	.long	Lset13
	.long	220                     ## Compilation Unit Length
	.long	188                     ## DIE offset
	.byte	144                     ## Attributes: TYPE, STATIC
	.asciz	"int"                   ## External Name
	.long	0                       ## End Mark
LpubTypes_end0:

.subsections_via_symbols
	.section	__DWARF,__debug_line,regular,debug
Lsection_line:
Lline_table_start0:
