cmake_minimum_required(VERSION 2.8.11)

project(FOO)

set(CMAKE_C_FLAGS "${CMAKE_C_FLAGS} --std=c89 -Wall -Wextra -Wshadow -Wpointer-arith -Wcast-qual -Wstrict-prototypes -Wmissing-prototypes -pedantic -pedantic-errors -Wunreachable-code -fno-builtin -Werror -g -nostdlib")

enable_language(ASM-ATT)
add_library(c STATIC x86_64/c.s)

add_library(foo STATIC foo.c)

add_executable(main main.c)
target_link_libraries(main foo c)
