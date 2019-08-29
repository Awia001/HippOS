HippOS
======

A POSIX compliant (maybe someday) Microkernel OS made in C to satisfy my curiosity.
The CMakeLists.txt doesn't currently work

Build
=====
To build have a i686-elf-gcc toolchain setup (Instructions sold seperately) then run:

```sh
i686-elf-gcc kernel_main.c boot.s -T linker.ld -o os.bin -ffreestanding -O2 -nostdlib -lgcc
```

This will spit out an os.bin that will then need to be bundled into a bootloader, first run `boot.sh os.bin` to check that the correct multiboot header has been included, then make a tree thus:

```sh
isodir/
└ boot
    ├ grub
    │   └ grub.cfg
    └ os.bin
```
then run `grub-mkrescue -o os.iso isodir`, this will spit out an iso that can then be booted in quemu
