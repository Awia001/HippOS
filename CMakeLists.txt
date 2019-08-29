cmake_minimum_required(VERSION 3.10.2)
set(CMAKE_TOOLCHAIN_FILE cmake/i686-elf-toolchain.cmake)

project(HippOS)

set(LINKER_SCRIPT "src/linker.ld")
set(CXX_FLAGS "-T ${LINKER_SCRIPT} -ffreestanding -fno-exceptions -fno-rtti -Wall -Wextra  -lgcc -nostdlib")
set(SOURCES src/kernel_main.c src/boot.s)

add_executable(os.bin ${SOURCES})
target_compile_options(os.bin PUBLIC ${FLAGS})
#gcc boot.asm kernel_main.c -T linker.ld  -ffreestanding -fno-exceptions -fno-rtti -Wall -Wextra -nostdlib -o os.bin -lgcc
