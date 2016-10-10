
  .text
  .globl _start
  .type _start,@function
_start:
  /*
  stack layout:
    argc
    rsp: arv...
    rsp+argc*8: null
    env...
    null
  */
  /* main(argc, argv) */
  movq %rsp, %rbp
  push $0
  movq (%rbp), %rdi
  leaq 8(%rbp), %rsi
  call main

  /* panic code */
  call exit

  .text
  .globl exit
  .type exit,@function
exit:
  push %rbp
  movq %rsp, %rbp

  movq $60, %rax
  syscall

  /* error: exit() returned */
  pop %rbp
  ret

  .text
  .globl write
  .type write,@function
write:
  push %rbp
  movq %rsp, %rbp

  movq $1, %rax
  syscall

  pop %rbp
  ret
