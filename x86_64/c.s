
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
  push $0 /* top frame segfaults */
  movq (%rbp), %rdi
  leaq 8(%rbp), %rsi
  call main

  /* panic code */
  movq $1, %rdi
  call exit

  .text
  .globl exit
  .type exit,@function
exit:
  movq $60, %rax
  syscall
  ret /* error */

  .text
  .globl write
  .type write,@function
write:
  movq $1, %rax
  syscall
  ret
