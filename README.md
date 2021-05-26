# ppcskel

Skeleton code for mini-based homebrew

## Compiling

This code requires a powerpc-none-elf- cross compiler, devkitPro currently ships a powerpc-eabi- cross compiler which is not compatible with the project in it's current state.

Additionally, some versions of GCC/binutils have been found to have a bug related to linking, a integer overflow causes an ELF program header to read a MemSize of 0x80022ae0 (that's huge), causing mini to refuse to load it.

I have tested this code with GCC 4.8.5 and binutils 2.24

The makefile looks in the env variable DEVKITAMATEUR for the cross compiler, since most people do not have a decade old GCC cross compiler for a target no one uses, instructions for getting one set up is available in the 'compiler' folder.

## Credits

Thanks to MethodOrMadness and company for testing and help finding a USB Gecko.

Without the USB Gecko's debug output from mini, it would have taken much longer to find the bugged ELF Program Header.
