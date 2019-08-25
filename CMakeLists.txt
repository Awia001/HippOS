cmake_minimum_required(VERSION 2.8)
project(HippOS)

set(CMAKE_CXX_STANDARD 11)
set(CMAKE_CXX_COMPILER "i686-elf-gcc")
set(TARGET "x86_64-pc-none-elf")
set(LINKER_SCRIPT "src/linker.ld")
set(CXX_FLAGS "-ffreestanding -fno-exceptions -fno-rtti -Wall -Wextra  -lgcc -nostdlib")
file(GLOB cpp_sources src/*.cpp)
file(GLOB asm_sources src/*.asm)

add_custom_target(os.bin ALL ${CMAKE_CXX_COMPILER} ${cpp_sources} ${asm_sources} "-T" ${LINKER_SCRIPT} ${CXX_FLAGS})
set_target_properties(os.bin PROPERTIES LINK_DEPENDS ${LINKER_SCRIPT})
#target_compile_options(os.bin ${FLAGS})
#clang boot.asm kernel_main.c -T linker.ld -target x86_64-pc-none-elf -ffreestanding -fno-exceptions -fno-rtti -Wall -Wextra  -lgcc -nostdlib -o os.bin
